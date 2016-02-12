/**
 * @file Led_ctrl.c
 * Camera LEDs controller module implementation.
 *
 * This file implements the camera LEDs controller module.
 * 
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "Led_ctrl.h"
#include "utils.h"

/**
 * Initializes LEDs controller.
 *
 * @param ledCtrl is the pointer to the led controller data structure.
 * @param gpioDeviceId is the LEDs GPIO device ID that can be found in xparameters.h file.
 *
 * @return IRC_SUCCESS if successfully initialized
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t Led_Init(ledCtrl_t *ledCtrl, uint16_t gpioDeviceId)
{
   XStatus status;

	// Initialize LEDs GPIO
	status = XGpio_Initialize(&ledCtrl->ledGPIO, gpioDeviceId);
	if (status != XST_SUCCESS)
	{
	   return IRC_FAILURE;
	}

   // Set LED control GPIO direction (0 for output, 1 for input)
	XGpio_SetDataDirection(&ledCtrl->ledGPIO, 1, 0x0000);

	// Set LED control initial value
	ledCtrl->ledGPIOValue = 0x0001;
   ledCtrl->cameraLedStates[0] = CLS_OFF;
   ledCtrl->cameraLedStates[1] = CLS_OFF;
	ledCtrl->cameraLedStateIdx = 0;
	ledCtrl->togglePeriod = 0;

	XGpio_DiscreteWrite(&ledCtrl->ledGPIO, 1, ledCtrl->ledGPIOValue);

	return IRC_SUCCESS;
}

/**
 * Toggle debug LED state.
 *
 * @param ledCtrl is the pointer to the led controller data structure.
 */
void Led_ToggleDebugLedState(ledCtrl_t *ledCtrl)
{
   static uint64_t tic = 0;

   if (elapsed_time_us(tic) > LED_BLINK_0_5HZ)
   {
      ledCtrl->ledGPIOValue ^= LED_DEBUG_MASK;
      XGpio_DiscreteWrite(&ledCtrl->ledGPIO, 1, ledCtrl->ledGPIOValue);
      GETTIME(&tic);
   }
}

/**
 * Set camera LED state.
 *
 * @param ledCtrl is the pointer to the led controller data structure.
 * @param state is the camera LED state.
 */
void Led_SetCameraLedState(ledCtrl_t *ledCtrl, cameraLedState_t state)
{
   ledCtrl->ledGPIOValue &= ~(LED_CAMERA_MASK);
   ledCtrl->ledGPIOValue ^= state;
   XGpio_DiscreteWrite(&ledCtrl->ledGPIO, 1, ledCtrl->ledGPIOValue);
}

/**
 * Set camera LED blinking parameters.
 *
 * @param ledCtrl is the pointer to the led controller data structure.
 * @param state0 is the first camera LED state.
 * @param state1 is the second camera LED state.
 * @param togglePeriod is the amount of time in us between two LED state (0 for to disable blinking).
 */
void Led_SetCameraLedBlinking(ledCtrl_t *ledCtrl, cameraLedState_t state0, cameraLedState_t state1, uint64_t togglePeriod)
{
   ledCtrl->cameraLedStates[0] = state0;
   ledCtrl->cameraLedStates[1] = state1;
   ledCtrl->cameraLedStateIdx = 0;
   ledCtrl->togglePeriod = togglePeriod;
   GETTIME(&ledCtrl->tic);

   Led_SetCameraLedState(ledCtrl, state0);
}

/**
 * Update camera LED state.
 *
 * @param ledCtrl is the pointer to the led controller data structure.
 */
void Led_UpdateCameraLedState(ledCtrl_t *ledCtrl)
{
   if (ledCtrl->togglePeriod == 0)
   {
      return;
   }

   if (elapsed_time_us(ledCtrl->tic) > ledCtrl->togglePeriod)
   {
      ledCtrl->cameraLedStateIdx = (ledCtrl->cameraLedStateIdx + 1) % LED_MAX_NUM_OF_STATES;
      Led_SetCameraLedState(ledCtrl, ledCtrl->cameraLedStates[ledCtrl->cameraLedStateIdx]);
      GETTIME(&ledCtrl->tic);
   }
}
