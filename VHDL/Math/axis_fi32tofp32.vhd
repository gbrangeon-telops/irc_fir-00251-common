-------------------------------------------------------------------------------
--
-- Title       : axis_fi32tofp32
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
use work.tel2000.all;

entity axis_fi32tofp32 is
   generic(
      input_signed  : boolean := false;
      input_efflen  : natural := 12     -- largeur effective des données en entrée
      );
   port(
      ARESETN    : in  std_logic;
      CLK        : in  std_logic;
      RX_MOSI    : in  t_axi4_stream_mosi32;      
      RX_MISO    : out t_axi4_stream_miso;  
      TX_MOSI    : out t_axi4_stream_mosi32;
      TX_MISO    : in t_axi4_stream_miso      
      );
end axis_fi32tofp32;


architecture RTL of axis_fi32tofp32 is
   
signal data_in       : std_logic_vector(31 downto 0);
signal tuser_out     : std_logic_vector(RX_MOSI.TUSER'LENGTH-1 downto 0);
signal tx_data_valid : std_logic;
   
   component ip_axis_fi32tofp32
      port (
         aclk : in std_logic;
         aresetn : in std_logic;
         s_axis_a_tvalid : in std_logic;
         s_axis_a_tready : out std_logic;
         s_axis_a_tdata : in std_logic_vector(31 downto 0);
         s_axis_a_tuser : in std_logic_vector(7 downto 0);
         s_axis_a_tlast : in std_logic;
         m_axis_result_tvalid : out std_logic;
         m_axis_result_tready : in std_logic;
         m_axis_result_tdata : out std_logic_vector(31 downto 0);
         m_axis_result_tuser : out std_logic_vector(7 downto 0);
         m_axis_result_tlast : out std_logic
         );
   end component;
 
   
begin
   
   
   signed_case: if input_signed generate
      begin
      data_in <= std_logic_vector(to_signed(to_integer(signed(RX_MOSI.TDATA(input_efflen-1 downto 0))), data_in'length));     
   end generate;
   
   unsigned_case: if not input_signed generate
      begin
      data_in <= std_logic_vector(to_unsigned(to_integer(unsigned(RX_MOSI.TDATA(input_efflen-1 downto 0))), data_in'length));     
   end generate;
   
   TX_MOSI.TUSER  <= resize(tuser_out, TX_MOSI.TUSER'LENGTH);
   TX_MOSI.TKEEP  <= "1111"; 
   TX_MOSI.TSTRB  <= "1111";
   TX_MOSI.TVALID <= tx_data_valid; 
   TX_MOSI.TID    <= (others => '0');   -- non supporté
   TX_MOSI.TDEST  <= (others => '0');   -- non supporté
   
   
   U1 : ip_axis_fi32tofp32
   PORT MAP (
      aclk                 => CLK,
      aresetn              => ARESETN,
      s_axis_a_tvalid      => RX_MOSI.TVALID,
      s_axis_a_tready      => RX_MISO.TREADY,
      s_axis_a_tdata       => data_in,
      s_axis_a_tuser       => RX_MOSI.TUSER,
      s_axis_a_tlast       => RX_MOSI.TLAST,
      m_axis_result_tvalid => tx_data_valid,
      m_axis_result_tready => TX_MISO.TREADY,
      m_axis_result_tdata  => TX_MOSI.TDATA,
      m_axis_result_tuser  => tuser_out,
      m_axis_result_tlast  => TX_MOSI.TLAST
      );
   
   
end RTL;
