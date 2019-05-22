-- file: adc_serdes_clk_wrapper.vhd


library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;
--use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use work.fpa_common_pkg.all;

library unisim;
use unisim.vcomponents.all;

entity adc_serdes_clk_wrapper is
   
   generic(
      CLK_1X_PERIOD_nS  : real := 25.0
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
   
   constant CLK_1X_PERIOD_mS : real :=  CLK_1X_PERIOD_nS/1_000_000.0; --  CLK_1X_PERIOD_NS converti en millisecond
   
   
   component serdes_isc0207A_3k_5_0_MHz_mmcm
      port
         (
         clk_in            : in     std_logic;
         clk_out           : out    std_logic;
         clk_out_mult7     : out    std_logic;
         reset             : in     std_logic;
         locked            : out    std_logic
         );
   end component; 
   
   component serdes_isc0207A_3k_8_0_MHz_mmcm
      port
         (
         clk_in            : in     std_logic;
         clk_out           : out    std_logic;
         clk_out_mult7     : out    std_logic;
         reset             : in     std_logic;
         locked            : out    std_logic
         );
   end component;
   
   component serdes_isc0207A_3k_9_0_MHz_mmcm
      port
         (
         clk_in            : in     std_logic;
         clk_out           : out    std_logic;
         clk_out_mult7     : out    std_logic;
         reset             : in     std_logic;
         locked            : out    std_logic
         );
   end component;
   
   component serdes_isc0207A_3k_9_5_MHz_mmcm
      port
         (
         clk_in            : in     std_logic;
         clk_out           : out    std_logic;
         clk_out_mult7     : out    std_logic;
         reset             : in     std_logic;
         locked            : out    std_logic
         );
   end component;
   
   component serdes_isc0207A_3k_10_0_MHz_mmcm
      port
         (
         clk_in            : in     std_logic;
         clk_out           : out    std_logic;
         clk_out_mult7     : out    std_logic;
         reset             : in     std_logic;
         locked            : out    std_logic
         );
   end component;
   
   component serdes_isc0207A_3k_10_75_MHz_mmcm
      port
         (
         clk_in            : in     std_logic;
         clk_out           : out    std_logic;
         clk_out_mult7     : out    std_logic;
         reset             : in     std_logic;
         locked            : out    std_logic
         );
   end component;
   
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
   
   component serdes_clkin_11_4_MHz_mmcm
      port
         (
         clk_in            : in     std_logic;
         clk_out           : out    std_logic;
         clk_out_mult7     : out    std_logic;
         reset             : in     std_logic;
         locked            : out    std_logic
         );
   end component;
   
   component serdes_clkin_16_6_MHz_mmcm
      port
         (
         clk_in            : in     std_logic;
         clk_out           : out    std_logic;
         clk_out_mult7     : out    std_logic;
         reset             : in     std_logic;
         locked            : out    std_logic
         );
   end component;
   
   component serdes_clkin_16_8_MHz_mmcm
      port
         (
         clk_in            : in     std_logic;
         clk_out           : out    std_logic;
         clk_out_mult7     : out    std_logic;
         reset             : in     std_logic;
         locked            : out    std_logic
         );
   end component;
   
   component serdes_clkin_17_0_MHz_mmcm
      port
         (
         clk_in            : in     std_logic;
         clk_out           : out    std_logic;
         clk_out_mult7     : out    std_logic;
         reset             : in     std_logic;
         locked            : out    std_logic
         );
   end component;
   
   component serdes_clkin_22_2_MHz_mmcm
      port
         (
         clk_in            : in     std_logic;
         clk_out           : out    std_logic;
         clk_out_mult7     : out    std_logic;
         reset             : in     std_logic;
         locked            : out    std_logic
         );
   end component;
   
   component serdes_clkin_23_7_MHz_mmcm
      port
         (
         clk_in            : in     std_logic;
         clk_out           : out    std_logic;
         clk_out_mult7     : out    std_logic;
         reset             : in     std_logic;
         locked            : out    std_logic
         );
   end component;  
   
   component serdes_clkin_24_0_MHz_mmcm
      port
         (
         clk_in            : in     std_logic;
         clk_out           : out    std_logic;
         clk_out_mult7     : out    std_logic;
         reset             : in     std_logic;
         locked            : out    std_logic
         );
   end component;
   
   component serdes_clkin_24_2_MHz_mmcm
      port
         (
         clk_in            : in     std_logic;
         clk_out           : out    std_logic;
         clk_out_mult7     : out    std_logic;
         reset             : in     std_logic;
         locked            : out    std_logic
         );
   end component;
   
   component serdes_clkin_11_0_MHz_mmcm
      port
         (
         clk_in            : in     std_logic;
         clk_out           : out    std_logic;
         clk_out_mult7     : out    std_logic;
         reset             : in     std_logic;
         locked            : out    std_logic
         );
   end component;
   
   component serdes_clkin_27_0_MHz_mmcm
      port
         (
         clk_in            : in     std_logic;
         clk_out           : out    std_logic;
         clk_out_mult7     : out    std_logic;
         reset             : in     std_logic;
         locked            : out    std_logic
         );
   end component;
   
   component serdes_clkin_25_0_MHz_mmcm
      port
         (
         clk_in            : in     std_logic;
         clk_out           : out    std_logic;
         clk_out_mult7     : out    std_logic;
         reset             : in     std_logic;
         locked            : out    std_logic
         );
   end component;
   
   component serdes_clkin_21_5_MHz_mmcm
      port
         (
         clk_in            : in     std_logic;
         clk_out           : out    std_logic;
         clk_out_mult7     : out    std_logic;
         reset             : in     std_logic;
         locked            : out    std_logic
         );
   end component;
   
   component serdes_clkin_40_0_MHz_mmcm
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
   
   MCLK_5_0M_Gen : if abs(1.0/CLK_1X_PERIOD_mS - 10_000.0) <= 10.0  generate   
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
   
   MCLK_5_5M_Gen : if abs(1.0/CLK_1X_PERIOD_mS - 11_000.0) <= 10.0  generate   
      begin                                             
      U10M :  serdes_clkin_11_0_MHz_mmcm
      port map (   
         clk_in         => CLK_IN,
         clk_out        => CLK_OUT, 
         clk_out_mult7  => CLK_OUT_MULT7,   
         reset          => ARESET,
         locked         => LOCKED            
         );      
   end generate;
   
   MCLK_8_3M_Gen : if abs(1.0/CLK_1X_PERIOD_mS - 16_666.75) <= 10.0 generate   
      begin                                             
      U10M :  serdes_clkin_16_6_MHz_mmcm
      port map (   
         clk_in         => CLK_IN,
         clk_out        => CLK_OUT, 
         clk_out_mult7  => CLK_OUT_MULT7,   
         reset          => ARESET,
         locked         => LOCKED            
         );      
   end generate;
   
   MCLK_8_4M_Gen : if abs(1.0/CLK_1X_PERIOD_mS - 16_875.0) <= 10.0 generate   
      begin                                             
      U10M :  serdes_clkin_16_8_MHz_mmcm
      port map (   
         clk_in         => CLK_IN,
         clk_out        => CLK_OUT, 
         clk_out_mult7  => CLK_OUT_MULT7,   
         reset          => ARESET,
         locked         => LOCKED            
         );      
   end generate;
   
   MCLK_8_5M_Gen : if abs(1.0/CLK_1X_PERIOD_mS - 17_000.0) <= 10.0 generate   
      begin                                             
      U10M :  serdes_clkin_17_0_MHz_mmcm
      port map (   
         clk_in         => CLK_IN,
         clk_out        => CLK_OUT, 
         clk_out_mult7  => CLK_OUT_MULT7,   
         reset          => ARESET,
         locked         => LOCKED            
         );      
   end generate;
   
   MCLK_11_1M_Gen : if abs(1.0/CLK_1X_PERIOD_mS - 22_222.0) <= 10.0  generate   
      begin                                             
      U10M :  serdes_clkin_22_2_MHz_mmcm
      port map (   
         clk_in         => CLK_IN,
         clk_out        => CLK_OUT, 
         clk_out_mult7  => CLK_OUT_MULT7,   
         reset          => ARESET,
         locked         => LOCKED            
         );      
   end generate;
   
   MCLK_11_8M_Gen : if abs(1.0/CLK_1X_PERIOD_mS - 23_760.0) <= 10.0  generate   
      begin                                             
      U10M :  serdes_clkin_23_7_MHz_mmcm
      port map (   
         clk_in         => CLK_IN,
         clk_out        => CLK_OUT, 
         clk_out_mult7  => CLK_OUT_MULT7,   
         reset          => ARESET,
         locked         => LOCKED            
         );      
   end generate;
   
   MCLK_12_0M_Gen : if abs(1.0/CLK_1X_PERIOD_mS - 24_000.0) <= 10.0  generate   
      begin                                             
      U10M :  serdes_clkin_24_0_MHz_mmcm
      port map (   
         clk_in         => CLK_IN,
         clk_out        => CLK_OUT, 
         clk_out_mult7  => CLK_OUT_MULT7,   
         reset          => ARESET,
         locked         => LOCKED            
         );      
   end generate;
   
   MCLK_12_1M_Gen : if abs(1.0/CLK_1X_PERIOD_mS - 24_250.0) <= 10.0  generate   
      begin                                             
      U10M :  serdes_clkin_24_2_MHz_mmcm
      port map (   
         clk_in         => CLK_IN,
         clk_out        => CLK_OUT, 
         clk_out_mult7  => CLK_OUT_MULT7,   
         reset          => ARESET,
         locked         => LOCKED            
         );      
   end generate;
   
   MCLK_5_7M_Gen : if abs(1.0/CLK_1X_PERIOD_mS - 11_400.0) <= 10.0  generate   
      begin                                             
      U10M :  serdes_clkin_11_4_MHz_mmcm
      port map (   
         clk_in         => CLK_IN,
         clk_out        => CLK_OUT, 
         clk_out_mult7  => CLK_OUT_MULT7,   
         reset          => ARESET,
         locked         => LOCKED            
         );      
   end generate;
   
   MCLK_13_5M_Gen : if abs(1.0/CLK_1X_PERIOD_mS - 27_000.0) <= 10.0  generate   
      begin                                             
      U10M :  serdes_clkin_27_0_MHz_mmcm
      port map (   
         clk_in         => CLK_IN,
         clk_out        => CLK_OUT, 
         clk_out_mult7  => CLK_OUT_MULT7,   
         reset          => ARESET,
         locked         => LOCKED            
         );      
   end generate;
   
   MCLK_12_5M_Gen : if abs(1.0/CLK_1X_PERIOD_mS - 25_000.0) <= 10.0  generate   
      begin                                             
      U10M :  serdes_clkin_25_0_MHz_mmcm
      port map (   
         clk_in         => CLK_IN,
         clk_out        => CLK_OUT, 
         clk_out_mult7  => CLK_OUT_MULT7,   
         reset          => ARESET,
         locked         => LOCKED            
         );      
   end generate; 
   
   MCLK_10_75M_Gen : if abs(1.0/CLK_1X_PERIOD_mS - 21_500.0) <= 10.0  generate   
      begin                                             
      U10M :  serdes_clkin_21_5_MHz_mmcm
      port map (   
         clk_in         => CLK_IN,
         clk_out        => CLK_OUT, 
         clk_out_mult7  => CLK_OUT_MULT7,   
         reset          => ARESET,
         locked         => LOCKED            
         );      
   end generate;
   
   Gen_40M : if abs(1.0/CLK_1X_PERIOD_mS - 40_000.0) <= 10.0  generate   
      begin                                             
      U10M :  serdes_clkin_40_0_MHz_mmcm
      port map (   
         clk_in         => CLK_IN,
         clk_out        => CLK_OUT, 
         clk_out_mult7  => CLK_OUT_MULT7,   
         reset          => ARESET,
         locked         => LOCKED            
         );      
   end generate;
   
   
end rtl;

