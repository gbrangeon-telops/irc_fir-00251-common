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
      DATA_COUNT : out std_logic_vector(10 downto 0);
      FULL     : out std_logic
      
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
    m_axis_tuser : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    axis_data_count : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    axis_prog_full : OUT STD_LOGIC
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
    m_axis_tuser : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    axis_data_count : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
    axis_prog_full : OUT STD_LOGIC
  );
END COMPONENT;
ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
ATTRIBUTE SYN_BLACK_BOX OF t_axi4_stream64_sfifo_d1024_packet : COMPONENT IS TRUE;
ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
ATTRIBUTE BLACK_BOX_PAD_PIN OF t_axi4_stream64_sfifo_d1024_packet : COMPONENT IS "s_aclk,s_aresetn,s_axis_tvalid,s_axis_tready,s_axis_tdata[63:0],s_axis_tstrb[7:0],s_axis_tkeep[7:0],s_axis_tlast,s_axis_tid[0:0],s_axis_tdest[2:0],s_axis_tuser[15:0],m_axis_tvalid,m_axis_tready,m_axis_tdata[63:0],m_axis_tstrb[7:0],m_axis_tkeep[7:0],m_axis_tlast,m_axis_tid[0:0],m_axis_tdest[2:0],m_axis_tuser[15:0],axis_data_count[10:0],axis_prog_full";
   
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
    m_axis_tuser : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    axis_data_count : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
    axis_prog_full : OUT STD_LOGIC
  );
END COMPONENT;
ATTRIBUTE SYN_BLACK_BOX OF t_axi4_stream64_sfifo_d1024 : COMPONENT IS TRUE;
ATTRIBUTE BLACK_BOX_PAD_PIN OF t_axi4_stream64_sfifo_d1024 : COMPONENT IS "s_aclk,s_aresetn,s_axis_tvalid,s_axis_tready,s_axis_tdata[63:0],s_axis_tstrb[7:0],s_axis_tkeep[7:0],s_axis_tlast,s_axis_tid[0:0],s_axis_tdest[2:0],s_axis_tuser[15:0],m_axis_tvalid,m_axis_tready,m_axis_tdata[63:0],m_axis_tstrb[7:0],m_axis_tkeep[7:0],m_axis_tlast,m_axis_tid[0:0],m_axis_tdest[2:0],m_axis_tuser[15:0],axis_overflow";

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
    m_axis_tuser : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    axis_wr_data_count : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    axis_rd_data_count : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    axis_prog_full : OUT STD_LOGIC
  );
END COMPONENT;
ATTRIBUTE SYN_BLACK_BOX OF t_axi4_stream64_afifo_d16 : COMPONENT IS TRUE;
ATTRIBUTE BLACK_BOX_PAD_PIN OF t_axi4_stream64_afifo_d16 : COMPONENT IS "m_aclk,s_aclk,s_aresetn,s_axis_tvalid,s_axis_tready,s_axis_tdata[63:0],s_axis_tstrb[7:0],s_axis_tkeep[7:0],s_axis_tlast,s_axis_tid[0:0],s_axis_tdest[2:0],s_axis_tuser[15:0],m_axis_tvalid,m_axis_tready,m_axis_tdata[63:0],m_axis_tstrb[7:0],m_axis_tkeep[7:0],m_axis_tlast,m_axis_tid[0:0],m_axis_tdest[2:0],m_axis_tuser[15:0],axis_wr_data_count[4:0],axis_rd_data_count[4:0],axis_prog_full";
   
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
    m_axis_tuser : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    axis_wr_data_count : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    axis_rd_data_count : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    axis_prog_full : OUT STD_LOGIC
  );
END COMPONENT;
ATTRIBUTE SYN_BLACK_BOX OF t_axi4_stream64_afifo_d128 : COMPONENT IS TRUE;
ATTRIBUTE BLACK_BOX_PAD_PIN OF t_axi4_stream64_afifo_d128 : COMPONENT IS "m_aclk,s_aclk,s_aresetn,s_axis_tvalid,s_axis_tready,s_axis_tdata[63:0],s_axis_tstrb[7:0],s_axis_tkeep[7:0],s_axis_tlast,s_axis_tid[0:0],s_axis_tdest[2:0],s_axis_tuser[15:0],m_axis_tvalid,m_axis_tready,m_axis_tdata[63:0],m_axis_tstrb[7:0],m_axis_tkeep[7:0],m_axis_tlast,m_axis_tid[0:0],m_axis_tdest[2:0],m_axis_tuser[15:0],axis_wr_data_count[7:0],axis_rd_data_count[7:0],axis_prog_full";
   
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
    m_axis_tuser : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    axis_wr_data_count : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
    axis_rd_data_count : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
    axis_prog_full : OUT STD_LOGIC
  );
END COMPONENT;
ATTRIBUTE SYN_BLACK_BOX OF t_axi4_stream64_afifo_d512 : COMPONENT IS TRUE;
ATTRIBUTE BLACK_BOX_PAD_PIN OF t_axi4_stream64_afifo_d512 : COMPONENT IS "m_aclk,s_aclk,s_aresetn,s_axis_tvalid,s_axis_tready,s_axis_tdata[63:0],s_axis_tstrb[7:0],s_axis_tkeep[7:0],s_axis_tlast,s_axis_tid[0:0],s_axis_tdest[2:0],s_axis_tuser[15:0],m_axis_tvalid,m_axis_tready,m_axis_tdata[63:0],m_axis_tstrb[7:0],m_axis_tkeep[7:0],m_axis_tlast,m_axis_tid[0:0],m_axis_tdest[2:0],m_axis_tuser[15:0],axis_wr_data_count[9:0],axis_rd_data_count[9:0],axis_prog_full";
   
   signal FoundGenCase     : boolean := FALSE;
   signal axis_full        : std_logic;
   signal full_i           : std_logic;
   
   
begin
   
   FULL <= full_i;
   
   -- Synchronous fifo types...
   sgen_d128 : if (FifoSize > 64 and FifoSize <= 128 and not ASYNC and not PACKET_MODE) generate
      begin                  
      FoundGenCase <= true;  
      t_axi4_stream64_sfifo_d128_inst : t_axi4_stream64_sfifo_d128
      PORT MAP (
          s_aresetn => ARESETN,
          s_aclk => RX_CLK,
          s_axis_tvalid => RX_MOSI.TVALID,
          s_axis_tready => RX_MISO.TREADY,
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
          m_axis_tuser => TX_MOSI.TUSER,
          axis_data_count => DATA_COUNT(7 downto 0),
          axis_prog_full => axis_full
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
          s_axis_tready => RX_MISO.TREADY,
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
          m_axis_tuser => TX_MOSI.TUSER,
          axis_data_count => DATA_COUNT,
          axis_prog_full => axis_full
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
          s_axis_tready => RX_MISO.TREADY,
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
          m_axis_tuser => TX_MOSI.TUSER,
          axis_data_count => DATA_COUNT,
          axis_prog_full => axis_full
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
         s_axis_tready => RX_MISO.TREADY,
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
         m_axis_tuser => TX_MOSI.TUSER,
         axis_wr_data_count => open,
         axis_rd_data_count => DATA_COUNT(4 downto 0),
         axis_prog_full => axis_full
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
         s_axis_tready => RX_MISO.TREADY,
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
         m_axis_tuser => TX_MOSI.TUSER,
         axis_wr_data_count => open,
         axis_rd_data_count => DATA_COUNT(7 downto 0),
         axis_prog_full => axis_full
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
         s_axis_tready => RX_MISO.TREADY,
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
         m_axis_tuser => TX_MOSI.TUSER,
         axis_wr_data_count => open,
         axis_rd_data_count => DATA_COUNT(9 downto 0),
         axis_prog_full => axis_full
      );
   end generate;

   ovfl_proc : process(RX_CLK, ARESETN)
   begin	
      if ARESETN = '0' then 
         full_i <= '0';
      elsif rising_edge(RX_CLK) then

         full_i <= axis_full;
         -- pragma translate_off
         assert (FoundGenCase or FifoSize = 0) report "Invalid LocalLink fifo generic settings!" severity FAILURE;
         if FoundGenCase then
            --assert (full_i = '0') report "AxiStream fifo full!!!" severity ERROR;
         end if;
         -- pragma translate_on	
      end if;
   end process; 
   
   
end rtl;
