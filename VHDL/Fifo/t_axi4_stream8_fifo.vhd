------------------------------------------------------------------
--!   @file : t_axi4_stream8_fifo
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

entity t_axi4_stream8_fifo is
   generic(                            
      FifoSize		   : integer := 16;     -- 
      ASYNC          : boolean := false);	-- Use asynchronous fifos
   
   port(
      ARESETN  : in std_logic;
      
      -- slave side (write channel only)
      RX_CLK   : in std_logic;
      RX_MOSI  : in t_axi4_stream_mosi8;
      RX_MISO  : out t_axi4_stream_miso;
      
      -- master side 
      TX_CLK   : in std_logic;
      TX_MOSI  : out t_axi4_stream_mosi8;
      TX_MISO  : in t_axi4_stream_miso;
      
      -- overflow
      OVFL     : out std_logic
      
      );
end t_axi4_stream8_fifo;

architecture rtl of t_axi4_stream8_fifo is
   
   component t_axi4_stream8_sfifo_d2048
     port (
       s_aclk : IN STD_LOGIC;
       s_aresetn : IN STD_LOGIC;
       s_axis_tvalid : IN STD_LOGIC;
       s_axis_tready : OUT STD_LOGIC;
       s_axis_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       s_axis_tlast : IN STD_LOGIC;
       m_axis_tvalid : OUT STD_LOGIC;
       m_axis_tready : IN STD_LOGIC;
       m_axis_tdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
       m_axis_tlast : OUT STD_LOGIC;
       axis_overflow : OUT STD_LOGIC
     );
   end component;
   
   signal FoundGenCase     : boolean := FALSE;
   signal axis_overflow    : std_logic;
   signal ovfl_i           : std_logic;
   signal rx_tvalid        : std_logic  := '0';
   signal rx_tready        : std_logic  := '0';
   
   attribute KEEP of ovfl_i : signal is "TRUE";
   
begin
   
   
   OVFL <= ovfl_i;
   RX_MISO.TREADY <= rx_tready; 
   rx_tvalid <= RX_MOSI.TVALID and rx_tready;
   
   TX_MOSI.TDEST <= "000";
   TX_MOSI.TUSER <= "0000";
   TX_MOSI.TID <= "0";
   TX_MOSI.TSTRB <= "1";
   TX_MOSI.TKEEP <= "1";
   
   -- synchrnonous fifo types...
   sgen_d16 : if (FifoSize > 0 and FifoSize <= 2048 and not ASYNC) generate
      begin                  
      FoundGenCase <= true; 
      t_axi4_stream8_sfifo_d2048_inst : t_axi4_stream8_sfifo_d2048
      PORT MAP (
         s_aclk        => TX_CLK,
         s_aresetn     => ARESETN,
         s_axis_tvalid => rx_tvalid,
         s_axis_tready => rx_tready,
         s_axis_tdata  => RX_MOSI.TDATA,
         s_axis_tlast  => RX_MOSI.TLAST,
         m_axis_tvalid => TX_MOSI.TVALID,
         m_axis_tready => TX_MISO.TREADY,
         m_axis_tdata  => TX_MOSI.TDATA,
         m_axis_tlast  => TX_MOSI.TLAST,
         axis_overflow => axis_overflow
         );
   end generate;
      
   ovfl_proc : process(RX_CLK, ARESETN)
   begin	
      if ARESETN = '0' then 
         ovfl_i <= '0';
      elsif rising_edge(RX_CLK) then
         if (rx_tready = '0' and RX_MOSI.TVALID = '1') then
            ovfl_i <= '1';
         end if;

         -- pragma translate_off
         assert (FoundGenCase or FifoSize = 0) report "Invalid LocalLink fifo generic settings!" severity FAILURE;
         if FoundGenCase then
            assert (ovfl_i = '0') report "AxiStream fifo overflow!!!" severity ERROR;
         end if;
         -- pragma translate_on	
      end if;
   end process; 
   
   
end rtl;
