------------------------------------------------------------------
--!   @file : usart_mmcm_rst
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

entity usart_mmcm_rst is
   generic(
      USART_CLK_PERIOD_NS : real := 60.0   
      );
   
   
   port(
      
      CLK_100M       : in std_logic;
      ARESET         : in std_logic;
      
      USART_CLK_RAW  : in std_logic;      
      USART_MMCM_RST : out std_logic
      
      );
end usart_mmcm_rst;


architecture rtl of usart_mmcm_rst is
   
   constant USART_CLK_FACTOR    : natural := integer(USART_CLK_PERIOD_NS/10.0);   -- as  CLK_100M is our reference clock 
   constant USART_CLK_FACTOR_M1 : natural := USART_CLK_FACTOR - 1;
   constant ALL_ZEROS           : std_logic_vector(USART_CLK_FACTOR downto 0) := (others => '0');
   constant ALL_ONES            : std_logic_vector(USART_CLK_FACTOR downto 0) := (others => '1');
   
   type rst_fsm_type is (wait_raw_clk_st, desassert_rst_st, pause_st);
   
   
   
   component sync_reset
      port(
         ARESET : in std_logic;
         SRESET : out std_logic;
         CLK    : in std_logic);
   end component;  
   
   signal sreset              : std_logic;
   signal usart_clk_raw_pipe  : std_logic_vector(USART_CLK_FACTOR downto 0) := (others => '0');
   signal usart_mmcm_rst_i    : std_logic;
   signal usart_clk_stopped   : std_logic := '1';
   signal fsm_rst_i           : std_logic := '1';
   signal rst_fsm             : rst_fsm_type;
   signal raw_clk_re_cnt      : natural range 0 to 15;
   
   
   
begin
   
   USART_MMCM_RST <= usart_mmcm_rst_i;   
   
   --------------------------------------------------
   -- synchro reset 
   --------------------------------------------------   
   U1: sync_reset
   port map(
      ARESET => ARESET,
      CLK    => CLK_100M,
      SRESET => sreset
      );
   
   --------------------------------------------------
   -- détection de l'arrêt de l'horloge 
   --------------------------------------------------    
   U2: process(CLK_100M)
   begin
      if rising_edge(CLK_100M) then 
         
         -- pipe pour l'usart clock
         usart_clk_raw_pipe(USART_CLK_FACTOR downto 0) <=  usart_clk_raw_pipe(USART_CLK_FACTOR_M1 downto 1)& USART_CLK_RAW;
         
         -- detection de l'arrêt de l'horloge
         if usart_clk_raw_pipe = ALL_ZEROS or usart_clk_raw_pipe = ALL_ONES then
            usart_clk_stopped <= '1';
         else
            usart_clk_stopped <= '0';
         end if; 
      end if; 
      
      fsm_rst_i <= usart_clk_stopped or sreset;   
      
   end process;   
   
   --------------------------------------------------
   -- génération du reset
   --------------------------------------------------    
   U3: process(CLK_100M)
   begin
      if rising_edge(CLK_100M) then          
         if fsm_rst_i = '1' then               
            rst_fsm <= wait_raw_clk_st;
            usart_mmcm_rst_i <= '1';
            raw_clk_re_cnt <= 0;
         else            
            
            case rst_fsm is 
               
               when wait_raw_clk_st =>            
                  if usart_clk_stopped = '0' then 
                     rst_fsm <= pause_st;
                  end if;
               
               when pause_st =>         -- attendre 10 clk_raw avant de sortir le mmcm de son reset
                  if usart_clk_raw_pipe(2) = '0' and  usart_clk_raw_pipe(1) = '1' then 
                     raw_clk_re_cnt <= raw_clk_re_cnt + 1;
                  end if;
                  if raw_clk_re_cnt = 10 then 
                     rst_fsm <= desassert_rst_st;
                  end if;
               
               when desassert_rst_st =>
                  usart_mmcm_rst_i <= '0';
               
               when others =>
               
            end case;         
            
         end if; 
      end if; 
   end process; 
   
   
   
end rtl;
