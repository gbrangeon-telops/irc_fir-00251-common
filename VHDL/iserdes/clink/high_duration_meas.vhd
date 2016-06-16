-------------------------------------------------------------------------------
--
-- Title       : high_duration_meas
-- Design      : FIR_00180_Sofradir
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : d:\Telops\FIR-00180\FIR_00180_Sofradir\src\high_duration_meas.vhd
-- Generated   : Tue Nov 22 11:24:34 2011
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity high_duration_meas is
   port(
      ARESET      : in std_logic;
      CLK         : in std_logic;
      RUN         : in std_logic;
      SIGNAL_IN   : in std_logic;
      HIGH_LENGTH : out std_logic_vector(31 downto 0);
      DVAL        : out std_logic
      );
end high_duration_meas;


architecture RTL of high_duration_meas is 
   
   component sync_reset
      port (
         ARESET : in std_logic;
         CLK    : in std_logic;
         SRESET : out std_logic := '1'
         );
   end component;   
   
   signal length_cnt_i : unsigned(31 downto 0);
   type meas_fsm_type is (idle, meas_high_st); 
   
   signal meas_fsm                : meas_fsm_type; 
   signal sreset                  : std_logic;
   signal signal_last             : std_logic;
   signal signal_i                : std_logic;
   signal dval_i                  : std_logic;
   signal fsm_reset               : std_logic := '1';
   
begin
   
   HIGH_LENGTH <= std_logic_vector(length_cnt_i);
   DVAL <= dval_i;
   
   --------------------------------------------------
   -- synchro reset 
   --------------------------------------------------   
   U1 : sync_reset
   port map(
      ARESET => ARESET,
      CLK    => CLK,
      SRESET => sreset
      );  
   
   
   --------------------------------------------------
   -- detection de l'horloge par mesure de sa periode
   --------------------------------------------------  
   U2 : process(CLK)
   begin          
      if rising_edge(CLK) then 
         
         fsm_reset <= sreset or not RUN;
         
         if fsm_reset = '1' then 
            meas_fsm <= idle; 
            signal_last <= '1';
            signal_i <= '0';
            dval_i <= '0';
         else 
            
            signal_i <= SIGNAL_IN;
            signal_last <= signal_i;            
            
            case meas_fsm is 
               
               when idle => 
                  dval_i <= '0';
                  length_cnt_i <= (others => '0');
                  if signal_i = '1' and signal_last = '0'  then
                     meas_fsm <= meas_high_st;                     
                  end if;
               
               when meas_high_st => 
                  length_cnt_i <= length_cnt_i + 1;                   
                  if signal_i = '0' and signal_last = '1' then
                     meas_fsm <= idle; 
                     dval_i <= '1';
                  end if;
               
               when others =>
               
            end case;
            
         end if;
      end if;
   end process;
   
   
end RTL;
