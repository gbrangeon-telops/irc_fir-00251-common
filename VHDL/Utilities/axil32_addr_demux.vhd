library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.tel2000.all;

entity axil32_addr_demux is
   generic(
      SLAVE_ADDR_WIDTH : positive := 14;
      MASTER_CHN_COUNT : positive := 1
   );
   port(
      AXIL_S0_Mosi : in  t_axi4_lite_mosi;
      AXIL_S0_Miso : out t_axi4_lite_miso;

      AXIL_Mx_Mosi : out t_axi4_mosi_a(MASTER_CHN_COUNT-1 downto 0);
      AXIL_Mx_Miso : in  t_axi4_miso_a(MASTER_CHN_COUNT-1 downto 0)
   );
end axil32_addr_demux;

architecture implementation of axil32_addr_demux is

begin

   G0 : for i in AXIL_Mx_Mosi'RANGE generate
      AXIL_Mx_Mosi(i).awvalid <= AXIL_S0_Mosi.awvalid when (AXIL_S0_Mosi.awaddr(31 downto SLAVE_ADDR_WIDTH) = std_logic_vector(to_unsigned(i, 32 - SLAVE_ADDR_WIDTH))) else '0';
      AXIL_Mx_Mosi(i).wvalid  <= AXIL_S0_Mosi.wvalid  when (AXIL_S0_Mosi.awaddr(31 downto SLAVE_ADDR_WIDTH) = std_logic_vector(to_unsigned(i, 32 - SLAVE_ADDR_WIDTH))) else '0';
      AXIL_Mx_Mosi(i).bready  <= AXIL_S0_Mosi.bready  when (AXIL_S0_Mosi.awaddr(31 downto SLAVE_ADDR_WIDTH) = std_logic_vector(to_unsigned(i, 32 - SLAVE_ADDR_WIDTH))) else '0';
      AXIL_Mx_Mosi(i).arvalid <= AXIL_S0_Mosi.arvalid when (AXIL_S0_Mosi.araddr(31 downto SLAVE_ADDR_WIDTH) = std_logic_vector(to_unsigned(i, 32 - SLAVE_ADDR_WIDTH))) else '0';
      AXIL_Mx_Mosi(i).rready  <= AXIL_S0_Mosi.rready  when (AXIL_S0_Mosi.araddr(31 downto SLAVE_ADDR_WIDTH) = std_logic_vector(to_unsigned(i, 32 - SLAVE_ADDR_WIDTH))) else '0';

      AXIL_Mx_Mosi(i).awaddr <= AXIL_S0_Mosi.awaddr;
      AXIL_Mx_Mosi(i).awprot <= AXIL_S0_Mosi.awprot;
      AXIL_Mx_Mosi(i).wdata  <= AXIL_S0_Mosi.wdata;
      AXIL_Mx_Mosi(i).wstrb  <= AXIL_S0_Mosi.wstrb;
      AXIL_Mx_Mosi(i).araddr <= AXIL_S0_Mosi.araddr;
      AXIL_Mx_Mosi(i).arprot <= AXIL_S0_Mosi.arprot;

      AXIL_S0_Miso.awready <= AXIL_Mx_Miso(i).awready when (AXIL_S0_Mosi.awaddr(31 downto SLAVE_ADDR_WIDTH) = std_logic_vector(to_unsigned(i, 32 - SLAVE_ADDR_WIDTH))) else 'Z';
      AXIL_S0_Miso.wready  <= AXIL_Mx_Miso(i).wready  when (AXIL_S0_Mosi.awaddr(31 downto SLAVE_ADDR_WIDTH) = std_logic_vector(to_unsigned(i, 32 - SLAVE_ADDR_WIDTH))) else 'Z';
      AXIL_S0_Miso.bvalid  <= AXIL_Mx_Miso(i).bvalid  when (AXIL_S0_Mosi.awaddr(31 downto SLAVE_ADDR_WIDTH) = std_logic_vector(to_unsigned(i, 32 - SLAVE_ADDR_WIDTH))) else 'Z';
      AXIL_S0_Miso.bresp   <= AXIL_Mx_Miso(i).bresp   when (AXIL_S0_Mosi.awaddr(31 downto SLAVE_ADDR_WIDTH) = std_logic_vector(to_unsigned(i, 32 - SLAVE_ADDR_WIDTH))) else "ZZ";

      AXIL_S0_Miso.arready <= AXIL_Mx_Miso(i).arready when (AXIL_S0_Mosi.araddr(31 downto SLAVE_ADDR_WIDTH) = std_logic_vector(to_unsigned(i, 32 - SLAVE_ADDR_WIDTH))) else 'Z';
      AXIL_S0_Miso.rvalid  <= AXIL_Mx_Miso(i).rvalid  when (AXIL_S0_Mosi.araddr(31 downto SLAVE_ADDR_WIDTH) = std_logic_vector(to_unsigned(i, 32 - SLAVE_ADDR_WIDTH))) else 'Z';
      AXIL_S0_Miso.rdata   <= AXIL_Mx_Miso(i).rdata   when (AXIL_S0_Mosi.araddr(31 downto SLAVE_ADDR_WIDTH) = std_logic_vector(to_unsigned(i, 32 - SLAVE_ADDR_WIDTH))) else (others => 'Z');
      AXIL_S0_Miso.rresp   <= AXIL_Mx_Miso(i).rresp   when (AXIL_S0_Mosi.araddr(31 downto SLAVE_ADDR_WIDTH) = std_logic_vector(to_unsigned(i, 32 - SLAVE_ADDR_WIDTH))) else "ZZ";
   end generate;

end implementation;
