library ieee;
use ieee.std_logic_1164.all;

library work;
use work.tel2000.all;

entity axi_bram_ctrl_wrapper is
  port (
    s_axi_aclk : in std_logic;
    s_axi_aresetn : in std_logic;
    
   -- AXI signals
    Axi_Mosi : in t_axi4_a32_d32_mosi;
    Axi_Miso : out t_axi4_a32_d32_miso;

    bram_rst_a : out std_logic;
    bram_clk_a : out std_logic;
    bram_en_a : out std_logic;
    bram_we_a : out std_logic_vector(3 downto 0);
    bram_addr_a : out std_logic_vector(12 downto 0);
    bram_wrdata_a : out std_logic_vector(31 downto 0);
    bram_rddata_a : in std_logic_vector(31 downto 0)
);
end axi_bram_ctrl_wrapper;

architecture implementation of axi_bram_ctrl_wrapper is

component ip_axi_bram_ctrl
  port (
    s_axi_aclk : in std_logic;
    s_axi_aresetn : in std_logic;
    s_axi_awid : in std_logic_vector(0 downto 0);
    s_axi_awaddr : in std_logic_vector(12 downto 0);
    s_axi_awlen : in std_logic_vector(7 downto 0);
    s_axi_awsize : in std_logic_vector(2 downto 0);
    s_axi_awburst : in std_logic_vector(1 downto 0);
    s_axi_awlock : in std_logic;
    s_axi_awcache : in std_logic_vector(3 downto 0);
    s_axi_awprot : in std_logic_vector(2 downto 0);
    s_axi_awvalid : in std_logic;
    s_axi_awready : out std_logic;
    s_axi_wdata : in std_logic_vector(31 downto 0);
    s_axi_wstrb : in std_logic_vector(3 downto 0);
    s_axi_wlast : in std_logic;
    s_axi_wvalid : in std_logic;
    s_axi_wready : out std_logic;
    s_axi_bid : out std_logic_vector(0 downto 0);
    s_axi_bresp : out std_logic_vector(1 downto 0);
    s_axi_bvalid : out std_logic;
    s_axi_bready : in std_logic;
    s_axi_arid : in std_logic_vector(0 downto 0);
    s_axi_araddr : in std_logic_vector(12 downto 0);
    s_axi_arlen : in std_logic_vector(7 downto 0);
    s_axi_arsize : in std_logic_vector(2 downto 0);
    s_axi_arburst : in std_logic_vector(1 downto 0);
    s_axi_arlock : in std_logic;
    s_axi_arcache : in std_logic_vector(3 downto 0);
    s_axi_arprot : in std_logic_vector(2 downto 0);
    s_axi_arvalid : in std_logic;
    s_axi_arready : out std_logic;
    s_axi_rid : out std_logic_vector(0 downto 0);
    s_axi_rdata : out std_logic_vector(31 downto 0);
    s_axi_rresp : out std_logic_vector(1 downto 0);
    s_axi_rlast : out std_logic;
    s_axi_rvalid : out std_logic;
    s_axi_rready : in std_logic;
    bram_rst_a : out std_logic;
    bram_clk_a : out std_logic;
    bram_en_a : out std_logic;
    bram_we_a : out std_logic_vector(3 downto 0);
    bram_addr_a : out std_logic_vector(12 downto 0);
    bram_wrdata_a : out std_logic_vector(31 downto 0);
    bram_rddata_a : in std_logic_vector(31 downto 0)
  );
end component;

ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
ATTRIBUTE SYN_BLACK_BOX OF ip_axi_bram_ctrl : COMPONENT IS TRUE;
ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
ATTRIBUTE BLACK_BOX_PAD_PIN OF ip_axi_bram_ctrl : COMPONENT IS "s_axi_aclk,s_axi_aresetn,s_axi_awid[0:0],s_axi_awaddr[12:0],s_axi_awlen[7:0],s_axi_awsize[2:0],s_axi_awburst[1:0],s_axi_awlock,s_axi_awcache[3:0],s_axi_awprot[2:0],s_axi_awvalid,s_axi_awready,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_wlast,s_axi_wvalid,s_axi_wready,s_axi_bid[0:0],s_axi_bresp[1:0],s_axi_bvalid,s_axi_bready,s_axi_arid[0:0],s_axi_araddr[12:0],s_axi_arlen[7:0],s_axi_arsize[2:0],s_axi_arburst[1:0],s_axi_arlock,s_axi_arcache[3:0],s_axi_arprot[2:0],s_axi_arvalid,s_axi_arready,s_axi_rid[0:0],s_axi_rdata[31:0],s_axi_rresp[1:0],s_axi_rlast,s_axi_rvalid,s_axi_rready,bram_rst_a,bram_clk_a,bram_en_a,bram_we_a[3:0],bram_addr_a[12:0],bram_wrdata_a[31:0],bram_rddata_a[31:0]";

begin

inst_ip_axi_bram_ctrl : ip_axi_bram_ctrl
  port map (
    s_axi_aclk => s_axi_aclk,
    s_axi_aresetn => s_axi_aresetn,
    s_axi_awid => "0",
    s_axi_awaddr => Axi_Mosi.awaddr(12 downto 0),
    s_axi_awlen => Axi_Mosi.awlen,
    s_axi_awsize => Axi_Mosi.awsize,
    s_axi_awburst => Axi_Mosi.awburst,
    s_axi_awlock => Axi_Mosi.awlock(0),
    s_axi_awcache => Axi_Mosi.awcache,
    s_axi_awprot => Axi_Mosi.awprot,
    s_axi_awvalid => Axi_Mosi.awvalid,
    s_axi_awready => Axi_Miso.awready,
    s_axi_wdata => Axi_Mosi.wdata,
    s_axi_wstrb => Axi_Mosi.wstrb,
    s_axi_wlast => Axi_Mosi.wlast,
    s_axi_wvalid => Axi_Mosi.wvalid,
    s_axi_wready => Axi_Miso.wready,
    --s_axi_bid => ,
    s_axi_bresp => Axi_Miso.bresp,
    s_axi_bvalid => Axi_Miso.bvalid,
    s_axi_bready => Axi_Mosi.bready,
    s_axi_arid => "0",
    s_axi_araddr => Axi_Mosi.araddr(12 downto 0),
    s_axi_arlen => Axi_Mosi.arlen,
    s_axi_arsize => Axi_Mosi.arsize,
    s_axi_arburst => Axi_Mosi.arburst,
    s_axi_arlock => Axi_Mosi.arlock(0),
    s_axi_arcache => Axi_Mosi.arcache,
    s_axi_arprot => Axi_Mosi.arprot,
    s_axi_arvalid => Axi_Mosi.arvalid,
    s_axi_arready => Axi_Miso.arready,
    --s_axi_rid => ,
    s_axi_rdata => Axi_Miso.rdata,
    s_axi_rresp => Axi_Miso.rresp,
    s_axi_rlast => Axi_Miso.rlast,
    s_axi_rvalid => Axi_Miso.rvalid,
    s_axi_rready => Axi_Mosi.rready,
    bram_rst_a => bram_rst_a,
    bram_clk_a => bram_clk_a,
    bram_en_a => bram_en_a,
    bram_we_a => bram_we_a,
    bram_addr_a => bram_addr_a,
    bram_wrdata_a => bram_wrdata_a,
    bram_rddata_a => bram_rddata_a
  );

end implementation;

