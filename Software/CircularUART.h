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
#include "UART_Utils.h"

/**
 * Circular buffer UART data structure.
 */
struct circularUARTStruct {
   XUartNs550 uart;
   XIntc *intc;
   uint16_t uartIntrId;
   circByteBuffer_t *rxCircBuffer;
   circByteBuffer_t *txCircBuffer;
   uint32_t errorCount;
};

/**
 * Circular buffer UART data type.
 */
typedef struct circularUARTStruct circularUART_t;

// Circular UART interrupt handler type definition
typedef void (*CircularUART_Handler)(void *callbackRef, uint32_t event, unsigned int eventData);

#define CircularUART_Config(p_cuart, baudRate, dataBits, parity, stopBits) \
		UART_Config(&p_cuart->uart, baudRate, dataBits, parity, stopBits)

#define CircularUART_ResetRxFifo(p_cuart) UART_ResetRxFifo(&(p_cuart)->uart)

IRC_Status_t CircularUART_Init(circularUART_t *cuart,
      uint16_t uartDeviceId,
      XIntc *intc,
      uint16_t uartIntrId);
IRC_Status_t CircularUART_SetHandler(circularUART_t *cuart, CircularUART_Handler handler, void *callbackRef);
IRC_Status_t CircularUART_SetCircularBuffers(circularUART_t *cuart, circByteBuffer_t *rxCircBuffer, circByteBuffer_t *txCircBuffer);
IRC_Status_t CircularUART_Enable(circularUART_t *cuart);
IRC_Status_t CircularUART_Disable(circularUART_t *cuart);
uint32_t CircularUART_SendData(circularUART_t *cuart);

#endif // CIRCULARUART_H
