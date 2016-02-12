-------------------------------------------------------------------------------
--
-- Title       : axis16_to_axis32
-- Author      : Patrick
-- Company     : Telops/COPL
--
-------------------------------------------------------------------------------
--
-- Description :
--
-------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.numeric_std.all;
use work.tel2000.all; 

entity axis16_to_axis32 is
   generic(
      input_signed : boolean := false  
      );
   port(     
      RX_MOSI  : in  t_axi4_stream_mosi16; 
      RX_MISO  : out t_axi4_stream_miso;
      
      TX_MOSI  : out t_axi4_stream_mosi32;
      TX_MISO  : in  t_axi4_stream_miso
      );
end axis16_to_axis32;

architecture RTL of axis16_to_axis32 is
   
   signal data_in : std_logic_vector(31 downto 0);
   
begin
   signed_case: if input_signed generate
      begin
      data_in <= std_logic_vector(resize(signed(RX_MOSI.TDATA(15 downto 0)), TX_MOSI.TDATA'length));     
   end generate;
   
   unsigned_case: if not input_signed generate
      begin
      data_in <= std_logic_vector(resize(unsigned(RX_MOSI.TDATA(15 downto 0)), TX_MOSI.TDATA'length));     
   end generate;
   
   RX_MISO <= TX_MISO;
   
   TX_MOSI.TVALID  <= RX_MOSI.TVALID; 
   TX_MOSI.TDATA   <= data_in;  
   TX_MOSI.TSTRB   <= "1111";  
   TX_MOSI.TKEEP   <= "1111";  
   TX_MOSI.TLAST   <= RX_MOSI.TLAST;  
   TX_MOSI.TID     <= RX_MOSI.TID;    
   TX_MOSI.TDEST   <= RX_MOSI.TDEST;  
   TX_MOSI.TUSER   <= resize(RX_MOSI.TUSER, TX_MOSI.TUSER'LENGTH);    
   
end RTL;
