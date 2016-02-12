------------------------------------------------------------------
--!   @file : t_axi4_lite32_fifo
--!   @brief
--!   @details
--!
--!   $Rev$
--!   $Author$
--!   $Date$
--!   $Id$
--!   $URL$
------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all; 
use work.tel2000.all;


entity t_axi4_lite32_w_fifo is       -- t_axi4_lite  write Only fifo
   
   generic(                            
      FifoSize		   : integer := 16;     -- 
      ASYNC          : boolean := false);	-- Use asynchronous fifos
   
   port(
      ARESETN  : in std_logic;
      
      -- slave side (write channel only)
      RX_CLK   : in std_logic;
      RX_MOSI  : in t_axi4_lite_mosi;
      RX_MISO  : out t_axi4_lite_miso;
      
      -- master side 
      TX_CLK   : in std_logic;
      TX_MOSI  : out t_axi4_lite_mosi;
      TX_MISO  : in t_axi4_lite_miso;
      
      -- overflow
      OVFL     : out std_logic
      
      );
end t_axi4_lite32_w_fifo;


architecture rtl of t_axi4_lite32_w_fifo is
   
   
   COMPONENT t_axi4_lite32_w_afifo_d16    --  axi write only fifo
      PORT (
         m_aclk : IN STD_LOGIC;
         s_aclk : IN STD_LOGIC;
         s_aresetn : IN STD_LOGIC;
         s_axi_awaddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         s_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         s_axi_awvalid : IN STD_LOGIC;
         s_axi_awready : OUT STD_LOGIC;
         s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         s_axi_wvalid : IN STD_LOGIC;
         s_axi_wready : OUT STD_LOGIC;
         s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
         s_axi_bvalid : OUT STD_LOGIC;
         s_axi_bready : IN STD_LOGIC;
         m_axi_awaddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axi_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         m_axi_awvalid : OUT STD_LOGIC;
         m_axi_awready : IN STD_LOGIC;
         m_axi_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axi_wstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
         m_axi_wvalid : OUT STD_LOGIC;
         m_axi_wready : IN STD_LOGIC;
         m_axi_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
         m_axi_bvalid : IN STD_LOGIC;
         m_axi_bready : OUT STD_LOGIC;
         axi_aw_overflow : OUT STD_LOGIC;
         axi_w_overflow : OUT STD_LOGIC;
         axi_b_overflow : OUT STD_LOGIC
         );
   END COMPONENT;
   
   COMPONENT t_axi4_lite32_w_afifo_d64
      PORT (
         m_aclk : IN STD_LOGIC;
         s_aclk : IN STD_LOGIC;
         s_aresetn : IN STD_LOGIC;
         s_axi_awaddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         s_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         s_axi_awvalid : IN STD_LOGIC;
         s_axi_awready : OUT STD_LOGIC;
         s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         s_axi_wvalid : IN STD_LOGIC;
         s_axi_wready : OUT STD_LOGIC;
         s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
         s_axi_bvalid : OUT STD_LOGIC;
         s_axi_bready : IN STD_LOGIC;
         m_axi_awaddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axi_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         m_axi_awvalid : OUT STD_LOGIC;
         m_axi_awready : IN STD_LOGIC;
         m_axi_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axi_wstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
         m_axi_wvalid : OUT STD_LOGIC;
         m_axi_wready : IN STD_LOGIC;
         m_axi_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
         m_axi_bvalid : IN STD_LOGIC;
         m_axi_bready : OUT STD_LOGIC;
         axi_aw_overflow : OUT STD_LOGIC;
         axi_w_overflow : OUT STD_LOGIC;
         axi_b_overflow : OUT STD_LOGIC
         );
   END COMPONENT;
   
   
   
   --ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
   --ATTRIBUTE SYN_BLACK_BOX OF axi4_lite32_w_fifo_d16 : COMPONENT IS TRUE;
   --ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
   --ATTRIBUTE BLACK_BOX_PAD_PIN OF axi4_lite32_w_fifo_d16 : COMPONENT IS "m_aclk,s_aclk,s_aresetn,s_axi_awaddr[31:0],s_axi_awprot[2:0],s_axi_awvalid,s_axi_awready,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_wvalid,s_axi_wready,s_axi_bresp[1:0],s_axi_bvalid,s_axi_bready,m_axi_awaddr[31:0],m_axi_awprot[2:0],m_axi_awvalid,m_axi_awready,m_axi_wdata[31:0],m_axi_wstrb[3:0],m_axi_wvalid,m_axi_wready,m_axi_bresp[1:0],m_axi_bvalid,m_axi_bready,axi_aw_overflow,axi_w_overflow,axi_b_overflow";
   
   signal FoundGenCase     : boolean := FALSE;
   signal axi_aw_overflow  : std_logic;
   signal axi_w_overflow   : std_logic;
   signal axi_b_overflow   : std_logic;
   signal ovfl_i           : std_logic;
   
   
begin
   
   
   OVFL <= ovfl_i;
   
   
   -- Read activity not possible
   TX_MOSI.ARVALID <= '0'; 
   TX_MOSI.ARPROT  <= (others => '0');
   TX_MOSI.RREADY  <= '0';   
   RX_MISO.ARREADY <= '0';
   RX_MISO.RVALID  <= '0';
   RX_MISO.RRESP   <= AXI_SLVERR;
   
   -- asynchrnonous fifo types...
   asgen_d15 : if (FifoSize > 0 and FifoSize <= 16 and ASYNC) generate
      begin                  
      FoundGenCase <= true;  
      t_axi4_lite32_w_afifo_d16_inst : t_axi4_lite32_w_afifo_d16      
      port map (    
         s_aresetn      => ARESETN,
         s_aclk         => RX_CLK,
         s_axi_awvalid  => RX_MOSI.AWVALID,         
         s_axi_awaddr   => RX_MOSI.AWADDR,
         s_axi_awprot   => RX_MOSI.AWPROT,
         s_axi_wvalid   => RX_MOSI.WVALID,
         s_axi_wdata    => RX_MOSI.WDATA,
         s_axi_wstrb    => RX_MOSI.WSTRB,
         s_axi_bready   => RX_MOSI.BREADY,         
         s_axi_awready  => RX_MISO.AWREADY,
         s_axi_wready   => RX_MISO.WREADY,
         s_axi_bvalid   => RX_MISO.BVALID,
         s_axi_bresp    => RX_MISO.BRESP, 
         m_aclk         => TX_CLK,
         m_axi_awvalid  => TX_MOSI.AWVALID,         
         m_axi_awaddr   => TX_MOSI.AWADDR,
         m_axi_awprot   => TX_MOSI.AWPROT,
         m_axi_wvalid   => TX_MOSI.WVALID,
         m_axi_wdata    => TX_MOSI.WDATA,
         m_axi_wstrb    => TX_MOSI.WSTRB,
         m_axi_bready   => TX_MOSI.BREADY,         
         m_axi_awready  => TX_MISO.AWREADY,
         m_axi_wready   => TX_MISO.WREADY,
         m_axi_bvalid   => TX_MISO.BVALID,
         m_axi_bresp    => TX_MISO.BRESP,          
         axi_aw_overflow => axi_aw_overflow,
         axi_w_overflow => axi_w_overflow,
         axi_b_overflow => axi_b_overflow
         );      
   end generate asgen_d15;
   
   
   asgen_d64 : if (FifoSize > 32 and FifoSize <= 64 and ASYNC) generate
      begin                  
      FoundGenCase <= true;     
      t_axi4_lite32_w_afifo_d64_inst : t_axi4_lite32_w_afifo_d64      
      port map (    
         s_aresetn      => ARESETN,         
         s_aclk         => RX_CLK,
         s_axi_awvalid  => RX_MOSI.AWVALID,         
         s_axi_awaddr   => RX_MOSI.AWADDR,
         s_axi_awprot   => RX_MOSI.AWPROT,
         s_axi_wvalid   => RX_MOSI.WVALID,
         s_axi_wdata    => RX_MOSI.WDATA,
         s_axi_wstrb    => RX_MOSI.WSTRB,
         s_axi_bready   => RX_MOSI.BREADY,         
         s_axi_awready  => RX_MISO.AWREADY,
         s_axi_wready   => RX_MISO.WREADY,
         s_axi_bvalid   => RX_MISO.BVALID,
         s_axi_bresp    => RX_MISO.BRESP,         
         m_aclk         => TX_CLK,
         m_axi_awvalid  => TX_MOSI.AWVALID,         
         m_axi_awaddr   => TX_MOSI.AWADDR,
         m_axi_awprot   => TX_MOSI.AWPROT,
         m_axi_wvalid   => TX_MOSI.WVALID,
         m_axi_wdata    => TX_MOSI.WDATA,
         m_axi_wstrb    => TX_MOSI.WSTRB,
         m_axi_bready   => TX_MOSI.BREADY,         
         m_axi_awready  => TX_MISO.AWREADY,
         m_axi_wready   => TX_MISO.WREADY,
         m_axi_bvalid   => TX_MISO.BVALID,
         m_axi_bresp    => TX_MISO.BRESP,
         axi_aw_overflow => axi_aw_overflow,
         axi_w_overflow => axi_w_overflow,
         axi_b_overflow => axi_b_overflow
         );      
   end generate asgen_d64;
   
   ovfl_proc : process(RX_CLK, ARESETN)
   begin	
      if ARESETN = '0' then 
         ovfl_i <= '0';
      elsif rising_edge(RX_CLK) then
         ovfl_i <= axi_aw_overflow or axi_w_overflow or axi_b_overflow; 
         -- pragma translate_off
         assert (FoundGenCase or FifoSize = 0) report "Invalid LocalLink fifo generic settings!" severity FAILURE;
         if FoundGenCase then
            assert (ovfl_i = '0') report "AxiLite fifo overflow!!!" severity ERROR;
         end if;
         -- pragma translate_on	
      end if;
   end process; 
   
end rtl;
