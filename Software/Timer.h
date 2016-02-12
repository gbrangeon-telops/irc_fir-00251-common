/**
 * @file Timer.h
 * Timer module header.
 *
 * This file defines the interface used to manage 64-bit timer.
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

#ifndef TIMER_H
#define TIMER_H

#include "IRC_Status.h"

#include <stdint.h>
#include <stdbool.h>

typedef struct
{
   volatile uint64_t timer;
   volatile uint64_t timeout; // [us]
   bool enabled;
} timerData_t;

#define TIMER_MAX_TICKS    ((uint64_t)0xFFFFFFFFFFFFFFFF)   /**< Maximum Timer counter ticks count value */

IRC_Status_t Timer_Init(uint32_t baseAddress, uint32_t clockFreq);
                  
void Timer_GetTime(volatile uint64_t *time);

uint32_t Timer_GetCountsPerSecond();

void Timer_Test(uint32_t duration);

void RestartTimer(timerData_t* timer);
void StartTimer(timerData_t* timer, float timeout_ms);
void StopTimer(timerData_t* timer);
bool TimedOut(timerData_t* timer);

#endif // TIMER_H
