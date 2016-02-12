-------------------------------------------------------------------------------
--
-- Title       : axis32_sw_2_1
-- Design      : Tel-2000
-- Author      : JBO
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- Description : axis32 Switch (mux) 2 to 1
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use work.Tel2000.all;

entity axis32_sw_2_1 is
   generic (
      trdy_when_off : std_logic := '0'; -- set to true to make the other channels behave like a hole
      sync_eof : boolean := false; -- set to true to synchronize a change on SEL between two images (* might lose one frame during synchronization if a sof immediately follows an eof). Requires registered = true
      registered : boolean := false
      );
   port(
      RX0_MOSI : in  t_axi4_stream_mosi32;
      RX0_MISO : out t_axi4_stream_miso;
      
      RX1_MOSI : in  t_axi4_stream_mosi32;
      RX1_MISO : out t_axi4_stream_miso;
      
      TX_MOSI  : out t_axi4_stream_mosi32;
      TX_MISO  : in  t_axi4_stream_miso;
      
      SEL      : in std_logic_vector(1 downto 0);
      
      ARESETN  : in  std_logic;
      CLK      : in  STD_LOGIC
      );
end axis32_sw_2_1;


architecture RTL of axis32_sw_2_1 is
   
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
   
   signal sel_i, sel_sync   : std_logic_vector(SEL'length-1 downto 0) := (others => '0');
   signal areset, sreset    : std_logic;   
   
   signal sof_i, eof_i : std_logic_vector(1 downto 0) := (others => '0');
   
   signal off : std_logic := '0';
   
   signal rx0_miso_out, rx1_miso_out, rx_miso_s  : t_axi4_stream_miso;
   signal tx0_miso_s, tx1_miso_s, tx_miso_in     : t_axi4_stream_miso;
   
   signal tx_mosi_s, rx_mosi_s, tx_mosi_out      : t_axi4_stream_mosi32;
   signal tx0_mosi_s, tx1_mosi_s                 : t_axi4_stream_mosi32;
   signal rx0_mosi_in, rx1_mosi_in               : t_axi4_stream_mosi32;
   
begin
   
   areset <= not ARESETN;
   
   RX0_MISO <= rx0_miso_out;
   RX1_MISO <= rx1_miso_out;
   TX_MOSI <= tx_mosi_out;
   tx_miso_in <= TX_MISO;
   rx0_mosi_in <= RX0_MOSI; 
   rx1_mosi_in <= RX1_MOSI; 
   
   --------------------------------------------------
   -- synchro reset 
   --------------------------------------------------   
   U1: sync_reset
   port map(
      ARESET => areset,
      CLK    => CLK,
      SRESET => sreset
      ); 
   
   --------------------------------------------------
   -- Aiguillage
   -------------------------------------------------- 
   
   -- switch with direct TREADY combinatory path 
   no_reg_gen : 
      if registered = false generate
      begin
      rx0_miso_out.TREADY <= TX_MISO.TREADY when sel_i = "00" else trdy_when_off;
      rx1_miso_out.TREADY <= TX_MISO.TREADY when sel_i = "01" else trdy_when_off;
      
      U2 : process(CLK)
      begin       
         if rising_edge(CLK) then
            if sreset = '1' then          
               tx_mosi_out.TVALID <= '0';
            else               
               if sel_i = "00" then
                  if TX_MISO.TREADY = '1' then 
                     tx_mosi_out <= RX0_MOSI;
                  end if;       
               elsif sel_i = "01" then 
                  if TX_MISO.TREADY = '1' then 
                     tx_mosi_out <= RX1_MOSI;
                  end if;               
               else
                  tx_mosi_out.TVALID <= '0';
               end if;          
               
            end if;
         end if;
      end process;
   end generate;
   
   -- base case for asynchronous switching
   no_sync : if sync_eof = false or registered = false generate
      
      SEL_reg : process(CLK)
      begin       
         if rising_edge(CLK) then
            if sreset = '1' then  
               sel_sync <= (others => '1');
            else
               sel_sync <= SEL;
            end if;
         end if;
      end process;
      
      off <= '0'; -- never off
      sel_i <= sel_sync;
   end generate;
   
   -- registered switch
   reg_gen : 
      if registered = true generate
      S0: axis32_reg
      port map(
         RX_MOSI => rx0_mosi_in,
         RX_MISO => rx0_miso_out,
         TX_MOSI => tx0_mosi_s,
         TX_MISO => tx0_miso_s,
         ARESETN => aresetn,
         CLK    => CLK
         );
      
      S1: axis32_reg
      port map(
         RX_MOSI => rx1_mosi_in,
         RX_MISO => rx1_miso_out,
         TX_MOSI => tx1_mosi_s,
         TX_MISO => tx1_miso_s,
         ARESETN => aresetn,
         CLK    => CLK
         );
      
      S_out: axis32_reg
      port map(
         RX_MOSI => rx_mosi_s,
         RX_MISO => rx_miso_s,
         TX_MOSI => tx_mosi_out,
         TX_MISO => tx_miso_in,
         ARESETN => aresetn,
         CLK    => CLK
         );
      
      tx0_miso_s.TREADY <= rx_miso_s.TREADY when sel_sync = "00" else trdy_when_off;
      tx1_miso_s.TREADY <= rx_miso_s.TREADY when sel_sync = "01" else trdy_when_off;
      tx_mosi_s <= tx0_mosi_s when sel_sync = "00" else tx1_mosi_s;
      
      rx_mosi_s.TDATA   <= tx_mosi_s.TDATA;  
      rx_mosi_s.TSTRB   <= tx_mosi_s.TSTRB;  
      rx_mosi_s.TKEEP   <= tx_mosi_s.TKEEP;  
      rx_mosi_s.TLAST   <= tx_mosi_s.TLAST;  
      rx_mosi_s.TID     <= tx_mosi_s.TID;    
      rx_mosi_s.TDEST   <= tx_mosi_s.TDEST;  
      rx_mosi_s.TUSER   <= tx_mosi_s.TUSER;    
      
      rx_mosi_s.TVALID <= not off and tx_mosi_s.TVALID when sel_sync = "01" or sel_sync = "00" else '0';
      
   end generate;
   
   detect_eof : if sync_eof = true and registered = true generate
      detect_frame_done0 : axis32_img_boundaries
      port map (
         RX_MOSI => RX0_MOSI, 
         RX_MISO => rx0_miso_out,
         SOF => sof_i(0),
         EOF => eof_i(0),
         ARESETN => ARESETN,
         CLK => CLK);
      
      detect_frame_done1 : axis32_img_boundaries
      port map (
         RX_MOSI => RX1_MOSI, 
         RX_MISO => rx1_miso_out,
         SOF => sof_i(1),
         EOF => eof_i(1),
         ARESETN => ARESETN,
         CLK => CLK);
      
      -- sur un changement de SEL, on peut switcher off le canal actif, puis switcher ON le nouveau canal quand son EOF est high
      process (CLK)
         variable off_v : std_logic := '0';
      begin
         if rising_edge(CLK) then
            if sreset = '1' then
               sel_sync <= (others => '1');
               off_v := '1';
            else
               -- upon a change on the SEL input, switch the previously selected channel OFF if between 2 images
               if SEL /= sel_sync and off = '0' then
                  for i in 0 to 1 loop
                     if unsigned(sel_sync) = i and off_v = '0' then
                        if eof_i(i) = '1' then
                           off_v := '1';
                        else
                           off_v := '0';
                        end if;
                     end if;
                  end loop;
               end if;
               
               -- switch the output ON once the selected channel saw an EOF
               if off_v = '1' then
                  for i in 0 to 1 loop
                     if unsigned(SEL) = i then
                        if eof_i(i) = '1' then
                           sel_sync <= SEL;
                           off_v := '0';
                        end if;
                     end if;
                  end loop;
               end if;
            end if;
            off <= off_v;
         end if;
      end process;
   end generate;
   
   
end RTL;
