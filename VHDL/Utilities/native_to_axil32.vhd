
library IEEE;
use IEEE.STD_LOGIC_1164.all;           
use IEEE.numeric_std.ALL;
use work.Tel2000.all;

entity native_to_axil32 is
   port(
      ARESET       : in std_logic;
      CLK          : in std_logic;      
      
      WR_ADD       : in std_logic_vector(31 downto 0);
      WR_DATA      : in std_logic_vector(31 downto 0);
      WR_STRB      : in std_logic_vector(3 downto 0);  
      WR_EN        : in std_logic;
      WR_BUSY      : out std_logic;
      
      RD_ADD       : in std_logic_vector(31 downto 0);      
      RD_DATA      : out std_logic_vector(31 downto 0);
      RD_EN        : in std_logic;
      RD_DVAL      : out std_logic;
      RD_BUSY      : out std_logic;       
      
      AXIL_MOSI    : out t_axi4_lite_mosi;
      AXIL_MISO    : in t_axi4_lite_miso;
      
      ERR          : out std_logic  
      );
end native_to_axil32;


architecture rtl of native_to_axil32 is
   
   component SYNC_RESET is
      port(
         CLK    : in std_logic;
         ARESET : in std_logic;
         SRESET : out std_logic
         );
   end component;
   
   type fsm_type is (idle, wait_ack_st);
   
   signal wr_fsm           : fsm_type;
   signal rd_fsm           : fsm_type;   
   signal sreset           : std_logic;
   signal rd_data_i        : std_logic_vector(RD_DATA'LENGTH-1 downto 0);
   signal rd_dval_i        : std_logic;
   signal axil_mosi_i      : t_axi4_lite_mosi;
   signal wr_busy_i        : std_logic;
   signal rd_busy_i        : std_logic;
   
begin
   
   
   
   AXIL_MOSI <= axil_mosi_i;
   
   WR_BUSY <= wr_busy_i;
   RD_BUSY <= rd_busy_i;
   
   RD_DATA <= rd_data_i;
   RD_DVAL <= rd_dval_i;
   
   U0 : sync_reset 
   port map(
      ARESET => ARESET, 
      SRESET => sreset, 
      CLK => CLK
      );
   
   U1: process(CLK)
   begin          
      if rising_edge(CLK) then         
         if sreset = '1' then
            axil_mosi_i.awvalid <= '0';
            axil_mosi_i.wvalid <= '0'; 
            axil_mosi_i.awprot <= (others => '0');
            axil_mosi_i.arvalid <= '0';
            axil_mosi_i.bready <= '1';
            axil_mosi_i.rready <= '1';
            axil_mosi_i.arprot <= (others => '0');
            rd_dval_i <= '0';
            wr_fsm <= idle;
            rd_fsm <= idle;
            rd_busy_i <= '1';
            wr_busy_i <= '1';
            
         else 
            
            -- write operation
            case wr_fsm is 
               when idle => 
                  axil_mosi_i.wdata   <= WR_DATA;
                  axil_mosi_i.awaddr  <= resize(WR_ADD, axil_mosi_i.awaddr'length);--
                  axil_mosi_i.wstrb   <= WR_STRB;
                  axil_mosi_i.awvalid <= WR_EN;
                  axil_mosi_i.wvalid  <= WR_EN;
                  wr_busy_i <= '0';
                  if WR_EN = '1' then 
                     wr_fsm <= wait_ack_st;
                     wr_busy_i <= '1';
                  end if;
               
               when wait_ack_st =>            
                  if AXIL_MISO.WREADY = '1' and AXIL_MISO.AWREADY = '1' then       
                     axil_mosi_i.awvalid <= '0';
                     axil_mosi_i.wvalid  <= '0';
                     wr_fsm <= idle; 
                  end if; 
               
               when others =>                
            end case; 
            
            -- read operation
            case rd_fsm is 
               when idle =>
                  axil_mosi_i.araddr  <= resize(RD_ADD, axil_mosi_i.awaddr'length);-- 
                  axil_mosi_i.arvalid <= RD_EN;
                  rd_busy_i <= '0';
                  if RD_EN = '1' then 
                     rd_fsm <= wait_ack_st;
                     rd_busy_i <= '1';
                  end if;
               
               when wait_ack_st =>            
                  if AXIL_MISO.ARREADY = '1' then      
                     axil_mosi_i.arvalid <= '0';
                     rd_fsm <= idle; 
                  end if; 
               
               when others =>               
            end case;
            
            -- données lues
            rd_data_i <= AXIL_MISO.RDATA;
            rd_dval_i <= AXIL_MISO.RVALID;        
            
         end if;                                 
      end if;
   end process;                                                                     
   
end rtl;
