-- file: adc_serdes_clk_wrapper.vhd


library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;
--use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use work.fpa_common_pkg.all;
use work.fpa_define.all;

library unisim;
use unisim.vcomponents.all;

entity adc_serdes_clk_wrapper is
   
   generic(
      CLK_1X_PERIOD_NS  : real := 25.0
      );
   
   port
      (-- Clock in ports
      CLK_IN                 : in     std_logic;
      -- Clock out ports
      CLK_OUT                : out    std_logic;
      CLK_OUT_MULT7          : out    std_logic;
      -- Status and control signals
      ARESET                 : in     std_logic;
      LOCKED                 : out    std_logic
      );
end adc_serdes_clk_wrapper;

architecture rtl of adc_serdes_clk_wrapper is
   
   component serdes_clkin_10_0_MHz_mmcm
      port
         (
         clk_in            : in     std_logic;
         clk_out           : out    std_logic;
         clk_out_mult7     : out    std_logic;
         reset             : in     std_logic;
         locked            : out    std_logic
         );
   end component;
   
   
   --  component serdes_clkin_22_2_MHz_mmcm
   --      port
   --         (
   --         clk_in            : in     std_logic;
   --         clk_out           : out    std_logic;
   --         clk_out_mult7     : out    std_logic;
   --         reset             : in     std_logic;
   --         locked            : out    std_logic
   --         );
   --   end component;
   
   component serdes_clkin_18_0_MHz_mmcm
      port
         (
         clk_in            : in     std_logic;
         clk_out           : out    std_logic;
         clk_out_mult7     : out    std_logic;
         reset             : in     std_logic;
         locked            : out    std_logic
         );
   end component;
   
   
begin
   
   serdes_10_0_Gen : if DEFINE_ADC_QUAD_CLK_RATE_KHZ = 10_000 generate   
      begin                                             
      U10M :  serdes_clkin_10_0_MHz_mmcm
      port map (   
         clk_in         => CLK_IN,
         clk_out        => CLK_OUT, 
         clk_out_mult7  => CLK_OUT_MULT7,   
         reset          => ARESET,
         locked         => LOCKED            
         );      
   end generate; 
   
   serdes_18_0_Gen : if DEFINE_ADC_QUAD_CLK_RATE_KHZ = 18_000 generate   
      begin                                             
      U10M :  serdes_clkin_18_0_MHz_mmcm
      port map (   
         clk_in         => CLK_IN,
         clk_out        => CLK_OUT, 
         clk_out_mult7  => CLK_OUT_MULT7,   
         reset          => ARESET,
         locked         => LOCKED            
         );      
   end generate;
   
   
end rtl;

