-------------------------------------------------------------------------------
--
-- Title       : axis32_reg
-- Author      : SSA
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- Description : Registered AXIS32 pipe. One CLK delay between RX and TX.
--
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use work.tel2000.all; 

entity axis32_reg is
   port(     
      RX_MOSI  : in  t_axi4_stream_mosi32; 
      RX_MISO  : out t_axi4_stream_miso;
      
      TX_MOSI  : out t_axi4_stream_mosi32;
      TX_MISO  : in  t_axi4_stream_miso; 
            
      ARESETN  : in  std_logic;
      CLK      : in  std_logic 
      );
end axis32_reg;

architecture RTL of axis32_reg is
   component sync_reset
      port(
         ARESET : in std_logic;
         SRESET : out std_logic;
         CLK    : in std_logic);
   end component; 
     
   signal tx_mosi_i        : t_axi4_stream_mosi32;
   signal rx_miso_i        : t_axi4_stream_miso;
   
   signal rx_mosi_hold : t_axi4_stream_mosi32;
   
   signal areset, sreset : std_logic;   
   
begin
   
   areset <= not aresetn;
   
   U0: sync_reset
   port map(
      ARESET => areset,
      CLK    => CLK,
      SRESET => sreset
      ); 
   
   RX_MISO <= rx_miso_i;
   TX_MOSI <= tx_mosi_i; 
      
   U1 : process(CLK)
   begin       
      if rising_edge(CLK) then
         if sreset = '1' then          
            tx_mosi_i.TVALID <= '0';
            rx_mosi_hold.TVALID <= '0';
            rx_miso_i.TREADY <= '0';
         else            
            rx_miso_i <= TX_MISO;
            
            if rx_miso_i.TREADY = '1' then
               rx_mosi_hold <= RX_MOSI;
            end if;
            
            if TX_MISO.TREADY = '1' then
               tx_mosi_i <= RX_MOSI;
            end if;
            
            if TX_MISO.TREADY = '1' and rx_miso_i.TREADY = '0' then
               tx_mosi_i <= rx_mosi_hold;
            end if;            
                        
         end if;
      end if;
   end process;
   
end RTL;
