-------------------------------------------------------------------------------
--
-- Title       : control_intf
-- Design      : column_decimator
-- Author      : Philippe Couture   
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- File        : D:\Telops\FIR-00251-Proc\src\FrameBuffer\HDL\fb_ctrl_intf.vhd
-- Generated   : Mon Aug 10 13:20:42 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use ieee.numeric_std.all;
use work.TEL2000.all;
use work.decimator_define.all;

entity column_decimator is
   port (
      ARESETN                   : in std_logic;
      CLK                       : in std_logic;

      AXIS_RX_DATA_MOSI         : in t_axi4_stream_mosi64;
      AXIS_RX_DATA_MISO         : out t_axi4_stream_miso;
      
      AXIS_TX_DATA_MOSI         : out t_axi4_stream_mosi64;
      AXIS_TX_DATA_MISO         : in  t_axi4_stream_miso;
      
      CFG                       : in decimator_cfg_type
   );     
end column_decimator;



architecture column_decimator of column_decimator is
  component sync_reset
      port (
         ARESET : in std_logic;
         CLK    : in std_logic;
         SRESET : out std_logic := '1'
         );
   end component;   
   
   component t_axi4_stream_wr32_rd64_fifo
   GENERIC (   
   WR_FIFO_DEPTH  : integer := 32;
   ASYNC          : boolean := false 
   );
   port(
      ARESETN  : in std_logic;
      RX_CLK   : in std_logic;
      RX_MOSI  : in t_axi4_stream_mosi32;
      RX_MISO  : out t_axi4_stream_miso;
      TX_CLK   : in std_logic;
      TX_MOSI  : out t_axi4_stream_mosi64;
      TX_MISO  : in t_axi4_stream_miso;
      OVFL     : out std_logic
      );
   end component;

   component double_sync is
      port(
         D : in STD_LOGIC;
         Q : out STD_LOGIC;
         RESET : in STD_LOGIC;
         CLK : in STD_LOGIC
         );
   end component double_sync;
   
   signal sresetn                   : std_logic;   
   signal sreset                    : std_logic; 
   signal asym_fifo_input_mosi      : t_axi4_stream_mosi32;
   signal asym_fifo_input_miso      : t_axi4_stream_miso;
   signal asym_fifo_output_mosi     : t_axi4_stream_mosi64; 
   signal rx_mosi_pipe              : t_axi4_stream_mosi64;
   signal cfg_i                     : decimator_cfg_type := decimator_cfg_default;
   signal config_valid_s            : std_logic;
     
begin  
  
   U1: sync_reset
   port map(
      ARESET => ARESETN,
      CLK    => CLK,
      SRESET => sresetn
   ); 
   sreset <= not sresetn;
      
   U2 : double_sync  port map(D => CFG.valid, Q=> config_valid_s, RESET => sreset, CLK => CLK);

   U3 : process(CLK)      
   begin  
      if rising_edge(CLK) then
         if sreset = '1' or config_valid_s = '0' then
            cfg_i.valid <= '0';
         else
            cfg_i <= CFG;
         end if;
      end if;
   end process;
 
   AXIS_RX_DATA_MISO  <= asym_fifo_input_miso  when cfg_i.enable(1) = '1' else AXIS_TX_DATA_MISO;  
   asym_fifo_input_mosi.TDATA   <= AXIS_RX_DATA_MOSI.TDATA(47 downto 32) & AXIS_RX_DATA_MOSI.TDATA(15 downto 0);   
   asym_fifo_input_mosi.TLAST   <= AXIS_RX_DATA_MOSI.TLAST;  
   asym_fifo_input_mosi.TID     <= AXIS_RX_DATA_MOSI.TID;  
   asym_fifo_input_mosi.TVALID  <= AXIS_RX_DATA_MOSI.TVALID;
   
   U4 : process(CLK)      
   begin  
      if rising_edge(CLK) then
         if sreset = '1' then
            AXIS_TX_DATA_MOSI.TDATA  <= (others => '0');
            AXIS_TX_DATA_MOSI.TLAST  <= '0'; 
            AXIS_TX_DATA_MOSI.TID    <= (others => '0');
            AXIS_TX_DATA_MOSI.TVALID <= '0';
            AXIS_TX_DATA_MOSI.TKEEP  <= (others => '1');
            AXIS_TX_DATA_MOSI.TSTRB  <= (others => '1');
            AXIS_TX_DATA_MOSI.TDEST  <= (others => '0'); -- non géré
            AXIS_TX_DATA_MOSI.TUSER  <= (others => '0'); -- non géré       
         else 

            if cfg_i.enable(1) = '1' then   
               AXIS_TX_DATA_MOSI.TDATA   <= asym_fifo_output_mosi.tdata;
               AXIS_TX_DATA_MOSI.TLAST   <= asym_fifo_output_mosi.tlast;  
               AXIS_TX_DATA_MOSI.TID     <= asym_fifo_output_mosi.tid;  
               AXIS_TX_DATA_MOSI.TVALID  <= asym_fifo_output_mosi.tvalid; 
            else
               AXIS_TX_DATA_MOSI.TDATA   <= AXIS_RX_DATA_MOSI.TDATA;   
               AXIS_TX_DATA_MOSI.TLAST   <= AXIS_RX_DATA_MOSI.TLAST; 
               AXIS_TX_DATA_MOSI.TID     <= AXIS_RX_DATA_MOSI.TID; 
               AXIS_TX_DATA_MOSI.TVALID  <= AXIS_RX_DATA_MOSI.TVALID; 
            end if;    
            
            AXIS_TX_DATA_MOSI.TKEEP <= (others => '1');
            AXIS_TX_DATA_MOSI.TSTRB <= (others => '1');
            AXIS_TX_DATA_MOSI.TDEST <= (others => '0'); -- non géré
            AXIS_TX_DATA_MOSI.TUSER <= (others => '0'); -- non géré
            
         end if;
      end if;
   end process;
   
   U5: t_axi4_stream_wr32_rd64_fifo
   generic map (WR_FIFO_DEPTH => 32, ASYNC => false)
   port map(
      ARESETN  => sresetn,
      RX_CLK   => CLK,
      RX_MOSI  => asym_fifo_input_mosi,
      RX_MISO  => asym_fifo_input_miso,
      TX_CLK   => CLK,
      TX_MOSI  => asym_fifo_output_mosi,
      TX_MISO  => AXIS_TX_DATA_MISO,  
      OVFL => open
      );  

end column_decimator;
