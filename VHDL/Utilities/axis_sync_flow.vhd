-------------------------------------------------------------------------------
--
-- Title       : axis_sync_flow
-- Design      : Common_HDL
-- Author      : ENO
-- Company     : Telops
--
-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------
--
-- Description :  This module is to synchronize two input data flows. It is
--                used when a downstream module needs both flows to be valid
--                simultaneously, such as a divider or multiplier module.
--
-------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity axis_sync_flow is
   port(           
      
      RX0_TVALID    : in std_logic;
      RX0_TREADY    : out std_logic;
      
      RX1_TVALID    : in std_logic;
      RX1_TREADY    : out std_logic;
      
      SYNC_TREADY   : in std_logic;      
      SYNC_TVALID   : out std_logic               
      
      );
end axis_sync_flow;


architecture RTL of axis_sync_flow is
begin
 
   RX0_TREADY <= (not  RX0_TVALID or  RX1_TVALID) and SYNC_TREADY;

   RX1_TREADY <= (not  RX1_TVALID or  RX0_TVALID) and SYNC_TREADY;   
   
   SYNC_TVALID <= RX0_TVALID and RX1_TVALID;
   
end RTL;
