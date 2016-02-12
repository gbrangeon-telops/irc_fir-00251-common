-------------------------------------------------------------------------------
--
-- Title       : fan_tb
-- Design      : fan_tb
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : D:\Telops\FIR-00251-Common\VHDL\FAN_CTRL\simulations\compile\fan_tb.vhd
-- Generated   : Wed Feb 12 10:13:20 2014
-- From        : D:\Telops\FIR-00251-Common\VHDL\FAN_CTRL\simulations\src\fan_tb.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;
use work.tel2000.all;

entity fan_tb is 
end fan_tb;

architecture fan_tb of fan_tb is

---- Component declarations -----

component fan_stim
  generic(
       SIZE : INTEGER := 12
  );
  port (
       AXIL_MISO : in T_AXI4_LITE_MISO;
       ARESET : out STD_LOGIC;
       AXIL_MOSI : out T_AXI4_LITE_MOSI;
       CLK100 : out STD_LOGIC;
       CLK20 : out STD_LOGIC
  );
end component;
component PWM_GEN_3
  generic(
       PWM_SIZE : INTEGER := 12
  );
  port (
       ARESET : in STD_LOGIC;
       AXIL_MOSI : in T_AXI4_LITE_MOSI;
       AXI_CLK : in STD_LOGIC;
       PWM_CLK : in STD_LOGIC;
       AXIL_MISO : out T_AXI4_LITE_MISO;
       PWM : out STD_LOGIC_VECTOR(2 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal NET19 : T_AXI4_LITE_MOSI;
signal NET23 : T_AXI4_LITE_MISO;
signal NET27 : STD_LOGIC;
signal NET31 : STD_LOGIC;
signal NET35 : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : fan_stim
  generic map (
       SIZE => 12
  )
  port map(
       ARESET => NET27,
       AXIL_MISO => NET23,
       AXIL_MOSI => NET19,
       CLK100 => NET31,
       CLK20 => NET35
  );

U2 : PWM_GEN_3
  generic map (
       PWM_SIZE => 12
  )
  port map(
       ARESET => NET27,
       AXIL_MISO => NET23,
       AXIL_MOSI => NET19,
       AXI_CLK => NET31,
       PWM_CLK => NET35
  );


end fan_tb;
