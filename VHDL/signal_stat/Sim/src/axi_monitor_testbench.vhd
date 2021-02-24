library work;
use work.axi_monitor_define.all;
library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

-- Add your library and packages declaration here ...

entity axi_monitor_testbench is
end axi_monitor_testbench;

architecture TB_ARCHITECTURE of axi_monitor_testbench is
   -- Component declaration of the tested unit
   component axi_monitor
      port(
         CLK            : in  STD_LOGIC;
         ARESETN        : in  STD_LOGIC;
         
         VALID          : in  STD_LOGIC;  -- in CLK domain
         READY          : in  STD_LOGIC;  -- in CLK domain

         MB_CLK         : in  STD_LOGIC;
         RESULTS        : out axi_monitor_type  -- in MB_CLK domain
      );
   end component;
   
   constant CLK_100M_PERIOD         : time := 10 ns;
   constant CLK_80M_PERIOD          : time := 12.5 ns;
   
   signal CLK            : STD_LOGIC := '0';
   signal ARESETN        : STD_LOGIC;
   signal VALID          : STD_LOGIC;
   signal READY          : STD_LOGIC;
   signal MB_CLK         : STD_LOGIC := '0';
   signal RESULTS        : axi_monitor_type;
   
begin

   
   -- clk
   U1: process(CLK)
   begin
      CLK <= not CLK after CLK_80M_PERIOD/2; 
   end process;
   
   -- MB clk
   U2: process(MB_CLK)
   begin
      MB_CLK <= not MB_CLK after CLK_100M_PERIOD/2; 
   end process;
   
   U3: process
   begin
      -- init to '0'
      VALID <= '0';
      READY <= '0';
      
      ARESETN <= '0'; 
      wait for 50 ns;
      ARESETN <= '1';
      
      wait until rising_edge(CLK);
      READY <= '1';
      
      wait until rising_edge(CLK);
      VALID <= '1';
      
      wait for 100 ns;
      
      wait until rising_edge(CLK);
      VALID <= '0';
      
      wait until rising_edge(CLK);
      VALID <= '1';
      
      wait until rising_edge(CLK);
      VALID <= '0';
       
      wait for MONITOR_PERIOD_CLK * CLK_80M_PERIOD;
      
      wait until rising_edge(CLK);
      VALID <= '1';
      
      wait for 2 * MONITOR_PERIOD_CLK * CLK_80M_PERIOD;
      
      wait until rising_edge(CLK);
      VALID <= '0';
      
      wait;
   end process;
   
   -- Unit Under Test port map
   UUT : axi_monitor
   port map (
      CLK => CLK,
      ARESETN => ARESETN,
      
      VALID => VALID,
      READY => READY,

      MB_CLK => MB_CLK,
      RESULTS => RESULTS
   );
   
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_axi_monitor_testbench of axi_monitor_testbench is
   for TB_ARCHITECTURE
      for UUT : axi_monitor
         use entity work.axi_monitor(rtl);
      end for;
   end for;
end TESTBENCH_FOR_axi_monitor_testbench;

