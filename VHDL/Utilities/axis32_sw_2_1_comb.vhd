-------------------------------------------------------------------------------
--
-- Title       : axis32_sw_3_1
-- Design      : Tel-2000
-- Author      : FTA
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- Description : axis32 Switch (mux) 2 to 1
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use work.Tel2000.all;

entity axis32_sw_2_1_comb is
   port(
      RX0_MOSI : in  t_axi4_stream_mosi32;
      RX0_MISO : out t_axi4_stream_miso;
      
      RX1_MOSI : in  t_axi4_stream_mosi32;
      RX1_MISO : out t_axi4_stream_miso;
      
      TX_MOSI  : out t_axi4_stream_mosi32;
      TX_MISO  : in  t_axi4_stream_miso;
      
      SEL      : in std_logic
      
      );
end axis32_sw_2_1_comb;


architecture RTL of axis32_sw_2_1_comb is
   
   signal sel_i          : std_logic_vector(1 downto 0);
   
begin
   
   --------------------------------------------------
   -- Aiguillage
   -------------------------------------------------- 

   TX_MOSI <= RX0_MOSI when SEL = '0' else RX1_MOSI;
   RX0_MISO.TREADY <= TX_MISO.TREADY when SEL = '0' else '0';
   RX1_MISO.TREADY <= TX_MISO.TREADY when SEL = '1' else '0';
   
end RTL;
