------------------------------------------------------------------
--!   @file : pixel_saturation_repl
--!   @brief
--!   @details
--!
--!   $Rev$
--!   $Author$
--!   $Date$
--!   $Id$
--!   $URL$
------------------------------------------------------------------  

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use work.tel2000.all;

entity pixel_bad_repl is   
   port(
      ARESETN         : in std_logic;
      CLK             : in std_logic;
      
      RX_MOSI         : in t_axi4_stream_mosi16;
      RX_MISO         : out t_axi4_stream_miso;
      
      TX_MOSI         : out t_axi4_stream_mosi16;  
      TX_MISO         : in t_axi4_stream_miso
      
      );
end pixel_bad_repl;

architecture rtl of pixel_bad_repl is
   
   component sync_reset
      port(
         ARESET : in std_logic;
         SRESET : out std_logic;
         CLK    : in std_logic);
   end component; 
   
   signal areset             : std_logic;
   signal sreset             : std_logic;
   
begin  
   
   
   areset <= not ARESETN;
   
   -- synchro reset   
   U0: sync_reset
   port map(
      ARESET => areset,
      CLK    => CLK,
      SRESET => sreset
      ); 
   
   RX_MISO <= TX_MISO;   
   
   
   -- recodage des pixels satur�s via TUSER(1)  
   U1: process(CLK)
   begin
      if rising_edge(CLK) then
         if sreset = '1' then 
            TX_MOSI.TVALID <= '0';
         else
            
            if TX_MISO.TREADY = '1' then 
               TX_MOSI <= RX_MOSI;
               if RX_MOSI.TUSER(TUSER_BAD_PIX_BIT)= '1' then 
                  TX_MOSI.TDATA <= TAG_BAD_PIX;
               end if;
            end if;          
            
         end if; 
      end if; 
   end process;
   
end rtl;

