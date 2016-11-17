--******************************************************************************
-- Destination: 
--
--	File: min_max_define.vhd
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

package min_max_define is    
   
   type array8_slv32 is array (natural range 0 to 7) of std_logic_vector(31 downto 0);
   
end min_max_define;


package body min_max_define is
   
end package body min_max_define; 
