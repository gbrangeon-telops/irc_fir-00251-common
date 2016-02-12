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
#include "xbasic_types.h"
#include "mb_interface.h"
#include "xparameters.h"
#include "printf_utils.h"
#include "utils.h"   // WAIT_US

void Usart_InterruptHandler(usart_t *usart);


/**
 * Initializes USART link.
 * Initializes USART link by initializing the USART device data structure.
 * It also connects USART interrupt.
 *
 * @param usart is the pointer to the USART link data structure.
 * @param baseAddress is the base address of the USART device.
 * @param intc is the pointer to the Interrupt controller instance.
 * @param usartIntrId is the USART interrupt ID that can be found in xparameters.h file.
 * @param handler is a the pointer to the USART interrupt handling function
 *        (Must complies to Usart_Handler function prototype).
 * @param callbackRef is a pointer to the data that is passed to the handler function as reference.
 * @param timeoutLength is the USART link timeout length in char.
 *
 * @return IRC_SUCCESS if successfully initialized
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t Usart_Init(usart_t *usart,
      uint32_t baseAddress,
      XIntc *intc,
      uint16_t usartIntrId,
      Usart_Handler handler,
      void *callbackRef,
      uint32_t timeoutLength)
{
   int status;

   if (usart == NULL) return IRC_FAILURE;
   if (baseAddress == 0) return IRC_FAILURE;
   if (handler == NULL) return IRC_FAILURE;
   if (intc == NULL) return IRC_FAILURE;

   // Initialize USART data structure
   usart->BaseAddress = baseAddress;
   usart->Handler = handler;
   usart->CallBackRef = callbackRef;

   // Set USART timeout length
   Usart_WriteReg(usart->BaseAddress, USART_TIMEOUT_LENGTH_OFFSET, timeoutLength);

   /*
    * Connect a device driver handler that will be called when an interrupt
    * for the device occurs.
    */
   status = XIntc_Connect(intc, usartIntrId,
                        (XInterruptHandler)Usart_InterruptHandler,
                        usart);
   if (status != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}

/**
 * Transmit data through USART link.
 *
 * @param usart is the pointer to the USART link data structure.
 * @param buffer is a pointer to the bytes buffer to transmit.
 * @param byteCount is the number of bytes to transmit.
 *
 * @return IRC_SUCCESS if successfully transmitted.
 * @return IRC_FAILURE if failed to transmit.
 */
IRC_Status_t Usart_SendData(usart_t *usart, uint8_t *buffer, uint32_t byteCount)
{
   uint32_t bytesToTransmit;
   uint32_t data;
   uint8_t *p_data;
   uint32_t i;

   if (byteCount == 0) return IRC_FAILURE;

   // Reset bytes to transmit
   Usart_WriteReg(usart->BaseAddress, USART_BYTES_TO_TRANSMIT_OFFSET, 0);

   bytesToTransmit = byteCount;
   while (bytesToTransmit  > 0)
   {
      p_data = (uint8_t *)&data;
      i = 0;

      // Copy data bytes
      while ((i < sizeof(data)) && (bytesToTransmit > 0))
      {
         p_data[i++] = buffer[byteCount - bytesToTransmit];
         bytesToTransmit--;
      }

      // Pad remaining bytes with 0
      while (i < sizeof(data))
      {
         p_data[i++] = 0;
      }

      putfsl(data, XPAR_MICROBLAZE_FSL_LINKS);
   }

   Usart_WriteReg(usart->BaseAddress, USART_BYTES_TO_TRANSMIT_OFFSET, byteCount);

   return IRC_SUCCESS;
}

/**
 * Receive data from USART link and store it in linear buffer.
 *
 * @param usart is the pointer to the USART link data structure.
 * @param buffer is a pointer to the bytes buffer to store received data.
 * @param buflen is the bytes buffer length.
 * @param byteCount is the number of received bytes.
 *
 * @return IRC_SUCCESS if successfully received.
 * @return IRC_FAILURE if failed to receive.
 */
IRC_Status_t Usart_ReceiveData(usart_t *usart, uint8_t *buffer, uint32_t buflen, uint32_t *byteCount)
{
   uint32_t bytesToReceive;
   uint32_t data;
   uint8_t *p_data;
   uint32_t i;
   uint8_t bufferOverflow = 0;

   bytesToReceive = Usart_ReadReg(usart->BaseAddress, USART_RX_BYTES_COUNT_OFFSET);

   *byteCount = 0;

   while (bytesToReceive > 0)
   {
      getfsl(data, XPAR_MICROBLAZE_FSL_LINKS);

      p_data = (uint8_t *)&data;
      i = 0;
      while ((i < sizeof(data)) && (bytesToReceive > 0))
      {
         if (*byteCount < buflen)
         {
            buffer[(*byteCount)++] = p_data[i];
         }
         else
         {
            bufferOverflow = 1;
         }
         i++;
         bytesToReceive--;
      }
   }

   if (bufferOverflow == 1)
   {
      return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}

/**
 * Receive data from USART link and store it in circular buffer.
 *
 * @param usart is the pointer to the USART link data structure.
 * @param circByteBuffer is a pointer to the circular bytes buffer to store received data.
 * @param byteCount is the number of received bytes.
 *
 * @return IRC_SUCCESS if successfully received.
 * @return IRC_FAILURE if failed to receive.
 */
IRC_Status_t Usart_ReceiveCircularData(usart_t *usart, circByteBuffer_t *circByteBuffer, uint32_t *byteCount)
{
   uint32_t bytesToReceive;
   uint32_t data;
   uint8_t *p_data;
   uint32_t i;
   uint8_t bufferOverflow = 0;

   bytesToReceive = Usart_ReadReg(usart->BaseAddress, USART_RX_BYTES_COUNT_OFFSET);

   *byteCount = 0;

   while (bytesToReceive > 0)
   {
      getfsl(data, XPAR_MICROBLAZE_FSL_LINKS);

      p_data = (uint8_t *)&data;
      i = 0;
      while ((i < sizeof(data)) && (bytesToReceive > 0))
      {
         if (!CBB_Full(circByteBuffer))
         {
            CBB_Push(circByteBuffer, p_data[i]);
         }
         else
         {
            bufferOverflow = 1;
         }
         i++;
         bytesToReceive--;
      }
   }

   if (bufferOverflow == 1)
   {
      return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}

/**
 * USART loop back function. It transmits every received bytes.
 *
 * @param usart is the pointer to the USART link data structure.
 *
 * @return IRC_SUCCESS if loop back succeeded.
 * @return IRC_FAILURE if loop back failed.
 */
IRC_Status_t Usart_Loopback(usart_t *usart)
{
   uint32_t byteCount;
   uint32_t bytesToReceive;
   uint32_t data;
   uint32_t i;
#ifdef ENABLE_PRINTF
   uint8_t *p_data;
#endif

   byteCount = Usart_ReadReg(usart->BaseAddress, USART_RX_BYTES_COUNT_OFFSET);
   Usart_WriteReg(usart->BaseAddress, USART_BYTES_TO_TRANSMIT_OFFSET, 0);

   PRINTF("0x");

   bytesToReceive = byteCount;
   while (bytesToReceive > 0)
   {
      getfsl(data, XPAR_MICROBLAZE_FSL_LINKS);
      putfsl(data, XPAR_MICROBLAZE_FSL_LINKS);

#ifdef ENABLE_PRINTF
      p_data = (uint8_t *)&data;
#endif

      i = 0;
      while ((i < sizeof(data)) && (bytesToReceive > 0))
      {
         PRINTF("%02X", p_data[i++]);
         bytesToReceive--;
      }

   }

   PRINTF("\n");

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
         // Read the RX byte count
         eventData = Usart_ReadReg(usart->BaseAddress, USART_RX_BYTES_COUNT_OFFSET);
         break;

      case USART_EVENT_TX_DONE:
      default:
         eventData = 0;
         break;
   }

   // Clear interrupt
   Usart_WriteReg(usart->BaseAddress, USART_CLEAR_INTR_VECT_OFFSET, event);
   Usart_WriteReg(usart->BaseAddress, USART_CLEAR_INTR_VECT_OFFSET, 0);

   if (usart->Handler != NULL)
   {
      usart->Handler(usart->CallBackRef, event, eventData);
   }
}
