library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use work.tel2000.all;

entity USART_AXIS_TB is
  port (
    RX_MOSI : in t_axi4_stream_mosi32;
    RX_MISO : out t_axi4_stream_miso;
    
    TX_MOSI : out t_axi4_stream_mosi32;
    TX_MISO : in t_axi4_stream_miso;
    
    AXIL_MOSI   : out t_axi4_lite_mosi;
    AXIL_MISO  : in t_axi4_lite_miso;
    
    INTR        : in std_logic;
    
    MB_CLK  : out std_logic;
    ARESETN  : out std_logic
    );
end USART_AXIS_TB;

architecture sims of USART_AXIS_TB is

-- CLK and RESET
constant clk100_per : time := 10 ns;
signal clk100_o : std_logic := '0';
signal rstn_i : std_logic := '0';

--Rx Process
signal rx_word : std_logic_vector(31 downto 0);
signal rx_rdy : std_logic;
signal rx_word_valid : std_logic;
 

--TX process
signal tx_word : std_logic_vector(31 downto 0);
signal tx_word_valid : std_logic;



--AXIL
constant C_S_AXI_DATA_WIDTH : integer := 32;
constant C_S_AXI_ADDR_WIDTH : integer := 32;
constant ADDR_LSB           : integer := 2;   -- 4 bytes access
constant OPT_MEM_ADDR_BITS  : integer := 16;   -- Number of supplement bit
constant NUMBER_OF_FILTERS  : integer := 8;

constant TIMEOUT_LENGTH_ADDR     : std_logic_vector(ADDR_LSB + OPT_MEM_ADDR_BITS downto 0) := std_logic_vector(to_unsigned(0,ADDR_LSB + OPT_MEM_ADDR_BITS + 1));
constant BYTES_TO_TRANSMIT_ADDR  : std_logic_vector(ADDR_LSB + OPT_MEM_ADDR_BITS downto 0) := std_logic_vector(to_unsigned(4,ADDR_LSB + OPT_MEM_ADDR_BITS + 1));
constant RX_BYTES_COUNT_ADDR     : std_logic_vector(ADDR_LSB + OPT_MEM_ADDR_BITS downto 0) := std_logic_vector(to_unsigned(8,ADDR_LSB + OPT_MEM_ADDR_BITS + 1));
constant INTR_VECTOR_ADDR        : std_logic_vector(ADDR_LSB + OPT_MEM_ADDR_BITS downto 0) := std_logic_vector(to_unsigned(12,ADDR_LSB + OPT_MEM_ADDR_BITS + 1));
constant CLEAR_INTR_ADDR         : std_logic_vector(ADDR_LSB + OPT_MEM_ADDR_BITS downto 0) := std_logic_vector(to_unsigned(16,ADDR_LSB + OPT_MEM_ADDR_BITS + 1));

signal intr_vect : std_logic_vector(31 downto 0);
signal rx_bytes_count   : std_logic_vector(31 downto 0);
signal rx_bytes_count_u   : unsigned(31 downto 0);
signal bytes_rd : unsigned(31 downto 0);
signal bytes_send : unsigned(31 downto 0);

type fifo8 is array (0 to 511 ) of std_logic_vector(7 downto 0);
signal fifo : fifo8;

begin

--Set rx_miso
RX_MISO.TREADY <= rx_rdy;

--Set TX daTA
TX_MOSI.TDATA   <= tx_word;
TX_MOSI.TVALID  <= tx_word_valid;
TX_MOSI.TLAST   <= '0';
TX_MOSI.TKEEP   <= (others => '1');
TX_MOSI.TDEST   <= (others => '0');
TX_MOSI.TSTRB   <= (others => '1');
TX_MOSI.TUSER   <= (others => '0');
TX_MOSI.TID   <= (others => '0');

    
MB_CLK <= clk100_o;

ARESETN <= rstn_i ;

CLK100_GEN: process(clk100_o)
begin
   clk100_o <= not clk100_o after clk100_per/2;                          
end process;

--! Reset Generation
RST_GEN : process
begin          
    rstn_i <= '0';
    wait for 5 us;
    rstn_i <= '1'; 
    wait;
end process;
   
---------------------------------------
--Receive the data then loop it back to tx
MB_PROCESS : process
variable i : integer := 0;
variable j : integer := 0;
begin
    AXIL_MOSI.ARVALID   <= '0';
    AXIL_MOSI.ARADDR    <= (others => '0');
    AXIL_MOSI.ARPROT    <= (others => '0');
    AXIL_MOSI.RREADY    <= '0';
    AXIL_MOSI.AWADDR    <= (others => '0');
    AXIL_MOSI.AWVALID	<= '0';
    AXIL_MOSI.AWPROT    <= (others => '0');
    AXIL_MOSI.BREADY	   <='0';
    AXIL_MOSI.WDATA	   <= (others => '0');
    AXIL_MOSI.WVALID	   <= '0';
    AXIL_MOSI.WSTRB	   <= (others =>'0');
    AXIL_MOSI.ARVALID	<= '0';
    AXIL_MOSI.RREADY	   <= '0';
    intr_vect <= (others => '0');
    bytes_rd <= to_unsigned(0,32);
    bytes_send <= to_unsigned(0,32);
    rx_rdy <= '0';
    tx_word(31 downto 0) <= (others => '0');
    tx_word_valid <= '0';
    
    wait until rstn_i = '1';
    wait for 1 us;    
 
    --configure the usart
    wait until rising_edge(clk100_o);
    --write_axi_lite (signal Clk : in std_logic; Addr : in std_logic_vector(31 downto 0); Value : in std_logic_vector(31 downto 0);signal  miso : in  t_axi4_lite_miso;signal  mosi : out t_axi4_lite_mosi) is
    write_axi_lite(clk100_o,std_logic_vector(to_unsigned(0,32-TIMEOUT_LENGTH_ADDR'length))    & TIMEOUT_LENGTH_ADDR ,   std_logic_vector(to_unsigned(10,32)) ,AXIL_MISO ,AXIL_MOSI);
    wait for 5 ns; 
    wait until rising_edge(clk100_o);
    write_axi_lite(clk100_o,std_logic_vector(to_unsigned(0,32-BYTES_TO_TRANSMIT_ADDR'length))    & BYTES_TO_TRANSMIT_ADDR ,  std_logic_vector(to_unsigned(0,32)),AXIL_MISO ,AXIL_MOSI);
    wait for 5 ns; 
    wait until rising_edge(clk100_o); 
    write_axi_lite(clk100_o,std_logic_vector(to_unsigned(0,32-CLEAR_INTR_ADDR'length))    & CLEAR_INTR_ADDR ,  std_logic_vector(to_unsigned(0,32)),AXIL_MISO ,AXIL_MOSI);
    wait for 5 ns;
    while (0<1) loop
        
        --wait for an interupt
        wait until INTR = '1';
        wait for 50 ns;
        wait until rising_edge(clk100_o);
    
        
        --Check interupt register
        read_axi_lite(clk100_o, std_logic_vector(to_unsigned(0,32-INTR_VECTOR_ADDR'length))    & INTR_VECTOR_ADDR , AXIL_MISO, AXIL_MOSI, intr_vect);
        wait until rising_edge(clk100_o);
        
        --if timeout interupt
        if(intr_vect(1) = '1') then
            --Get rc_byte count
            read_axi_lite(clk100_o, std_logic_vector(to_unsigned(0,32-RX_BYTES_COUNT_ADDR'length))    & RX_BYTES_COUNT_ADDR , AXIL_MISO, AXIL_MOSI, rx_bytes_count);
            rx_bytes_count_u <= unsigned(rx_bytes_count);
            wait until rising_edge(clk100_o);
            rx_rdy <= '1';
            i := 0;
            bytes_rd <= to_unsigned(0,32);
            wait until rising_edge(clk100_o);
            while(bytes_rd < rx_bytes_count_u) loop
                if( rx_rdy = '1' and RX_MOSI.TVALID = '1') then
                    if( (rx_bytes_count_u - bytes_rd) = 1) then
                        fifo(i*4) <= RX_MOSI.TDATA(7 downto 0);
                        bytes_rd <= bytes_rd + 1;
                    elsif((rx_bytes_count_u - bytes_rd) = 2) then
                        fifo(i*4) <= RX_MOSI.TDATA(7 downto 0);
                        fifo(i*4+1) <= RX_MOSI.TDATA(15 downto 8);
                        bytes_rd <= bytes_rd + 2;
                    elsif((rx_bytes_count_u - bytes_rd) = 3) then
                        fifo(i*4) <= RX_MOSI.TDATA(7 downto 0);
                        fifo(i*4+1) <= RX_MOSI.TDATA(15 downto 8);
                        fifo(i*4+2) <= RX_MOSI.TDATA(23 downto 16);
                        bytes_rd <= bytes_rd + 3;
                    else
                        fifo(i*4) <= RX_MOSI.TDATA(7 downto 0);
                        fifo(i*4+1) <= RX_MOSI.TDATA(15 downto 8);
                        fifo(i*4+2) <= RX_MOSI.TDATA(23 downto 16);
                        fifo(i*4+3) <= RX_MOSI.TDATA(31 downto 24);
                        bytes_rd <= bytes_rd + 4;
                    end if;
                    i := i + 1;
                end if;
                wait until rising_edge(clk100_o);
            end loop;
            rx_rdy <= '0';
        elsif(intr_vect(0) = '1') then
            report "RX BUFFER FULL" severity error;         
        end if;
        
        wait until rising_edge(clk100_o); 
        write_axi_lite(clk100_o,std_logic_vector(to_unsigned(0,32-CLEAR_INTR_ADDR'length))    & CLEAR_INTR_ADDR ,  std_logic_vector(to_unsigned(2,32)),AXIL_MISO ,AXIL_MOSI);--Cleaqr the intr vector
        wait until rising_edge(clk100_o);
        write_axi_lite(clk100_o,std_logic_vector(to_unsigned(0,32-BYTES_TO_TRANSMIT_ADDR'length))    & BYTES_TO_TRANSMIT_ADDR ,  std_logic_vector(rx_bytes_count_u),AXIL_MISO ,AXIL_MOSI);--Cleaqr the intr vector
        wait until rising_edge(clk100_o);    
        
        -- Write the fifo back to the transmit
        report "Tx loop start" severity warning;
        bytes_send <= to_unsigned(0,32);
        j := 0;
        wait until rising_edge(clk100_o);
        
        while (bytes_send < bytes_rd) loop
            --for j in 0 to 10 loop
            if(TX_MISO.TREADY = '1') then
                
                if( (bytes_rd - j - 1) = 3) then
                    tx_word(31 downto 24) <= (others => '0');    
                    tx_word(23 downto 16) <= fifo(j*4+2);
                    tx_word(15 downto 8) <= fifo(j*4+1);
                    tx_word(7 downto 0) <= fifo(j*4);
                    bytes_send <= bytes_send + 3;
                elsif( (bytes_rd - j - 1) = 2) then
                    tx_word(31 downto 24) <= (others => '0');    
                    tx_word(23 downto 16) <=(others => '0');
                    tx_word(15 downto 8) <= fifo(j*4+1);
                    tx_word(7 downto 0) <= fifo(j*4);
                    bytes_send <= bytes_send + 2;
                elsif( (bytes_rd - j - 1) = 1) then
                    tx_word(31 downto 24) <=(others => '0');    
                    tx_word(23 downto 16) <= (others => '0');
                    tx_word(15 downto 8) <=(others => '0');
                    tx_word(7 downto 0) <= fifo(j*4);
                    bytes_send <= bytes_send + 1;
                else
                    tx_word(31 downto 24) <= fifo(j*4+3);    
                    tx_word(23 downto 16) <= fifo(j*4+2);
                    tx_word(15 downto 8) <= fifo(j*4+1);
                    tx_word(7 downto 0) <= fifo(j*4);
                    bytes_send <= bytes_send + 4;
                end if;
                tx_word_valid <= '1';
                j := j + 1;
            end if;
            wait until rising_edge(clk100_o);   
        end loop;
        report "Tx loop END" severity warning; 
        tx_word_valid <= '0';
        
        --wait for tx done

        wait until INTR = '1';
        wait for 50 ns;
        --Check interupt register
        wait until rising_edge(clk100_o); 
        read_axi_lite(clk100_o, std_logic_vector(to_unsigned(0,32-INTR_VECTOR_ADDR'length))    & INTR_VECTOR_ADDR , AXIL_MISO, AXIL_MOSI, intr_vect);
        wait until rising_edge(clk100_o);

        
        --Clear intr
        wait until rising_edge(clk100_o); 
        write_axi_lite(clk100_o,std_logic_vector(to_unsigned(0,32-CLEAR_INTR_ADDR'length))    & CLEAR_INTR_ADDR ,  std_logic_vector(to_unsigned(1,32)),AXIL_MISO ,AXIL_MOSI);--Cleaqr the intr vector
        wait for 100 ns;
        
        if(intr_vect(0) = '1') then
            report "TX complete" severity warning;    
        else
            report  "TX NOT complete" severity error;
        end if;    
            
    end loop;
    
    
    wait;
end process MB_PROCESS;
    
end sims;
