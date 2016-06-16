------------------------------------------------------------------
--!   @file : clink_bitslip_ctrl
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

entity clink_bitslip_ctrl is
   
   generic(
      SERDES_DWIDTH : integer range 1 to 16 := 7  -- la largeur en bit de la sortie des serdes 
      );
   
   port(
      CLK           : in std_logic;
      ARESET        : in std_logic;
      
      -- lancement du module
      EN            : in std_logic;
      
      -- feedback pour savoir si le bitslip envoyé est un succès ou pas
      FDB_RDY       : in std_logic;
      FDB_SUCCESS   : in std_logic;
      
      -- pulse envoyés vers les iserdes
      BSLIP_PULSE   : out std_logic;
      
      -- lancement du module generant les feedbacks
      FDB_EN        : out std_logic;
      
      -- statut de fin de parcours
      DONE          : out std_logic;
      SUCCESS       : out std_logic;
      BSLIP_CNT     : out std_logic_vector(3 downto 0)
      );
end clink_bitslip_ctrl;



architecture rtl of clink_bitslip_ctrl is
   
   constant C_BSLIP_CNT_MAX : integer := SERDES_DWIDTH;
   
   component sync_reset is
      port(
         CLK    : in std_logic;
         ARESET : in std_logic;
         SRESET : out std_logic
         );
   end component;
   
   type bslip_fsm_type is (idle, do_bslip_st, wait_feedback_st, check_feedback_st, check_bslip_end_st, incr_bslip_cnt_st, output_st);
   
   signal bslip_fsm      : bslip_fsm_type;
   signal done_i         : std_logic;
   signal success_i      : std_logic;
   signal bslip_pulse_i  : std_logic;
   signal sreset         : std_logic;
   signal bslip_cnt_i    : integer range 0 to C_BSLIP_CNT_MAX;
   signal fdb_success_i  : std_logic;
   signal fdb_rdy_i      : std_logic;
   signal fdb_en_i       : std_logic;
   
   
begin
   
   DONE <= done_i;
   SUCCESS <= success_i;
   BSLIP_PULSE <= bslip_pulse_i; 
   FDB_EN <= fdb_en_i;
   BSLIP_CNT <=  std_logic_vector(to_unsigned(bslip_cnt_i, BSLIP_CNT'LENGTH));
   
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
            bslip_fsm <= idle;
            done_i <= '0';
            bslip_pulse_i <= '0';
            fdb_en_i <= '0';
            fdb_success_i <= '0';
            
         else
            
            fdb_rdy_i <= FDB_RDY;
            if FDB_RDY = '1' then
               fdb_success_i <= FDB_SUCCESS;
            end if;            
            
            case  bslip_fsm is
               
               when idle =>
                  done_i <= '0';
                  bslip_pulse_i <= '0';
                  bslip_cnt_i <= 0;
                  success_i <= '0';
                  if EN = '1' then 
                     bslip_fsm <= do_bslip_st;
                  end if;
               
               when do_bslip_st =>                        
                  bslip_pulse_i <= '1';
                  bslip_fsm <= wait_feedback_st;
               
               when wait_feedback_st =>
                  bslip_pulse_i <= '0';
                  fdb_en_i <= '1';
                  if fdb_rdy_i = '1' then 
                     bslip_fsm <= check_feedback_st;
                     fdb_en_i <= '0';
                  end if; 
               
               when check_feedback_st =>
                  if fdb_success_i = '1' then 
                     bslip_fsm <= output_st;
                     success_i <= '1';
                  else
                     bslip_fsm <= check_bslip_end_st;
                  end if;                  
               
               when check_bslip_end_st => 
                  if bslip_cnt_i = C_BSLIP_CNT_MAX then 
                     bslip_fsm <= output_st;
                  else
                     bslip_fsm <= incr_bslip_cnt_st;
                  end if;
               
               when incr_bslip_cnt_st =>
                  bslip_cnt_i <= bslip_cnt_i + 1;                   
                  bslip_fsm <= do_bslip_st;                  
               
               when output_st =>          -- on n'en sort plus
                  fdb_en_i <= '0';                                 
                  done_i <= '1';        
               
               when others => 
               
            end case;
            
         end if;    
      end if;
   end process;
   
end rtl;
