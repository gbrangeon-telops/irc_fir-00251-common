-------------------------------------------------------------------------------
--
-- Title       : axis32_stub
-- Author      : SSA
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- Description : AXIS32 Terminator block.
--
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use work.tel2000.all; 

entity axis32_stub is
   port(     
      RX_MOSI  : in  t_axi4_stream_mosi32; 
      RX_MISO  : out t_axi4_stream_miso
      );
end axis32_stub;

architecture RTL of axis32_stub is
   
begin
   
   RX_MISO.TREADY <= '1';
   
end RTL;
