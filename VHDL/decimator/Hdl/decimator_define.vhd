-------------------------------------------------------------------------------
--
-- Title       : decimator_define
-- Design      :  decimator_buffer
-- Author      : Philippe Couture   
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-- File        : D:\Telops\FIR-00251-Proc\src\FrameBuffer\HDL\fb_define.vhd
-- Generated   : Mon Aug 10 13:21:40 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all; 
use work.tel2000.all; 

package  decimator_define is    	  

   type  decimator_cfg_type is
   record 
      input_width            : std_logic_vector(10 downto 0);
      enable                 : std_logic_vector(1 downto 0);
      valid                  : std_logic;
   end record  decimator_cfg_type;
 

 
   signal s_decimator_cfg : decimator_cfg_type;  
   
   constant decimator_cfg_default : decimator_cfg_type := ( 
   std_logic_vector(to_unsigned(640,s_decimator_cfg.input_width'length)),
   "00",
   '0'
   );
  
 
end decimator_define;

package body decimator_define is
   
end package body decimator_define; 