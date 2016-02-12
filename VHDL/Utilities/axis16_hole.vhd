-------------------------------------------------------------------------------
--
-- Title       : axis16_hole
-- Author      : Patrick
-- Company     : Telops/COPL
--
-------------------------------------------------------------------------------
--
-- Description : This is a LocalLink "hole". When FALL is asserted, the data
--               just "falls" in a hole, it is not transmitted to the TX port.
--               When FALL is 0, data flows through normally.
--
-------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.tel2000.all; 

entity axis16_hole is
   port(     
      RX_MOSI  : in  t_axi4_stream_mosi16; 
      RX_MISO  : out t_axi4_stream_miso;
      
      TX_MOSI  : out t_axi4_stream_mosi16;
      TX_MISO  : in  t_axi4_stream_miso; 
      
      FALL     : in std_logic
      );
end axis16_hole;

architecture RTL of axis16_hole is
begin
   
   RX_MISO.TREADY  <= TX_MISO.TREADY when FALL = '0' else '1';
   
   TX_MOSI.TDATA   <= RX_MOSI.TDATA;  
   TX_MOSI.TSTRB   <= RX_MOSI.TSTRB;  
   TX_MOSI.TKEEP   <= RX_MOSI.TKEEP;  
   TX_MOSI.TLAST   <= RX_MOSI.TLAST;  
   TX_MOSI.TID     <= RX_MOSI.TID;    
   TX_MOSI.TDEST   <= RX_MOSI.TDEST;  
   TX_MOSI.TUSER   <= RX_MOSI.TUSER;    
      
   TX_MOSI.TVALID <= RX_MOSI.TVALID when FALL = '0' else '0';
   
end RTL;
