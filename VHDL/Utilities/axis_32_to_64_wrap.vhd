------------------------------------------------------------------
--!   @file : axis_32_to_64_wrap
--!   @brief
--!   @details: ce module permet de transformer un lien axis 64 en axis 32 en sortant les deux données sur 2 coups d'horloge (pix3pix2pix1pix0 => pix1pix0 puis pix3pix2)
--!   $Rev$
--!   $Author$
--!   $Date$
--!   $Id$
--!   $URL$
------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;           
use IEEE.numeric_std.ALL;
use work.Tel2000.all;

entity axis_32_to_64_wrap is
   port(
      ARESETN        : in std_logic;
      CLK            : in std_logic;      
      
      RX_MOSI        : in t_axi4_stream_mosi32;
      RX_MISO        : out t_axi4_stream_miso;
      
      TX_MOSI        : out t_axi4_stream_mosi64;
      TX_MISO        : in t_axi4_stream_miso
      );
end axis_32_to_64_wrap;



architecture rtl of axis_32_to_64_wrap is
   
COMPONENT ip_axis_32_to_64
  PORT (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
END COMPONENT;

   
begin

U1 : ip_axis_32_to_64
  PORT MAP (
    aclk => CLK,
    aresetn => ARESETN,
    m_axis_tvalid    => TX_MOSI.tvalid,
    m_axis_tready    => TX_MISO.tready,
    m_axis_tdata     => TX_MOSI.tdata,
    m_axis_tstrb     => TX_MOSI.tstrb,
    m_axis_tkeep     => TX_MOSI.tkeep,
    m_axis_tlast     => TX_MOSI.tlast,
    m_axis_tid       => TX_MOSI.tid,
    m_axis_tdest     => TX_MOSI.tdest,
    m_axis_tuser     => TX_MOSI.tuser,
    
    s_axis_tvalid    => RX_MOSI.tvalid,
    s_axis_tready    => RX_MISO.tready,
    s_axis_tdata     => RX_MOSI.tdata,
    s_axis_tstrb     => RX_MOSI.tstrb,
    s_axis_tkeep     => RX_MOSI.tkeep,
    s_axis_tlast     => RX_MOSI.tlast,
    s_axis_tid       => RX_MOSI.tid,
    s_axis_tdest     => RX_MOSI.tdest,
    s_axis_tuser     => RX_MOSI.tuser
  );
  
end rtl;
