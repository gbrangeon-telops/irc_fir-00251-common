-------------------------------------------------------------------------------
--
-- Title       : fp32_axis_divide
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

entity fp32_axis_divide is
   port(
      ARESETN     : in  std_logic;
      CLK         : in  std_logic;
      RXA_MOSI    : in  t_axi4_stream_mosi32;      
      RXA_MISO    : out t_axi4_stream_miso;  
      RXB_MOSI    : in  t_axi4_stream_mosi32;      
      RXB_MISO    : out t_axi4_stream_miso;      
      TX_MOSI     : out t_axi4_stream_mosi32;
      TX_MISO     : in t_axi4_stream_miso;
      ERR         : out std_logic_vector(4 downto 0)     
      );
end fp32_axis_divide;


architecture RTL of fp32_axis_divide is
   
   signal tx_tuser    : std_logic_vector(19 downto 0); 
   signal rxa_tready  : std_logic;
   signal rxb_tready  : std_logic;
   signal sync_err    : std_logic;
   signal div_by_zero : std_logic;
   signal invalid_op  : std_logic;
   signal overflow    : std_logic;
   signal underflow   : std_logic;
   signal tx_data_valid : std_logic;
   
   component ip_fp32_axis_divide
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
         m_axis_result_tdata  : out std_logic_vector(31 downto 0);
         m_axis_result_tuser  : out std_logic_vector(19 downto 0);
         m_axis_result_tlast  : out std_logic
         );
   end component;
   
begin                            
   
   RXA_MISO.TREADY <= rxa_tready;  
   RXB_MISO.TREADY <= rxb_tready;  
   
   TX_MOSI.TUSER  <= tx_tuser(11 downto 4); -- TX_MOSI.TUSER = RXA_MOSI.TUSER 
   TX_MOSI.TKEEP  <= tx_data_valid & tx_data_valid & tx_data_valid & tx_data_valid; 
   TX_MOSI.TSTRB  <= tx_data_valid & tx_data_valid & tx_data_valid & tx_data_valid;
   TX_MOSI.TVALID <= tx_data_valid;
   TX_MOSI.TID    <= (others => '0');   -- non supporté
   TX_MOSI.TDEST  <= (others => '0');   -- non supporté
   
   ERR(4) <= sync_err;
   ERR(3) <= div_by_zero;
   ERR(2) <= invalid_op;
   ERR(1) <= overflow;
   ERR(0) <= underflow; 
   
   U1 : ip_fp32_axis_divide
   PORT MAP (
      aclk                 => CLK,
      aresetn              => ARESETN,
      s_axis_a_tvalid      => RXA_MOSI.TVALID,
      s_axis_a_tready      => rxa_tready,
      s_axis_a_tdata       => RXA_MOSI.TDATA,
      s_axis_a_tuser       => RXA_MOSI.TUSER,
      s_axis_a_tlast       => RXA_MOSI.TLAST,
      
      s_axis_b_tvalid      => RXB_MOSI.TVALID,
      s_axis_b_tready      => rxb_tready,
      s_axis_b_tdata       => RXB_MOSI.TDATA,
      s_axis_b_tuser       => RXB_MOSI.TUSER,
      s_axis_b_tlast       => RXB_MOSI.TLAST,
      
      m_axis_result_tvalid => tx_data_valid,
      m_axis_result_tready => TX_MISO.TREADY,
      m_axis_result_tdata  => TX_MOSI.TDATA,
      m_axis_result_tuser  => tx_tuser,
      m_axis_result_tlast  => TX_MOSI.TLAST
      );
   
   U2 :  process(CLK)
   begin
      if rising_edge(CLK) then 
         div_by_zero <= tx_tuser(3);
         invalid_op <= tx_tuser(2);
         overflow <= tx_tuser(1);
         underflow <= tx_tuser(0);         
         if RXB_MOSI.TVALID = '1' and RXB_MOSI.TLAST = '1' and rxb_tready = '1' then 
            sync_err <= RXA_MOSI.TVALID and rxa_tready and not RXA_MOSI.TLAST;   -- erreur de desynchronisation
         else
            sync_err <= '0';
         end if;                  
      end if;      
   end process;  
   
end RTL;
