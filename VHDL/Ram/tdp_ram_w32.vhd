------------------------------------------------------------------
--!   @file : tdp_ram_w32
--!   @brief
--!   @details: ce module de dual port ram comporte des interfaces natives. La plage d'adressage va de 0 à [2^(PAGE_ADD_WIDTH + PAGE_NUMBER) - 1]
--!
--!   $Rev$
--!   $Author$
--!   $Date$
--!   $Id$
--!   $URL$
------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;           
use IEEE.numeric_std.ALL;
use work.tel2000.all;


entity tdp_ram_w32 is 
   
   generic(
      PAGE_ADD_WIDTH : natural := 14;
      PAGE_NUMBER    : natural := 64
      );
   
   port(
      ARESET       : in std_logic;
      A_CLK        : in std_logic;
      B_CLK        : in std_logic;
      
      -- port A : WR
      A_WR         : in std_logic;
      A_WR_ADD     : in std_logic_vector(31 downto 0);
      A_WR_DATA    : in std_logic_vector(31 downto 0);
      
      -- port A : RD
      A_RD         : in std_logic;
      A_RD_ADD     : in std_logic_vector(31 downto 0);
      A_RD_DATA    : out std_logic_vector(31 downto 0);
      A_RD_DVAL    : out std_logic;
      A_ERR        : out std_logic;
      
      -- port B : WR       
      B_WR         : in std_logic;
      B_WR_ADD     : in std_logic_vector(31 downto 0);      
      B_WR_DATA    : in std_logic_vector(31 downto 0);
      
      -- port B : RD       
      B_RD         : in std_logic;
      B_RD_ADD     : in std_logic_vector(31 downto 0);
      B_RD_EOF_IN  : in std_logic;
      B_RD_DATA    : out std_logic_vector(31 downto 0);
      B_RD_DVAL    : out std_logic; 
      B_RD_EOF_OUT : out std_logic;
      B_ERR        : out std_logic
      
      );
end tdp_ram_w32;


architecture rtl of tdp_ram_w32 is
   
   constant TOTAL_ADD_WIDTH : integer := log2(PAGE_NUMBER) + PAGE_ADD_WIDTH;
   
   -- les rams specifiques
   component tdp_ram_w32_d32768
      port (
         clka  : in STD_LOGIC;
         ena   : in STD_LOGIC;
         wea   : in std_logic_vector(0 downto 0);
         addra : in std_logic_vector(14 downto 0);
         dina  : in std_logic_vector(31 downto 0);
         douta : out std_logic_vector(31 downto 0);
         clkb  : in STD_LOGIC;
         enb   : in STD_LOGIC;
         web   : in std_logic_vector(0 downto 0);
         addrb : in std_logic_vector(14 downto 0);
         dinb  : in std_logic_vector(31 downto 0);
         doutb : out std_logic_vector(31 downto 0)
      );
   end component;
   
   component tdp_ram_w32_d16384
   port (
   clka  : in STD_LOGIC;
   ena   : in STD_LOGIC;
   wea   : in std_logic_vector(0 downto 0);
   addra : in std_logic_vector(13 downto 0);
   dina  : in std_logic_vector(31 downto 0);
   douta : out std_logic_vector(31 downto 0);
   clkb  : in STD_LOGIC;
   enb   : in STD_LOGIC;
   web   : in std_logic_vector(0 downto 0);
   addrb : in std_logic_vector(13 downto 0);
   dinb  : in std_logic_vector(31 downto 0);
   doutb : out std_logic_vector(31 downto 0)
   );
   end component;
   
   component tdp_ram_w32_d8192
     port (
       clka : IN STD_LOGIC;
       ena : IN STD_LOGIC;
       wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
       addra : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
       dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
       douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
       clkb : IN STD_LOGIC;
       enb : IN STD_LOGIC;
       web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
       addrb : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
       dinb : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
       doutb : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
     );
   end component;
   
   -- composants communs quelle que que soit la ram
   component sync_reset
      port(
         ARESET : in std_logic;
         SRESET : out std_logic;
         CLK    : in std_logic);
   end component;   
   
   signal FoundGenCase   : boolean := FALSE;
   signal sreset         : std_logic;   
   signal dval_i         : std_logic;   
   signal a_dval_pipe    : std_logic_vector(5 downto 0);
   signal b_dval_pipe    : std_logic_vector(5 downto 0);
   signal b_eof_pipe     : std_logic_vector(5 downto 0);
   signal a_rd_data_i    : std_logic_vector(A_RD_DATA'length-1 downto 0);
   signal b_rd_data_i    : std_logic_vector(B_RD_DATA'length-1 downto 0);
   signal sreset_A_CLK   : std_logic;
   signal sreset_B_CLK   : std_logic;
   signal a_wr_i         : std_logic_vector(0 downto 0);
   signal b_wr_i         : std_logic_vector(0 downto 0);
   signal a_add_i        : std_logic_vector(A_RD_ADD'length-1 downto 0);
   signal b_add_i        : std_logic_vector(B_RD_ADD'length-1 downto 0);
   signal a_wr_data_i    : std_logic_vector(A_WR_DATA'length-1 downto 0);
   signal b_wr_data_i    : std_logic_vector(B_WR_DATA'length-1 downto 0);
   
   
   
begin
   
   -----------------------------------------------------
   -- Synchronisation reset
   -----------------------------------------------------
   U1A: sync_reset
   Port map(		
      ARESET   => ARESET,		
      SRESET   => sreset_A_CLK,
      CLK   => A_CLK);
   
   U1B: sync_reset
   Port map(		
      ARESET   => ARESET,		
      SRESET   => sreset_B_CLK,
      CLK   => B_CLK);
   
   ------------------------------------------------------
   -- lecture de la RAM : generation de A_RD_DVAL
   ------------------------------------------------------	
   U2A: process(A_CLK)
   begin
      if rising_edge(A_CLK) then 
         if sreset_A_CLK = '1' then	
            A_RD_DVAL <= '0';
            a_dval_pipe <= (others =>'0');
            a_wr_i(0) <= '0';
            A_ERR <= '0';
         else
            
            -- generation de A_RD_DVAL            
            a_dval_pipe(0) <= A_RD; 
            a_dval_pipe(1) <= a_dval_pipe(0);
            A_RD_DVAL <= a_dval_pipe(1);
            
            -- arbitreur 
            if A_RD = '1' then
               a_add_i <= A_RD_ADD;
               a_wr_i(0) <= '0';
            elsif A_WR = '1' then 
               a_add_i <= A_WR_ADD;
               a_wr_i(0) <= '1';
               a_wr_data_i <= A_WR_DATA;
            else
               a_wr_i(0) <= '0';
            end if;
            
            -- erreur à eviter par design 
            if (A_RD and A_WR) = '1' then
               A_ERR <='1';  -- latch
            end if;
            
         end if;
      end if;		
   end process;
   
   ------------------------------------------------------
   -- lecture de la RAM : generation de B_RD_DVAL
   ------------------------------------------------------	
   U2B: process(B_CLK)
   begin
      if rising_edge(B_CLK) then 
         if sreset_B_CLK = '1' then	
            B_RD_DVAL <= '0';
            B_RD_EOF_OUT <= '0';
            b_dval_pipe <= (others =>'0');
            b_eof_pipe <= (others =>'0');
            b_wr_i(0) <= '0';
            B_ERR <='0';
         else
            
            -- generation de B_RD_DVAL            
            b_dval_pipe(0) <= B_RD; 
            b_dval_pipe(1) <= b_dval_pipe(0);
            B_RD_DVAL <= b_dval_pipe(1);
            -- generation de B_RD_EOF  
            b_eof_pipe(0) <= B_RD_EOF_IN; 
            b_eof_pipe(1) <= b_eof_pipe(0);            
            B_RD_EOF_OUT <= b_eof_pipe(1);
            
            -- arbitreur 
            if B_RD = '1' then
               b_add_i <= B_RD_ADD;
               b_wr_i(0) <= '0';
            elsif B_WR = '1' then 
               b_add_i <= B_WR_ADD;
               b_wr_i(0) <= '1';
               b_wr_data_i <= B_WR_DATA;
            else
               b_wr_i(0) <= '0';
            end if;
            
            -- erreur à eviter par design 
            if (B_RD and B_WR) = '1' then
               B_ERR <='1';  -- latch
            end if;
            
         end if;
      end if;		
   end process;
   
   ------------------------------------------------------
   -- mapping  RAM
   ------------------------------------------------------   
   gen_a15 : if (TOTAL_ADD_WIDTH = 15) generate
      begin                  
      FoundGenCase <= true; 
      U5 : tdp_ram_w32_d32768
      port map (
         -- port A 
         clka  => A_CLK,
         ena   => '1',
         wea   => a_wr_i,
         addra => a_add_i(TOTAL_ADD_WIDTH-1 downto 0),
         dina  => a_wr_data_i,
         douta => A_RD_DATA,       
         -- port B
         clkb  => B_CLK,
         enb   => '1',
         web   => b_wr_i,
         addrb => b_add_i(TOTAL_ADD_WIDTH-1 downto 0),
         dinb  => b_wr_data_i,
         doutb => B_RD_DATA
         );
   end generate;
   
   gen_a14 : if (TOTAL_ADD_WIDTH = 14) generate
      begin                  
      FoundGenCase <= true; 
      U3 : tdp_ram_w32_d16384
      port map (
         -- port A 
         clka  => A_CLK,
         ena   => '1',
         wea   => a_wr_i,
         addra => a_add_i(TOTAL_ADD_WIDTH-1 downto 0),
         dina  => a_wr_data_i,
         douta => A_RD_DATA,       
         -- port B
         clkb  => B_CLK,
         enb   => '1',
         web   => b_wr_i,
         addrb => b_add_i(TOTAL_ADD_WIDTH-1 downto 0),
         dinb  => b_wr_data_i,
         doutb => B_RD_DATA
         );
   end generate;

   gen_a13 : if (TOTAL_ADD_WIDTH = 13) generate
      begin                  
      FoundGenCase <= true; 
      U4 : tdp_ram_w32_d8192
      port map (
         -- port A 
         clka  => A_CLK,
         ena   => '1',
         wea   => a_wr_i,
         addra => a_add_i(TOTAL_ADD_WIDTH-1 downto 0),
         dina  => a_wr_data_i,
         douta => A_RD_DATA,       
         -- port B
         clkb  => B_CLK,
         enb   => '1',
         web   => b_wr_i,
         addrb => b_add_i(TOTAL_ADD_WIDTH-1 downto 0),
         dinb  => b_wr_data_i,
         doutb => B_RD_DATA
         );
   end generate;
end rtl;
