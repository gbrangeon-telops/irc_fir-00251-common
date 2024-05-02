-------------------------------------------------------------------------------
--
-- Title       : fp32_axis_log
-- Author      : ODI
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- Description :
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;   
use ieee.numeric_std.all;
use work.tel2000.all;

entity fp32_axis_log is
   port(
      ARESETN    : in  std_logic;
      CLK        : in  std_logic;
      
      -- input = pixels
      RX_MOSI    : in  t_axi4_stream_mosi32;      
      RX_MISO    : out t_axi4_stream_miso;  
      
      -- output
      TX_MOSI    : out t_axi4_stream_mosi32;
      TX_MISO    : in t_axi4_stream_miso;
      
      ERR         : out std_logic_vector(4 downto 0)     
      );
end fp32_axis_log;


architecture RTL of fp32_axis_log is
   
   signal tx_tuser       : std_logic_vector(9 downto 0);
   signal tx_data_valid  : std_logic := '0';
   
   component ip_fp32_axis_log
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
         m_axis_result_tuser : out std_logic_vector(9 downto 0);
         m_axis_result_tlast : out std_logic
      );
   end component;
   
   
   
begin
   
   TX_MOSI.TUSER  <= tx_tuser(9 downto 2);
   TX_MOSI.TKEEP  <= "1111"; 
   TX_MOSI.TSTRB  <= "1111";
   TX_MOSI.TVALID <= tx_data_valid;
   TX_MOSI.TID    <= (others => '0');   -- non supporté
   TX_MOSI.TDEST  <= (others => '0');   -- non supporté
   
   ERR(4) <= '0'; -- sync_err
   ERR(3) <= '0'; --tx_tuser(1); -- div_by_zero   2024-05-02 ODI: a été déconnecté pour éliminer les fausses erreurs. Le résultat de ln(0) est 0, ce qui nous convient.
   ERR(2) <= tx_tuser(0); -- invalid_op
   ERR(1) <= '0'; -- overflow
   ERR(0) <= '0'; -- underflow
   
   U1 : ip_fp32_axis_log
   PORT MAP (
      aclk                 => CLK,
      aresetn              => ARESETN,
      s_axis_a_tvalid      => RX_MOSI.TVALID,
      s_axis_a_tready      => RX_MISO.TREADY,
      s_axis_a_tdata       => RX_MOSI.TDATA,
      s_axis_a_tuser       => RX_MOSI.TUSER,
      s_axis_a_tlast       => RX_MOSI.TLAST,
      m_axis_result_tvalid => tx_data_valid,
      m_axis_result_tready => TX_MISO.TREADY,
      m_axis_result_tdata  => TX_MOSI.TDATA,
      m_axis_result_tuser  => tx_tuser,
      m_axis_result_tlast  => TX_MOSI.TLAST
      );
   
   
end RTL;
