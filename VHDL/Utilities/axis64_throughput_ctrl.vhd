---------------------------------------------------------------------------------------------------
--  Copyright (c) Telops Inc. 2014
--
--  File: axis64_throughput_ctrl.vhd
--  Use:  
--  By: Edem Nofodjie
--
--  $Revision$
--  $Author$
--  $lastChangedDate: 2017-09-08 15:29:45 -0400 (ven., 08 sept. 2017) $
--
---------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.tel2000.all;

entity axis64_throughput_ctrl is
   
   generic(                            
      G_FIFO_SIZE                   : natural := 16384;
      G_FIFO_LIMITED_VERSION        : boolean := false;
      G_AFULL_DCNT_THRESHOLD		   : natural := 100;
      G_IMG_HDER_IS_AVAILABLE       : boolean := true
      );	-- seuil à partir duquel on suppose que le downstream est busy
   
   port(
      -- Clk and reset
      CLK      : in std_logic;
      ARESET   : in std_logic;
      
      -- Data interfaces
      RX_MOSI  : in  t_axi4_stream_mosi64;
      RX_MISO  : out t_axi4_stream_miso;
      
      TX_MOSI  : out t_axi4_stream_mosi64;
      TX_MISO  : in  t_axi4_stream_miso;
      
      AFULL    : out std_logic;
      OVFL     : out std_logic
      
      );
end axis64_throughput_ctrl;

architecture rtl of axis64_throughput_ctrl is
   
   type mosi_pipe_type is array (0 to 1) of t_axi4_stream_mosi64; 
   
   component sync_reset is
      port(
         ARESET : in std_logic;
         SRESET : out std_logic;
         CLK    : in std_logic
         );
   end component;
   
   component t_axi4_stream64_sfifo_d8192_lim
      port (
         s_aclk            : in std_logic;
         s_aresetn         : in std_logic;
         s_axis_tvalid     : in std_logic;
         s_axis_tready     : out std_logic;
         s_axis_tdata      : in std_logic_vector(63 downto  0);
         s_axis_tlast      : in std_logic;
         m_axis_tvalid     : out std_logic;
         m_axis_tready     : in std_logic;
         m_axis_tdata      : out std_logic_vector(63 downto  0);
         m_axis_tlast      : out std_logic;
         axis_data_count   : out std_logic_vector(13 downto  0)
         );
   end component;
   
   component t_axi4_stream64_sfifo_d16384_lim
      port (
         s_aclk            : in std_logic;
         s_aresetn         : in std_logic;
         s_axis_tvalid     : in std_logic;
         s_axis_tready     : out std_logic;
         s_axis_tdata      : in std_logic_vector(63 downto  0);
         s_axis_tlast      : in std_logic;
         m_axis_tvalid     : out std_logic;
         m_axis_tready     : in std_logic;
         m_axis_tdata      : out std_logic_vector(63 downto  0);
         m_axis_tlast      : out std_logic;
         axis_data_count   : out std_logic_vector(14 downto  0)
         );
   end component;
   
   component t_axi4_stream64_sfifo_d16384
      port (
         s_aclk            : in std_logic;
         s_aresetn         : in std_logic;
         s_axis_tvalid     : in std_logic;
         s_axis_tready     : out std_logic;
         s_axis_tdata      : in std_logic_vector(63 downto  0);
         s_axis_tstrb      : in std_logic_vector(7 downto  0);
         s_axis_tkeep      : in std_logic_vector(7 downto  0);
         s_axis_tlast      : in std_logic;
         s_axis_tid        : in std_logic_vector(0 downto  0);
         s_axis_tdest      : in std_logic_vector(2 downto  0);
         s_axis_tuser      : in std_logic_vector(15 downto  0);
         m_axis_tvalid     : out std_logic;
         m_axis_tready     : in std_logic;
         m_axis_tdata      : out std_logic_vector(63 downto  0);
         m_axis_tstrb      : out std_logic_vector(7 downto  0);
         m_axis_tkeep      : out std_logic_vector(7 downto  0);
         m_axis_tlast      : out std_logic;
         m_axis_tid        : out std_logic_vector(0 downto  0);
         m_axis_tdest      : out std_logic_vector(2 downto  0);
         m_axis_tuser      : out std_logic_vector(15 downto  0);
         axis_data_count   : out std_logic_vector(14 downto  0) 
         );
   end component;
   
   type ctrl_fsm_type is (wait_hder_sof_st, wait_hder_eof_st, wait_img_sof_st, wait_img_eof_st);
   
   signal ctrl_fsm             : ctrl_fsm_type;
   signal rx_mosi_pipe         : mosi_pipe_type;
   signal sreset, areset_n     : std_logic;
   signal flow_enabled         : std_logic;
   signal downstream_afull     : std_logic;
   signal fifo_dcnt            : std_logic_vector(14 downto  0) := (others => '0');
   signal fifo_dcnt_i          : unsigned(fifo_dcnt'length-1 downto  0);
   signal frame_in_progress    : std_logic;
   signal fifo_tx_mosi_i       : t_axi4_stream_mosi64;
   signal fifo_rx_mosi_i       : t_axi4_stream_mosi64;
   signal fifo_rx_miso_i       : t_axi4_stream_miso;
   signal hder_sof             : std_logic;
   signal hder_eof             : std_logic;
   signal img_sof              : std_logic;
   signal img_eof              : std_logic;
   signal FoundGenCase         : boolean := FALSE;
   signal ovfl_i               : std_logic;
   
   attribute KEEP of ovfl_i    : signal is "TRUE";
   
   
begin 
   
   ----------------------------------------------------
   -- outputs
   ----------------------------------------------------
   TX_MOSI <= fifo_tx_mosi_i; 
   RX_MISO.TREADY <= '1';         -- on ne bloque pas le upstream
   AFULL <= downstream_afull;     -- un afull à '1' donne une idée du remplissage du fifo
   OVFL <= ovfl_i;
   
   
   ----------------------------------------------------
   -- sreset
   ----------------------------------------------------
   areset_n <= not ARESET;
   U1: sync_reset
   Port map(		
      ARESET => ARESET, SRESET => sreset, CLK => CLK);
   
   
   ----------------------------------------------------
   --  contrôle du throughput
   ----------------------------------------------------  
   U2 : process(CLK)     
   begin
      if rising_edge(CLK) then 
         if sreset = '1' then            
            flow_enabled <= '1';
            downstream_afull <= '0';
            frame_in_progress <= '0';
            fifo_rx_mosi_i.tvalid <= '0';
            hder_sof <= '0';
            hder_eof <= '0';
            img_sof <= '0';
            img_eof <= '0';
            if G_IMG_HDER_IS_AVAILABLE then
               ctrl_fsm <= wait_hder_sof_st; 
            else
               ctrl_fsm <= wait_img_sof_st; 
            end if;
            
         else                       
            
            fifo_dcnt_i <= unsigned(fifo_dcnt);
            if fifo_dcnt_i > G_AFULL_DCNT_THRESHOLD then
               downstream_afull <= '1';
            else
               downstream_afull <= '0';
            end if;              
            
            ---------------------------------------------------------
            -- pipe 0 : premisses pour frame_in_progress             
            ---------------------------------------------------------            
            case ctrl_fsm is 
               
               when wait_hder_sof_st => 
                  img_eof <= '0';
                  if RX_MOSI.TVALID = '1' then 
                     hder_sof <= '1';
                     ctrl_fsm <= wait_hder_eof_st;
                  end if;
               
               when wait_hder_eof_st => 
                  hder_sof <= '0';
                  if RX_MOSI.TVALID = '1' and RX_MOSI.TLAST = '1' then 
                     hder_eof <= '1';
                     ctrl_fsm <= wait_img_sof_st;
                  end if;
               
               when wait_img_sof_st => 
                  hder_eof <= '0';
                  img_eof <= '0';
                  if RX_MOSI.TVALID = '1' then 
                     img_sof <= '1';
                     ctrl_fsm <= wait_img_eof_st;
                  end if; 
               
               when wait_img_eof_st => 
                  img_sof <= '0';
                  if RX_MOSI.TVALID = '1' and RX_MOSI.TLAST = '1' then 
                     img_eof <= '1';
                     if G_IMG_HDER_IS_AVAILABLE then 
                        ctrl_fsm <= wait_hder_sof_st;
                     else
                        ctrl_fsm <= wait_img_sof_st;
                     end if;
                  end if; 
               
               when others =>                  
               
            end case;            
            rx_mosi_pipe(0) <= RX_MOSI;            
            
            ---------------------------------------------------------
            -- pipe 1 : frame_in_progress
            ---------------------------------------------------------
            if hder_sof = '1' or img_sof = '1' then  
               frame_in_progress <= '1';
            end if;
            if img_eof = '1' then 
               frame_in_progress <= '0';
            end if;            
            rx_mosi_pipe(1) <= rx_mosi_pipe(0);            
            
            ---------------------------------------------------------
            -- pipe 2 : flow_enabled                                 
            ---------------------------------------------------------
            if frame_in_progress = '0' then
               flow_enabled <= not downstream_afull;
            end if;
            fifo_rx_mosi_i <= rx_mosi_pipe(1);
            fifo_rx_mosi_i.tvalid <= flow_enabled and rx_mosi_pipe(1).tvalid;                
            
         end if;
      end if;
      
   end process;
   
   
   -- Synchronous fifo types...
   sgen_d8192 : if (G_FIFO_SIZE > 4096 and G_FIFO_SIZE <= 8192 and G_FIFO_LIMITED_VERSION) generate
      begin                  
      FoundGenCase <= true;  
      t_axi4_stream64_sfifo_d8192_lim_inst : t_axi4_stream64_sfifo_d8192_lim  
      port map (
         s_aresetn         => areset_n,
         s_aclk            => CLK,
         s_axis_tvalid     => fifo_rx_mosi_i.tvalid,
         s_axis_tready     => fifo_rx_miso_i.tready,
         s_axis_tdata      => fifo_rx_mosi_i.tdata,
         s_axis_tlast      => fifo_rx_mosi_i.tlast,         
         m_axis_tvalid     => fifo_tx_mosi_i.tvalid,
         m_axis_tready     => TX_MISO.TREADY,
         m_axis_tdata      => fifo_tx_mosi_i.tdata,
         m_axis_tlast      => fifo_tx_mosi_i.tlast,
         axis_data_count   => fifo_dcnt(13 downto 0)
         );
      fifo_tx_mosi_i.tstrb <= RX_MOSI.TSTRB;
      fifo_tx_mosi_i.tkeep <= RX_MOSI.TKEEP;
      fifo_tx_mosi_i.tid   <= RX_MOSI.TID;
      fifo_tx_mosi_i.tdest <= RX_MOSI.TDEST;
      fifo_tx_mosi_i.tuser <= RX_MOSI.TUSER;
      
   end generate; 
   
   sgen_d16384_lim : if (G_FIFO_SIZE > 8192 and G_FIFO_SIZE <= 16384 and G_FIFO_LIMITED_VERSION) generate
      begin                  
      FoundGenCase <= true;  
      t_axi4_stream64_sfifo_d16384_lim_inst : t_axi4_stream64_sfifo_d16384_lim
      port map (
         s_aresetn         => areset_n,
         s_aclk            => CLK,
         s_axis_tvalid     => fifo_rx_mosi_i.tvalid,
         s_axis_tready     => fifo_rx_miso_i.tready,
         s_axis_tdata      => fifo_rx_mosi_i.tdata,
         s_axis_tlast      => fifo_rx_mosi_i.tlast,         
         m_axis_tvalid     => fifo_tx_mosi_i.tvalid,
         m_axis_tready     => TX_MISO.TREADY,
         m_axis_tdata      => fifo_tx_mosi_i.tdata,
         m_axis_tlast      => fifo_tx_mosi_i.tlast,
         axis_data_count   => fifo_dcnt(14 downto 0)
         );
      fifo_tx_mosi_i.tstrb <= RX_MOSI.TSTRB;
      fifo_tx_mosi_i.tkeep <= RX_MOSI.TKEEP;
      fifo_tx_mosi_i.tid   <= RX_MOSI.TID;
      fifo_tx_mosi_i.tdest <= RX_MOSI.TDEST;
      fifo_tx_mosi_i.tuser <= RX_MOSI.TUSER;
      
   end generate;   
   
   sgen_d16384 : if (G_FIFO_SIZE > 8192 and G_FIFO_SIZE <= 16384 and not G_FIFO_LIMITED_VERSION) generate
      begin                  
      FoundGenCase <= true;  
      t_axi4_stream64_sfifo_d16384_inst : t_axi4_stream64_sfifo_d16384
      port map (
         s_aresetn         => areset_n,
         s_aclk            => CLK,
         s_axis_tvalid     => fifo_rx_mosi_i.tvalid,
         s_axis_tready     => fifo_rx_miso_i.tready,
         s_axis_tdata      => fifo_rx_mosi_i.tdata,
         s_axis_tstrb      => fifo_rx_mosi_i.tstrb,
         s_axis_tkeep      => fifo_rx_mosi_i.tkeep,
         s_axis_tlast      => fifo_rx_mosi_i.tlast,
         s_axis_tid        => fifo_rx_mosi_i.tid,
         s_axis_tdest      => fifo_rx_mosi_i.tdest,
         s_axis_tuser      => fifo_rx_mosi_i.tuser,
         
         m_axis_tvalid     => fifo_tx_mosi_i.tvalid,
         m_axis_tready     => TX_MISO.TREADY,
         m_axis_tdata      => fifo_tx_mosi_i.tdata,
         m_axis_tstrb      => fifo_tx_mosi_i.tstrb,
         m_axis_tkeep      => fifo_tx_mosi_i.tkeep,
         m_axis_tlast      => fifo_tx_mosi_i.tlast,
         m_axis_tid        => fifo_tx_mosi_i.tid,
         m_axis_tdest      => fifo_tx_mosi_i.tdest,
         m_axis_tuser      => fifo_tx_mosi_i.tuser,
         axis_data_count   => fifo_dcnt
         );
   end generate;
   
   
   ovfl_proc : process(CLK, areset_n)
   begin	
      if areset_n = '0' then 
         ovfl_i <= '0';
      elsif rising_edge(CLK) then
         if (fifo_rx_miso_i.tready = '0' and fifo_rx_mosi_i.tvalid = '1') then
            ovfl_i <= '1';
         end if;
         
         -- pragma translate_off
         assert (FoundGenCase or G_FIFO_SIZE = 0) report "Invalid LocalLink fifo generic settings!" severity FAILURE;
         if FoundGenCase then
            assert (ovfl_i = '0') report "AxiStream fifo overflow!!!" severity ERROR;
         end if;
         -- pragma translate_on	
      end if;
   end process; 
   
end rtl;
