/**
 * @file CtrlInterface.c
 * Control interface module implementation.
 *
 * This file implements the control interface module.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "CtrlInterface.h"
#include "UART_Utils.h"
#include "Protocol_F1F2.h"
#include "Protocol_Pleora.h"
#include <stdio.h> // For NULL
#include <string.h> // For memcpy

uint32_t CtrlIntf_ReceiveCircularBuffer(ctrlIntf_t *ctrlIntf);
IRC_Status_t CtrlIntf_CommandParser(ctrlIntf_t *ctrlIntf, F1F2Command_t *f1f2Cmd);
uint32_t CtrlIntf_CommandBuilder(ctrlIntf_t *ctrlIntf, F1F2Command_t *f1f2Cmd);
IRC_Status_t CtrlIntf_Recv(ctrlIntf_t *ctrlIntf);
IRC_Status_t CtrlIntf_Send(ctrlIntf_t *ctrlIntf, F1F2Command_t *f1f2Cmd);
void CtrlIntf_IntrHandler(void *CallBackRef, u32 Event, unsigned int EventData);
void CtrlIntf_UARTIntrHandler(void *CallBackRef, u32 Event, unsigned int EventData);
void CtrlIntf_CUARTIntrHandler(void *CallBackRef, u32 Event, unsigned int EventData);
void CtrlIntf_USARTIntrHandler(void *CallBackRef, u32 Event, unsigned int EventData);

/**
 * Initializes generic UART control interface.
 *
 * @param ctrlIntf is the pointer to the control interface data structure.
 * @param protocol is the control protocol used.
 * @param uartDeviceId is the UART device ID that can be found in xparameters.h file.
 * @param intc is the pointer to the Interrupt controller instance.
 * @param uartIntrId is the UART interrupt ID that can be found in xparameters.h file.
 * @param rxBuffer is a pointer to the received data buffer.
 * @param rxBufferSize is the size of received data buffer.
 * @param rxCircBuffer is a pointer to the buffer used to initialize received data circular buffer.
 * @param rxCircBufferSize is the size of the buffer used to initialize received data circular buffer.
 * @param txBuffer is a pointer to the sent data buffer.
 * @param txBufferSize is the size of sent data buffer.
 * @param netIntf is the network interface pointer.
 * @param cmdQueue is the command queue pointer.
 * @param niPort is the network port of the control interface.
 *
 * @return IRC_SUCCESS if successfully initialized
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t CtrlIntf_InitUART(ctrlIntf_t *ctrlIntf,
      ciProtocol_t protocol,
      uint16_t uartDeviceId,
      XIntc *intc,
      uint16_t uartIntrId,
      uint8_t *rxBuffer,
      uint16_t rxBufferSize,
      uint8_t *rxCircBuffer,
      uint16_t rxCircBufferSize,
      uint8_t *txBuffer,
      uint16_t txBufferSize,
      netIntf_t *netIntf,
      circBuffer_t *cmdQueue,
      niPort_t niPort)
{
   IRC_Status_t status;

   memset(ctrlIntf, 0, sizeof(ctrlIntf_t));

   status = UART_Init(&ctrlIntf->link.uart,
         uartDeviceId,
         intc,
         uartIntrId,
         CtrlIntf_IntrHandler,
         ctrlIntf);
   if (status != IRC_SUCCESS)
   {
      CI_ERR("Failed to initialize UART port.");
      return IRC_FAILURE;
   }

   ctrlIntf->protocol = protocol;
   ctrlIntf->linkType = CILT_UART;
   ctrlIntf->intc = intc;
   ctrlIntf->linkIntrId = uartIntrId;
   ctrlIntf->rxDataBuffer = rxBuffer;
   ctrlIntf->rxDataBufferSize = rxBufferSize;
   ctrlIntf->txDataBuffer = txBuffer;
   ctrlIntf->txDataBufferSize = txBufferSize;
   ctrlIntf->port.port = niPort;
   ctrlIntf->port.cmdQueue = cmdQueue;
   GETTIME(&ctrlIntf->tic_errorCount);

   if (CBB_Init(&ctrlIntf->rxCircDataBuffer, rxCircBuffer, rxCircBufferSize) != IRC_SUCCESS)
   {
      CI_ERR("Failed to initialize RX circular buffer.");
      return IRC_FAILURE;
   }

   // Connect control interface to network interface
   if (NetIntf_Connect(netIntf, &ctrlIntf->port) != IRC_SUCCESS)
   {
      CI_ERR("Failed to connect to network interface.");
      return IRC_FAILURE;
   }

   return CtrlIntf_Recv(ctrlIntf);
}

/**
 * Initializes circular buffer UART control interface.
 *
 * @param ctrlIntf is the pointer to the control interface data structure.
 * @param protocol is the control protocol used.
 * @param uartDeviceId is the UART device ID that can be found in xparameters.h file.
 * @param intc is the pointer to the Interrupt controller instance.
 * @param uartIntrId is the UART interrupt ID that can be found in xparameters.h file.
 * @param rxCircBuffer is a pointer to the buffer used to initialize received data circular buffer.
 * @param rxCircBufferSize is the size of the buffer used to initialize received data circular buffer.
 * @param txBuffer is a pointer to the sent data buffer.
 * @param txBufferSize is the size of sent data buffer.
 * @param netIntf is the network interface pointer.
 * @param cmdQueue is the command queue pointer.
 * @param niPort is the network port of the control interface.
 *
 * @return IRC_SUCCESS if successfully initialized
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t CtrlIntf_InitCircularUART(ctrlIntf_t *ctrlIntf,
      ciProtocol_t protocol,
      uint16_t uartDeviceId,
      XIntc *intc,
      uint16_t uartIntrId,
      uint8_t *rxCircBuffer,
      uint16_t rxCircBufferSize,
      uint8_t *txBuffer,
      uint16_t txBufferSize,
      netIntf_t *netIntf,
      circBuffer_t *cmdQueue,
      niPort_t niPort)
{
   IRC_Status_t status;

   memset(ctrlIntf, 0, sizeof(ctrlIntf_t));

   if (CBB_Init(&ctrlIntf->rxCircDataBuffer, rxCircBuffer, rxCircBufferSize) != IRC_SUCCESS)
   {
      CI_ERR("Failed to initialize RX circular buffer.");
      return IRC_FAILURE;
   }

   status = CircularUART_Init(&ctrlIntf->link.cuart,
         uartDeviceId,
         intc,
         uartIntrId,
         CtrlIntf_IntrHandler,
         ctrlIntf,
         &ctrlIntf->rxCircDataBuffer);
   if (status != IRC_SUCCESS)
   {
      CI_ERR("Failed to initialize UART port.");
      return IRC_FAILURE;
   }

   ctrlIntf->protocol = protocol;
   ctrlIntf->linkType = CILT_CUART;
   ctrlIntf->intc = intc;
   ctrlIntf->linkIntrId = uartIntrId;
   ctrlIntf->txDataBuffer = txBuffer;
   ctrlIntf->txDataBufferSize = txBufferSize;
   ctrlIntf->port.port = niPort;
   ctrlIntf->port.cmdQueue = cmdQueue;
   GETTIME(&ctrlIntf->tic_errorCount);

   // Connect control interface to network interface
   if (NetIntf_Connect(netIntf, &ctrlIntf->port) != IRC_SUCCESS)
   {
      CI_ERR("Failed to connect to network interface.");
      return IRC_FAILURE;
   }

   return CtrlIntf_Recv(ctrlIntf);
}

/**
 * Initializes generic USART control interface.
 *
 * @param ctrlIntf is the pointer to the control interface data structure.
 * @param protocol is the control protocol used.
 * @param usartBaseAddress is the USART device base address ID that can be found in tel2000_param.h file.
 * @param intc is the pointer to the Interrupt controller instance.
 * @param usartIntrId is the USART interrupt ID that can be found in xparameters.h file.
 * @param rxCircBuffer is a pointer to the buffer used to initialize received data circular buffer.
 * @param rxCircBufferSize is the size of the buffer used to initialize received data circular buffer.
 * @param txBuffer is a pointer to the sent data buffer.
 * @param txBufferSize is the size of sent data buffer.
 * @param netIntf is the network interface pointer.
 * @param cmdQueue is the command queue pointer.
 * @param niPort is the network port of the control interface.
 *
 * @return IRC_SUCCESS if successfully initialized
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t CtrlIntf_InitUSART(ctrlIntf_t *ctrlIntf,
      ciProtocol_t protocol,
      uint32_t usartBaseAddress,
      XIntc *intc,
      uint16_t usartIntrId,
      uint8_t *rxCircBuffer,
      uint16_t rxCircBufferSize,
      uint8_t *txBuffer,
      uint16_t txBufferSize,
      netIntf_t *netIntf,
      circBuffer_t *cmdQueue,
      niPort_t niPort)
{
   IRC_Status_t status;

   memset(ctrlIntf, 0, sizeof(ctrlIntf_t));

   status = Usart_Init(&ctrlIntf->link.usart,
         usartBaseAddress,
         intc,
         usartIntrId,
         CtrlIntf_IntrHandler,
         ctrlIntf,
         7);
   if (status != IRC_SUCCESS)
   {
      CI_ERR("Failed to initialize USART port.");
      return IRC_FAILURE;
   }


   ctrlIntf->protocol = protocol;
   ctrlIntf->linkType = CILT_USART;
   ctrlIntf->intc = intc;
   ctrlIntf->linkIntrId = usartIntrId;
   ctrlIntf->rxDataBuffer = NULL;
   ctrlIntf->rxDataBufferSize = 0;
   ctrlIntf->txDataBuffer = txBuffer;
   ctrlIntf->txDataBufferSize = txBufferSize;
   ctrlIntf->port.port = niPort;
   ctrlIntf->port.cmdQueue = cmdQueue;
   GETTIME(&ctrlIntf->tic_errorCount);

   if (CBB_Init(&ctrlIntf->rxCircDataBuffer, rxCircBuffer, rxCircBufferSize) != IRC_SUCCESS)
   {
      CI_ERR("Failed to initialize RX circular buffer.");
      return IRC_FAILURE;
   }

   // Connect control interface to network interface
   if (NetIntf_Connect(netIntf, &ctrlIntf->port) != IRC_SUCCESS)
   {
      CI_ERR("Failed to connect to network interface.");
      return IRC_FAILURE;
   }

   return CtrlIntf_Recv(ctrlIntf);
}

/**
 * Move data from RX buffer to RX circular buffer.
 *
 * @param ctrlIntf is the pointer to the control interface data structure.
 *
 * @return the number of bytes that have been moved to RX circular buffer.
 */
uint32_t CtrlIntf_ReceiveCircularBuffer(ctrlIntf_t *ctrlIntf)
{
   uint32_t receivedCount = 0;
   uint32_t byteCount;
   uint32_t ierRegister;

   if (ctrlIntf->rxDataReady)
   {
      switch (ctrlIntf->linkType)
      {
         case CILT_UART:
            // Temporarily disable UART interrupt
            ierRegister = XUartNs550_ReadReg(ctrlIntf->link.uart.BaseAddress, XUN_IER_OFFSET);
            XUartNs550_WriteReg(ctrlIntf->link.uart.BaseAddress, XUN_IER_OFFSET, 0);

            byteCount = ctrlIntf->link.uart.ReceiveBuffer.RequestedBytes - ctrlIntf->link.uart.ReceiveBuffer.RemainingBytes;
            while (byteCount > 0)
            {
               if (CBB_Pushn(&ctrlIntf->rxCircDataBuffer, byteCount, ctrlIntf->rxDataBuffer) == IRC_SUCCESS)
               {
                  receivedCount += byteCount;
               }
               else
               {
                  CI_ERR("Unable to push received data into circular buffer (UART @ 0x%08X)", ctrlIntf->link.uart.BaseAddress);
               }

               byteCount = XUartNs550_Recv(&ctrlIntf->link.uart,
                     ctrlIntf->rxDataBuffer,
                     ctrlIntf->rxDataBufferSize);
            }

            ctrlIntf->rxDataReady = 0;

            // Reactivate UART interrupt
            XUartNs550_WriteReg(ctrlIntf->link.uart.BaseAddress, XUN_IER_OFFSET, ierRegister);
            break;

         case CILT_CUART:
            ctrlIntf->rxDataReady = 0;
            break;

         case CILT_USART:
            if (Usart_ReceiveCircularData(&ctrlIntf->link.usart, &ctrlIntf->rxCircDataBuffer, &byteCount) == IRC_SUCCESS)
            {
               receivedCount += byteCount;
            }
            else
            {
               CI_ERR("Unable to push received data into circular buffer (USART @ 0x%08X)", ctrlIntf->link.usart.BaseAddress);
            }

            ctrlIntf->rxDataReady = 0;
            break;
      }

      if (receivedCount > 0)
      {
         GETTIME(&ctrlIntf->rxByteTime);
      }
   }

   return receivedCount;
}

/**
 * Command parser function.
 *
 * @param ctrlIntf is the pointer to the control interface data structure.
 * @param f1f2Cmd is the pointer to the f1f2 command to fill.
 *
 * @return IRC_SUCCESS if successfully parsed.
 * @return IRC_FAILURE if failed to parse.
 * @return IRC_NOT_DONE if not enough data in buffer.
 */
IRC_Status_t CtrlIntf_CommandParser(ctrlIntf_t *ctrlIntf, F1F2Command_t *f1f2Cmd)
{
   IRC_Status_t status = IRC_FAILURE;
   PleoraCommand_t pleoraCmd;
   uint16_t byteParsed;

   switch (ctrlIntf->protocol)
   {
      case CIP_F1F2:
      case CIP_F1F2_NETWORK:
         status = F1F2_CircCommandParser(&ctrlIntf->rxCircDataBuffer, f1f2Cmd, &byteParsed);
         if (status == IRC_FAILURE)
         {
            // Skip SOP
            byteParsed++;
         }
         break;

      case CIP_PLEORA:
         status = Pleora_CircCommandParser(&ctrlIntf->rxCircDataBuffer, &pleoraCmd, &byteParsed);
         if (status != IRC_NOT_DONE)
         {
            if (Pleora_ConvertToF1F2(&pleoraCmd, f1f2Cmd) == IRC_FAILURE)
            {
               status = IRC_FAILURE;
            }
         }
         break;
   }

   if (status == IRC_FAILURE)
   {
      CI_LINKERR(ctrlIntf, "Invalid command received.");

      if (ctrlIntf->showBytes == 0)
      {
         CI_INF("%d byte(s) in circular buffer", CBB_Length(&ctrlIntf->rxCircDataBuffer));
         CBB_Dump(&ctrlIntf->rxCircDataBuffer, 16);
      }

      ctrlIntf->errorCount++;
      if (ctrlIntf->errorCount > CI_ERROR_COUNTER_THRESHOLD)
      {
         // Disable control interface interrupt
         CI_ERR("Control interface has been disabled (%d errors in %ds).", ctrlIntf->errorCount, CI_ERROR_COUNTER_RESET_US / TIME_ONE_SECOND_US);
         XIntc_Disable(ctrlIntf->intc, ctrlIntf->linkIntrId);
      }
   }

   // Flush parsed bytes from circular buffer
   CBB_Flushn(&ctrlIntf->rxCircDataBuffer, byteParsed);

   return status;
}

/**
 * Command builder function.
 *
 * @param ctrlIntf_t is the pointer to the control interface data structure.
 * @param f1f2Cmd is the pointer to the f1f2 command.
 *
 * @return The command length to be transmitted.
 */
uint32_t CtrlIntf_CommandBuilder(ctrlIntf_t *ctrlIntf, F1F2Command_t *f1f2Cmd)
{
   PleoraCommand_t pleoraCmd;
   IRC_Status_t status;
   uint32_t cmdlen = 0;

   // Build message to transmit from control command
   switch (ctrlIntf->protocol)
   {
      case CIP_F1F2:
      case CIP_F1F2_NETWORK:
         cmdlen = F1F2_CommandBuilder(f1f2Cmd,
               ctrlIntf->txDataBuffer,
               ctrlIntf->txDataBufferSize);
         break;

      case CIP_PLEORA:
         status = Pleora_ConvertFromF1F2(f1f2Cmd, &pleoraCmd);
         if (status == IRC_SUCCESS)
         {
            cmdlen = Pleora_CommandBuilder(&pleoraCmd,
                  ctrlIntf->txDataBuffer,
                  ctrlIntf->txDataBufferSize);
         }
         else
         {
            cmdlen = 0;
         }
         break;

      default:
         return 0;
   }

   if (ctrlIntf->showBytes == 1)
   {
      CI_INF("TX:");
      memdump(ctrlIntf->txDataBuffer, cmdlen, 0, 16);
   }

   return cmdlen;
}

/**
 * Listen for command from specified control interface.
 *
 * @param ctrlIntf is the control interface to listen from.
 *
 * @return IRC_SUCCESS if the receive operation has been completed.
 * @return IRC_FAILURE if the receive operation has not been completed.
 */
IRC_Status_t CtrlIntf_Recv(ctrlIntf_t *ctrlIntf)
{
   if (ctrlIntf == NULL)
   {
      return IRC_FAILURE;
   }

   switch (ctrlIntf->linkType)
   {
      case CILT_UART:
         // Reset RX FIFO
         UART_ResetRxFifo(&ctrlIntf->link.uart);

         // Listen for command on UART
         XUartNs550_Recv(&ctrlIntf->link.uart,
               ctrlIntf->rxDataBuffer,
               ctrlIntf->rxDataBufferSize);
         break;

      case CILT_CUART:
         // Nothing to do
         break;

      case CILT_USART:
         // Nothing to do
         break;
   }

   ctrlIntf->rxByteTime = 0;

   return IRC_SUCCESS;
}

/**
 * Transmit a command through specified control interface.
 *
 * @param ctrlIntf is the control interface used to transmit the command.
 * @param f1f2Cmd is the pointer to the f1f2 command to transmit.
 *
 * @return IRC_SUCCESS if the send operation has been completed.
 * @return IRC_FAILURE if the send operation has not been completed.
 */
IRC_Status_t CtrlIntf_Send(ctrlIntf_t *ctrlIntf, F1F2Command_t *f1f2Cmd)
{
   uint32_t buflen;

   if (ctrlIntf == NULL)
   {
      CI_ERR("Control interface pointer is NULL.");
      return IRC_FAILURE;
   }

   // Build command
   buflen = CtrlIntf_CommandBuilder(ctrlIntf, f1f2Cmd);

   // Transmit command
   if (buflen > 0)
   {
      ctrlIntf->txStatus = CITS_BUSY;

      switch (ctrlIntf->linkType)
      {
         case CILT_UART:
            XUartNs550_Send(&ctrlIntf->link.uart,
                  ctrlIntf->txDataBuffer,
                  buflen);
            break;

         case CILT_CUART:
            XUartNs550_Send(&ctrlIntf->link.cuart.uart,
                  ctrlIntf->txDataBuffer,
                  buflen);
            break;

         case CILT_USART:
            Usart_SendData(&ctrlIntf->link.usart,
                  ctrlIntf->txDataBuffer,
                  buflen);
            break;
      }
   }
   else
   {
      CI_INF("Nothing to transmit.");
   }

   return IRC_SUCCESS;
}

/**
 * Control interface process.
 *
 * @param ctrlIntf_t is the pointer to the control interface data structure.
 */
void CtrlIntf_Process(ctrlIntf_t *ctrlIntf)
{
   IRC_Status_t status;
   networkCommand_t netCmd;
   gcRegister_t *p_register;

   // Error counter reset
   if (elapsed_time_us(ctrlIntf->tic_errorCount) > CI_ERROR_COUNTER_RESET_US)
   {
      ctrlIntf->errorCount = 0;
      GETTIME(&ctrlIntf->tic_errorCount);
   }

   // Receive data
   CtrlIntf_ReceiveCircularBuffer(ctrlIntf);

   if (CBB_Length(&ctrlIntf->rxCircDataBuffer) > 0)
   {
      if (ctrlIntf->showBytes == 1)
      {
         CI_INF("Circular buffer length is %d byte(s)", CBB_Length(&ctrlIntf->rxCircDataBuffer));
         CBB_Dump(&ctrlIntf->rxCircDataBuffer, 16);
      }

      // Parse received data
      status = CtrlIntf_CommandParser(ctrlIntf, &netCmd.f1f2);

      if (status == IRC_SUCCESS)
      {
         netCmd.port = &ctrlIntf->port;

         switch (ctrlIntf->protocol)
         {
            case CIP_F1F2:
            case CIP_PLEORA:
#ifdef CI_REQUEST_PROCESSING_DURATION_TEST
               GETTIME(&ctrlIntf->rxCmdTime);
#endif
               netCmd.f1f2.srcAddr = ctrlIntf->port.netIntf->address;
               netCmd.f1f2.srcPort = ctrlIntf->port.port;

               // Convert standard F1F2 command to F1F2 network command
               switch (netCmd.f1f2.cmd)
               {
                  case F1F2_CMD_REG_READ_REQ:
                  case F1F2_CMD_REG_WRITE:
                     p_register = GC_DecodeAddr(netCmd.f1f2.payload.regRW.address);

                     if (p_register == NULL)
                     {
                        CI_ERR("No register found @ 0x%08X.", netCmd.f1f2.payload.regRW.address);
                        F1F2_BuildNAKResponse(&netCmd.f1f2, &netCmd.f1f2);
                        netCmd.f1f2.destAddr = ctrlIntf->port.netIntf->address;
                        netCmd.f1f2.destPort = ctrlIntf->port.port;
                     }
                     else
                     {
                        netCmd.f1f2.destAddr = p_register->owner;
                        netCmd.f1f2.destPort = NIP_GC_MANAGER;
                     }
                     break;

                  case F1F2_CMD_FILE_COUNT_REQ:
                  case F1F2_CMD_FILE_INFO_REQ:
                  case F1F2_CMD_FILE_CREATE_REQ:
                  case F1F2_CMD_FILE_READ_REQ:
                  case F1F2_CMD_FILE_WRITE:
                  case F1F2_CMD_FILE_CLOSE:
                  case F1F2_CMD_FILE_CHECK_REQ:
                  case F1F2_CMD_FILE_DELETE:
                  case F1F2_CMD_FILE_FORMAT:
                     netCmd.f1f2.destAddr = ctrlIntf->port.netIntf->address;
                     netCmd.f1f2.destPort = NIP_FILE_MANAGER;
                     break;

                  case F1F2_CMD_PROM_ERASE:
                  case F1F2_CMD_PROM_READ_REQ:
                  case F1F2_CMD_PROM_READ_RSP:
                  case F1F2_CMD_PROM_WRITE:
                  case F1F2_CMD_PROM_CHECK_REQ:
                  case F1F2_CMD_PROM_CHECK_RSP:
                     netCmd.f1f2.destAddr = netCmd.f1f2.payload.promRW.device;
                     netCmd.f1f2.destPort = NIP_FIRM_UPDATER;
                     break;

                  case F1F2_CMD_PING:
                     F1F2_BuildACKResponse(&netCmd.f1f2, &netCmd.f1f2);
                     netCmd.f1f2.destAddr = ctrlIntf->port.netIntf->address;
                     netCmd.f1f2.destPort = ctrlIntf->port.port;
                     break;

                  default:
                     CI_ERR("Invalid master request command code.");
                     F1F2_BuildNAKResponse(&netCmd.f1f2, &netCmd.f1f2);
                     netCmd.f1f2.destAddr = ctrlIntf->port.netIntf->address;
                     netCmd.f1f2.destPort = ctrlIntf->port.port;
                     break;
               }
               netCmd.f1f2.isNetwork = 1;
               if (NetIntf_EnqueueCmd(ctrlIntf->port.netIntf, &netCmd) != IRC_SUCCESS)
               {
                  CI_ERR("Failed to push NAK command in network interface command queue.");
               }
               break;

            case CIP_F1F2_NETWORK:
               if (netCmd.f1f2.isNetwork == 1)
               {
                  if ((netCmd.f1f2.cmd == F1F2_CMD_PING) &&
                        (netCmd.f1f2.destAddr == ctrlIntf->port.netIntf->address) &&
                        (netCmd.f1f2.destPort == NIP_UNDEFINED))
                  {
                     F1F2_BuildACKResponse(&netCmd.f1f2, &netCmd.f1f2);
                  }

                  if (NetIntf_EnqueueCmd(ctrlIntf->port.netIntf, &netCmd) != IRC_SUCCESS)
                  {
                     CI_ERR("Failed to push network command in network interface command queue.");
                  }
               }
               else
               {
                  CI_ERR("Received command is not a network command.");
               }
               break;
         }
      }
      else if (status == IRC_FAILURE)
      {
         netCmd.port = &ctrlIntf->port;
         F1F2_BuildNAKResponse(&netCmd.f1f2, &netCmd.f1f2);

         if (ctrlIntf->protocol != CIP_F1F2_NETWORK)
         {
            netCmd.f1f2.srcAddr = ctrlIntf->port.netIntf->address;
            netCmd.f1f2.srcPort = ctrlIntf->port.port;
            netCmd.f1f2.destAddr = ctrlIntf->port.netIntf->address;
            netCmd.f1f2.destPort = ctrlIntf->port.port;
            netCmd.f1f2.isNetwork = 1;
         }

         if (NetIntf_EnqueueCmd(ctrlIntf->port.netIntf, &netCmd) != IRC_SUCCESS)
         {
            CI_ERR("Failed to push NAK command in network interface command queue.");
         }
      }
      else if (status == IRC_NOT_DONE)
      {
         if (!CBB_Empty(&ctrlIntf->rxCircDataBuffer) && ((elapsed_time_us(ctrlIntf->rxByteTime) > CI_RX_TIMEOUT_US) || (ctrlIntf->linkType == CILT_USART)))
         {
            CI_LINKERR(ctrlIntf, "RX timeout.");
            if (ctrlIntf->showBytes == 0)
            {
               CI_INF("%d byte(s) in circular buffer", CBB_Length(&ctrlIntf->rxCircDataBuffer));
               CBB_Dump(&ctrlIntf->rxCircDataBuffer, 16);
            }
            CBB_Flush(&ctrlIntf->rxCircDataBuffer);
            CtrlIntf_Recv(ctrlIntf);
         }

         if (CBB_Full(&ctrlIntf->rxCircDataBuffer))
         {
            CI_LINKERR(ctrlIntf, "Circular buffer is full and no complete command has been received.");
            if (ctrlIntf->showBytes == 0)
            {
               CI_INF("%d byte(s) in circular buffer", CBB_Length(&ctrlIntf->rxCircDataBuffer));
               CBB_Dump(&ctrlIntf->rxCircDataBuffer, 16);
            }
            CBB_Flush(&ctrlIntf->rxCircDataBuffer);
            CtrlIntf_Recv(ctrlIntf);
         }
      }
   }

   // Transmit data
   switch (ctrlIntf->txStatus)
   {
      case CITS_READY:
         // TODO Transfer following code in control interface interruption handler.
         // Check for new response
         if (CB_Pop(ctrlIntf->port.cmdQueue, &netCmd) == IRC_SUCCESS)
         {
            if (ctrlIntf->protocol != CIP_F1F2_NETWORK)
            {
               // Convert F1F2 network command to standard F1F2 command
               netCmd.f1f2.isNetwork = 0;
            }

            if (CtrlIntf_Send(ctrlIntf, &netCmd.f1f2) == IRC_FAILURE)
            {
               CI_ERR("Failed to transmit command.");
            }
         }
         break;

      case CITS_BUSY:
         // Waiting for the end of transmission
         break;
   }
}

/**
 * Control interface interrupt handler function.
 *
 * @param CallBackRef is a pointer to the control interface data structure.
 * @param Event is used to identify the cause of the interrupt.
 * @param EventData is the number of received or sent bytes.
 */
void CtrlIntf_IntrHandler(void *CallBackRef,
      u32 Event,
      unsigned int EventData)
{
   ctrlIntf_t *ctrlIntf = (ctrlIntf_t *)CallBackRef;

   switch (ctrlIntf->linkType)
   {
      case CILT_UART:
         CtrlIntf_UARTIntrHandler(CallBackRef, Event, EventData);
         break;

      case CILT_CUART:
         CtrlIntf_CUARTIntrHandler(CallBackRef, Event, EventData);
         break;

      case CILT_USART:
         CtrlIntf_USARTIntrHandler(CallBackRef, Event, EventData);
         break;
   }
}

/**
 * Control interface UART interrupt handler function.
 *
 * @param CallBackRef is a pointer to the control interface data structure.
 * @param Event is used to identify the cause of the interrupt.
 * @param EventData is the number of received or sent bytes.
 */
void CtrlIntf_UARTIntrHandler(void *CallBackRef,
      u32 Event,
      unsigned int EventData)
{
   ctrlIntf_t *ctrlIntf = (ctrlIntf_t *)CallBackRef;

   if (ctrlIntf->showBytes == 1)
   {
      switch (Event)
      {
         case XUN_EVENT_RECV_TIMEOUT:
            PRINTF("URXTO %d\n", EventData);
            break;

         case XUN_EVENT_RECV_DATA:
            PRINTF("URXD %d\n", EventData);
            break;

         case XUN_EVENT_SENT_DATA:
            PRINTF("UTXD %d\n", EventData);
            break;

         case XUN_EVENT_RECV_ERROR:
            PRINTF("URXE %d\n", EventData);
            break;

         default:
            PRINTF("UUE %d %d", Event, EventData);
            break;
      }
   }

   switch (Event)
   {
      case XUN_EVENT_RECV_TIMEOUT:
      case XUN_EVENT_RECV_DATA:
         ctrlIntf->rxDataReady = 1;
         break;

      case XUN_EVENT_SENT_DATA:
         ctrlIntf->txStatus = CITS_READY;

   #ifdef CI_REQUEST_PROCESSING_DURATION_TEST
         if ((ctrlIntf->protocol == CIP_F1F2) || (ctrlIntf->protocol == CIP_PLEORA))
         {
            CI_INF("Command processed in %dus (port %d).", (uint32_t) elapsed_time_us(ctrlIntf->rxCmdTime), ctrlIntf->port.port);
         }
   #endif
         break;

      case XUN_EVENT_RECV_ERROR:
         ctrlIntf->linkErrorCount++;

         // Drop received data and listen for the next command.
         CtrlIntf_Recv(ctrlIntf);
         break;
   }
}

/**
 * Control interface CUART interrupt handler function.
 *
 * @param CallBackRef is a pointer to the control interface data structure.
 * @param Event is used to identify the cause of the interrupt.
 * @param EventData is the number of received or sent bytes.
 */
void CtrlIntf_CUARTIntrHandler(void *CallBackRef,
      u32 Event,
      unsigned int EventData)
{
   ctrlIntf_t *ctrlIntf = (ctrlIntf_t *)CallBackRef;

   if (ctrlIntf->showBytes == 1)
   {
      switch (Event)
      {
         case XUN_EVENT_RECV_TIMEOUT:
            PRINTF("CURXTO %d\n", EventData);
            break;

         case XUN_EVENT_RECV_DATA:
            PRINTF("CURXD %d\n", EventData);
            break;

         case XUN_EVENT_SENT_DATA:
            PRINTF("CUTXD %d\n", EventData);
            break;

         case XUN_EVENT_RECV_ERROR:
            PRINTF("CURXE %d\n", EventData);
            break;

         default:
            PRINTF("CUUE %d %d", Event, EventData);
            break;
      }
   }

   switch (Event)
   {
      case XUN_EVENT_RECV_TIMEOUT:
      case XUN_EVENT_RECV_DATA:
         ctrlIntf->rxDataReady = 1;
         GETTIME(&ctrlIntf->rxByteTime);
         break;

      case XUN_EVENT_SENT_DATA:
         ctrlIntf->txStatus = CITS_READY;

   #ifdef CI_REQUEST_PROCESSING_DURATION_TEST
         if ((ctrlIntf->protocol == CIP_F1F2) || (ctrlIntf->protocol == CIP_PLEORA))
         {
            CI_INF("Command processed in %dus (port %d).", (uint32_t) elapsed_time_us(ctrlIntf->rxCmdTime), ctrlIntf->port.port);
         }
   #endif
         break;

      case XUN_EVENT_RECV_ERROR:
         ctrlIntf->linkErrorCount++;
         break;
   }
}

/**
 * Control interface USART interrupt handler function.
 *
 * @param CallBackRef is a pointer to the control interface data structure.
 * @param Event is used to identify the cause of the interrupt.
 * @param EventData is the number of received or sent bytes.
 */
void CtrlIntf_USARTIntrHandler(void *CallBackRef,
      u32 Event,
      unsigned int EventData)
{
   ctrlIntf_t *ctrlIntf = (ctrlIntf_t *)CallBackRef;

   if (ctrlIntf->showBytes == 1)
   {
      switch (Event)
      {
         case USART_EVENT_RX_FULL:
            PRINTF("USRXF %d\n", EventData);
            break;

         case USART_EVENT_TX_DONE:
            PRINTF("USTXD %d\n", EventData);
            break;

         case USART_EVENT_RX_TIMEOUT:
            PRINTF("USRXT %d\n", EventData);
            break;

         default:
            PRINTF("USUE %d %d", Event, EventData);
            break;
      }
   }

   // Loopback
   if (ctrlIntf->loopback == 1)
   {
      if ((Event == USART_EVENT_RX_TIMEOUT) || (Event == USART_EVENT_RX_FULL))
      {
         Usart_Loopback(&ctrlIntf->link.usart);
      }
      return;
   }

   switch (Event)
   {
      case USART_EVENT_RX_TIMEOUT:
      case USART_EVENT_RX_FULL:
         ctrlIntf->rxDataReady = 1;
         break;

      case USART_EVENT_TX_DONE:
         ctrlIntf->txStatus = CITS_READY;

   #ifdef CI_REQUEST_PROCESSING_DURATION_TEST
         if ((ctrlIntf->protocol == CIP_F1F2) || (ctrlIntf->protocol == CIP_PLEORA))
         {
            CI_INF("Command processed in %dus (port %d).", (uint32_t) elapsed_time_us(ctrlIntf->rxCmdTime), ctrlIntf->port.port);
         }
   #endif
         break;
   }
}
