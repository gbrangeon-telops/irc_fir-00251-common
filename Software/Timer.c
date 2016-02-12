/**
 * @file Timer.c
 * Timer module implementation.
 *
 * This file implements the interface used to manage 64-bit timer.
 * This module use XTmrCtr library and is based on xtmrctr_polled_example.c.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "Timer.h"
#include "xtmrctr_l.h"
#include "utils.h"
#include "printf_utils.h"

uint32_t timerBaseAddress = 0;   /**< AXI Timer base address */
uint32_t timerClockFreq = 0;     /**< AXI Timer clock frequency */

/**
 * Initializes AXI timer IP registers.
 * The timer is initialized in cascaded mode in order to obtain a 64-bit timer.
 * The period of such a timer @100MHz is more than 5845 years before wrap.
 *
 * @param baseAddress is the register base address of the AXI timer IP.
 * @param clockFreq is the timer clock frequency or the ticks count per second.
 *
 * @return IRC_SUCCESS, always.
 */
IRC_Status_t Timer_Init(uint32_t baseAddress, uint32_t clockFreq)
{
   uint32_t tcsReg;
   timerBaseAddress = baseAddress;
   timerClockFreq = clockFreq;

   tcsReg = XTC_CSR_CASC_MASK | XTC_CSR_AUTO_RELOAD_MASK;

   /*
    * Set Timer Control Status Register (TCSR) values
    */
   XTmrCtr_SetControlStatusReg(timerBaseAddress, 0, tcsReg);

   /*
    * Set Timer Load Registers (TLR) values
    */
   XTmrCtr_SetLoadReg(timerBaseAddress, 0, 0x00000000);
   XTmrCtr_SetLoadReg(timerBaseAddress, 1, 0x00000000);

   /*
    * Load TLR values into TCR values
    */
   XTmrCtr_SetControlStatusReg(timerBaseAddress, 0, tcsReg | XTC_CSR_LOAD_MASK );
   XTmrCtr_SetControlStatusReg(timerBaseAddress, 0, tcsReg);

   /*
    * Enable Timer
    */
   XTmrCtr_SetControlStatusReg(timerBaseAddress, 0, tcsReg | XTC_CSR_ENABLE_TMR_MASK);
   
   return IRC_SUCCESS;
}

/**
 * Returns the actual value of the timer counter.
 *
 * @param time is a pointer to the time value to update.
 */
void Timer_GetTime(volatile uint64_t *time)
{
   uint32_t high;
   uint32_t low;

   /* Loop until we got a consistent register pair */
   do
   {
     high = XTmrCtr_GetTimerCounterReg(timerBaseAddress, 1);
     low = XTmrCtr_GetTimerCounterReg(timerBaseAddress, 0);
   } while (high != XTmrCtr_GetTimerCounterReg(timerBaseAddress, 1));

   *time = (((uint64_t) high) << 32) | (uint64_t) low;
}

/**
 * Returns timer clock frequency or the ticks count per second.
 *
 * @return timer clock frequency or the ticks count per second.
 */
uint32_t Timer_GetCountsPerSecond()
{
   return timerClockFreq;
}

void Timer_Test(uint32_t duration)
{
   uint64_t tStart, tEnd, tCur;
   uint32_t i;
   for (i = 0; i < duration; ++i)
   {
      Timer_GetTime(&tStart);
      tEnd  = tStart + (uint64_t) Timer_GetCountsPerSecond();
      do
      {
         Timer_GetTime(&tCur);
      } while (tCur < tEnd);

#ifdef ENABLE_PRINTF
      uint32_t *p_tStart32 = (uint32_t*) &tStart;
      uint32_t *p_tEnd32 = (uint32_t*) &tCur;
      PRINTF("Timer(%d): Start = 0x%08X%08X, End = 0x%08X%08X\n", i + 1, p_tStart32[1], p_tStart32[0], p_tEnd32[1], p_tEnd32[0]);
#endif
   }
}

void RestartTimer(timerData_t* timer)
{
   GETTIME(&timer->timer);
   timer->enabled = true;
}

void StartTimer(timerData_t* timer, float timeout_ms)
{
   timer->timeout = timeout_ms * 1000;
   GETTIME(&timer->timer);
   timer->enabled = true;
}

void StopTimer(timerData_t* timer)
{
   timer->enabled = false;
}

bool TimedOut(timerData_t* timer)
{
   if (!timer->enabled)
      return false;

   return elapsed_time_us(timer->timer) >= timer->timeout;
}
