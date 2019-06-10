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

static void CircularUART_InterruptHandler(circularUART_t *cuart);
static uint32_t CircularUART_SendCircBuffer(circularUART_t *cuart);
static uint32_t CircularUART_ReceiveCircBuffer(circularUART_t *cuart);

static void NoInterruptHandler(circularUART_t *cuart);
static void ReceiveStatusHandler(circularUART_t *cuart);
static void ReceiveDataHandler(circularUART_t *cuart);
static void SendDataHandler(circularUART_t *cuart);
static void ModemHandler(circularUART_t *cuart);

#define CircularUART_UpdateStats(cuart, arg)  \
{                       \
   if (cuart->uartType == Ns550) {                   \
      cuart->uart.Ns550.LastErrors |= arg;  \
                        \
      if (arg & XUN_LSR_OVERRUN_ERROR) {      \
	   cuart->uart.Ns550.Stats.ReceiveOverrunErrors++;   \
   }                    \
      if (arg & XUN_LSR_PARITY_ERROR) {       \
         cuart->uart.Ns550.Stats.ReceiveParityErrors++;    \
      }                                              \
      if (arg & XUN_LSR_FRAMING_ERROR) {      \
	   cuart->uart.Ns550.Stats.ReceiveFramingErrors++;   \
   }                    \
      if (arg & XUN_LSR_BREAK_INT) {          \
	   cuart->uart.Ns550.Stats.ReceiveBreakDetected++;   \
   }                    \
   }                                                 \
   else  {                                            \
      if ((arg) & XUL_SR_OVERRUN_ERROR)    \
      {                    \
         cuart->uart.Lite.Stats.ReceiveOverrunErrors++; \
      }                    \
      if ((arg) & XUL_SR_PARITY_ERROR)     \
      {                    \
         cuart->uart.Lite.Stats.ReceiveParityErrors++;  \
      }                    \
      if ((arg) & XUL_SR_FRAMING_ERROR)    \
      {                    \
         cuart->uart.Lite.Stats.ReceiveFramingErrors++; \
      }                    \
   }                                                     \
}





typedef void (*handler)(circularUART_t *cuart);

static handler HandlerTable[13] = {
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
      uint16_t uartIntrId,
      CircularUART_Handler Handler,
      void *callbackRef,
      uartType_t type)
{
   
   if (cuart == NULL) return IRC_FAILURE;
   if (intc == NULL) return IRC_FAILURE;

   CircularUART_SetUartType(cuart, type);



   // Initialize CUART data structure
   cuart->intc = intc;
   cuart->uartIntrId = uartIntrId;


   /*
    * Initialize the UART driver so that it's ready to use.
    */

   if (cuart->uartType == Ns550) {
      if(XUartNs550_Initialize(&cuart->uart.Ns550, uartDeviceId) != XST_SUCCESS) return IRC_FAILURE;
   }
   else {
      if(XUartLite_Initialize(&cuart->uart.Lite, uartDeviceId) != XST_SUCCESS) return IRC_FAILURE;

      cuart->uart.Lite.SendBuffer.RemainingBytes = 0;
      cuart->uart.Lite.SendBuffer.RequestedBytes = 0;

   }

   /*
    * Perform a self-test to ensure that the hardware was built correctly.
    */
   if (cuart->uartType == Ns550) {
      if(XUartNs550_SelfTest(&cuart->uart.Ns550) != XST_SUCCESS) return IRC_FAILURE;
   }
   else {
      //if(XUartLite_SelfTest(&cuart->uart.Lite) != XST_SUCCESS) return IRC_FAILURE;
   }

   /*
    * Connect a device driver handler that will be called when an interrupt
    * for the device occurs, the device driver handler performs the specific
    * interrupt processing for the device.
    */
   if (XIntc_Connect(cuart->intc, cuart->uartIntrId,
         (XInterruptHandler)CircularUART_InterruptHandler, cuart) != XST_SUCCESS) return IRC_FAILURE;

   /*
    * Enable the interrupt of the UART so interrupts will occur and keep the
    * FIFOs enabled.
    */
   if (cuart->uartType == Ns550) {
   uint16_t uartOptions = XUN_OPTION_RXLINE_INTR | XUN_OPTION_DATA_INTR | XUN_OPTION_FIFOS_ENABLE;
   XUartNs550_SetOptions(&cuart->uart.Ns550, uartOptions);
   }
   else {
      XUartLite_EnableInterrupt(&cuart->uart.Lite);
   }

   CircularUART_SetCircularBuffers(cuart, NULL, NULL);
   CircularUART_SetHandler(cuart, Handler , callbackRef);

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

IRC_Status_t CircularUART_SetHandler(circularUART_t *cuart, CircularUART_Handler CtrlInft_Handler, void *callbackRef)

{
   if (cuart == NULL) return IRC_FAILURE;

      if (cuart->uartType == Ns550) {
         if (CtrlInft_Handler == NULL) return IRC_FAILURE;
           cuart->Handler = CtrlInft_Handler;
           cuart->CallBackRef = callbackRef;
      }
      else {
         if (CtrlInft_Handler == NULL) return IRC_FAILURE;

         cuart->Handler = CtrlInft_Handler;
         cuart->CallBackRef= callbackRef;

      }

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

   if (cuart->uartType == Ns550) {
      // Reset circular UART FIFO
      if (CircularUART_ResetFifo(cuart) != XST_SUCCESS)  return IRC_FAILURE;
   }
   else {

   }

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
uint32_t CircularUART_SendData(circularUART_t *cuart, uint32_t buflen)
{

   u32 StatusRegister;

   if (cuart == NULL) return IRC_FAILURE;
   if (buflen < 0) return IRC_FAILURE;

   if (cuart->uartType == Lite) {
   /*
    * Enter a critical region by disabling the UART interrupts to allow
    * this call to stop a previous operation that may be interrupt driven.
    */
   StatusRegister = XUartLite_GetStatusReg(cuart->uart.Lite.RegBaseAddress);

   XUartLite_WriteReg(cuart->uart.Lite.RegBaseAddress,
            XUL_CONTROL_REG_OFFSET, 0);

   cuart->uart.Lite.SendBuffer.RemainingBytes = buflen;
   cuart->uart.Lite.SendBuffer.RequestedBytes = buflen;

   /*
    * Restore the interrupt enable register to it's previous value such
    * that the critical region is exited.
    * This is done here to minimize the amount of time the interrupt is
    * disabled since there is only one interrupt and the receive could
    * be filling up while interrupts are blocked.
    */

   StatusRegister &= XUL_CR_ENABLE_INTR;
   XUartLite_WriteReg(cuart->uart.Lite.RegBaseAddress,
            XUL_CONTROL_REG_OFFSET, StatusRegister);
   }

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

   if (cuart->uartType == Ns550) {

   /*
    * Read the interrupt ID register to determine which, only one,
    * interrupt is active
    */
      isrStatus = (uint8_t)XUartNs550_ReadReg(cuart->uart.Ns550.BaseAddress,
               XUN_IIR_OFFSET) &
               XUN_INT_ID_MASK;

   /*
    * Make sure the handler table has a handler defined for the interrupt
    * that is active, and then call the handler
    */
   if (HandlerTable[isrStatus] == NULL) return;

   HandlerTable[isrStatus](cuart);
   }
   else {
      // XUartLite

      /*
       * Read the status register to determine which, coulb be both
       * interrupt is active
       */
      isrStatus = XUartLite_ReadReg(cuart->uart.Lite.RegBaseAddress,
                  XUL_STATUS_REG_OFFSET);

      if ((isrStatus & (XUL_SR_RX_FIFO_FULL |
         XUL_SR_RX_FIFO_VALID_DATA)) != 0) {
         ReceiveDataHandler(cuart);
      }

      if (((isrStatus & XUL_SR_TX_FIFO_EMPTY) != 0) &&
            (cuart->uart.Lite.SendBuffer.RequestedBytes > 0)) {
         SendDataHandler(cuart);
      }
   }
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
   LsrRegister = XUartNs550_GetLineStatusReg(cuart->uart.Ns550.BaseAddress);

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
      LsrRegister = XUartNs550_GetLineStatusReg(cuart->uart.Ns550.BaseAddress);
      CircularUART_UpdateStats(cuart, (u8)LsrRegister);
   }

   cuart->errorCount++;

   /*
    * Call the application handler to indicate that there is a receive
    * error or a break interrupt, if the application cares about the
    * error it call a function to get the last errors
    */
     if (cuart->Handler != NULL)
      cuart->Handler(cuart->CallBackRef, XUN_EVENT_RECV_ERROR, ReceivedCount);


   /*
    * Update the receive stats to reflect the receive interrupt
    */
   cuart->uart.Ns550.Stats.StatusInterrupts++;
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
   unsigned int ReceivedCount = 0;


   if (cuart->uartType == Ns550) {
      u32 Event;

      //if (RemainingBytes != 0) {
   ReceivedCount = CircularUART_ReceiveCircBuffer(cuart);
      //}

      //if (RemainingBytes != 0) {

      //   Event = XUN_EVENT_RECV_TIMEOUT;
      //}
      //else {

   Event = XUN_EVENT_RECV_DATA;

      //}

   // XUN_EVENT_RECV_TIMEOUT not used for circular buffer

   /*
    * Call the application handler to indicate that there is a receive
    * timeout or data event
    */
   if (cuart->Handler != NULL)
      cuart->Handler(cuart->CallBackRef, Event, ReceivedCount);
   /*
    * Update the receive stats to reflect the receive interrupt
    */
   cuart->uart.Ns550.Stats.ReceiveInterrupts++;
   }
   else{

         ReceivedCount = CircularUART_ReceiveCircBuffer(cuart);

      /*
       * If the last byte of a message was received then call the application
       * handler, this code should not use an else from the previous check of
       * the number of bytes to receive because the call to receive the buffer
       * updates the bytes to receive
       */

        if (cuart->Handler != NULL) {
           cuart->Handler(cuart->CallBackRef, XUN_EVENT_RECV_DATA, ReceivedCount);
        }

         /*
          * Update the receive stats to reflect the receive interrupt
          */
         cuart->uart.Lite.Stats.ReceiveInterrupts++;
   }
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


   if (cuart->uartType == Ns550) {
      u32 IerRegister;

      /*
       * If there are not bytes to be sent from the specified buffer then
       * disable the transmit interrupt so it will stop interrupting as it
       * interrupts any time the FIFO is empty
       */

   if ((cuart->txCircBuffer == NULL) || (CBB_Empty(cuart->txCircBuffer))) {

         IerRegister = XUartNs550_ReadReg(cuart->uart.Ns550.BaseAddress,
                     XUN_IER_OFFSET);
         XUartNs550_WriteReg(cuart->uart.Ns550.BaseAddress, XUN_IER_OFFSET,
             IerRegister & ~XUN_IER_TX_EMPTY);

      /*
       * Call the application handler to indicate the data
       * has been sent
       */
         if (cuart->Handler != NULL) {
            cuart->Handler(cuart->CallBackRef, XUN_EVENT_SENT_DATA, 0);

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
   cuart->uart.Ns550.Stats.TransmitInterrupts++;
   }
   else {

   /*
    * If there are not bytes to be sent from the specified buffer,
    * call the callback function
    */
      //if (CBB_Empty(cuart->txCircBuffer)) {
      if (cuart->uart.Lite.SendBuffer.RemainingBytes == 0) {
         int SaveReq;

        /*
          * Save and zero the requested bytes since transmission
          * is complete
          */
         SaveReq = cuart->uart.Lite.SendBuffer.RequestedBytes;
         cuart->uart.Lite.SendBuffer.RequestedBytes = 0;

        /*
           * Call the application handler to indicate
           * the data has been sent
           */
      if (cuart->Handler != NULL) {
            cuart->Handler(cuart->CallBackRef, XUN_EVENT_SENT_DATA, SaveReq);
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
   cuart->uart.Lite.Stats.TransmitInterrupts++;

   }
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
   MsrRegister = XUartNs550_ReadReg(cuart->uart.Ns550.BaseAddress,
                  XUN_MSR_OFFSET);

   /*
    * Call the application handler to indicate the modem status changed,
    * passing the modem status and the event data in the call
    */
   if (cuart->Handler != NULL)
      cuart->Handler(cuart->CallBackRef, XUN_EVENT_MODEM, (u8) MsrRegister);

   /*
    * Update the modem stats to reflect the modem interrupt
    */
   cuart->uart.Ns550.Stats.ModemInterrupts++;
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
   if (cuart == NULL) return 0;
   if (cuart->txCircBuffer == NULL) return 0;

   unsigned char byte;
   unsigned int SentCount = 0;

   if (cuart->uartType == Ns550) {

   unsigned int BytesToSend = 0;   /* default to not send anything */
   unsigned int FifoSize;

   u32 LsrRegister;
   u32 IirRegister;
   u32 IerRegister;



   /*
    * Read the line status register to determine if the transmitter is
    * empty
    */
      LsrRegister = XUartNs550_GetLineStatusReg(cuart->uart.Ns550.BaseAddress);

   /*
    * If the transmitter is not empty then don't send any data, the empty
    * room in the FIFO is not available
    */
   if (LsrRegister & XUN_LSR_TX_BUFFER_EMPTY) {
      /*
       * Read the interrupt ID register to determine if FIFOs
       * are enabled
       */
         IirRegister = XUartNs550_ReadReg(cuart->uart.Ns550.BaseAddress,
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
            XUartNs550_WriteReg(cuart->uart.Ns550.BaseAddress, XUN_THR_OFFSET, byte);
      }

   }
   /*
    * Increment associated counters
    */
   cuart->uart.Ns550.Stats.CharactersTransmitted += SentCount;

   /*
    * If interrupts are enabled as indicated by the receive interrupt, then
    * enable the transmit interrupt, it is not enabled continuously because
    * it causes an interrupt whenever the FIFO is empty
    */
   IerRegister = XUartNs550_ReadReg(cuart->uart.Ns550.BaseAddress, XUN_IER_OFFSET);
   if (IerRegister & XUN_IER_RX_DATA) {
      XUartNs550_WriteReg(cuart->uart.Ns550.BaseAddress, XUN_IER_OFFSET,
             IerRegister | XUN_IER_TX_EMPTY);
   }
   /*
    * Return the number of bytes that were sent, althought they really were
    * only put into the FIFO, not completely sent yet
    */
   return SentCount;
   }
   else {
      // Uart Lite

      u8 StatusRegister;
      u8 IntrEnableStatus;
      /*
       * Read the status register to determine if the transmitter is full
       */
      StatusRegister = XUartLite_GetStatusReg(cuart->uart.Lite.RegBaseAddress);

      /*
       * Enter a critical region by disabling all the UART interrupts to allow
       * this call to stop a previous operation that may be interrupt driven
       */
      XUartLite_WriteReg(cuart->uart.Lite.RegBaseAddress, XUL_CONTROL_REG_OFFSET, 0);

      /*
       * Save the status register contents to restore the interrupt enable
       * register to it's previous value when that the critical region is
       * exited
       */
      IntrEnableStatus = StatusRegister;

      /*
       * Fill the FIFO from the the buffer that was specified
       */

      while (((StatusRegister & XUL_SR_TX_FIFO_FULL) == 0) &&
            (SentCount < cuart->uart.Lite.SendBuffer.RemainingBytes)) {

         CBB_Pop(cuart->txCircBuffer, &byte);


         XUartLite_WriteReg(cuart->uart.Lite.RegBaseAddress, XUL_TX_FIFO_OFFSET, byte);

         SentCount++;

         StatusRegister =
            XUartLite_GetStatusReg(cuart->uart.Lite.RegBaseAddress);
      }

      cuart->uart.Lite.SendBuffer.RemainingBytes -= SentCount;

      /*
       * Increment associated counters
       */
      cuart->uart.Lite.Stats.CharactersTransmitted += SentCount;

      /*
       * Restore the interrupt enable register to it's previous value such
       * that the critical region is exited
       */

      IntrEnableStatus &= XUL_CR_ENABLE_INTR;
      XUartLite_WriteReg(cuart->uart.Lite.RegBaseAddress, XUL_CONTROL_REG_OFFSET,
              IntrEnableStatus);

      /*
       * Return the number of bytes that were sent, althought they really were
       * only put into the FIFO, not completely sent yet
       */
      return SentCount;
   }
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
   unsigned int ReceivedCount = 0;

   if (cuart == NULL) return 0;
   if (cuart->rxCircBuffer == NULL) return 0;


   if (cuart->uartType == Ns550) {
      u32 LsrRegister;


   /*
    * Loop until there is not more data buffered by the UART or the
    * specified number of bytes is received
    */
   while (!CBB_Full(cuart->rxCircBuffer)) {
      /*
       * Read the Line Status Register to determine if there is any
       * data in the receiver/FIFO
       */
         LsrRegister = XUartNs550_GetLineStatusReg(cuart->uart.Ns550.BaseAddress);

      /*
       * If there is a break condition then a zero data byte was put
       * into the receiver, just read it and dump it and update the
       * stats
       */
      if (LsrRegister & XUN_LSR_BREAK_INT) {
            (void)XUartNs550_ReadReg(cuart->uart.Ns550.BaseAddress,
                     XUN_RBR_OFFSET);
         CircularUART_UpdateStats(cuart, (u8)LsrRegister);
      }

      /*
       * If there is data ready to be removed, then put the next byte
       * received into the specified buffer and update the stats to
       * reflect any receive errors for the byte
       */
      else if (LsrRegister & XUN_LSR_DATA_READY) {
         CBB_Push(cuart->rxCircBuffer, (u8)XUartNs550_ReadReg(cuart->uart.Ns550.BaseAddress, XUN_RBR_OFFSET));
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
      cuart->uart.Ns550.Stats.CharactersReceived += ReceivedCount;

   return ReceivedCount;
   }
   else {
      // Uart Lite
      u8 StatusRegister;
      u8 StatusRegisterVal;



      /*
       * Enter a critical region by disabling all the UART interrupts to allow
       * this call to stop a previous operation that may be interrupt driven
       */
      StatusRegisterVal = XUartLite_GetStatusReg(cuart->uart.Lite.RegBaseAddress);
      XUartLite_WriteReg(cuart->uart.Lite.RegBaseAddress,
               XUL_CONTROL_REG_OFFSET, 0);


      /*
       * Loop until there is not more data buffered by the UART or the
       * specified number of bytes is received
       */

      //while (!CBB_Full(cuart->rxCircBuffer) && (ReceivedCount < XUL_FIFO_SIZE)) {
      while (!CBB_Full(cuart->rxCircBuffer)) {
         /*
          * Read the Status Register to determine if there is any data in
          * the receiver/FIFO
          */
         StatusRegister =
            XUartLite_GetStatusReg(cuart->uart.Lite.RegBaseAddress);

         /*
          * If there is data ready to be removed, then put the next byte
          * received into the specified buffer and update the stats to
          * reflect any receive errors for the byte
          */
         if (StatusRegister & XUL_SR_RX_FIFO_VALID_DATA) {
            CBB_Push(cuart->rxCircBuffer, (u8)XUartLite_ReadReg(cuart->uart.Lite.RegBaseAddress, XUL_RX_FIFO_OFFSET));
            ReceivedCount++;
            CircularUART_UpdateStats(cuart, StatusRegister);
 }

         /*
          * There's no more data buffered, so exit such that this
          * function does not block waiting for data
          */
         else {
               break;
         }
      }

      /*
       * Increment associated counters in the statistics
       */
      cuart->uart.Lite.Stats.CharactersReceived += ReceivedCount;

      /*
       * Restore the interrupt enable register to it's previous value such
       * that the critical region is exited
       */
      StatusRegisterVal &= XUL_CR_ENABLE_INTR;
      XUartLite_WriteReg(cuart->uart.Lite.RegBaseAddress,
               XUL_CONTROL_REG_OFFSET, StatusRegisterVal);

      return ReceivedCount;

   }
}

IRC_Status_t CircularUART_Config(circularUART_t *cuart,
      uint32_t baudRate,
      uint8_t dataBits,
      char parity,
      uint8_t stopBits)
{
   if (cuart->uartType == Ns550) {
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
      status = XUartNs550_SetDataFormat(&cuart->uart.Ns550, &uartFormat);
      if (status != XST_SUCCESS)
      {
         return IRC_FAILURE;
      }
   }
   else {
   // UART Lite config is set at build time.
   }
   return IRC_SUCCESS;
}


IRC_Status_t CircularUART_ResetFifo(circularUART_t *cuart)
{
   if (cuart->uartType == Ns550) {

      // Reset circular UART 550 RX FIFO
      uint16_t currentOptions = XUartNs550_GetOptions(&cuart->uart.Ns550);

      if (XUartNs550_SetOptions(&cuart->uart.Ns550 , currentOptions | XUN_OPTION_RESET_RX_FIFO) != XST_SUCCESS)
      {
         return IRC_FAILURE;
      }

      if (XUartNs550_SetOptions(&cuart->uart.Ns550, currentOptions) != XST_SUCCESS)
      {
         return IRC_FAILURE;
      }
   }
   else {
         // Reset circular UART Lite RX & TX FIFOs

         XUartLite_ResetFifos(&cuart->uart.Lite);
   }
   return IRC_SUCCESS;
}

IRC_Status_t CircularUART_SetUartType(circularUART_t *cuart, uartType_t uartType)
{
   if (cuart == NULL) return 0;

   if (uartType == Ns550 || uartType == Lite){

      cuart->uartType = uartType;

            return IRC_SUCCESS;
   }
   else {
      return IRC_FAILURE;
   }
}

