/**
 *  @file mb_axi4l_bridge.h
 *  Functions used to bridge microblaze AXI4-Lite transaction .
 *  
 *  These functions are used to interface with Telops design bloc.
 *  
 *  $Rev: 12770 $
 *  $Author: pdaraiche $
 *  $LastChangedDate: 2013-12-20 12:01:34 -0500 (Fri, 20 Dec 2013) $
 *  $Id: mb_axi4l_bridge_SC.h 12770 2013-12-20 17:01:34Z pdaraiche $
 *  $URL: http://einstein/svn/firmware/FIR-00251-Proc%20(sandbox)/trunk/aldec/src/Testbench/SystemC/mb_axi4l_bridge_SC.h $
 */
#ifndef __MB_AXI4L_BRIDGE_H__
#define __MB_AXI4L_BRIDGE_H__

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>

void AXI4L_write32( uint32_t data, uint32_t add);
void AXI4L_write16( uint16_t data, uint32_t add);
void AXI4L_write8( uint8_t data, uint32_t add);
uint32_t AXI4L_read32(uint32_t add);

#ifdef __cplusplus
}
#endif

#endif //__MB_AXI4L_BRIDGE_H__





