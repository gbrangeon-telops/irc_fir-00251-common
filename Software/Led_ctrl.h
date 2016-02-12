/**
 * @file Led_ctrl.h
 * Camera LEDs controller module header.
 *
 * This file defines the camera LEDs controller module interface.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef LED_CTRL_H
#define LED_CTRL_H

#include <stdint.h>
#include <stdbool.h>
#include "xgpio.h"
#include "IRC_Status.h"
#include "GC_Registers.h"


/*
 * Debug LED   bit0
 * Yellow LED  bit1 (Proc only)
 * Green LED   bit2 (Proc only)
 * Red LED     bit3 (Proc only)
 */

#define LED_DEBUG_MASK           0x00000001
#define LED_CAMERA_YELLOW_MASK   0x00000002
#define LED_CAMERA_GREEN_MASK    0x00000004
#define LED_CAMERA_RED_MASK      0x00000008
#define LED_CAMERA_MASK          0x0000000E

#define LED_BLINK_2HZ            250000
#define LED_BLINK_1HZ            (2 * LED_BLINK_2HZ)
#define LED_BLINK_0_5HZ          (2 * LED_BLINK_1HZ)

#define LED_MAX_NUM_OF_STATES    2

/**
 * Camera LED state
 */
enum cameraLedStateEnum {
   CLS_OFF = 0x0,
   CLS_YELLOW = 0x2,
   CLS_GREEN = 0x4,
   CLS_RED = 0x8
};

/**
 * Camera LED state data type.
 */
typedef enum cameraLedStateEnum cameraLedState_t;

/*
 * LEDs control data structure
 */
struct ledCtrlStruct
{
   XGpio ledGPIO;
   uint32_t ledGPIOValue;
   uint8_t cameraLedStateIdx;
   cameraLedState_t cameraLedStates[LED_MAX_NUM_OF_STATES];
   uint64_t togglePeriod;
   uint64_t tic;
};

/**
* LEDs control data type
*/
typedef struct ledCtrlStruct ledCtrl_t;


IRC_Status_t Led_Init(ledCtrl_t *ledCtrl, uint16_t gpioDeviceId);
void Led_ToggleDebugLedState(ledCtrl_t *ledCtrl);
void Led_SetCameraLedState(ledCtrl_t *ledCtrl, cameraLedState_t state);
void Led_SetCameraLedBlinking(ledCtrl_t *ledCtrl, cameraLedState_t state0, cameraLedState_t state1, uint64_t togglePeriod);
void Led_UpdateCameraLedState(ledCtrl_t *ledCtrl);

#endif // LED_CTRL_H
