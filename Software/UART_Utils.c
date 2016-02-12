/**
 * @file UART_Utils.c
 * UART utility module implementation.
 *
 * This file implements the interface used to manage UART link.
 * This module use XUartNs550 library based on xuartns550_intr_example.c.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "UART_utils.h"
#include "xparameters.h"

/**
 * Initializes UART link.
 * Initializes UART link by initializing the UART device data structure.
 * It also connects UART interrupt.
 *
 * @param uart is the pointer to the UART link data structure.
 * @param uartDeviceId is the UART device ID that can be found in xparameters.h file.
 * @param intc is the pointer to the Interrupt controller instance.
 * @param uartIntrId is the UART interrupt ID that can be found in xparameters.h file.
 * @param handler is a the pointer to the UART interrupt handling function
 *        (Must complies to XUartNs550_Handler function prototype).
 * @param callbackRef is a pointer to the data that is passed to the handler function as reference.
 *
 * @return IRC_SUCCESS if successfully initialized
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t UART_Init(XUartNs550 *uart,
      uint16_t uartDeviceId,
      XIntc *intc,
      uint16_t uartIntrId,
      XUartNs550_Handler handler,
      void *callbackRef)
{
   XStatus status;
   
   /*
    * Initialize the UART driver so that it's ready to use.
    */
   status = XUartNs550_Initialize(uart, uartDeviceId);
   if (status != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   /*
    * Perform a self-test to ensure that the hardware was built correctly.
    */
   status = XUartNs550_SelfTest(uart);
   if (status != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   /*
    * Connect a device driver handler that will be called when an interrupt
    * for the device occurs, the device driver handler performs the specific
    * interrupt processing for the device.
    */
   status = XIntc_Connect(intc, uartIntrId,
                        (XInterruptHandler)XUartNs550_InterruptHandler,
                        uart);
   if (status != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   /*
    * Setup the handlers for the UART that will be called from the interrupt
    * context when data has been sent and received, specify a pointer to the
    * UART driver instance as the callback reference so the handlers are able
    * to access the instance data.
    */
   XUartNs550_SetHandler(uart, handler, callbackRef);

   /*
    * Enable the interrupt of the UART so interrupts will occur and keep the
    * FIFOs enabled.
    */
   uint16_t uartOptions = XUN_OPTION_DATA_INTR | XUN_OPTION_FIFOS_ENABLE;
   XUartNs550_SetOptions(uart, uartOptions);
   
   return IRC_SUCCESS;
}

/**
 * Configures UART link.
 * Encapsulates XUartNs550_SetDataFormat function in order to configure the UART link.
 *
 * @param uart is the pointer to the UART link data structure.
 * @param baudRate is the baud rate of the UART device in bps, ie 1200.
 * @param dataBits is the number of data bits of the UART device.
 * @param parity is the parity of the UART device ('N' = None, 'O' = Odd and 'E' = Even).
 * @param stopBits is the number of stop bits of the UART device.
 *
 * @return IRC_SUCCESS if the data format was successfully set.
 * @return IRC_FAILURE if an error occurred while setting the UART link format (XST_UART_BAUD_ERROR or XST_INVALID_PARAM).
 */
IRC_Status_t UART_Config(XUartNs550 *uart,
      uint32_t baudRate,
      uint8_t dataBits,
      char parity,
      uint8_t stopBits)
{
   XStatus status;
   XUartNs550Format uartFormat;

   /*
    * Fill UartNs550 data format structure with parameters
    */
   uartFormat.BaudRate = baudRate;

   switch (dataBits)
   {
      case 5:
         uartFormat.DataBits = XUN_FORMAT_5_BITS;
         break;

      case 6:
         uartFormat.DataBits = XUN_FORMAT_6_BITS;
         break;

      case 7:
         uartFormat.DataBits = XUN_FORMAT_7_BITS;
         break;

      case 8:
         uartFormat.DataBits = XUN_FORMAT_8_BITS;
         break;

      default:
         return IRC_FAILURE;
   }

   switch (parity)
   {
      case 'n':
      case 'N':
         uartFormat.Parity = XUN_FORMAT_NO_PARITY;
         break;

      case 'o':
      case 'O':
         uartFormat.Parity = XUN_FORMAT_ODD_PARITY;
         break;

      case 'e':
      case 'E':
         uartFormat.Parity = XUN_FORMAT_EVEN_PARITY;
         break;

      default:
         return IRC_FAILURE;
   }

   switch (stopBits)
   {
      case 1:
         uartFormat.StopBits = XUN_FORMAT_1_STOP_BIT;
         break;

      case 2:
         uartFormat.StopBits = XUN_FORMAT_2_STOP_BIT;
         break;

      default:
         return IRC_FAILURE;
   }

   /*
    * Set UART device data format
    */
   status = XUartNs550_SetDataFormat(uart, &uartFormat);
   if (status != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}

IRC_Status_t UART_ResetRxFifo(XUartNs550 *uart)
{
   uint16_t currentOptions = XUartNs550_GetOptions(uart);

   if (XUartNs550_SetOptions(uart, currentOptions | XUN_OPTION_RESET_RX_FIFO) != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   if (XUartNs550_SetOptions(uart, currentOptions) != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}



