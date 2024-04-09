-------------------------------------------------------------------------------
--
-- Title       : axis16_combine_axis64
-- Author      : ODI
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- Description : Combines 4 axis16 in 1 axis64 (RX0 = pix0, RX1 = pix1, RX2 = pix2 and RX3 = pix3 -> TX = pix3pix2pix1pix0)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;   
use IEEE.std_logic_misc.all;   
use ieee.numeric_std.all;
use work.tel2000.all;

entity axis16_combine_axis64 is
   port(
      ARESETN        : in  std_logic;
      CLK            : in  std_logic;
      
      RX_MOSI_ARY    : in  t_axis4_mosi16_a(0 to 3);
      RX_MISO_ARY    : out t_axis4_miso_a(0 to 3);
      
      TX_MOSI        : out t_axi4_stream_mosi64;
      TX_MISO        : in  t_axi4_stream_miso;
      
      ERR            : out std_logic_vector(2 downto 0)
      );
end axis16_combine_axis64;

architecture RTL_ALT of axis16_combine_axis64 is
	signal TVALID : std_logic_vector(RX_MOSI_ARY'RANGE);
	signal TLAST  : std_logic_vector(RX_MOSI_ARY'RANGE);
begin
	RX_MISO_ARY <= (others => TX_MISO);
	
	G0 : for i in RX_MOSI_ARY'RANGE generate
      TVALID(i) <= RX_MOSI_ARY(i).TVALID;
      TX_MOSI.TDATA((i+1)*RX_MOSI_ARY(i).TDATA'LENGTH-1 downto i*RX_MOSI_ARY(i).TDATA'LENGTH) <= RX_MOSI_ARY(i).TDATA;
      TX_MOSI.TSTRB((i+1)*RX_MOSI_ARY(i).TSTRB'LENGTH-1 downto i*RX_MOSI_ARY(i).TSTRB'LENGTH) <= RX_MOSI_ARY(i).TSTRB;
      TX_MOSI.TKEEP((i+1)*RX_MOSI_ARY(i).TKEEP'LENGTH-1 downto i*RX_MOSI_ARY(i).TKEEP'LENGTH) <= RX_MOSI_ARY(i).TKEEP;
      TLAST(i) <= RX_MOSI_ARY(i).TLAST;
      TX_MOSI.TUSER((i+1)*RX_MOSI_ARY(i).TUSER'LENGTH-1 downto i*RX_MOSI_ARY(i).TUSER'LENGTH) <= RX_MOSI_ARY(i).TUSER;
    end generate;
	TX_MOSI.TVALID <= and_reduce(TVALID);
	TX_MOSI.TLAST <= or_reduce(TLAST);
	TX_MOSI.TID <= RX_MOSI_ARY(0).TID;
    TX_MOSI.TDEST <= RX_MOSI_ARY(0).TDEST;
	
	ERR <= (others => '0');
end RTL_ALT;
