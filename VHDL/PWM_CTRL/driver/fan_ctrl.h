/**
 *  @file fan_ctrl.h
 *  FAN Controller header file.
 *
 *  This is the header file for the fans.
 *  It contains the driver structure.
 *
 *  $Rev$
 *  $Author$
 *  $LastChangedDate$
 *  $Id$
 *  $URL: http://einstein/svn/firmware/FIR-00251-Common/trunk/VHDL/MGT/Driver/mgt_ctrl.h $
 */

#ifndef FAN_CTRL_H
#define FAN_CTRL_H


/****************** Include Files ********************/
#include <stdint.h>

#define FAN_PERCENT_MIN_VALUE    0.0F
#define FAN_PERCENT_MAX_VALUE    100.0F

#define PWM1_VALUE_OFFSET 0
#define PWM2_VALUE_OFFSET 4
#define PWM3_VALUE_OFFSET 8
#define PWM4_VALUE_OFFSET 12

#define PWM_BIT_SIZE	12
#define PWM_SIZE		4095 // 2^PWM_BIT_SIZE-1

/*
 * FAN driver object
 */
typedef struct
{
   uint32_t SIZE;                // Number of config elements, excluding SIZE and ADD.
   uint32_t ADD;
   
   uint32_t  PWM1_VALUE; // FAN FPGA Proc
   uint32_t  PWM2_VALUE; // FAN Internal
   uint32_t  PWM3_VALUE; // FAN External
   uint32_t  PWM4_VALUE;
} t_fan;

/***************** Macros (Inline Functions) Definitions ********************/
#define FAN_Ctor(add) {sizeof(t_fan)/4 - 2, add, 0, 0, 0, 0}

// Function Prototype
void FAN_Init(t_fan *inst);

void FAN_SET_PWM1(t_fan * inst, float Percentage);
void FAN_SET_PWM2(t_fan * inst, float Percentage);
void FAN_SET_PWM3(t_fan * inst, float Percentage);
void FAN_SET_PWM4(t_fan * inst, float Percentage);

#endif // FAN_CTRL_H

