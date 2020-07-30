-------------------------------------------------------------------------------
--
-- Title       : fp32_axis_greaterThan
-- Author      : ENO
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

entity fp32_axis_greaterThan is
   port(
      ARESETN    : in  std_logic;
      CLK        : in  std_logic;
      
      -- input A = pixels
      RXA_MOSI   : in  t_axi4_stream_mosi32;      
      RXA_MISO   : out t_axi4_stream_miso;  
      
      -- input B 
      RXB_MOSI   : in  t_axi4_stream_mosi32;      
      RXB_MISO   : out t_axi4_stream_miso;      
      
      -- output 1 si RXA> RxB et 0 sinon
      TX_MOSI    : out t_axi4_stream_mosi32; -- la sortie est un unsigned 32 bits (pour que les t_user de RXA suivent) à 0 si la comparaison est fausse. 
      TX_MISO    : in t_axi4_stream_miso
      
      );
end fp32_axis_greaterThan;


architecture RTL of fp32_axis_greaterThan is
   
   signal tx_tuser       : std_logic_vector(15 downto 0); 
   signal rxa_tready     : std_logic;
   signal rxb_tready     : std_logic;
   signal tx_result      : std_logic_vector(7 downto 0);
   signal tx_data_valid  : std_logic := '0';
   
   component ip_fp32_axis_greaterThan
      port (
         aclk                 : in std_logic;
         aresetn              : in std_logic;
         s_axis_a_tvalid      : in std_logic;
         s_axis_a_tready      : out std_logic;
         s_axis_a_tdata       : in std_logic_vector(31 downto 0);
         s_axis_a_tuser       : in std_logic_vector(7 downto 0);
         s_axis_a_tlast       : in std_logic;
         s_axis_b_tvalid      : in std_logic;
         s_axis_b_tready      : out std_logic;
         s_axis_b_tdata       : in std_logic_vector(31 downto 0);
         s_axis_b_tuser       : in std_logic_vector(7 downto 0);
         s_axis_b_tlast       : in std_logic;
         m_axis_result_tvalid : out std_logic;
         m_axis_result_tready : in std_logic;
         m_axis_result_tdata  : out std_logic_vector(7 downto 0);
         m_axis_result_tuser  : out std_logic_vector(15 downto 0);
         m_axis_result_tlast  : out std_logic
         );
   end component;
   
   
   
begin
   
   TX_MOSI.TUSER  <= tx_tuser(15 downto 8) or tx_tuser(7 downto 0); -- Take the tuser of either input
   TX_MOSI.TKEEP  <= "1111"; 
   TX_MOSI.TSTRB  <= "1111";
   TX_MOSI.TVALID <= tx_data_valid;
   TX_MOSI.TID    <= (others => '0');   -- non supporté
   TX_MOSI.TDEST  <= (others => '0');   -- non supporté
   TX_MOSI.TDATA  <= (31 downto 1 => '0') & tx_result(0); --selon la doc de Xilinx, seul le bit(0) contient le resultat de la comparaison
   
   U1 : ip_fp32_axis_greaterThan
   PORT MAP (
      
      aclk                 => CLK,
      aresetn              => ARESETN,
      
      s_axis_a_tvalid      => RXA_MOSI.TVALID,
      s_axis_a_tready      => RXA_MISO.TREADY,
      s_axis_a_tdata       => RXA_MOSI.TDATA,
      s_axis_a_tuser       => RXA_MOSI.TUSER,
      s_axis_a_tlast       => RXA_MOSI.TLAST,
      
      s_axis_b_tvalid      => RXB_MOSI.TVALID,
      s_axis_b_tready      => RXB_MISO.TREADY,
      s_axis_b_tdata       => RXB_MOSI.TDATA,
      s_axis_b_tuser       => RXB_MOSI.TUSER,
      s_axis_b_tlast       => RXB_MOSI.TLAST,
      
      m_axis_result_tvalid => tx_data_valid,
      m_axis_result_tready => TX_MISO.TREADY,
      m_axis_result_tdata  => tx_result,
      m_axis_result_tuser  => tx_tuser,
      m_axis_result_tlast  => TX_MOSI.TLAST
      ); 
   
   
end RTL;
