/**
 * @file CircularUART.h
 * Circular buffer UART module header.
 *
 * This file defines the interface for the circular buffer UART module.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */
#ifndef CIRCULARUART_H
#define CIRCULARUART_H   

#include "IRC_Status.h"
#include "xuartns550.h"
#include "xintc.h"
#include "CircularByteBuffer.h"

/**
 * Circular buffer UART data structure.
 */
struct circularUARTStruct {
   XUartNs550 uart;                 /**< UART data structure */
   circByteBuffer_t *rxCricBuffer;  /**< Receive circular buffer pointer */
};

/**
 * Circular buffer UART data type.
 */
typedef struct circularUARTStruct circularUART_t;

IRC_Status_t CircularUART_Init(circularUART_t *cuart,
      uint16_t uartDeviceId,
      XIntc *intc,
      uint16_t uartIntrId,
      XUartNs550_Handler handler,
      void *callbackRef,
      circByteBuffer_t *rxCricBuffer);

#endif // CIRCULARUART_H
