-------------------------------------------------------------------------------
--
-- Title       : axis128_hole_sync
-- Author      : SSA
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- Description : This is a AXIS128 "hole". When FALL is asserted, the data
--               just "falls" into a hole, it is not transmitted to the TX port.
--               When FALL is 0, data flows through normally.
--               This unit is registered. The FALL input can be forced to be 
--               internally synchronized with the EOF of an image by setting 
--               the sync_eof generic to true.
--
-------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.tel2000.all; 

entity axis128_hole_sync is
   generic (
      sync_eof : boolean := false -- set to true to synchronize a change on FALL between two images
      );
   port(     
      RX_MOSI  : in  t_axi4_stream_mosi128; 
      RX_MISO  : out t_axi4_stream_miso;
      
      TX_MOSI  : out t_axi4_stream_mosi128;
      TX_MISO  : in  t_axi4_stream_miso; 
      
      FALL     : in std_logic;
      
      ARESETN  : in  std_logic;
      CLK      : in  std_logic 
      );
end axis128_hole_sync;

architecture RTL of axis128_hole_sync is
   component sync_reset
      port(
         ARESET : in std_logic;
         SRESET : out std_logic;
         CLK    : in std_logic);
   end component; 
   
   component axis128_img_boundaries is
      port(
         RX_MOSI  : in  t_axi4_stream_mosi128;
         RX_MISO  : in t_axi4_stream_miso;
         
         SOF      : out std_logic; -- pulse at the beginning of a frame
         EOF      : out std_logic; -- indicates if a frame is done (held at the end of the image)
         
         ARESETN  : in  std_logic;
         CLK      : in  std_logic     
         );
   end component;
   
   component axis128_reg is
      port(
         RX_MOSI  : in  t_axi4_stream_mosi128;
         RX_MISO  : out t_axi4_stream_miso;
         TX_MOSI  : out  t_axi4_stream_mosi128;
         TX_MISO  : in t_axi4_stream_miso;
         
         ARESETN  : in  std_logic;
         CLK      : in  std_logic     
         );
   end component;
   
   signal sof_s, eof_s : std_logic;
   signal fall_i, fall_sync : std_logic;
   
   signal tx_mosi_i        : t_axi4_stream_mosi128;
   signal rx_miso_i        : t_axi4_stream_miso;
   
   signal rx_mosi_hold : t_axi4_stream_mosi128;
   signal tx_miso_i, tx_miso_1p : t_axi4_stream_miso;
   
   signal areset, sreset : std_logic;   
   
begin
   
   areset <= not aresetn;
   
   U1: sync_reset
   port map(
      ARESET => areset,
      CLK    => CLK,
      SRESET => sreset
      ); 
   
   U2: axis128_reg
   port map(
      RX_MOSI => RX_MOSI,
      RX_MISO => rx_miso_i,
      TX_MOSI => tx_mosi_i,
      TX_MISO => tx_miso_i,
      ARESETN => aresetn,
      CLK    => CLK
      );
   
   tx_miso_i <= TX_MISO;
   
   -- (ODI 2017-09-08) PROBLÈME POTENTIEL: j'ai eu des problèmes en simulation, avec un module basé sur ce hole_sync, connecté sur un RandomMiso.
   -- L'ajustement du TREADY devrait se faire du côté TX plutôt que RX (voir flow_manager et axis32_sw_1_2).
   RX_MISO.TREADY <= rx_miso_i.TREADY or fall_sync;
   
   TX_MOSI.TDATA  <= tx_mosi_i.TDATA;  
   TX_MOSI.TSTRB  <= tx_mosi_i.TSTRB;  
   TX_MOSI.TKEEP  <= tx_mosi_i.TKEEP;  
   TX_MOSI.TLAST  <= tx_mosi_i.TLAST;  
   TX_MOSI.TID    <= tx_mosi_i.TID;    
   TX_MOSI.TDEST  <= tx_mosi_i.TDEST;  
   TX_MOSI.TUSER  <= tx_mosi_i.TUSER;    
   TX_MOSI.TVALID <= tx_mosi_i.TVALID and not fall_sync;
  
   U3 : process(CLK)
   begin
      if rising_edge(CLK) then
         if sreset = '1' then          
            fall_sync <= '0';
         else            
            if eof_s = '1' then
               fall_sync <= fall;
            end if;
         end if;
      end if;
   end process;
   
   detect_eof : 
      if sync_eof = true generate
      detect_frame_done0 : axis128_img_boundaries
      port map (
         RX_MOSI => RX_MOSI, 
         RX_MISO => rx_miso_i,
         SOF => sof_s,
         EOF => eof_s,
         ARESETN => ARESETN,
         CLK => CLK);
   end generate;
   
   no_sync : if sync_eof = false generate
      eof_s <= '1';
   end generate;
   
end RTL;
