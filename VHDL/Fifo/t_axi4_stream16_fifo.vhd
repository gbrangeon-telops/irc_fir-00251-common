------------------------------------------------------------------
--!   @file : t_axi4_stream16_fifo
--!   @brief
--!   @details
--!
--!   $Rev$
--!   $Author$
--!   $Date$
--!   $Id$
--!   $URL$
------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all; 
use work.tel2000.all;

entity t_axi4_stream16_fifo is
   generic(                            
      FifoSize		   : integer := 16;     -- 
      ASYNC          : boolean := false);	-- Use asynchronous fifos
   
   port(
      ARESETN  : in std_logic;
      
      -- slave side (write channel only)
      RX_CLK   : in std_logic;
      RX_MOSI  : in t_axi4_stream_mosi16;
      RX_MISO  : out t_axi4_stream_miso;
      
      -- master side 
      TX_CLK   : in std_logic;
      TX_MOSI  : out t_axi4_stream_mosi16;
      TX_MISO  : in t_axi4_stream_miso;
      
      -- overflow
      OVFL     : out std_logic
      
      );
end t_axi4_stream16_fifo;

architecture rtl of t_axi4_stream16_fifo is
   
   component t_axi4_stream16_sfifo_d16
      port (
         s_aclk : IN STD_LOGIC;
         s_aresetn : IN STD_LOGIC;
         s_axis_tvalid : IN STD_LOGIC;
         s_axis_tready : OUT STD_LOGIC;
         s_axis_tdata  : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         s_axis_tstrb  : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
         s_axis_tkeep  : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
         s_axis_tlast  : IN STD_LOGIC;
         s_axis_tdest  : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         s_axis_tuser  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         s_axis_tid    : in STD_LOGIC_VECTOR ( 0 to 0 );
         m_axis_tvalid : OUT STD_LOGIC;
         m_axis_tready : IN STD_LOGIC;
         m_axis_tdata  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         m_axis_tstrb  : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
         m_axis_tkeep  : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
         m_axis_tlast  : OUT STD_LOGIC;
         m_axis_tdest  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         m_axis_tuser  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
         m_axis_tid    : OUT STD_LOGIC_VECTOR ( 0 to 0 );
         axis_overflow : OUT STD_LOGIC
         );      
   end component;
   
   component t_axi4_stream16_sfifo_d512
      port (
         s_aclk : IN STD_LOGIC;
         s_aresetn : IN STD_LOGIC;
         s_axis_tvalid : IN STD_LOGIC;
         s_axis_tready : OUT STD_LOGIC;
         s_axis_tdata  : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         s_axis_tstrb  : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
         s_axis_tkeep  : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
         s_axis_tlast  : IN STD_LOGIC;
         s_axis_tdest  : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         s_axis_tuser  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         s_axis_tid    : in STD_LOGIC_VECTOR ( 0 to 0 );
         m_axis_tvalid : OUT STD_LOGIC;
         m_axis_tready : IN STD_LOGIC;
         m_axis_tdata  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         m_axis_tstrb  : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
         m_axis_tkeep  : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
         m_axis_tlast  : OUT STD_LOGIC;
         m_axis_tdest  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         m_axis_tuser  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
         m_axis_tid    : OUT STD_LOGIC_VECTOR ( 0 to 0 );
         axis_overflow : OUT STD_LOGIC
         );      
   end component;

   signal FoundGenCase     : boolean := FALSE;
   signal axis_overflow    : std_logic;
   signal ovfl_i           : std_logic;
   signal rx_tvalid        : std_logic  := '0';
   signal rx_tready        : std_logic  := '0';
   
   
begin
   
   
   OVFL <= ovfl_i;
   --RX_MISO.TREADY <= rx_tready; 
   --rx_tvalid <= RX_MOSI.TVALID and rx_tready;
   
   -- synchrnonous fifo types...
   sgen_d16 : if (FifoSize > 0 and FifoSize <= 16 and not ASYNC) generate
      begin                  
      FoundGenCase <= true; 
      t_axi4_stream16_sfifo_d16_inst : t_axi4_stream16_sfifo_d16
      PORT MAP (
         s_aclk        => TX_CLK,
         s_aresetn     => ARESETN,
         s_axis_tvalid => RX_MOSI.TVALID,
         s_axis_tready => RX_MISO.TREADY,
         s_axis_tdata  => RX_MOSI.TDATA,
         s_axis_tstrb  => RX_MOSI.TSTRB,
         s_axis_tkeep  => RX_MOSI.TKEEP,
         s_axis_tlast  => RX_MOSI.TLAST,
         s_axis_tdest  => RX_MOSI.TDEST,
         s_axis_tuser  => RX_MOSI.TUSER,
         s_axis_tid    => RX_MOSI.TID,
         m_axis_tvalid => TX_MOSI.TVALID,
         m_axis_tready => TX_MISO.TREADY,
         m_axis_tdata  => TX_MOSI.TDATA,
         m_axis_tstrb  => TX_MOSI.TSTRB,
         m_axis_tkeep  => TX_MOSI.TKEEP,
         m_axis_tlast  => TX_MOSI.TLAST,
         m_axis_tdest  => TX_MOSI.TDEST,
         m_axis_tuser  => TX_MOSI.TUSER,
         m_axis_tid    => TX_MOSI.TID,
         axis_overflow => axis_overflow
         );
   end generate;
      
   sgen_d512 : if (FifoSize > 16 and FifoSize <= 512 and not ASYNC) generate
      begin                  
      FoundGenCase <= true; 
      t_axi4_stream16_sfifo_d512_inst : t_axi4_stream16_sfifo_d512
      PORT MAP (
         s_aclk        => TX_CLK,
         s_aresetn     => ARESETN,
         s_axis_tvalid => RX_MOSI.TVALID,
         s_axis_tready => RX_MISO.TREADY,
         s_axis_tdata  => RX_MOSI.TDATA,
         s_axis_tstrb  => RX_MOSI.TSTRB,
         s_axis_tkeep  => RX_MOSI.TKEEP,
         s_axis_tlast  => RX_MOSI.TLAST,
         s_axis_tdest  => RX_MOSI.TDEST,
         s_axis_tuser  => RX_MOSI.TUSER,
         s_axis_tid    => RX_MOSI.TID,
         m_axis_tvalid => TX_MOSI.TVALID,
         m_axis_tready => TX_MISO.TREADY,
         m_axis_tdata  => TX_MOSI.TDATA,
         m_axis_tstrb  => TX_MOSI.TSTRB,
         m_axis_tkeep  => TX_MOSI.TKEEP,
         m_axis_tlast  => TX_MOSI.TLAST,
         m_axis_tdest  => TX_MOSI.TDEST,
         m_axis_tuser  => TX_MOSI.TUSER,
         m_axis_tid    => TX_MOSI.TID,
         axis_overflow => axis_overflow
         );
   end generate;

   ovfl_proc : process(RX_CLK, ARESETN)
   begin	
      if ARESETN = '0' then 
         ovfl_i <= '0';
      elsif rising_edge(RX_CLK) then
         ovfl_i <= axis_overflow; 
         -- pragma translate_off
         assert (FoundGenCase or FifoSize = 0) report "Invalid LocalLink fifo generic settings!" severity FAILURE;
         if FoundGenCase then
            assert (ovfl_i = '0') report "AxiStream fifo overflow!!!" severity ERROR;
         end if;
         -- pragma translate_on	
      end if;
   end process; 
   
   
end rtl;
