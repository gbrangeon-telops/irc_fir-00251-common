-------------------------------------------------------------------------------
--
-- Title       : axis32_auto_sw_1_2
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
   attribute keep_hierarchy : string;
   attribute keep_hierarchy of axis32_auto_sw_1_2 : entity is "yes";
   
end axis32_auto_sw_1_2;




architecture RTL of axis32_auto_sw_1_2 is 
   
   signal sresetn       : std_logic;
   signal rx_mosi_i     : t_axi4_stream_mosi32;
   signal tx_miso_o     : t_axi4_stream_miso;
   signal active_output : std_logic;

   
   component sync_resetn
      port(
         ARESETN : in std_logic;
         SRESETN : out std_logic;
         CLK    : in std_logic);
   end component;  
   
   
begin    

   RX_MISO <= TX0_MISO when active_output = '0' else TX1_MISO;

   --------------------------------------------------
   -- synchro reset 
   --------------------------------------------------   
   U1: sync_resetn
   port map(
      ARESETN => ARESETN,
      CLK    => CLK,
      SRESETN => sresetn
      );
   

   
   ----------------------------------------------------------
   --  aiguillage automatique
   ----------------------------------------------------------
   U2: process(CLK)
   begin
      if rising_edge(CLK) then
         
         if sresetn = '0' then            

            TX0_MOSI.tuser <= (others => '0');
            TX0_MOSI.tstrb <= (others => '1');
            TX0_MOSI.tkeep <= (others => '1');
            TX0_MOSI.tdest <= (others => '0');
            TX0_MOSI.tid <= "1";
            TX0_MOSI.tlast <= '0';
            TX0_MOSI.tvalid <= '0';
            
            TX1_MOSI.tuser <= (others => '0');
            TX1_MOSI.tstrb <= (others => '1');
            TX1_MOSI.tkeep <= (others => '1');
            TX1_MOSI.tdest <= (others => '0');
            TX1_MOSI.tid <= "0";
            TX1_MOSI.tlast <= '0';
            TX1_MOSI.tvalid <= '0';

            rx_mosi_i.tuser <= (others => '0');
            rx_mosi_i.tstrb <= (others => '1');
            rx_mosi_i.tkeep <= (others => '1');
            rx_mosi_i.tdest <= (others => '0');
            rx_mosi_i.tid <= "0";
            rx_mosi_i.tlast <= '0';
            rx_mosi_i.tvalid <= '0';
            
            tx_miso_o.TREADY <= '0';
            
            active_output <= '0';
            
         else
            -- assignations par defaut
            if( active_output = '0' and TX0_MISO.TREADY = '1') then
                rx_mosi_i <= RX_MOSI;
                TX0_MOSI <= rx_mosi_i;
                TX1_MOSI.TVALID <= '0';
            elsif( active_output = '1' and TX1_MISO.TREADY = '1') then
                rx_mosi_i <= RX_MOSI;
                TX1_MOSI <= rx_mosi_i;
                TX0_MOSI.TVALID <= '0';
            end if;

            if(rx_mosi_i.tvalid = '1' and rx_mosi_i.tlast = '1' and active_output = '0' and TX0_MISO.TREADY = '1') then
                active_output <= '1';
            elsif(rx_mosi_i.tvalid = '1' and rx_mosi_i.tlast = '1' and active_output = '1' and TX1_MISO.TREADY = '1') then
                active_output <= '0';
            end if;
            
         end if;      
      end if;
      
   end process;   
   
end RTL;
