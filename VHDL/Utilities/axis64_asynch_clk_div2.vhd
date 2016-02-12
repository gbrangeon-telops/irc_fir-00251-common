------------------------------------------------------------------
--!   @file : t_axi4_stream64_fifo
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
use IEEE.numeric_std.all; 
use work.tel2000.all;

entity axis64_asynch_clk_div2 is
   port(
      ARESETN  : in std_logic;
      
      -- slave side (write channel only)
      RX_CLK   : in std_logic;
      RX_MOSI  : in t_axi4_stream_mosi64;
      RX_MISO  : out t_axi4_stream_miso;
      
      -- master side 
      TX_CLK   : in std_logic;
      TX_MOSI  : out t_axi4_stream_mosi64;
      TX_MISO  : in t_axi4_stream_miso

      );
end axis64_asynch_clk_div2;

architecture rtl of axis64_asynch_clk_div2 is
   
COMPONENT axis_clock_converter_div2
  PORT (
    s_axis_aresetn : IN STD_LOGIC;
    m_axis_aresetn : IN STD_LOGIC;
    s_axis_aclk : IN STD_LOGIC;
    s_axis_tvalid : IN STD_LOGIC;
    s_axis_tready : OUT STD_LOGIC;
    s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_axis_tstrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_axis_tkeep : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_axis_tlast : IN STD_LOGIC;
    s_axis_tid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_axis_tdest : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s_axis_tuser : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_aclk : IN STD_LOGIC;
    m_axis_tvalid : OUT STD_LOGIC;
    m_axis_tready : IN STD_LOGIC;
    m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axis_tstrb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axis_tkeep : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axis_tlast : OUT STD_LOGIC;
    m_axis_tid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axis_tdest : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axis_tuser : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;
ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
ATTRIBUTE SYN_BLACK_BOX OF axis_clock_converter_div2 : COMPONENT IS TRUE;
ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
ATTRIBUTE BLACK_BOX_PAD_PIN OF axis_clock_converter_div2 : COMPONENT IS "s_axis_aresetn,m_axis_aresetn,s_axis_aclk,s_axis_tvalid,s_axis_tready,s_axis_tdata[63:0],s_axis_tstrb[7:0],s_axis_tkeep[7:0],s_axis_tlast,s_axis_tid[0:0],s_axis_tdest[2:0],s_axis_tuser[15:0],m_axis_aclk,m_axis_tvalid,m_axis_tready,m_axis_tdata[63:0],m_axis_tstrb[7:0],m_axis_tkeep[7:0],m_axis_tlast,m_axis_tid[0:0],m_axis_tdest[2:0],m_axis_tuser[15:0]";

   
begin
   
axis_clock_converter_div2_inst : axis_clock_converter_div2
  PORT MAP (
    s_axis_aresetn => ARESETN,
    m_axis_aresetn => ARESETN,
    s_axis_aclk => RX_CLK,
    s_axis_tvalid => RX_MOSI.TVALID,
    s_axis_tready => RX_MISO.TREADY,
    s_axis_tdata => RX_MOSI.TDATA,
    s_axis_tstrb => RX_MOSI.TSTRB,
    s_axis_tkeep => RX_MOSI.TKEEP,
    s_axis_tlast => RX_MOSI.TLAST,
    s_axis_tid => RX_MOSI.TID,
    s_axis_tdest => RX_MOSI.TDEST,
    s_axis_tuser => RX_MOSI.TUSER,
    m_axis_aclk => TX_CLK,
    m_axis_tvalid => TX_MOSI.TVALID,
    m_axis_tready => TX_MISO.TREADY,
    m_axis_tdata => TX_MOSI.TDATA,
    m_axis_tstrb => TX_MOSI.TSTRB,
    m_axis_tkeep => TX_MOSI.TKEEP,
    m_axis_tlast => TX_MOSI.TLAST,
    m_axis_tid => TX_MOSI.TID,
    m_axis_tdest => TX_MOSI.TDEST,
    m_axis_tuser => TX_MOSI.TUSER
  );

   
end rtl;
