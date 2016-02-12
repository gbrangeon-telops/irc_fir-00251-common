------------------------------------------------------------------
--!   @file : fi16_axis_min
--!   @brief
--!   @details ce module compare deux données Axistream en entrée et sort le résultat sur 16 bits signed.  
--!   => La lageur effective des données en entrée ne doit donc pas depasser 31 bits (bit de signe inclus)
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

entity fi16_axis_min is
   
   generic(
      a_input_signed  : boolean := false;
      a_input_efflen  : natural := 16;     -- largeur effective des données A en entrée. Max = 16 
      b_input_signed  : boolean := false;
      b_input_efflen  : natural := 16     -- largeur effective des données B en entrée.  Max = 16
      );      
   
   port(
      ARESETN    : in std_logic;
      CLK        : in std_logic;
      
      RXA_MOSI   : in t_axi4_stream_mosi16;
      RXA_MISO   : out t_axi4_stream_miso;
      
      RXB_MOSI   : in t_axi4_stream_mosi16;
      RXB_MISO   : out t_axi4_stream_miso;
      
      TX_MOSI    : out t_axi4_stream_mosi16;  
      TX_MISO    : in t_axi4_stream_miso;
      
      TX_SIGNED  : out std_logic;
      ERR        : out std_logic
      
      );
end fi16_axis_min;

architecture rtl of fi16_axis_min is
   component axis_sync_flow
      port(                      
         RX0_TVALID    : in std_logic;
         RX0_TREADY    : out std_logic;      
         RX1_TVALID    : in std_logic;
         RX1_TREADY    : out std_logic;      
         SYNC_TREADY   : in std_logic;      
         SYNC_TVALID   : out std_logic    
         );
   end component;
   
   component sync_reset
      port(
         ARESET : in std_logic;
         SRESET : out std_logic;
         CLK    : in std_logic);
   end component;    
   
   signal a_16bits, b_16bits : signed(15 downto 0);
   signal sync_tready        : std_logic;
   signal sync_tvalid        : std_logic  := '0';
   signal areset             : std_logic;
   signal sreset             : std_logic;
   
begin  
   
   sync_tready <= TX_MISO.TREADY;
   TX_SIGNED <= '1';
    areset <= not ARESETN;
   
   -- synchro reset   
   U0: sync_reset
   port map(
      ARESET => areset,
      CLK    => CLK,
      SRESET => sreset
      ); 
   
   U1: axis_sync_flow
   port map(
      RX0_TVALID  => RXA_MOSI.TVALID,
      RX0_TREADY  => RXA_MISO.TREADY,
      RX1_TVALID  => RXB_MOSI.TVALID,
      RX1_TREADY  => RXB_MISO.TREADY,
      SYNC_TREADY => sync_tready,
      SYNC_TVALID => sync_tvalid   
      );
   
   a_signed_case: if a_input_efflen < 16 and a_input_signed generate
      begin
      a_16bits <= to_signed(to_integer(signed(RXA_MOSI.TDATA(a_input_efflen-1 downto 0))), 16);
   end generate;
   
   a_unsigned_case: if a_input_efflen <= 16 and not a_input_signed generate
      begin
      a_16bits <= to_signed(to_integer(unsigned(RXA_MOSI.TDATA(a_input_efflen-1 downto 0))), 16);     
   end generate;
   
   b_signed_case: if b_input_efflen < 16 and a_input_signed generate
      begin
      b_16bits <= to_signed(to_integer(signed(RXB_MOSI.TDATA(b_input_efflen-1 downto 0))), 16);     
   end generate;
   
   b_unsigned_case: if b_input_efflen <= 16 and not a_input_signed generate
      begin
      b_16bits <= to_signed(to_integer(unsigned(RXB_MOSI.TDATA(b_input_efflen-1 downto 0))), 16);     
   end generate;
   
   process(CLK)
   begin
      if rising_edge(CLK) then 
         -- erreur si entrée valide sur plus que 16 bits
         if (a_input_efflen >= 16 and a_input_signed) or (a_input_efflen > 16 and not a_input_signed) or 
            (b_input_efflen >= 16 and b_input_signed) or (b_input_efflen > 16 and not b_input_signed) then 
            ERR <= '1';
         else
            ERR <= '0';
         end if;  

         TX_MOSI.TID    <= (others => '0');   -- non supporté
         TX_MOSI.TDEST  <= (others => '0');   -- non supporté	 
         
         if TX_MISO.TREADY = '1' then 
            TX_MOSI <= RXA_MOSI;
            if sync_tvalid = '1' then 
               if a_16bits < b_16bits then 
                  TX_MOSI.TDATA <= std_logic_vector(a_16bits);
               else
                  TX_MOSI.TDATA <= std_logic_vector(b_16bits);
               end if;
            else
               TX_MOSI.TVALID <= '0'; 
            end if;
         end if;
         
         if sreset = '1' then
            TX_MOSI.TVALID <= '0';
         end if;
      end if; 
   end process;
   
end rtl;
