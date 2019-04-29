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


#include "Protocol_F1F2.h"
#include "Protocol_Pleora.h"
#include <stdio.h> // For NULL
#include <string.h> // For memcpy

IRC_Status_t CtrlIntf_CommandParser(ctrlIntf_t *ctrlIntf, F1F2Command_t *f1f2Cmd);
uint32_t CtrlIntf_CommandBuilder(ctrlIntf_t *ctrlIntf, F1F2Command_t *f1f2Cmd);
IRC_Status_t CtrlIntf_Send(ctrlIntf_t *ctrlIntf, F1F2Command_t *f1f2Cmd);
void CtrlIntf_IntrHandler(void *CallBackRef, u32 Event, unsigned int EventData);

/**
 * Initializes circular buffer UART control interface.
 *
 * @param ctrlIntf is the pointer to the control interface data structure.
 * @param protocol is the control protocol used.
 * @param rxCircBuffer is a pointer to the circular buffer used to receive data.
 * @param txCircBuffer is a pointer to the circular buffer used to transmit data.
 * @param netIntf is the network interface pointer.
 * @param cmdQueue is the command queue pointer.
 * @param niPort is the network port of the control interface.
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t CtrlIntf_Init(ctrlIntf_t *ctrlIntf,
      ciProtocol_t protocol,
      circByteBuffer_t *rxCircBuffer,
      circByteBuffer_t *txCircBuffer,
      netIntf_t *netIntf,
      circBuffer_t *cmdQueue,
      niPort_t niPort)
{
   memset(ctrlIntf, 0, sizeof(ctrlIntf_t));

   ctrlIntf->linkType = CILT_UNDEFINED;
   ctrlIntf->p_link = NULL;
   ctrlIntf->protocol = protocol;
   ctrlIntf->rxCircBuffer = rxCircBuffer;
   ctrlIntf->txCircBuffer = txCircBuffer;
   ctrlIntf->port.port = niPort;
   ctrlIntf->port.cmdQueue = cmdQueue;


   // Connect control interface to network interface
   if (NetIntf_Connect(netIntf, &ctrlIntf->port) != IRC_SUCCESS)
   {
      CI_ERR("Failed to connect to network interface.");
      return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}

/**
 * Sets control interface hardware link.
 *
 * @param ctrlIntf is the pointer to the control interface data structure.
 * @param linkType is the type of link that will be used by the control interface.
 * @param p_link is a pointer to the hardware link data structure.
 *
 * @return IRC_SUCCESS if hardware link successfully set.
 * @return IRC_FAILURE if failed to set hardware link.
 */
IRC_Status_t CtrlIntf_SetLink(ctrlIntf_t *ctrlIntf, ciLinkType_t linkType, void *p_link)
{

   if (ctrlIntf == NULL) return IRC_FAILURE;
   if ((linkType == ctrlIntf->linkType) && (p_link == ctrlIntf->p_link)) return IRC_SUCCESS;

   // Disconnect previous link
   switch (ctrlIntf->linkType)
   {
      case CILT_CUART:

         CircularUART_SetCircularBuffers((circularUART_t *)ctrlIntf->p_link, NULL, NULL);
         CircularUART_SetHandler((circularUART_t *)ctrlIntf->p_link, NULL, NULL);

         break;

      case CILT_USART:
         Usart_SetCircularBuffers((usart_t *)ctrlIntf->p_link, NULL, NULL);
         Usart_SetHandler((usart_t *)ctrlIntf->p_link, NULL, NULL);
         break;

      case CILT_UNDEFINED:
      default:
         break;
   }

   ctrlIntf->linkType = linkType;
   ctrlIntf->p_link = p_link;

   if (ctrlIntf->p_link == NULL)
   {
      ctrlIntf->linkType = CILT_UNDEFINED;
   }

   // Connect new circular UART
   switch (ctrlIntf->linkType)
   {
      case CILT_CUART:

         CircularUART_ResetFifo((circularUART_t *)ctrlIntf->p_link);
         CircularUART_SetCircularBuffers((circularUART_t *)ctrlIntf->p_link, ctrlIntf->rxCircBuffer, ctrlIntf->txCircBuffer);
         CircularUART_SetHandler((circularUART_t *)ctrlIntf->p_link, CtrlIntf_IntrHandler, ctrlIntf);
         break;

      case CILT_USART:
         Usart_SetCircularBuffers((usart_t *)ctrlIntf->p_link, ctrlIntf->rxCircBuffer, ctrlIntf->txCircBuffer);
         Usart_SetHandler((usart_t *)ctrlIntf->p_link, CtrlIntf_IntrHandler, ctrlIntf);
         break;

      case CILT_UNDEFINED:
      default:
         ctrlIntf->linkType = CILT_UNDEFINED;
         ctrlIntf->p_link = NULL;
         break;
   }

   return IRC_SUCCESS;
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
         status = F1F2_CircCommandParser(ctrlIntf->rxCircBuffer, f1f2Cmd, &byteParsed);
         if (status == IRC_FAILURE)
         {
            // Skip SOP
            byteParsed++;
         }
         break;

      case CIP_PLEORA:
         status = Pleora_CircCommandParser(ctrlIntf->rxCircBuffer, &pleoraCmd, &byteParsed);
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
      ctrlIntf->errorCount++;
      if (ctrlIntf->errorCount > CI_ERROR_COUNTER_THRESHOLD)
      {
         // Disable control interface interrupt
         CI_ERR("Control interface has been disabled (%d errors in %ds).", ctrlIntf->errorCount, CI_ERROR_COUNTER_RESET_US / TIME_ONE_SECOND_US);
         CtrlIntf_Disable(ctrlIntf);
      }
   }

   // Flush parsed bytes from circular buffer
   CBB_Flushn(ctrlIntf->rxCircBuffer, byteParsed);

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
         cmdlen = F1F2_CircCommandBuilder(f1f2Cmd, ctrlIntf->txCircBuffer);
         break;

      case CIP_PLEORA:
         status = Pleora_ConvertFromF1F2(f1f2Cmd, &pleoraCmd);
         if (status == IRC_SUCCESS)
         {
            cmdlen = Pleora_CircCommandBuilder(&pleoraCmd, ctrlIntf->txCircBuffer);
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
      CBB_Dump(ctrlIntf->txCircBuffer, 16);
   }

   return cmdlen;
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
         case CILT_CUART:
            CircularUART_SendData((circularUART_t *)ctrlIntf->p_link, buflen);
            break;

         case CILT_USART:
            Usart_SendData((usart_t *)ctrlIntf->p_link);
            break;

         case CILT_UNDEFINED:
         default:
            return IRC_FAILURE;
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
   //IRC_Status_t status = IRC_FAILURE;
   IRC_Status_t status;
   networkCommand_t netCmd;
   gcRegister_t *p_register;

   // Error counter reset
   if (elapsed_time_us(ctrlIntf->tic_errorCount) > CI_ERROR_COUNTER_RESET_US)
   {
      ctrlIntf->errorCount = 0;
      GETTIME(&ctrlIntf->tic_errorCount);
   }

   if (!CBB_Empty(ctrlIntf->rxCircBuffer))
   {
      if (ctrlIntf->showBytes == 1)
      {
         CI_INF("RX circular buffer length is %d byte(s)", CBB_Length(ctrlIntf->rxCircBuffer));
         CBB_Dump(ctrlIntf->rxCircBuffer, 16);
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

                  case F1F2_CMD_DEBUG_TEXT:
                  case F1F2_CMD_DEBUG_CMD:
                     netCmd.f1f2.destAddr = ctrlIntf->port.netIntf->address;
                     netCmd.f1f2.destPort = NIP_DEBUG_TERMINAL;
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
         if (!CBB_Empty(ctrlIntf->rxCircBuffer) && ((elapsed_time_us(ctrlIntf->rxByteTime) > CI_RX_TIMEOUT_US) || (ctrlIntf->linkType == CILT_USART)))

         {
            CI_LINKERR(ctrlIntf, "RX timeout.");
            CBB_Flush(ctrlIntf->rxCircBuffer);
         }

         if (CBB_Full(ctrlIntf->rxCircBuffer))
         {
            CI_LINKERR(ctrlIntf, "Circular buffer is full and no complete command has been received.");
            CBB_Flush(ctrlIntf->rxCircBuffer);
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
void CtrlIntf_IntrHandler(void *CallBackRef, u32 Event, unsigned int EventData)
{
   ctrlIntf_t *ctrlIntf = (ctrlIntf_t *)CallBackRef;

   if ( ((ctrlIntf->linkType == CILT_CUART) && ((Event == XUN_EVENT_RECV_DATA) || (Event == XUN_EVENT_RECV_TIMEOUT))) ||
        ((ctrlIntf->linkType == CILT_USART) && ((Event == USART_EVENT_RX_FULL) || (Event == USART_EVENT_RX_TIMEOUT))) )
   {

         // Bytes received
         GETTIME(&ctrlIntf->rxByteTime);

   }
   else if ( ((ctrlIntf->linkType == CILT_CUART) && (Event == XUN_EVENT_SENT_DATA)) ||
             ((ctrlIntf->linkType == CILT_USART) && (Event == USART_EVENT_TX_DONE)) )
   {
      // Bytes transmit
      ctrlIntf->txStatus = CITS_READY;

   }

   else if ((ctrlIntf->linkType == CILT_CUART) && (Event == XUN_EVENT_RECV_ERROR))
   {
      // Error
      // Nothing to do
   }
}

/**
 * Enables control interface.
 *
 * @param ctrlIntf_t is the pointer to the control interface data structure.
 */
IRC_Status_t CtrlIntf_Enable(ctrlIntf_t *ctrlIntf)
{
   switch (ctrlIntf->linkType)
   {
      case CILT_CUART:
         CircularUART_Enable((circularUART_t *)ctrlIntf->p_link);
            break;

      case CILT_USART:
         Usart_Enable((usart_t *)ctrlIntf->p_link);
            break;

      case CILT_UNDEFINED:
         default:
         return IRC_FAILURE;
            break;
      }

   return IRC_SUCCESS;
         }

/**
 * Disables control interface.
 *
 * @param ctrlIntf_t is the pointer to the control interface data structure.
 */
IRC_Status_t CtrlIntf_Disable(ctrlIntf_t *ctrlIntf)
{
   switch (ctrlIntf->linkType)
   {
      case CILT_CUART:
         CircularUART_Disable((circularUART_t *)ctrlIntf->p_link);
            break;

      case CILT_USART:
         Usart_Disable((usart_t *)ctrlIntf->p_link);
            break;

      case CILT_UNDEFINED:
         default:
         return IRC_FAILURE;
            break;
      }

   return IRC_SUCCESS;
         }


/**
 * Resets control interface.
 *
 * @param ctrlIntf_t is the pointer to the control interface data structure.
 */
IRC_Status_t CtrlIntf_Reset(ctrlIntf_t *ctrlIntf)
{
   // Reset error counter
   ctrlIntf->errorCount = 0;
   GETTIME(&ctrlIntf->tic_errorCount);

   // Reset Rx circular buffer
   CBB_Flush(ctrlIntf->rxCircBuffer);
   ctrlIntf->rxByteTime = 0;

   // Reset Tx circular buffer
   CBB_Flush(ctrlIntf->txCircBuffer);
         ctrlIntf->txStatus = CITS_READY;

   return IRC_SUCCESS;
         }


