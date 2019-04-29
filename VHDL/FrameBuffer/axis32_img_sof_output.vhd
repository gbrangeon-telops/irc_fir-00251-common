-------------------------------------------------------------------------------
--
-- Title       : axis32_img_sof_output
-- Author      : Jean-Alexis Boulet
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- Description : axis32 Start of Frame detection
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use work.Tel2000.all;

entity axis32_img_sof_output is
   
   port(
      RX_MOSI  : in  t_axi4_stream_mosi32;
      RX_MISO  : in t_axi4_stream_miso;

      SOF      : out  std_logic;  
	   fifo_not_empty      : out  std_logic;
      
      ARESETN  : in  std_logic;
      CLK      : in  std_logic     
      );
end axis32_img_sof_output;


architecture RTL of axis32_img_sof_output is 
   
   signal sresetn   : std_logic;   
   signal eof_s     : std_logic;
   signal fifo_not_empty_s     : std_logic_vector(2 downto 0);
   
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
   process(CLK)
   begin
      if rising_edge(CLK) then
         if sresetn = '0' then            
            eof_s <= '1'; -- Busy at reset
            SOF <= '0'; -- Busy at reset 
            fifo_not_empty_s <= (others => '0');
         else			  
            fifo_not_empty_s <= fifo_not_empty_s(1 downto 0) & RX_MOSI.TVALID;
            fifo_not_empty   <= fifo_not_empty_s(2);
            ----find eof
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
   
end RTL;
