library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity USART_SERIAL_TB is
  port (
    CLK_USART   : out  std_logic;
    TX_Serial   : out  std_logic;
    RX_SERIAL   : in std_logic;
    ARESETN     : in std_logic
    );
end USART_SERIAL_TB;

architecture sims of USART_SERIAL_TB is

-- CLK and RESET
constant clk16_per : time := 62.5 ns;
signal clk16_o : std_logic := '0';


signal w_TX_SERIAL : std_logic;
signal w_RX_BYTE   : std_logic_vector(7 downto 0); 
signal w_RX_DV     : std_logic;
signal r_RX_SERIAL : std_logic := '1';

type   integer_list is array (natural range <>) of integer;
signal tx_value : integer_list(0 to 39);

signal rx_packet_id : integer;
signal rx_bytes_cnt : integer;
signal rx_timeout_cnt   : integer; 
signal Active_RX    :std_logic;

component USART_RX
  port (
       ARESETN : in STD_LOGIC;
       RX_SERIAL : in STD_LOGIC;
       USART_CLK : in STD_LOGIC;
       RX_BYTE : out STD_LOGIC_VECTOR(7 downto 0);
       RX_DV : out STD_LOGIC;
       STOP_BIT_ERROR : out STD_LOGIC
  );
end component;

  
  -- Low-level byte-write
  procedure UART_WRITE_BYTE (
    i_data_in       : in  std_logic_vector(7 downto 0);
    signal i_clk           : in  std_logic;
    signal o_serial : out std_logic) is
  begin

    -- Send Start Bit
    wait until falling_edge(i_clk);
    o_serial <= '0';

    -- Send Data Byte
    for ii in 0 to 7 loop
        wait until falling_edge(i_clk);
        o_serial <= i_data_in(ii);
    end loop;  -- ii

    -- Send Stop Bit
    wait until falling_edge(i_clk);
    o_serial <= '1';
  end UART_WRITE_BYTE;

  
begin

    CLK16_GEN: process(clk16_o)
    begin
       clk16_o <= not clk16_o after clk16_per/2;                          
    end process;
    
    CLK_USART <= clk16_o;
  TX_Serial <= w_TX_SERIAL; 

  
  TX_Process : process is
  variable tx_data : std_logic_vector(7 downto 0); 
  begin
    
      rx_packet_id <= 0; 
    tx_value(0) <= 255;  
    tx_value(1) <= 255;
    tx_value(2) <= 255;
    tx_value(3) <= 255;
    tx_value(4) <= 255;
    tx_value(5) <= 255;
    tx_value(6) <= 255;
    tx_value(7) <= 255;
    tx_value(8) <= 255;
    tx_value(9) <= 255;
    tx_value(10) <= 254;
    tx_value(11) <= 254;
    tx_value(12) <= 254;
    tx_value(13) <= 254;
    tx_value(14) <= 254;
    tx_value(15) <= 254;
    tx_value(16) <= 254;
    tx_value(17) <= 254;
    tx_value(18) <= 254;
    tx_value(19) <= 254;
    tx_value(20) <= 255;
    tx_value(21) <= 255;
    tx_value(22) <= 255;
    tx_value(23) <= 255;
    tx_value(24) <= 255;
    tx_value(25) <= 255;
    tx_value(26) <= 255;
    tx_value(27) <= 255;
    tx_value(28) <= 255;
    tx_value(29) <= 255;
    tx_value(30) <= 16;
    tx_value(31) <= 16;
    tx_value(32) <= 16;
    tx_value(33) <= 16;
    tx_value(34) <= 16;
    tx_value(35) <= 16;
    tx_value(36) <= 16;
    tx_value(37) <= 16;
    tx_value(38) <= 16;
    tx_value(39) <= 16;    

      
      
    w_TX_SERIAL <= '1';
    wait for 5 us; -- Start time delay
    -- Tell the UART to send a command.
    wait until rising_edge(clk16_o);
    
    -- Send a command to the UART
    for j in 0 to tx_value'length-1 loop
        for i in 0 to tx_value(j) loop
            wait until rising_edge(clk16_o);
            tx_data := std_logic_vector(to_unsigned(i,8));
            UART_WRITE_BYTE(tx_data,clk16_o, w_TX_SERIAL);
            wait for 1 ns;
        end loop; 
        wait for 250 us; -- wait for rx
        rx_packet_id <= rx_packet_id +1; 
        
    end loop;
    
    wait for 5 us;

    wait;
  end process; 

RX_Process : process(clk16_o)
begin 
    if (rising_edge(clk16_o) )then
        if(ARESETN = '0') then
            rx_bytes_cnt <= 0;
            Active_RX <= '0';
        else
            if(w_RX_DV = '1') then
               rx_bytes_cnt <= rx_bytes_cnt +1;
               rx_timeout_cnt <= 50;
               Active_RX <= '1';
            elsif(Active_RX = '1') then
               rx_timeout_cnt <= rx_timeout_cnt -1; 
            end if;
            
            if(rx_timeout_cnt = 1) then
                if (rx_bytes_cnt /=  (tx_value(rx_packet_id)+1)) then
                    rx_bytes_cnt <= 0;
                    rx_timeout_cnt <= 80;
                    report "Rx Byte count invalid" severity error;
                end if;
                rx_bytes_cnt <= 0;
                rx_timeout_cnt <= 80 ;
                Active_RX <= '0';
            end if;   
        end if;
    end if; 

end process;
  
U1 : USART_RX
  port map(
       ARESETN => ARESETN,
       RX_BYTE => w_RX_BYTE,
       RX_DV => w_RX_DV,
       RX_SERIAL => RX_SERIAL,
       USART_CLK => clk16_o
  );
  
end sims;
