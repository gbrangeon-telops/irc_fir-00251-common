-------------------------------------------------------------------------------
--
-- Title       : axis128_split_axis64
-- Author      : ODI
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- Description : Splits 1 axis128 in 2 axis64 (RX = pixdata1pixdata0 -> TX0 = pixdata0 and TX1 = pixdata1)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;   
use ieee.numeric_std.all;
use work.tel2000.all;

entity axis128_split_axis64 is
   port(
      ARESETN    : in  std_logic;
      CLK        : in  std_logic;
      
      RX_MOSI    : in  t_axi4_stream_mosi128;      
      RX_MISO    : out t_axi4_stream_miso;  
      
      TX0_MOSI   : out t_axi4_stream_mosi64;
      TX0_MISO   : in t_axi4_stream_miso;      
      
      TX1_MOSI   : out t_axi4_stream_mosi64;
      TX1_MISO   : in t_axi4_stream_miso   
      
      );
end axis128_split_axis64;

architecture RTL of axis128_split_axis64 is 
   
   signal m_axis_tvalid  :  std_logic_vector(1 downto 0);
   signal m_axis_tready  :  std_logic_vector(1 downto 0);
   signal m_axis_tdata   :  std_logic_vector(127 downto 0);
   signal m_axis_tlast   :  std_logic_vector(1 downto 0);
   signal m_axis_tid     :  std_logic_vector(1 downto 0);
   signal m_axis_tdest   :  std_logic_vector(5 downto 0);
   signal m_axis_tuser   :  std_logic_vector(31 downto 0);
   
   COMPONENT ip_axis128_split_axis64
      PORT (
         aclk : IN STD_LOGIC;
         aresetn : IN STD_LOGIC;
         s_axis_tvalid : IN STD_LOGIC;
         s_axis_tready : OUT STD_LOGIC;
         s_axis_tdata : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
         s_axis_tlast : IN STD_LOGIC;
         s_axis_tid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
         s_axis_tdest : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         s_axis_tuser : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axis_tvalid : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
         m_axis_tready : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
         m_axis_tdata : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
         m_axis_tlast : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
         m_axis_tid : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
         m_axis_tdest : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
         m_axis_tuser : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
      );
   END COMPONENT;
   
   
   
begin
   
   TX0_MOSI.TVALID <= m_axis_tvalid(0);   
   TX0_MOSI.TDATA  <= m_axis_tdata(63 downto 0);
   TX0_MOSI.TSTRB  <= (others => '1');    -- not supported by IP
   TX0_MOSI.TKEEP  <= (others => '1');    -- not supported by IP
   TX0_MOSI.TLAST  <= m_axis_tlast(0);
   TX0_MOSI.TID    <= (others => m_axis_tid(0));
   TX0_MOSI.TDEST  <= m_axis_tdest(2 downto 0);
   TX0_MOSI.TUSER  <= m_axis_tuser(15 downto 0);
   m_axis_tready(0)<= TX0_MISO.TREADY;
   
   
   TX1_MOSI.TVALID <= m_axis_tvalid(1);   
   TX1_MOSI.TDATA  <= m_axis_tdata(127 downto 64);
   TX1_MOSI.TSTRB  <= (others => '1');    -- not supported by IP
   TX1_MOSI.TKEEP  <= (others => '1');    -- not supported by IP
   TX1_MOSI.TLAST  <= m_axis_tlast(1);
   TX1_MOSI.TID    <= (others => m_axis_tid(1));
   TX1_MOSI.TDEST  <= m_axis_tdest(5 downto 3);
   TX1_MOSI.TUSER  <= m_axis_tuser(31 downto 16);
   m_axis_tready(1)<= TX1_MISO.TREADY;
   
   
   U1 : ip_axis128_split_axis64
   port map (
      aclk           => CLK,
      aresetn        => ARESETN,
      
      s_axis_tvalid  => RX_MOSI.TVALID,
      s_axis_tready  => RX_MISO.TREADY,
      s_axis_tdata   => RX_MOSI.TDATA,
      s_axis_tlast   => RX_MOSI.TLAST,
      s_axis_tid     => RX_MOSI.TID,
      s_axis_tdest   => RX_MOSI.TDEST,
      s_axis_tuser   => RX_MOSI.TUSER,
      
      m_axis_tvalid  => m_axis_tvalid,
      m_axis_tready  => m_axis_tready,
      m_axis_tdata   => m_axis_tdata,
      m_axis_tlast   => m_axis_tlast,
      m_axis_tid     => m_axis_tid,
      m_axis_tdest   => m_axis_tdest,
      m_axis_tuser   => m_axis_tuser
      );
   
   
end RTL;


