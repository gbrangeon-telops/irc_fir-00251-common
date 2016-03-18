library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.tel2000.all;

entity RX_COUNTER is
  port (

	RX_VALID        : in STD_LOGIC;
	MB_READ_VALID   : in std_logic;
    MB_READ_READY   : in std_logic;
    
    RX_COUNT        : out unsigned(15 downto 0);

    CLEAR       : in std_logic;
    MB_CLK      : in STD_LOGIC;
    ARESETN     : in STD_LOGIC
    );
end RX_COUNTER;


architecture RTL of RX_COUNTER is

component double_sync
generic(
  INIT_VALUE : bit := '0'
);
port(
    D : in STD_LOGIC;
    Q : out STD_LOGIC := '0';
    RESET : in STD_LOGIC;
    CLK : in STD_LOGIC
    );
end component;

signal rx_valid_d1  : std_logic;
signal rx_valid_d2  : std_logic;
signal rx_fifo_bytes_count : unsigned(15 downto 0);
signal reset :    std_logic;

--    attribute keep : string; 
--   attribute keep of rs_state : signal is "TRUE"; 

    

begin
    reset <= not ARESETN or CLEAR;
    U1A : double_sync port map(D => RX_VALID,Q =>  rx_valid_d1, RESET => reset, CLK => MB_CLK);
  
  RX_COUNT <= rx_fifo_bytes_count;
  
  FIFO_COUNT : process (MB_CLK)
  begin
    if rising_edge(MB_CLK) then
        if(ARESETN = '0' or CLEAR = '1') then
            rx_fifo_bytes_count <= to_unsigned(0,16);
            rx_valid_d2 <= '0';
        else
        
            rx_valid_d2 <= rx_valid_d1;
            
            if( (rx_valid_d2 /= rx_valid_d1) and rx_valid_d2 = '1' and MB_READ_VALID = '1' and MB_READ_READY = '1' ) then -- bytes received and read
                
                if(rx_fifo_bytes_count < 4) then
                    rx_fifo_bytes_count <= to_unsigned(1,rx_fifo_bytes_count'length);  --there is only the new byte left
                else
                    rx_fifo_bytes_count <= rx_fifo_bytes_count - 3;  --there is 3 bytes less (-4 + 1 )
                end if;
                
            elsif( (rx_valid_d2 /= rx_valid_d1) and rx_valid_d2 = '1' ) then -- bytes received
                rx_fifo_bytes_count <= rx_fifo_bytes_count + 1;
                
            elsif(  MB_READ_VALID = '1' and MB_READ_READY = '1' ) then -- bytes read
                if(rx_fifo_bytes_count < 4) then
                    rx_fifo_bytes_count <= to_unsigned(0,rx_fifo_bytes_count'length);  --there is no byte left
                else
                    rx_fifo_bytes_count <= rx_fifo_bytes_count - 4;  
                end if;
            else
                rx_fifo_bytes_count <= rx_fifo_bytes_count;             
            end if;            
        end if;
      
    end if;
  end process FIFO_COUNT;
  
end RTL;
