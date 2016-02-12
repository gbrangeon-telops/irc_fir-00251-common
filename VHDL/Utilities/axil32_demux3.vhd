
library ieee;
use ieee.std_logic_1164.all;   
use work.Tel2000.all;

----------------------------------------------------------------------
-- Entity declaration.
----------------------------------------------------------------------

entity axil32_demux3 is       
   port (
      S0_AXIL_MOSI : in   t_axi4_lite_mosi;
      S0_AXIL_MISO : out  t_axi4_lite_miso;
      
      SEL          : in   std_logic_vector(1 downto 0);
      
      M0_AXIL_MOSI : out  t_axi4_lite_mosi;
      M0_AXIL_MISO : in   t_axi4_lite_miso;
      
      M1_AXIL_MOSI : out  t_axi4_lite_mosi;
      M1_AXIL_MISO : in   t_axi4_lite_miso; 
      
      M2_AXIL_MOSI : out  t_axi4_lite_mosi;
      M2_AXIL_MISO : in   t_axi4_lite_miso
      
      );
   
end entity axil32_demux3;


----------------------------------------------------------------------
-- Architecture definition.
----------------------------------------------------------------------

architecture RTL of axil32_demux3 is  
   
begin 
   
   miso_sel   : with SEL select S0_AXIL_MISO <=
   M0_AXIL_MISO when "00",
   M1_AXIL_MISO when "01",
   M2_AXIL_MISO when "10",
   ('0', '0', '0', (others => '0'), '0', '0', (others => '0'), (others => '0')) when others;
   
   -------------------------------------------------------------------------------------------------
   M0_AXIL_MOSI.AWVALID  <=  S0_AXIL_MOSI.AWVALID when SEL = "00" else '0'; 
   M0_AXIL_MOSI.AWADDR   <=  S0_AXIL_MOSI.AWADDR;  
   M0_AXIL_MOSI.AWPROT   <=  S0_AXIL_MOSI.AWPROT;  
   M0_AXIL_MOSI.WVALID   <=  S0_AXIL_MOSI.WVALID  when SEL = "00" else '0';  
   M0_AXIL_MOSI.WDATA    <=  S0_AXIL_MOSI.WDATA;
   M0_AXIL_MOSI.BREADY   <=  S0_AXIL_MOSI.BREADY;  
   M0_AXIL_MOSI.ARVALID  <=  S0_AXIL_MOSI.ARVALID when SEL = "00" else '0'; 
   M0_AXIL_MOSI.ARADDR   <=  S0_AXIL_MOSI.ARADDR;  
   M0_AXIL_MOSI.ARPROT   <=  S0_AXIL_MOSI.ARPROT;  
   M0_AXIL_MOSI.RREADY   <=  S0_AXIL_MOSI.RREADY;  
   M0_AXIL_MOSI.WSTRB    <=  S0_AXIL_MOSI.WSTRB   when SEL = "00" else (others => '0');
      
   --------------------------------------------------------------------------------------------------
   M1_AXIL_MOSI.AWVALID  <=  S0_AXIL_MOSI.AWVALID when SEL = "01" else '0'; 
   M1_AXIL_MOSI.AWADDR   <=  S0_AXIL_MOSI.AWADDR;             
   M1_AXIL_MOSI.AWPROT   <=  S0_AXIL_MOSI.AWPROT;             
   M1_AXIL_MOSI.WVALID   <=  S0_AXIL_MOSI.WVALID  when SEL = "01" else '0';  
   M1_AXIL_MOSI.WDATA    <=  S0_AXIL_MOSI.WDATA;              
   M1_AXIL_MOSI.BREADY   <=  S0_AXIL_MOSI.BREADY;             
   M1_AXIL_MOSI.ARVALID  <=  S0_AXIL_MOSI.ARVALID when SEL = "01" else '0'; 
   M1_AXIL_MOSI.ARADDR   <=  S0_AXIL_MOSI.ARADDR;             
   M1_AXIL_MOSI.ARPROT   <=  S0_AXIL_MOSI.ARPROT;             
   M1_AXIL_MOSI.RREADY   <=  S0_AXIL_MOSI.RREADY;             
   M1_AXIL_MOSI.WSTRB    <=  S0_AXIL_MOSI.WSTRB   when SEL = "01" else (others => '0'); 
      
   ---------------------------------------------------------------------------------------------------
   M2_AXIL_MOSI.AWVALID  <=  S0_AXIL_MOSI.AWVALID when SEL = "10" else '0'; 
   M2_AXIL_MOSI.AWADDR   <=  S0_AXIL_MOSI.AWADDR;  
   M2_AXIL_MOSI.AWPROT   <=  S0_AXIL_MOSI.AWPROT;  
   M2_AXIL_MOSI.WVALID   <=  S0_AXIL_MOSI.WVALID  when SEL = "10" else '0';  
   M2_AXIL_MOSI.WDATA    <=  S0_AXIL_MOSI.WDATA;
   M2_AXIL_MOSI.BREADY   <=  S0_AXIL_MOSI.BREADY;  
   M2_AXIL_MOSI.ARVALID  <=  S0_AXIL_MOSI.ARVALID when SEL = "10" else '0'; 
   M2_AXIL_MOSI.ARADDR   <=  S0_AXIL_MOSI.ARADDR;  
   M2_AXIL_MOSI.ARPROT   <=  S0_AXIL_MOSI.ARPROT;  
   M2_AXIL_MOSI.RREADY   <=  S0_AXIL_MOSI.RREADY;  
   M2_AXIL_MOSI.WSTRB    <=  S0_AXIL_MOSI.WSTRB   when SEL = "10" else (others => '0'); 
   
end architecture RTL;

