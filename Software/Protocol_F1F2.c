/**
 * @file Protocol_F1F2.c
 * F1F2 protocol module implementation.
 *
 * This file implements the F1F2v2 protocol module.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "Protocol_F1F2.h"
#include "CRC.h"
#include "utils.h"
#include <string.h> // memcpy

IRC_Status_t F1F2_PayloadParser(uint8_t *p_payload, uint16_t pdc, F1F2Command_t *f1f2Cmd);
IRC_Status_t F1F2_CircPayloadParser(circByteBuffer_t *circByteBuffer, uint16_t offset, uint16_t pdc, F1F2Command_t *f1f2Cmd);
IRC_Status_t F1F2_PayloadDataCountValidator(uint8_t cmd, uint16_t pdc);;
IRC_Status_t F1F2_CommandPayloadBuilder(F1F2Command_t *f1f2Cmd, F1F2PayloadData_t payloadData[], uint16_t payloadDataSize, uint16_t *payloadDataCount);
uint32_t F1F2_FrameBuilder(uint8_t *buffer, uint16_t buflen, uint8_t cmd, F1F2PayloadData_t payloadData[], uint16_t payloadDataCount);
uint32_t F1F2_CircFrameBuilder(circByteBuffer_t *circByteBuffer, uint8_t cmd, F1F2PayloadData_t payloadData[], uint16_t payloadDataCount);


/**
 * Clear F1F2 file info structure.
 *
 * @param f1f2FileInfo is the pointer to the F1F2 file info structure to clear.
 */
void F1F2_FileInfoClear(F1F2FileInfo_t *f1f2FileInfo)
{
   memset(f1f2FileInfo, 0, sizeof(F1F2FileInfo_t));
}

/**
 * Clear F1F2 command structure.
 *
 * @param f1f2Cmd is the pointer to the F1F2 command structure to clear.
 */
void F1F2_CommandClear(F1F2Command_t *f1f2Cmd)
{
   memset(f1f2Cmd, 0, sizeof(F1F2Command_t));
}

/**
 * F1F2 protocol command parser function.
 *
 * @param buffer is a pointer to the command raw data that was received.
 * @param buflen is the length of the command raw data that was received.
 * @param f1f2Cmd is the pointer to the F1F2 command structure to fill using received data.
 *
 * @return IRC_SUCCESS if successfully parsed
 * @return IRC_FAILURE if failed to parse.
 * @return IRC_NOT_DONE if not enough data in buffer.
 */
IRC_Status_t F1F2_CommandParser(uint8_t *buffer, uint16_t buflen, F1F2Command_t *f1f2Cmd)
{
   uint16_t pdc;        // Payload Data Count
   uint16_t crc16;      // CRC-16 Value

   // Reset F1F2 command data
   F1F2_CommandClear(f1f2Cmd);
   f1f2Cmd->cmd = F1F2_CMD_ERROR;

   // Validate that there is enough bytes
   if (buflen < F1F2_MIN_PACKET_SIZE)
   {
      return IRC_NOT_DONE;
   }

   // Validate SOP
   if (buffer[F1F2_OFFSET_SOP] != F1F2_SOP)
   {
      F1F2_ERR("Invalid SOP.");
      return IRC_FAILURE;
   }

   // Read F1F2 command code
   f1f2Cmd->cmd = buffer[F1F2_OFFSET_CMD];

   // Read F1F2 command payload data count
   memcpy(&pdc, &buffer[F1F2_OFFSET_PDC], sizeof(pdc));

   // Check that all frame bytes have been received
   if (buflen < (F1F2_MIN_PACKET_SIZE + pdc))
   {
      return IRC_NOT_DONE;
   }

   // Validate packet length
   if (buflen > MIN(F1F2_MIN_PACKET_SIZE + pdc, F1F2_MAX_PACKET_SIZE))
   {
      F1F2_ERR("Invalid packet length.");
      return IRC_FAILURE;
   }

   // Validate EOP
   if (buffer[buflen - 1] != F1F2_EOP)
   {
      F1F2_ERR("Invalid EOP.");
      return IRC_FAILURE;
   }
   
   // Validate CRC-16
   memcpy(&crc16, &buffer[F1F2_OFFSET_PAYLOAD_DATA + pdc], sizeof(crc16));
   if (crc16 != CRC16(0xFFFF, buffer, F1F2_OFFSET_PAYLOAD_DATA + pdc))
   {
      F1F2_ERR("Invalid CRC-16.");
      return IRC_FAILURE;
   }

   // Parse command payload
   return F1F2_PayloadParser(&buffer[F1F2_OFFSET_PAYLOAD_DATA], pdc, f1f2Cmd);
}

/**
 * F1F2 protocol command parser function. It parses F1F2 command from a circular buffer.
 *
 * @param circByteBuffer is a pointer to the circular byte buffer to parse.
 * @param f1f2Cmd is the pointer to the F1F2 command structure to fill using received data.
 * @param byteParsed is the number of bytes that have been parsed in the buffer.
 *
 * @return IRC_SUCCESS if successfully parsed
 * @return IRC_FAILURE if failed to parse.
 * @return IRC_NOT_DONE if not enough data in buffer.
 */
IRC_Status_t F1F2_CircCommandParser(circByteBuffer_t *circByteBuffer, F1F2Command_t *f1f2Cmd, uint16_t *byteParsed)
{
   uint16_t pdc;        // Payload Data Count
   uint16_t crc16;      // CRC-16 Value
   uint8_t data;

   // Reset F1F2 command data
   F1F2_CommandClear(f1f2Cmd);
   f1f2Cmd->cmd = F1F2_CMD_ERROR;

   *byteParsed = 0;

   // Search for SOP
   while ((CBB_Peek(circByteBuffer, *byteParsed, &data) == IRC_SUCCESS) && (data != F1F2_SOP))
   {
      (*byteParsed)++;
   }

   // Read F1F2 command code
   if (CBB_Peek(circByteBuffer, (*byteParsed) + F1F2_OFFSET_CMD, &f1f2Cmd->cmd) != IRC_SUCCESS)
   {
      return IRC_NOT_DONE;
   }

   // Read F1F2 command payload data count
   if (CBB_Peekn(circByteBuffer, (*byteParsed) + F1F2_OFFSET_PDC, sizeof(pdc), (uint8_t*)&pdc) != IRC_SUCCESS)
   {
      return IRC_NOT_DONE;
   }


   // Validate payload data count
   if (F1F2_PayloadDataCountValidator(f1f2Cmd->cmd, pdc) != IRC_SUCCESS)
   {
      F1F2_ERR("Invalid command payload data count (cmd = 0x%02X).", f1f2Cmd->cmd);
      return IRC_FAILURE;
   }

   // Validate EOP
   if (CBB_Peek(circByteBuffer, (*byteParsed) + F1F2_MIN_PACKET_SIZE + pdc - 1, &data) != IRC_SUCCESS)
   {
      return IRC_NOT_DONE;
   }

   if (data != F1F2_EOP)
   {
      F1F2_ERR("Invalid EOP.");
      return IRC_FAILURE;
   }

   // Validate CRC-16
   if ((CBB_Peekn(circByteBuffer, (*byteParsed) + F1F2_OFFSET_PAYLOAD_DATA + pdc, sizeof(crc16), (uint8_t*)&crc16)) ||
         (crc16 != CBB_CRC16n(0xFFFF, circByteBuffer, (*byteParsed), F1F2_OFFSET_PAYLOAD_DATA + pdc)))
   {
      F1F2_ERR("Invalid CRC-16.");
      return IRC_FAILURE;
   }

   // Parse payload data
   if (F1F2_CircPayloadParser(circByteBuffer, (*byteParsed) + F1F2_OFFSET_PAYLOAD_DATA, pdc, f1f2Cmd) != IRC_SUCCESS)
   {
      F1F2_ERR("Cannot parse payload data.");
      return IRC_FAILURE;
   }

   (*byteParsed) += (F1F2_MIN_PACKET_SIZE + pdc);

   return IRC_SUCCESS;
}


/**
 * F1F2 protocol payload data count validator function.
 *
 * @param cmd is the command code.
 * @param pdc is the payload data count in bytes.
 *
 * @return IRC_SUCCESS if payload data count is valid.
 * @return IRC_FAILURE if payload data count is not valid.
 */
IRC_Status_t F1F2_PayloadDataCountValidator(uint8_t cmd, uint16_t pdc)
{
   uint16_t pdcMin, pdcMax;

   switch (cmd)
   {
      case F1F2_CMD_ACK:
      case F1F2_CMD_NAK:
         pdcMin = F1F2_CMD_CODE_SIZE;
         pdcMax = pdcMin;
         break;

      case F1F2_CMD_REG_READ_REQ:
         pdcMin = F1F2_REG_ADDR_SIZE;
         pdcMax = pdcMin;
         break;

      case F1F2_CMD_REG_READ_RSP:
         pdcMin = F1F2_REG_ADDR_SIZE + 1;
         pdcMax = F1F2_REG_ADDR_SIZE + GC_REG_MAX_READ_LENGTH;
         break;

      case F1F2_CMD_REG_WRITE:
         pdcMin = F1F2_REG_ADDR_SIZE + 1;
         pdcMax = F1F2_REG_ADDR_SIZE + GC_REG_MAX_WRITE_LENGTH;
         break;

      case F1F2_CMD_FILE_COUNT_REQ:
      case F1F2_CMD_FILE_FORMAT:
      case F1F2_CMD_FILE_USED_SPACE_REQ:
      case F1F2_CMD_FILE_FREE_SPACE_REQ:
      case F1F2_CMD_FILE_TOTAL_SPACE_REQ:
      case F1F2_CMD_PING:
         pdcMin = 0;
         pdcMax = pdcMin;
         break;

      case F1F2_CMD_FILE_COUNT_RSP:
         pdcMin = F1F2_FILE_COUNT_SIZE;
         pdcMax = pdcMin;
         break;

      case F1F2_CMD_FILE_INFO_REQ:
      case F1F2_CMD_FILE_CREATE_RSP:
      case F1F2_CMD_FILE_CLOSE:
      case F1F2_CMD_FILE_CHECK_REQ:
      case F1F2_CMD_FILE_DELETE:
         pdcMin = F1F2_FILE_INDEX_SIZE;
         pdcMax = pdcMin;
         break;

      case F1F2_CMD_FILE_INFO_RSP:
         pdcMin = F1F2_FILE_INFO_SIZE;
         pdcMax = pdcMin;
         break;

      case F1F2_CMD_FILE_CREATE_REQ:
         pdcMin = F1F2_FILE_NAME_SIZE;
         pdcMax = pdcMin;
         break;

      case F1F2_CMD_FILE_READ_REQ:
         pdcMin = F1F2_FILE_INDEX_SIZE + F1F2_FILE_OFFSET_SIZE + F1F2_FILE_LENGTH_SIZE;
         pdcMax = pdcMin;
         break;

      case F1F2_CMD_FILE_READ_RSP:
      case F1F2_CMD_FILE_WRITE:
         pdcMin = F1F2_FILE_INDEX_SIZE + F1F2_FILE_OFFSET_SIZE + F1F2_FILE_LENGTH_SIZE + 1;
         pdcMax = F1F2_FILE_INDEX_SIZE + F1F2_FILE_OFFSET_SIZE + F1F2_FILE_LENGTH_SIZE + F1F2_MAX_FILE_DATA_SIZE;
         break;

      case F1F2_CMD_FILE_CHECK_RSP:
         pdcMin = F1F2_FILE_INDEX_SIZE + F1F2_FILE_CRC16_SIZE;
         pdcMax = pdcMin;
         break;

      case F1F2_CMD_PROM_ERASE:
         pdcMin = F1F2_PROM_DEVICE_SIZE + F1F2_PROM_OFFSET_SIZE + F1F2_PROM_LENGTH_SIZE;
         pdcMax = pdcMin;
         break;

      case F1F2_CMD_PROM_READ_REQ:
         pdcMin = F1F2_PROM_DEVICE_SIZE + F1F2_PROM_OFFSET_SIZE + F1F2_PROM_RW_LENGTH_SIZE;
         pdcMax = pdcMin;
         break;

      case F1F2_CMD_PROM_READ_RSP:
      case F1F2_CMD_PROM_WRITE:
         pdcMin = F1F2_PROM_DEVICE_SIZE + F1F2_PROM_OFFSET_SIZE + F1F2_PROM_RW_LENGTH_SIZE + 1;
         pdcMax = F1F2_PROM_DEVICE_SIZE + F1F2_PROM_OFFSET_SIZE + F1F2_PROM_RW_LENGTH_SIZE + F1F2_MAX_PROM_DATA_SIZE;
         break;

      case F1F2_CMD_PROM_CHECK_REQ:
         pdcMin = F1F2_PROM_DEVICE_SIZE + F1F2_PROM_OFFSET_SIZE + F1F2_PROM_LENGTH_SIZE;
         pdcMax = pdcMin;
         break;

      case F1F2_CMD_PROM_CHECK_RSP:
         pdcMin = F1F2_PROM_DEVICE_SIZE + F1F2_PROM_OFFSET_SIZE + F1F2_PROM_LENGTH_SIZE + F1F2_PROM_CRC16_SIZE;
         pdcMax = pdcMin;
         break;

      case F1F2_CMD_DEBUG_TEXT:
      case F1F2_CMD_DEBUG_CMD:
         pdcMin = 0;
         pdcMax = F1F2_MAX_DEBUG_DATA_SIZE;
         break;

      case F1F2_CMD_FILE_USED_SPACE_RSP:
      case F1F2_CMD_FILE_FREE_SPACE_RSP:
      case F1F2_CMD_FILE_TOTAL_SPACE_RSP:
         pdcMin = F1F2_FILE_SPACE_SIZE;
         pdcMax = pdcMin;
         break;

      case F1F2_CMD_NETWORK:
         pdcMin = F1F2_MIN_NET_DATA_SIZE;
         pdcMax = F1F2_MAX_NET_DATA_SIZE;
         break;

      default:
         // Unknown command
         F1F2_ERR("Unknown command code (cmd = %d).", cmd);
         return IRC_FAILURE;
   }

   if ((pdc >= pdcMin) && (pdc <= pdcMax))
   {
      return IRC_SUCCESS;
   }
   else
   {
      return IRC_FAILURE;
   }
}

/**
 * F1F2 protocol command payload parser function.
 *
 * @param p_payload is a pointer to the command payload data.
 * @param pdc is the payload data count in bytes.
 * @param f1f2Cmd is the pointer to the F1F2 command structure to fill using payload data.
 *
 * @return IRC_SUCCESS if successfully parsed
 * @return IRC_FAILURE if failed to parse.
 */
IRC_Status_t F1F2_PayloadParser(uint8_t *p_payload, uint16_t pdc, F1F2Command_t *f1f2Cmd)
{
   switch (f1f2Cmd->cmd)
   {
      case F1F2_CMD_ACK:
      case F1F2_CMD_NAK:
         if (pdc != F1F2_CMD_CODE_SIZE)
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         f1f2Cmd->payload.ack.cmd = p_payload[F1F2_PD_OFFSET_CMD];
         break;

      case F1F2_CMD_REG_READ_REQ:
         if (pdc != F1F2_REG_ADDR_SIZE)
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         memcpy(&f1f2Cmd->payload.regRW.address, &p_payload[F1F2_PD_OFFSET_REG_ADDR], F1F2_REG_ADDR_SIZE);
         break;

      case F1F2_CMD_REG_READ_RSP:
      case F1F2_CMD_REG_WRITE:
         if (pdc <= F1F2_REG_ADDR_SIZE)
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         memcpy(&f1f2Cmd->payload.regRW.address, &p_payload[F1F2_PD_OFFSET_REG_ADDR], F1F2_REG_ADDR_SIZE);
         f1f2Cmd->payload.regRW.dataLength = pdc - F1F2_REG_ADDR_SIZE;
         memcpy(f1f2Cmd->payload.regRW.data, &p_payload[F1F2_PD_OFFSET_REG_VALUE], f1f2Cmd->payload.regRW.dataLength);
         f1f2Cmd->payload.regRW.padLength = 0;
         break;

      case F1F2_CMD_FILE_COUNT_REQ:
         if (pdc != 0)
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         break;

      case F1F2_CMD_FILE_COUNT_RSP:
         if (pdc != F1F2_FILE_COUNT_SIZE)
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         memcpy(&f1f2Cmd->payload.fileCount.count, &p_payload[F1F2_PD_OFFSET_FILE_COUNT], F1F2_FILE_COUNT_SIZE);
         break;

      case F1F2_CMD_FILE_INFO_REQ:
      case F1F2_CMD_FILE_CREATE_RSP:
      case F1F2_CMD_FILE_CLOSE:
      case F1F2_CMD_FILE_CHECK_REQ:
      case F1F2_CMD_FILE_DELETE:
         if (pdc != F1F2_FILE_INDEX_SIZE)
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         memcpy(&f1f2Cmd->payload.fileIndex.index, &p_payload[F1F2_PD_OFFSET_FILE_INDEX], F1F2_FILE_INDEX_SIZE);
         break;

      case F1F2_CMD_FILE_INFO_RSP:
         if (pdc != F1F2_FILE_INFO_SIZE)
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         memcpy(&f1f2Cmd->payload.fileInfo.index, &p_payload[F1F2_PD_OFFSET_FILE_INDEX], F1F2_FILE_INDEX_SIZE);
         memcpy(&f1f2Cmd->payload.fileInfo.name, &p_payload[F1F2_PD_OFFSET_FILE_INF_NAME], F1F2_FILE_NAME_SIZE);
         f1f2Cmd->payload.fileInfo.name[F1F2_FILE_NAME_SIZE] = '\0';
         memcpy(&f1f2Cmd->payload.fileInfo.size, &p_payload[F1F2_PD_OFFSET_FILE_INF_SIZE], F1F2_FILE_SIZE_SIZE);
         memcpy(&f1f2Cmd->payload.fileInfo.attributes, &p_payload[F1F2_PD_OFFSET_FILE_INF_ATTR], F1F2_FILE_ATTR_SIZE);
         memcpy(&f1f2Cmd->payload.fileInfo.id, &p_payload[F1F2_PD_OFFSET_FILE_INF_ID], F1F2_FILE_ID_SIZE);
         memcpy(&f1f2Cmd->payload.fileInfo.type, &p_payload[F1F2_PD_OFFSET_FILE_INF_TYPE], F1F2_FILE_TYPE_SIZE);
         f1f2Cmd->payload.fileInfo.type[F1F2_FILE_TYPE_SIZE] = '\0';
         break;

      case F1F2_CMD_FILE_CREATE_REQ:
         if (pdc != F1F2_FILE_NAME_SIZE)
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         memcpy(f1f2Cmd->payload.fileName.name, &p_payload[F1F2_PD_OFFSET_FILE_NAME], F1F2_FILE_NAME_SIZE);
         f1f2Cmd->payload.fileName.name[F1F2_FILE_NAME_SIZE] = '\0';
         break;

      case F1F2_CMD_FILE_READ_REQ:
         if (pdc != (F1F2_FILE_INDEX_SIZE + F1F2_FILE_OFFSET_SIZE + F1F2_FILE_LENGTH_SIZE))
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         memcpy(&f1f2Cmd->payload.fileRW.index, &p_payload[F1F2_PD_OFFSET_FILE_INDEX], F1F2_FILE_INDEX_SIZE);
         memcpy(&f1f2Cmd->payload.fileRW.offset, &p_payload[F1F2_PD_OFFSET_FILE_OFFSET], F1F2_FILE_OFFSET_SIZE);
         memcpy(&f1f2Cmd->payload.fileRW.dataLength, &p_payload[F1F2_PD_OFFSET_FILE_LENGTH], F1F2_FILE_LENGTH_SIZE);
         break;

      case F1F2_CMD_FILE_READ_RSP:
      case F1F2_CMD_FILE_WRITE:
         if (pdc <= (F1F2_FILE_INDEX_SIZE + F1F2_FILE_OFFSET_SIZE + F1F2_FILE_LENGTH_SIZE))
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         memcpy(&f1f2Cmd->payload.fileRW.index, &p_payload[F1F2_PD_OFFSET_FILE_INDEX], F1F2_FILE_INDEX_SIZE);
         memcpy(&f1f2Cmd->payload.fileRW.offset, &p_payload[F1F2_PD_OFFSET_FILE_OFFSET], F1F2_FILE_OFFSET_SIZE);
         memcpy(&f1f2Cmd->payload.fileRW.dataLength, &p_payload[F1F2_PD_OFFSET_FILE_LENGTH], F1F2_FILE_LENGTH_SIZE);
         if (pdc != (F1F2_FILE_INDEX_SIZE + F1F2_FILE_OFFSET_SIZE + F1F2_FILE_LENGTH_SIZE + f1f2Cmd->payload.fileRW.dataLength))
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         memcpy(f1f2Cmd->payload.fileRW.data, &p_payload[F1F2_PD_OFFSET_FILE_DATA], f1f2Cmd->payload.fileRW.dataLength);
         break;

      case F1F2_CMD_FILE_CHECK_RSP:
         if (pdc < (F1F2_FILE_INDEX_SIZE + F1F2_FILE_CRC16_SIZE))
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         memcpy(&f1f2Cmd->payload.fileCheck.index, &p_payload[F1F2_PD_OFFSET_FILE_INDEX], F1F2_FILE_INDEX_SIZE);
         memcpy(&f1f2Cmd->payload.fileCheck.crc16, &p_payload[F1F2_PD_OFFSET_FILE_CRC16], F1F2_FILE_CRC16_SIZE);
         break;

      case F1F2_CMD_PROM_ERASE:
         if (pdc != (F1F2_PROM_DEVICE_SIZE + F1F2_PROM_OFFSET_SIZE + F1F2_PROM_LENGTH_SIZE))
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         f1f2Cmd->payload.promErase.device = p_payload[F1F2_PD_OFFSET_PROM_DEVICE];
         memcpy(&f1f2Cmd->payload.promErase.offset, &p_payload[F1F2_PD_OFFSET_PROM_OFFSET], F1F2_PROM_OFFSET_SIZE);
         memcpy(&f1f2Cmd->payload.promErase.dataLength, &p_payload[F1F2_PD_OFFSET_PROM_LENGTH], F1F2_PROM_LENGTH_SIZE);
         break;

      case F1F2_CMD_PROM_READ_REQ:
         if (pdc != (F1F2_PROM_DEVICE_SIZE + F1F2_PROM_OFFSET_SIZE + F1F2_PROM_RW_LENGTH_SIZE))
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         f1f2Cmd->payload.promRW.device = p_payload[F1F2_PD_OFFSET_PROM_DEVICE];
         memcpy(&f1f2Cmd->payload.promRW.offset, &p_payload[F1F2_PD_OFFSET_PROM_OFFSET], F1F2_PROM_OFFSET_SIZE);
         memcpy(&f1f2Cmd->payload.promRW.dataLength, &p_payload[F1F2_PD_OFFSET_PROM_RW_LENGTH], F1F2_PROM_RW_LENGTH_SIZE);
         break;

      case F1F2_CMD_PROM_READ_RSP:
      case F1F2_CMD_PROM_WRITE:
         if (pdc <= (F1F2_PROM_DEVICE_SIZE + F1F2_PROM_OFFSET_SIZE + F1F2_PROM_RW_LENGTH_SIZE))
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         f1f2Cmd->payload.promRW.device = p_payload[F1F2_PD_OFFSET_PROM_DEVICE];
         memcpy(&f1f2Cmd->payload.promRW.offset, &p_payload[F1F2_PD_OFFSET_PROM_OFFSET], F1F2_PROM_OFFSET_SIZE);
         memcpy(&f1f2Cmd->payload.promRW.dataLength, &p_payload[F1F2_PD_OFFSET_PROM_RW_LENGTH], F1F2_PROM_RW_LENGTH_SIZE);
         if (pdc != (F1F2_PROM_DEVICE_SIZE + F1F2_PROM_OFFSET_SIZE + F1F2_PROM_RW_LENGTH_SIZE + f1f2Cmd->payload.promRW.dataLength))
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         memcpy(f1f2Cmd->payload.promRW.data, &p_payload[F1F2_PD_OFFSET_PROM_DATA], f1f2Cmd->payload.promRW.dataLength);
         break;

      case F1F2_CMD_PROM_CHECK_REQ:
         if (pdc != (F1F2_PROM_DEVICE_SIZE + F1F2_PROM_OFFSET_SIZE + F1F2_PROM_LENGTH_SIZE))
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         f1f2Cmd->payload.promCheck.device = p_payload[F1F2_PD_OFFSET_PROM_DEVICE];
         memcpy(&f1f2Cmd->payload.promCheck.offset, &p_payload[F1F2_PD_OFFSET_PROM_OFFSET], F1F2_PROM_OFFSET_SIZE);
         memcpy(&f1f2Cmd->payload.promCheck.dataLength, &p_payload[F1F2_PD_OFFSET_PROM_LENGTH], F1F2_PROM_LENGTH_SIZE);
         break;

      case F1F2_CMD_PROM_CHECK_RSP:
         if (pdc != (F1F2_PROM_DEVICE_SIZE + F1F2_PROM_OFFSET_SIZE + F1F2_PROM_LENGTH_SIZE + F1F2_PROM_CRC16_SIZE))
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         f1f2Cmd->payload.promCheck.device = p_payload[F1F2_PD_OFFSET_PROM_DEVICE];
         memcpy(&f1f2Cmd->payload.promCheck.offset, &p_payload[F1F2_PD_OFFSET_PROM_OFFSET], F1F2_PROM_OFFSET_SIZE);
         memcpy(&f1f2Cmd->payload.promCheck.dataLength, &p_payload[F1F2_PD_OFFSET_PROM_LENGTH], F1F2_PROM_LENGTH_SIZE);
         memcpy(&f1f2Cmd->payload.promCheck.crc16, &p_payload[F1F2_PD_OFFSET_PROM_CRC16], F1F2_PROM_CRC16_SIZE);
         break;

      case F1F2_CMD_PING:
      case F1F2_CMD_FILE_FORMAT:
      case F1F2_CMD_FILE_USED_SPACE_REQ:
      case F1F2_CMD_FILE_FREE_SPACE_REQ:
      case F1F2_CMD_FILE_TOTAL_SPACE_REQ:
         if (pdc != 0)
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         break;

      case F1F2_CMD_FILE_USED_SPACE_RSP:
      case F1F2_CMD_FILE_FREE_SPACE_RSP:
      case F1F2_CMD_FILE_TOTAL_SPACE_RSP:
         if (pdc != F1F2_FILE_SPACE_SIZE)
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         memcpy(&f1f2Cmd->payload.fileSpace.space, &p_payload[F1F2_PD_OFFSET_FILE_SPACE], F1F2_FILE_SPACE_SIZE);
         break;

      case F1F2_CMD_DEBUG_TEXT:
      case F1F2_CMD_DEBUG_CMD:
         if (pdc > F1F2_MAX_DEBUG_DATA_SIZE)
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         memcpy(f1f2Cmd->payload.debug.text, &p_payload[F1F2_PD_OFFSET_DEBUG_DATA], pdc);
         f1f2Cmd->payload.debug.text[pdc] = 0;
         break;

      case F1F2_CMD_NETWORK:
         if (pdc < F1F2_MIN_NET_DATA_SIZE)
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         f1f2Cmd->isNetwork = 1;
         f1f2Cmd->srcAddr = p_payload[F1F2_PD_OFFSET_NET_SRC_ADDR];
         f1f2Cmd->srcPort = p_payload[F1F2_PD_OFFSET_NET_SRC_PORT];
         f1f2Cmd->destAddr = p_payload[F1F2_PD_OFFSET_NET_DEST_ADDR];
         f1f2Cmd->destPort = p_payload[F1F2_PD_OFFSET_NET_DEST_PORT];
         f1f2Cmd->cmd = p_payload[F1F2_PD_OFFSET_NET_CMD];

         return F1F2_PayloadParser(&p_payload[F1F2_PD_OFFSET_NET_PAYLOAD_DATA],
               pdc - F1F2_MIN_NET_DATA_SIZE, f1f2Cmd);
         break;

      default:
         // Unknown command
         F1F2_ERR("Unknown command code (cmd = %d).", f1f2Cmd->cmd);
         return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}

/**
 * F1F2 protocol command payload parser function.
 *
 * @param circByteBuffer is a pointer to the circular byte buffer to parse.
 * @param offset is the payload data offset in bytes.
 * @param pdc is the payload data count in bytes.
 * @param f1f2Cmd is the pointer to the F1F2 command structure to fill using payload data.
 *
 * @return IRC_SUCCESS if successfully parsed
 * @return IRC_FAILURE if failed to parse.
 */
IRC_Status_t F1F2_CircPayloadParser(circByteBuffer_t *circByteBuffer, uint16_t offset, uint16_t pdc, F1F2Command_t *f1f2Cmd)
{
   switch (f1f2Cmd->cmd)
   {
      case F1F2_CMD_ACK:
      case F1F2_CMD_NAK:
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_CMD, F1F2_CMD_CODE_SIZE, (uint8_t *)&f1f2Cmd->payload.ack.cmd);
         break;

      case F1F2_CMD_REG_READ_REQ:
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_REG_ADDR, F1F2_REG_ADDR_SIZE, (uint8_t *)&f1f2Cmd->payload.regRW.address);
         break;

      case F1F2_CMD_REG_READ_RSP:
      case F1F2_CMD_REG_WRITE:
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_REG_ADDR, F1F2_REG_ADDR_SIZE, (uint8_t *)&f1f2Cmd->payload.regRW.address);
         f1f2Cmd->payload.regRW.dataLength = pdc - F1F2_REG_ADDR_SIZE;
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_REG_VALUE, f1f2Cmd->payload.regRW.dataLength, f1f2Cmd->payload.regRW.data);
         f1f2Cmd->payload.regRW.padLength = 0;
         break;

      case F1F2_CMD_FILE_COUNT_REQ:
      case F1F2_CMD_FILE_USED_SPACE_REQ:
      case F1F2_CMD_FILE_FREE_SPACE_REQ:
      case F1F2_CMD_FILE_TOTAL_SPACE_REQ:
      case F1F2_CMD_FILE_FORMAT:
      case F1F2_CMD_PING:
         // Nothing to do
         break;

      case F1F2_CMD_FILE_COUNT_RSP:
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_FILE_COUNT, F1F2_FILE_COUNT_SIZE, (uint8_t *)&f1f2Cmd->payload.fileCount.count);
         break;

      case F1F2_CMD_FILE_INFO_REQ:
      case F1F2_CMD_FILE_CREATE_RSP:
      case F1F2_CMD_FILE_CLOSE:
      case F1F2_CMD_FILE_CHECK_REQ:
      case F1F2_CMD_FILE_DELETE:
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_FILE_INDEX, F1F2_FILE_INDEX_SIZE, (uint8_t *)&f1f2Cmd->payload.fileIndex.index);
         break;

      case F1F2_CMD_FILE_INFO_RSP:
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_FILE_INDEX, F1F2_FILE_INDEX_SIZE, (uint8_t *)&f1f2Cmd->payload.fileInfo.index);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_FILE_INF_NAME, F1F2_FILE_NAME_SIZE, (uint8_t *)&f1f2Cmd->payload.fileInfo.name);
         f1f2Cmd->payload.fileInfo.name[F1F2_FILE_NAME_SIZE] = '\0';
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_FILE_INF_SIZE, F1F2_FILE_SIZE_SIZE, (uint8_t *)&f1f2Cmd->payload.fileInfo.size);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_FILE_INF_ATTR, F1F2_FILE_ATTR_SIZE, (uint8_t *)&f1f2Cmd->payload.fileInfo.attributes);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_FILE_INF_ID, F1F2_FILE_ID_SIZE, (uint8_t *)&f1f2Cmd->payload.fileInfo.id);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_FILE_INF_TYPE, F1F2_FILE_TYPE_SIZE, (uint8_t *)&f1f2Cmd->payload.fileInfo.type);
         f1f2Cmd->payload.fileInfo.type[F1F2_FILE_TYPE_SIZE] = '\0';
         break;

      case F1F2_CMD_FILE_CREATE_REQ:
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_FILE_NAME, F1F2_FILE_NAME_SIZE, (uint8_t *)&f1f2Cmd->payload.fileName.name);
         f1f2Cmd->payload.fileName.name[F1F2_FILE_NAME_SIZE] = '\0';
         break;

      case F1F2_CMD_FILE_READ_REQ:
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_FILE_INDEX, F1F2_FILE_INDEX_SIZE, (uint8_t *)&f1f2Cmd->payload.fileRW.index);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_FILE_OFFSET, F1F2_FILE_OFFSET_SIZE, (uint8_t *)&f1f2Cmd->payload.fileRW.offset);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_FILE_LENGTH, F1F2_FILE_LENGTH_SIZE, (uint8_t *)&f1f2Cmd->payload.fileRW.dataLength);
         break;

      case F1F2_CMD_FILE_READ_RSP:
      case F1F2_CMD_FILE_WRITE:
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_FILE_INDEX, F1F2_FILE_INDEX_SIZE, (uint8_t *)&f1f2Cmd->payload.fileRW.index);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_FILE_OFFSET, F1F2_FILE_OFFSET_SIZE, (uint8_t *)&f1f2Cmd->payload.fileRW.offset);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_FILE_LENGTH, F1F2_FILE_LENGTH_SIZE, (uint8_t *)&f1f2Cmd->payload.fileRW.dataLength);
         if (pdc != (F1F2_FILE_INDEX_SIZE + F1F2_FILE_OFFSET_SIZE + F1F2_FILE_LENGTH_SIZE + f1f2Cmd->payload.fileRW.dataLength))
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_FILE_DATA, f1f2Cmd->payload.fileRW.dataLength, f1f2Cmd->payload.fileRW.data);
         break;

      case F1F2_CMD_FILE_CHECK_RSP:
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_FILE_INDEX, F1F2_FILE_INDEX_SIZE, (uint8_t *)&f1f2Cmd->payload.fileCheck.index);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_FILE_CRC16, F1F2_FILE_CRC16_SIZE, (uint8_t *)&f1f2Cmd->payload.fileCheck.crc16);
         break;

      case F1F2_CMD_PROM_ERASE:
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_PROM_DEVICE, F1F2_PROM_DEVICE_SIZE, (uint8_t *)&f1f2Cmd->payload.promErase.device);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_PROM_OFFSET, F1F2_PROM_OFFSET_SIZE, (uint8_t *)&f1f2Cmd->payload.promErase.offset);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_PROM_LENGTH, F1F2_PROM_LENGTH_SIZE, (uint8_t *)&f1f2Cmd->payload.promErase.dataLength);
         break;

      case F1F2_CMD_PROM_READ_REQ:
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_PROM_DEVICE, F1F2_PROM_DEVICE_SIZE, (uint8_t *)&f1f2Cmd->payload.promRW.device);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_PROM_OFFSET, F1F2_PROM_OFFSET_SIZE, (uint8_t *)&f1f2Cmd->payload.promRW.offset);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_PROM_RW_LENGTH, F1F2_PROM_RW_LENGTH_SIZE, (uint8_t *)&f1f2Cmd->payload.promRW.dataLength);
         break;

      case F1F2_CMD_PROM_READ_RSP:
      case F1F2_CMD_PROM_WRITE:
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_PROM_DEVICE, F1F2_PROM_DEVICE_SIZE, (uint8_t *)&f1f2Cmd->payload.promRW.device);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_PROM_OFFSET, F1F2_PROM_OFFSET_SIZE, (uint8_t *)&f1f2Cmd->payload.promRW.offset);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_PROM_RW_LENGTH, F1F2_PROM_RW_LENGTH_SIZE, (uint8_t *)&f1f2Cmd->payload.promRW.dataLength);
         if (pdc != (F1F2_PROM_DEVICE_SIZE + F1F2_PROM_OFFSET_SIZE + F1F2_PROM_RW_LENGTH_SIZE + f1f2Cmd->payload.promRW.dataLength))
         {
            F1F2_ERR("Invalid Payload Data Count (cmd = %d).", f1f2Cmd->cmd);
            return IRC_FAILURE;
         }
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_PROM_DATA, f1f2Cmd->payload.promRW.dataLength, f1f2Cmd->payload.promRW.data);
         break;

      case F1F2_CMD_PROM_CHECK_REQ:
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_PROM_DEVICE, F1F2_PROM_DEVICE_SIZE, (uint8_t *)&f1f2Cmd->payload.promCheck.device);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_PROM_OFFSET, F1F2_PROM_OFFSET_SIZE, (uint8_t *)&f1f2Cmd->payload.promCheck.offset);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_PROM_LENGTH, F1F2_PROM_LENGTH_SIZE, (uint8_t *)&f1f2Cmd->payload.promCheck.dataLength);
         break;

      case F1F2_CMD_PROM_CHECK_RSP:
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_PROM_DEVICE, F1F2_PROM_DEVICE_SIZE, (uint8_t *)&f1f2Cmd->payload.promCheck.device);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_PROM_OFFSET, F1F2_PROM_OFFSET_SIZE, (uint8_t *)&f1f2Cmd->payload.promCheck.offset);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_PROM_LENGTH, F1F2_PROM_LENGTH_SIZE, (uint8_t *)&f1f2Cmd->payload.promCheck.dataLength);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_PROM_CRC16, F1F2_PROM_CRC16_SIZE, (uint8_t *)&f1f2Cmd->payload.promCheck.crc16);
         break;

      case F1F2_CMD_DEBUG_TEXT:
      case F1F2_CMD_DEBUG_CMD:
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_DEBUG_DATA, pdc, (uint8_t *)f1f2Cmd->payload.debug.text);
         f1f2Cmd->payload.debug.text[pdc] = 0;
         break;

      case F1F2_CMD_FILE_USED_SPACE_RSP:
      case F1F2_CMD_FILE_FREE_SPACE_RSP:
      case F1F2_CMD_FILE_TOTAL_SPACE_RSP:
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_FILE_SPACE, pdc, (uint8_t *)&f1f2Cmd->payload.fileSpace.space);
         break;


      case F1F2_CMD_NETWORK:
         f1f2Cmd->isNetwork = 1;
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_NET_SRC_ADDR, F1F2_NET_SRC_ADDR_SIZE, (uint8_t *)&f1f2Cmd->srcAddr);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_NET_SRC_PORT, F1F2_NET_SRC_PORT_SIZE, (uint8_t *)&f1f2Cmd->srcPort);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_NET_DEST_ADDR, F1F2_NET_DEST_ADDR_SIZE, (uint8_t *)&f1f2Cmd->destAddr);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_NET_DEST_PORT, F1F2_NET_DEST_PORT_SIZE, (uint8_t *)&f1f2Cmd->destPort);
         CBB_Peekn(circByteBuffer, offset + F1F2_PD_OFFSET_NET_CMD, F1F2_CMD_CODE_SIZE, (uint8_t *)&f1f2Cmd->cmd);

         return F1F2_CircPayloadParser(circByteBuffer, offset + F1F2_PD_OFFSET_NET_PAYLOAD_DATA,
               pdc - F1F2_MIN_NET_DATA_SIZE, f1f2Cmd);
         break;

      default:
         // Unknown command
         F1F2_ERR("Unknown command code (cmd = %d).", f1f2Cmd->cmd);
         return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}

/**
 * Build response to the specified request.
 *
 * @param p_request is the pointer to the request command.
 * @param p_response is the pointer to the response command to fill.
 */
void F1F2_BuildResponse(F1F2Command_t *p_request, F1F2Command_t *p_response)
{
   uint8_t destAddr;
   uint8_t destPort;

   if (p_request->isNetwork == 1)
   {
      // Save request destination address and port in case p_response = p_request
      destAddr = p_request->destAddr;
      destPort = p_request->destPort;

      p_response->isNetwork = 1;
      p_response->destAddr = p_request->srcAddr;
      p_response->destPort = p_request->srcPort;
      p_response->srcAddr = destAddr;
      p_response->srcPort = destPort;
   }
}

/**
 * Build ACK response to the specified request.
 *
 * @param p_request is the pointer to the request command.
 * @param p_response is the pointer to the response command to fill.
 */
void F1F2_BuildACKResponse(F1F2Command_t *p_request, F1F2Command_t *p_response)
{
   F1F2_BuildResponse(p_request, p_response);

   // Fill acknowledged command first in case p_response = p_request
   p_response->payload.ack.cmd = p_request->cmd;
   p_response->cmd = F1F2_CMD_ACK;
}

/**
 * Build NAK response to the specified request.
 *
 * @param p_request is the pointer to the request command.
 * @param p_response is the pointer to the response command to fill.
 */
void F1F2_BuildNAKResponse(F1F2Command_t *p_request, F1F2Command_t *p_response)
{
   F1F2_BuildResponse(p_request, p_response);

   // Fill acknowledged command first in case p_response = p_request
   p_response->payload.ack.cmd = p_request->cmd;
   p_response->cmd = F1F2_CMD_NAK;
}

/**
 * F1F2 protocol command builder function.
 *
 * @param f1f2Cmd is the pointer to the F1F2 command structure that is going to be used to generate transmitted data.
 * @param buffer is a pointer to the command raw data buffer that will be transmitted.
 * @param buflen is the maximum length that can be written into buffer.
 *
 * @return The command length to be transmitted.
 */
uint32_t F1F2_CommandBuilder(F1F2Command_t *f1f2Cmd, uint8_t *buffer, uint16_t buflen)
{
   F1F2PayloadData_t payloadData[11];
   uint16_t payloadDataCount;
   uint8_t cmd = f1f2Cmd->cmd;

   if (f1f2Cmd->isNetwork == 1)
   {
      cmd = F1F2_CMD_NETWORK;
   }

   if (F1F2_CommandPayloadBuilder(f1f2Cmd, payloadData, NUM_OF(payloadData), &payloadDataCount) != IRC_SUCCESS)
   {
      return 0;
   }

   return F1F2_FrameBuilder(buffer, buflen, cmd, payloadData, payloadDataCount);
}

/**
 * F1F2 protocol circular command builder function.
 *
 * @param f1f2Cmd is the pointer to the F1F2 command structure that is going to be used to generate transmitted data.
 * @param circByteBuffer is a pointer to the circular byte buffer that will be transmitted.
 *
 * @return The command length to be transmitted.
 */
uint32_t F1F2_CircCommandBuilder(F1F2Command_t *f1f2Cmd, circByteBuffer_t *circByteBuffer)
{
   F1F2PayloadData_t payloadData[11];
   uint16_t payloadDataCount;
   uint8_t cmd = f1f2Cmd->cmd;

   if (f1f2Cmd->isNetwork == 1)
   {
      cmd = F1F2_CMD_NETWORK;
   }

   if (F1F2_CommandPayloadBuilder(f1f2Cmd, payloadData, NUM_OF(payloadData), &payloadDataCount) != IRC_SUCCESS)
   {
      return 0;
   }

   return F1F2_CircFrameBuilder(circByteBuffer, cmd, payloadData, payloadDataCount);
}

/**
 * F1F2 protocol command payload builder function.
 *
 * @param f1f2Cmd is the pointer to the F1F2 command structure that is going to be used to generate transmitted data.
 * @param payloadData is the payload data array.
 * @param payloadDataSize is the maximum number of element that can be contained in payload data array.
 * @param payloadDataCount is the pointer to the number of payload data.
 *
 * @return The command length to be transmitted.
 */
IRC_Status_t F1F2_CommandPayloadBuilder(F1F2Command_t *f1f2Cmd, F1F2PayloadData_t payloadData[], uint16_t payloadDataSize, uint16_t *payloadDataCount)
{
   *payloadDataCount = 0;

   if (f1f2Cmd->isNetwork == 1)
   {
      if (*payloadDataCount + 5 > payloadDataSize) return IRC_FAILURE;

      payloadData[*payloadDataCount].p_data = &f1f2Cmd->srcAddr;
      payloadData[*payloadDataCount].dataLength = F1F2_NET_SRC_ADDR_SIZE;
      payloadData[*payloadDataCount].padLength = 0;
      (*payloadDataCount)++;

      payloadData[*payloadDataCount].p_data = &f1f2Cmd->srcPort;
      payloadData[*payloadDataCount].dataLength = F1F2_NET_SRC_PORT_SIZE;
      payloadData[*payloadDataCount].padLength = 0;
      (*payloadDataCount)++;

      payloadData[*payloadDataCount].p_data = &f1f2Cmd->destAddr;
      payloadData[*payloadDataCount].dataLength = F1F2_NET_DEST_ADDR_SIZE;
      payloadData[*payloadDataCount].padLength = 0;
      (*payloadDataCount)++;

      payloadData[*payloadDataCount].p_data = &f1f2Cmd->destPort;
      payloadData[*payloadDataCount].dataLength = F1F2_NET_DEST_PORT_SIZE;
      payloadData[*payloadDataCount].padLength = 0;
      (*payloadDataCount)++;

      payloadData[*payloadDataCount].p_data = &f1f2Cmd->cmd;
      payloadData[*payloadDataCount].dataLength = F1F2_CMD_CODE_SIZE;
      payloadData[*payloadDataCount].padLength = 0;
      (*payloadDataCount)++;
   }

   switch (f1f2Cmd->cmd)
   {
      case F1F2_CMD_ACK:
      case F1F2_CMD_NAK:
         if (*payloadDataCount + 1 > payloadDataSize) return IRC_FAILURE;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.ack.cmd;
         payloadData[*payloadDataCount].dataLength = F1F2_CMD_CODE_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;
         break;

      case F1F2_CMD_REG_READ_REQ:
         if (*payloadDataCount + 1 > payloadDataSize) return IRC_FAILURE;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.regRW.address;
         payloadData[*payloadDataCount].dataLength = F1F2_REG_ADDR_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;
         break;

      case F1F2_CMD_REG_READ_RSP:
      case F1F2_CMD_REG_WRITE:
         if (*payloadDataCount + 2 > payloadDataSize) return IRC_FAILURE;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.regRW.address;
         payloadData[*payloadDataCount].dataLength = F1F2_REG_ADDR_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = f1f2Cmd->payload.regRW.data;
         payloadData[*payloadDataCount].dataLength = f1f2Cmd->payload.regRW.dataLength;
         payloadData[*payloadDataCount].padLength = f1f2Cmd->payload.regRW.padLength;
         (*payloadDataCount)++;
         break;

      case F1F2_CMD_FILE_COUNT_REQ:
         break;

      case F1F2_CMD_FILE_COUNT_RSP:
         if (*payloadDataCount + 1 > payloadDataSize) return IRC_FAILURE;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.fileCount.count;
         payloadData[*payloadDataCount].dataLength = F1F2_FILE_COUNT_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;
         break;

      case F1F2_CMD_FILE_INFO_REQ:
      case F1F2_CMD_FILE_CREATE_RSP:
      case F1F2_CMD_FILE_CLOSE:
      case F1F2_CMD_FILE_CHECK_REQ:
      case F1F2_CMD_FILE_DELETE:
         if (*payloadDataCount + 1 > payloadDataSize) return IRC_FAILURE;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.fileIndex.index;
         payloadData[*payloadDataCount].dataLength = F1F2_FILE_INDEX_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;
         break;

      case F1F2_CMD_FILE_INFO_RSP:
         if (*payloadDataCount + 6 > payloadDataSize) return IRC_FAILURE;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.fileInfo.index;
         payloadData[*payloadDataCount].dataLength = F1F2_FILE_INDEX_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = f1f2Cmd->payload.fileInfo.name;
         payloadData[*payloadDataCount].dataLength = F1F2_FILE_NAME_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.fileInfo.size;
         payloadData[*payloadDataCount].dataLength = F1F2_FILE_SIZE_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.fileInfo.attributes;
         payloadData[*payloadDataCount].dataLength = F1F2_FILE_ATTR_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.fileInfo.id;
         payloadData[*payloadDataCount].dataLength = F1F2_FILE_ID_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.fileInfo.type;
         payloadData[*payloadDataCount].dataLength = F1F2_FILE_TYPE_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;
         break;

      case F1F2_CMD_FILE_CREATE_REQ:
         if (*payloadDataCount + 1 > payloadDataSize) return IRC_FAILURE;

         payloadData[*payloadDataCount].p_data = f1f2Cmd->payload.fileName.name;
         payloadData[*payloadDataCount].dataLength = F1F2_FILE_NAME_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;
         break;

      case F1F2_CMD_FILE_READ_REQ:
         if (*payloadDataCount + 3 > payloadDataSize) return IRC_FAILURE;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.fileRW.index;
         payloadData[*payloadDataCount].dataLength = F1F2_FILE_INDEX_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.fileRW.offset;
         payloadData[*payloadDataCount].dataLength = F1F2_FILE_OFFSET_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.fileRW.dataLength;
         payloadData[*payloadDataCount].dataLength = F1F2_FILE_LENGTH_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;
         break;

      case F1F2_CMD_FILE_READ_RSP:
      case F1F2_CMD_FILE_WRITE:
         if (*payloadDataCount + 4 > payloadDataSize) return IRC_FAILURE;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.fileRW.index;
         payloadData[*payloadDataCount].dataLength = F1F2_FILE_INDEX_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.fileRW.offset;
         payloadData[*payloadDataCount].dataLength = F1F2_FILE_OFFSET_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.fileRW.dataLength;
         payloadData[*payloadDataCount].dataLength = F1F2_FILE_LENGTH_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = f1f2Cmd->payload.fileRW.data;
         payloadData[*payloadDataCount].dataLength = f1f2Cmd->payload.fileRW.dataLength;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;
         break;

      case F1F2_CMD_FILE_CHECK_RSP:
         if (*payloadDataCount + 2 > payloadDataSize) return IRC_FAILURE;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.fileCheck.index;
         payloadData[*payloadDataCount].dataLength = F1F2_FILE_INDEX_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.fileCheck.crc16;
         payloadData[*payloadDataCount].dataLength = F1F2_FILE_CRC16_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;
         break;

      case F1F2_CMD_PROM_ERASE:
         if (*payloadDataCount + 3 > payloadDataSize) return IRC_FAILURE;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.promErase.device;
         payloadData[*payloadDataCount].dataLength = F1F2_PROM_DEVICE_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.promErase.offset;
         payloadData[*payloadDataCount].dataLength = F1F2_PROM_OFFSET_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.promErase.dataLength;
         payloadData[*payloadDataCount].dataLength = F1F2_PROM_LENGTH_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;
         break;

      case F1F2_CMD_PROM_READ_REQ:
         if (*payloadDataCount + 3 > payloadDataSize) return IRC_FAILURE;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.promRW.device;
         payloadData[*payloadDataCount].dataLength = F1F2_PROM_DEVICE_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.promRW.offset;
         payloadData[*payloadDataCount].dataLength = F1F2_PROM_OFFSET_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.promRW.dataLength;
         payloadData[*payloadDataCount].dataLength = F1F2_PROM_RW_LENGTH_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;
         break;

      case F1F2_CMD_PROM_READ_RSP:
      case F1F2_CMD_PROM_WRITE:
         if (*payloadDataCount + 4 > payloadDataSize) return IRC_FAILURE;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.promRW.device;
         payloadData[*payloadDataCount].dataLength = F1F2_PROM_DEVICE_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.promRW.offset;
         payloadData[*payloadDataCount].dataLength = F1F2_PROM_OFFSET_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.promRW.dataLength;
         payloadData[*payloadDataCount].dataLength = F1F2_PROM_RW_LENGTH_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = f1f2Cmd->payload.promRW.data;
         payloadData[*payloadDataCount].dataLength = f1f2Cmd->payload.promRW.dataLength;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;
         break;

      case F1F2_CMD_PROM_CHECK_REQ:
         if (*payloadDataCount + 3 > payloadDataSize) return IRC_FAILURE;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.promCheck.device;
         payloadData[*payloadDataCount].dataLength = F1F2_PROM_DEVICE_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.promCheck.offset;
         payloadData[*payloadDataCount].dataLength = F1F2_PROM_OFFSET_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.promCheck.dataLength;
         payloadData[*payloadDataCount].dataLength = F1F2_PROM_LENGTH_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;
         break;

      case F1F2_CMD_PROM_CHECK_RSP:
         if (*payloadDataCount + 4 > payloadDataSize) return IRC_FAILURE;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.promCheck.device;
         payloadData[*payloadDataCount].dataLength = F1F2_PROM_DEVICE_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.promCheck.offset;
         payloadData[*payloadDataCount].dataLength = F1F2_PROM_OFFSET_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.promCheck.dataLength;
         payloadData[*payloadDataCount].dataLength = F1F2_PROM_LENGTH_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.promCheck.crc16;
         payloadData[*payloadDataCount].dataLength = F1F2_PROM_CRC16_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;
         break;

      case F1F2_CMD_PING:
      case F1F2_CMD_FILE_FORMAT:
      case F1F2_CMD_FILE_USED_SPACE_REQ:
      case F1F2_CMD_FILE_FREE_SPACE_REQ:
      case F1F2_CMD_FILE_TOTAL_SPACE_REQ:
         break;

      case F1F2_CMD_DEBUG_TEXT:
      case F1F2_CMD_DEBUG_CMD:
         if (*payloadDataCount + 1 > payloadDataSize) return IRC_FAILURE;

         payloadData[*payloadDataCount].p_data = f1f2Cmd->payload.debug.text;
         payloadData[*payloadDataCount].dataLength = strlen(f1f2Cmd->payload.debug.text);
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;
         break;

      case F1F2_CMD_FILE_USED_SPACE_RSP:
      case F1F2_CMD_FILE_FREE_SPACE_RSP:
      case F1F2_CMD_FILE_TOTAL_SPACE_RSP:
         if (*payloadDataCount + 1 > payloadDataSize) return IRC_FAILURE;

         payloadData[*payloadDataCount].p_data = &f1f2Cmd->payload.fileSpace.space;
         payloadData[*payloadDataCount].dataLength = F1F2_FILE_SPACE_SIZE;
         payloadData[*payloadDataCount].padLength = 0;
         (*payloadDataCount)++;
         break;

      default:
         F1F2_ERR("Unknown command  (cmd = %d).", f1f2Cmd->cmd);
         // Unknown command
         return 0;
   }

   return IRC_SUCCESS;
}

/**
 * F1F2 protocol frame builder function.
 *
 * @param buffer is a pointer to the command raw data buffer that will be transmitted.
 * @param buflen is the maximum length that can be written into buffer.
 * @param cmd is the F1F2 command code.
 * @param payloadData is the payload data array.
 * @param payloadDataCount is the number of payload data.
 *
 * @return The command length to be transmitted.
 */
uint32_t F1F2_FrameBuilder(uint8_t *buffer, uint16_t buflen, uint8_t cmd, F1F2PayloadData_t payloadData[], uint16_t payloadDataCount)
{
   uint16_t pdc;     // Payload Data Count
   uint16_t crc16;   // CRC-16 value
   uint16_t i;

   // Write payload data into byte buffer
   pdc = 0;
   for (i = 0; i < payloadDataCount; i++)
   {
      if ((F1F2_MIN_PACKET_SIZE + pdc + payloadData[i].dataLength + payloadData[i].padLength) > buflen)
      {
         return 0;
      }
      memcpy(&buffer[F1F2_OFFSET_PAYLOAD_DATA + pdc], payloadData[i].p_data, payloadData[i].dataLength);
      pdc += payloadData[i].dataLength;
      memset(&buffer[F1F2_OFFSET_PAYLOAD_DATA + pdc], 0, payloadData[i].padLength);
      pdc += payloadData[i].padLength;
   }

   // Write frame data into byte buffer
   buffer[F1F2_OFFSET_SOP] = F1F2_SOP;
   buffer[F1F2_OFFSET_CMD] = cmd;
   memcpy(&buffer[F1F2_OFFSET_PDC], &pdc, sizeof(pdc));
   crc16 = CRC16(0xFFFF, buffer, F1F2_OFFSET_PAYLOAD_DATA + pdc);
   memcpy(&buffer[F1F2_OFFSET_PAYLOAD_DATA + pdc], &crc16, sizeof(crc16));
   buffer[F1F2_OFFSET_PAYLOAD_DATA + pdc + F1F2_CRC16_SIZE] = F1F2_EOP;

   return (F1F2_MIN_PACKET_SIZE + pdc);
}

/**
 * F1F2 protocol circular frame builder function.
 *
 * @param buffer is a pointer to the command raw data buffer that will be transmitted.
 * @param buflen is the maximum length that can be written into buffer.
 * @param cmd is the F1F2 command code.
 * @param payloadData is the payload data array.
 * @param payloadDataCount is the number of payload data.
 *
 * @return The command length to be transmitted.
 */
uint32_t F1F2_CircFrameBuilder(circByteBuffer_t *circByteBuffer, uint8_t cmd, F1F2PayloadData_t payloadData[], uint16_t payloadDataCount)
{
   uint16_t pdc;     // Payload Data Count
   uint16_t crc16;   // CRC-16 value
   uint16_t i;

   if (circByteBuffer == NULL)
   {
      return 0;
   }

   // Compute payload data count
   pdc = 0;
   for (i = 0; i < payloadDataCount; i++)
   {
      pdc += payloadData[i].dataLength + payloadData[i].padLength;
   }

   // Payload data count validation
   if ((CBB_Length(circByteBuffer) + F1F2_MIN_PACKET_SIZE + pdc) > circByteBuffer->size)
   {
      return 0;
   }

   // Write frame data into byte buffer
   CBB_Push(circByteBuffer, F1F2_SOP);
   CBB_Push(circByteBuffer, cmd);
   CBB_Pushn(circByteBuffer, sizeof(pdc), (uint8_t *)&pdc);
   for (i = 0; i < payloadDataCount; i++)
   {
      CBB_Pushn(circByteBuffer, payloadData[i].dataLength, (uint8_t*)payloadData[i].p_data);
      CBB_Pushvaln(circByteBuffer, payloadData[i].padLength, 0);
   }
   crc16 = CBB_CRC16n(0xFFFF, circByteBuffer, CBB_Length(circByteBuffer) - (F1F2_OFFSET_PAYLOAD_DATA + pdc), F1F2_OFFSET_PAYLOAD_DATA + pdc);
   CBB_Pushn(circByteBuffer, sizeof(crc16), (uint8_t*)&crc16);
   CBB_Push(circByteBuffer, F1F2_EOP);

   return (F1F2_MIN_PACKET_SIZE + pdc);
}

/**
 * Return command name string corresponding to specified command code.
 *
 * @param cmd is the F1F2 command code.
 *
 * @return The command name string.
 */
char *F1F2_CommandNameToString(uint8_t cmd)
{
   switch (cmd)
   {
      case F1F2_CMD_NONE: return "NONE";
      case F1F2_CMD_ACK: return "ACK";
      case F1F2_CMD_NAK: return "NAK";
      case F1F2_CMD_REG_READ_REQ: return "REG_READ";
      case F1F2_CMD_REG_READ_RSP: return "REG_READ_RSP";
      case F1F2_CMD_REG_WRITE: return "REG_WRITE";
      case F1F2_CMD_FILE_COUNT_REQ: return "FILE_COUNT_REQ";
      case F1F2_CMD_FILE_COUNT_RSP: return "FILE_COUNT_RSP";
      case F1F2_CMD_FILE_INFO_REQ: return "FILE_INFO_REQ";
      case F1F2_CMD_FILE_INFO_RSP: return "FILE_INFO_RSP";
      case F1F2_CMD_FILE_CREATE_REQ: return "FILE_CREATE_REQ";
      case F1F2_CMD_FILE_CREATE_RSP: return "FILE_CREATE_RSP";
      case F1F2_CMD_FILE_READ_REQ: return "FILE_READ_REQ";
      case F1F2_CMD_FILE_READ_RSP: return "FILE_READ_RSP";
      case F1F2_CMD_FILE_WRITE: return "FILE_WRITE";
      case F1F2_CMD_FILE_CLOSE: return "FILE_CLOSE";
      case F1F2_CMD_FILE_CHECK_REQ: return "FILE_CHECK_REQ";
      case F1F2_CMD_FILE_CHECK_RSP: return "FILE_CHECK_RSP";
      case F1F2_CMD_FILE_DELETE: return "FILE_DELETE";
      case F1F2_CMD_FILE_FORMAT: return "FILE_FORMAT";
      case F1F2_CMD_PROM_ERASE: return "PROM_ERASE";
      case F1F2_CMD_PROM_READ_REQ: return "PROM_READ_REQ";
      case F1F2_CMD_PROM_READ_RSP: return "PROM_READ_RSP";
      case F1F2_CMD_PROM_WRITE: return "PROM_WRITE";
      case F1F2_CMD_PROM_CHECK_REQ: return "PROM_CHECK_REQ";
      case F1F2_CMD_PROM_CHECK_RSP: return "PROM_CHECK_RSP";
      case F1F2_CMD_PING: return "PING";
      case F1F2_CMD_DEBUG_TEXT: return "DEBUG_TEXT";
      case F1F2_CMD_DEBUG_CMD: return "DEBUG_CMD";
      case F1F2_CMD_FILE_USED_SPACE_REQ: return "FILE_USED_SPACE_REQ";
      case F1F2_CMD_FILE_USED_SPACE_RSP: return "FILE_USED_SPACE_RSP";
      case F1F2_CMD_FILE_FREE_SPACE_REQ: return "FILE_FREE_SPACE_REQ";
      case F1F2_CMD_FILE_FREE_SPACE_RSP: return "FILE_FREE_SPACE_RSP";
      case F1F2_CMD_FILE_TOTAL_SPACE_REQ: return "FILE_TOTAL_SPACE_REQ";
      case F1F2_CMD_FILE_TOTAL_SPACE_RSP: return "FILE_TOTAL_SPACE_RSP";
      case F1F2_CMD_NETWORK: return "NETWORK";
      case F1F2_CMD_ERROR: return "ERROR";
      default: return "UNKNOWN";
   }
}
