
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.std_logic_textio.all;

library std;
use std.textio.all;

library work;
use work.TEL2000.all;


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fp32_axis_power_tb is
end fp32_axis_power_tb;

architecture TB_ARCHITECTURE of fp32_axis_power_tb is
    
   component fp32_axis_power is
      port(
         ARESETN : in std_logic;
         CLK : in std_logic;
         BASE_MOSI : in t_axi4_stream_mosi32;
         EXPN : in STD_LOGIC_VECTOR(31 downto 0);
         POW_MISO : in t_axi4_stream_miso;
         BASE_MISO : out t_axi4_stream_miso;
         ERR : out std_logic_vector(4 downto 0);
         POW_MOSI : out t_axi4_stream_mosi32
      );
   end component;
   
   component axis32_fanout2
      port (
         ARESETN : in STD_LOGIC;
         CLK : in STD_LOGIC;
         RX_MOSI : in T_AXI4_STREAM_MOSI32;
         TX0_MISO : in T_AXI4_STREAM_MISO;
         TX1_MISO : in T_AXI4_STREAM_MISO;
         RX_MISO : out T_AXI4_STREAM_MISO;
         TX0_MOSI : out T_AXI4_STREAM_MOSI32;
         TX1_MOSI : out T_AXI4_STREAM_MOSI32
      );
   end component;

   component axis_fi32tofp32
      generic (
         input_efflen : NATURAL := 12;
         input_signed : BOOLEAN := false
      );
      port (
         ARESETN : in STD_LOGIC;
         CLK : in STD_LOGIC;
         RX_MOSI : in T_AXI4_STREAM_MOSI32;
         TX_MISO : in T_AXI4_STREAM_MISO;
         RX_MISO : out T_AXI4_STREAM_MISO;
         TX_MOSI : out T_AXI4_STREAM_MOSI32
      );
   end component;

   component axis_fp32tofi32
      generic (
         OUTPUT_ROUND : BOOLEAN := true
      );
      port (
         ARESETN : in STD_LOGIC;
         CLK : in STD_LOGIC;
         RX_MOSI : in T_AXI4_STREAM_MOSI32;
         TX_MISO : in T_AXI4_STREAM_MISO;
         ERR : out STD_LOGIC_VECTOR(4 downto 0);
         RX_MISO : out T_AXI4_STREAM_MISO;
         TX_MOSI : out T_AXI4_STREAM_MOSI32
      );
   end component;

   constant CLK_PERIOD           : time := 10 ns;    -- 100 MHz
   constant MAX_VALUE            : integer := (2**23)-1; -- max value on 23 bits
   constant COMPRESS_EXPONENT    : std_logic_vector(31 downto 0) := x"3F321643";   -- 16/23 in float
   constant DECOMPRESS_EXPONENT  : std_logic_vector(31 downto 0) := x"3FB80000";   -- 23/16 in float

   signal aresetn : std_logic;
   signal areset : std_logic;
   signal clk : std_logic := '0';
   
   signal compress_err, decompress_err : std_logic_vector(4 downto 0);

   signal din_integer_miso : t_axi4_stream_miso;
   signal din_integer_mosi : t_axi4_stream_mosi32;
   
   signal din_float_miso : t_axi4_stream_miso;
   signal din_float_mosi : t_axi4_stream_mosi32;
   
   signal compress_float_miso : t_axi4_stream_miso;
   signal compress_float_mosi : t_axi4_stream_mosi32;
   
   signal compress_integer_miso : t_axi4_stream_miso;
   signal compress_integer_mosi : t_axi4_stream_mosi32;
   
   signal compress_integer_miso_0 : t_axi4_stream_miso;
   signal compress_integer_mosi_0 : t_axi4_stream_mosi32;
   
   signal compress_integer_miso_1 : t_axi4_stream_miso;
   signal compress_integer_mosi_1 : t_axi4_stream_mosi32;
   
   signal compress_float_miso_1 : t_axi4_stream_miso;
   signal compress_float_mosi_1 : t_axi4_stream_mosi32;

   signal decompress_float_miso : t_axi4_stream_miso;
   signal decompress_float_mosi : t_axi4_stream_mosi32;
   
   signal decompress_integer_miso : t_axi4_stream_miso;
   signal decompress_integer_mosi : t_axi4_stream_mosi32;
   
   
begin
   
   -- reset
   process
   begin
      aresetn <= '0'; 
      wait for 250 ns;
      aresetn <= '1';
      wait;
   end process;
   areset <= not aresetn;
   
   -- clk
   process(clk)
   begin
      clk <= not clk after CLK_PERIOD/2; 
   end process;
   
   -- Send all base values
   process is
      file din_fptr : text open write_mode is "D:/Telops/FIR-00251-Common/VHDL/Math/Sim/fp32_axis_power_tb/din_values.txt";
      variable din_line : line;
   begin
      
      din_integer_mosi.tvalid <= '0';
      
      wait until aresetn = '1';
      
      wait until rising_edge(clk);
      
      -- Base value is a counter for all possible values
      for ii in 0 to MAX_VALUE - 1 loop
         write_axis32(clk, std_logic_vector(to_unsigned(ii, din_integer_mosi.tdata'length)), '0', din_integer_miso,  din_integer_mosi);
         -- write value in file
         write(din_line, ii);
         writeline(din_fptr, din_line);
      end loop;
      write_axis32(clk, std_logic_vector(to_unsigned(MAX_VALUE, din_integer_mosi.tdata'length)), '1', din_integer_miso,  din_integer_mosi);
      -- write value in file
      write(din_line, MAX_VALUE);
      writeline(din_fptr, din_line);
      
      wait;

   end process;
   
   -- Receive compress value
   process is
      file compress_fptr : text open write_mode is "D:/Telops/FIR-00251-Common/VHDL/Math/Sim/fp32_axis_power_tb/compress_values.txt";
      variable compress_line : line;
   begin
      
      compress_integer_miso_0.tready <= '1';
      
      wait until (compress_integer_mosi_0.tvalid = '1' and rising_edge(clk));
      -- write value in file
      write(compress_line, to_integer(unsigned(compress_integer_mosi_0.tdata)));
      writeline(compress_fptr, compress_line);
      
   end process;
   
   -- Receive decompress value
   process is
      file decompress_fptr : text open write_mode is "D:/Telops/FIR-00251-Common/VHDL/Math/Sim/fp32_axis_power_tb/decompress_values.txt";
      variable decompress_line : line;
   begin
      
      decompress_integer_miso.tready <= '1';
            
      wait until (decompress_integer_mosi.tvalid = '1' and rising_edge(clk));
      -- write value in file
      write(decompress_line, to_integer(unsigned(decompress_integer_mosi.tdata)));
      writeline(decompress_fptr, decompress_line);
      
   end process;
   
   
   
   ---------------------------------------------------------------------------------------------------------
   -- Testbench data chain to compress and decompress
   ---------------------------------------------------------------------------------------------------------
   
   -- Convert data in from integer to float
   DIN_ITOF : axis_fi32tofp32
   generic map (
      input_efflen => 32,
      input_signed => false
   )
   port map(
      ARESETN => aresetn,
      CLK => clk,
      RX_MISO => din_integer_miso,
      RX_MOSI => din_integer_mosi,
      TX_MISO => din_float_miso,
      TX_MOSI => din_float_mosi
   );
   
   -- Compress data
   COMPRESS : fp32_axis_power
   port map (
      ARESETN => aresetn,
      CLK => clk,
      BASE_MISO => din_float_miso,
      BASE_MOSI => din_float_mosi,
      EXPN => COMPRESS_EXPONENT,
      ERR => compress_err,
      POW_MISO => compress_float_miso,
      POW_MOSI => compress_float_mosi
   );
   
   -- Convert compress data from float to integer
   COMPRESS_FTOI : axis_fp32tofi32
   generic map (
      OUTPUT_ROUND => true
   )
   port map(
      ARESETN => aresetn,
      CLK => clk,
      RX_MISO => compress_float_miso,
      RX_MOSI => compress_float_mosi,
      TX_MISO => compress_integer_miso,
      TX_MOSI => compress_integer_mosi
   );
   
   -- Duplicate compress data
   FANOUT : axis32_fanout2
   port map(
      ARESETN => aresetn,
      CLK => clk,
      RX_MISO => compress_integer_miso,
      RX_MOSI => compress_integer_mosi,
      TX0_MISO => compress_integer_miso_0,
      TX0_MOSI => compress_integer_mosi_0,
      TX1_MISO => compress_integer_miso_1,
      TX1_MOSI => compress_integer_mosi_1
   );
   
   -- Reconvert compress data from integer to float
   COMPRESS_ITOF : axis_fi32tofp32
   generic map (
      input_efflen => 32,
      input_signed => false
   )
   port map(
      ARESETN => aresetn,
      CLK => clk,
      RX_MISO => compress_integer_miso_1,
      RX_MOSI => compress_integer_mosi_1,
      TX_MISO => compress_float_miso_1,
      TX_MOSI => compress_float_mosi_1
   );
   
   -- Decompress data
   DECOMPRESS : fp32_axis_power
   port map (
      ARESETN => aresetn,
      CLK => clk,
      BASE_MISO => compress_float_miso_1,
      BASE_MOSI => compress_float_mosi_1,
      EXPN => DECOMPRESS_EXPONENT,
      ERR => decompress_err,
      POW_MISO => decompress_float_miso,
      POW_MOSI => decompress_float_mosi
   );
   
   -- Convert decompress data from float to integer
   DECOMPRESS_FTOI : axis_fp32tofi32
   generic map (
      OUTPUT_ROUND => true
   )
   port map(
      ARESETN => aresetn,
      CLK => clk,
      RX_MISO => decompress_float_miso,
      RX_MOSI => decompress_float_mosi,
      TX_MISO => decompress_integer_miso,
      TX_MOSI => decompress_integer_mosi
   );
   
   
end TB_ARCHITECTURE;
