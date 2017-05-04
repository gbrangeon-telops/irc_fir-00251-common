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

#ifndef USART_H
#define USART_H

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
   XIntc *intc;
   uint16_t usartIntrId;
   circByteBuffer_t *rxCircBuffer;
   circByteBuffer_t *txCircBuffer;
   Usart_Handler handler;
   void *callBackRef;
   uint8_t loopback;
};

/**
 * USART interface data type.
 */
typedef struct UsartStruct usart_t;

IRC_Status_t Usart_Init(usart_t *usart,
      uint32_t baseAddress,
      XIntc *intc,
      uint16_t usartIntrId);
IRC_Status_t Usart_SetHandler(usart_t *usart, Usart_Handler handler, void *callbackRef);
IRC_Status_t Usart_SetCircularBuffers(usart_t *usart, circByteBuffer_t *rxCircBuffer, circByteBuffer_t *txCircBuffer);
IRC_Status_t Usart_Enable(usart_t *usart);
IRC_Status_t Usart_Disable(usart_t *usart);
uint32_t Usart_SendData(usart_t *usart);

#endif // USART_H
