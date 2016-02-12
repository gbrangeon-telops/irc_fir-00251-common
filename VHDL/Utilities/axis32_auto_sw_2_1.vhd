-------------------------------------------------------------------------------
--
-- Title       : axis32_auto_sw_2_1
-- Author      : Patrick Dubois
-- Company     : Telops/COPL/LRTS
--
-------------------------------------------------------------------------------
--
-- Description : switch qui bascule automatiquement entre les deux entrées 
--               dès qu'un TLAST est rencontré en entrée.
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use work.Tel2000.all;

entity axis32_auto_sw_2_1 is
   
   port(      
      RX0_MOSI : in t_axi4_stream_mosi32;
      RX0_MISO : out t_axi4_stream_miso;
      
      RX1_MOSI : in t_axi4_stream_mosi32;
      RX1_MISO : out t_axi4_stream_miso;
      
      TX_MOSI  : out t_axi4_stream_mosi32;
      TX_MISO  : in t_axi4_stream_miso;   
      
      ARESETN  : in  std_logic;
      CLK      : in  std_logic     
      );
end axis32_auto_sw_2_1;


architecture RTL of axis32_auto_sw_2_1 is 
   
   signal areset, sreset   : std_logic;
   signal tx_mosi_i        : t_axi4_stream_mosi32;
   signal in0_enabled_s    : std_logic;
   signal in1_enabled_s    : std_logic;
   
   component sync_reset
      port(
         ARESET : in std_logic;
         SRESET : out std_logic;
         CLK    : in std_logic);
   end component;  
   
   
begin    
   
   areset <= not ARESETN;     
   
   RX0_MISO.TREADY <= (TX_MISO.TREADY and in0_enabled_s); 
   RX1_MISO.TREADY <= (TX_MISO.TREADY and in1_enabled_s);
   TX_MOSI <= tx_mosi_i;
   
   --------------------------------------------------
   -- synchro reset 
   --------------------------------------------------   
   U1: sync_reset
   port map(
      ARESET => ARESET,
      CLK    => CLK,
      SRESET => sreset
      );
   
   ----------------------------------------------------------
   --  aiguillage automatique
   ----------------------------------------------------------
   U2: process(CLK)
      
   begin
      if rising_edge(CLK) then         
         if sreset = '1' then 
            in0_enabled_s <= '1';
            in1_enabled_s <= '0';
            tx_mosi_i.tvalid <= '0';
         else
            
            if TX_MISO.TREADY = '1' then 
               -- choix des canaux d'entrée
               if RX0_MOSI.TVALID = '1' and RX0_MOSI.TLAST = '1' and in0_enabled_s = '1' then 
                  in0_enabled_s <= '0';
                  in1_enabled_s <= '1';
               end if;                                  
               if RX1_MOSI.TVALID = '1' and RX1_MOSI.TLAST = '1' and in1_enabled_s = '1' then 
                  in0_enabled_s <= '1';
                  in1_enabled_s <= '0';
               end if;          
               
               -- validation signal pour canal de sortie  
               if in0_enabled_s = '1' then
                  tx_mosi_i <= RX0_MOSI;
               end if;
               if in1_enabled_s = '1' then
                  tx_mosi_i <= RX1_MOSI;
               end if;
               
            end if;
            
         end if;      
      end if;
      
   end process;   
   
end RTL;
