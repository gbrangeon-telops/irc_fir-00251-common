-------------------------------------------------------------------------------
--
-- Title       : delay_conditionner
-- Design      : TB_TrigInDelayMeasurement
-- Author      : Philippe Couture
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- File        : D:\Telops\TB_TrigInDelayMeasurement\src\delay_conditionner.vhd
-- Generated   : Wed Jan 16 12:16:30 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use work.trig_define.all;

entity delay_measurement is
      generic(       
         CNT_START_VAL : positive := 1  -- at least 1 for gh_edge_det
      );
      port(
         CLK : in STD_LOGIC; 
         ACQ_INT : in STD_LOGIC; 
         EXT_TRIG : in STD_LOGIC; 
         TRIG_CFG : in trig_cfg_type;
         PERIOD_LENGTH : out STD_LOGIC_VECTOR(31 downto 0); 
         DONE : out STD_LOGIC;
         ARESET : in STD_LOGIC; 
         ENABLE : in STD_LOGIC
      );
end delay_measurement;


architecture rtl of delay_measurement is  

   component gh_edge_det
      port(
         clk   : in STD_LOGIC;
         rst   : in STD_LOGIC;
         D     : in STD_LOGIC;
         re    : out STD_LOGIC;
         fe    : out STD_LOGIC;
         sre   : out STD_LOGIC;
         sfe   : out STD_LOGIC);
   end component;
  
   component sync_reset
      port (
         ARESET : in std_logic;
         CLK    : in std_logic;
         SRESET : out std_logic := '1'
         );
   end component; 
   
   component double_sync
      generic(
         INIT_VALUE : BIT := '0');
      port(
         D     : in std_logic;
         Q     : out std_logic;
         RESET : in std_logic;
         CLK   : in std_logic);
   end component;  
  signal sreset                  : std_logic;
  signal ext_trig_re : std_logic := '0'; 
  signal ext_trig_fe : std_logic := '0';
  signal acq_int_re : std_logic := '0';
  signal acq_int_fe : std_logic := '0';    
  signal rst_delay_last    : std_logic := '0';  
  signal rst_delay    : std_logic := '0'; 
  signal delay_re    : std_logic := '0';
  signal delay_fe    : std_logic := '0';
  signal done_i    : std_logic := '0';
  signal meas_count : unsigned(PERIOD_LENGTH'range);
  type meas_fsm_type is (idle, meas_high_st);   
  signal global_reset            : std_logic; 
  
begin 
   
   DONE <= done_i;
   U1 : sync_reset
   port map(
      ARESET => ARESET,
      CLK    => CLK,
      SRESET => sreset
      ); 
      
      
   U2 : gh_edge_det port map(clk => CLK, rst => sreset, D => EXT_TRIG, sre => open, re => ext_trig_re, fe => ext_trig_fe, sfe => open);      
   U3 : gh_edge_det port map(clk => CLK, rst => sreset, D => ACQ_INT, sre => open, re => acq_int_re, fe => acq_int_fe, sfe => open);   
   
   
   U4: process(CLK)
   begin		
      
      if rising_edge(CLK) then
         
         if sreset = '1' then  
            
           rst_delay <= '0'; 
           rst_delay_last <= '0';
           done_i <= '0';  
           PERIOD_LENGTH <= (others => '0');
         else

            if ENABLE = '1' then 
               
               done_i <= '0'; 
               rst_delay <= '0'; 
               

                case TRIG_CFG.trig_activ is
                     
                     when RisingEdge =>    
                   
                        if ext_trig_re = '1' then 
                            rst_delay <= '1';
                        elsif acq_int_re = '1' then
                            done_i <= '1'; 
                            PERIOD_LENGTH <= std_logic_vector(meas_count);
                        end if;  
                         
                     when FallingEdge =>  
                        if ext_trig_fe = '1' then  
                            rst_delay <= '1';
                        elsif acq_int_re = '1' then
                            done_i <= '1'; 
                            PERIOD_LENGTH <= std_logic_vector(meas_count);
                         end if;   
                         
                     when AnyEdge =>  
                        if (ext_trig_re or ext_trig_fe) = '1' then
                            rst_delay <= '1';
                        elsif acq_int_re = '1'  then
                            done_i <= '1';
                            PERIOD_LENGTH <= std_logic_vector(meas_count);
                        end if;
                        
                     when others =>
   
                end case; 
                
                rst_delay_last <= rst_delay;

            else
               PERIOD_LENGTH <= (others => '0');
               done_i <= '0';
            end if;  
         end if;       
      end if;
   end process; 
    
   U5: process(CLK)
   begin		
      
      if rising_edge(CLK) then
         
         if sreset = '1' then  
            meas_count <= (others => '0');
         else   

            if rst_delay = '1' and rst_delay_last = '0' then
               meas_count <= to_unsigned(CNT_START_VAL, meas_count'length);   -- +2 for the double sync on EXT_TRIG, +1 for gh_edge_det  
            else     
               meas_count <= meas_count + 1;       
            end if;
            
         end if;      
      end if;
   end process;   
end rtl;
