--******************************************************************************
-- Destination: 
--
--	File: axi_monitor_define.vhd
-- Hierarchy: Package file
-- Use: 
--	Project: IRCDEV
--	By: Edem Nofodjie
-- Date: 22 october 2009	  
--
--******************************************************************************
--Description
--******************************************************************************
-- 1- Defines the global variables 
-- 2- Defines the project function
--******************************************************************************


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

package axi_monitor_define is    
   
   constant MONITOR_PERIOD_CLK : integer := 100;   -- Number of clk cycles during which the monitoring is made
   
   type axi_monitor_type is
   record
      transfer_nb_min      : std_logic_vector(31 downto 0);   -- Minimum transfer number in a monitor period
      transfer_nb_max      : std_logic_vector(31 downto 0);   -- Maximum transfer number in a monitor period
      burst_len_min        : std_logic_vector(31 downto 0);   -- Minimum burst length
      burst_len_max        : std_logic_vector(31 downto 0);   -- Maximum burst length
   end record;
   
end axi_monitor_define;


package body axi_monitor_define is
   
end package body axi_monitor_define; 
