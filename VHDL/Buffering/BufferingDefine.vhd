--******************************************************************************
-- Destination: 
--
--	File: BufferingDefine.vhd
-- Hierarchy: Package file
-- Use: 
-- Project: TEL2000
-- By: JEan-Alexis Boulet
-- Date: 27 Janvier 2015  
--
--******************************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all; 

package BufferingDefine is 

   type BufferWrState is (STANDBY_WR, WR_PRE_MOI, WR_WAIT_MOI, WR_POST_MOI, WAIT_WR_HDR_CMD_ACK,WAIT_WR_IMG_CMD_ACK,ERROR_WR);
   type BufferRdState is (STANDBY_RD, RD_IMG, RD_SEQ_END, RD_WAIT_SINK_RDY, WAIT_RD_HDR_ACK,WAIT_RD_IMG_ACK, WAIT_RD_HDR_STS_ACK,WAIT_RD_IMG_STS_ACK, ERROR_RD);
   type BufferMode is (BUF_OFF, BUF_WR_SEQ, BUF_RD_IMG);
   type MOI_MODE    is (EXT_SRC, SOFT_SRC, NO_SRC);
   type EDGE_TYPE   is (RISING, FALLING, ANY);

   type t_MOI_MODE is record
      MOIMODE : MOI_MODE;
   end record;

   type t_EDGE_TYPE is record
      EDGETYPE : EDGE_TYPE;
   end record;
   
end BufferingDefine;