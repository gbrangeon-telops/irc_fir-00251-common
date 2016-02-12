------------------------------------------------------------------
--!   @file : axis32_to_native
--!   @brief
--!   @details: ce module permet de transformer un lien axis 32 en axis 16
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

entity axis_32_to_16_lite_wrap is
   port(
      ARESETN        : in std_logic;
      CLK            : in std_logic;      
      
      AXIS32_MOSI     : in t_axi4_stream_mosi32_lite;
      AXIS32_MISO     : out t_axi4_stream_miso;
      
      AXIS16_MOSI     : out t_axi4_stream_mosi16_lite;
      AXIS16_MISO     : in t_axi4_stream_miso
      );
end axis_32_to_16_lite_wrap;



architecture rtl of axis_32_to_16_lite_wrap is
   
COMPONENT axis_32_to_16_lite
  PORT (
    aclk : IN STD_LOGIC;
    aresetn : IN STD_LOGIC;
    s_axis_tvalid : IN STD_LOGIC;
    s_axis_tready : OUT STD_LOGIC;
    s_axis_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_tkeep : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axis_tlast : IN STD_LOGIC;
    m_axis_tvalid : OUT STD_LOGIC;
    m_axis_tready : IN STD_LOGIC;
    m_axis_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_tkeep : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axis_tlast : OUT STD_LOGIC
  );
END COMPONENT;
ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
ATTRIBUTE SYN_BLACK_BOX OF axis_32_to_16_lite : COMPONENT IS TRUE;
ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
ATTRIBUTE BLACK_BOX_PAD_PIN OF axis_32_to_16_lite : COMPONENT IS "aclk,aresetn,s_axis_tvalid,s_axis_tready,s_axis_tdata[31:0],s_axis_tkeep[3:0],s_axis_tlast,m_axis_tvalid,m_axis_tready,m_axis_tdata[15:0],m_axis_tkeep[1:0],m_axis_tlast";

   
begin

axis32_16_lite : axis_32_to_16_lite
  PORT MAP (
    aclk => CLK,
    aresetn => ARESETN,
    s_axis_tvalid    => axis32_mosi.tvalid,
    s_axis_tready    => axis32_miso.tready,
    s_axis_tdata     => axis32_mosi.tdata,
    s_axis_tkeep     => axis32_mosi.tkeep,
    s_axis_tlast     => axis32_mosi.tlast,
    m_axis_tvalid    => axis16_mosi.tvalid,
    m_axis_tready    => axis16_miso.tready,
    m_axis_tdata     => axis16_mosi.tdata,
    m_axis_tkeep     => axis16_mosi.tkeep,
    m_axis_tlast     => axis16_mosi.tlast
  );
  
end rtl;
