/**
 * @file Protocol_Pleora.c
 * Pleora protocol module implementation.
 *
 * This file implements the Pleora protocol module.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "Protocol_Pleora.h"
#include "GC_Manager.h"
#include <string.h>


/**
 * Clear Pleora command structure.
 *
 * @param pleoraCmd is the pointer to the Pleora command structure to clear.
 */
void Pleora_CommandClear(PleoraCommand_t *pleoraCmd)
{
   memset(pleoraCmd, 0, sizeof(PleoraCommand_t));
}

/**
 * Pleora protocol command parser function.
 *
 * @param buffer is a pointer to the command raw data that was received.
 * @param buflen is the length of the command raw data that was received.
 * @param pleoraCmd is the pointer to the Pleora command structure to fill using received data.
 *
 * @return IRC_SUCCESS if successfully parsed
 * @return IRC_FAILURE if failed to parse.
 * @return IRC_NOT_DONE if not enough data in buffer.
 */
IRC_Status_t Pleora_CommandParser(uint8_t *buffer, uint16_t buflen, PleoraCommand_t *pleoraCmd)
{
   // Reset Pleora command data
   Pleora_CommandClear(pleoraCmd);

   // Validate that there is enough bytes
   if (buflen < (PLEORA_CMD_CODE_SIZE + PLEORA_REG_ADDR_SIZE))
   {
      return IRC_NOT_DONE;
   }

   // Read Pleora command code
   pleoraCmd->cmd = buffer[PLEORA_OFFSET_CMD];

   // Read register address
   memcpy_swap(&pleoraCmd->address, &buffer[PLEORA_OFFSET_REG_ADDR], PLEORA_REG_ADDR_SIZE, PLEORA_REG_ADDR_SIZE, 1);

   switch (pleoraCmd->cmd)
   {
      case PLEORA_CMD_WRITE_REQ:
         // Check that there is enough bytes to read register value
         if (buflen < (PLEORA_CMD_CODE_SIZE + PLEORA_REG_ADDR_SIZE + PLEORA_REG_VALUE_SIZE))
         {
            return IRC_NOT_DONE;
         }

         // Validate command length
         if (buflen > (PLEORA_CMD_CODE_SIZE + PLEORA_REG_ADDR_SIZE + PLEORA_REG_VALUE_SIZE))
         {
            PLEORA_ERR("Write: Invalid command length (%d).", buflen);
            return IRC_FAILURE;
         }
         
         // Read register value
         memcpy(pleoraCmd->data, &buffer[PLEORA_OFFSET_REG_VALUE], PLEORA_REG_VALUE_SIZE);
         pleoraCmd->dataLength = PLEORA_REG_VALUE_SIZE;
         pleoraCmd->padLength = 0;
         break;
         
      case PLEORA_CMD_READ_REQ:
         // Validate command length
         if (buflen > (PLEORA_CMD_CODE_SIZE + PLEORA_REG_ADDR_SIZE))
         {
            PLEORA_ERR("Read: Invalid command length (%d).", buflen);
            return IRC_FAILURE;
         }
         break;
      
      default:
         PLEORA_ERR("Unknown command code (0x%02X).", pleoraCmd->cmd);
         return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}

/**
 * Pleora protocol command parser function. It parses Pleora command from a circular buffer.
 *
 * @param circByteBuffer is a pointer to the circular byte buffer to parse.
 * @param pleoraCmd is the pointer to the Pleora command structure to fill using received data.
 * @param byteParsed is the number of bytes that have been parsed in the buffer.
 *
 * @return IRC_SUCCESS if successfully parsed
 * @return IRC_FAILURE if failed to parse.
 * @return IRC_NOT_DONE if not enough data in buffer.
 */
IRC_Status_t Pleora_CircCommandParser(circByteBuffer_t *circByteBuffer, PleoraCommand_t *pleoraCmd, uint16_t *byteParsed)
{
   uint16_t tmpAddress;
   uint16_t cmdLength;

   // Reset Pleora command data
   Pleora_CommandClear(pleoraCmd);

   *byteParsed = 0;

   // Search for valid read or write command code
   while ((CBB_Peek(circByteBuffer, *byteParsed, &pleoraCmd->cmd) == IRC_SUCCESS) &&
         (pleoraCmd->cmd != PLEORA_CMD_WRITE_REQ) && (pleoraCmd->cmd != PLEORA_CMD_READ_REQ))
   {
      (*byteParsed)++;
   }

   // Read register address
   if (CBB_Peekn(circByteBuffer, (*byteParsed) + PLEORA_OFFSET_REG_ADDR, PLEORA_REG_ADDR_SIZE, (uint8_t *)&tmpAddress) != IRC_SUCCESS)
   {
      return IRC_NOT_DONE;
   }
   memcpy_swap(&pleoraCmd->address, &tmpAddress, PLEORA_REG_ADDR_SIZE, PLEORA_REG_ADDR_SIZE, 1);

   cmdLength = PLEORA_CMD_CODE_SIZE + PLEORA_REG_ADDR_SIZE;

   if (pleoraCmd->cmd == PLEORA_CMD_WRITE_REQ)
   {
      // Read register value
      if (CBB_Peekn(circByteBuffer, (*byteParsed) + PLEORA_OFFSET_REG_VALUE, PLEORA_REG_VALUE_SIZE, pleoraCmd->data) != IRC_SUCCESS)
      {
         return IRC_NOT_DONE;
      }
      pleoraCmd->dataLength = PLEORA_REG_VALUE_SIZE;
      pleoraCmd->padLength = 0;

      cmdLength += PLEORA_REG_VALUE_SIZE;
   }

   (*byteParsed) += cmdLength;

   return IRC_SUCCESS;
}

/**
 * Pleora protocol command builder function.
 *
 * @param pleoraCmd is the pointer to the Pleora command structure that is going to be used to generate transmitted data.
 * @param buffer is a pointer to the command raw data buffer that will be transmitted.
 * @param buflen is the maximum length that can be written into buffer.
 *
 * @return The command length to be transmitted.
 */
uint32_t Pleora_CommandBuilder(PleoraCommand_t *pleoraCmd, uint8_t *buffer, uint16_t buflen)
{
   uint32_t cmdlen = 0;

   // Validate Pleora command code (response only)
   if (pleoraCmd->cmd != PLEORA_CMD_ACK)
   {
      return 0;
   }
   
   // Write data into byte buffer
   if (pleoraCmd->dataLength != 0)
   {
      // Read response
      if ((PLEORA_CMD_CODE_SIZE + pleoraCmd->dataLength + pleoraCmd->padLength) > buflen)
      {
         return 0;
      }
      buffer[PLEORA_OFFSET_CMD] = pleoraCmd->cmd;
      memcpy(&buffer[PLEORA_OFFSET_ACK_REG_VALUE], pleoraCmd->data, pleoraCmd->dataLength);
      memset(&buffer[PLEORA_OFFSET_ACK_REG_VALUE + pleoraCmd->dataLength], 0, pleoraCmd->padLength);
      cmdlen = PLEORA_CMD_CODE_SIZE + pleoraCmd->dataLength + pleoraCmd->padLength;
   }
   else
   {
      // Write response
      if ((PLEORA_CMD_CODE_SIZE) > buflen)
      {
         return 0;
      }
      buffer[PLEORA_OFFSET_CMD] = pleoraCmd->cmd;
      cmdlen = PLEORA_CMD_CODE_SIZE;
   }

   return cmdlen;
}

/**
 * Convert Pleora command structure to F1F2 command structure.
 *
 * @param pleoraCmd is the pointer to the Pleora command structure (source).
 * @param f1f2Cmd is the pointer to the F1F2 command structure (destination).
 *
 * @return IRC_SUCCESS if the conversion is successful.
 * @return IRC_FAILURE if an error is encountered during the conversion.
 */
IRC_Status_t Pleora_ConvertToF1F2(PleoraCommand_t *pleoraCmd, F1F2Command_t *f1f2Cmd)
{
   F1F2_CommandClear(f1f2Cmd);

   switch (pleoraCmd->cmd)
   {
      case PLEORA_CMD_READ_REQ:
         f1f2Cmd->cmd = F1F2_CMD_REG_READ_REQ;
         f1f2Cmd->payload.regRW.address = pleoraCmd->address;
         break;

      case PLEORA_CMD_WRITE_REQ:
         f1f2Cmd->cmd = F1F2_CMD_REG_WRITE;
         f1f2Cmd->payload.regRW.address = pleoraCmd->address;
         memcpy(f1f2Cmd->payload.regRW.data, pleoraCmd->data, pleoraCmd->dataLength);
         f1f2Cmd->payload.regRW.dataLength = pleoraCmd->dataLength;
         f1f2Cmd->payload.regRW.padLength = pleoraCmd->padLength;
         break;

      default:
         return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}

/**
 * Convert F1F2 command structure to Pleora command structure.
 *
 * @param f1f2Cmd is the pointer to the F1F2 command structure (source).
 * @param pleoraCmd is the pointer to the Pleora command structure (destination).
 *
 * @return IRC_SUCCESS if the conversion is successful.
 * @return IRC_FAILURE if an error is encountered during the conversion.
 */
IRC_Status_t Pleora_ConvertFromF1F2(F1F2Command_t *f1f2Cmd, PleoraCommand_t *pleoraCmd)
{
   Pleora_CommandClear(pleoraCmd);

   switch (f1f2Cmd->cmd)
   {
      case F1F2_CMD_REG_READ_RSP:
         pleoraCmd->cmd = PLEORA_CMD_ACK;
         memcpy(pleoraCmd->data, f1f2Cmd->payload.regRW.data, f1f2Cmd->payload.regRW.dataLength);
         pleoraCmd->dataLength = f1f2Cmd->payload.regRW.dataLength;
         pleoraCmd->padLength = f1f2Cmd->payload.regRW.padLength;
         break;

      case F1F2_CMD_ACK:
         if (f1f2Cmd->payload.ack.cmd == F1F2_CMD_REG_WRITE)
         {
            pleoraCmd->cmd = PLEORA_CMD_ACK;
         }
         else
         {
            // Other acknowledge are not supported by Pleora protocol
            PLEORA_ERR("Unsupported acknowledge (0x%02X).", f1f2Cmd->payload.ack.cmd);
            return IRC_FAILURE;
         }
         break;

      case F1F2_CMD_NAK:
         pleoraCmd->cmd = PLEORA_CMD_NONE;
         break;

      default:
         // Other command are not supported by Pleora protocol
         PLEORA_ERR("Unsupported F1F2 command (0x%02X).", f1f2Cmd->cmd);
         return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}
