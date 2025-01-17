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
      
      M_AOI_SOL_POS  : in std_logic_vector(10 downto 0);
      M_AOI_EOL_POS  : in std_logic_vector(10 downto 0);
      
      M_AOI_FLI_POS  : in std_logic_vector(10 downto 0);  -- position de la 1ere ligne (First LIne) du AOI
      M_AOI_LLI_POS  : in std_logic_vector(10 downto 0);  -- position de la derniere ligne (Last LIne) du AOI
      
      
      RX_MOSI        : in t_axi4_stream_mosi64;
      RX_MISO        : out t_axi4_stream_miso; 
      
      RX_DATA_POS    : in std_logic_vector(10 downto 0);
      RX_LINE_POS    : in std_logic_vector(10 downto 0);
      
      TX_MOSI        : out t_axi4_stream_mosi64;
      TX_MISO        : in t_axi4_stream_miso;  
      
      TX_DATA_POS    : out std_logic_vector(10 downto 0);
      TX_LINE_POS    : out std_logic_vector(10 downto 0);
      
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
   
   type tx_mosi_pipe_type is array (0 to 2) of t_axi4_stream_mosi64; 
   
   type pos_pipe_type is array (0 to 2) of unsigned(RX_DATA_POS'LENGTH-1 downto 0);
   
   signal sreset              : std_logic; 
   signal err_i               : std_logic;
   signal tx_mosi_pipe        : tx_mosi_pipe_type;
   signal line_valid          : std_logic_vector(2 downto 0);
   signal column_valid        : std_logic_vector(2 downto 0);
   signal last_line_valid     : std_logic_vector(2 downto 0); 
   signal data_pos_pipe       : pos_pipe_type; 
   signal line_pos_pipe       : pos_pipe_type;
   signal tlast_enable        : std_logic; 
   
begin
   
   TX_MOSI <= tx_mosi_pipe(2);   
   ERR <= err_i;
   RX_MISO <= TX_MISO;  
   TX_DATA_POS <= std_logic_vector(data_pos_pipe(2));
   TX_LINE_POS <= std_logic_vector(line_pos_pipe(2));   
   
   
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
   -- choix des donn�es
   ------------------------------------------------------
   
   U2 : process(CLK)
   begin
      if rising_edge(CLK) then 
         if sreset = '1' then
            tx_mosi_pipe(0).tvalid <= '0';
            tx_mosi_pipe(1).tvalid <= '0';
            tx_mosi_pipe(2).tvalid <= '0';
            line_valid <= (others => '0');
            column_valid <= (others => '0');
            data_pos_pipe <= ((others => '0'), (others => '0'), (others => '0')); 
            tlast_enable <= '0';
            
         else
            
            
            if  TX_MISO.TREADY = '1' then
               
               ----------------------------
               -- pipe 0                  
               ----------------------------
               
               tx_mosi_pipe(0)  <= RX_MOSI;
               data_pos_pipe(0) <= unsigned(RX_DATA_POS);
               line_pos_pipe(0) <= unsigned(RX_LINE_POS); 
               
               if unsigned(RX_DATA_POS) >= unsigned(M_AOI_SOL_POS) then
                  column_valid(0) <= RX_MOSI.TVALID;
               else
                  column_valid(0)  <= '0';
               end if;
               
               if unsigned(RX_LINE_POS) >= unsigned(M_AOI_FLI_POS) then
                  line_valid(0) <= RX_MOSI.TVALID;
               else
                  line_valid(0) <= '0';
               end if;
               
               if unsigned(RX_DATA_POS) = unsigned(M_AOI_EOL_POS) then  
                  tlast_enable <= RX_MOSI.TVALID;               -- premice de tlast (ce n'est pas encore tlast)
               else
                  tlast_enable <= '0';
               end if;
               
               
               ----------------------------
               -- pipe 1                  
               ----------------------------               
               
               tx_mosi_pipe(1)  <= tx_mosi_pipe(0);
               data_pos_pipe(1) <= data_pos_pipe(0);
               line_pos_pipe(1) <= line_pos_pipe(0); 
               
               if data_pos_pipe(0) <= unsigned(M_AOI_EOL_POS) then
                  column_valid(1) <= column_valid(0);
               else
                  column_valid(1) <= '0';  
               end if;                
               
               if line_pos_pipe(0) <= unsigned(M_AOI_LLI_POS) then
                  line_valid(1) <= line_valid(0);
               else
                  line_valid(1) <= '0';
               end if; 
               
               -- tlast
               if line_pos_pipe(0) = unsigned(M_AOI_LLI_POS) then
                  tx_mosi_pipe(1).tlast <= tlast_enable;
               else
                  tx_mosi_pipe(1).tlast <= '0';
               end if;
               
               
               ----------------------------
               -- pipe 2                  
               ---------------------------- 
               
               column_valid(2)   <= column_valid(1);
               line_valid(2)     <= line_valid(1);                
               tx_mosi_pipe(2)   <= tx_mosi_pipe(1); 
               tx_mosi_pipe(2).tvalid <= line_valid(1) and column_valid(1);                            
               data_pos_pipe(2)  <= data_pos_pipe(1);
               line_pos_pipe(2)  <= line_pos_pipe(1);                       
               
               
            end if;
            
         end if;
         
      end if;   
   end process;
   
end rtl;
