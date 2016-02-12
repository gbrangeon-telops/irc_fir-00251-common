-------------------------------------------------------------------------------
--
-- Title       : axis16_auto_sw_1_2
-- Author      : Patrick Dubois
-- Company     : Telops/COPL/LRTS
--
-------------------------------------------------------------------------------
--
-- Description : switch qui bascule automatiquement entre les deux sorties 
--               dès qu'un TLAST est rencontré en entrée.
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use work.Tel2000.all;

entity axis32_auto_sw_1_2 is
   
   port(
      RX_MOSI  : in  t_axi4_stream_mosi32;
      RX_MISO  : out t_axi4_stream_miso;
      
      TX0_MOSI : out t_axi4_stream_mosi32;
      TX0_MISO : in  t_axi4_stream_miso;
      
      TX1_MOSI : out t_axi4_stream_mosi32;
      TX1_MISO : in  t_axi4_stream_miso;
      
      ARESETN  : in  std_logic;
      CLK      : in  std_logic     
      );
end axis32_auto_sw_1_2;


architecture RTL of axis32_auto_sw_1_2 is 
   
   signal areset, sreset   : std_logic;
   signal tx0_mosi_i       : t_axi4_stream_mosi32;
   signal tx1_mosi_i       : t_axi4_stream_mosi32;
   signal out0_enabled_s   : std_logic;
   signal out1_enabled_s   : std_logic;
   
   component sync_reset
      port(
         ARESET : in std_logic;
         SRESET : out std_logic;
         CLK    : in std_logic);
   end component;  
   
   
begin    
   
   areset <= not ARESETN;     
   
   RX_MISO.TREADY <= (TX0_MISO.TREADY and out0_enabled_s) or (TX1_MISO.TREADY and out1_enabled_s);
   TX0_MOSI <= tx0_mosi_i;
   TX1_MOSI <= tx1_mosi_i;
   
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
      variable out0_enabled_v : std_logic;
      variable out1_enabled_v : std_logic;
   begin
      if rising_edge(CLK) then
         
         if sreset = '1' then            
            tx0_mosi_i.tvalid <= '0';
            tx1_mosi_i.tvalid <= '0';
            out0_enabled_v  := '1';    -- la premiere position passante est TX0_MOSI;
            out1_enabled_v  := '0';
            out0_enabled_s <= out0_enabled_v;
            out1_enabled_s <= out1_enabled_v;
            
         else
            -- assignations par defaut
            tx0_mosi_i <= RX_MOSI;
            tx1_mosi_i <= RX_MOSI;
            
            -- choix des canaux de sortie
            if tx0_mosi_i.tvalid = '1' and tx0_mosi_i.tlast = '1' and TX0_MISO.TREADY = '1' then 
               out0_enabled_v := '0';
               out1_enabled_v := '1';
            end if;                                  
            if tx1_mosi_i.tvalid = '1' and tx1_mosi_i.tlast = '1' and TX1_MISO.TREADY = '1' then 
               out0_enabled_v := '1';
               out1_enabled_v := '0';
            end if;
            out0_enabled_s <= out0_enabled_v;
            out1_enabled_s <= out1_enabled_v;
            
            -- validation signal pour canal de sortie            
            tx0_mosi_i.tvalid <= RX_MOSI.TVALID and out0_enabled_v;
            tx1_mosi_i.tvalid <= RX_MOSI.TVALID and out1_enabled_v;
            
         end if;      
      end if;
      
   end process;   
   
end RTL;
