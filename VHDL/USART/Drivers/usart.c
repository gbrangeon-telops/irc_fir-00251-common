/**
 * @file usart.c
 * USART interface driver implementation.
 *
 * This file implements the USART interface driver.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "usart.h"
#include "fsl.h"
#include "mb_interface.h"
#include "xparameters.h"
#include "printf_utils.h"
#include "utils.h"   // WAIT_US

static void Usart_InterruptHandler(usart_t *usart);

static uint32_t Usart_SendCircBuffer(usart_t *usart);
static uint32_t Usart_ReceiveData(usart_t *usart);
static uint32_t Usart_Loopback(usart_t *usart);

/**
 * Initializes USART link.
 * Initializes USART link by initializing the USART device data structure.
 * It also connects USART interrupt.
 *
 * @param usart is the pointer to the USART link data structure.
 * @param baseAddress is the base address of the USART device.
 * @param intc is the pointer to the Interrupt controller instance.
 * @param usartIntrId is the USART interrupt ID that can be found in xparameters.h file.
 *
 * @return IRC_SUCCESS if successfully initialized
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t Usart_Init(usart_t *usart,
      uint32_t baseAddress,
      XIntc *intc,
      uint16_t usartIntrId)
{
   int status;

   if (usart == NULL) return IRC_FAILURE;
   if (baseAddress == 0) return IRC_FAILURE;
   if (intc == NULL) return IRC_FAILURE;

   // Initialize USART data structure
   usart->BaseAddress = baseAddress;
   usart->intc = intc;
   usart->usartIntrId = usartIntrId;
   usart->loopback = 0;

   // Set USART timeout length
   Usart_WriteReg(usart->BaseAddress, USART_TIMEOUT_LENGTH_OFFSET, 7);

   /*
    * Connect a device driver handler that will be called when an interrupt
    * for the device occurs.
    */
   status = XIntc_Connect(usart->intc, usart->usartIntrId,
                        (XInterruptHandler)Usart_InterruptHandler,
                        usart);
   if (status != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}

/**
 * Set USART interrupt handler and callback reference.
 *
 * @param usart is the pointer to the USART data structure.
 * @param handler is a callback function pointer (see CircularUART_Handler definition).
 * @param callbackRef is a pointer to the callback reference.
 *
 * @return IRC_SUCCESS
 */
IRC_Status_t Usart_SetHandler(usart_t *usart, Usart_Handler handler, void *callbackRef)
{
   usart->handler = handler;
   usart->callBackRef = callbackRef;

   return IRC_SUCCESS;
}

/**
 * Set USART circular byte buffers.
 *
 * @param usart is the pointer to the USART data structure.
 * @param rxCircBuffer is the RX circular byte buffer.
 * @param txCircBuffer is the TX circular byte buffer.
 *
 * @return IRC_SUCCESS
 */
IRC_Status_t Usart_SetCircularBuffers(usart_t *usart, circByteBuffer_t *rxCircBuffer, circByteBuffer_t *txCircBuffer)
{
   usart->rxCircBuffer = rxCircBuffer;
   usart->txCircBuffer = txCircBuffer;

   return IRC_SUCCESS;
}

/**
 * Enable circular UART interrupt.
 *
 * @param usart is the pointer to the USART data structure.
 *
 * @return IRC_SUCCESS
 */
IRC_Status_t Usart_Enable(usart_t *usart)
{
   XIntc_Enable(usart->intc, usart->usartIntrId);

   return IRC_SUCCESS;
}

/**
 * Disable circular UART interrupt.
 *
 * @param usart is the pointer to the USART data structure.
 *
 * @return IRC_SUCCESS
 */
IRC_Status_t Usart_Disable(usart_t *usart)
{
   XIntc_Disable(usart->intc, usart->usartIntrId);

   return IRC_SUCCESS;
}

/**
 * Send data contained in USART TX circular buffer.
 *
 * @param usart is the pointer to the USART data structure.
 *
 * @return the number of characters that have been transmit.
 */
uint32_t Usart_SendData(usart_t *usart)
{
   return Usart_SendCircBuffer(usart);
}

/**
 * Copy data contained in the TX circular byte buffer into USART TX FIFO.
 *
 * @param usart is the pointer to the USART data structure.
 *
 * @return the number of characters that have been transmit.
 */
uint32_t Usart_SendCircBuffer(usart_t *usart)
{
   uint32_t byteCount;
   uint32_t data;
   uint8_t *p_data;
   uint32_t i;

   if (usart == NULL) return 0;
   if (usart->txCircBuffer == NULL) return 0;

   // Reset bytes to transmit
   Usart_WriteReg(usart->BaseAddress, USART_BYTES_TO_TRANSMIT_OFFSET, 0);

   byteCount = 0;
   while (!CBB_Empty(usart->txCircBuffer))
   {
      p_data = (uint8_t *)&data;
      i = 0;

      // Copy data bytes
      while ((i < sizeof(data)) && (!CBB_Empty(usart->txCircBuffer)))
      {
         CBB_Pop(usart->txCircBuffer, &p_data[i++]);
         byteCount++;
      }

      // Pad remaining bytes with 0
      while (i < sizeof(data))
      {
         p_data[i++] = 0;
      }

      putfsl(data, XPAR_MICROBLAZE_FSL_LINKS);
   }

   Usart_WriteReg(usart->BaseAddress, USART_BYTES_TO_TRANSMIT_OFFSET, byteCount);

   return byteCount;
}

/**
 * Copy data contained in the USART RX FIFO into the RX circular byte buffer.
 *
 * @param usart is the pointer to the USART data structure.
 *
 * @return the number of characters that have been received.
 */
uint32_t Usart_ReceiveData(usart_t *usart)
{
   uint32_t byteCount;
   uint32_t bytesToReceive;
   uint32_t data;
   uint8_t *p_data;
   uint32_t i;

   if (usart == NULL) return 0;
   if (usart->rxCircBuffer == NULL) return 0;

   bytesToReceive = Usart_ReadReg(usart->BaseAddress, USART_RX_BYTES_COUNT_OFFSET);

   byteCount = 0;

   while ((bytesToReceive > 0) && (!CBB_Full(usart->rxCircBuffer)))
   {
      getfsl(data, XPAR_MICROBLAZE_FSL_LINKS);

      p_data = (uint8_t *)&data;
      i = 0;
      while ((i < sizeof(data)) && (bytesToReceive > 0))
      {
         if (!CBB_Full(usart->rxCircBuffer))
         {
            CBB_Push(usart->rxCircBuffer, p_data[i]);
            byteCount++;
         }
         else
         {
            break;
         }
         i++;
         bytesToReceive--;
      }
   }

   return IRC_SUCCESS;
}

/**
 * USART loop back function. It transmits every received bytes.
 *
 * @param usart is the pointer to the USART link data structure.
 *
 * @return the number of characters that have been transmit.
 */
uint32_t Usart_Loopback(usart_t *usart)
{
   uint32_t byteCount;
   uint32_t bytesToReceive;
   uint32_t data;
   uint32_t receivedBytes;

   bytesToReceive = Usart_ReadReg(usart->BaseAddress, USART_RX_BYTES_COUNT_OFFSET);

   // Reset bytes to transmit
   Usart_WriteReg(usart->BaseAddress, USART_BYTES_TO_TRANSMIT_OFFSET, 0);

#ifndef STARTUP
   PRINTF("0x");
#endif

   byteCount = 0;
   while (bytesToReceive > 0)
   {
      getfsl(data, XPAR_MICROBLAZE_FSL_LINKS);
      putfsl(data, XPAR_MICROBLAZE_FSL_LINKS);

      receivedBytes = MIN(sizeof(data), bytesToReceive);

      bytesToReceive -= receivedBytes;
      byteCount += receivedBytes;

#if defined(ENABLE_PRINTF) && !defined(STARTUP)
      uint8_t *p_data = (uint8_t *)&data;
      uint32_t i = 0;
      for (i = 0; i < receivedBytes; i++)
      {
         PRINTF("%02X", p_data[i]);
      }
#endif
   }

#ifndef STARTUP
   PRINTF("\n");
#endif

   Usart_WriteReg(usart->BaseAddress, USART_BYTES_TO_TRANSMIT_OFFSET, byteCount);

   return IRC_SUCCESS;
}

/**
 * USART interrupt handler.
 *
 * @param usart is the pointer to the USART link data structure.
 */
void Usart_InterruptHandler(usart_t *usart)
{
   uint32_t event;
   uint32_t eventData;

   if (usart == NULL) return;

   // Read the interrupt vector
   event = Usart_ReadReg(usart->BaseAddress, USART_INTR_VECT_OFFSET);

   switch (event)
   {
      case USART_EVENT_RX_FULL:
      case USART_EVENT_RX_TIMEOUT:
         if (usart->loopback == 0)
         {
            // Read the RX bytes
            eventData = Usart_ReceiveData(usart);
         }
         else
         {
            // Loopback
            eventData = Usart_Loopback(usart);
         }
         break;

      case USART_EVENT_TX_DONE:
      default:
         eventData = 0;
         break;
   }

   if ((usart->handler != NULL) && (usart->loopback == 0))
      usart->handler(usart->callBackRef, event, eventData);

   // Clear interrupt
   Usart_WriteReg(usart->BaseAddress, USART_CLEAR_INTR_VECT_OFFSET, event);
   Usart_WriteReg(usart->BaseAddress, USART_CLEAR_INTR_VECT_OFFSET, 0);
}
