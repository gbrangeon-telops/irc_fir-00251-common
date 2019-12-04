-------------------------------------------------------------------------------
--
-- Title       : axis64_auto_sw_1_2
-- Author      : Philippe Couture
-- Company     : Telops
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

entity axis64_auto_sw_1_2 is
   
   port(
      RX_MOSI  : in  t_axi4_stream_mosi64;
      RX_MISO  : out t_axi4_stream_miso;
      
      TX0_MOSI : out t_axi4_stream_mosi64;
      TX0_MISO : in  t_axi4_stream_miso;
      
      TX1_MOSI : out t_axi4_stream_mosi64;
      TX1_MISO : in  t_axi4_stream_miso;
      
      ARESETN  : in  std_logic;
      CLK      : in  std_logic     
      );
   attribute keep_hierarchy : string;
   attribute keep_hierarchy of axis64_auto_sw_1_2 : entity is "yes";
   
end axis64_auto_sw_1_2;

architecture RTL of axis64_auto_sw_1_2 is 
   
   signal sresetn       : std_logic; 
   type STATE is (TX0, TX1);
   signal active_output       : STATE := TX0;
   
   component sync_resetn
      port(
         ARESETN : in std_logic;
         SRESETN : out std_logic;
         CLK    : in std_logic);
   end component;  
   
   
begin    
   
   TX0_MOSI.TVALID <= RX_MOSI.TVALID when active_output = TX0 else '0';
   TX0_MOSI.TLAST <= RX_MOSI.TLAST; 
   TX0_MOSI.TDATA <= RX_MOSI.TDATA;   
   TX0_MOSI.TID <= RX_MOSI.TID;  

   TX1_MOSI.TVALID <= RX_MOSI.TVALID when active_output = TX1 else '0';
   TX1_MOSI.TLAST <= RX_MOSI.TLAST; 
   TX1_MOSI.TDATA <= RX_MOSI.TDATA;   
   TX1_MOSI.TID <= RX_MOSI.TID;
   
   RX_MISO <= TX0_MISO when active_output = TX0 else TX1_MISO;  
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
         
            active_output <= TX0;        
         
         else         
         
            case active_output is
            
               when TX0 =>   
               
                  if(RX_MOSI.TVALID = '1' and RX_MOSI.TLAST = '1' and TX0_MISO.TREADY = '1') then
                     active_output <= TX1;
                  end if; 
               
               when TX1 =>       
               
                  if(RX_MOSI.TVALID = '1' and RX_MOSI.TLAST = '1' and TX1_MISO.TREADY = '1') then
                     active_output <= TX0;
                  end if;
               
               when others =>
            
            end case;
         end if;      
      end if;
      
   end process;   
   
end RTL;
