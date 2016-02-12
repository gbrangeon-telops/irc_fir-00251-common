-------------------------------------------------------------------------------
--
-- Title       : axis_lane_stim
-- Design      : clink_tb
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : D:\Telops\FIR-00251-Output\src\Clink\Simulations\clink_tb\src\axis_lane_stim.vhd
-- Generated   : Thu Jan 30 13:26:14 2014
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
use ieee.numeric_std.all;
use work.tel2000.all;


entity fan_stim is
   generic(
      SIZE : integer :=12
   );
   port(
      AXIL_MOSI : out t_axi4_lite_mosi;
      AXIL_MISO : in t_axi4_lite_miso;
      
      CLK100 : out STD_LOGIC;
      CLK20 : out STD_LOGIC;
      ARESET : out STD_LOGIC
      );
end fan_stim;



architecture fan_stim of fan_stim is

-- CLK and RESET
constant clk20_per : time := 50 ns;
constant clk100_per : time := 10 ns;

signal clk20_o : std_logic := '0';
signal clk100_o : std_logic := '0';

signal rst_i : std_logic := '0';

--PWM PARAM (0-size^2-1)
constant DATA0 : integer := 0;
constant DATA1 : integer := 2047;
constant DATA2 : integer := 4095;


--REGISTER MAP
-- Address of registers
constant ADDR_LSB  : integer := 2;
constant OPT_MEM_ADDR_BITS : integer := 4; -- Number of supplement bit
constant DATAOUT0_BASE_ADR : std_logic_vector(ADDR_LSB + OPT_MEM_ADDR_BITS downto 0) := std_logic_vector(to_unsigned(0,ADDR_LSB + OPT_MEM_ADDR_BITS + 1));
constant DATAOUT1_BASE_ADR : std_logic_vector(ADDR_LSB + OPT_MEM_ADDR_BITS downto 0) := std_logic_vector(to_unsigned(4,ADDR_LSB + OPT_MEM_ADDR_BITS + 1));
constant DATAOUT2_BASE_ADR : std_logic_vector(ADDR_LSB + OPT_MEM_ADDR_BITS downto 0) := std_logic_vector(to_unsigned(8,ADDR_LSB + OPT_MEM_ADDR_BITS + 1));
constant DATAOUT3_BASE_ADR : std_logic_vector(ADDR_LSB + OPT_MEM_ADDR_BITS downto 0) := std_logic_vector(to_unsigned(12,ADDR_LSB + OPT_MEM_ADDR_BITS + 1));


begin
-- Assign clock
   CLK100 <= clk100_o;
   CLK20 <= clk20_o;
   ARESET <= rst_i;

--PROCESS   

--! Clock 20MHz generation
CLK20_GEN: process(clk20_o)
   begin
   clk20_o <= not clk20_o after clk20_per/2;                          
   end process;

--! Clock 100MHz generation
CLK100_GEN: process(clk100_o)
   begin
   clk100_o <= not clk100_o after clk100_per/2;                          
   end process; 

--! Reset Generation
RST_GEN : process
   begin          
      rst_i <= '1';
   wait for 5 us;
      rst_i <= '0'; 
   wait;
   end process; 
   
fan_stim: process is

   begin

      wait until rst_i = '0';

      wait until rising_edge(clk100_o);
   
      --Write AXI config
      write_axi_lite(std_logic_vector(to_unsigned(0,32-DATAOUT0_BASE_ADR'length))     & DATAOUT0_BASE_ADR ,     std_logic_vector(to_unsigned(DATA0,32))     ,AXIL_MISO ,AXIL_MOSI);
      write_axi_lite(std_logic_vector(to_unsigned(0,32-DATAOUT1_BASE_ADR'length))     & DATAOUT1_BASE_ADR ,     std_logic_vector(to_unsigned(DATA1,32))     ,AXIL_MISO ,AXIL_MOSI);                              
      write_axi_lite(std_logic_vector(to_unsigned(0,32-DATAOUT2_BASE_ADR'length))     & DATAOUT2_BASE_ADR ,     std_logic_vector(to_unsigned(DATA2,32))     ,AXIL_MISO ,AXIL_MOSI);
      write_axi_lite(std_logic_vector(to_unsigned(0,32-DATAOUT3_BASE_ADR'length))     & DATAOUT3_BASE_ADR ,     std_logic_vector(to_unsigned(0,32))         ,AXIL_MISO ,AXIL_MOSI);


      wait for 5 ms;
      write_axi_lite(std_logic_vector(to_unsigned(0,32-DATAOUT0_BASE_ADR'length))     & DATAOUT0_BASE_ADR ,     std_logic_vector(to_unsigned(1800,32))     ,AXIL_MISO ,AXIL_MOSI);
      write_axi_lite(std_logic_vector(to_unsigned(0,32-DATAOUT1_BASE_ADR'length))     & DATAOUT1_BASE_ADR ,     std_logic_vector(to_unsigned(2047,32))     ,AXIL_MISO ,AXIL_MOSI);                              
      write_axi_lite(std_logic_vector(to_unsigned(0,32-DATAOUT2_BASE_ADR'length))     & DATAOUT2_BASE_ADR ,     std_logic_vector(to_unsigned(2200,32))     ,AXIL_MISO ,AXIL_MOSI);
      write_axi_lite(std_logic_vector(to_unsigned(0,32-DATAOUT3_BASE_ADR'length))     & DATAOUT3_BASE_ADR ,     std_logic_vector(to_unsigned(0,32))         ,AXIL_MISO ,AXIL_MOSI);

      wait for 5 ms;
      report "END OF SIMULATION" 
      severity error;
end process fan_stim;

 

end fan_stim;
