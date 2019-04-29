-------------------------------------------------------------------------------
--
-- Title       : axis64_img_sof_output
-- Author      : Jean-Alexis Boulet
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- Description : axis64 Start of Frame detection
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use work.Tel2000.all;

entity axis64_img_sof_output is
   generic(
      HDER_TLAST_EN  : boolean := true
   );
   port(
      RX_MOSI  : in  t_axi4_stream_mosi64;
      RX_MISO  : in t_axi4_stream_miso;

      SOF      : out  std_logic;
      
      ARESETN  : in  std_logic;
      CLK      : in  std_logic     
   );
end axis64_img_sof_output;


architecture RTL of axis64_img_sof_output is 
   
   signal sresetn   : std_logic;   
   signal eof_s     : std_logic;
   signal gen_tid   : std_logic := '0';   -- Not used when HDER_TLAST_EN is false
   
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
   
   ----------------------------------------------------------
   -- SOF DETECT
   ----------------------------------------------------------
   hder_tlast_disabled_gen: if HDER_TLAST_EN = false generate	
   begin
      
      SOF_DETECT : process(CLK)
      begin
         if rising_edge(CLK) then
            if sresetn = '0' then            
               eof_s <= '1'; -- end of frame detected
               SOF <= '0'; -- Busy at reset
            else
               --find eof
               if(eof_s = '0' and RX_MOSI.TVALID = '1' and RX_MOSI.TLAST = '1' and RX_MISO.TREADY = '1') then-- end of frame
                   eof_s <= '1';
                   SOF <= '0';
               elsif(eof_s = '1' and RX_MOSI.TVALID = '1' and RX_MOSI.TLAST = '0' and RX_MISO.TREADY = '1') then-- Start of frame 
                   eof_s <= '0';
                   SOF <= '1';
               else
                   eof_s <= eof_s;
                   SOF <= '0';
               end if;
   
            end if;
         end if;
      end process;
      
   end generate;
   
   hder_tlast_enabled_gen: if HDER_TLAST_EN = true generate	
   begin
      
      SOF_DETECT : process(CLK)
      begin
         if rising_edge(CLK) then
            if sresetn = '0' then            
               eof_s <= '1'; -- end of frame detected
               gen_tid <= '1'; -- start with header
               SOF <= '0'; -- Busy at reset
            else
               --find eof
               if(eof_s = '0' and RX_MOSI.TVALID = '1' and RX_MOSI.TLAST = '1' and RX_MISO.TREADY = '1') then-- end of frame
                   eof_s <= not gen_tid;
                   gen_tid <= not gen_tid;
                   SOF <= '0';
               elsif(eof_s = '1' and RX_MOSI.TVALID = '1' and RX_MOSI.TLAST = '0' and RX_MISO.TREADY = '1') then-- Start of frame 
                   eof_s <= '0';
                   gen_tid <= gen_tid;
                   SOF <= '1';
               else
                   eof_s <= eof_s;
                   gen_tid <= gen_tid;
                   SOF <= '0';
               end if;
   
            end if;
         end if;
      end process;
      
   end generate;
   
end RTL;
