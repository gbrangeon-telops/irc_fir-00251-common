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




#include "xuartns550.h"
#include "IRC_Status.h"
#include "xuartlite.h"
#include "xuartlite_l.h"
#include "xuartlite_i.h"
#include "xintc.h"
#include "CircularByteBuffer.h"


#define XUN_EVENT_RECV_DATA      1 /**< Data has been received */
#define XUN_EVENT_SENT_DATA      3 /**< Data has been sent */



// Circular UART interrupt handler type definition
typedef void (*CircularUART_Handler)(void *CallBackRef,  u32 Event ,unsigned int ByteCount);

typedef enum UartType{Ns550, Lite}  uartType_t;
/**
 * Circular buffer UART data structure.
 */
struct circularUARTStruct {
   uartType_t uartType;

   union {
      XUartNs550 Ns550;
     XUartLite Lite;
   } uart;

   CircularUART_Handler Handler;
   void *CallBackRef;     /* Callback ref for handler */
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

IRC_Status_t CircularUART_Init(circularUART_t *cuart,
      uint16_t uartDeviceId,
      XIntc *intc,
      uint16_t uartIntrId,
      CircularUART_Handler Handler,
      void *callbackRef,
      uartType_t type);
IRC_Status_t CircularUART_SetHandler(circularUART_t *cuart, CircularUART_Handler CtrlInft_Handler, void *callbackRef);
IRC_Status_t CircularUART_SetCircularBuffers(circularUART_t *cuart, circByteBuffer_t *rxCircBuffer, circByteBuffer_t *txCircBuffer);
IRC_Status_t CircularUART_Enable(circularUART_t *cuart);
IRC_Status_t CircularUART_Disable(circularUART_t *cuart);
IRC_Status_t CircularUART_ResetFifo(circularUART_t *cuart);
IRC_Status_t CircularUART_Config(circularUART_t *cuart, uint32_t baudRate, uint8_t dataBits, char parity, uint8_t stopBits);
uint32_t CircularUART_SendData(circularUART_t *cuart, uint32_t buflen);
IRC_Status_t CircularUART_SetUartType(circularUART_t *cuart, uartType_t uartType);

#endif // CIRCULARUART_H
