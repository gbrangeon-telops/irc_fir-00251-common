-------------------------------------------------------------------------------
--
-- Title       : axis32_fanout3
-- Author      : PDU / KBE
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- Description : 
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;   
use ieee.numeric_std.all;
use ieee.numeric_std.all;
use work.tel2000.all;

entity axis32_fanout3 is
   port(
      ARESETN    : in  std_logic;
      CLK        : in  std_logic;
      
      RX_MOSI    : in  t_axi4_stream_mosi32;      
      RX_MISO    : out t_axi4_stream_miso;  
      
      TX0_MOSI   : out t_axi4_stream_mosi32;
      TX0_MISO   : in t_axi4_stream_miso;      
      
      TX1_MOSI   : out t_axi4_stream_mosi32;
      TX1_MISO   : in t_axi4_stream_miso;
            
      TX2_MOSI   : out t_axi4_stream_mosi32;
      TX2_MISO   : in t_axi4_stream_miso  
      
      );
end axis32_fanout3;

architecture RTL of axis32_fanout3 is 
   
   signal m_axis_tvalid  :  std_logic_vector(2 downto 0);
   signal m_axis_tready  :  std_logic_vector(2 downto 0);
   signal m_axis_tdata   :  std_logic_vector(95 downto 0);
   signal m_axis_tstrb   :  std_logic_vector(11 downto 0);
   signal m_axis_tkeep   :  std_logic_vector(11 downto 0);
   signal m_axis_tlast   :  std_logic_vector(2 downto 0);
   signal m_axis_tid     :  std_logic_vector(2 downto 0);
   signal m_axis_tdest   :  std_logic_vector(8 downto 0);
   signal m_axis_tuser   :  std_logic_vector(23 downto 0);
   
   component ip_axis32_fanout3
      PORT (
         aclk          : in std_logic;
         aresetn       : in std_logic;
         s_axis_tvalid : in std_logic;
         s_axis_tready : out STD_LOGIC;
         s_axis_tdata  : in std_logic_vector(31 downto 0);
         s_axis_tstrb  : in std_logic_vector(3 downto 0);
         s_axis_tkeep  : in std_logic_vector(3 downto 0);
         s_axis_tlast  : in std_logic;
         s_axis_tid    : in std_logic_vector(0 downto 0);
         s_axis_tdest  : in std_logic_vector(2 downto 0);
         s_axis_tuser  : in std_logic_vector(7 downto 0);
         m_axis_tvalid : out std_logic_vector(2 downto 0);
         m_axis_tready : in std_logic_vector(2 downto 0);
         m_axis_tdata  : out std_logic_vector(95 downto 0);
         m_axis_tstrb  : out std_logic_vector(11 downto 0);
         m_axis_tkeep  : out std_logic_vector(11 downto 0);
         m_axis_tlast  : out std_logic_vector(2 downto 0);
         m_axis_tid    : out std_logic_vector(2 downto 0);
         m_axis_tdest  : out std_logic_vector(8 downto 0);
         m_axis_tuser  : out std_logic_vector(23 downto 0)
         );
   end component;
   
   
   
begin
   
   TX0_MOSI.TVALID <= m_axis_tvalid(0);   
   TX0_MOSI.TDATA  <= m_axis_tdata(31 downto 0);
   TX0_MOSI.TSTRB  <= m_axis_tstrb(3 downto 0);
   TX0_MOSI.TKEEP  <= m_axis_tkeep(3 downto 0);
   TX0_MOSI.TLAST  <= m_axis_tlast(0);
   TX0_MOSI.TID    <= (others => m_axis_tid(0));
   TX0_MOSI.TDEST  <= m_axis_tdest(2 downto 0);
   TX0_MOSI.TUSER <= m_axis_tuser(7 downto 0);
   m_axis_tready(0)<= TX0_MISO.TREADY;
   
   
   TX1_MOSI.TVALID <= m_axis_tvalid(1);   
   TX1_MOSI.TDATA  <= m_axis_tdata(63 downto 32);
   TX1_MOSI.TSTRB  <= m_axis_tstrb(7 downto 4);
   TX1_MOSI.TKEEP  <= m_axis_tkeep(7 downto 4);
   TX1_MOSI.TLAST  <= m_axis_tlast(1);
   TX1_MOSI.TID    <= (others => m_axis_tid(1));
   TX1_MOSI.TDEST  <= m_axis_tdest(5 downto 3);
   TX1_MOSI.TUSER <= m_axis_tuser(15 downto 8);
   m_axis_tready(1)<= TX1_MISO.TREADY; 
   
   TX2_MOSI.TVALID <= m_axis_tvalid(2);   
   TX2_MOSI.TDATA  <= m_axis_tdata(95 downto 64);
   TX2_MOSI.TSTRB  <= m_axis_tstrb(7 downto 4);
   TX2_MOSI.TKEEP  <= m_axis_tkeep(7 downto 4);
   TX2_MOSI.TLAST  <= m_axis_tlast(2);
   TX2_MOSI.TID    <= (others => m_axis_tid(2));
   TX2_MOSI.TDEST  <= m_axis_tdest(8 downto 6);
   TX2_MOSI.TUSER <= m_axis_tuser(23 downto 16);
   m_axis_tready(2)<= TX1_MISO.TREADY;
   
   
   U1 : ip_axis32_fanout3
   port map (
      aclk           => CLK,
      aresetn        => ARESETN,
      
      s_axis_tvalid  => RX_MOSI.TVALID,
      s_axis_tready  => RX_MISO.TREADY,
      s_axis_tdata   => RX_MOSI.TDATA,
      s_axis_tstrb   => RX_MOSI.TSTRB,
      s_axis_tkeep   => RX_MOSI.TKEEP,
      s_axis_tlast   => RX_MOSI.TLAST,
      s_axis_tid     => RX_MOSI.TID,
      s_axis_tdest   => RX_MOSI.TDEST,
      s_axis_tuser   => RX_MOSI.TUSER,
      
      m_axis_tvalid  => m_axis_tvalid,
      m_axis_tready  => m_axis_tready,
      m_axis_tdata   => m_axis_tdata,
      m_axis_tstrb   => m_axis_tstrb,
      m_axis_tkeep   => m_axis_tkeep,
      m_axis_tlast   => m_axis_tlast,
      m_axis_tid     => m_axis_tid,
      m_axis_tdest   => m_axis_tdest,
      m_axis_tuser   => m_axis_tuser
      );
   
   
end RTL;


