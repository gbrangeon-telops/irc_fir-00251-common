/**
 *  @file mb_axi4l_bridge.c
 *  Bridge between microblaze and AXI4-Lite.
 *  
 *  These functions are used to interface with Telops design bloc.
 *  
 *  $Rev: 13114 $
 *  $Author: enofodjie $
 *  $LastChangedDate: 2014-02-13 22:53:25 -0500 (jeu., 13 févr. 2014) $
 *  $Id: mb_axi4l_bridge_SC.cpp 13114 2014-02-14 03:53:25Z enofodjie $
 *  $URL: http://einstein/svn/firmware/FIR-00251-Proc%20(sandbox)/trunk/aldec/src/Testbench/SystemC/mb_axi4l_bridge_SC.cpp $
 */
#include "mb_axi4l_bridge.h" 	
#include "xil_io.h"

/**
 *  AXI4L_write32.
 *  Function used to write 32 bits on the AXI4-Lite bus.
 *  
 *  @param data Data to write
 *  @param add Address to write to
 *  
 *  @return none
 */
void AXI4L_write32( uint32_t data, uint32_t add)
{
   Xil_Out32(add, data);
   
}


/**
 *  AXI4L_write16.
 *  Function used to write 16 bits on the AXI4-Lite bus.
 *
 *  @param data Data to write
 *  @param add Address to write to
 *
 *  @return none
 */
void AXI4L_write16( uint16_t data, uint32_t add)
{
   Xil_Out16(add, data);
	
}


/**
 *  AXI4L_write8.
 *  Function used to write 8 bits on the AXI4-Lite bus.
 *
 *  @param data Data to write
 *  @param add Address to write to
 *
 *  @return none
 */
void AXI4L_write8( uint8_t data, uint32_t add)
{
   Xil_Out8(add, data);
	
}

/**
 *  AXI4L_read32.
 *  Function used to read from the AXI4-Lite bus.
 *  
 *  @param add Addres to read from
 *  
 *  @return Data read from device
 */
uint32_t AXI4L_read32(uint32_t add)
{
   
  return Xil_In32(add);
	
}



