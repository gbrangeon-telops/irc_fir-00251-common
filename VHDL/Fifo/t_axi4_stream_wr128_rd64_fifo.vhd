------------------------------------------------------------------
--!   @file : t_axi4_stream_Wr128_Rd64_fifo
--!   @brief
--!   @details
--!
--!   $Rev: 23582 $
--!   $Author: elarouche $
--!   $Date: 2019-05-19 12:37:34 -0400 (dim., 19 mai 2019) $
--!   $Id:
--!   $URL: http://einstein/svn/firmware/FIR-00251-Common/trunk/VHDL/Fifo/t_axi4_stream_wr64_rd32_fifo.vhd $
------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all; 
use work.tel2000.all;

entity t_axi4_stream_wr128_rd64_fifo is
   generic( 
   WR_FIFO_DEPTH : integer := 16;
   ASYNC          : boolean := true 
   ); 
  
   port(
   ARESETN  : in std_logic;
   
   -- slave side (write channel only)
   RX_CLK   : in std_logic;
   RX_MOSI  : in t_axi4_stream_mosi128;
   RX_MISO  : out t_axi4_stream_miso;
   
   -- master side 
   TX_CLK   : in std_logic;
   TX_MOSI  : out t_axi4_stream_mosi64;
   TX_MISO  : in t_axi4_stream_miso;
   
   -- overflow
   OVFL     : out std_logic
   );
   attribute KEEP_HIERARCHY : string;
   attribute KEEP_HIERARCHY of t_axi4_stream_wr128_rd64_fifo : entity is "yes";
end t_axi4_stream_wr128_rd64_fifo; 

architecture rtl of t_axi4_stream_wr128_rd64_fifo is
   

  COMPONENT fwft_afifo_wr132_rd66_d16
  Port ( 
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 131 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 65 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    valid : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  END COMPONENT; 
  
   COMPONENT fwft_sfifo_wr132_rd66_d32
   PORT (         
          clk : in STD_LOGIC;
          srst : in STD_LOGIC;
          din : in STD_LOGIC_VECTOR ( 131 downto 0 );
          wr_en : in STD_LOGIC;
          rd_en : in STD_LOGIC;
          dout : out STD_LOGIC_VECTOR ( 65 downto 0 );
          full : out STD_LOGIC;
          empty : out STD_LOGIC;
          valid : out STD_LOGIC
         );
   END COMPONENT;
   
   signal FoundGenCase     : boolean := FALSE;

   signal areset        : std_logic;
   
   signal fifo_din  : STD_LOGIC_VECTOR ( 131 downto 0 ); 
   
   signal fifo_dout  : STD_LOGIC_VECTOR ( 65 downto 0 );
   signal fifo_full     : std_logic;
      attribute KEEP of fifo_full : signal is "TRUE";
   signal fifo_empty     : std_logic;
      attribute KEEP of fifo_empty : signal is "TRUE";  
   signal fifo_wr_en    : std_logic;
      attribute KEEP of fifo_wr_en : signal is "TRUE";
   signal fifo_rd_en    : std_logic;
      attribute KEEP of fifo_rd_en : signal is "TRUE";
   signal fifo_valid    : std_logic;
      attribute KEEP of fifo_valid : signal is "TRUE";
   signal fifo_overflow    : std_logic;
      attribute KEEP of fifo_overflow : signal is "TRUE";
   signal rx_tready        : std_logic  := '0';
	attribute KEEP of rx_tready : signal is "TRUE";
	
begin  
      
     areset <= not ARESETN ; 
     OVFL <= fifo_overflow;

     -- Write control
     rx_tready <= (not fifo_full);
     RX_MISO.TREADY <= rx_tready;
     fifo_wr_en <= RX_MOSI.TVALID and rx_tready;

     -- Read control
     TX_MOSI.TVALID <= fifo_valid;
     fifo_rd_en <=  TX_MISO.TREADY and fifo_valid and (not fifo_empty) ; 
      
     ---------------------------- INPUT MAPPING ----------------------------------
     -- Note : Transaction ordering of asymetrical fifo IP (parallel to serial): 
     -- input side -> [Transaction 3, Transaction 2, Transaction 1, Transaction 0] (1x 72 bits)
    
                       ------------------------- time ------------------------------>
     -- output side -> [Transaction 3],[Transaction 2],[Transaction 1],[Transaction 0]  (4x 18 bits)
    
     -- Thus, we have to reorder the transaction to have the first transaction to get out to be the LSB position.
     --                                  TDATA                  TID                TLAST      
      fifo_din(131 downto 0) <= RX_MOSI.TDATA(63 downto 0)   &  '0'              &   '0'           &
                                RX_MOSI.TDATA(127 downto 64) &  RX_MOSI.TID(0)   &   RX_MOSI.TLAST ;

                          
      ---------------------------- OUTPUT MAPPING ----------------------------------
      TX_MOSI.TDATA <= fifo_dout(65 downto 2); 
      TX_MOSI.TID(0)<= fifo_dout(1);
      TX_MOSI.TLAST <= fifo_dout(0);
      
      TX_MOSI.TKEEP <=  (others => '1');
      TX_MOSI.TSTRB <= (others => '1');
      TX_MOSI.TDEST <= (others => '0'); -- non géré
      TX_MOSI.TUSER <= (others => '0'); -- non géré  
      
  
   	agen_wr128_rd64_d16 : if (WR_FIFO_DEPTH > 0 and WR_FIFO_DEPTH <= 16 and ASYNC) generate    
   begin  
      
      FoundGenCase <= true;  

      fwft_afifo_wr132_rd66_d16_inst : fwft_afifo_wr132_rd66_d16
      PORT MAP (
          wr_clk => RX_CLK,
          rd_clk => TX_CLK,
          rst => areset,
          din => fifo_din,
          wr_en => fifo_wr_en,
          rd_en => fifo_rd_en,
          dout => fifo_dout,
          full => fifo_full,
          empty => fifo_empty,
          valid => fifo_valid,
          wr_rst_busy => open,
          rd_rst_busy => open
         );
   end generate;

   sgen_wr128_rd64_d32 :  if (WR_FIFO_DEPTH > 16 and WR_FIFO_DEPTH <= 32 and not ASYNC) generate    
   begin  
      
      FoundGenCase <= true;  

      fwft_sfifo_wr132_rd66_d32_inst : fwft_sfifo_wr132_rd66_d32
      PORT MAP (
          clk => RX_CLK,
          srst => areset,
          din => fifo_din,
          wr_en => fifo_wr_en,
          rd_en => fifo_rd_en,
          dout => fifo_dout,
          full => fifo_full,
          empty => fifo_empty,
          valid => fifo_valid
         );
   end generate;
   
   
   ovfl_proc : process(RX_CLK, ARESETN)
       begin	
          if ARESETN = '0' then 
             fifo_overflow <= '0';
          elsif rising_edge(RX_CLK) then
             if (rx_tready = '0' and RX_MOSI.TVALID = '1') then
                fifo_overflow <= '1';
             end if;
 
             -- pragma translate_off
             assert (FoundGenCase or WR_FIFO_DEPTH = 0) report "Invalid LocalLink fifo generic settings!" severity FAILURE;
             if FoundGenCase then
                assert (fifo_overflow = '0') report "AxiStream fifo overflow!!!" severity ERROR;
             end if;
             -- pragma translate_on	
          end if;
       end process; 	  
end rtl;
