-------------------------------------------------------------------------------
--
-- Title       : control_intf
-- Design      : row_decimator
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

entity row_decimator is
   port (
   
      ARESETN                   : in std_logic;
      CLK                       : in std_logic;

      AXIS_RX_DATA_MOSI         : in t_axi4_stream_mosi64;
      AXIS_RX_DATA_MISO         : out t_axi4_stream_miso;
      
      AXIS_TX_DATA_MOSI         : out t_axi4_stream_mosi64;
      AXIS_TX_DATA_MISO         : in  t_axi4_stream_miso;

      CFG                       : in decimator_cfg_type
   );     
end row_decimator;
                                       

architecture row_decimator of row_decimator is   

  component sync_reset
      port (
         ARESET : in std_logic;
         CLK    : in std_logic;
         SRESET : out std_logic := '1'
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
   
   signal areset_i         : std_logic; 
   signal sreset           : std_logic; 
   signal config_valid_s   : std_logic;
   
   signal cfg_i            : decimator_cfg_type := decimator_cfg_default;
   signal pix_cnt          : unsigned(10 downto 0); 
   signal discard_row      : std_logic;
   signal rx_mosi_pipe     : t_axi4_stream_mosi64; 
   
begin  
   
   -- I/O Connections assignments
   areset_i            <= not ARESETN;       
            
   U1 : double_sync  port map(D => CFG.valid, Q=> config_valid_s, RESET => sreset, CLK => CLK);
   
   U2: sync_reset
   port map(
      ARESET => areset_i,
      CLK    => CLK,
      SRESET => sreset
   ); 
  
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

  
    
   AXIS_RX_DATA_MISO.TREADY  <= '1' when (discard_row = '1' and cfg_i.enable(0) = '1') else AXIS_TX_DATA_MISO.TREADY ; 

   U4: process (CLK)
   begin
      if rising_edge(CLK) then 
         if sreset = '1' then 
            
            pix_cnt     <= (others => '0');   
            discard_row <= '1'; -- On discarte les lignes paires pour que le TLAST arrive sur une ligne valide.   
            AXIS_TX_DATA_MOSI.TDATA  <= (others => '0');
            AXIS_TX_DATA_MOSI.TLAST  <= '0'; 
            AXIS_TX_DATA_MOSI.TID    <= (others => '0');
            AXIS_TX_DATA_MOSI.TVALID <= '0';
            AXIS_TX_DATA_MOSI.TKEEP <= (others => '1');
            AXIS_TX_DATA_MOSI.TSTRB <= (others => '1');
            AXIS_TX_DATA_MOSI.TDEST <= (others => '0'); -- non géré
            AXIS_TX_DATA_MOSI.TUSER <= (others => '0'); -- non géré  
            
         else     
            
            rx_mosi_pipe              <= AXIS_RX_DATA_MOSI;     

            AXIS_TX_DATA_MOSI.TDATA   <= rx_mosi_pipe.TDATA;    
            AXIS_TX_DATA_MOSI.TLAST   <= rx_mosi_pipe.TLAST; 
            AXIS_TX_DATA_MOSI.TID     <= rx_mosi_pipe.TID;
            AXIS_TX_DATA_MOSI.TKEEP   <= (others => '1');
            AXIS_TX_DATA_MOSI.TSTRB   <= (others => '1');
            AXIS_TX_DATA_MOSI.TDEST   <= (others => '0'); -- non géré
            AXIS_TX_DATA_MOSI.TUSER   <= (others => '0'); -- non géré
            
            if discard_row = '1' and cfg_i.enable(0) = '1' then
               AXIS_TX_DATA_MOSI.TVALID  <= '0'; 
            else
               AXIS_TX_DATA_MOSI.TVALID  <= rx_mosi_pipe.TVALID;
            end if;

            if rx_mosi_pipe.tvalid = '1' and AXIS_TX_DATA_MISO.TREADY = '1' then
               pix_cnt <= pix_cnt + 4;
               if pix_cnt = (unsigned(cfg_i.input_width) - 4) then
                  discard_row <= not discard_row;
                  pix_cnt <= (others => '0');
               end if;
            end if;
         end if;
      end if;
   end process; 

end row_decimator;
