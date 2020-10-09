------------------------------------------------------------------
--!   @file : t_axi4_ajout_tuser
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

entity axis_add_tuser is
   generic(                            
      FifoSize		   : integer := 16;     -- 
      ASYNC          : boolean := false);	-- Use asynchronous fifos
   
   port(
   	  ARESETN  : in std_logic;
      
      -- Input of fifo
      RX_CLK   : in std_logic;
      RX_MOSI  : in t_axi4_stream_mosi32;
      RX_MISO  : in t_axi4_stream_miso;
      
      -- Input of data
      RXA_MOSI     : in t_axi4_stream_mosi32;
      RXA_MISO     : out t_axi4_stream_miso;
      
      -- Output of data with tuser of fifo
      TX_MOSI  : out t_axi4_stream_mosi32;
      TX_MISO  : in t_axi4_stream_miso;
      
      -- overflow
      OVFL     : out std_logic
      
      );
end axis_add_tuser;

architecture rtl of axis_add_tuser is

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
   
begin
	
areset <= not ARESETN;		

   -- synchro reset   
   U0: sync_reset
   port map(
      ARESET => areset,
      CLK    => RX_CLK,
      SRESET => sreset
      ); 
	
input_valid <= RX_MOSI.TVALID and RX_MISO.TREADY;	
exchange_valid <= RXA_MOSI.TVALID and TX_MISO.TREADY;					 

RXA_MISO <= TX_MISO;
TX_MOSI.TVALID <= RXA_MOSI.TVALID;
TX_MOSI.TDATA <= RXA_MOSI.TDATA;
TX_MOSI.TSTRB <= RXA_MOSI.TSTRB;
TX_MOSI.TKEEP <= RXA_MOSI.TKEEP;
TX_MOSI.TLAST <= RXA_MOSI.TLAST;
TX_MOSI.TID <= RXA_MOSI.TID;
TX_MOSI.TDEST <= RXA_MOSI.TDEST;

fifo : fwft_sfifo_w8_d16
  PORT MAP (
    clk => RX_CLK,
    srst => sreset,
    din => RX_MOSI.TUSER,
    wr_en => input_valid,
    rd_en => exchange_valid,
    dout => TX_MOSI.TUSER,
    full => open,
    overflow => OVFL,
    empty => open,
    valid => open
  );
   
end rtl;
