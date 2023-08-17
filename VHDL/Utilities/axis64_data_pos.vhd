------------------------------------------------------------------
--!   @file : axis64_data_pos
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

entity axis64_data_pos is
   port(
      
      ARESET         : in std_logic;
      CLK            : in std_logic;
      
      RX_MOSI        : in t_axi4_stream_mosi64;
      RX_MISO        : out t_axi4_stream_miso;
      
      M_FULL_WIDTH   : in std_logic_vector(10 downto 0);         
      
      
      TX_MOSI        : out t_axi4_stream_mosi64;
      TX_MISO        : in t_axi4_stream_miso;
      
      TX_MOSI_POS    : out std_logic_vector(10 downto 0);        -- position de la donn�e sur une ligne (attention commence � 1)
      
      -- 
      
      ERR            : out  std_logic
      );
end axis64_data_pos;



architecture rtl of axis64_data_pos is
   
   component sync_reset
      port (
         ARESET : in STD_LOGIC;
         CLK    : in STD_LOGIC;
         SRESET : out STD_LOGIC := '1'
         );
   end component;
   
   signal sreset          : std_logic; 
   signal tx_mosi_pos_i   : unsigned(M_FULL_WIDTH'LENGTH-1 downto 0); 
   signal err_i           : std_logic;
   signal tx_mosi_i       : t_axi4_stream_mosi64;
   
begin
   
   TX_MOSI  <= tx_mosi_i;
   RX_MISO  <= TX_MISO;
   
   TX_MOSI_POS <= std_logic_vector(tx_mosi_pos_i);
   
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
   -- numerotation des donn�es
   -----------------------------------------------------    
   U2: process(CLK)
      
   begin  
      if rising_edge(CLK) then 
         if sreset = '1' then 
            tx_mosi_i.tvalid <= '0'; 
            tx_mosi_pos_i <= (others => '0'); 
            err_i <= '0';  
            
         else 
            
            if TX_MISO.TREADY = '1' then 
               
               -- sortie des donn�es 
               tx_mosi_i  <=  RX_MOSI;
               
               -- sortie des numeros des donn�es
               if RX_MOSI.TVALID = '1' then 
                  
                  if tx_mosi_pos_i = unsigned(M_FULL_WIDTH) then         
                     tx_mosi_pos_i <= to_unsigned(1, tx_mosi_pos_i'length);
                  else
                     tx_mosi_pos_i <= tx_mosi_pos_i + 1;        -- 
                  end if;             
                  
               end if; 
               
            end if;
            
            -- erreur
            err_i <= '0';  -- aucune erreur pour l'instant
            
         end if;           
      end if;			
   end process;
   
   
   
end rtl;