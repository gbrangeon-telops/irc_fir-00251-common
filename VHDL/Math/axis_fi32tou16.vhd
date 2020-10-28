-------------------------------------------------------------------------------
--
-- Title       : axis_fi32tou16
-- Author      : PDU / KBE
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- Description : 
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;   
use ieee.numeric_std.all;
use work.tel2000.all;

entity axis_fi32tou16 is
   generic(
      VOUT_MIN : unsigned(15 downto 0) := unsigned(VALID_PIX_MIN_VAL);
      VOUT_MAX : unsigned(15 downto 0) := unsigned(VALID_PIX_MAX_VAL);
      VALUE_REPL_MIN : unsigned(15 downto 0) := unsigned(VALID_PIX_MIN_VAL);
      VALUE_REPL_MAX : unsigned(15 downto 0) := unsigned(VALID_PIX_MAX_VAL)
      );  
   port(
      ARESETN    : in  std_logic;
      CLK        : in  std_logic;
      RX_MOSI    : in  t_axi4_stream_mosi32;      
      RX_MISO    : out t_axi4_stream_miso;  
      TX_MOSI    : out t_axi4_stream_mosi16;
      TX_MISO    : in t_axi4_stream_miso;
      UNDERFL    : out std_logic;
      OVERFL     : out std_logic
      );
end axis_fi32tou16;


architecture RTL of axis_fi32tou16 is
   
   component sync_reset
      port(
         ARESET : in std_logic;
         SRESET : out std_logic;
         CLK : in std_logic);
   end component;
   
   type pipe_rx_mosi_type is  array (1 to 2) of t_axi4_stream_mosi16; 
   signal data_in        : signed(31 downto 0);
   signal pipe_rx_mosi   : t_axi4_stream_mosi16;
   signal pipe_underfl   : std_logic;
   signal pipe_overfl    : std_logic;
   signal sreset         : std_logic;
   signal areset         : std_logic; 
   
begin
   
   RX_MISO <= TX_MISO;
   data_in <= to_signed(to_integer(signed(RX_MOSI.TDATA)), data_in'length);
   
   areset <= not ARESETN;   
   
   U0 : sync_reset
   port map(ARESET => areset, SRESET => sreset, CLK => CLK);
   
   U1: process(CLK)
   begin          
      if rising_edge(CLK) then
         
         if sreset = '1' then 
            pipe_rx_mosi.tvalid  <= '0';
            TX_MOSI.TVALID <= '0';
            UNDERFL <= '0';
            OVERFL <= '0';
            
         else
            
            if TX_MISO.TREADY = '1' then  
               
               -- pipe 1 : recherche de underflow
               pipe_rx_mosi.tdata   <= RX_MOSI.TDATA(15 downto 0);
               pipe_rx_mosi.tstrb   <= RX_MOSI.TSTRB(1 downto 0);  
               pipe_rx_mosi.tkeep   <= RX_MOSI.TKEEP(1 downto 0);  
               pipe_rx_mosi.tlast   <= RX_MOSI.TLAST;  
               pipe_rx_mosi.tid     <= RX_MOSI.TID;    
               pipe_rx_mosi.tdest   <= RX_MOSI.TDEST;  
               pipe_rx_mosi.tuser   <= RX_MOSI.TUSER(3 downto 0);
               pipe_rx_mosi.tvalid  <= RX_MOSI.TVALID;         
               pipe_underfl <= '0';
               pipe_overfl <= '0';     
               if data_in < to_integer(VOUT_MIN) then
                  pipe_rx_mosi.tdata <= std_logic_vector(VALUE_REPL_MIN);
                  pipe_underfl <= RX_MOSI.TVALID;
               else
                  if data_in > to_integer(VOUT_MAX) then
                     pipe_rx_mosi.tdata <= std_logic_vector(VALUE_REPL_MAX);    
                     pipe_overfl <= RX_MOSI.TVALID;
                  end if;
               end if;
               -- pipe 2  outputs
               TX_MOSI <= pipe_rx_mosi; 
               UNDERFL <= pipe_underfl;
               OVERFL <= pipe_overfl;
            end if;
            
         end if;
         
      end if;
   end process;
   
end RTL;
