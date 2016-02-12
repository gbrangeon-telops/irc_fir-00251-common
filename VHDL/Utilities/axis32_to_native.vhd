------------------------------------------------------------------
--!   @file : axis32_to_native
--!   @brief
--!   @details: ce module permet de transformer un lien axis en lien natif. Il a été utile pour s'interfacer avec une RAM native.
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

entity axis32_to_native is
   port(
      ARESET        : in std_logic;
      CLK           : in std_logic;      
      
      AXIS_MOSI     : in t_axi4_stream_mosi32;
      AXIS_MISO     : out t_axi4_stream_miso;
      
      OUT_DATA      : out std_logic_vector(31 downto 0);
      OUT_DVAL      : out std_logic;
      OUT_EOF       : out std_logic;
      OUT_BUSY      : in std_logic;
      
      ERR           : out std_logic  
      );
end axis32_to_native;



architecture rtl of axis32_to_native is
   
   
   component sync_reset
      port (
         ARESET : in std_logic;
         CLK    : in std_logic;
         SRESET : out std_logic := '1'
         );
   end component;  
   
   signal sreset : std_logic;
   
begin
   
   AXIS_MISO.TREADY <= not OUT_BUSY;
   
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
            OUT_DVAL <= '0';
            OUT_EOF <= '0';
         else             
            
            if OUT_BUSY = '0' then 
               OUT_DVAL <= AXIS_MOSI.TVALID;  -- cela suppose que TKEEP et TSTROBE sont actifs. Par convention avec PDA, c'est le cas dans tout le design.
               OUT_DATA <= AXIS_MOSI.TDATA;
               OUT_EOF <=  AXIS_MOSI.TLAST;
            end if;
            
         end if;
      end if;
   end process;
     
end rtl;
