-------------------------------------------------------------------------------
--
-- Title       : axis32_sw_1_2
-- Author      : Jean-Alexis Boulet
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- Description : axis32 Switch (demux) 1 to 2
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use work.Tel2000.all;

entity axis32_sw_1_2 is
   generic (
      sync_eof : boolean := false; -- set to true to synchronize a change on SEL between two images
      registered : boolean := false
      );
   port(
      RX_MOSI  : in  t_axi4_stream_mosi32;
      RX_MISO  : out t_axi4_stream_miso;
      
      TX0_MOSI : out t_axi4_stream_mosi32;
      TX0_MISO : in  t_axi4_stream_miso;
      
      TX1_MOSI : out t_axi4_stream_mosi32;
      TX1_MISO : in  t_axi4_stream_miso;
      
      SEL      : in  std_logic_vector(1 downto 0);
      
      ARESETN  : in  std_logic;
      CLK      : in  std_logic     
      );
end axis32_sw_1_2;


architecture RTL of axis32_sw_1_2 is 
   
   component sync_reset
      port(
         ARESET : in std_logic;
         SRESET : out std_logic;
         CLK    : in std_logic);
   end component;  
   
   component axis32_img_boundaries is
      port(
         RX_MOSI  : in  t_axi4_stream_mosi32;
         RX_MISO  : in t_axi4_stream_miso;
         
         SOF      : out std_logic; -- pulse at the beginning of a frame
         EOF      : out std_logic; -- indicates if a frame is done (held at the end of the image)
         
         ARESETN  : in  std_logic;
         CLK      : in  std_logic     
         );
   end component;
   
   component axis32_reg is
      port(
         RX_MOSI  : in  t_axi4_stream_mosi32;
         RX_MISO  : out t_axi4_stream_miso;
         TX_MOSI  : out  t_axi4_stream_mosi32;
         TX_MISO  : in t_axi4_stream_miso;
         
         ARESETN  : in  std_logic;
         CLK      : in  std_logic     
         );
   end component;
   
   signal areset, sreset   : std_logic;   
   
   signal tx_mosi_s, tx0_mosi_out, tx1_mosi_out  : t_axi4_stream_mosi32;
   signal rx_mosi_in, rx0_mosi_s, rx1_mosi_s     : t_axi4_stream_mosi32;
   signal rx_miso_out, rx0_miso_s, rx1_miso_s    : t_axi4_stream_miso;
   signal tx_miso_s, tx0_miso_in, tx1_miso_in    : t_axi4_stream_miso;
   
   signal sof_i, eof_i : std_logic;
   signal sel_sync : std_logic_vector(SEL'length-1 downto 0);
begin    
   
   areset <= not ARESETN;
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
   -- mappings
   --------------------------------------------------  
   no_reg:
      if registered = false generate
      TX0_MOSI.TDATA   <= RX_MOSI.TDATA;  
      TX0_MOSI.TSTRB   <= RX_MOSI.TSTRB;  
      TX0_MOSI.TKEEP   <= RX_MOSI.TKEEP;  
      TX0_MOSI.TLAST   <= RX_MOSI.TLAST;  
      TX0_MOSI.TID     <= RX_MOSI.TID;    
      TX0_MOSI.TDEST   <= RX_MOSI.TDEST;  
      TX0_MOSI.TUSER   <= RX_MOSI.TUSER;   
      
      TX1_MOSI.TDATA   <= RX_MOSI.TDATA;    
      TX1_MOSI.TSTRB   <= RX_MOSI.TSTRB;   
      TX1_MOSI.TKEEP   <= RX_MOSI.TKEEP;   
      TX1_MOSI.TLAST   <= RX_MOSI.TLAST;   
      TX1_MOSI.TID     <= RX_MOSI.TID;     
      TX1_MOSI.TDEST   <= RX_MOSI.TDEST;   
      TX1_MOSI.TUSER   <= RX_MOSI.TUSER; 
      
      TX0_MOSI.TVALID <= RX_MOSI.TVALID when sel_sync = "00" else '0';
      TX1_MOSI.TVALID <= RX_MOSI.TVALID when sel_sync = "01" else '0';
      
      busy_sel : with sel_sync select 
      RX_MISO.TREADY <= TX0_MISO.TREADY when "00",
      TX1_MISO.TREADY when "01",   
      '0' when others;    
   end generate;
   
   reg:
      if registered = true generate
      begin
      
      S_in: axis32_reg
      port map(
         RX_MOSI => rx_mosi_in,
         RX_MISO => rx_miso_out,
         TX_MOSI => tx_mosi_s,
         TX_MISO => tx_miso_s,
         ARESETN => aresetn,
         CLK    => CLK
         );
      
      S0: axis32_reg
      port map(
         RX_MOSI => rx0_mosi_s,
         RX_MISO => rx0_miso_s,
         TX_MOSI => tx0_mosi_out,
         TX_MISO => tx0_miso_in,
         ARESETN => aresetn,
         CLK    => CLK
         );
      
      S1: axis32_reg
      port map(
         RX_MOSI => rx1_mosi_s,
         RX_MISO => rx1_miso_s,
         TX_MOSI => tx1_mosi_out,
         TX_MISO => tx1_miso_in,
         ARESETN => aresetn,
         CLK    => CLK
         );
      
      rx0_mosi_s.TDATA   <= tx_mosi_s.TDATA;  
      rx0_mosi_s.TSTRB   <= tx_mosi_s.TSTRB;  
      rx0_mosi_s.TKEEP   <= tx_mosi_s.TKEEP;  
      rx0_mosi_s.TLAST   <= tx_mosi_s.TLAST;  
      rx0_mosi_s.TID     <= tx_mosi_s.TID;    
      rx0_mosi_s.TDEST   <= tx_mosi_s.TDEST;  
      rx0_mosi_s.TUSER   <= tx_mosi_s.TUSER;
      
      rx1_mosi_s.TDATA   <= tx_mosi_s.TDATA;  
      rx1_mosi_s.TSTRB   <= tx_mosi_s.TSTRB;  
      rx1_mosi_s.TKEEP   <= tx_mosi_s.TKEEP;  
      rx1_mosi_s.TLAST   <= tx_mosi_s.TLAST;  
      rx1_mosi_s.TID     <= tx_mosi_s.TID;    
      rx1_mosi_s.TDEST   <= tx_mosi_s.TDEST;  
      rx1_mosi_s.TUSER   <= tx_mosi_s.TUSER;
      
      rx0_mosi_s.TVALID <= tx_mosi_s.TVALID when sel_sync = "00" else '0';
      rx1_mosi_s.TVALID <= tx_mosi_s.TVALID when sel_sync = "01" else '0';
      
      rx_mosi_in <= RX_MOSI;
      RX_MISO <= rx_miso_out;
      TX0_MOSI <= tx0_mosi_out;
      TX1_MOSI <= tx1_mosi_out;
      tx0_miso_in <= TX0_MISO;
      tx1_miso_in <= TX1_MISO;
      
      busy_sel : with sel_sync select 
      tx_miso_s.TREADY <= rx0_miso_s.TREADY when "00",
      rx1_miso_s.TREADY when "01",   
      '0' when others;  
      
   end generate;
   
   detect_eof : if sync_eof = true and registered = true generate
      detect_frame_done0 : axis32_img_boundaries
      port map (
         RX_MOSI => rx_mosi_in, 
         RX_MISO => rx_miso_out,
         SOF => sof_i,
         EOF => eof_i,
         ARESETN => ARESETN,
         CLK => CLK);
   end generate;
   
   process (CLK)
   begin
      if rising_edge(CLK) then
         if sreset = '1' then
            sel_sync <= (others => '1');
         else
            if eof_i = '1' then
               sel_sync <= SEL;
            end if;
         end if;
      end if;
   end process;
   
   -- base case for asynchronous switching
   no_sync : if sync_eof = false or registered = false generate   
      eof_i <= '1';
   end generate;
   
end RTL;
