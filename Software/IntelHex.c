/**
 * @file IntelHex.c
 * Intel HEX file format parser module implementation.
 *
 * This file implements the module used to parse Intel HEX file format.
 * This code is inspired from the Xilinx srec bootloader.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "IntelHex.h"
#include "CRC.h"
#include "utils.h"

/**
 * Compute Intel HEX checksum.
 *
 * @param buffer is the hex digits char buffer.
 * @param buflen is the hex digits char buffer length.
 *
 * @return the Intel HEX checksum.
 */
uint8_t IHEX_ComputeChecksum(const char *buffer, uint32_t buflen)
{
   return ~Checksum8Hex(buffer, buflen) + 1;
}

/**
 * Get next Intel HEX record from a char buffer.
 *
 * @param buffer is the char buffer.
 * @param buflen is the char buffer length.
 * @param lbuffer is the line char buffer (updated in this function).
 * @param p_lbuflen is a pointer to the line char buffer length (updated in this function).
 * @param p_charRead is a pointer to the number of char that have been read from buffer.
 * @param p_termCount is a pointer to the number of terminator that have been read from buffer (updated in this function).
 *
 * @return IRC_SUCCESS if a complete line has been copied into line char buffer.
 * @return IRC_NOT_DONE if a chars have been copied into line char buffer but no terminator have been met.
 * @return IRC_FAILURE if maximum number of char have been copied into line char buffer but no terminator have been met.
 */
IRC_Status_t IHEX_GetNextLine(const char *buffer, uint32_t buflen, char *lbuffer, uint32_t *p_lbuflen, uint32_t *p_charRead, uint8_t *p_termCount)
{
   *p_charRead = 0;

   while (*p_charRead < buflen)
   {
      if (((*p_termCount) > 0) && ((buffer[(*p_charRead)] != (char)0x0D) && (buffer[(*p_charRead)] != (char)0x0A)))
      {
         // No other terminator char, this is the end of the line
         return IRC_SUCCESS;
      }

      // Read next char
      lbuffer[(*p_lbuflen)++] = buffer[(*p_charRead)++];

      if ((lbuffer[(*p_lbuflen) - 1] == (char)0x0D) || (lbuffer[(*p_lbuflen) - 1] == (char)0x0A))
      {
         (*p_termCount)++;

         if ((*p_termCount) == IHEX_MAX_TERMINATOR_SIZE)
         {
            // Max number of terminator reached
            return IRC_SUCCESS;
         }
      }

      if ((*p_lbuflen) == IHEX_MAX_LINE_SIZE)
      {
         IHEX_ERR("Maximum line size has been reached.");
         return IRC_FAILURE;
      }
   }

   return IRC_NOT_DONE;
}

/**
 * Parse Intel HEX record from a line char buffer.
 *
 * @param lbuffer is the line char buffer.
 * @param lbuflen is the line char buffer length.
 * @param termCount is the number of terminator at the end of the line.
 * @param ihexInfo is a pointer to the Intel HEX record data structure to fill.
 *
 * @return IRC_SUCCESS if a Intel HEX record has been successfully parsed.
 * @return IRC_FAILURE if failed to parse Intel HEX record.
 */
IRC_Status_t IHEX_ParseLine(const char *lbuffer, uint32_t lbuflen, uint8_t termCount, ihexInfo_t *ihexInfo)
{
   uint32_t charIdx = 0;

   // Remove terminator from line char buffer
   lbuflen -= termCount;

   // Read and validate start code
   if (lbuflen < IHEX_START_CODE_SIZE)
   {
      IHEX_ERR("Not enough chars to start code.");
      return IRC_FAILURE;
   }

   if (lbuffer[charIdx] != IHEX_START_CODE)
   {
      IHEX_ERR("Intel HEX must start with "":"".");
      return IRC_FAILURE;
   }
   charIdx += IHEX_START_CODE_SIZE;

   // Read data count
   if (lbuflen < (charIdx + IHEX_DATA_COUNT_SIZE))
   {
      IHEX_ERR("Not enough chars to read data count.");
      return IRC_FAILURE;
   }

   ihexInfo->dataCount = Hex2Byte(&lbuffer[charIdx]);
   charIdx += IHEX_DATA_COUNT_SIZE;

   // Read address
   if (lbuflen < (charIdx + IHEX_ADDR_SIZE))
   {
      IHEX_ERR("Not enough chars to read address.");
      return IRC_FAILURE;
   }

   ihexInfo->addr = ((uint16_t)Hex2Byte(&lbuffer[charIdx]) << 8) +
                (uint16_t)Hex2Byte(&lbuffer[charIdx + 2]);
   charIdx += IHEX_ADDR_SIZE;

   // Read record type
   if (lbuflen < (charIdx + IHEX_REC_TYPE_SIZE))
   {
      IHEX_ERR("Not enough chars to read record type.");
      return IRC_FAILURE;
   }

   ihexInfo->recordType = Hex2Byte(&lbuffer[charIdx]);
   charIdx += IHEX_REC_TYPE_SIZE;

   // Read data
   if (lbuflen < (charIdx + (2 * ihexInfo->dataCount)))
   {
      IHEX_ERR("Not enough chars to read data.");
      return IRC_FAILURE;
   }

   Hex2Bytes(&lbuffer[charIdx], (2 * ihexInfo->dataCount), ihexInfo->dataBytes, IHEX_MAX_DATA_COUNT);
   charIdx += (2 * ihexInfo->dataCount);

   // Read checksum
   if (lbuflen < (charIdx + IHEX_CHECKSUM_SIZE))
   {
      IHEX_ERR("Not enough chars to read checksum.");
      return IRC_FAILURE;
   }

   ihexInfo->chksum = Hex2Byte(&lbuffer[charIdx]);
   charIdx += IHEX_CHECKSUM_SIZE;

   // Validate checksum
   if (ihexInfo->chksum != IHEX_ComputeChecksum(&lbuffer[IHEX_START_CODE_SIZE],
         IHEX_DATA_COUNT_SIZE + IHEX_ADDR_SIZE + IHEX_REC_TYPE_SIZE + (2 * ihexInfo->dataCount)))
   {
      IHEX_ERR("Invalid checksum.");
      return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}

