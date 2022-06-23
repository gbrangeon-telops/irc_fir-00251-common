
library IEEE;
use IEEE.STD_LOGIC_1164.all;           
use IEEE.numeric_std.ALL;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
use work.Tel2000.all;

entity axil32_to_native is
   port(
      ARESET       : in std_logic;
      CLK          : in std_logic;      
      
      AXIL_MOSI    : in t_axi4_lite_mosi;
      AXIL_MISO    : out t_axi4_lite_miso;
      
      WR_ADD       : out std_logic_vector(31 downto 0);
      WR_DATA      : out std_logic_vector(31 downto 0);
      WR_STRB      : out std_logic_vector(3 downto 0);  
      WR_EN        : out std_logic;
      WR_BUSY      : in std_logic;
      
      RD_ADD       : out std_logic_vector(31 downto 0);      
      RD_DATA      : in std_logic_vector(31 downto 0);
      RD_EN        : out std_logic;
      RD_DVAL      : in std_logic;
      RD_BUSY      : in std_logic;
      
      ERR          : out std_logic  
      );
end axil32_to_native;


architecture rtl of axil32_to_native is
	
   component SYNC_RESET is
      port(
         CLK    : in std_logic;
         ARESET : in std_logic;
         SRESET : out std_logic
         );
   end component;

   signal sreset : std_logic;

	-- AXI4LITE signals
	signal axi_awready	: std_logic;
	signal axi_wready	: std_logic;
	signal axi_bresp	: std_logic_vector(1 downto 0);
	signal axi_bvalid	: std_logic;
	signal axi_arready	: std_logic;
	signal axi_rresp	: std_logic_vector(1 downto 0);
	signal axi_rvalid	: std_logic;

begin
	
   sync_reset_inst : sync_reset port map(ARESET => ARESET, SRESET => sreset, CLK => CLK);
   
   -- No errors
   ERR <= '0';
   
   -- I/O Connections assignments
	AXIL_MISO.AWREADY	<= axi_awready;
	AXIL_MISO.WREADY	<= axi_wready;
	AXIL_MISO.BRESP	<= axi_bresp;
	AXIL_MISO.BVALID	<= axi_bvalid;
	AXIL_MISO.ARREADY	<= axi_arready;
	AXIL_MISO.RRESP	<= axi_rresp;
	AXIL_MISO.RVALID	<= axi_rvalid;
	
	-- Native interface assignment
	-- No need to register these values because they don't implement logic
	WR_ADD  <= AXIL_MOSI.AWADDR;
	WR_DATA <= AXIL_MOSI.WDATA;
	WR_STRB <= AXIL_MOSI.WSTRB;
	RD_ADD  <= AXIL_MOSI.ARADDR;
	AXIL_MISO.RDATA	<= RD_DATA;
   
	-- Implement axi_awready generation
	-- axi_awready is asserted for one clock cycle when both
	-- AXIL_MOSI.AWVALID and AXIL_MOSI.WVALID are asserted. axi_awready is
	-- de-asserted when reset is asserted.
	process (CLK)
	begin
	  if rising_edge(CLK) then 
	    if sreset = '1' then
	      axi_awready <= '0';
	    else
	      if (axi_awready = '0' and WR_BUSY = '0' and AXIL_MOSI.AWVALID = '1' and AXIL_MOSI.WVALID = '1') then
	        -- slave is ready to accept write address when
	        -- there is a valid write address and write data
	        -- on the write address and data bus. This design 
	        -- expects no outstanding transactions. 
	        axi_awready <= '1';
	      else
	        axi_awready <= '0';
	      end if;
	    end if;
	  end if;
	end process;

	-- Implement axi_wready generation
	-- axi_wready is asserted for one clock cycle when both
	-- AXIL_MOSI.AWVALID and AXIL_MOSI.WVALID are asserted. axi_wready is 
	-- de-asserted when reset is asserted. 
	process (CLK)
	begin
	  if rising_edge(CLK) then 
	    if sreset = '1' then
	      axi_wready <= '0';
	      WR_EN <= '0';
	    else
	      if (axi_wready = '0' and WR_BUSY = '0' and AXIL_MOSI.WVALID = '1' and AXIL_MOSI.AWVALID = '1') then
	        -- slave is ready to accept write data when 
	        -- there is a valid write address and write data
	        -- on the write address and data bus. This design 
	        -- expects no outstanding transactions.           
	        axi_wready <= '1';
	        -- Native interface buses WR_ADD, WR_DATA and WR_STRB are already assigned, so
	        -- we can enable the write operation at the same time we confirm the AXIL transaction. 
	        WR_EN <= '1';
	      else
	        axi_wready <= '0';
	        WR_EN <= '0';
	      end if;
	    end if;
	  end if;
	end process;
 

	-- Implement write response logic generation
	-- The write response and response valid signals are asserted by the slave 
	-- when axi_wready, AXIL_MOSI.WVALID, axi_wready and AXIL_MOSI.WVALID are asserted.  
	-- This marks the acceptance of address and data and indicates the status of 
	-- write transaction.
	process (CLK)
	begin
	  if rising_edge(CLK) then 
	    if sreset = '1' then
	      axi_bvalid  <= '0';
	      axi_bresp   <= "00"; --need to work more on the responses
	    else
	      if (axi_awready = '1' and AXIL_MOSI.AWVALID = '1' and axi_wready = '1' and AXIL_MOSI.WVALID = '1' and axi_bvalid = '0') then
	        axi_bvalid <= '1';
	        axi_bresp  <= "00"; 
	      elsif (AXIL_MOSI.BREADY = '1' and axi_bvalid = '1') then   --check if bready is asserted while bvalid is high)
	        axi_bvalid <= '0';                                 -- (there is a possibility that bready is always asserted high)
	      end if;
	    end if;
	  end if;                   
	end process; 

	-- Implement axi_arready generation
	-- axi_arready is asserted for one clock cycle when
	-- AXIL_MOSI.ARVALID is asserted. axi_arready is 
	-- de-asserted when reset is asserted.
	process (CLK)
	begin
	  if rising_edge(CLK) then 
	    if sreset = '1' then
	      axi_arready <= '0';
	      RD_EN <= '0';
	    else
	      if (axi_arready = '0' and RD_BUSY = '0' and AXIL_MOSI.ARVALID = '1') then
	        -- indicates that the slave has accepted the valid read address
	        axi_arready <= '1';
	        -- Native interface bus RD_ADD is already assigned, so
           -- we can enable the read operation at the same time we confirm the AXIL transaction.
	        RD_EN <= '1';           
	      else
	        axi_arready <= '0';
	        RD_EN <= '0';
	      end if;
	    end if;
	  end if;                   
	end process; 

	-- Implement axi_rvalid generation
	-- axi_rvalid is asserted for one clock cycle when both 
	-- AXIL_MOSI.ARVALID and axi_arready are asserted. The 
	-- assertion of axi_rvalid marks the validity of read data on the 
	-- bus and axi_rresp indicates the status of read transaction. axi_rvalid 
	-- is deasserted on reset. axi_rresp is 
	-- cleared to zero on reset.
	process (CLK)
	begin
	  if rising_edge(CLK) then
	    if sreset = '1' then
	      axi_rvalid <= '0';
	      axi_rresp  <= "00";
	    else
	      --if (axi_arready = '1' and AXIL_MOSI.ARVALID = '1' and axi_rvalid = '0') then
         if (axi_rvalid = '0' and RD_DVAL = '1') then    -- RD_DVAL can only be asserted if a read address has been accepted
	        -- Valid read data is available at the read data bus
	        axi_rvalid <= '1';
	        axi_rresp  <= "00"; -- 'OKAY' response
	      elsif (axi_rvalid = '1' and AXIL_MOSI.RREADY = '1') then
	        -- Read data is accepted by the master
	        axi_rvalid <= '0';
	      end if;            
	    end if;
	  end if;
	end process;

end rtl;
