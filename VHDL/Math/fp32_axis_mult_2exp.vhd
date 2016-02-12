
library IEEE;
use IEEE.std_logic_1164.all;   
use ieee.numeric_std.all;

library ieee_proposed;
use ieee_proposed.float_pkg.all;

use work.tel2000.all;

entity fp32_axis_mult_2exp_fp32 is
   port(
      ARESETN    : in  std_logic;
      CLK        : in  std_logic;

      RX_MOSI    : in  t_axi4_stream_mosi32;      
      RX_MISO    : out t_axi4_stream_miso;  

      TX_MOSI    : out t_axi4_stream_mosi32;
      TX_MISO    : in t_axi4_stream_miso;

      IN_DATA       : in std_logic_vector(31 downto 0);
      IN_DVAL       : in std_logic; 
      IN_BUSY       : out std_logic
      );
end fp32_axis_mult_2exp_fp32;

architecture RTL of fp32_axis_mult_2exp_fp32 is
   
   signal TX_EXP_MOSI    : t_axi4_stream_mosi32;

	signal exponent_value	:std_logic_vector(7 downto 0);
   
begin
   
   RX_MISO.TREADY <= TX_MISO.TREADY;
   
   EXPONENT_PROCESS : process (CLK) is
   begin
      if CLK'EVENT and CLK = '1' then  -- rising clock edge
         if ARESETN = '0' then
             TX_EXP_MOSI.TVALID <= '0';
             TX_EXP_MOSI.TSTRB <= "0000";
             TX_EXP_MOSI.TKEEP <= "0000";
             TX_EXP_MOSI.TLAST <= '0';
             TX_EXP_MOSI.TID <= "0";
             TX_EXP_MOSI.TUSER <= "00000000";
             TX_EXP_MOSI.TDEST <= "000";
             TX_EXP_MOSI.TDATA <= X"00000000";
         elsif TX_MISO.TREADY = '1' then
            TX_EXP_MOSI.TVALID <= RX_MOSI.TVALID;
            TX_EXP_MOSI.TSTRB <= RX_MOSI.TSTRB;
            TX_EXP_MOSI.TKEEP <= RX_MOSI.TKEEP;
            TX_EXP_MOSI.TLAST <= RX_MOSI.TLAST;
            TX_EXP_MOSI.TID <= RX_MOSI.TID;
            TX_EXP_MOSI.TUSER <= RX_MOSI.TUSER;
            TX_EXP_MOSI.TDATA <= std_logic_vector(Scalb(to_float(RX_MOSI.TDATA), to_integer(signed(exponent_value))));
         end if;
      end if;
   end process EXPONENT_PROCESS;
   
   OUTPUT_PROCESS : process (CLK) is
   begin
      if CLK'EVENT and CLK = '1' then  -- rising clock edge
         if ARESETN = '0' then
             TX_MOSI.TVALID <= '0';
             TX_MOSI.TSTRB <= "0000";
             TX_MOSI.TKEEP <= "0000";
             TX_MOSI.TLAST <= '0';
             TX_MOSI.TID <= "0";
             TX_MOSI.TUSER <= "00000000";
             TX_MOSI.TDEST <= "000";
             TX_MOSI.TDATA <= X"00000000";
         elsif TX_MISO.TREADY = '1' then
            TX_MOSI <= TX_EXP_MOSI;
         end if;
      end if;
   end process OUTPUT_PROCESS;

   WRITEEXPONENT_PROCESS : process (CLK) is
   begin
      if CLK'EVENT and CLK = '1' then  -- rising clock edge
         if ARESETN = '0' then
            exponent_value <= X"00";
            IN_BUSY <= '0';
         elsif IN_DVAL = '1' then
            exponent_value <= IN_DATA(7 downto 0);
            IN_BUSY <= '1';
         else
            IN_BUSY <= '0';
         end if;
      end if;
    end process WRITEEXPONENT_PROCESS;
end RTL;
