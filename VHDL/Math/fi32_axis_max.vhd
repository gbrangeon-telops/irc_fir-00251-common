------------------------------------------------------------------
--!   @file : fi32_axis_max
--!   @brief
--!   @details ce module compare deux données Axistream en entrée et sort le résultat sur 32 bits signed.  
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

entity fi32_axis_max is
   
   generic(
      a_input_signed  : boolean := false;
      a_input_efflen  : natural := 12;     -- largeur effective des données A en entrée. Max = 31
      b_input_signed  : boolean := false;
      b_input_efflen  : natural := 12;     -- largeur effective des données B en entrée.  Max = 31
      tuser_index     : integer := TUSER_UCR_PIX_BIT;
      flag_en         : boolean := false;
	  enable_internal_sync : boolean := true -- enable axis_sync_flow module to synchronize input flows. If false, flow must be synchronized externally
      );      
   port(
      ARESETN    : in std_logic;
      CLK        : in std_logic;
      
      RXA_MOSI   : in t_axi4_stream_mosi32;
      RXA_MISO   : out t_axi4_stream_miso;
      
      RXB_MOSI   : in t_axi4_stream_mosi32;
      RXB_MISO   : out t_axi4_stream_miso;
      
      TX_MOSI    : out t_axi4_stream_mosi32;  
      TX_MISO    : in t_axi4_stream_miso;
      
      TX_SIGNED  : out std_logic;
      ERR        : out std_logic
      
      );
end fi32_axis_max;

architecture rtl of fi32_axis_max is
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
   
   signal a_32bits, b_32bits : signed(31 downto 0);
   signal sync_tready        : std_logic;
   signal sync_tvalid        : std_logic  := '0';
   signal areset             : std_logic;
   signal sreset             : std_logic;
   
begin  
   
   TX_SIGNED <= '1';
   areset <= not ARESETN;
   
   -- synchro reset   
   U0: sync_reset
   port map(
      ARESET => areset,
      CLK    => CLK,
      SRESET => sreset
      ); 
   
	gen_en_sync: if enable_internal_sync generate
	   sync_tready <= TX_MISO.TREADY;
	   
	   U1: axis_sync_flow
	   port map(
	      RX0_TVALID  => RXA_MOSI.TVALID,
	      RX0_TREADY  => RXA_MISO.TREADY,
	      RX1_TVALID  => RXB_MOSI.TVALID,
	      RX1_TREADY  => RXB_MISO.TREADY,
	      SYNC_TREADY => sync_tready,
	      SYNC_TVALID => sync_tvalid   
	      );
	end generate;

	gen_ext_sync: if not enable_internal_sync generate
		RXA_MISO.TREADY <= TX_MISO.TREADY;
		RXB_MISO.TREADY <= TX_MISO.TREADY;
		sync_tvalid     <= RXA_MOSI.TVALID; -- externally synchronized with RXB_MOSI.TVALID when enable_internal_sync = false
	end generate;
   
   a_signed_case: if a_input_efflen < 32 and a_input_signed generate
      begin
      a_32bits <= to_signed(to_integer(signed(RXA_MOSI.TDATA(a_input_efflen-1 downto 0))), 32);
   end generate;
   
   a_unsigned_case: if a_input_efflen < 32 and not a_input_signed generate
      begin
      a_32bits <= to_signed(to_integer(unsigned(RXA_MOSI.TDATA(a_input_efflen-1 downto 0))), 32);     
   end generate;
   
   b_signed_case: if b_input_efflen < 32 and a_input_signed generate
      begin
      b_32bits <= to_signed(to_integer(signed(RXB_MOSI.TDATA(b_input_efflen-1 downto 0))), 32);     
   end generate;
   
   b_unsigned_case: if b_input_efflen < 32 and not a_input_signed generate
      begin
      b_32bits <= to_signed(to_integer(unsigned(RXB_MOSI.TDATA(b_input_efflen-1 downto 0))), 32);     
   end generate;
   
   process(CLK)
   begin
      if rising_edge(CLK) then
         -- erreur si entrée valide sur plus que 31 bits
         if a_input_efflen = 32 or b_input_efflen = 32 then 
            ERR <= '1';
         else
            ERR <= '0';
         end if;

         if TX_MISO.TREADY = '1' then 
            TX_MOSI <= RXA_MOSI;
            if sync_tvalid = '1' then 
               if a_32bits > b_32bits then 
                  TX_MOSI.TDATA <= std_logic_vector(a_32bits);
               else
                  TX_MOSI.TDATA <= std_logic_vector(b_32bits);
                  if flag_en = true then
                     TX_MOSI.TUSER(tuser_index) <= '1';
                  end if;
               end if;
            else
               TX_MOSI.TVALID <= '0'; 
            end if;
         end if;
         
         if sreset = '1' then
            TX_MOSI.TVALID <= '0';
         end if;

         TX_MOSI.TID    <= (others => '0');   -- non supporté
         TX_MOSI.TDEST  <= (others => '0');   -- non supporté	 

      end if; 
   end process;
   
end rtl;
