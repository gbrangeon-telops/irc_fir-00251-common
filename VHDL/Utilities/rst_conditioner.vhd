---------------------------------------------------------------------------------------------------
--
-- Title       : rst_conditioner
-- Author      : Eric Larouche
-- Company     : Telops Inc.
--
--------------------------------------------------------------------------------------------
--
-- Description : Module de conditionnement du reset
--
--------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity rst_conditioner is
   Generic (RESET_PULSE_DELAY : natural := 80; 
      RESET_PULSE_LEN : natural := 9);
   Port ( 
      ARESET : in std_logic;
      SLOWEST_CLK : in std_logic;
      ORST : out std_logic   
      );
end rst_conditioner;

architecture rtl of rst_conditioner is
   
   component sync_reset is
      port(
         ARESET : in STD_LOGIC;
         SRESET : out STD_LOGIC := '1';
         CLK    : in STD_LOGIC
         );
   end component sync_reset;
   
   constant DELAY_CNT_MAX : natural := RESET_PULSE_DELAY-3;
   constant PULSE_CNT_MAX : natural := RESET_PULSE_LEN;
   
   type rst_fsm_type is (idle, delay_st, pulse_rst_st);
   
   signal rst_i : std_logic := '1';
   signal rst_fsm : rst_fsm_type := idle;
   signal sreset : std_logic;
   signal last_sreset : std_logic := '1';
   signal sreset_fe : std_logic := '0';
   signal delay_cnt : integer range 0 to RESET_PULSE_DELAY := 0;
   signal pulse_cnt : integer range 0 to PULSE_CNT_MAX := 0;
   
begin
   
   ---------------
   -- Port mapping
   ---------------
   ORST <= rst_i;
   
   ------------------
   -- local synchronous reset
   ------------------
   U1 : sync_reset 
   port map ( ARESET => ARESET, SRESET => sreset, CLK => SLOWEST_CLK);
   
   ---------------------------
   -- Reset falling edge detection
   ---------------------------
   U2 : process(SLOWEST_CLK)
   begin
      if rising_edge(SLOWEST_CLK) then
         last_sreset <= sreset;
         sreset_fe <= last_sreset and not sreset;                
      end if;
   end process;
   
   
   --------------
   -- Reset FSM
   --------------
   U3: process(SLOWEST_CLK)   
   begin
      if rising_edge(SLOWEST_CLK) then 
         --fsm de contrôle            
         case rst_fsm is
            -- idle
            when idle =>
               rst_i <= '0';
               delay_cnt <= 0;
               pulse_cnt <= 0;
               rst_i <= sreset;              -- reset transparent normalement
               
               if sreset_fe = '1'  then      -- au falling edge, on déclenche la mécanique du pulse
                  rst_fsm <= delay_st;
               end if;
               
            -- délai avant application du pulse de reset
            when delay_st =>
               if delay_cnt < DELAY_CNT_MAX then
                  delay_cnt <= delay_cnt + 1;
               else
                  delay_cnt <= 0;
                  rst_fsm <= pulse_rst_st;
               end if;
               
            -- pulse du reset
            when pulse_rst_st =>
               rst_i <= '1';
               if pulse_cnt < PULSE_CNT_MAX then
                  pulse_cnt <= pulse_cnt + 1;
               else
                  pulse_cnt <= 0;
                  rst_i <= '0';
                  rst_fsm <= idle;
               end if;
            
            when others =>
         end case;
      end if;   
   end process;
   
end rtl;
