-------------------------------------------------------------------------------
--
-- Title       : axis128_tid_gen
-- Author      : Simon Savary
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- Description : regenerate a tid in an AXI stream read back from memory, 
--                assuming that the first valid data after reset is an SOF
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use work.Tel2000.all;

entity axis128_tid_gen is
   generic(
      init_tid : std_logic := '1' -- the first TID value to inject
      );
   port(
      RX_MOSI  : in  t_axi4_stream_mosi128;
      RX_MISO  : out t_axi4_stream_miso;
      TX_MOSI  : out  t_axi4_stream_mosi128;
      TX_MISO  : in t_axi4_stream_miso;
      
      ARESETN  : in  std_logic;
      CLK      : in  std_logic     
      );
end axis128_tid_gen;


architecture RTL of axis128_tid_gen is 
   component sync_resetn
      port(
         ARESETN : in std_logic;
         SRESETN : out std_logic;
         CLK    : in std_logic);
   end component;  
   
   signal sresetn   : std_logic;
   
   signal tx_mosi_s : t_axi4_stream_mosi128;
   signal rx_miso_s : t_axi4_stream_miso;
   signal tid_s : std_logic_vector(0 downto 0);
begin    
   
   --------------------------------------------------
   -- synchro reset 
   --------------------------------------------------   
   U1: sync_resetn
   port map(
      ARESETN => ARESETN,
      CLK    => CLK,
      SRESETN => sresetn
      );
   
   tx_mosi_s.TVALID <= RX_MOSI.TVALID;
   tx_mosi_s.TDATA <= RX_MOSI.TDATA;
   tx_mosi_s.TSTRB  <= RX_MOSI.TSTRB;
   tx_mosi_s.TKEEP  <= RX_MOSI.TKEEP; 
   tx_mosi_s.TLAST  <= RX_MOSI.TLAST; 
   tx_mosi_s.TDEST  <= RX_MOSI.TDEST; 
   tx_mosi_s.TUSER  <= RX_MOSI.TUSER; 
   tx_mosi_s.TID    <= tid_s;
   
   rx_miso_s <= TX_MISO;
   RX_MISO <= rx_miso_s;
   TX_MOSI <= tx_mosi_s;
   
   tid_generation: process(CLK)
   begin
      if rising_edge(CLK) then
         if sresetn = '0' then            
            tid_s <= (others => init_tid); -- header ID at reset       
         else
            if RX_MOSI.TVALID = '1' and RX_MOSI.TLAST = '1' and TX_MISO.TREADY = '1' then            
               tid_s <= not tid_s;
            end if;
         end if;
      end if;
      
   end process;   
   
end RTL;
