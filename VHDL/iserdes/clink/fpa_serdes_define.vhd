--******************************************************************************
-- Destination: 
--
--	File: fpa_serdes_define.vhd
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

package fpa_serdes_define is    
   
   type delay_array is array (natural range 0 to 3) of std_logic_vector(4 downto 0);
   type edges_array is array (natural range 0 to 3) of std_logic_vector(31 downto 0);
   type bitslip_cnt_array is array (natural range 0 to 3) of std_logic_vector(3 downto 0);
   
   type fpa_serdes_stat_type is 
   record
      edges    : edges_array;
      delay    : delay_array;
      success  : std_logic_vector(0 to 3);
      done     : std_logic_vector(0 to 3);
   end record;
   
end fpa_serdes_define;


package body fpa_serdes_define is
   
end package body fpa_serdes_define; 
