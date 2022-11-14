-------------------------------------------------------------------------------
--
-- Description : This module adds randomness to the RX_BUSY and RX_AFULL signals.
--               It can also ignore the TX side with the FALL signal (data is 
--               then never transmitted at the output).
--
-------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.tel2000.all; 

entity axis128_randommiso is 
   generic(
      random_seed : std_logic_vector(3 downto 0) := x"1");
   
   port(     
      RX_MOSI  : in  t_axi4_stream_mosi128; 
      RX_MISO  : out t_axi4_stream_miso;
      
      TX_MOSI  : out t_axi4_stream_mosi128;
      TX_MISO  : in  t_axi4_stream_miso; 
      
      RANDOM   : in  std_logic;
      FALL     : in  std_logic;
      
      ARESET   : in  std_logic;
      CLK      : in  std_logic
      );
end axis128_randommiso;

architecture RTL of axis128_randommiso is         
   signal lfsr       : std_logic_vector(15 downto 0) := (others => '0');   -- To avoid X in simulation
   signal lfsr_busy  : std_logic;
   signal lfsr_busy2 : std_logic;
   
   signal lfsr_afull  : std_logic;
   signal lfsr_afull2 : std_logic;
      
   signal lfsr_in    : std_logic;
   signal sreset     : std_logic;
   
   attribute keep_hierarchy : string;
   attribute keep_hierarchy of RTL : architecture is "true";   
   
   component sync_reset is
		port(
			ARESET : in STD_LOGIC;
			SRESET : out STD_LOGIC;
			CLK    : in STD_LOGIC);
	end component;
	
   signal rx_busy : std_logic;
   
begin     

   the_sync_RESET :  sync_reset
   port map(ARESET => ARESET, SRESET => sreset, CLK => CLK); 
      
   lfsr_in <= lfsr(1) xor lfsr(2) xor lfsr(4) xor lfsr(15);
   lfsr_busy2 <= lfsr_busy or sreset;
   lfsr_afull2 <= lfsr_afull or sreset;
   
   rx_busy <= (not TX_MISO.TREADY or lfsr_busy2) when FALL = '0' else (lfsr_busy2);
   RX_MISO.TREADY <= not rx_busy;
   
   TX_MOSI.TLAST    <= RX_MOSI.TLAST;
   TX_MOSI.TDATA    <= RX_MOSI.TDATA;
   TX_MOSI.TKEEP    <= RX_MOSI.TKEEP;
   TX_MOSI.TSTRB    <= RX_MOSI.TSTRB;
   TX_MOSI.TUSER    <= RX_MOSI.TUSER;
   TX_MOSI.TID      <= RX_MOSI.TID;
   TX_MOSI.TDEST    <= RX_MOSI.TDEST;
   TX_MOSI.TVALID   <= RX_MOSI.TVALID and not rx_busy when FALL = '0' else '0';          
      
   process(CLK)
   begin
           
      if rising_edge(CLK) then
         lfsr(0) <= lfsr_in;
         lfsr(15 downto 2) <= lfsr(14 downto 1);
         
         if RANDOM = '1' then         
            lfsr_busy <= lfsr(15); 
            lfsr_afull <= lfsr(13); 
         else
            lfsr_busy <= '0';       
            lfsr_afull <= '0';
         end if;
         
         if sreset = '1' then
            lfsr(0) <= random_seed(0); -- We need at least one '1' in the LFSR to activate it.
            lfsr(2) <= random_seed(1);
            lfsr(3) <= random_seed(2); 
            lfsr(5) <= random_seed(3);
         else
            lfsr(1) <= lfsr(0);   
         end if;
      end if; 
          
   end process;      
   
end RTL;
