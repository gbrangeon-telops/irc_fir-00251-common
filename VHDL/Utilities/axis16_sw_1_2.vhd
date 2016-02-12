-------------------------------------------------------------------------------
--
-- Title       : axis16_sw_1_2
-- Author      : Patrick Dubois
-- Company     : Telops/COPL/LRTS
--
-------------------------------------------------------------------------------
--
-- Description : axis16 Switch (demux) 1 to 2
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use work.Tel2000.all;

entity axis16_sw_1_2 is
   
   port(
      RX_MOSI  : in  t_axi4_stream_mosi16;
      RX_MISO  : out t_axi4_stream_miso;
      
      TX0_MOSI : out t_axi4_stream_mosi16;
      TX0_MISO : in  t_axi4_stream_miso;
      
      TX1_MOSI : out t_axi4_stream_mosi16;
      TX1_MISO : in  t_axi4_stream_miso;
      
      SEL      : in  std_logic_vector(1 downto 0);
      
      ARESETN  : in  std_logic;
      CLK      : in  std_logic     
      );
end axis16_sw_1_2;


architecture RTL of axis16_sw_1_2 is 
   
   signal areset, sreset   : std_logic;   
   signal SEL_i            : std_logic_vector(1 downto 0);
   
   component sync_reset
      port(
         ARESET : in std_logic;
         SRESET : out std_logic;
         CLK    : in std_logic);
   end component;  
   
   
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
   
   TX0_MOSI.TVALID <= RX_MOSI.TVALID when SEL_i = "00" else '0';
   TX1_MOSI.TVALID <= RX_MOSI.TVALID when SEL_i = "01" else '0';
   
   busy_sel : with SEL_i select 
   RX_MISO.TREADY <= TX0_MISO.TREADY when "00",
   TX1_MISO.TREADY when "01",   
   '0' when others;    
   
   ----------------------------------------------------------
   -- The classic switch
   ----------------------------------------------------------
   process(CLK)
   begin
      if rising_edge(CLK) then
         if sreset = '1' then            
            SEL_i <= "11"; -- Busy at reset                           
         else
            SEL_i <= SEL;
         end if;
      end if;
      
   end process;   
   
end RTL;
