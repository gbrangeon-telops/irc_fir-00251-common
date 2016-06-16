------------------------------------------------------------------
--!   @file : clink_delay_ctrl
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

entity clink_delay_ctrl is
   
   generic (
      STABILITY_WIDTH_MIN : natural range 4 to 31 := 10;       -- largeur minimale en dly_tap de la zone stabilité souhaitée  (du début à la fin de la zone). En deça de cette valeur, on declare que la calibration a echoué.
      CLK_PERIOD_NS : real := 10.0;
      DATA_WIDTH : integer range 1 to 16 := 7
      );
   
   port(
      CLK           : in std_logic;
      ARESET        : in std_logic;
      
      -- lancement du module
      EN            : in std_logic;
      
      -- feedback pour savoir si le delay envoyé est un succès ou pas
      FDB_EN        : out std_logic;
      FDB_RDY       : in std_logic;
      FDB_SUCCESS   : in std_logic;
      
      -- données envoyées vers les idelay
      DLY_DATA      : out std_logic_vector(4 downto 0);
      DLY_DVAL      : out std_logic;
      
      -- statut de fin de parcours
      DONE          : out std_logic;
      SUCCESS       : out std_logic;
      EDGES         : out std_logic_vector(31 downto 0)
      );
end clink_delay_ctrl;


architecture rtl of clink_delay_ctrl is
   
   constant C_DELAY_RESOLUTION_NS : real := 0.078; -- 78ps when IDELAYCTRL REF_CLK is 200MHz
   constant C_BIT_TIME_NS         : real := CLK_PERIOD_NS / real(DATA_WIDTH);   
   constant C_BIT_PERIOD_FACTOR   : integer := integer(C_BIT_TIME_NS / C_DELAY_RESOLUTION_NS); -- 22
   constant C_ALL_ONES            : unsigned(DLY_DATA'LENGTH-1 downto 0) := (others => '1');
   
   component sync_reset is
      port(
         CLK    : in std_logic;
         ARESET : in std_logic;
         SRESET : out std_logic
         );
   end component;
   
   type delay_fsm_type is (idle, load_dly_st, wait_feedback_st, wait_analyzer_st, check_dly_end_st, incr_dly_st, output_st, done_st1, done_st2);
   type analyze_fsm_type is (idle, find_previous_pos_st, check_pos_st, check_delay_scan_end_st, check_particular_case_st1, check_particular_case_st2, check_particular_case_st3, fetch_result_st);
   type result_fsm_type is (idle, find_delta_pos_st, compare_delta_pos_st, wait_solution_st, check_solution_st, update_data_st, done_st);
   
   signal delay_fsm                          : delay_fsm_type;
   signal analyze_fsm                        : analyze_fsm_type;
   signal result_fsm                         : result_fsm_type;
   signal dly_data_i                         : unsigned(DLY_DATA'LENGTH -1  downto 0);
   signal sreset                             : std_logic;
   signal done_i                             : std_logic;
   signal success_i                          : std_logic;
   signal dly_dval_i                         : std_logic;
   signal fdb_rdy_i                          : std_logic;
   signal fdb_success_i                      : std_logic;
   signal analyze_done_last                  : std_logic;
   signal analyze_done_i                     : std_logic;
   signal at_least_one_zone_found            : std_logic;
   signal edge_vector_i                      : std_logic_vector(EDGES'LENGTH-1 downto 0);
   signal begin_pos                          : unsigned(9 downto 0);
   signal end_pos                            : unsigned(9 downto 0);
   signal previous_delta_pos                 : signed(10 downto 0);
   signal result_delay_pos                   : unsigned(DLY_DATA'LENGTH -1  downto 0);
   signal delta_pos                          : signed(10 downto 0);
   signal result_success                     : std_logic;
   signal previous_pos_i                     : unsigned(9 downto 0);
   signal fdb_en_i                           : std_logic;
   signal fetch_result                       : std_logic;
   signal all_delays_pos_visited             : std_logic;
   signal begin_pos_valid                    : std_logic;
   signal end_pos_valid                      : std_logic;
   signal edge_vector_null                   : std_logic;
   signal result_done_last                   : std_logic;
   signal result_done                        : std_logic;
   signal wait_cnt                           : unsigned(1 downto 0);
   signal ideal_solution_possible            : std_logic;
   signal optimal_solution_possible          : std_logic;
   
   signal success_area_ideal_middle_pos      : unsigned(DLY_DATA'LENGTH -1  downto 0);
   signal success_area_optimal_middle_pos    : unsigned(DLY_DATA'LENGTH -1  downto 0); 
   
   signal success_area_begin_pos             : signed(begin_pos'length  downto 0);
   signal success_area_end_pos               : signed(end_pos'length  downto 0);
   signal success_area_middle_pos1           : signed(end_pos'length  downto 0);
   signal success_area_middle_pos2           : signed(end_pos'length  downto 0);
   
   signal failure_area_begin_pos             : signed(begin_pos'length  downto 0);
   signal failure_area_end_pos               : signed(end_pos'length  downto 0);
   signal failure_area_middle_pos1           : signed(end_pos'length  downto 0);
   signal failure_area_middle_pos2           : signed(end_pos'length  downto 0);
   signal failure_area_middle_pos            : unsigned(DLY_DATA'LENGTH -1  downto 0);
   
   attribute dont_touch : string;
   attribute dont_touch of edge_vector_i : signal is "true";
   attribute dont_touch of dly_data_i    : signal is "true";
   attribute dont_touch of begin_pos     : signal is "true";
   attribute dont_touch of end_pos       : signal is "true";
   
begin
   
   DONE <= done_i;
   SUCCESS <= success_i;
   DLY_DATA <= std_logic_vector(dly_data_i);
   DLY_DVAL <= dly_dval_i;
   EDGES <= edge_vector_i;
   FDB_EN <= fdb_en_i;
   
   
   -------------------------------------------------- 
   -- synchro reset 
   --------------------------------------------------   
   U1: sync_reset
   port map(
      ARESET => ARESET,
      CLK    => CLK,
      SRESET => sreset
      );
   
   
   -------------------------------------------------- 
   -- fsm de contrôle
   -------------------------------------------------- 
   U2: process(CLK)
   begin
      if rising_edge(CLK) then 
         if sreset = '1' then 
            delay_fsm <= idle;
            done_i <= '0';
            dly_dval_i <= '0';
            success_i <= '0';
            
         else
            
            fdb_rdy_i <= FDB_RDY;
            fdb_success_i <= FDB_SUCCESS;
            analyze_done_last <= analyze_done_i;            
            
            case  delay_fsm is
               
               when idle =>
                  done_i <= '0';
                  dly_dval_i <= '0';
                  dly_data_i <= (others => '0');
                  if EN = '1' then 
                     delay_fsm <= load_dly_st;
                  end if;
               
               when load_dly_st =>                        
                  dly_dval_i <= '1';
                  delay_fsm <= wait_feedback_st;
               
               when wait_feedback_st =>
                  dly_dval_i <= '0';
                  fdb_en_i <= '1';
                  if fdb_rdy_i = '1' then
                     fdb_en_i <= '0';
                     delay_fsm <= wait_analyzer_st;
                  end if; 
               
               when wait_analyzer_st =>
                  if analyze_done_last = '0' and analyze_done_i = '1' then 
                     delay_fsm <= check_dly_end_st;
                  end if;                  
               
               when check_dly_end_st => 
                  if dly_data_i = C_ALL_ONES then 
                     delay_fsm <= output_st;
                  else
                     delay_fsm <= incr_dly_st;
                  end if;
               
               when incr_dly_st =>
                  dly_data_i <= dly_data_i + 1;                   
                  delay_fsm <= load_dly_st;                  
               
               when output_st =>
                  success_i <= at_least_one_zone_found;
                  dly_data_i <= result_delay_pos(dly_data_i'length-1 downto 0);   -- operation de modulo 32                  
                  delay_fsm <= done_st1;
               
               when done_st1 => 
                  dly_dval_i <= at_least_one_zone_found; 
                  delay_fsm <= done_st2;
               
               when done_st2 =>   
                  dly_dval_i <= '0';
                  done_i <= '1';
               
               when others => 
               
            end case;
            
         end if;    
      end if;
   end process;
   
   
   -------------------------------------------------- 
   -- fsm de capture des feedback et d'analyse
   -------------------------------------------------- 
   U3: process(CLK)
      variable pos_i: unsigned(begin_pos'length-1 downto 0);
      
   begin
      if rising_edge(CLK) then 
         if sreset = '1' then 
            analyze_fsm <= idle;
            analyze_done_i <= '0';
            edge_vector_i <= (others => '1');
            begin_pos <= (others => '1');
            end_pos <= (others => '1');
            fetch_result <= '0';
            edge_vector_null <= '0';
            begin_pos_valid <= '0';
            end_pos_valid <= '0';
            
         else         
            
            -- recherche de la fin du scan
            if pos_i = 31 then
               all_delays_pos_visited <= '1'; 
            else
               all_delays_pos_visited <= '0'; 
            end if;
            
            -- edge_vector identiquement nul
            if unsigned(edge_vector_i) = 0 then 
               edge_vector_null <= '1';
            end if;    
            
            result_done_last <= result_done; 
            
            -- fsm d'analyse
            case  analyze_fsm is
               
               when idle =>
                  analyze_done_i <= '1';                 
                  if fdb_rdy_i = '1' then                    
                     pos_i := resize(dly_data_i, pos_i'length);
                     edge_vector_i(to_integer(pos_i)) <=  not fdb_success_i;   -- edge(i) = '0' <=> zone stable                     
                     analyze_fsm <= find_previous_pos_st;                     
                  end if;
               
               when find_previous_pos_st =>
                  analyze_done_i <= '0';
                  if pos_i > 0 then       
                     previous_pos_i <= pos_i - 1;
                     analyze_fsm <= check_pos_st; 
                  else
                     analyze_fsm <= idle;  -- on vient de commencer et donc previous_pos n'existe pas. On circule 
                  end if;                  
               
               when check_pos_st =>   
                  if edge_vector_i(to_integer(previous_pos_i)) = '1' and edge_vector_i(to_integer(pos_i)) = '0' then 
                     begin_pos <= pos_i;
                     begin_pos_valid <= '1';                                      
                  end if; 
                  if edge_vector_i(to_integer(previous_pos_i)) = '0' and edge_vector_i(to_integer(pos_i)) = '1' then 
                     end_pos <= pos_i;
                     end_pos_valid <= '1';
                  end if;
                  analyze_fsm <= check_delay_scan_end_st;
               
               when check_delay_scan_end_st =>                  
                  if all_delays_pos_visited = '0' then 
                     analyze_fsm <= check_particular_case_st3;
                  else
                     analyze_fsm <= check_particular_case_st1;
                  end if;
               
               when check_particular_case_st1 =>
                  if begin_pos_valid = '0' then
                     begin_pos <= to_unsigned(0, end_pos'length);
                     begin_pos_valid <= end_pos_valid  or edge_vector_null;          -- equivalent à begin_pos_valid = '1' si un end_pos a été trouvé 
                  end if;
                  analyze_fsm <= check_particular_case_st2;
               
               when check_particular_case_st2 =>
                  if end_pos_valid = '0' then
                     end_pos <= to_unsigned(31, end_pos'length);
                     end_pos_valid <= begin_pos_valid or edge_vector_null;          -- equivalent à end_pos_valid = '1' si un begin_pos a été trouvé 
                  end if;
                  analyze_fsm <= check_particular_case_st3;
               
               when check_particular_case_st3 =>
                  if (end_pos < begin_pos) and begin_pos_valid = '1' and end_pos_valid = '1' then                                       -- si on vient ici, necessairement on est à la fin du scan et end_pos_valid et begin_pos_valid garderont leur valeur avant de venir ici. Si pas valid alors 
                     end_pos <= end_pos + C_BIT_PERIOD_FACTOR;
                  end if;
                  analyze_fsm <= fetch_result_st;
               
               when fetch_result_st =>                  
                  fetch_result <= '1';
                  if result_done_last = '0' and result_done = '1' then
                     analyze_fsm <= idle;
                     fetch_result <= '0';
                  end if;          
               
               when others =>
               
            end case;
            
         end if;
      end if;
   end process;
   
   
   -------------------------------------------------- 
   -- fsm de calcul
   -------------------------------------------------- 
   U4: process(CLK)
      variable pos_i: unsigned(7 downto 0);
      
   begin
      if rising_edge(CLK) then 
         if sreset = '1' then 
            result_fsm <= idle;
            previous_delta_pos <= to_signed(STABILITY_WIDTH_MIN, previous_delta_pos'length);  --initialisation à STABILITY_WIDTH_MIN, qui est > 2 => update ssi delta_pos > STABILITY_WIDTH_MIN, ce qui permet un calcul correct de actual_delay
            result_success <= '0';
            at_least_one_zone_found <= '0';
            
         else            
            
            case result_fsm is
               
               when idle =>
                  result_done <= '1';
                  wait_cnt <= (others => '0');
                  if fetch_result = '1' then
                     result_fsm <= find_delta_pos_st;                     
                  end if;
               
               when find_delta_pos_st =>
                  result_done <= '0'; 
                  result_success <= '0';
                  if begin_pos_valid = '1' and  end_pos_valid = '1' then   -- les deux données valide suppose que analyze_fsm s'Est arrangé pour que end_pos > begin_pos
                     delta_pos <= signed('0'& end_pos) - signed('0'& begin_pos);
                     result_fsm <= compare_delta_pos_st; 
                  else
                     result_fsm  <= done_st;      -- rien à voir, circulez
                  end if;                  
               
               when compare_delta_pos_st =>   
                  if delta_pos > previous_delta_pos then -- on a une plage plus grande que celle d'avant, c'est interessant, on met les données à jour
                     result_fsm <= wait_solution_st;
                  else
                     result_fsm   <= done_st;           -- rien d'intéressant, circulez
                  end if;
               
               when wait_solution_st =>                 -- on attend une solution 
                  wait_cnt <= wait_cnt + 1;
                  if wait_cnt = 3 then
                     result_fsm <= check_solution_st;
                  end if;                  
               
               when check_solution_st =>
                  if ideal_solution_possible = '1' then
                     result_delay_pos <= success_area_ideal_middle_pos;
                  else
                     result_delay_pos <= success_area_optimal_middle_pos;
                  end if;
                  result_fsm <= update_data_st;
               
               when update_data_st => 
                  previous_delta_pos <= delta_pos;           
                  result_success <= '1';
                  at_least_one_zone_found <= '1'; -- au moins une position stable est trouvée
                  result_fsm   <= done_st;
               
               when done_st =>
                  result_done <= '1';            -- permet à ce que fetch_result tombe à '0' quand on sera dans idle
                  result_fsm   <= idle;
               
               when others => 
               
            end case;
            
         end if;    
      end if;
   end process;
   
   -------------------------------------------------- 
   -- process de calcul
   -------------------------------------------------- 
   U5: process(CLK)
      
   begin
      if rising_edge(CLK) then 
         
         success_area_begin_pos <= signed('0'& begin_pos);
         success_area_end_pos <= signed('0'& end_pos);
         success_area_middle_pos1 <= (signed('0'& begin_pos) + signed('0'& end_pos))/2;
         success_area_middle_pos2 <= success_area_middle_pos1 - C_BIT_PERIOD_FACTOR;
         ideal_solution_possible <= '0'; 
         
         if (success_area_middle_pos1 >= 0) and (success_area_middle_pos1 < 32) then 
            success_area_ideal_middle_pos <= unsigned(success_area_middle_pos1(DLY_DATA'LENGTH -1  downto 0));
            ideal_solution_possible <= begin_pos_valid and end_pos_valid;
         end if;
         if (success_area_middle_pos2 >= 0) and (success_area_middle_pos2 < 32) then  
            success_area_ideal_middle_pos <= unsigned(success_area_middle_pos2(DLY_DATA'LENGTH -1  downto 0));
            ideal_solution_possible <= begin_pos_valid and end_pos_valid;
         end if;
         
         
         failure_area_begin_pos <= signed('0'& end_pos) - C_BIT_PERIOD_FACTOR;
         failure_area_end_pos <= signed('0'& begin_pos);
         failure_area_middle_pos1 <= (failure_area_begin_pos + failure_area_end_pos)/2;
         failure_area_middle_pos2 <= failure_area_middle_pos1 - C_BIT_PERIOD_FACTOR;
         optimal_solution_possible <= '0'; 
         
         if (failure_area_middle_pos1 >= 0) and (failure_area_middle_pos1 < 32) then 
            failure_area_middle_pos <= unsigned(failure_area_middle_pos1(DLY_DATA'LENGTH -1  downto 0));
            optimal_solution_possible <= begin_pos_valid and end_pos_valid;
         end if;
         if (failure_area_middle_pos2 >= 0) and (failure_area_middle_pos2 < 32) then  
            failure_area_middle_pos <= unsigned(failure_area_middle_pos2(DLY_DATA'LENGTH -1  downto 0));
            optimal_solution_possible <= begin_pos_valid and end_pos_valid;
         end if;
         
         if optimal_solution_possible = '1' then            
            if failure_area_middle_pos > 15 then
               success_area_optimal_middle_pos <= to_unsigned(0, DLY_DATA'LENGTH);
            else
               success_area_optimal_middle_pos <= to_unsigned(31, DLY_DATA'LENGTH);            
            end if;
         end if;
         
         
      end if;
   end process;
   
   
end rtl;
