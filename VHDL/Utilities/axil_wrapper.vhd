---------------------------------------------------------------------------------------------------
--  Copyright (c) Telops Inc. 2007
--
--  Author: Olivier Bourgois
--
--  File: ll_32_to_64.vhd
--  Use:  Block for converting a 32 bit Localink Bus into a 64 bit LocalLink Bus
--
---------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use work.TEL2000.all;

entity axil_wrapper  is
   port(
    AXI4_LITE_MOSI : out t_axi4_lite_mosi;
    AXI4_LITE_MISO : in t_axi4_lite_miso;   
   
    axil_usb_img_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    axil_usb_img_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    axil_usb_img_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    axil_usb_img_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    axil_usb_img_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    axil_usb_img_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    axil_usb_img_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    axil_usb_img_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    axil_usb_img_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    axil_usb_img_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    axil_usb_img_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    axil_usb_img_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axil_usb_img_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    axil_usb_img_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    axil_usb_img_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    axil_usb_img_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    axil_usb_img_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    axil_usb_img_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axil_usb_img_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
   );
end axil_wrapper;

architecture rtl of axil_wrapper is

begin

AXI4_LITE_MOSI.araddr <= axil_usb_img_araddr;  
AXI4_LITE_MOSI.arprot <= axil_usb_img_arprot;
AXI4_LITE_MOSI.awaddr <= axil_usb_img_awaddr;
AXI4_LITE_MOSI.awaddr <= axil_usb_img_awaddr;
AXI4_LITE_MOSI.awprot <= axil_usb_img_awprot;
AXI4_LITE_MOSI.awvalid <= axil_usb_img_awvalid(0);
AXI4_LITE_MOSI.bready <= axil_usb_img_bready(0);
AXI4_LITE_MOSI.rready <= axil_usb_img_rready(0);
AXI4_LITE_MOSI.wdata <= axil_usb_img_wdata;
AXI4_LITE_MOSI.wstrb <= axil_usb_img_wstrb;
AXI4_LITE_MOSI.wvalid <= axil_usb_img_wvalid(0);

axil_usb_img_arready(0)  <= AXI4_LITE_MISO.arready;
axil_usb_img_awready(0)  <= AXI4_LITE_MISO.awready;
axil_usb_img_bresp       <= AXI4_LITE_MISO.bresp;  
axil_usb_img_bvalid(0)   <= AXI4_LITE_MISO.bvalid ;
axil_usb_img_rdata       <= AXI4_LITE_MISO.rdata;  
axil_usb_img_rresp       <= AXI4_LITE_MISO.rresp;  
axil_usb_img_rvalid(0)   <= AXI4_LITE_MISO.rvalid; 
axil_usb_img_wready(0)   <= AXI4_LITE_MISO.wready; 


end rtl;
