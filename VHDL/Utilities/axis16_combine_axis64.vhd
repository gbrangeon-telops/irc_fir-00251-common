-------------------------------------------------------------------------------
--
-- Title       : axis16_combine_axis64
-- Author      : ODI
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- Description : Combines 4 axis16 in 1 axis64 (RX0 = pix0, RX1 = pix1, RX2 = pix2 and RX3 = pix3 -> TX = pix3pix2pix1pix0)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;   
use ieee.numeric_std.all;
use work.tel2000.all;

entity axis16_combine_axis64 is
   port(
      ARESETN    : in  std_logic;
      CLK        : in  std_logic;
      
      RX0_MOSI   : in  t_axi4_stream_mosi16;
      RX0_MISO   : out t_axi4_stream_miso;
      
      RX1_MOSI   : in  t_axi4_stream_mosi16;
      RX1_MISO   : out t_axi4_stream_miso;
      
      RX2_MOSI   : in  t_axi4_stream_mosi16;
      RX2_MISO   : out t_axi4_stream_miso;
      
      RX3_MOSI   : in  t_axi4_stream_mosi16;
      RX3_MISO   : out t_axi4_stream_miso;
      
      TX_MOSI    : out t_axi4_stream_mosi64;
      TX_MISO    : in  t_axi4_stream_miso;
      
      ERR        : out std_logic_vector(2 downto 0)
      );
end axis16_combine_axis64;

architecture RTL of axis16_combine_axis64 is 
   
   signal s_axis_tvalid : std_logic_vector(3 downto 0);
   signal s_axis_tready : std_logic_vector(3 downto 0);
   signal s_axis_tdata : std_logic_vector(63 downto 0);
   signal s_axis_tstrb : std_logic_vector(7 downto 0);
   signal s_axis_tkeep : std_logic_vector(7 downto 0);
   signal s_axis_tlast : std_logic_vector(3 downto 0);
   signal s_axis_tid : std_logic_vector(3 downto 0);
   signal s_axis_tdest : std_logic_vector(11 downto 0);
   signal s_axis_tuser : std_logic_vector(15 downto 0);
   signal s0_cmd_err : std_logic_vector(2 downto 0);
   signal s1_cmd_err : std_logic_vector(2 downto 0);
   signal s2_cmd_err : std_logic_vector(2 downto 0);
   signal s3_cmd_err : std_logic_vector(2 downto 0);
   
   COMPONENT ip_axis16_combine_axis64
      PORT (
         aclk : IN STD_LOGIC;
         aresetn : IN STD_LOGIC;
         s_axis_tvalid : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         s_axis_tready : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
         s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
         s_axis_tstrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tkeep : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tlast : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         s_axis_tid : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         s_axis_tdest : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
         s_axis_tuser : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         m_axis_tvalid : OUT STD_LOGIC;
         m_axis_tready : IN STD_LOGIC;
         m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
         m_axis_tstrb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tkeep : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tlast : OUT STD_LOGIC;
         m_axis_tid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
         m_axis_tdest : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         m_axis_tuser : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         s_cmd_err : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
      );
   END COMPONENT;
   
   
   
begin
   
   RX0_MISO.tready <= s_axis_tready(0);
   RX1_MISO.tready <= s_axis_tready(1);
   RX2_MISO.tready <= s_axis_tready(2);
   RX3_MISO.tready <= s_axis_tready(3);
   
   s_axis_tvalid <= RX3_MOSI.tvalid & RX2_MOSI.tvalid & RX1_MOSI.tvalid & RX0_MOSI.tvalid;
   s_axis_tdata <= RX3_MOSI.tdata & RX2_MOSI.tdata & RX1_MOSI.tdata & RX0_MOSI.tdata;
   s_axis_tstrb <= RX3_MOSI.tstrb & RX2_MOSI.tstrb & RX1_MOSI.tstrb & RX0_MOSI.tstrb;
   s_axis_tkeep <= RX3_MOSI.tkeep & RX2_MOSI.tkeep & RX1_MOSI.tkeep & RX0_MOSI.tkeep;
   s_axis_tlast <= RX3_MOSI.tlast & RX2_MOSI.tlast & RX1_MOSI.tlast & RX0_MOSI.tlast;
   s_axis_tid <= RX3_MOSI.tid & RX2_MOSI.tid & RX1_MOSI.tid & RX0_MOSI.tid;
   s_axis_tdest <= RX3_MOSI.tdest & RX2_MOSI.tdest & RX1_MOSI.tdest & RX0_MOSI.tdest;
   s_axis_tuser <= RX3_MOSI.tuser & RX2_MOSI.tuser & RX1_MOSI.tuser & RX0_MOSI.tuser;
   
   ERR <= s0_cmd_err or s1_cmd_err or s2_cmd_err or s3_cmd_err;
   
   
   U1 : ip_axis16_combine_axis64
   port map (
      aclk => CLK,
      aresetn => ARESETN,
      
      s_axis_tvalid => s_axis_tvalid,
      s_axis_tready => s_axis_tready,
      s_axis_tdata => s_axis_tdata,
      s_axis_tstrb => s_axis_tstrb,
      s_axis_tkeep => s_axis_tkeep,
      s_axis_tlast => s_axis_tlast,
      s_axis_tid => s_axis_tid,
      s_axis_tdest => s_axis_tdest,
      s_axis_tuser => s_axis_tuser,
      
      m_axis_tvalid => TX_MOSI.tvalid,
      m_axis_tready => TX_MISO.tready,
      m_axis_tdata => TX_MOSI.tdata,
      m_axis_tstrb => TX_MOSI.tstrb,
      m_axis_tkeep => TX_MOSI.tkeep,
      m_axis_tlast => TX_MOSI.tlast,
      m_axis_tid => TX_MOSI.tid,
      m_axis_tdest => TX_MOSI.tdest,
      m_axis_tuser => TX_MOSI.tuser,
      
      -- When S00 is primary slave: s_cmd_err(11:9) => errors and others => gnd
      -- When S01 is primary slave: s_cmd_err(8:6) => errors and others => gnd
      -- When S03 is primary slave: s_cmd_err(2:0) => errors and others => gnd
      s_cmd_err(11 downto 9) => s0_cmd_err,
      s_cmd_err(8 downto 6) => s1_cmd_err,
      s_cmd_err(5 downto 3) => s2_cmd_err,
      s_cmd_err(2 downto 0) => s3_cmd_err
      );
   
   
end RTL;


