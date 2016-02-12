/**
 *  @file mgt_ctrl.c
 *  Source file for MGT Cores.
 *  
 *  Theses functions permit to control and read status from the MGT Cores.
 *  
 *  $Rev$
 *  $Author$
 *  $LastChangedDate$
 *  $Id$
 *  $URL: http://einstein/svn/firmware/FIR-00251-Common/trunk/VHDL/MGT/Driver/mgt_ctrl.c $
 */


/***************************** Include Files *******************************/
#include "fan_ctrl.h"
#ifdef SIM
   #include "proc_ctrl.h" // Contains the class SC_MODULE for SystemC simulation
   #include "mb_transactor.h" // Contains virtual functions that emulates microblaze functions
   #include "mb_axi4l_bridge_SC.h" // Used to bridge Microblaze AXI4-Lite transaction in SystemC transaction
#else
   #include "mb_axi4l_bridge.h" // Used to bridge Microblaze AXI4-Lite transaction
   //#include "xtime_l.h"
   //#include "xcache_l.h"
#endif

/************************** Function Definitions ***************************/

/**
 *  MGT_Init.
 *  Initialize the MGT cores at Startup.
 *  
 *  @param inst Pointer to the instance
 *  
 *  @return void
 */
void FAN_Init(t_fan *inst){
   // Enable all MGT
   AXI4L_write32(0, inst->ADD + PWM1_VALUE_OFFSET);
   AXI4L_write32(0, inst->ADD + PWM2_VALUE_OFFSET);
   AXI4L_write32(0, inst->ADD + PWM3_VALUE_OFFSET);
   AXI4L_write32(0, inst->ADD + PWM4_VALUE_OFFSET);
}

void FAN_SET_PWM1(t_fan * inst, float Percentage)
{
	uint32_t value = 0;

   if (Percentage < FAN_PERCENT_MIN_VALUE) Percentage = FAN_PERCENT_MIN_VALUE;
   if (Percentage > FAN_PERCENT_MAX_VALUE) Percentage = FAN_PERCENT_MAX_VALUE;

	value = (uint32_t) (Percentage / 100 *((float) PWM_SIZE) );
	AXI4L_write32(value, inst->ADD + PWM1_VALUE_OFFSET);
}

void FAN_SET_PWM2(t_fan * inst, float Percentage)
{
	uint32_t value = 0;

   if (Percentage < FAN_PERCENT_MIN_VALUE) Percentage = FAN_PERCENT_MIN_VALUE;
   if (Percentage > FAN_PERCENT_MAX_VALUE) Percentage = FAN_PERCENT_MAX_VALUE;

	value = (uint32_t) (Percentage / 100 *((float) PWM_SIZE) );
	AXI4L_write32(value, inst->ADD + PWM2_VALUE_OFFSET);
}

void FAN_SET_PWM3(t_fan * inst, float Percentage)
{
	uint32_t value = 0;

   if (Percentage < FAN_PERCENT_MIN_VALUE) Percentage = FAN_PERCENT_MIN_VALUE;
   if (Percentage > FAN_PERCENT_MAX_VALUE) Percentage = FAN_PERCENT_MAX_VALUE;

	value = (uint32_t) (Percentage / 100 *((float) PWM_SIZE) );
	AXI4L_write32(value, inst->ADD + PWM3_VALUE_OFFSET);
}

void FAN_SET_PWM4(t_fan * inst, float Percentage)
{
	uint32_t value = 0;

   if (Percentage < FAN_PERCENT_MIN_VALUE) Percentage = FAN_PERCENT_MIN_VALUE;
   if (Percentage > FAN_PERCENT_MAX_VALUE) Percentage = FAN_PERCENT_MAX_VALUE;

	value = (uint32_t) (Percentage / 100 *((float) PWM_SIZE) );
	AXI4L_write32(value, inst->ADD + PWM4_VALUE_OFFSET);
}

