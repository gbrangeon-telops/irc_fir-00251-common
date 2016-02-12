/* $Id: axil32_lut.cpp  $ */
/****************************************************************************/
/**
*
* @file axil32_lut.cpp
* 
* For a description, see the axil32_lut.h file.
* 
* Author(s) :Edem Nofodjie
*
*****************************************************************************/

#include "axil32_lut.h"

#ifdef SIM
   #include "proc_ctrl.h" // Contains the class SC_MODULE for SystemC simulation
   #include "mb_transactor.h" // Contains virtual functions that emulates microblaze functions
   #include "mb_axi4l_bridge_SC.h" // Used to bridge Microblaze AXI4-Lite transaction in SystemC transaction
#else                  
   //#include "dosfs.h"
   //#include "xtime_l.h"
   //#include "xcache_l.h"
   #include "mb_axi4l_bridge.h"
#endif

void LUT_BuildConfig(t_lut *pObj, const float x_min, const float x_range, const float lut_size)
{
   pObj->x_min          = x_min;
   pObj->x_range        = x_range;
   pObj->lut_size       = lut_size;
   pObj->lut_start_add  = 0;        //start_add and end_add are min and max addresses inside a page
   pObj->lut_end_add    = pObj->lut_start_add + (uint32_t)lut_size - 1;
   pObj->lut_factor     = lut_size/x_range;
   pObj->lut_factor_inv = x_range/lut_size;
}
