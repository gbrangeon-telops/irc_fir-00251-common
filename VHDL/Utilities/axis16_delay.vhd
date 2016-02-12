------------------------------------------------------------------
--!   @file : axis16_delay
--!   @brief
--!   @details: ce module permet d'ajout un délai arbitraire (via un generic) 
--!             dans un flot axis stream 16.
--!
--!   $Rev$
--!   $Author$
--!   $Date$
--!   $Id$
--!   $URL$
------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;           
use ieee.numeric_std.all;
use work.tel2000.all;

entity axis16_delay is
   generic(
      delay: integer := 1
      );
   port(
      ARESETN       : in std_logic;
      CLK           : in std_logic;      
      
      RX_MOSI     : in t_axi4_stream_mosi16;
      RX_MISO     : out t_axi4_stream_miso;
      
      TX_MOSI     : out t_axi4_stream_mosi16;
      TX_MISO     : in t_axi4_stream_miso
      );
end axis16_delay;



architecture rtl of axis16_delay is
   
   component axis16_reg is
      port(
         RX_MOSI  : in  t_axi4_stream_mosi16;
         RX_MISO  : out t_axi4_stream_miso;
         TX_MOSI  : out  t_axi4_stream_mosi16;
         TX_MISO  : in t_axi4_stream_miso;
         
         ARESETN  : in  std_logic;
         CLK      : in  std_logic     
         );
   end component;
   
   signal tx_array_mosi : t_axis4_mosi16_a(delay downto 0);
   signal tx_array_miso : t_axis4_miso_a(delay downto 0);
begin
           
   regs : for i in 1 to delay generate
      S_i: axis16_reg
      port map(
         RX_MOSI => tx_array_mosi(i-1),
         RX_MISO => tx_array_miso(i-1),
         TX_MOSI => tx_array_mosi(i),
         TX_MISO => tx_array_miso(i),
         ARESETN => ARESETN,
         CLK    => CLK
         );
   end generate;
   
   tx_array_mosi(0) <= RX_MOSI;
   tx_array_miso(delay) <= TX_MISO;
   
   TX_MOSI <= tx_array_mosi(delay);
   RX_MISO <= tx_array_miso(0);
end rtl;
