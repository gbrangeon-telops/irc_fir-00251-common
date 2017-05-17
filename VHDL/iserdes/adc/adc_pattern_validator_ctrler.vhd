------------------------------------------------------------------
--!   @file : adc_pattern_validator_ctrler
--!   @brief
--!   @details
--!
--!   $Rev$
--!   $Author$
--!   $Date$
--!   $Id$
--!   $URL$
------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity adc_pattern_validator_ctrler is
   
   generic(
      G_SWAP_REF_PATTERN     : std_logic := '0';
      G_CHECK_NUM_PER_CYCLE  : natural range 0 to 127 := 20 --
      );
   
   port(
      ARESET           : in std_logic;
      CLK              : in std_logic;
      
      START            : out std_logic;
      DONE             : in std_logic_vector(3 downto 0);
      SUCCESS          : in std_logic_vector(3 downto 0);
      
      FDB_EN           : in std_logic;    
      FDB_RDY          : out std_logic;
      FDB_SUCCESS      : out std_logic;
      
      TEST_PATTERN     : in std_logic_vector(13 downto 0);
      REF_ADC_DATA     : out std_logic_vector(13 downto 0)
      
      );
end adc_pattern_validator_ctrler;



architecture rtl of adc_pattern_validator_ctrler is
   
   
   component sync_reset is
      port(
         CLK    : in std_logic;
         ARESET : in std_logic;
         SRESET : out std_logic
         );
   end component; 
   
   component clk_divider_pulse is
      generic(
         FACTOR : integer);
      port(
         CLOCK     : in  std_logic;
         RESET     : in  std_logic;
         PULSE     : out std_logic);
   end component;
   
   constant C_ALL_ONES            : std_logic_vector(DONE'LENGTH-1 downto 0) := (others => '1');
   constant C_ALL_ZEROS           : std_logic_vector(DONE'LENGTH-1 downto 0) := (others => '0');
   constant C_UPPER_BOUND_OFFSET  : natural := TEST_PATTERN'LENGTH-1;
   
   type ctrler_fsm_type is (idle, wait_stab_st, launch_sub_modules_st, wait_feedback_st, send_result_st, pause_st);   
   type comparator_fsm_type is (idle, start_st, wait_done_st, check_result_st, check_end_st, pause_st);
   type pattern_fsm_type is (idle, swap_pattern_st, enable_comparator_st, wait_comparator_st, check_end_st, inc_swap_cnt_st);
   type swap_pattern_type is array (0 to C_UPPER_BOUND_OFFSET) of std_logic_vector(TEST_PATTERN'LENGTH-1 downto 0);
   
   signal ctrler_fsm          : ctrler_fsm_type;
   signal comparator_fsm      : comparator_fsm_type;
   signal pattern_fsm         : pattern_fsm_type;
   signal sreset              : std_logic;
   signal fdb_success_i       : std_logic;
   signal fdb_rdy_i           : std_logic;
   signal done_latch          : std_logic_vector(DONE'LENGTH-1 downto 0);
   signal success_latch       : std_logic_vector(SUCCESS'LENGTH-1 downto 0);
   signal output_fsm_en       : std_logic;
   signal output_done         : std_logic;
   signal start_i             : std_logic;
   signal sub_module_en       : std_logic;
   signal sub_module_done     : std_logic;
   signal comparator_success  : std_logic := '0';
   signal pattern_en          : std_logic := '0';
   signal pattern_done        : std_logic := '0';
   signal test_pattern_i      : std_logic_vector(2*TEST_PATTERN'LENGTH-1 downto 0);
   signal comparator_en       : std_logic := '0';
   signal swap_cnt            : natural range 0 to C_UPPER_BOUND_OFFSET + 1;
   signal ref_adc_data_i      : std_logic_vector(TEST_PATTERN'LENGTH-1 downto 0);
   signal comparator_done     : std_logic := '0';
   signal cycle_count         : natural range 0 to G_CHECK_NUM_PER_CYCLE + 1;
   signal timer_reset         : std_logic;
   signal pause_end           : std_logic;
   signal pause_cnt           : unsigned(4 downto 0) := (others => '0');
   signal swap_pattern        : swap_pattern_type;
   
   
begin
   
   START <=  start_i;
   FDB_SUCCESS <= fdb_success_i;
   FDB_RDY  <= fdb_rdy_i;
   REF_ADC_DATA <= ref_adc_data_i;
   
   -------------------------------------------------- 
   -- synchro reset 
   --------------------------------------------------   
   U1A: sync_reset
   port map(
      ARESET => ARESET,
      CLK    => CLK,
      SRESET => sreset
      );
   
   -------------------------------------------------- 
   -- clk_divider_pulse 
   --------------------------------------------------   
   U1B: clk_divider_pulse
   generic map (FACTOR => 32)
   port map(
      RESET => timer_reset,
      CLOCK => CLK,
      PULSE => pause_end
      );
   
   -------------------------------------------------- 
   -- fsm de contrôle
   -------------------------------------------------- 
   U2: process(CLK)
   begin
      if rising_edge(CLK) then 
         if sreset = '1' then 
            ctrler_fsm <= idle;
            fdb_rdy_i <= '0';           
            
         else
            
            --    
            case  ctrler_fsm is
               
               when idle =>              
                  fdb_rdy_i <= '0';    -- fait expres
                  sub_module_en <= '0';
                  pause_cnt <= (others => '0');
                  if FDB_EN = '1' then 
                     ctrler_fsm <= wait_stab_st; 
                  end if;
               
               when wait_stab_st =>  --pause pour attendre que le delai ou le bitslip soit stable                    
                  pause_cnt <= pause_cnt + 1;
                  if pause_cnt = 31 then
                     ctrler_fsm <= launch_sub_modules_st; 
                  end if;                  
               
               when launch_sub_modules_st =>                                          
                  sub_module_en <= '1';                  
                  if sub_module_done = '0' then 
                     ctrler_fsm <= wait_feedback_st;  
                  end if;
               
               when wait_feedback_st =>
                  sub_module_en <= '0';
                  if sub_module_done = '1' then
                     ctrler_fsm <= send_result_st; 
                  end if;
               
               when send_result_st =>
                  fdb_rdy_i <= '1';
                  fdb_success_i <= comparator_success; 
                  ctrler_fsm <= pause_st;
               
               when pause_st =>
                  if FDB_EN = '0' then          -- ainsi on est certain qu'on aura un seul FDB_EN pour un FDB_RDY
                     ctrler_fsm <= idle; 
                  end if;
               
               when others => 
               
            end case;
            
         end if;    
      end if;
   end process;
   
   -------------------------------------------------- 
   -- fsm de contrôle du ref_adc_pattern
   --------------------------------------------------
   -- cette fsm manipule le patron de reference qu'utiliseront les comparateurs.
   -- Elle prend le patron de tests tel qu'il le reçoit et en fait des permutations 
   -- circulaires (donc bitslip) qui sont envoyées tour à tour aux comparateurs.
   -- on s'affranchit ainsi de tout bitslip provenant des iserdes.
   pattern_en <= sub_module_en;
   sub_module_done <= pattern_done;
   
   U3: process(CLK)
   begin
      if rising_edge(CLK) then 
         if sreset = '1' then 
            pattern_fsm <= idle;
            
         else
            
            test_pattern_i <= TEST_PATTERN & TEST_PATTERN; 
            
            for ii in 0 to C_UPPER_BOUND_OFFSET loop
               swap_pattern(ii) <= test_pattern_i(ii + C_UPPER_BOUND_OFFSET downto ii);
            end loop;
            
            --    
            case  pattern_fsm is
               
               when idle =>              
                  pattern_done <= '1';
                  comparator_en <= '0';
                  swap_cnt <= 0;
                  if pattern_en = '1' then 
                     pattern_fsm <= swap_pattern_st; 
                  end if;
               
               when swap_pattern_st =>
                  pattern_done <= '0';
                  ref_adc_data_i <= swap_pattern(swap_cnt);                
                  pattern_fsm <= enable_comparator_st;
               
               when enable_comparator_st =>
                  comparator_en <= '1';
                  if comparator_done = '0' then
                     pattern_fsm <= wait_comparator_st;
                  end if;      
               
               when wait_comparator_st =>
                  comparator_en <= '0';
                  if comparator_done = '1' then
                     if G_SWAP_REF_PATTERN = '0' then  -- dans ce cas, le module ne doit pas faire de permutation interne. La permutation est faite ailleurs
                        pattern_fsm <= idle;
                     else
                        pattern_fsm <= check_end_st;
                     end if;
                  end if;
               
               when check_end_st=>
                  if swap_cnt = C_UPPER_BOUND_OFFSET then
                     pattern_fsm <= idle;
                  else
                     pattern_fsm <= inc_swap_cnt_st;
                  end if;
                  if comparator_success = '1' then -- si on a du succès pour un shift donné, alors on garde le même swap_cnt jusqu'à la fin
                     pattern_fsm <= idle;
                  end if;
               
               when inc_swap_cnt_st =>
                  swap_cnt <= swap_cnt + 1;
                  pattern_fsm <= swap_pattern_st;
               
               when others => 
               
            end case;
            
         end if;    
      end if;
   end process; 
   
   
   -------------------------------------------------- 
   -- fsm de contrôle des comparateurs
   --------------------------------------------------
   -- cette fsm lance la comparaison entre les données reçus des serdes et le patron de reference
   
   U4: process(CLK)
   begin
      if rising_edge(CLK) then 
         if sreset = '1' then 
            comparator_fsm <= idle;
            comparator_done <= '0';
            start_i <= '0';
            timer_reset <= '1';
            
         else
            
            timer_reset <= '1';
            --    
            case  comparator_fsm is
               
               when idle =>              
                  comparator_done <= '1';
                  cycle_count <= 0;
                  if comparator_en = '1' then 
                     comparator_fsm <= start_st; 
                  end if;                  
               
               when start_st =>
                  start_i <= '1';
                  comparator_done <= '0';
                  if DONE = C_ALL_ZEROS then
                     comparator_fsm <= wait_done_st;
                  end if;
               
               when wait_done_st => 
                  start_i <= '0';
                  if DONE = C_ALL_ONES then
                     comparator_fsm <= check_result_st;
                  end if;
               
               when check_result_st =>
                  if SUCCESS = C_ALL_ONES then
                     comparator_fsm <= check_end_st;
                     comparator_success <= '1';
                  else
                     comparator_fsm <= idle;
                     comparator_success <= '0';
                  end if;      
               
               when check_end_st =>
                  cycle_count <= cycle_count + 1;
                  if cycle_count = G_CHECK_NUM_PER_CYCLE then
                     comparator_fsm <= idle;
                  else
                     comparator_fsm <= pause_st;
                  end if;
               
               when pause_st => 
                  timer_reset <= '0';
                  if pause_end = '1' then 
                     comparator_fsm <= start_st;
                  end if;
               
               when others => 
               
            end case;
            
         end if;    
      end if;
   end process;
   
end rtl;