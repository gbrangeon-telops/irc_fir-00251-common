library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.tel2000.all;

entity axil32_addr_demux4 is
   generic(
      SLAVE_ADDR_WIDTH : integer := 14
   );
   port(
      AXIL_S0_Mosi: in t_axi4_lite_mosi;
      AXIL_S0_Miso: out t_axi4_lite_miso;

      AXIL_M0_Mosi: out t_axi4_lite_mosi;
      AXIL_M0_Miso: in t_axi4_lite_miso;

      AXIL_M1_Mosi: out t_axi4_lite_mosi;
      AXIL_M1_Miso: in t_axi4_lite_miso;

      AXIL_M2_Mosi: out t_axi4_lite_mosi;
      AXIL_M2_Miso: in t_axi4_lite_miso;

      AXIL_M3_Mosi: out t_axi4_lite_mosi;
      AXIL_M3_Miso: in t_axi4_lite_miso
   );
end axil32_addr_demux4;

architecture implementation of axil32_addr_demux4 is

begin

   -- Master0 connection
   AXIL_M0_Mosi.awvalid <= AXIL_S0_Mosi.awvalid when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "00") else '0';
   AXIL_M0_Mosi.wvalid <= AXIL_S0_Mosi.wvalid when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "00") else '0';
   AXIL_M0_Mosi.bready <= AXIL_S0_Mosi.bready when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "00") else '0';
   AXIL_M0_Mosi.arvalid <= AXIL_S0_Mosi.arvalid when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "00") else '0';
   AXIL_M0_Mosi.rready <= AXIL_S0_Mosi.rready when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "00") else '0';

   AXIL_M0_Mosi.awaddr <= AXIL_S0_Mosi.awaddr;
   AXIL_M0_Mosi.awprot <= AXIL_S0_Mosi.awprot;
   AXIL_M0_Mosi.wdata <= AXIL_S0_Mosi.wdata;
   AXIL_M0_Mosi.wstrb <= AXIL_S0_Mosi.wstrb;
   AXIL_M0_Mosi.araddr <= AXIL_S0_Mosi.araddr;
   AXIL_M0_Mosi.arprot <= AXIL_S0_Mosi.arprot;

   AXIL_S0_Miso.awready <= AXIL_M0_Miso.awready when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "00") else 'Z';
   AXIL_S0_Miso.wready <= AXIL_M0_Miso.wready when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "00") else 'Z';
   AXIL_S0_Miso.bvalid <= AXIL_M0_Miso.bvalid when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "00") else 'Z';
   AXIL_S0_Miso.bresp <= AXIL_M0_Miso.bresp when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "00") else "ZZ";

   AXIL_S0_Miso.arready <= AXIL_M0_Miso.arready when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "00") else 'Z';
   AXIL_S0_Miso.rvalid <= AXIL_M0_Miso.rvalid when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "00") else 'Z';
   AXIL_S0_Miso.rdata <= AXIL_M0_Miso.rdata when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "00") else (others => 'Z');
   AXIL_S0_Miso.rresp <= AXIL_M0_Miso.rresp when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "00") else "ZZ";

   -- Master1 connection
   AXIL_M1_Mosi.awvalid <= AXIL_S0_Mosi.awvalid when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "01") else '0';
   AXIL_M1_Mosi.wvalid <= AXIL_S0_Mosi.wvalid when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "01") else '0';
   AXIL_M1_Mosi.bready <= AXIL_S0_Mosi.bready when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "01") else '0';
   AXIL_M1_Mosi.arvalid <= AXIL_S0_Mosi.arvalid when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "01") else '0';
   AXIL_M1_Mosi.rready <= AXIL_S0_Mosi.rready when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "01") else '0';

   AXIL_M1_Mosi.awaddr <= AXIL_S0_Mosi.awaddr;
   AXIL_M1_Mosi.awprot <= AXIL_S0_Mosi.awprot;
   AXIL_M1_Mosi.wdata <= AXIL_S0_Mosi.wdata;
   AXIL_M1_Mosi.wstrb <= AXIL_S0_Mosi.wstrb;
   AXIL_M1_Mosi.araddr <= AXIL_S0_Mosi.araddr;
   AXIL_M1_Mosi.arprot <= AXIL_S0_Mosi.arprot;

   AXIL_S0_Miso.awready <= AXIL_M1_Miso.awready when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "01") else 'Z';
   AXIL_S0_Miso.wready <= AXIL_M1_Miso.wready when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "01") else 'Z';
   AXIL_S0_Miso.bvalid <= AXIL_M1_Miso.bvalid when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "01") else 'Z';
   AXIL_S0_Miso.bresp <= AXIL_M1_Miso.bresp when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "01") else "ZZ";

   AXIL_S0_Miso.arready <= AXIL_M1_Miso.arready when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "01") else 'Z';
   AXIL_S0_Miso.rvalid <= AXIL_M1_Miso.rvalid when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "01") else 'Z';
   AXIL_S0_Miso.rdata <= AXIL_M1_Miso.rdata when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "01") else (others => 'Z');
   AXIL_S0_Miso.rresp <= AXIL_M1_Miso.rresp when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "01") else "ZZ";

   -- Master2 connection
   AXIL_M2_Mosi.awvalid <= AXIL_S0_Mosi.awvalid when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "10") else '0';
   AXIL_M2_Mosi.wvalid <= AXIL_S0_Mosi.wvalid when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "10") else '0';
   AXIL_M2_Mosi.bready <= AXIL_S0_Mosi.bready when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "10") else '0';
   AXIL_M2_Mosi.arvalid <= AXIL_S0_Mosi.arvalid when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "10") else '0';
   AXIL_M2_Mosi.rready <= AXIL_S0_Mosi.rready when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "10") else '0';

   AXIL_M2_Mosi.awaddr <= AXIL_S0_Mosi.awaddr;
   AXIL_M2_Mosi.awprot <= AXIL_S0_Mosi.awprot;
   AXIL_M2_Mosi.wdata <= AXIL_S0_Mosi.wdata;
   AXIL_M2_Mosi.wstrb <= AXIL_S0_Mosi.wstrb;
   AXIL_M2_Mosi.araddr <= AXIL_S0_Mosi.araddr;
   AXIL_M2_Mosi.arprot <= AXIL_S0_Mosi.arprot;

   AXIL_S0_Miso.awready <= AXIL_M2_Miso.awready when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "10") else 'Z';
   AXIL_S0_Miso.wready <= AXIL_M2_Miso.wready when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "10") else 'Z';
   AXIL_S0_Miso.bvalid <= AXIL_M2_Miso.bvalid when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "10") else 'Z';
   AXIL_S0_Miso.bresp <= AXIL_M2_Miso.bresp when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "10") else "ZZ";

   AXIL_S0_Miso.arready <= AXIL_M2_Miso.arready when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "10") else 'Z';
   AXIL_S0_Miso.rvalid <= AXIL_M2_Miso.rvalid when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "10") else 'Z';
   AXIL_S0_Miso.rdata <= AXIL_M2_Miso.rdata when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "10") else (others => 'Z');
   AXIL_S0_Miso.rresp <= AXIL_M2_Miso.rresp when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "10") else "ZZ";

   -- Master3 connection
   AXIL_M3_Mosi.awvalid <= AXIL_S0_Mosi.awvalid when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "11") else '0';
   AXIL_M3_Mosi.wvalid <= AXIL_S0_Mosi.wvalid when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "11") else '0';
   AXIL_M3_Mosi.bready <= AXIL_S0_Mosi.bready when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "11") else '0';
   AXIL_M3_Mosi.arvalid <= AXIL_S0_Mosi.arvalid when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "11") else '0';
   AXIL_M3_Mosi.rready <= AXIL_S0_Mosi.rready when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "11") else '0';

   AXIL_M3_Mosi.awaddr <= AXIL_S0_Mosi.awaddr;
   AXIL_M3_Mosi.awprot <= AXIL_S0_Mosi.awprot;
   AXIL_M3_Mosi.wdata <= AXIL_S0_Mosi.wdata;
   AXIL_M3_Mosi.wstrb <= AXIL_S0_Mosi.wstrb;
   AXIL_M3_Mosi.araddr <= AXIL_S0_Mosi.araddr;
   AXIL_M3_Mosi.arprot <= AXIL_S0_Mosi.arprot;

   AXIL_S0_Miso.awready <= AXIL_M3_Miso.awready when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "11") else 'Z';
   AXIL_S0_Miso.wready <= AXIL_M3_Miso.wready when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "11") else 'Z';
   AXIL_S0_Miso.bvalid <= AXIL_M3_Miso.bvalid when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "11") else 'Z';
   AXIL_S0_Miso.bresp <= AXIL_M3_Miso.bresp when (AXIL_S0_Mosi.awaddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "11") else "ZZ";

   AXIL_S0_Miso.arready <= AXIL_M3_Miso.arready when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "11") else 'Z';
   AXIL_S0_Miso.rvalid <= AXIL_M3_Miso.rvalid when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "11") else 'Z';
   AXIL_S0_Miso.rdata <= AXIL_M3_Miso.rdata when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "11") else (others => 'Z');
   AXIL_S0_Miso.rresp <= AXIL_M3_Miso.rresp when (AXIL_S0_Mosi.araddr(SLAVE_ADDR_WIDTH+1 downto SLAVE_ADDR_WIDTH) = "11") else "ZZ";

end implementation;
