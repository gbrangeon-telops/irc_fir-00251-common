------------------------------------------------------------------
--!   @file : axis64_line_pos
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

entity axis64_line_pos is
   port(
      
      ARESET         : in std_logic;
      CLK            : in std_logic;
      
      RX_MOSI        : in t_axi4_stream_mosi64;
      RX_MISO        : out t_axi4_stream_miso;
      RX_MOSI_POS    : in std_logic_vector(10 downto 0); 
      
      TX_MOSI        : out t_axi4_stream_mosi64;
      TX_MISO        : in t_axi4_stream_miso;
      
      DATA_POS       : out std_logic_vector(10 downto 0);        -- position de la donnée sur une ligne (attention commence à 1)
      LINE_POS       : out std_logic_vector(10 downto 0);        -- position de la donnée sur une ligne (attention commence à 1)
      -- 
      
      ERR            : out  std_logic
      );
end axis64_line_pos;



architecture rtl of axis64_line_pos is
   
   component sync_reset
      port (
         ARESET : in STD_LOGIC;
         CLK    : in STD_LOGIC;
         SRESET : out STD_LOGIC := '1'
         );
   end component;
   
   signal sreset          : std_logic; 
   signal data_pos_i      : std_logic_vector(DATA_POS'LENGTH-1 downto 0); 
   signal line_pos_i      : unsigned(LINE_POS'LENGTH-1 downto 0);
   signal err_i           : std_logic;
   signal tx_mosi_i       : t_axi4_stream_mosi64;
   signal frm_end_i       : std_logic;
   
begin
   
   TX_MOSI  <= tx_mosi_i;
   RX_MISO  <= TX_MISO;
   
   DATA_POS <= std_logic_vector(data_pos_i);
   LINE_POS <= std_logic_vector(line_pos_i);
   
   ERR <= err_i;   
   
   ------------------------------------------------------
   -- Sync reset
   ------------------------------------------------------
   U1 : sync_reset
   port map(
      ARESET => ARESET,
      CLK => CLK,
      SRESET => sreset
      );
   
   -----------------------------------------------------
   -- numerotation des données
   -----------------------------------------------------    
   U2: process(CLK)
      
   begin  
      if rising_edge(CLK) then 
         if sreset = '1' then 
            tx_mosi_i.tvalid <= '0'; 
            data_pos_i <= (others => '0'); 
            line_pos_i <= (others => '0');
            err_i <= '0';
            frm_end_i <= '0';
            
         else 
            
            if TX_MISO.TREADY = '1' then 
               
               -- sortie des données 
               tx_mosi_i  <=  RX_MOSI;
               data_pos_i <=  RX_MOSI_POS;
               
               -- sortie des numeros des données
               if RX_MOSI.TVALID = '1' then   
                  
                  if RX_MOSI.TLAST = '1' then 
                     frm_end_i <= '1';
                  end if;
                  
                  if unsigned(RX_MOSI_POS) = 1 then 
                     line_pos_i <= line_pos_i + 1;       -- 
                     if frm_end_i = '1' then
                        line_pos_i <= to_unsigned(1, line_pos_i'length); 
                        frm_end_i <= '0';
                     end if;
                  end if;         
                  
               end if; 
               
            end if;
            
            -- erreur
            err_i <= '0';  -- aucune erreur pour l'instant
            
         end if;           
      end if;			
   end process;
   
   
   
end rtl;
