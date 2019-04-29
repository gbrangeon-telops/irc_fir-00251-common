------------------------------------------------------------------
--!   @file : t_axi4_stream64_fifo
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

entity t_axi4_stream64_fifo is
   generic(                            
      FifoSize		   : integer := 16;     -- 
      ASYNC          : boolean := false; -- Use asynchronous fifos
      PACKET_MODE    : boolean := false);	--use packet mode
   
   port(
      ARESETN  : in std_logic;
      
      -- slave side (write channel only)
      RX_CLK   : in std_logic;
      RX_MOSI  : in t_axi4_stream_mosi64;
      RX_MISO  : out t_axi4_stream_miso;
      
      -- master side 
      TX_CLK   : in std_logic;
      TX_MOSI  : out t_axi4_stream_mosi64;
      TX_MISO  : in t_axi4_stream_miso;
      
      -- overflow
      OVFL     : out std_logic
      
      );
   attribute KEEP_HIERARCHY : string;
   attribute KEEP_HIERARCHY of t_axi4_stream64_fifo : entity is "yes";
end t_axi4_stream64_fifo;

architecture rtl of t_axi4_stream64_fifo is
   
   COMPONENT t_axi4_stream64_sfifo_d128
      PORT (
         s_aclk : IN STD_LOGIC;
         s_aresetn : IN STD_LOGIC;
         s_axis_tvalid : IN STD_LOGIC;
         s_axis_tready : OUT STD_LOGIC;
         s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
         s_axis_tstrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tkeep : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tlast : IN STD_LOGIC;
         s_axis_tid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
         s_axis_tdest : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         s_axis_tuser : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         m_axis_tvalid : OUT STD_LOGIC;
         m_axis_tready : IN STD_LOGIC;
         m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
         m_axis_tstrb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tkeep : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tlast : OUT STD_LOGIC;
         m_axis_tid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
         m_axis_tdest : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         m_axis_tuser : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
         );
   END COMPONENT;
   
   COMPONENT t_axi4_stream64_sfifo_d1024_packet
      PORT (
         s_aclk : IN STD_LOGIC;
         s_aresetn : IN STD_LOGIC;
         s_axis_tvalid : IN STD_LOGIC;
         s_axis_tready : OUT STD_LOGIC;
         s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
         s_axis_tstrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tkeep : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tlast : IN STD_LOGIC;
         s_axis_tid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
         s_axis_tdest : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         s_axis_tuser : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         m_axis_tvalid : OUT STD_LOGIC;
         m_axis_tready : IN STD_LOGIC;
         m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
         m_axis_tstrb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tkeep : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tlast : OUT STD_LOGIC;
         m_axis_tid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
         m_axis_tdest : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         m_axis_tuser : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
         );
   END COMPONENT;
   
   COMPONENT t_axi4_stream64_sfifo_d512
      PORT (
         s_aclk : IN STD_LOGIC;
         s_aresetn : IN STD_LOGIC;
         s_axis_tvalid : IN STD_LOGIC;
         s_axis_tready : OUT STD_LOGIC;
         s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
         s_axis_tstrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tkeep : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tlast : IN STD_LOGIC;
         s_axis_tid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
         s_axis_tdest : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         s_axis_tuser : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         m_axis_tvalid : OUT STD_LOGIC;
         m_axis_tready : IN STD_LOGIC;
         m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
         m_axis_tstrb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tkeep : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tlast : OUT STD_LOGIC;
         m_axis_tid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
         m_axis_tdest : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         m_axis_tuser : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
         );
   END COMPONENT;
   
   COMPONENT t_axi4_stream64_sfifo_d1024
      PORT (
         s_aclk : IN STD_LOGIC;
         s_aresetn : IN STD_LOGIC;
         s_axis_tvalid : IN STD_LOGIC;
         s_axis_tready : OUT STD_LOGIC;
         s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
         s_axis_tstrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tkeep : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tlast : IN STD_LOGIC;
         s_axis_tid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
         s_axis_tdest : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         s_axis_tuser : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         m_axis_tvalid : OUT STD_LOGIC;
         m_axis_tready : IN STD_LOGIC;
         m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
         m_axis_tstrb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tkeep : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tlast : OUT STD_LOGIC;
         m_axis_tid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
         m_axis_tdest : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         m_axis_tuser : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
         );
   END COMPONENT;
   
   COMPONENT t_axi4_stream64_sfifo_d2048
      PORT (
         s_aclk : IN STD_LOGIC;
         s_aresetn : IN STD_LOGIC;
         s_axis_tvalid : IN STD_LOGIC;
         s_axis_tready : OUT STD_LOGIC;
         s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
         s_axis_tstrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tkeep : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tlast : IN STD_LOGIC;
         s_axis_tid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
         s_axis_tdest : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         s_axis_tuser : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         m_axis_tvalid : OUT STD_LOGIC;
         m_axis_tready : IN STD_LOGIC;
         m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
         m_axis_tstrb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tkeep : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tlast : OUT STD_LOGIC;
         m_axis_tid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
         m_axis_tdest : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         m_axis_tuser : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
         );
   END COMPONENT;
   
   COMPONENT t_axi4_stream64_sfifo_d4096
      PORT (
         s_aclk : IN STD_LOGIC;
         s_aresetn : IN STD_LOGIC;
         s_axis_tvalid : IN STD_LOGIC;
         s_axis_tready : OUT STD_LOGIC;
         s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
         s_axis_tstrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tkeep : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tlast : IN STD_LOGIC;
         s_axis_tid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
         s_axis_tdest : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         s_axis_tuser : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         m_axis_tvalid : OUT STD_LOGIC;
         m_axis_tready : IN STD_LOGIC;
         m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
         m_axis_tstrb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tkeep : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tlast : OUT STD_LOGIC;
         m_axis_tid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
         m_axis_tdest : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         m_axis_tuser : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
         );
   END COMPONENT;
   
   
   COMPONENT t_axi4_stream64_afifo_d16
      PORT (
         m_aclk : IN STD_LOGIC;
         s_aclk : IN STD_LOGIC;
         s_aresetn : IN STD_LOGIC;
         s_axis_tvalid : IN STD_LOGIC;
         s_axis_tready : OUT STD_LOGIC;
         s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
         s_axis_tstrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tkeep : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tlast : IN STD_LOGIC;
         s_axis_tid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
         s_axis_tdest : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         s_axis_tuser : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         m_axis_tvalid : OUT STD_LOGIC;
         m_axis_tready : IN STD_LOGIC;
         m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
         m_axis_tstrb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tkeep : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tlast : OUT STD_LOGIC;
         m_axis_tid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
         m_axis_tdest : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         m_axis_tuser : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
         );
   END COMPONENT;
   
   COMPONENT t_axi4_stream64_afifo_d128
      PORT (
         m_aclk : IN STD_LOGIC;
         s_aclk : IN STD_LOGIC;
         s_aresetn : IN STD_LOGIC;
         s_axis_tvalid : IN STD_LOGIC;
         s_axis_tready : OUT STD_LOGIC;
         s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
         s_axis_tstrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tkeep : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tlast : IN STD_LOGIC;
         s_axis_tid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
         s_axis_tdest : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         s_axis_tuser : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         m_axis_tvalid : OUT STD_LOGIC;
         m_axis_tready : IN STD_LOGIC;
         m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
         m_axis_tstrb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tkeep : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tlast : OUT STD_LOGIC;
         m_axis_tid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
         m_axis_tdest : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         m_axis_tuser : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
         );
   END COMPONENT;
   
   COMPONENT t_axi4_stream64_afifo_d512
      PORT (
         m_aclk : IN STD_LOGIC;
         s_aclk : IN STD_LOGIC;
         s_aresetn : IN STD_LOGIC;
         s_axis_tvalid : IN STD_LOGIC;
         s_axis_tready : OUT STD_LOGIC;
         s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
         s_axis_tstrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tkeep : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tlast : IN STD_LOGIC;
         s_axis_tid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
         s_axis_tdest : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         s_axis_tuser : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         m_axis_tvalid : OUT STD_LOGIC;
         m_axis_tready : IN STD_LOGIC;
         m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
         m_axis_tstrb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tkeep : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tlast : OUT STD_LOGIC;
         m_axis_tid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
         m_axis_tdest : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         m_axis_tuser : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
         );
   END COMPONENT;
   
   COMPONENT t_axi4_stream64_afifo_d1024
      PORT (
         m_aclk : IN STD_LOGIC;
         s_aclk : IN STD_LOGIC;
         s_aresetn : IN STD_LOGIC;
         s_axis_tvalid : IN STD_LOGIC;
         s_axis_tready : OUT STD_LOGIC;
         s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
         s_axis_tstrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tkeep : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tlast : IN STD_LOGIC;
         s_axis_tid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
         s_axis_tdest : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         s_axis_tuser : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         m_axis_tvalid : OUT STD_LOGIC;
         m_axis_tready : IN STD_LOGIC;
         m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
         m_axis_tstrb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tkeep : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tlast : OUT STD_LOGIC;
         m_axis_tid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
         m_axis_tdest : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         m_axis_tuser : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
         );
   END COMPONENT;
   
   COMPONENT t_axi4_stream64_afifo_d2048
      PORT (
         m_aclk : IN STD_LOGIC;
         s_aclk : IN STD_LOGIC;
         s_aresetn : IN STD_LOGIC;
         s_axis_tvalid : IN STD_LOGIC;
         s_axis_tready : OUT STD_LOGIC;
         s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
         s_axis_tstrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tkeep : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_tlast : IN STD_LOGIC;
         s_axis_tid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
         s_axis_tdest : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         s_axis_tuser : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         m_axis_tvalid : OUT STD_LOGIC;
         m_axis_tready : IN STD_LOGIC;
         m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
         m_axis_tstrb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tkeep : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_tlast : OUT STD_LOGIC;
         m_axis_tid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
         m_axis_tdest : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         m_axis_tuser : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
         );
   END COMPONENT;
   
   signal FoundGenCase     : boolean := FALSE;
   signal ovfl_i           : std_logic;
   signal rx_tready        : std_logic  := '0';
   
   attribute KEEP of ovfl_i : signal is "TRUE";
   
begin
   
   OVFL <= ovfl_i;
   RX_MISO.TREADY <= rx_tready;
   
   -- Synchronous fifo types...
   sgen_d128 : if (FifoSize > 64 and FifoSize <= 128 and not ASYNC and not PACKET_MODE) generate
      begin                  
      FoundGenCase <= true;  
      t_axi4_stream64_sfifo_d128_inst : t_axi4_stream64_sfifo_d128
      PORT MAP (
         s_aresetn => ARESETN,
         s_aclk => RX_CLK,
         s_axis_tvalid => RX_MOSI.TVALID,
         s_axis_tready => rx_tready,
         s_axis_tdata => RX_MOSI.TDATA,
         s_axis_tstrb => RX_MOSI.TSTRB,
         s_axis_tkeep => RX_MOSI.TKEEP,
         s_axis_tlast => RX_MOSI.TLAST,
         s_axis_tid => RX_MOSI.TID,
         s_axis_tdest => RX_MOSI.TDEST,
         s_axis_tuser => RX_MOSI.TUSER,
         m_axis_tvalid => TX_MOSI.TVALID,
         m_axis_tready => TX_MISO.TREADY,
         m_axis_tdata => TX_MOSI.TDATA,
         m_axis_tstrb => TX_MOSI.TSTRB,
         m_axis_tkeep => TX_MOSI.TKEEP,
         m_axis_tlast => TX_MOSI.TLAST,
         m_axis_tid => TX_MOSI.TID,
         m_axis_tdest => TX_MOSI.TDEST,
         m_axis_tuser => TX_MOSI.TUSER
         );
   end generate;
   
   sgen_d1024_packet : if (FifoSize > 512 and FifoSize <= 1024 and not ASYNC and PACKET_MODE) generate
      begin                  
      FoundGenCase <= true;  
      t_axi4_stream64_sfifo_d1024_packet_inst : t_axi4_stream64_sfifo_d1024_packet
      PORT MAP (
         s_aresetn => ARESETN,
         s_aclk => RX_CLK,
         s_axis_tvalid => RX_MOSI.TVALID,
         s_axis_tready => rx_tready,
         s_axis_tdata => RX_MOSI.TDATA,
         s_axis_tstrb => RX_MOSI.TSTRB,
         s_axis_tkeep => RX_MOSI.TKEEP,
         s_axis_tlast => RX_MOSI.TLAST,
         s_axis_tid => RX_MOSI.TID,
         s_axis_tdest => RX_MOSI.TDEST,
         s_axis_tuser => RX_MOSI.TUSER,
         m_axis_tvalid => TX_MOSI.TVALID,
         m_axis_tready => TX_MISO.TREADY,
         m_axis_tdata => TX_MOSI.TDATA,
         m_axis_tstrb => TX_MOSI.TSTRB,
         m_axis_tkeep => TX_MOSI.TKEEP,
         m_axis_tlast => TX_MOSI.TLAST,
         m_axis_tid => TX_MOSI.TID,
         m_axis_tdest => TX_MOSI.TDEST,
         m_axis_tuser => TX_MOSI.TUSER
         );
   end generate;
   
   sgen_d512 : if (FifoSize > 256 and FifoSize <= 512 and not ASYNC and not PACKET_MODE) generate
      begin                  
      FoundGenCase <= true;  
      t_axi4_stream64_sfifo_d512_inst : t_axi4_stream64_sfifo_d512
      PORT MAP (
         s_aresetn => ARESETN,
         s_aclk => RX_CLK,
         s_axis_tvalid => RX_MOSI.TVALID,
         s_axis_tready => rx_tready,
         s_axis_tdata => RX_MOSI.TDATA,
         s_axis_tstrb => RX_MOSI.TSTRB,
         s_axis_tkeep => RX_MOSI.TKEEP,
         s_axis_tlast => RX_MOSI.TLAST,
         s_axis_tid => RX_MOSI.TID,
         s_axis_tdest => RX_MOSI.TDEST,
         s_axis_tuser => RX_MOSI.TUSER,
         m_axis_tvalid => TX_MOSI.TVALID,
         m_axis_tready => TX_MISO.TREADY,
         m_axis_tdata => TX_MOSI.TDATA,
         m_axis_tstrb => TX_MOSI.TSTRB,
         m_axis_tkeep => TX_MOSI.TKEEP,
         m_axis_tlast => TX_MOSI.TLAST,
         m_axis_tid => TX_MOSI.TID,
         m_axis_tdest => TX_MOSI.TDEST,
         m_axis_tuser => TX_MOSI.TUSER
         );
   end generate;
   
   sgen_d1024 : if (FifoSize > 512 and FifoSize <= 1024 and not ASYNC and not PACKET_MODE) generate
      begin                  
      FoundGenCase <= true;  
      t_axi4_stream64_sfifo_d1024_inst : t_axi4_stream64_sfifo_d1024
      PORT MAP (
         s_aresetn => ARESETN,
         s_aclk => RX_CLK,
         s_axis_tvalid => RX_MOSI.TVALID,
         s_axis_tready => rx_tready,
         s_axis_tdata => RX_MOSI.TDATA,
         s_axis_tstrb => RX_MOSI.TSTRB,
         s_axis_tkeep => RX_MOSI.TKEEP,
         s_axis_tlast => RX_MOSI.TLAST,
         s_axis_tid => RX_MOSI.TID,
         s_axis_tdest => RX_MOSI.TDEST,
         s_axis_tuser => RX_MOSI.TUSER,
         m_axis_tvalid => TX_MOSI.TVALID,
         m_axis_tready => TX_MISO.TREADY,
         m_axis_tdata => TX_MOSI.TDATA,
         m_axis_tstrb => TX_MOSI.TSTRB,
         m_axis_tkeep => TX_MOSI.TKEEP,
         m_axis_tlast => TX_MOSI.TLAST,
         m_axis_tid => TX_MOSI.TID,
         m_axis_tdest => TX_MOSI.TDEST,
         m_axis_tuser => TX_MOSI.TUSER
         );
   end generate;
   
   sgen_d2048 : if (FifoSize > 1024 and FifoSize <= 2048 and not ASYNC and not PACKET_MODE) generate
      begin                  
      FoundGenCase <= true;  
      t_axi4_stream64_sfifo_d2048_inst : t_axi4_stream64_sfifo_d2048
      PORT MAP (
         s_aresetn => ARESETN,
         s_aclk => RX_CLK,
         s_axis_tvalid => RX_MOSI.TVALID,
         s_axis_tready => rx_tready,
         s_axis_tdata => RX_MOSI.TDATA,
         s_axis_tstrb => RX_MOSI.TSTRB,
         s_axis_tkeep => RX_MOSI.TKEEP,
         s_axis_tlast => RX_MOSI.TLAST,
         s_axis_tid => RX_MOSI.TID,
         s_axis_tdest => RX_MOSI.TDEST,
         s_axis_tuser => RX_MOSI.TUSER,
         m_axis_tvalid => TX_MOSI.TVALID,
         m_axis_tready => TX_MISO.TREADY,
         m_axis_tdata => TX_MOSI.TDATA,
         m_axis_tstrb => TX_MOSI.TSTRB,
         m_axis_tkeep => TX_MOSI.TKEEP,
         m_axis_tlast => TX_MOSI.TLAST,
         m_axis_tid => TX_MOSI.TID,
         m_axis_tdest => TX_MOSI.TDEST,
         m_axis_tuser => TX_MOSI.TUSER
         );
   end generate;
   
   sgen_d4096 : if (FifoSize > 2048 and FifoSize <= 4096 and not ASYNC and not PACKET_MODE) generate
      begin                  
      FoundGenCase <= true;  
      t_axi4_stream64_sfifo_d4096_inst : t_axi4_stream64_sfifo_d4096
      PORT MAP (
         s_aresetn => ARESETN,
         s_aclk => RX_CLK,
         s_axis_tvalid => RX_MOSI.TVALID,
         s_axis_tready => rx_tready,
         s_axis_tdata => RX_MOSI.TDATA,
         s_axis_tstrb => RX_MOSI.TSTRB,
         s_axis_tkeep => RX_MOSI.TKEEP,
         s_axis_tlast => RX_MOSI.TLAST,
         s_axis_tid => RX_MOSI.TID,
         s_axis_tdest => RX_MOSI.TDEST,
         s_axis_tuser => RX_MOSI.TUSER,
         m_axis_tvalid => TX_MOSI.TVALID,
         m_axis_tready => TX_MISO.TREADY,
         m_axis_tdata => TX_MOSI.TDATA,
         m_axis_tstrb => TX_MOSI.TSTRB,
         m_axis_tkeep => TX_MOSI.TKEEP,
         m_axis_tlast => TX_MOSI.TLAST,
         m_axis_tid => TX_MOSI.TID,
         m_axis_tdest => TX_MOSI.TDEST,
         m_axis_tuser => TX_MOSI.TUSER
         );
   end generate;
   
   
   -- Asynchronous fifo types...
   -- Note: PACKET_MODE is only available on common clock fifos
   agen_d16 : if (FifoSize > 0 and FifoSize <= 16 and ASYNC) generate
      begin                  
      FoundGenCase <= true; 
      t_axi4_stream64_afifo_d16_inst : t_axi4_stream64_afifo_d16
      PORT MAP (
         s_aresetn => ARESETN,
         s_aclk => RX_CLK,
         s_axis_tvalid => RX_MOSI.TVALID,
         s_axis_tready => rx_tready,
         s_axis_tdata => RX_MOSI.TDATA,
         s_axis_tstrb => RX_MOSI.TSTRB,
         s_axis_tkeep => RX_MOSI.TKEEP,
         s_axis_tlast => RX_MOSI.TLAST,
         s_axis_tid => RX_MOSI.TID,
         s_axis_tdest => RX_MOSI.TDEST,
         s_axis_tuser => RX_MOSI.TUSER,
         m_aclk => TX_CLK,
         m_axis_tvalid => TX_MOSI.TVALID,
         m_axis_tready => TX_MISO.TREADY,
         m_axis_tdata => TX_MOSI.TDATA,
         m_axis_tstrb => TX_MOSI.TSTRB,
         m_axis_tkeep => TX_MOSI.TKEEP,
         m_axis_tlast => TX_MOSI.TLAST,
         m_axis_tid => TX_MOSI.TID,
         m_axis_tdest => TX_MOSI.TDEST,
         m_axis_tuser => TX_MOSI.TUSER
         );
   end generate;
   
   agen_d128 : if (FifoSize > 64 and FifoSize <= 128 and ASYNC) generate
      begin                  
      FoundGenCase <= true; 
      t_axi4_stream64_afifo_d128_inst : t_axi4_stream64_afifo_d128
      PORT MAP (
         s_aresetn => ARESETN,
         s_aclk => RX_CLK,
         s_axis_tvalid => RX_MOSI.TVALID,
         s_axis_tready => rx_tready,
         s_axis_tdata => RX_MOSI.TDATA,
         s_axis_tstrb => RX_MOSI.TSTRB,
         s_axis_tkeep => RX_MOSI.TKEEP,
         s_axis_tlast => RX_MOSI.TLAST,
         s_axis_tid => RX_MOSI.TID,
         s_axis_tdest => RX_MOSI.TDEST,
         s_axis_tuser => RX_MOSI.TUSER,
         m_aclk => TX_CLK,
         m_axis_tvalid => TX_MOSI.TVALID,
         m_axis_tready => TX_MISO.TREADY,
         m_axis_tdata => TX_MOSI.TDATA,
         m_axis_tstrb => TX_MOSI.TSTRB,
         m_axis_tkeep => TX_MOSI.TKEEP,
         m_axis_tlast => TX_MOSI.TLAST,
         m_axis_tid => TX_MOSI.TID,
         m_axis_tdest => TX_MOSI.TDEST,
         m_axis_tuser => TX_MOSI.TUSER
         );
   end generate;
   
   agen_d512 : if (FifoSize > 256 and FifoSize <= 512 and ASYNC) generate
      begin                  
      FoundGenCase <= true; 
      t_axi4_stream64_afifo_d512_inst : t_axi4_stream64_afifo_d512
      PORT MAP (
         s_aresetn => ARESETN,
         s_aclk => RX_CLK,
         s_axis_tvalid => RX_MOSI.TVALID,
         s_axis_tready => rx_tready,
         s_axis_tdata => RX_MOSI.TDATA,
         s_axis_tstrb => RX_MOSI.TSTRB,
         s_axis_tkeep => RX_MOSI.TKEEP,
         s_axis_tlast => RX_MOSI.TLAST,
         s_axis_tid => RX_MOSI.TID,
         s_axis_tdest => RX_MOSI.TDEST,
         s_axis_tuser => RX_MOSI.TUSER,
         m_aclk => TX_CLK,
         m_axis_tvalid => TX_MOSI.TVALID,
         m_axis_tready => TX_MISO.TREADY,
         m_axis_tdata => TX_MOSI.TDATA,
         m_axis_tstrb => TX_MOSI.TSTRB,
         m_axis_tkeep => TX_MOSI.TKEEP,
         m_axis_tlast => TX_MOSI.TLAST,
         m_axis_tid => TX_MOSI.TID,
         m_axis_tdest => TX_MOSI.TDEST,
         m_axis_tuser => TX_MOSI.TUSER
         );
   end generate;
   
   agen_d1024 : if (FifoSize > 512 and FifoSize <= 1024 and ASYNC) generate
      begin                  
      FoundGenCase <= true; 
      t_axi4_stream64_afifo_d1024_inst : t_axi4_stream64_afifo_d1024
      PORT MAP (
         s_aresetn => ARESETN,
         s_aclk => RX_CLK,
         s_axis_tvalid => RX_MOSI.TVALID,
         s_axis_tready => rx_tready,
         s_axis_tdata => RX_MOSI.TDATA,
         s_axis_tstrb => RX_MOSI.TSTRB,
         s_axis_tkeep => RX_MOSI.TKEEP,
         s_axis_tlast => RX_MOSI.TLAST,
         s_axis_tid => RX_MOSI.TID,
         s_axis_tdest => RX_MOSI.TDEST,
         s_axis_tuser => RX_MOSI.TUSER,
         m_aclk => TX_CLK,
         m_axis_tvalid => TX_MOSI.TVALID,
         m_axis_tready => TX_MISO.TREADY,
         m_axis_tdata => TX_MOSI.TDATA,
         m_axis_tstrb => TX_MOSI.TSTRB,
         m_axis_tkeep => TX_MOSI.TKEEP,
         m_axis_tlast => TX_MOSI.TLAST,
         m_axis_tid => TX_MOSI.TID,
         m_axis_tdest => TX_MOSI.TDEST,
         m_axis_tuser => TX_MOSI.TUSER
         );
   end generate;
   
   agen_d2048 : if (FifoSize > 1024 and FifoSize <= 2048 and ASYNC) generate
      begin                  
      FoundGenCase <= true; 
      t_axi4_stream64_afifo_d2048_inst : t_axi4_stream64_afifo_d2048
      PORT MAP (
         s_aresetn => ARESETN,
         s_aclk => RX_CLK,
         s_axis_tvalid => RX_MOSI.TVALID,
         s_axis_tready => rx_tready,
         s_axis_tdata => RX_MOSI.TDATA,
         s_axis_tstrb => RX_MOSI.TSTRB,
         s_axis_tkeep => RX_MOSI.TKEEP,
         s_axis_tlast => RX_MOSI.TLAST,
         s_axis_tid => RX_MOSI.TID,
         s_axis_tdest => RX_MOSI.TDEST,
         s_axis_tuser => RX_MOSI.TUSER,
         m_aclk => TX_CLK,
         m_axis_tvalid => TX_MOSI.TVALID,
         m_axis_tready => TX_MISO.TREADY,
         m_axis_tdata => TX_MOSI.TDATA,
         m_axis_tstrb => TX_MOSI.TSTRB,
         m_axis_tkeep => TX_MOSI.TKEEP,
         m_axis_tlast => TX_MOSI.TLAST,
         m_axis_tid => TX_MOSI.TID,
         m_axis_tdest => TX_MOSI.TDEST,
         m_axis_tuser => TX_MOSI.TUSER
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
