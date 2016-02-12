
--!   Use IEEE standard library.
library IEEE;
--!   Use logic elements package from IEEE library.
use IEEE.STD_LOGIC_1164.all; 
--!   Use TEL2000 package package from work library. 
use work.TEL2000.all;

entity badpixel_handler is
port(

   CLK : in std_logic;
   ARESETN : in std_logic;

   RX_MOSI    : in  t_axi4_stream_mosi16;      
   RX_MISO    : out t_axi4_stream_miso;  
   
   TX_MOSI    : out  t_axi4_stream_mosi16;
   TX_MISO    : in t_axi4_stream_miso; 

   BADPIXEL_RX_MOSI    : in  t_axi4_stream_mosi8;      
   BADPIXEL_RX_MISO    : out t_axi4_stream_miso  

   );
end badpixel_handler;

architecture RTL of badpixel_handler is

   component sync_reset
      port(
         ARESET : in std_logic;
         SRESET : out std_logic;
         CLK    : in std_logic);
   end component;  

   component axis_sync_flow
      port(           
         RX0_TVALID    : in std_logic;
         RX0_TREADY    : out std_logic;
         
         RX1_TVALID    : in std_logic;
         RX1_TREADY    : out std_logic;
         
         SYNC_TREADY   : in std_logic;      
         SYNC_TVALID   : out std_logic               
      );
   end component;
   
   signal sreset         : std_logic;
   signal areset         : std_logic; 
   signal rx_ready       : std_logic; 
   signal flowsync_tvalid : std_logic; 

begin
   areset <= not ARESETN;   
   
   U0 : sync_reset
   port map(ARESET => areset, SRESET => sreset, CLK => CLK);
   
   U1 : axis_sync_flow
   port map(
         RX0_TVALID => RX_MOSI.TVALID,
         RX0_TREADY => RX_MISO.TREADY,
         
         RX1_TVALID => BADPIXEL_RX_MOSI.TVALID,
         RX1_TREADY => BADPIXEL_RX_MISO.TREADY,
         
         SYNC_TREADY => TX_MISO.TREADY,   
         SYNC_TVALID => flowsync_tvalid
   );
   
   TX_DATA: process(CLK)
   begin          
      if rising_edge(CLK) then
         
         if sreset = '1' then 
            TX_MOSI.TVALID <= '0';
         else
            
            if TX_MISO.TREADY = '1' then 
               if flowsync_tvalid = '1' then
                  TX_MOSI.TVALID  <= '1';

                  TX_MOSI.TSTRB   <= RX_MOSI.TSTRB;
                  TX_MOSI.TKEEP   <= RX_MOSI.TKEEP;
                  TX_MOSI.TLAST   <= RX_MOSI.TLAST;
                  TX_MOSI.TID     <= RX_MOSI.TID;
                  TX_MOSI.TDEST   <= RX_MOSI.TDEST;
                  TX_MOSI.TUSER   <= RX_MOSI.TUSER;
                  
                  if BADPIXEL_RX_MOSI.tdata = X"01" then            
                     TX_MOSI.TDATA   <= RX_MOSI.TDATA;
                  else              
                     TX_MOSI.TDATA   <= X"FFFE";
                  end if;
               else
                  TX_MOSI.TVALID  <= '0';
               end if;
            end if;
         end if;
         
      end if;
   end process;
   

end RTL;