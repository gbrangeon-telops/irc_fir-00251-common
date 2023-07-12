------------------------------------------------------------------
--!   @file : axis64_data_sel
--!   @brief
--!   @details
--!
--!   $Rev$
--!   $Author$
--!   $Date$
--!   $Id$
--!   $URL$
------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use work.tel2000.all;  

entity axis64_data_sel is
   port(
      ARESET         : in std_logic;
      CLK            : in std_logic;      
      
      M_FULL_WIDTH   : in std_logic_vector(10 downto 0);
      
      M_AOI_SOL_POS  : in std_logic_vector(10 downto 0);
      M_AOI_EOL_POS  : in std_logic_vector(10 downto 0);
      
      RX_MOSI        : in t_axi4_stream_mosi64;
      RX_MISO        : out t_axi4_stream_miso; 
      
      DATA_POS       : in std_logic_vector(10 downto 0);
      LINE_POS       : in std_logic_vector(10 downto 0);
      
      TX_MOSI        : out t_axi4_stream_mosi64;
      TX_MISO        : in t_axi4_stream_miso;   
      
      ERR            : out std_logic
      );
end axis64_data_sel;



architecture rtl of axis64_data_sel is
   
   component sync_reset
      port (
         ARESET : in STD_LOGIC;
         CLK : in STD_LOGIC;
         SRESET : out STD_LOGIC := '1'
         );
   end component;
   
   type tx_mosi_pipe_type is array (0 to 1) of t_axi4_stream_mosi64;
   
   signal sreset              : std_logic; 
   signal err_i               : std_logic;
   signal tx_mosi_pipe        : tx_mosi_pipe_type;
   signal sample_valid_set1   : std_logic;
   signal sample_valid_set2   : std_logic;
   signal last_line_valid     : std_logic_vector(1 downto 0);
   
begin
   
   TX_MOSI <= tx_mosi_pipe(1);   
   ERR <= err_i;
   RX_MISO <= TX_MISO; 
   
   ------------------------------------------------------
   -- Sync reset
   ------------------------------------------------------
   U1 : sync_reset
   port map(
      ARESET => ARESET,
      CLK => CLK,
      SRESET => sreset
      );
   
   ------------------------------------------------------
   -- choix des données
   ------------------------------------------------------
   U2 : process(CLK)
   begin
      if rising_edge(CLK) then 
         if sreset = '1' then
            sample_valid_set1 <= '0';
            tx_mosi_pipe(0).tvalid <= '0';
            tx_mosi_pipe(1).tvalid <= '0';
            sample_valid_set2 <= '0'; 
            last_line_valid <= (others => '0');
            
         else
            
            
            
            
            if  TX_MISO.TREADY = '1' then
               
               ----------------------------
               -- pipe 0                  
               ----------------------------
               
               tx_mosi_pipe(0) <= RX_MOSI;
               
               if  unsigned(DATA_POS) >= unsigned(M_AOI_SOL_POS) then
                  sample_valid_set1 <= RX_MOSI.TVALID;
               else
                  sample_valid_set1 <= '0';
               end if;
               
               if  unsigned(LINE_POS) = unsigned(M_FULL_WIDTH) then
                  last_line_valid(0) <= '1';
               else
                  last_line_valid(0) <= '0';
               end if;
               
               
               ----------------------------
               -- pipe 1                  
               ----------------------------               
               
               if  unsigned(DATA_POS) <= unsigned(M_AOI_EOL_POS) then
                  sample_valid_set2 <= RX_MOSI.TVALID;
               else
                  sample_valid_set2 <= '0';  
               end if;
               
               tx_mosi_pipe(1) <= tx_mosi_pipe(0);
               tx_mosi_pipe(1).tvalid <=sample_valid_set1 and sample_valid_set2;
               
               -- tlast
               if  unsigned(DATA_POS) = unsigned(M_AOI_EOL_POS) then
                  tx_mosi_pipe(1).tlast <= last_line_valid(0);
               end if;                 
               
            end if;
            
         end if;
         
      end if;   
   end process;
   
end rtl;
