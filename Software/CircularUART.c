/**
 * @file CircularUART.c
 * Circular buffer UART module implementation.
 * Some code has been copied from XUartNs550 driver.
 *
 * This file implements the circular buffer UART module.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "CircularUART.h"
#include "UART_Utils.h"

static void CircularUART_InterruptHandler(circularUART_t *cuart);
static uint32_t CircularUART_SendCircBuffer(circularUART_t *cuart);
static uint32_t CircularUART_ReceiveCircBuffer(circularUART_t *cuart);

static void NoInterruptHandler(circularUART_t *cuart);
static void ReceiveStatusHandler(circularUART_t *cuart);
static void ReceiveDataHandler(circularUART_t *cuart);
static void SendDataHandler(circularUART_t *cuart);
static void ModemHandler(circularUART_t *cuart);

#define CircularUART_UpdateStats(cuart, CurrentLsr)  \
{                       \
	cuart->uart.LastErrors |= CurrentLsr;       \
                        \
   if (CurrentLsr & XUN_LSR_OVERRUN_ERROR) {    \
	   cuart->uart.Stats.ReceiveOverrunErrors++;   \
   }                    \
   if (CurrentLsr & XUN_LSR_PARITY_ERROR) {     \
	   cuart->uart.Stats.ReceiveParityErrors++; \
   }                    \
   if (CurrentLsr & XUN_LSR_FRAMING_ERROR) {    \
	   cuart->uart.Stats.ReceiveFramingErrors++;   \
   }                    \
   if (CurrentLsr & XUN_LSR_BREAK_INT) {        \
	   cuart->uart.Stats.ReceiveBreakDetected++;   \
   }                    \
}

typedef void (*Handler)(circularUART_t *cuart);

static Handler HandlerTable[13] = {
   ModemHandler,           /* 0 */
   NoInterruptHandler,     /* 1 */
   SendDataHandler,        /* 2 */
   NULL,                   /* 3 */
   ReceiveDataHandler,     /* 4 */
   NULL,                   /* 5 */
   ReceiveStatusHandler,   /* 6 */
   NULL,                   /* 7 */
   NULL,                   /* 8 */
   NULL,                   /* 9 */
   NULL,                   /* 10 */
   NULL,                   /* 11 */
   ReceiveDataHandler      /* 12 */
};


/**
 * Initializes UART link.
 * Initializes UART link by initializing the UART device data structure.
 * It also connects and enables UART interrupt.
 *
 * @param cuart is the pointer to the circular buffer UART link data structure.
 * @param uartDeviceId is the UART device ID that can be found in xparameters.h file.
 * @param intc is the pointer to the Interrupt controller instance.
 * @param uartIntrId is the UART interrupt ID that can be found in xparameters.h file.
 *
 * @return IRC_SUCCESS if successfully initialized
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t CircularUART_Init(circularUART_t *cuart,
      uint16_t uartDeviceId,
      XIntc *intc,
      uint16_t uartIntrId)
{
   XStatus status;
   
   if (cuart == NULL) return IRC_FAILURE;
   if (intc == NULL) return IRC_FAILURE;

   // Initialize CUART data structure
   cuart->intc = intc;
   cuart->uartIntrId = uartIntrId;

   /*
    * Initialize the UART driver so that it's ready to use.
    */
   status = XUartNs550_Initialize(&cuart->uart, uartDeviceId);
   if (status != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   /*
    * Perform a self-test to ensure that the hardware was built correctly.
    */
   status = XUartNs550_SelfTest(&cuart->uart);
   if (status != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   /*
    * Connect a device driver handler that will be called when an interrupt
    * for the device occurs, the device driver handler performs the specific
    * interrupt processing for the device.
    */
   status = XIntc_Connect(cuart->intc, cuart->uartIntrId,
                        (XInterruptHandler)CircularUART_InterruptHandler,
                        cuart);
   if (status != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   /*
    * Enable the interrupt of the UART so interrupts will occur and keep the
    * FIFOs enabled.
    */
   uint16_t uartOptions = XUN_OPTION_DATA_INTR | XUN_OPTION_FIFOS_ENABLE;
   XUartNs550_SetOptions(&cuart->uart, uartOptions);

   CircularUART_SetCircularBuffers(cuart, NULL, NULL);
   CircularUART_SetHandler(cuart, NULL, NULL);

   return IRC_SUCCESS;
}

/**
 * Set circular UART interrupt handler and callback reference.
 *
 * @param cuart is the pointer to the circular buffer UART data structure.
 * @param handler is a callback function pointer (see CircularUART_Handler definition).
 * @param callbackRef is a pointer to the callback reference.
 *
 * @return IRC_SUCCESS
 */
IRC_Status_t CircularUART_SetHandler(circularUART_t *cuart, CircularUART_Handler handler, void *callbackRef)
{
   if (cuart == NULL) return IRC_FAILURE;

   cuart->uart.Handler = handler;
   cuart->uart.CallBackRef = callbackRef;

   return IRC_SUCCESS;
}

/**
 * Set circular UART buffers.
 *
 * @param cuart is the pointer to the circular buffer UART data structure.
 * @param rxCircBuffer is the RX circular byte buffer.
 * @param txCircBuffer is the TX circular byte buffer.
 *
 * @return IRC_SUCCESS
 */
IRC_Status_t CircularUART_SetCircularBuffers(circularUART_t *cuart, circByteBuffer_t *rxCircBuffer, circByteBuffer_t *txCircBuffer)
{
   if (cuart == NULL) return IRC_FAILURE;

   cuart->rxCircBuffer = rxCircBuffer;
   cuart->txCircBuffer = txCircBuffer;

   return IRC_SUCCESS;
}

/**
 * Enable circular UART interrupt.
 *
 * @param cuart is the pointer to the circular buffer UART data structure.
 *
 * @return IRC_SUCCESS
 */
IRC_Status_t CircularUART_Enable(circularUART_t *cuart)
{
   if (cuart == NULL) return IRC_FAILURE;

   XIntc_Enable(cuart->intc, cuart->uartIntrId);

   return IRC_SUCCESS;
}

/**
 * Disable circular UART interrupt.
 *
 * @param cuart is the pointer to the circular buffer UART data structure.
 *
 * @return IRC_SUCCESS
 */
IRC_Status_t CircularUART_Disable(circularUART_t *cuart)
{
   if (cuart == NULL) return IRC_FAILURE;

   XIntc_Disable(cuart->intc, cuart->uartIntrId);

   return IRC_SUCCESS;
}

/**
 * Send data contained in circular UART TX buffer.
 *
 * @param cuart is the pointer to the circular buffer UART data structure.
 *
 * @return the number of characters that have been transmit.
 */
uint32_t CircularUART_SendData(circularUART_t *cuart)
{
   if (cuart == NULL) return IRC_FAILURE;

   return CircularUART_SendCircBuffer(cuart);
}

/**
 * Circular UART interrupt handler
 *
 * @param cuart is the pointer to the circular buffer UART data structure.
 */
void CircularUART_InterruptHandler(circularUART_t *cuart)
{
   uint8_t isrStatus;

   if (cuart == NULL) return;

   /*
    * Read the interrupt ID register to determine which, only one,
    * interrupt is active
    */
   isrStatus = (uint8_t)XUartNs550_ReadReg(cuart->uart.BaseAddress,
               XUN_IIR_OFFSET) &
               XUN_INT_ID_MASK;

   /*
    * Make sure the handler table has a handler defined for the interrupt
    * that is active, and then call the handler
    */
   if (HandlerTable[isrStatus] == NULL) return;

   HandlerTable[isrStatus](cuart);
}

/****************************************************************************/
/**
*
* This function handles the case when the value read from the interrupt ID
* register indicates no interrupt is to be serviced.
*
* @param InstancePtr is a pointer to the XUartNs550 instance .
*
* @return   None.
*
* @note     None.
*
* @internal
*
* The LsrRegister is volatile to ensure that optimization will not cause the
* statement to be optimized away.
*
*****************************************************************************/
static void NoInterruptHandler(circularUART_t *cuart)
{
   volatile u32 LsrRegister;

   /*
    * Reading the ID register clears the currently asserted interrupts
    */
   LsrRegister = XUartNs550_GetLineStatusReg(cuart->uart.BaseAddress);

   /*
    * Update the stats to reflect any errors that might be read
    */
   CircularUART_UpdateStats(cuart, (u8)LsrRegister);
}

/****************************************************************************/
/**
*
* This function handles interrupts for receive status updates which include
* overrun errors, framing errors, parity errors, and the break interrupt.
*
* @param InstancePtr is a pointer to the XUartNs550 instance.
*
* @return   None.
*
* @note
*
* If this handler executes and data is not supposed to be received, then
* this probably means data is being received that contains errors and the
* the user may need to clear the receive FIFOs to dump the data.
*
*****************************************************************************/
static void ReceiveStatusHandler(circularUART_t *cuart)
{
   u32 LsrRegister;
   uint32_t ReceivedCount = 0;

   /*
    * If there are bytes still to be received in the specified buffer
    * go ahead and receive them
    */
   ReceivedCount = CircularUART_ReceiveCircBuffer(cuart);

   if (ReceivedCount == 0)
   {
      /*
       * Reading the ID register clears the currently asserted
       * interrupts and this must be done since there was no data
       * to receive, update the status for the status read
       */
      LsrRegister = XUartNs550_GetLineStatusReg(cuart->uart.BaseAddress);
      CircularUART_UpdateStats(cuart, (u8)LsrRegister);
   }

   cuart->errorCount++;

   /*
    * Call the application handler to indicate that there is a receive
    * error or a break interrupt, if the application cares about the
    * error it call a function to get the last errors
    */
   if (cuart->uart.Handler != NULL)
      cuart->uart.Handler(cuart->uart.CallBackRef, XUN_EVENT_RECV_ERROR, ReceivedCount);

   /*
    * Update the receive stats to reflect the receive interrupt
    */
   cuart->uart.Stats.StatusInterrupts++;
}

/****************************************************************************/
/**
*
* This function handles the interrupt when data is received, either a single
* byte when FIFOs are not enabled, or multiple bytes with the FIFO.
*
* @param InstancePtr is a pointer to the XUartNs550 instance.
*
* @return   None.
*
* @note     None.
*
*****************************************************************************/
static void ReceiveDataHandler(circularUART_t *cuart)
{
   u32 Event;
   unsigned int ReceivedCount = 0;

   /*
    * If there are bytes still to be received in the specified buffer
    * go ahead and receive them
    */
   ReceivedCount = CircularUART_ReceiveCircBuffer(cuart);

   Event = XUN_EVENT_RECV_DATA;

   // XUN_EVENT_RECV_TIMEOUT not used for circular buffer

   /*
    * Call the application handler to indicate that there is a receive
    * timeout or data event
    */
   if (cuart->uart.Handler != NULL)
      cuart->uart.Handler(cuart->uart.CallBackRef, Event, ReceivedCount);

   /*
    * Update the receive stats to reflect the receive interrupt
    */
   cuart->uart.Stats.ReceiveInterrupts++;
}

/****************************************************************************/
/**
*
* This function handles the interrupt when data has been sent, the transmit
* FIFO is empty (transmitter holding register).
*
* @param InstancePtr is a pointer to the XUartNs550 instance.
*
* @return   None.
*
* @note     None.
*
*****************************************************************************/
static void SendDataHandler(circularUART_t *cuart)
{
   u32 IerRegister;

   /*
    * If there are not bytes to be sent from the specified buffer then
    * disable the transmit interrupt so it will stop interrupting as it
    * interrupts any time the FIFO is empty
    */
   if ((cuart->txCircBuffer == NULL) || (CBB_Empty(cuart->txCircBuffer))) {
      IerRegister = XUartNs550_ReadReg(cuart->uart.BaseAddress,
                     XUN_IER_OFFSET);
      XUartNs550_WriteReg(cuart->uart.BaseAddress, XUN_IER_OFFSET,
             IerRegister & ~XUN_IER_TX_EMPTY);

      /*
       * Call the application handler to indicate the data
       * has been sent
       */
      if (cuart->uart.Handler != NULL)
      {
         cuart->uart.Handler(cuart->uart.CallBackRef, XUN_EVENT_SENT_DATA, 0);
      }
   }

   /*
    * Otherwise there is still more data to send in the specified buffer
    * so go ahead and send it
    */
   else {
      CircularUART_SendCircBuffer(cuart);
   }

   /*
    * Update the transmit stats to reflect the transmit interrupt
    */
   cuart->uart.Stats.TransmitInterrupts++;
}

/****************************************************************************/
/**
*
* This function handles modem interrupts. It does not do any processing
* except to call the application handler to indicate a modem event.
*
* @param InstancePtr is a pointer to the XUartNs550 instance.
*
* @return   None.
*
* @note     None.
*
*****************************************************************************/
static void ModemHandler(circularUART_t *cuart)
{
   u32 MsrRegister;

   /*
    * Read the modem status register so that the interrupt is acknowledged
    * and so that it can be passed to the callback handler with the event
    */
   MsrRegister = XUartNs550_ReadReg(cuart->uart.BaseAddress,
                  XUN_MSR_OFFSET);

   /*
    * Call the application handler to indicate the modem status changed,
    * passing the modem status and the event data in the call
    */
   if (cuart->uart.Handler != NULL)
      cuart->uart.Handler(cuart->uart.CallBackRef, XUN_EVENT_MODEM, (u8) MsrRegister);

   /*
    * Update the modem stats to reflect the modem interrupt
    */
   cuart->uart.Stats.ModemInterrupts++;
}

/**
 * Copy data contained in the TX circular byte buffer into UART TX FIFO.
 *
 * @param cuart is the pointer to the circular buffer UART data structure.
 *
 * @return the number of characters that have been transmit.
 */
uint32_t CircularUART_SendCircBuffer(circularUART_t *cuart)
{
   unsigned int SentCount = 0;
   unsigned int BytesToSend = 0;   /* default to not send anything */
   unsigned int FifoSize;
   unsigned char byte;
   u32 LsrRegister;
   u32 IirRegister;
   u32 IerRegister;

   if (cuart == NULL) return 0;
   if (cuart->txCircBuffer == NULL) return 0;

   /*
    * Read the line status register to determine if the transmitter is
    * empty
    */
   LsrRegister = XUartNs550_GetLineStatusReg(cuart->uart.BaseAddress);

   /*
    * If the transmitter is not empty then don't send any data, the empty
    * room in the FIFO is not available
    */
   if (LsrRegister & XUN_LSR_TX_BUFFER_EMPTY) {
      /*
       * Read the interrupt ID register to determine if FIFOs
       * are enabled
       */
      IirRegister = XUartNs550_ReadReg(cuart->uart.BaseAddress,
                     XUN_IIR_OFFSET);

      /*
       * When there are FIFOs, send up to the FIFO size. When there
       * are no FIFOs, only send 1 byte of data
       */
      if (IirRegister & XUN_INT_ID_FIFOS_ENABLED) {
         /*
          * Determine how many bytes can be sent depending on if
          * the transmitter is empty, a FIFO size of N is really
          * N - 1 plus the transmitter register
          */
         if (LsrRegister & XUN_LSR_TX_EMPTY) {
            FifoSize = XUN_FIFO_SIZE;
         } else {
            FifoSize = XUN_FIFO_SIZE - 1;
         }

         /*
          * FIFOs are enabled, if the number of bytes to send
          * is less than the size of the FIFO, then send all
          * bytes, otherwise fill the FIFO
          */
         if (CBB_Length(cuart->txCircBuffer) < FifoSize) {
            BytesToSend = CBB_Length(cuart->txCircBuffer);
         } else {
            BytesToSend = FifoSize;
         }
      } else if (!CBB_Empty(cuart->txCircBuffer)) {
         /*
          * Without FIFOs, we can only send 1 byte. We needed to
          * check for non-zero remaining bytes in case this
          * routine was called only to kick the transmitter and
          * enable the UART interrupt
          */
         BytesToSend = 1;
      }

      /*
       * Fill the FIFO if it's present or the transmitter only from
       * the the buffer that was specified
       */
      for (SentCount = 0; SentCount < BytesToSend; SentCount++) {
         CBB_Pop(cuart->txCircBuffer, &byte);
         XUartNs550_WriteReg(cuart->uart.BaseAddress, XUN_THR_OFFSET, byte);
      }
   }
   /*
    * Increment associated counters
    */
   cuart->uart.Stats.CharactersTransmitted += SentCount;

   /*
    * If interrupts are enabled as indicated by the receive interrupt, then
    * enable the transmit interrupt, it is not enabled continuously because
    * it causes an interrupt whenever the FIFO is empty
    */
   IerRegister = XUartNs550_ReadReg(cuart->uart.BaseAddress, XUN_IER_OFFSET);
   if (IerRegister & XUN_IER_RX_DATA) {
      XUartNs550_WriteReg(cuart->uart.BaseAddress, XUN_IER_OFFSET,
             IerRegister | XUN_IER_TX_EMPTY);
   }
   /*
    * Return the number of bytes that were sent, althought they really were
    * only put into the FIFO, not completely sent yet
    */
   return SentCount;
}

/**
 * Copy data contained in the UART RX FIFO into the RX circular byte buffer.
 *
 * @param cuart is the pointer to the circular buffer UART data structure.
 *
 * @return the number of characters that have been received.
 */
uint32_t CircularUART_ReceiveCircBuffer(circularUART_t *cuart)
{
   u32 LsrRegister;
   unsigned int ReceivedCount = 0;

   if (cuart == NULL) return 0;
   if (cuart->rxCircBuffer == NULL) return 0;

   /*
    * Loop until there is not more data buffered by the UART or the
    * specified number of bytes is received
    */
   while (!CBB_Full(cuart->rxCircBuffer)) {

      /*
       * Read the Line Status Register to determine if there is any
       * data in the receiver/FIFO
       */
      LsrRegister = XUartNs550_GetLineStatusReg(cuart->uart.BaseAddress);

      /*
       * If there is a break condition then a zero data byte was put
       * into the receiver, just read it and dump it and update the
       * stats
       */
      if (LsrRegister & XUN_LSR_BREAK_INT) {
         (void)XUartNs550_ReadReg(cuart->uart.BaseAddress,
                     XUN_RBR_OFFSET);
         CircularUART_UpdateStats(cuart, (u8)LsrRegister);
      }

      /*
       * If there is data ready to be removed, then put the next byte
       * received into the specified buffer and update the stats to
       * reflect any receive errors for the byte
       */
      else if (LsrRegister & XUN_LSR_DATA_READY) {
         CBB_Push(cuart->rxCircBuffer, (u8)XUartNs550_ReadReg(cuart->uart.BaseAddress, XUN_RBR_OFFSET));

         ReceivedCount++;
         CircularUART_UpdateStats(cuart, (u8)LsrRegister);
      }

      /*
       * There's no more data to buffer, so exit such that this
       * function does not block waiting for data
       */
      else {
         break;
      }
   }

   /*
    * Increment associated counters in the statistics
    */
   cuart->uart.Stats.CharactersReceived += ReceivedCount;

   return ReceivedCount;
}
