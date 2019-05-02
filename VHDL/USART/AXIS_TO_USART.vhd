library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.tel2000.all;

entity AXIS_TO_USART is
  port (
	TX_BYTES    : out STD_LOGIC_VECTOR(7 downto 0);
	TX_VALID    : out STD_LOGIC;
	TX_CLK      : in STD_LOGIC;
    TX_ACTIVE   : in STD_LOGIC;
    TX_DONE     : in STD_LOGIC; 

    AXIS_MOSI   : in t_axi4_stream_mosi32;
    AXIS_MISO   : out t_axi4_stream_miso;
    
    BYTES_TO_TRANSMIT   : IN std_logic_vector(15 downto 0);
	BYTES_TR_VALID      : in std_logic;
    TRANSMIT_DONE       : OUT std_logic;
    TR_RESET            : IN std_logic;
    
    ERROR       : out std_logic; -- Bytes lost
    ARESETN     : in STD_LOGIC
    );
end AXIS_TO_USART;


architecture RTL of AXIS_TO_USART is

   component SYNC_RESETN is
      port(
         CLK     : in std_logic;
         ARESETN : in std_logic;
         SRESETN : out std_logic
         );
   end component;
   
   signal sresetn : std_logic;

type sm_Tx_State is (STANDBY, FIRST_BYTE, SECOND_BYTE, THIRD_BYTE, LAST_BYTE, PAUSE);


SIGNAL tx_state : sm_Tx_State := STANDBY;
SIGNAL next_tx_state : sm_Tx_State := STANDBY;
signal tx_ready : std_logic := '0';
signal tx_data  : std_logic_vector(31 downto 0);
signal packet_complete : std_logic;

--transmit management
signal bytes_to_send : unsigned(15 downto 0);


    attribute keep : string; 
   attribute keep of tx_state : signal is "TRUE"; 
    attribute keep of next_tx_state : signal is "TRUE";
    attribute keep of tx_ready : signal is "TRUE";
    attribute keep of tx_data : signal is "TRUE";
    attribute keep of TX_BYTES : signal is "TRUE";
    attribute keep of TX_VALID : signal is "TRUE";

begin

sync_resetn_inst : sync_resetn port map(ARESETN => ARESETN, SRESETN => sresetn, CLK => TX_CLK);

AXIS_MISO.TREADY <= tx_ready;

--TODO SET ERROR
ERROR <= '0';

USART_TX_INTF : process (TX_CLK)
begin
    if rising_edge(TX_CLK) then
        if(sresetn = '0') then
            tx_state <= STANDBY;
            next_tx_state <= STANDBY;
            tx_data <= (others => '0');
            TX_VALID <= '0';
            TRANSMIT_DONE <= '0';
            bytes_to_send <= to_unsigned(0,16);
            packet_complete <= '1';
        else
            if(TR_RESET = '1') then
                TRANSMIT_DONE <= '0';
                packet_complete <= '1';
            end if;
        
            case tx_state is
                when STANDBY =>
                    if(AXIS_MOSI.TVALID = '1' and tx_ready = '1') then
                        tx_data <= AXIS_MOSI.TDATA;
                        tx_state <= FIRST_BYTE;
                        TRANSMIT_DONE <= '0';
                        packet_complete <= '0';
                    else
                        tx_data <= (others => '0');
                        TX_BYTES <= tx_data(7 downto 0);
                        tx_state <= STANDBY;
                        
                        if (packet_complete = '1' and BYTES_TR_VALID = '1') then
                            bytes_to_send <= unsigned(BYTES_TO_TRANSMIT); -- latch the number of bytes to send while waiting for data to send
                        else
                            bytes_to_send <= bytes_to_send ;
                        end if;
                        
                    end if;
                when FIRST_BYTE =>
                    if(TX_ACTIVE = '0' and TX_DONE = '0') then
                        TX_BYTES <= tx_data(7 downto 0);
                        tx_state <= PAUSE;
                        next_tx_state <= SECOND_BYTE;
                        TX_VALID <= '1';
                        bytes_to_send <= bytes_to_send - 1;
                    else
                        TX_BYTES <=  tx_data(7 downto 0);
                        tx_state <= FIRST_BYTE;
                        TX_VALID <= '0';
                    end if;
                    
                when SECOND_BYTE =>
                    if(TX_ACTIVE = '0' and TX_DONE = '0') then
                        TX_BYTES <= tx_data(15 downto 8);
                        tx_state <= PAUSE;
                        next_tx_state <= THIRD_BYTE;
                        TX_VALID <= '1';
                        bytes_to_send <= bytes_to_send - 1;
                    else
                        TX_BYTES <= tx_data(7 downto 0);
                        tx_state <= SECOND_BYTE;
                        TX_VALID <= '0';
                    end if;
                when THIRD_BYTE =>
                    if(TX_ACTIVE = '0' and TX_DONE = '0') then
                        TX_BYTES <= tx_data(23 downto 16);
                        tx_state <= PAUSE;
                        next_tx_state <= LAST_BYTE;
                        TX_VALID <= '1';
                        bytes_to_send <= bytes_to_send - 1;
                    else
                        TX_BYTES <= tx_data(15 downto 8);
                        tx_state <= THIRD_BYTE;
                        TX_VALID <= '0';
                    end if;
                
                when LAST_BYTE =>
                    if(TX_ACTIVE = '0' and TX_DONE = '0') then
                        TX_BYTES <= tx_data(31 downto 24);
                        tx_state <= PAUSE;
                        next_tx_state <= STANDBY;
                        TX_VALID <= '1';
                        bytes_to_send <= bytes_to_send - 1;
                    else
                        TX_BYTES <= tx_data(23 downto 16);
                        tx_state <= LAST_BYTE;
                        TX_VALID <= '0';
                    end if;
                when PAUSE =>
                    if(bytes_to_send = 0) then
                        tx_state <= STANDBY;
                        TX_VALID <= '0';
                        TRANSMIT_DONE <= '1';
                        packet_complete <= '1';
                    else
                        tx_state <= next_tx_state;
                        TX_VALID <= '0';
                    end if;

                when others =>
                    TX_BYTES <= (others => '0');
                    tx_state <= STANDBY;
                    TX_VALID <= '0';
                end case;
        end if;
    end if;
end process USART_TX_INTF;

USART_RDY: process (TX_CLK)
begin
    if rising_edge(TX_CLK) then
        if(sresetn = '0') then
            tx_ready <= '0';
        else
            if (AXIS_MOSI.TVALID = '1' and tx_ready = '1' and tx_state = STANDBY) then
                tx_ready <= '0';
            elsif(TX_ACTIVE = '0' and TX_DONE = '0' and tx_state = STANDBY and bytes_to_send /= 0) then --Tvalid exit standby mode
                tx_ready <= '1';
            else
                tx_ready <= '0';
            end if;            
        end if;
    end if;
end process USART_RDY;


  
end RTL;
