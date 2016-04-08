/**
 * @file printf_utils.h
 * printf utilities definition.
 *
 * This file defines printf macros.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef PRINTF_UTILS_H
#define PRINTF_UTILS_H

#include <stdio.h>

#define DUMMY_PRINTF(...)        ((void)0)
#define DUMMY_PRINT(...)         ((void)0)

#ifdef ENABLE_PRINTF
   #ifdef SIM
      #define PRINT(str)         (sim_print(str))  /**< PRINT function for simulation */
      #define PRINTF             sim_printf        /**< PRINTF function for simulation */
   #else
      #define PRINT(str)         print(str)
      #define PRINTF(fmt, ...)   xil_printf(fmt, ##__VA_ARGS__)
   #endif
#else
   #define PRINT(str)            DUMMY_PRINT(str)
   #define PRINTF(fmt, ...)      DUMMY_PRINTF(fmt, ##__VA_ARGS__)
#endif

#define FPGA_PRINTF(fmt, ...)    PRINTF(FPGA_PRINT_PREFIX fmt, ##__VA_ARGS__)
#define FPGA_PRINT(str)          PRINT(FPGA_PRINT_PREFIX str)

/**< Macros for displaying floating point numbers using printf */
/** Example of use :
 * PRINTF("PI is " _PCF(4) ". More precisely, it is " _PCF(6) "\n", _FFMT(3.141592f, 4), _FFMT(3.141592f, 6));
 * will display: "PI is 3.1415. More precisely, it is 3.141592" */
#define _PCF(n) "%s%d.%0" #n "d" /**< Macro to use in the format string. To be used along with the _FFMT macro */
#define _FFMT(x,n) (x<0)&&(x>-1)?"-":"", (int32_t)(x), (uint32_t)fabsf((int32_t)(((x) - (int32_t)(x)) * pow10f(n))) /**< Macro to be used in the varargin of the printf function. n in the number of floating point digits. */

#endif // PRINTF_UTILS_H
