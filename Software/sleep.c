/**
 * @file sleep.c
 * Sleep module implementation.
 *
 * This file implements the interface used to manage sleep delays.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "sleep.h"
#include "Timer.h"

/**
 * This function is used to provide delays in nanoseconds
 *
 * @param   nanoseconds is the delay value in nanoseconds.
 */
void nanosleep(uint32_t nanoseconds)
{
   /* not implemented */
}

/**
 * This function is used to provide delays in microseconds
 *
 * @param   useconds is the delay value in microseconds.
 *
 * @return  0 always
 */
uint32_t usleep(uint32_t useconds)
{
   uint64_t tEnd, tCur;

   Timer_GetTime(&tCur);
   tEnd  = tCur + ((uint64_t) useconds) * (uint64_t) Timer_GetCountsPerSecond() / (uint64_t) 1000000;
   do
   {
     Timer_GetTime(&tCur);
   } while (tCur < tEnd);

   return 0;
}

/**
 * This function is used to provide delays in seconds
 *
 * @param   seconds is the delay value in seconds.
 *
 * @return  0 always
 */
uint32_t sleep(uint32_t seconds)
{
  uint64_t tEnd, tCur;

  Timer_GetTime(&tCur);
  tEnd  = tCur + ((uint64_t) seconds) * (uint64_t) Timer_GetCountsPerSecond();
  do
  {
    Timer_GetTime(&tCur);
  } while (tCur < tEnd);

  return 0;
}

