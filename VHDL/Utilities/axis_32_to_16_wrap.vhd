------------------------------------------------------------------
--!   @file : axis_32_to_16_wrap
--!   @brief
--!   @details: ce module permet de transformer un lien axis 32 en axis 16 en sortant les deux données sur 2 coups d'horloge (pix1pix0 => pix0 puis pix1)
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

entity axis_32_to_16_wrap is
   port(
      ARESETN        : in std_logic;
      CLK            : in std_logic;      
      
      RX_MOSI        : in t_axi4_stream_mosi32;
      RX_MISO        : out t_axi4_stream_miso;
      
      TX_MOSI        : out t_axi4_stream_mosi16;
      TX_MISO        : in t_axi4_stream_miso
      );
end axis_32_to_16_wrap;



architecture rtl of axis_32_to_16_wrap is
   
COMPONENT axis_32_to_16
  PORT (
    aclk : IN STD_LOGIC;
    aresetn : IN STD_LOGIC;
    s_axis_tvalid : IN STD_LOGIC;
    s_axis_tready : OUT STD_LOGIC;
    s_axis_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_tstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axis_tkeep : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axis_tlast : IN STD_LOGIC;
    s_axis_tid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_axis_tdest : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s_axis_tuser : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axis_tvalid : OUT STD_LOGIC;
    m_axis_tready : IN STD_LOGIC;
    m_axis_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_tstrb : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axis_tkeep : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axis_tlast : OUT STD_LOGIC;
    m_axis_tid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axis_tdest : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axis_tuser : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END COMPONENT;

   
begin

U1 : axis_32_to_16
  PORT MAP (
    aclk => CLK,
    aresetn => ARESETN,
    s_axis_tvalid    => RX_MOSI.tvalid,
    s_axis_tready    => RX_MISO.tready,
    s_axis_tdata     => RX_MOSI.tdata,
    s_axis_tstrb     => RX_MOSI.tstrb,
    s_axis_tkeep     => RX_MOSI.tkeep,
    s_axis_tlast     => RX_MOSI.tlast,
    s_axis_tid       => RX_MOSI.tid,
    s_axis_tdest     => RX_MOSI.tdest,
    s_axis_tuser     => RX_MOSI.tuser,
    m_axis_tvalid    => TX_MOSI.tvalid,
    m_axis_tready    => TX_MISO.tready,
    m_axis_tdata     => TX_MOSI.tdata,
    m_axis_tstrb     => TX_MOSI.tstrb,
    m_axis_tkeep     => TX_MOSI.tkeep,
    m_axis_tlast     => TX_MOSI.tlast,
    m_axis_tid       => TX_MOSI.tid,
    m_axis_tdest     => TX_MOSI.tdest,
    m_axis_tuser     => TX_MOSI.tuser
  );
  
end rtl;
