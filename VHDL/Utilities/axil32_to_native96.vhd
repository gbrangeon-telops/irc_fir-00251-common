---------------------------------------------------------------------------------------------------
--  Copyright (c) Telops Inc. 2015
--
--  File: axil32_to_native96.vhd
--  Use: convert a axil32 cmd to read a native 96 data widt bram
--        the last to addr bit are ignored by the bram and serve to address 32 word in the data bus
--  By: Jean-Alexis Boulet
--
--  $Revision$
--  $Author$
--  $LastChangedDate$
--
---------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;           
use IEEE.numeric_std.ALL;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
use work.Tel2000.all;

entity axil32_to_native96 is
    generic(
      ADDR_WIDTH : integer := 32
    );
    port(
      ARESET       : in std_logic;
      CLK          : in std_logic;      
      
      AXIL_MOSI    : in t_axi4_lite_mosi;
      AXIL_MISO    : out t_axi4_lite_miso;
      
      WR_ADD       : out std_logic_vector(ADDR_WIDTH-1 downto 0);
      WR_DATA      : out std_logic_vector(95 downto 0);
      
      WR_EN        : out std_logic;
      
      
      RD_ADD       : out std_logic_vector(ADDR_WIDTH-1 downto 0);      
      RD_DATA      : in std_logic_vector(95 downto 0);
      RD_EN        : out std_logic;
      RD_DVAL      : in std_logic;
      
      
      ERR          : out std_logic  
      );
    attribute KEEP_HIERARCHY : string;
    attribute KEEP_HIERARCHY of axil32_to_native96 : entity is "true";
end axil32_to_native96;


architecture rtl of axil32_to_native96 is
	
   component SYNC_RESET is
      port(
         CLK    : in std_logic;
         ARESET : in std_logic;
         SRESET : out std_logic
         );
   end component;

   signal sreset : std_logic;
   
   -- Width of S_AXI data bus
	constant C_S_AXI_DATA_WIDTH	: integer	:= 32;
	-- Width of S_AXI address bus
	constant C_S_AXI_ADDR_WIDTH	: integer	:= 32;

	-- AXI4LITE signals
	signal axi_awaddr	: std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
	signal axi_awready	: std_logic;
	signal axi_wready	: std_logic;
	signal axi_bresp	: std_logic_vector(1 downto 0);
	signal axi_bvalid	: std_logic;
	signal axi_araddr	: std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
	signal axi_arready	: std_logic;
	signal axi_rdata	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal axi_rresp	: std_logic_vector(1 downto 0);
	signal axi_rvalid	: std_logic;

	-- Example-specific design signals
	-- local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	-- ADDR_LSB is used for addressing 32/64 bit registers/memories
	-- ADDR_LSB = 2 for 32 bits (n downto 2)
	-- ADDR_LSB = 3 for 64 bits (n downto 3)
	constant ADDR_LSB  : integer := (C_S_AXI_DATA_WIDTH/32)+ 1;
	constant OPT_MEM_ADDR_BITS : integer := 3;
	------------------------------------------------
	---- Signals for user logic register space example
	--------------------------------------------------
	---- Number of Slave Registers 11
	signal slv_reg0	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal slv_reg1	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal slv_reg2	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal rd_proc : std_logic;
    
	signal slv_reg_rden	: std_logic;
	signal slv_reg_wren	: std_logic;
	signal reg_data_out	:std_logic_vector(95 downto 0);
    signal wr_strb_i     :std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
	signal byte_index	: integer;

begin
	
   sync_reset_inst : sync_reset port map(ARESET => ARESET, SRESET => sreset, CLK => CLK);
   
   -- I/O Connections assignments

	AXIL_MISO.AWREADY	<= axi_awready;
	AXIL_MISO.WREADY	<= axi_wready;
	AXIL_MISO.BRESP	<= axi_bresp;
	AXIL_MISO.BVALID	<= axi_bvalid;
	AXIL_MISO.ARREADY	<= axi_arready;
	AXIL_MISO.RDATA	<= axi_rdata;
	AXIL_MISO.RRESP	<= axi_rresp;
	AXIL_MISO.RVALID	<= axi_rvalid;
   
	-- Implement axi_awready generation
	-- axi_awready is asserted for one CLK clock cycle when both
	-- AXIL_MOSI.AWVALID and AXIL_MOSI.WVALID are asserted. axi_awready is
	-- de-asserted when reset is low.

	process (CLK)
	begin
	  if rising_edge(CLK) then 
	    if sreset = '1' then
	      axi_awready <= '0';
	    else
	      if ((axi_awready = '0' ) and AXIL_MOSI.AWVALID = '1' and AXIL_MOSI.WVALID = '1') then
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

	-- Implement axi_awaddr latching
	-- This process is used to latch the address when both 
	-- AXIL_MOSI.AWVALID and AXIL_MOSI.WVALID are valid. 

   WR_ADD <= axi_awaddr(WR_ADD'length-1 downto 0);
	process (CLK)
	begin
	  if rising_edge(CLK) then 
	    if sreset = '1' then
	      axi_awaddr <= (others => '0');
	    else
	      if (axi_awready = '0' and AXIL_MOSI.AWVALID = '1' and AXIL_MOSI.WVALID = '1') then
	        -- Write Address latching
	        axi_awaddr(C_S_AXI_ADDR_WIDTH-3 downto 0) <= AXIL_MOSI.AWADDR(C_S_AXI_ADDR_WIDTH-1 downto 2);
	      end if;
	    end if;
	  end if;                   
	end process; 

   
	-- Implement axi_wready generation
	-- axi_wready is asserted for one CLK clock cycle when both
	-- AXIL_MOSI.AWVALID and AXIL_MOSI.WVALID are asserted. axi_wready is 
	-- de-asserted when reset is low. 
	process (CLK)
	begin
	  if rising_edge(CLK) then 
	    if sreset = '1' then
	      axi_wready <= '0';
	    else
	      if ((axi_wready = '0' ) and AXIL_MOSI.WVALID = '1' and AXIL_MOSI.AWVALID = '1') then
	          -- slave is ready to accept write data when 
	          -- there is a valid write address and write data
	          -- on the write address and data bus. This design 
	          -- expects no outstanding transactions.           
	          axi_wready <= '1';
	      else
	        axi_wready <= '0';
	      end if;
	    end if;
	  end if;
	end process; 

	-- Implement memory mapped register select and write logic generation
	-- The write data is accepted and written to memory mapped registers when
	-- axi_awready, AXIL_MOSI.WVALID, axi_wready and AXIL_MOSI.WVALID are asserted. Write strobes are used to
	-- select byte enables of slave registers while writing.
	-- These registers are cleared when reset (active low) is applied.
	-- Slave register write enable is asserted when valid address and data are available
	-- and the slave is ready to accept the write address and write data.
	slv_reg_wren <= axi_wready and AXIL_MOSI.WVALID and axi_awready and AXIL_MOSI.AWVALID ;
   WR_DATA <= slv_reg2 & slv_reg1 & slv_reg0 ;
   --WR_STRB <= wr_strb_i;
   
process (CLK)
begin
    if rising_edge(CLK) then 
        if sreset = '1' then
           slv_reg0 <= (others => '0');
           slv_reg1 <= (others => '0');
           slv_reg2 <= (others => '0');
            WR_EN <= '0';
        else

            if (slv_reg_wren = '1') then
                --WR_EN <= '1';
                case axi_awaddr(1 downto 0) is
                    when "00"  =>
                        for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                            if ( AXIL_MOSI.WSTRB(byte_index) = '1' ) then
                            -- Respective byte enables are asserted as per write strobes                   
                            -- slave registor 0
                            slv_reg0(byte_index*8+7 downto byte_index*8) <= AXIL_MOSI.WDATA(byte_index*8+7 downto byte_index*8);
                            
                            end if;
                        end loop;
                        WR_EN <= '0';
                        --svl_reg_wrrdy(0) <= '1';
                    when "01"  =>
                        for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                            if ( AXIL_MOSI.WSTRB(byte_index) = '1' ) then
                            -- Respective byte enables are asserted as per write strobes                   
                            -- slave registor 0
                            slv_reg1(byte_index*8+7 downto byte_index*8) <= AXIL_MOSI.WDATA(byte_index*8+7 downto byte_index*8);
                            
                            end if;
                        end loop;
                        WR_EN <= '0';
                        --svl_reg_wrrdy(1) <= '1';
                    when "10"  =>
                        for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                            if ( AXIL_MOSI.WSTRB(byte_index) = '1' ) then
                            -- Respective byte enables are asserted as per write strobes                   
                            -- slave registor 0
                            slv_reg2(byte_index*8+7 downto byte_index*8) <= AXIL_MOSI.WDATA(byte_index*8+7 downto byte_index*8);
                            
                            end if;
                        end loop;
                        WR_EN <= '1';
                    when others =>
                        WR_EN <= '0';
                end case;
            else
                WR_EN <= '0';
            end if;
        end if;
    end if;                   
end process; 

	-- Implement write response logic generation
	-- The write response and response valid signals are asserted by the slave 
	-- when axi_wready, AXIL_MOSI.WVALID, axi_wready and AXIL_MOSI.WVALID are asserted.  
	-- This marks the acceptance of address and indicates the status of 
	-- write transaction.
process (CLK)
begin
    if rising_edge(CLK) then 
        if sreset = '1' then
            axi_bvalid  <= '0';
            axi_bresp   <= "00"; --need to work more on the responses
        else
            if (axi_awready = '1' and AXIL_MOSI.AWVALID = '1' and axi_wready = '1' and AXIL_MOSI.WVALID = '1' and axi_bvalid = '0'  ) then
                axi_bvalid <= '1';
                axi_bresp  <= "00"; 
            elsif (AXIL_MOSI.BREADY = '1' and axi_bvalid = '1') then   --check if bready is asserted while bvalid is high)
                axi_bvalid <= '0';                                 -- (there is a possibility that bready is always asserted high)
            end if;
        end if;
    end if;                   
end process; 

	-- Implement axi_arready generation
	-- axi_arready is asserted for one CLK clock cycle when
	-- AXIL_MOSI.ARVALID is asserted. axi_awready is 
	-- de-asserted when reset (active low) is asserted. 
	-- The read address is also latched when AXIL_MOSI.ARVALID is 
	-- asserted. axi_araddr is reset to zero on reset assertion.
RD_ADD <= axi_araddr(RD_ADD'length-1 downto 0);
process (CLK)
begin
    if rising_edge(CLK) then 
        if sreset = '1' then
            axi_arready <= '0';
            axi_araddr  <= (others => '1');
            rd_proc <= '0';
            RD_EN <= '0';
        else
            if ((axi_arready = '0' ) and AXIL_MOSI.ARVALID = '1' and rd_proc = '0') then
                -- indicates that the slave has acceped the valid read address
                axi_arready <= '1';
                rd_proc <= '1';
                -- Read Address latching 
                axi_araddr(C_S_AXI_ADDR_WIDTH-1 downto 0)  <= "00" & AXIL_MOSI.ARADDR(C_S_AXI_ADDR_WIDTH-1 downto 2);  
                RD_EN <= '1';
            elsif(rd_proc = '1') then
                axi_arready <= '1';
                RD_EN <= '0';
            else
                axi_arready <= '0';
                RD_EN <= '0';
            end if;
            
            if(axi_rvalid = '1') then
                rd_proc <= '0';
                axi_arready <= '0';
            end if;            
        end if;
    end if;                   
end process; 

	-- Implement axi_arvalid generation
	-- axi_rvalid is asserted for one CLK clock cycle when both 
	-- AXIL_MOSI.ARVALID and axi_arready are asserted. The slave registers 
	-- data are available on the axi_rdata bus at this instance. The 
	-- assertion of axi_rvalid marks the validity of read data on the 
	-- bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	-- is deasserted on reset (active low). axi_rresp and axi_rdata are 
	-- cleared to zero on reset (active low).  
process (CLK)
begin
    if rising_edge(CLK) then
        if sreset = '1' then
            axi_rvalid <= '0';
            axi_rresp  <= "00";
        else
            --if (axi_arready = '1' and AXIL_MOSI.ARVALID = '1' and axi_rvalid = '0' and RD_DVAL = '1') then
            if (axi_rvalid = '0' and RD_DVAL = '1') then
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

	-- Implement memory mapped register select and read logic generation
	-- Slave register read enable is asserted when valid address is available
	-- and the slave is ready to accept the read address.
slv_reg_rden <= rd_proc;


-- Output register or memory read data
process( CLK ) is
begin
    if (rising_edge (CLK)) then
        if ( sreset = '1' ) then
            axi_rdata  <= (others => '0');
        else
            if (slv_reg_rden = '1') then
                -- When there is a valid read address (AXIL_MOSI.ARVALID) with 
                -- acceptance of read address by the slave (axi_arready), 
                -- output the read dada 
                -- Read address mux
                case AXIL_MOSI.ARADDR(1 downto 0) is
                    when "00" =>
                        axi_rdata <= RD_DATA(31 downto 0);     -- register read data
                    when "01" =>
                        axi_rdata <= RD_DATA(63 downto 32);     -- register read data
                    when "10" =>
                        axi_rdata <= RD_DATA(95 downto 64);     -- register read data
                    when others =>
                        axi_rdata <= (others => '1'); 
                end case;
            end if;   
        end if;
    end if;
end process;

end rtl;
