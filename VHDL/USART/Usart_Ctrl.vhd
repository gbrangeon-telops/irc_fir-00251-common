-------------------------------------------------------------------------------
--
-- Title       : AEC_Ctrl
-- Author      : Jean-Alexis Boulet
-- Company     : Telops
--
-------------------------------------------------------------------------------
-- $Author$
-- $LastChangedDate$
-- $Revision$ 
-------------------------------------------------------------------------------
--
-- Description : This file implement the axi_lite communication and interrupt gen to the micro blaze
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.ALL;
use work.tel2000.all;


entity Usart_Ctrl is
    port(

    --------------------------------
    -- PowerPC Interface
    -------------------------------- 
    AXI4_LITE_MOSI : in t_axi4_lite_mosi;
    AXI4_LITE_MISO : out t_axi4_lite_miso;
    INTERUPT        : out STD_LOGIC;
      
    --------------------------------
    -- USART_CTRL
    --------------------------------
    TX_BYTES_TO_TRANSMIT    :   out std_logic_vector(15 downto 0);
    TIMOUT_LENGTH           :   out std_logic_vector(7 downto 0); -- In bytes
    RX_BYTES_COUNT          :   in unsigned(15 downto 0);
    CLEAR_INTR              :   out std_logic_vector(2 downto 0); --[rx_full_i,rx_timeout_i,tx_done_i]
    
    --Interrupt vector
    RX_FULL                 :   in std_logic;
    RX_TIMEOUT              :   in std_logic;
    TX_DONE                 :   in std_logic;

    -- CLK_CTRL
    ARESETN             : in  std_logic;
    CLK_MB              : in  std_logic;

    -- CLK_DATA
    CLK_USART           : in  std_logic
    );
end Usart_Ctrl;

architecture RTL of Usart_Ctrl is

  constant C_S_AXI_DATA_WIDTH : integer := 32;
  constant C_S_AXI_ADDR_WIDTH : integer := 32;
  constant ADDR_LSB           : integer := 2;   -- 4 bytes access
  constant OPT_MEM_ADDR_BITS  : integer := 4;   -- Number of supplement bit
   
   ----------------------------   
   -- Address of registers
   ----------------------------   
   constant TIMEOUT_LENGTH_ADDR     : std_logic_vector(ADDR_LSB + OPT_MEM_ADDR_BITS downto 0) := std_logic_vector(to_unsigned(0,ADDR_LSB + OPT_MEM_ADDR_BITS + 1));
   constant BYTES_TO_TRANSMIT_ADDR  : std_logic_vector(ADDR_LSB + OPT_MEM_ADDR_BITS downto 0) := std_logic_vector(to_unsigned(4,ADDR_LSB + OPT_MEM_ADDR_BITS + 1));
   constant RX_BYTES_COUNT_ADDR     : std_logic_vector(ADDR_LSB + OPT_MEM_ADDR_BITS downto 0) := std_logic_vector(to_unsigned(8,ADDR_LSB + OPT_MEM_ADDR_BITS + 1));
   constant INTR_VECTOR_ADDR        : std_logic_vector(ADDR_LSB + OPT_MEM_ADDR_BITS downto 0) := std_logic_vector(to_unsigned(12,ADDR_LSB + OPT_MEM_ADDR_BITS + 1));
   constant CLEAR_INTR_ADDR         : std_logic_vector(ADDR_LSB + OPT_MEM_ADDR_BITS downto 0) := std_logic_vector(to_unsigned(16,ADDR_LSB + OPT_MEM_ADDR_BITS + 1));

   ----------------------------   
   -- Component Declaration
   ----------------------------   
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
   
   component double_sync_vector
	port(
		D : in STD_LOGIC_vector;
		Q : out STD_LOGIC_vector;
		CLK : in STD_LOGIC
		);
   end component;
   
   component sync_resetn is
      port(
         ARESETN : in STD_LOGIC;
         SRESETN : out STD_LOGIC;
         CLK : in STD_LOGIC
         );
   end component;
   
    component gh_stretch is 
    GENERIC (stretch_count: integer :=1023);
	 port(
		 CLK : in STD_LOGIC;
		 rst : in STD_LOGIC;
		 D : in STD_LOGIC;
		 Q : out STD_LOGIC
	     );
    end component;
   
   signal sresetn       : std_logic;
   signal sreset        : std_logic;

    --! User Input Register Declarations
    signal rx_full_i    : std_logic;
    signal rx_timeout_i : std_logic;
    signal tx_done_i    : std_logic;
    signal intr_vect    : std_logic_vector(2 downto 0);
    signal rx_bytes_cnt_i   : std_logic_vector(15 downto 0);

    --! User Output Register Declarations
    signal tx_bytes_to_transmit_o   : std_logic_vector(15 downto 0);
    signal rx_timeout_length_o      : std_logic_vector(7 downto 0);
    signal clear_intr_o               : std_logic_vector(2 downto 0);
    signal clear_intr_d               : std_logic_vector(2 downto 0);

    -- AXI4LITE signals
    signal axi_awaddr	: std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    signal axi_awready   : std_logic;
    signal axi_wready	: std_logic;
    signal axi_bresp	    : std_logic_vector(1 downto 0);
    signal axi_bvalid	: std_logic;
    signal axi_araddr	: std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    signal axi_arready   : std_logic;
    signal axi_rdata	    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal axi_rresp	    : std_logic_vector(1 downto 0);
    signal axi_rvalid	: std_logic;
    signal axi_wstrb     : std_logic_vector(3 downto 0);
    
    signal slv_reg_rden  : std_logic;
    signal slv_reg_wren  : std_logic;
    signal reg_data_out  : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal byte_index	: integer;
   
begin
  

    
    --Explicit TYPE CONVERSION
    sreset <= not sresetn;
    -- enter your statements here --
    U0A : sync_resetn port map(ARESETN => ARESETN, SRESETN => sresetn, CLK => CLK_MB);
    
    -- Input ctrl double Sync
    rx_full_i <= RX_FULL;                                      -- U1A : double_sync port map(D => RX_FULL,Q =>  rx_full_i, RESET =>  sresetn, CLK => CLK_MB);
    rx_timeout_i <= RX_TIMEOUT;                                -- U1B : double_sync port map(D => RX_TIMEOUT,Q =>  rx_timeout_i, RESET =>  sresetn, CLK => CLK_MB);
    U1C : double_sync port map(D => TX_DONE,Q =>  tx_done_i, RESET => sresetn, CLK => CLK_MB);
    rx_bytes_cnt_i <= std_logic_vector(RX_BYTES_COUNT);        -- U2A : double_sync_vector port map(D => std_logic_vector(RX_BYTES_COUNT) , Q => rx_bytes_cnt_i ,  CLK => CLK_MB);

    -- Output ctrl double Sync
    TX_BYTES_TO_TRANSMIT <= tx_bytes_to_transmit_o;            -- U3A : double_sync_vector port map(D => tx_bytes_to_transmit_o   ,Q => TX_BYTES_TO_TRANSMIT  , CLK => CLK_USART);
    TIMOUT_LENGTH <= rx_timeout_length_o;                      -- U3B : double_sync_vector port map(D => rx_timeout_length_o      ,Q => TIMOUT_LENGTH         , CLK => CLK_USART);
    
    --TODO Utiliser un CDC plutot qu'un double sync. LE signal MB est beaucoup plus rapide que CLK USART -- voir le strech signal
    -- Aussi il devrais être pulser ^plutot qu'ecrit à 1 plutot que 0
    CLEAR_INTR <= clear_intr_o;                                -- U3C : double_sync_vector port map(D => clear_intr_o ,Q =>  CLEAR_INTR, CLK => CLK_USART);
    
    --Strech signal
    U4A : gh_stretch 
    generic map( stretch_count => 10)
    port map(CLK => CLK_MB , rst => sreset, D => clear_intr_d(0),Q => clear_intr_o(0));
    
    U4B : gh_stretch 
    generic map( stretch_count =>10)
    port map(CLK => CLK_MB , rst => sreset, D => clear_intr_d(1),Q => clear_intr_o(1));
    
    U4C : gh_stretch 
    generic map( stretch_count => 10)
    port map(CLK => CLK_MB , rst => sreset, D => clear_intr_d(2),Q => clear_intr_o(2));


   -- I/O Connections assignments
   AXI4_LITE_MISO.AWREADY  <= axi_awready;
   AXI4_LITE_MISO.WREADY   <= axi_wready;
   AXI4_LITE_MISO.BRESP	   <= axi_bresp;
   AXI4_LITE_MISO.BVALID   <= axi_bvalid;
   AXI4_LITE_MISO.ARREADY  <= axi_arready;
   AXI4_LITE_MISO.RDATA	   <= axi_rdata;
   AXI4_LITE_MISO.RRESP	   <= axi_rresp;
   AXI4_LITE_MISO.RVALID   <= axi_rvalid;

   INTERUPT <= RX_FULL or RX_TIMEOUT or TX_DONE;
   ----------------------------------------------------------------------------
   -- AXI WR : contrôle du flow 
   ---------------------------------------------------------------------------- 
   -- (pour l'instant transaction se fait à au max 1 CLK sur 2 
   AXI_WR_FLOW: process (CLK_MB)
   begin
      if rising_edge(CLK_MB) then 
         if sresetn = '0' then
            axi_awready <= '0'; 
            axi_wready <= '0';
         else
            
            if (axi_awready = '0' and AXI4_LITE_MOSI.AWVALID = '1' and AXI4_LITE_MOSI.WVALID = '1') then
               axi_awready <= '1';
               axi_awaddr <= AXI4_LITE_MOSI.AWADDR;
            else
               axi_awready <= '0';
            end if;
            
            if (axi_wready = '0' and AXI4_LITE_MOSI.WVALID = '1' and AXI4_LITE_MOSI.AWVALID = '1') then
               axi_wready <= '1';
            else
               axi_wready <= '0';               
            end if;              
            
         end if;
      end if;
   end process;   
   
   slv_reg_wren <= axi_wready and AXI4_LITE_MOSI.WVALID and axi_awready and AXI4_LITE_MOSI.AWVALID ;
   axi_wstrb <= AXI4_LITE_MOSI.WSTRB; 
   
   ----------------------------------------------------------------------------
   -- AXI WR : reception configuration
   ----------------------------------------------------------------------------
   AXI_WR : process (CLK_MB)
   begin
      if rising_edge(CLK_MB) then 
         if sresetn = '0' then
             rx_timeout_length_o <= x"07"; -- 7 caracter by default
             tx_bytes_to_transmit_o <= (others => '0');
             clear_intr_d <= (others => '0');
         else
            if (slv_reg_wren = '1') and axi_wstrb = "1111" then
               case axi_awaddr(OPT_MEM_ADDR_BITS+ADDR_LSB downto 0) is      
                  when TIMEOUT_LENGTH_ADDR      =>  rx_timeout_length_o  <= AXI4_LITE_MOSI.WDATA(rx_timeout_length_o'length-1 downto 0);
                  when BYTES_TO_TRANSMIT_ADDR   =>  tx_bytes_to_transmit_o  <= AXI4_LITE_MOSI.WDATA(tx_bytes_to_transmit_o'length-1 downto 0);
                  when CLEAR_INTR_ADDR          =>  clear_intr_d  <= AXI4_LITE_MOSI.WDATA(clear_intr_o'length-1 downto 0);
                  when others  =>  
               end case;                                                                                          
            else
                clear_intr_d <= (others => '0');
            end if;
            
         end if;
      end if;
   end process; 

   
   ----------------------------------------------------------------------------
   -- AXI WR : WR response
   ----------------------------------------------------------------------------
   U4: process (CLK_MB)
   begin
      if rising_edge(CLK_MB) then 
         if sresetn = '0' then
            axi_bvalid  <= '0';
            axi_bresp   <= "00"; --need to work more on the responses
         else
            if (axi_awready = '1' and AXI4_LITE_MOSI.AWVALID = '1' and axi_wready = '1' and AXI4_LITE_MOSI.WVALID = '1' and axi_bvalid = '0'  ) then
               axi_bvalid <= '1';
               axi_bresp  <= "00"; 
            elsif (AXI4_LITE_MOSI.BREADY = '1' and axi_bvalid = '1') then   --check if bready is asserted while bvalid is high)
               axi_bvalid <= '0';                                 -- (there is a possibility that bready is always asserted high)
            end if;
         end if;
      end if;
   end process; 
   
   ----------------------------------------------------------------------------
   -- RD : contrôle du flow
   ---------------------------------------------------------------------------- 
   -- (pour l'instant transaction se fait à au max 1 CLK sur 2   
   U5: process (CLK_MB)
   begin
      if rising_edge(CLK_MB) then 
         if sresetn = '0' then
            axi_arready <= '0';
            axi_araddr  <= (others => '1');
            axi_rvalid <= '0';
            axi_rresp  <= "00";
         else
            if axi_arready = '0' and AXI4_LITE_MOSI.ARVALID = '1' then
               -- indicates that the slave has acceped the valid read address
               axi_arready <= '1';
               -- Read Address latching 
               axi_araddr  <= AXI4_LITE_MOSI.ARADDR;
            else
               axi_arready <= '0';
            end if;            
            if axi_arready = '1' and AXI4_LITE_MOSI.ARVALID = '1' and axi_rvalid = '0' then
               -- Valid read data is available at the read data bus
               axi_rvalid <= '1';
               axi_rresp  <= "00"; -- 'OKAY' response
            elsif axi_rvalid = '1' and AXI4_LITE_MOSI.RREADY = '1' then
               -- Read data is accepted by the master
               axi_rvalid <= '0';
            end if;
            
         end if;
      end if;
   end process; 
   slv_reg_rden <= axi_arready and AXI4_LITE_MOSI.ARVALID and (not axi_rvalid);
   
   ---------------------------------------------------------------------------- 
   -- RD : données vers µBlaze                                       
   ----------------------------------------------------------------------------
   intr_vect(0) <= tx_done_i;
   intr_vect(1) <= rx_timeout_i;
   intr_vect(2) <= rx_full_i;
   
   U6: process(CLK_MB)
   begin
      if rising_edge(CLK_MB) then         
         case axi_araddr(OPT_MEM_ADDR_BITS+ADDR_LSB downto 0) is
            when  RX_BYTES_COUNT_ADDR   => reg_data_out <= std_logic_vector(resize(rx_bytes_cnt_i     , reg_data_out'length));                  
            when  INTR_VECTOR_ADDR      => reg_data_out <= std_logic_vector(resize(intr_vect    , reg_data_out'length));   
            when others                 => reg_data_out <= (others => '0');
         end case;        
      end if;     
   end process;  

   
   
   ---------------------------------------------------------------------------- 
   -- Axi RD responses                                      
   ---------------------------------------------------------------------------- 
   U7: process (CLK_MB)
   begin
      if rising_edge(CLK_MB) then
         if sresetn = '0' then
            axi_rvalid <= '0';
            axi_rresp  <= "00";
         else
            if (axi_arready = '1' and AXI4_LITE_MOSI.ARVALID = '1' and axi_rvalid = '0') then
               -- Valid read data is available at the read data bus
               axi_rvalid <= '1';
               axi_rresp  <= "00"; -- 'OKAY' response
            elsif (axi_rvalid = '1' and AXI4_LITE_MOSI.RREADY = '1') then
               -- Read data is accepted by the master
               axi_rvalid <= '0';
            end if;
         end if;
      end if;
   end process;
   
   -- Implement memory mapped register select and read logic generation
   -- Slave register read enable is asserted when valid address is available
   -- and the slave is ready to accept the read address.
   slv_reg_rden <= axi_arready and AXI4_LITE_MOSI.ARVALID and (not axi_rvalid) ; 
   -- Read address mux
   axi_rdata <= reg_data_out;     -- register read data
   
end RTL;
