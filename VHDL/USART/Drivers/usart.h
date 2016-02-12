/**
 * @file usart.h
 * USART interface driver header.
 *
 * This file defines the USART interface driver.
 *
 * $Rev$
 * $Autho$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef __USART_H__
#define __USART_H__

#include "IRC_status.h"
#include "xintc.h"
#include "CircularByteBuffer.h"
#include <stdint.h>


// USART Register Offset
#define USART_TIMEOUT_LENGTH_OFFSET    0
#define USART_BYTES_TO_TRANSMIT_OFFSET 4
#define USART_RX_BYTES_COUNT_OFFSET    8
#define USART_INTR_VECT_OFFSET         12
#define USART_CLEAR_INTR_VECT_OFFSET   16

// USART Interrupt Mask
#define USART_EVENT_TX_DONE            1
#define USART_EVENT_RX_TIMEOUT         2
#define USART_EVENT_RX_FULL            4

// USART Read Register Macro
#define Usart_ReadReg(BaseAddress, RegOffset) \
   Xil_In32((BaseAddress) + (RegOffset))

// USART Write Register Macro
#define Usart_WriteReg(BaseAddress, RegOffset, RegisterValue) \
   Xil_Out32((BaseAddress) + (RegOffset), (RegisterValue))

// USART interrupt handler type definition
typedef void (*Usart_Handler)(void *callbackRef, uint32_t event, unsigned int eventData);


/**
 * USART interface data structure.
 */
struct UsartStruct {
   uint32_t BaseAddress;
   Usart_Handler Handler;
   void *CallBackRef;
};

/**
 * USART interface data type.
 */
typedef struct UsartStruct usart_t;

IRC_Status_t Usart_Init(usart_t *usart,
      uint32_t baseAddress,
      XIntc *intc,
      uint16_t usartIntrId,
      Usart_Handler handler,
      void *callbackRef,
      uint32_t timeoutLength);
IRC_Status_t Usart_SendData(usart_t *usart, uint8_t *buffer, uint32_t byteCount);
IRC_Status_t Usart_ReceiveData(usart_t *usart, uint8_t *buffer, uint32_t buflen, uint32_t *byteCount);
IRC_Status_t Usart_ReceiveCircularData(usart_t *usart, circByteBuffer_t *circByteBuffer, uint32_t *byteCount);
IRC_Status_t Usart_Loopback(usart_t *usart);

#endif // __USART_H__
