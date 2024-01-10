------------------------------------------------------------------
--!   @file : axis32_reg_wrap
--!   @brief
--!   @details: ce module permet de registrer un lien axis 16
--!   $Rev: 23412 $
--!   $Author: elarouche $
--!   $Date: 2019-04-29 13:28:37 -0400 (Mon, 29 Apr 2019) $
--!   $Id: axis16_reg_wrap.vhd 23412 2019-04-29 17:28:37Z elarouche $
--!   $URL: http://einstein/svn/firmware/FIR-00251-Common/branchs/2023-09-26_BRAM_Optimisation/VHDL/Utilities/axis16_reg_wrap.vhd $
------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;           
use IEEE.numeric_std.ALL;
use work.Tel2000.all;

entity axis32_reg_wrap is
   port(
      ARESETN        : in std_logic;
      CLK            : in std_logic;      
      
      RX_MOSI        : in t_axi4_stream_mosi32;
      RX_MISO        : out t_axi4_stream_miso;
      
      TX_MOSI        : out t_axi4_stream_mosi32;
      TX_MISO        : in t_axi4_stream_miso
      );
end axis32_reg_wrap;



architecture rtl of axis32_reg_wrap is
   
   COMPONENT ip_axis32_reg
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
         m_axis_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axis_tstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
         m_axis_tkeep : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
         m_axis_tlast : OUT STD_LOGIC;
         m_axis_tid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
         m_axis_tdest : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         m_axis_tuser : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
      );
   END COMPONENT;
   
begin
   
   U1 : ip_axis32_reg
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
