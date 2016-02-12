------------------------------------------------------------------
--!   @file : axis32_tdata_extractor
--!   @brief
--!   @details:ce module permet d'extraire d'extraire des données sur un lien AXIS et de renvoyer les données extraites sur un lien AXIS egalement.
--!
--!   $Rev$
--!   $Author$
--!   $Date$
--!   $Id$
--!   $URL$
------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use work.tel2000.all;                           

entity axis32_tdata_extractor is
   
   generic(
      rx_msb_pos : integer := 10;
      rx_lsb_pos : integer := 10 
      );
   
   port(
      ARESET     : in  std_logic;
      CLK        : in  std_logic;
      
      RX_MOSI    : in  t_axi4_stream_mosi32;      
      RX_MISO    : out t_axi4_stream_miso; 
      
      TX_MOSI    : out  t_axi4_stream_mosi32;      
      TX_MISO    : in t_axi4_stream_miso;
      
      ERR        : out std_logic      
      );
end axis32_tdata_extractor;

architecture rtl of axis32_tdata_extractor is   
   
begin
   
   RX_MISO <= TX_MISO; 
   TX_MOSI.TVALID <=  RX_MOSI.TVALID;
   TX_MOSI.TDATA  <=  resize(RX_MOSI.TDATA(rx_msb_pos downto rx_lsb_pos),TX_MOSI.TDATA'LENGTH); 
   TX_MOSI.TSTRB  <=  RX_MOSI.TSTRB; 
   TX_MOSI.TKEEP  <=  RX_MOSI.TKEEP; 
   TX_MOSI.TLAST  <=  RX_MOSI.TLAST; 
   TX_MOSI.TID    <=  RX_MOSI.TID;   
   TX_MOSI.TDEST  <=  RX_MOSI.TDEST; 
   TX_MOSI.TUSER  <=  RX_MOSI.TUSER;
   
   process(CLK)
   begin
      if rising_edge(CLK) then 
         if rx_msb_pos > 31 or rx_lsb_pos > 31 then            
            ERR <= '1';
         else
            ERR <= '0';
         end if;
      end if;    
   end process;
   
end rtl;