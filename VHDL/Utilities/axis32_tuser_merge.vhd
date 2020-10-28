------------------------------------------------------------------
--!   @file : axis32_tuser_merge
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

entity axis32_tuser_merge is
   port(
      ARESETN  : in std_logic;
      CLK      : in std_logic;
      
      -- Input of fifo
      TUSER_MOSI  : in t_axi4_stream_mosi32;
      TUSER_MISO  : in t_axi4_stream_miso;
      
      -- Input of data
      RX_MOSI     : in t_axi4_stream_mosi32;
      RX_MISO     : out t_axi4_stream_miso;
      
      -- Output of data with tuser of fifo
      TX_MOSI     : out t_axi4_stream_mosi32;
      TX_MISO     : in t_axi4_stream_miso;
      
      -- overflow
      OVFL     : out std_logic
      
      );
end axis32_tuser_merge;

architecture rtl of axis32_tuser_merge is

COMPONENT fwft_sfifo_w8_d16
  PORT (
    clk : IN STD_LOGIC;
    srst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    full : OUT STD_LOGIC;
    overflow : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    valid : OUT STD_LOGIC
  );
END COMPONENT;	  

component sync_reset
  port(
     ARESET : in std_logic;
     SRESET : out std_logic;
     CLK    : in std_logic);
end component; 

signal input_valid : std_logic;
signal exchange_valid : std_logic;		 
signal areset             : std_logic;
signal sreset             : std_logic;
signal fifo_out_tuser     : std_logic_vector(TX_MOSI.TUSER'range);
   
begin
	
areset <= not ARESETN;		

   -- synchro reset   
   U0: sync_reset
   port map(
      ARESET => areset,
      CLK    => CLK,
      SRESET => sreset
      ); 
	
input_valid <= TUSER_MOSI.TVALID and TUSER_MISO.TREADY;	
exchange_valid <= RX_MOSI.TVALID and TX_MISO.TREADY;					 

RX_MISO <= TX_MISO;
TX_MOSI.TVALID <= RX_MOSI.TVALID;
TX_MOSI.TDATA <= RX_MOSI.TDATA;
TX_MOSI.TSTRB <= RX_MOSI.TSTRB;
TX_MOSI.TKEEP <= RX_MOSI.TKEEP;
TX_MOSI.TLAST <= RX_MOSI.TLAST;
TX_MOSI.TID <= RX_MOSI.TID;
TX_MOSI.TDEST <= RX_MOSI.TDEST;
TX_MOSI.TUSER <= fifo_out_tuser;

fifo : fwft_sfifo_w8_d16
  PORT MAP (
    clk => CLK,
    srst => sreset,
    din => TUSER_MOSI.TUSER,
    wr_en => input_valid,
    rd_en => exchange_valid,
    dout => fifo_out_tuser,
    full => open,
    overflow => OVFL,
    empty => open,
    valid => open
  );
   
end rtl;
