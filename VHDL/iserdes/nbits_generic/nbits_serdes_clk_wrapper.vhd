-- file: nbits_serdes_clk_wrapper.vhd


library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use work.tel2000.all;

library unisim;
use unisim.vcomponents.all;

entity nbits_serdes_clk_wrapper is
   generic(
      NBITS_PIXEL_CLK_PERIOD : time := 30 ns;
      NBITS_PIPE_CLK_PERIOD  : time := 10 ns;
	  NBITS_BIT_CLK_PERIOD   : time := 1.25 ns
      );
   port(
      -- Clock in ports
      PIXEL_CLK_IN  : in std_logic;
      -- Clock out ports
      PIXEL_CLK_OUT : out std_logic;
      PIPE_CLK_OUT  : out std_logic;
      BIT_CLK_OUT   : out std_logic;
      -- Status and control signals
      ARESET        : in std_logic;
      LOCKED        : out std_logic
      );
end nbits_serdes_clk_wrapper;

architecture xilinx of nbits_serdes_clk_wrapper is
   ----------------------------------------------------------------------------------
   -- For more details see :
   --    FPGA Data Sheet (DS182): MMCM Switching Characteristics section.
   --    FPGA Clocking Resources User Guide (UG472): Chapter 3 Clock Management Tile.
   ----------------------------------------------------------------------------------
   -- MMCM block diagram :
   -- clkin  ->  /D  ->  *M  ->  /out0  ->  clkout0
   -- clkin  ->  /D  ->  *M  ->  /out1  ->  clkout1
   -- clkin  ->  /D  ->  *M  ->  /out2  ->  clkout2
   ----------------------------------------------------------------------------------
   -- D : 
   --    integer in range [1, 106]
   --    freqPFD = clkin / D must be in range [10, 450] MHz
   constant D : integer := integer(ceil(1.0 / (450.0E6 * NBITS_PIXEL_CLK_PERIOD / 1.0 sec)));
   -- M : 
   --    integer in range [2, 64]
   --    freqVCO = clkin * M / D must be in range [600, 1200] MHz
   --    freqVCO must be as high as possible so M is calculated with freqVCOmax
   constant Mideal : integer := integer(1200.0E6 * real(D) * NBITS_PIXEL_CLK_PERIOD / 1.0 sec);
   constant Mvalid : integer := MIN(Mideal, 64);
   constant M      : integer := Mvalid / integer(D * NBITS_PIXEL_CLK_PERIOD / NBITS_BIT_CLK_PERIOD) * integer(D * NBITS_PIXEL_CLK_PERIOD / NBITS_BIT_CLK_PERIOD);

   -- Input clock buffering
   signal clkin1 : std_logic;
   -- Output clock buffering
   signal clkfbout : std_logic;
   signal clkfbin  : std_logic;
   signal clkout0  : std_logic;
   signal clkout1  : std_logic;
   signal clkout2  : std_logic;
   -- Status signals
   signal locked_int : std_logic;
   -- Control signals
   signal reset_high : std_logic;
begin
   -- Input buffering
   --------------------------------------
   clkin1_bufg : BUFG
   port map
      (O => clkin1,
       I => PIXEL_CLK_IN);
   
   -- Clocking PRIMITIVE
   --------------------------------------
   -- Instantiation of the MMCM PRIMITIVE
   --    * Unused inputs are tied off
   --    * Unused outputs are left open
   mmcm_adv_inst : MMCME2_ADV
   generic map
      (DIVCLK_DIVIDE    => D,
       CLKFBOUT_MULT_F  => real(M),
       CLKOUT0_DIVIDE_F => real(M/D),
       CLKOUT1_DIVIDE   => (M/D) / (NBITS_PIXEL_CLK_PERIOD/NBITS_PIPE_CLK_PERIOD),
	   CLKOUT2_DIVIDE   => (M/D) / (NBITS_PIXEL_CLK_PERIOD/NBITS_BIT_CLK_PERIOD),
       CLKIN1_PERIOD    => real(NBITS_PIXEL_CLK_PERIOD / 1.0 ns),
       REF_JITTER1      => 0.072)
   port map
      (-- Output clocks
       CLKFBOUT  => clkfbout,
       CLKFBOUTB => open,
       CLKOUT0   => clkout0,
       CLKOUT0B  => open,
       CLKOUT1   => clkout1,
       CLKOUT1B  => open,
       CLKOUT2   => clkout2,
       CLKOUT2B  => open,
       CLKOUT3   => open,
       CLKOUT3B  => open,
       CLKOUT4   => open,
       CLKOUT5   => open,
       CLKOUT6   => open,
       -- Input clock control
       CLKFBIN => clkfbin,
       CLKIN1  => clkin1,
       CLKIN2  => '0',
       -- Tied to always select the primary input clock
       CLKINSEL => '1',
       -- Ports for dynamic reconfiguration
       DADDR => (others => '0'),
       DCLK  => '0',
       DEN   => '0',
       DI    => (others => '0'),
       DO    => open,
       DRDY  => open,
       DWE   => '0',
       -- Ports for dynamic phase shift
       PSCLK    => '0',
       PSEN     => '0',
       PSINCDEC => '0',
       PSDONE   => open,
       -- Other control and status signals
       LOCKED       => locked_int,
       CLKINSTOPPED => open,
       CLKFBSTOPPED => open,
       PWRDWN       => '0',
       RST          => reset_high);
   
   reset_high <= ARESET; 
   LOCKED     <= locked_int;
   
   -- Output buffering
   -------------------------------------
   clkfb_buf : BUFG
   port map
      (O => clkfbin,
       I => clkfbout);
   clkout1_buf : BUFG
   port map
      (O => PIXEL_CLK_OUT,
       I => clkout0);
   clkout2_buf : BUFG
   port map
      (O => PIPE_CLK_OUT,
       I => clkout1);
   clkout3_buf : BUFG
   port map
      (O => BIT_CLK_OUT,
       I => clkout2);
end xilinx;
