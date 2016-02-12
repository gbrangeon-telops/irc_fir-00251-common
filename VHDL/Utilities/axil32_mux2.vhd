library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.tel2000.all;

entity axil32_mux2 is
   port(
      AXIL_S0_Mosi: in t_axi4_lite_mosi;
      AXIL_S0_Miso: out t_axi4_lite_miso;
      
      AXIL_S1_Mosi: in t_axi4_lite_mosi;
      AXIL_S1_Miso: out t_axi4_lite_miso;
      
      -- '00':N/C, '01':Slave0, '10':Slave1, '11':N/C
      S0_ENABLE   : in std_logic;
      S1_ENABLE   : in std_logic;

      AXIL_M0_Mosi: out t_axi4_lite_mosi;
      AXIL_M0_Miso: in t_axi4_lite_miso
      
   );
end axil32_mux2;

architecture implementation of axil32_mux2 is

   signal sel  : std_logic_vector(1 downto 0);

begin

   sel <= S1_ENABLE & S0_ENABLE;
   
   AXIL_M0_Mosi <=   AXIL_S0_Mosi when (sel = "01") else 
                     AXIL_S1_Mosi when (sel = "10") else
                     ('0', (others => '0'), (others => '0'), '0', (others => '0'), (others => '0'), '0', '0', (others => '0'), (others => '0'), '0');

   AXIL_S0_Miso <=   AXIL_M0_Miso when (sel = "01") else
                     ('0', '0', '0', (others => '0'), '0', '0', (others => '0'), (others => '0'));
                     
   AXIL_S1_Miso <=   AXIL_M0_Miso when (sel = "10") else
                     ('0', '0', '0', (others => '0'), '0', '0', (others => '0'), (others => '0'));

end implementation;
