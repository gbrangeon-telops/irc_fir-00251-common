-------------------------------------------------------------------------------
--
-- Title       : axis16_img_extractor
-- Author      : Jean-Alexis Boulet
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- Description : Module qui laisse seulement passer le data de l'image sans le HDR
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use work.Tel2000.all;

entity axis16_img_extractor is
   
   port(
      RX_MOSI  : in  t_axi4_stream_mosi16;
      RX_MISO  : out t_axi4_stream_miso;
      
      TX_MOSI : out t_axi4_stream_mosi16;
      TX_MISO : in  t_axi4_stream_miso
 
      );
end axis16_img_extractor;


architecture RTL of axis16_img_extractor is 
     
begin    

    TX_MOSI.TDATA   <= RX_MOSI.TDATA;
    TX_MOSI.TSTRB   <= RX_MOSI.TSTRB;
    TX_MOSI.TKEEP   <= RX_MOSI.TKEEP;
    TX_MOSI.TLAST   <= RX_MOSI.TLAST;
    TX_MOSI.TID     <= RX_MOSI.TID;
    TX_MOSI.TDEST   <= RX_MOSI.TDEST;
    TX_MOSI.TUSER   <= RX_MOSI.TUSER;
    
    TX_MOSI.TVALID   <= RX_MOSI.TVALID when RX_MOSI.TID  = "0" else '0'; -- TID = '1' is the IMG HDR

    RX_MISO.TREADY <= TX_MISO.TREADY;

end RTL;
