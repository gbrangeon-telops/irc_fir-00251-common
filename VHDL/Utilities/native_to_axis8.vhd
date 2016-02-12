------------------------------------------------------------------
--!   @file : native_to_axis32
--!   @brief
--!   @details : ce module permetde convertir les données natives en format axis.
--!
--!   $Rev$
--!   $Author$
--!   $Date$
--!   $Id$
--!   $URL$
------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;           
use IEEE.numeric_std.ALL;
use work.Tel2000.all;

entity native_to_axis8 is
   port(
      ARESET        : in std_logic;
      CLK           : in std_logic;      
      
      IN_DATA       : in std_logic_vector(31 downto 0);
      IN_DVAL       : in std_logic; 
      IN_EOF        : in std_logic;
      IN_BUSY       : out std_logic;
      
      AXIS_MOSI     : out t_axi4_stream_mosi8;
      AXIS_MISO     : in t_axi4_stream_miso;
      
      ERR           : out std_logic  
      );
end native_to_axis8;



architecture rtl of native_to_axis8 is
   
   
   component sync_reset
      port (
         ARESET : in std_logic;
         CLK    : in std_logic;
         SRESET : out std_logic := '1'
         );
   end component;  
   
   signal sreset : std_logic;
   
begin
   
   IN_BUSY <= not AXIS_MISO.TREADY;
   
   -----------------------------------------------------
   -- Synchronisation reset
   -----------------------------------------------------
   U1: sync_reset
   Port map(		
      ARESET   => ARESET,		
      SRESET   => sreset,
      CLK   => CLK);   
   
   ----------------------------------------------------------------------------
   -- AXIS vers NATIVE
   ---------------------------------------------------------------------------- 
   U6: process (CLK)
   begin
      if rising_edge(CLK) then 
         if sreset = '1' then
            AXIS_MOSI.TVALID <= '0'; 
         else             
            
            if AXIS_MISO.TREADY = '1' then 
               AXIS_MOSI.TVALID <= IN_DVAL; 
               AXIS_MOSI.TDATA <= IN_DATA(7 downto 0);
               AXIS_MOSI.TSTRB <= (others => '1');
               AXIS_MOSI.TKEEP <= (others => '1');
               AXIS_MOSI.TLAST <= IN_EOF;
               AXIS_MOSI.TID   <= (others =>'0'); -- non géré 
               AXIS_MOSI.TDEST <= (others =>'0'); -- non géré 
               AXIS_MOSI.TUSER <= (others =>'0'); -- non géré 
            end if;
            
         end if;
      end if;
   end process;
   
end rtl;
