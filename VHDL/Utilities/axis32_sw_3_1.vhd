-------------------------------------------------------------------------------
--
-- Title       : axis32_sw_3_1
-- Design      : Tel-2000
-- Author      : ENO
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- Description : axis32 Switch (mux) 3 to 1
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use work.Tel2000.all;

entity axis32_sw_3_1 is
   generic (
      trdy_when_off : std_logic := '0' -- set to '1' to make the other channels behave like a hole
      );
   port(
      RX0_MOSI : in  t_axi4_stream_mosi32;
      RX0_MISO : out t_axi4_stream_miso;
      
      RX1_MOSI : in  t_axi4_stream_mosi32;
      RX1_MISO : out t_axi4_stream_miso;
      
      RX2_MOSI : in  t_axi4_stream_mosi32;
      RX2_MISO : out t_axi4_stream_miso;
      
      TX_MOSI  : out t_axi4_stream_mosi32;
      TX_MISO  : in  t_axi4_stream_miso;
      
      SEL      : in std_logic_vector(1 downto 0);
      
      ARESETN  : in  std_logic;
      CLK      : in  STD_LOGIC
      );
end axis32_sw_3_1;


architecture RTL of axis32_sw_3_1 is
   
   signal sel_i          : std_logic_vector(1 downto 0);
   signal areset, sreset : std_logic;        
   
   component sync_reset
      port(
         ARESET : in std_logic;
         SRESET : out std_logic;
         CLK    : in std_logic);
   end component;  
   
begin
   
   areset <= not ARESETN;
   RX0_MISO.TREADY <= TX_MISO.TREADY when sel_i = "00" else trdy_when_off; 
   RX1_MISO.TREADY <= TX_MISO.TREADY when sel_i = "01" else trdy_when_off;
   RX2_MISO.TREADY <= TX_MISO.TREADY when sel_i = "10" else trdy_when_off;
      
   --------------------------------------------------
   -- synchro reset 
   --------------------------------------------------   
   U1: sync_reset
   port map(
      ARESET => ARESET,
      CLK    => CLK,
      SRESET => sreset
      ); 

   --------------------------------------------------
   -- Aiguillage
   -------------------------------------------------- 
   U2 : process(CLK)
   begin       
      if rising_edge(CLK) then
         if sreset = '1' then          
            TX_MOSI.TVALID <= '0';
            --RX0_MISO.TREADY <= '0';
            --RX1_MISO.TREADY <= '0';
            --RX2_MISO.TREADY <= '0';
            sel_i <= "11";
         else
            sel_i <= SEL;           
            if sel_i = "00" then
               --RX1_MISO.TREADY <= '0';
               --RX2_MISO.TREADY <= '0'; 
               if TX_MISO.TREADY = '1' then 
                  TX_MOSI <= RX0_MOSI;
                  --RX0_MISO <= TX_MISO;
               end if;       
            elsif sel_i = "01" then 
               --RX0_MISO.TREADY <= '0';
               --RX2_MISO.TREADY <= '0'; 
               if TX_MISO.TREADY = '1' then 
                  TX_MOSI <= RX1_MOSI;
                  --RX1_MISO <= TX_MISO;
               end if;
            elsif sel_i = "10" then
               --RX0_MISO.TREADY <= '0';
               --RX1_MISO.TREADY <= '0'; 
               if TX_MISO.TREADY = '1' then 
                  TX_MOSI <= RX2_MOSI;
                  --RX2_MISO <= TX_MISO;
               end if;               
            else
               TX_MOSI.TVALID <= '0';
               --RX0_MISO.TREADY <= '0';
               --RX1_MISO.TREADY <= '0';
               --RX2_MISO.TREADY <= '0';
            end if;            
         end if;
      end if;
   end process;
   
   
end RTL;
