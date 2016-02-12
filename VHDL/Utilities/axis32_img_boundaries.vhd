-------------------------------------------------------------------------------
--
-- Title       : axis32_sw_1_2
-- Author      : Jean-Alexis Boulet
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- Description : decode SOF/EOF from axi stream 32
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use work.Tel2000.all;

entity axis32_img_boundaries is
   
   port(
      RX_MOSI  : in  t_axi4_stream_mosi32;
      RX_MISO  : in t_axi4_stream_miso;
      
      SOF      : out std_logic; -- pulse at the beginning of a frame
      EOF      : out std_logic; -- indicates if a frame is done (held at the end of the image until next SOF)
      
      ARESETN  : in  std_logic;
      CLK      : in  std_logic     
      );
end axis32_img_boundaries;


architecture RTL of axis32_img_boundaries is 
   
   signal sresetn   : std_logic;   
   signal eof_s     : std_logic;
   signal sof_s     : std_logic;
   
   component sync_resetn
      port(
         ARESETN : in std_logic;
         SRESETN : out std_logic;
         CLK    : in std_logic);
   end component;  
   
   
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
   
   SOF <= sof_s;
   EOF <= eof_s;
   ----------------------------------------------------------
   -- SOF DETECT
   ----------------------------------------------------------
   process(CLK)
   begin
      if rising_edge(CLK) then
         if sresetn = '0' then            
            eof_s <= '1';
            sof_s <= '0';
         else
            --find eof
            if(eof_s = '0' and RX_MOSI.TVALID = '1' and RX_MOSI.TLAST = '1' and RX_MOSI.TID = "0" and RX_MISO.TREADY = '1') then-- end of image
               eof_s <= '1';
               sof_s <= '0';
            elsif(eof_s = '1' and RX_MOSI.TVALID = '1' and RX_MOSI.TLAST = '0' and RX_MOSI.TID = "1" and RX_MISO.TREADY = '1') then-- Start of image 
               eof_s <= '0';
               sof_s <= '1';
            else
               eof_s <= eof_s;
               sof_s <= '0';
            end if;
            
         end if;
      end if;
      
   end process;   
   
end RTL;
