-------------------------------------------------------------------------------
--
-- Title       : axis_fp32tofi32
-- Author      : PDU / KBE
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- Description : 
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;   
use ieee.numeric_std.all;
use work.tel2000.all;

entity axis_fp32tofi32 is
   generic(
      OUTPUT_ROUND : boolean := true     -- false <=> ouptput = floor(input); true <=> ouptput = round(input)
      );
   
   port(
      ARESETN    : in  std_logic;
      CLK        : in  std_logic;
      RX_MOSI    : in  t_axi4_stream_mosi32;      
      RX_MISO    : out t_axi4_stream_miso;  
      TX_MOSI    : out t_axi4_stream_mosi32;
      TX_MISO    : in t_axi4_stream_miso;
      ERR        : out std_logic_vector(4 downto 0)
      );
end axis_fp32tofi32;


architecture RTL of axis_fp32tofi32 is
   
   signal data_in       : std_logic_vector(23 downto 0);
   signal tuser_out     : std_logic_vector(9 downto 0);
   signal tx_data_valid : std_logic  := '0';
   
   component axis_fp32tofi32round   -- ce component fait un round
      port (
         ARESETN    : in  std_logic;
         CLK        : in  std_logic;
         RX_MOSI    : in  t_axi4_stream_mosi32;      
         RX_MISO    : out t_axi4_stream_miso;  
         TX_MOSI    : out t_axi4_stream_mosi32;
         TX_MISO    : in t_axi4_stream_miso;
         ERR        : out std_logic_vector(4 downto 0)
         );
   end component;
   
   component axis_fp32tofi32floor   -- ce component fait un floor
      port (
         ARESETN    : in  std_logic;
         CLK        : in  std_logic;
         RX_MOSI    : in  t_axi4_stream_mosi32;      
         RX_MISO    : out t_axi4_stream_miso;  
         TX_MOSI    : out t_axi4_stream_mosi32;
         TX_MISO    : in t_axi4_stream_miso;
         ERR        : out std_logic
         );
   end component;
   
   
begin
   
   -------------------------------------------------------
   -- cas du round
   -------------------------------------------------------
   round_case_gen: if OUTPUT_ROUND generate	
      begin      
      U2 : axis_fp32tofi32round
      PORT MAP (
         ARESETN    => ARESETN,
         CLK        => CLK,
         RX_MOSI    => RX_MOSI,
         RX_MISO    => RX_MISO,
         TX_MOSI    => TX_MOSI,
         TX_MISO    => TX_MISO,
         ERR        => ERR
         );    
   end generate;
   
   -------------------------------------------------------
   -- cas du floor
   -------------------------------------------------------
   floor_case_gen: if not OUTPUT_ROUND generate	
      begin
      U2 : axis_fp32tofi32floor
      PORT MAP (
         ARESETN    => ARESETN,
         CLK        => CLK,
         RX_MOSI    => RX_MOSI,
         RX_MISO    => RX_MISO,
         TX_MOSI    => TX_MOSI,
         TX_MISO    => TX_MISO,
         ERR        => ERR(0)
         );
   end generate;
   
   
end RTL;
