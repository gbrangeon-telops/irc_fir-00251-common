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

entity axis16_to_native is
   port(
      ARESET        : in std_logic;
      CLK           : in std_logic;      
      
      AXIS_MOSI     : in t_axi4_stream_mosi16;
      AXIS_MISO     : out t_axi4_stream_miso;
      
      OUT_DATA      : out std_logic_vector(15 downto 0);
      OUT_DVAL      : out std_logic;
      OUT_EOF       : out std_logic;
      OUT_BUSY      : in std_logic;
      
      ERR           : out std_logic  
      );
end axis16_to_native;



architecture rtl of axis16_to_native is
   
 
   
   signal sreset : std_logic;
   
begin
   
   AXIS_MISO.TREADY <= not OUT_BUSY;
   
    OUT_DVAL <= AXIS_MOSI.TVALID;  -- cela suppose que TKEEP et TSTROBE sont actifs. Par convention avec PDA, c'est le cas dans tout le design.
    OUT_DATA <= AXIS_MOSI.TDATA;
    OUT_EOF <=  AXIS_MOSI.TLAST;

     
end rtl;
