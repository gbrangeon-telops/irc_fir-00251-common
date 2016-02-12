library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.tel2000.all;

entity USART_TO_AXIS is
  port (
	RX_BYTES    : in STD_LOGIC_VECTOR(7 downto 0);
	RX_VALID    : in STD_LOGIC;
	RX_CLK      : in STD_LOGIC;

    AXIS_MOSI   : out t_axi4_stream_mosi32;
    AXIS_MISO   : in t_axi4_stream_miso;
    
    TIMEOUT_COUNT   : in std_logic_Vector(7 downto 0);
    
    RX_FULL       : out std_logic; -- Bytes lost
    TIMEOUT     : out std_logic;
    CLEAR_RX_FULL       : in std_logic; -- clear RX_FULL
    CLEAR_TIMEOUT       : in std_logic; -- clear timeout
    ARESETN     : in STD_LOGIC
    );
end USART_TO_AXIS;


architecture RTL of USART_TO_AXIS is

type sm_Rx_State is (STANDBY, FIRST_BYTE, SECOND_BYTE, THIRD_BYTE, LAST_BYTE);

SIGNAL rs_state : sm_Rx_State := STANDBY;
signal tdata :std_logic_vector(31 downto 0); 

signal timeout_o    : std_logic;
signal time_delay_s   :unsigned(15 downto 0);
signal timeout_delay  : unsigned(15 downto 0);
signal active_transmision : std_logic;

    attribute keep : string; 
   attribute keep of rs_state : signal is "TRUE"; 
    attribute keep of tdata : signal is "TRUE";
    attribute keep of AXIS_MOSI : signal is "TRUE";
    attribute keep of RX_FULL : signal is "TRUE";
    

begin
  
  AXIS_MOSI.TDATA <= tdata;
  AXIS_MOSI.TSTRB <= (others => '1');
  AXIS_MOSI.TKEEP <= (others => '1');
  AXIS_MOSI.TID <= (others => '0');
  AXIS_MOSI.TDEST <= (others => '0');
  AXIS_MOSI.TUSER <= (others => '0');
  TIMEOUT <= timeout_o;
  
  AXIS_PACKAGE : process (RX_CLK)
  begin
    if rising_edge(RX_CLK) then
        if(ARESETN = '0') then
            tdata <= (others => '0');
            AXIS_MOSI.TVALID <= '0';
            AXIS_MOSI.TLAST <= '0';
            rs_state <= STANDBY;
            RX_FULL <= '0';
        else
            --reset error
            if(CLEAR_RX_FULL = '1') then 
                RX_FULL <= '0';
            end if;
            --State machine
            case rs_state is
                when STANDBY =>
                    if(RX_VALID = '1') then
                        tdata(7 downto 0) <= RX_BYTES;
                        AXIS_MOSI.TVALID <= '0';
                        AXIS_MOSI.TLAST  <= '0';
                        rs_state <= FIRST_BYTE;
                    else
                        tdata <= (others => '0');
                        AXIS_MOSI.TVALID <= '0';
                        AXIS_MOSI.TLAST  <= '0';
                        rs_state <= STANDBY;
                    end if;
                when FIRST_BYTE =>
                    if(RX_VALID = '1') then
                        tdata(15 downto 8) <= RX_BYTES;
                        AXIS_MOSI.TVALID <= '0';
                        AXIS_MOSI.TLAST  <= '0';
                        rs_state <= SECOND_BYTE;
                    elsif( timeout_o = '1') then
                        tdata <= tdata;
                        AXIS_MOSI.TVALID <= '1';
                        AXIS_MOSI.TLAST  <= '1';
                        rs_state <= STANDBY;
                        if(AXIS_MISO.TREADY = '0') then
                            RX_FULL <= '1';
                        end if;
                    else
                        tdata <= tdata;
                        AXIS_MOSI.TVALID <= '0';
                        AXIS_MOSI.TLAST  <= '0';
                        rs_state <= FIRST_BYTE;
                    end if;
                when SECOND_BYTE =>
                    if(RX_VALID = '1') then
                        tdata(23 downto 16) <= RX_BYTES;
                        AXIS_MOSI.TVALID <= '0';
                        AXIS_MOSI.TLAST  <= '0';
                        rs_state <= LAST_BYTE;
                    elsif( timeout_o = '1') then
                        tdata <= tdata;
                        AXIS_MOSI.TVALID <= '1';
                        AXIS_MOSI.TLAST  <= '1';
                        rs_state <= STANDBY;                        
                        if(AXIS_MISO.TREADY = '0') then
                            RX_FULL <= '1';
                        end if;
                    else
                        tdata <= tdata;
                        AXIS_MOSI.TVALID <= '0';
                        AXIS_MOSI.TLAST  <= '0';
                        rs_state <= SECOND_BYTE;
                    end if;
                when LAST_BYTE =>
                    if(RX_VALID = '1') then
                        tdata(31 downto 24) <= RX_BYTES;
                        AXIS_MOSI.TVALID <= '1';
                        AXIS_MOSI.TLAST  <= '0';
                        rs_state <= STANDBY;
                        if(AXIS_MISO.TREADY = '0') then
                            RX_FULL <= '1';
                        end if;
                    elsif( timeout_o = '1') then
                        tdata <= tdata;
                        AXIS_MOSI.TVALID <= '1';
                        AXIS_MOSI.TLAST  <= '1';
                        rs_state <= STANDBY;
                        if(AXIS_MISO.TREADY = '0') then
                            RX_FULL <= '1';
                        end if;
                    else
                        tdata <= tdata;
                        AXIS_MOSI.TVALID <= '0';
                        AXIS_MOSI.TLAST  <= '0';
                        rs_state <= LAST_BYTE;
                    end if;                
                when others =>
            end case;
        end if;
      
    end if;
  end process AXIS_PACKAGE;
  
  timeout_delay <= shift_left(unsigned(resize(TIMEOUT_COUNT,16)),3);
  
  timeout_proc : process (RX_CLK)
  begin
    if rising_edge(RX_CLK) then
        if(ARESETN = '0') then
            timeout_o <= '0';
            time_delay_s <= (others => '0');
            active_transmision <= '0';
        else
            if(RX_VALID = '1') then
               time_delay_s <= (others => '0');
               active_transmision <= '1';
            else       
               if( time_delay_s < timeout_delay and active_transmision = '1') then
                   time_delay_s <= time_delay_s +1;
                   timeout_o <= timeout_o;
               elsif(active_transmision = '1') then
                   timeout_o <= '1';
                   time_delay_s <= time_delay_s;
               else --Not an active transmision
                   timeout_o <= timeout_o;
                   time_delay_s <= time_delay_s;
               end if;
            end if;
            
            if(CLEAR_TIMEOUT = '1') then
                timeout_o <= '0';
                active_transmision <= '0';
            end if;
            
        end if;
    end if;
   end process timeout_proc;     
  
end RTL;
