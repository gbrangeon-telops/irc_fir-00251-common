------------------------------------------------------------------
--!   @file axi_monitor.vhd
--!   @brief Monitors activity on an AXI4 or AXI4-Stream interface.
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
library work;
use work.axi_monitor_define.all;

entity axi_monitor is
   port(
      CLK            : in  STD_LOGIC;
      ARESETN        : in  STD_LOGIC;
      
      MONITORED_TRANSFERS : in integer := 1; -- must be > 0 while waiting for config
      
      VALID          : in  STD_LOGIC;  -- in CLK domain
      READY          : in  STD_LOGIC;  -- in CLK domain

      MB_CLK         : in  STD_LOGIC;
      RESULTS        : out axi_monitor_type  -- in MB_CLK domain
   );
end axi_monitor;

architecture rtl of axi_monitor is

   component sync_resetn
      port(
         ARESETN : in  STD_LOGIC;
         SRESETN : out STD_LOGIC;
         CLK     : in  STD_LOGIC);
   end component;

   signal sresetn                   : std_logic;
   signal valid_transfer            : std_logic;
   signal valid_transfer_last       : std_logic;
   signal clock_nb_min              : unsigned(RESULTS.clock_nb_min'range);
   signal clock_nb_max              : unsigned(RESULTS.clock_nb_max'range);
   signal burst_len_min             : unsigned(RESULTS.burst_len_min'range);
   signal burst_len_max             : unsigned(RESULTS.burst_len_max'range);
   
   
   attribute KEEP : string;
   
   
begin

   RESET : sync_resetn port map(ARESETN => ARESETN, CLK => CLK, SRESETN => sresetn);
   
   valid_transfer <= VALID and READY;
   
   OUTPUT : process(MB_CLK)
   begin
      if rising_edge(MB_CLK) then
         RESULTS.clock_nb_min <= std_logic_vector(clock_nb_min);
         RESULTS.clock_nb_max <= std_logic_vector(clock_nb_max);
         RESULTS.burst_len_min <= std_logic_vector(burst_len_min);
         RESULTS.burst_len_max <= std_logic_vector(burst_len_max);
      end if;
   end process;
   
   TRANSFER_CNT : process(CLK)
      variable transfer_counter, clock_counter : integer;
   begin
      if rising_edge(CLK) then
         if sresetn = '0' then
            clock_counter := 0;
            transfer_counter := 0;
            clock_nb_min <= (others => '1');
            clock_nb_max <= (others => '0');
         else
            
            -- Transfer counter
            if valid_transfer = '1' then 
               transfer_counter := transfer_counter + 1;
            end if;
            
            -- Clock counter
            if transfer_counter > 0 then
               clock_counter := clock_counter + 1;
            end if;
               
            -- End of monitored transfers
            if transfer_counter >= MONITORED_TRANSFERS then
               -- Update stats
               if to_unsigned(clock_counter, clock_nb_min'length) < clock_nb_min then
                  clock_nb_min <= to_unsigned(clock_counter, clock_nb_min'length);
               end if;
               if to_unsigned(clock_counter, clock_nb_max'length) > clock_nb_max then
                  clock_nb_max <= to_unsigned(clock_counter, clock_nb_max'length);
               end if;
               -- Reset counters
               clock_counter := 0;
               transfer_counter := 0;
            end if;
            
         end if;
      end if;
   end process;
   
   BURST_LEN : process(CLK)
      variable burst_len_counter : integer range 0 to 1024;
   begin
      if rising_edge(CLK) then
         if sresetn = '0' then
            burst_len_counter := 0;
            burst_len_min <= (others => '1');
            burst_len_max <= (others => '0');
            valid_transfer_last <= valid_transfer;
         else
            
            valid_transfer_last <= valid_transfer;
            
            -- During burst
            if valid_transfer = '1' then 
               burst_len_counter := burst_len_counter + 1;
            -- End of burst
            elsif valid_transfer_last = '1' and valid_transfer = '0' then
               -- Update stats
               if to_unsigned(burst_len_counter, burst_len_min'length) < burst_len_min then
                  burst_len_min <= to_unsigned(burst_len_counter, burst_len_min'length);
               end if;
               if to_unsigned(burst_len_counter, burst_len_max'length) > burst_len_max then
                  burst_len_max <= to_unsigned(burst_len_counter, burst_len_max'length);
               end if;
               -- Reset counter
               burst_len_counter := 0;
            end if;
            
         end if;
      end if;
   end process;

end;
