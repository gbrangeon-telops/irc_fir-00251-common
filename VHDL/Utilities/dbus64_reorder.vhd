------------------------------------------------------------------
--!   @file : dbus64_reorder
--!   @brief
--!   @details
--!
--!   $Rev$
--!   $Author$
--!   $Date$
--!   $Id$
--!   $URL$
------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;           
use IEEE.numeric_std.ALL;
use work.tel2000.all;

entity dbus64_reorder is
   port (   
      IN_MOSI    : in t_axi4_stream_mosi64;
      IN_MISO    : out t_axi4_stream_miso;
      
      OUT_MOSI   : out t_axi4_stream_mosi64;
      OUT_MISO   : in t_axi4_stream_miso
      );
   
end dbus64_reorder;


architecture rtl of dbus64_reorder is
begin
   
   OUT_MOSI.TDATA  <= IN_MOSI.TDATA(47 downto 32) & IN_MOSI.TDATA(63 downto 48) & IN_MOSI.TDATA(15 downto 0) & IN_MOSI.TDATA(31 downto 16); 
   OUT_MOSI.TVALID <= IN_MOSI.TVALID;
   OUT_MOSI.TSTRB  <= IN_MOSI.TSTRB; 
   OUT_MOSI.TKEEP  <= IN_MOSI.TKEEP; 
   OUT_MOSI.TLAST  <= IN_MOSI.TLAST; 
   OUT_MOSI.TID    <= IN_MOSI.TID;   
   OUT_MOSI.TDEST  <= IN_MOSI.TDEST; 
   OUT_MOSI.TUSER  <= IN_MOSI.TUSER;   
   
   IN_MISO         <= OUT_MISO;
   
end rtl;
