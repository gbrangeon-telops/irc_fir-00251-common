------------------------------------------------------------------
--!   @file : axis16_clkdiv2_wrap
--!   @brief
--!   @details: Ce module divise une clk synchrone par 2
--!
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

entity axis16_clkdiv2_lite_wrap is
   port(
      ARESETN        : in std_logic;
      CLK2X            : in std_logic;      
      CLK1X            : in std_logic;
      
      AXIS16_2X_MOSI     : in t_axi4_stream_mosi16_lite;
      AXIS16_2X_MISO     : out t_axi4_stream_miso;
      
      AXIS16_1X_MOSI     : out t_axi4_stream_mosi16_lite;
      AXIS16_1X_MISO     : in t_axi4_stream_miso
      );
end axis16_clkdiv2_lite_wrap;



architecture rtl of axis16_clkdiv2_lite_wrap is

COMPONENT axis16_clkdiv2_lite
  PORT (
    s_axis_aresetn : IN STD_LOGIC;
    m_axis_aresetn : IN STD_LOGIC;
    s_axis_aclk : IN STD_LOGIC;
    s_axis_tvalid : IN STD_LOGIC;
    s_axis_tready : OUT STD_LOGIC;
    s_axis_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    s_axis_tkeep : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axis_tlast : IN STD_LOGIC;
    m_axis_aclk : IN STD_LOGIC;
    m_axis_tvalid : OUT STD_LOGIC;
    m_axis_tready : IN STD_LOGIC;
    m_axis_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_tkeep : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axis_tlast : OUT STD_LOGIC
  );
END COMPONENT;
ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
ATTRIBUTE SYN_BLACK_BOX OF axis16_clkdiv2_lite : COMPONENT IS TRUE;
ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
ATTRIBUTE BLACK_BOX_PAD_PIN OF axis16_clkdiv2_lite : COMPONENT IS "s_axis_aresetn,m_axis_aresetn,s_axis_aclk,s_axis_tvalid,s_axis_tready,s_axis_tdata[15:0],s_axis_tkeep[1:0],s_axis_tlast,m_axis_aclk,m_axis_tvalid,m_axis_tready,m_axis_tdata[15:0],m_axis_tkeep[1:0],m_axis_tlast";

   
begin

axis_clk_div2 : axis16_clkdiv2_lite
  PORT MAP (
    s_axis_aresetn   => ARESETN,
    m_axis_aresetn   => ARESETN,
    
    s_axis_aclk      => CLK2X,
    
    s_axis_tvalid    => AXIS16_2X_MOSI.tvalid,
    s_axis_tready    => AXIS16_2X_MISO.tready,
    s_axis_tdata     => AXIS16_2X_MOSI.tdata,
    s_axis_tkeep     => AXIS16_2X_MOSI.tkeep,
    s_axis_tlast     => AXIS16_2X_MOSI.tlast,

    
    m_axis_aclk      => CLK1X,
    
    m_axis_tvalid    => AXIS16_1X_MOSI.tvalid,
    m_axis_tready    => AXIS16_1X_MISO.tready,
    m_axis_tdata     => AXIS16_1X_MOSI.tdata,
    m_axis_tkeep     => AXIS16_1X_MOSI.tkeep,
    m_axis_tlast     => AXIS16_1X_MOSI.tlast
  );
  
end rtl;
