/**
 * @file SREC.c
 * Motorola S-record file format parser module implementation.
 *
 * This file implements the module used to parse Motorola S-record file format.
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

#include "SREC.h"
#include "CRC.h"
#include "utils.h"

/**
 * Compute SREC checksum.
 *
 * @param buffer is the hex digits char buffer.
 * @param buflen is the hex digits char buffer length.
 *
 * @return the SREC checksum.
 */
uint8_t SREC_ComputeChecksum(const char *buffer, uint32_t buflen)
{
   return ~Checksum8Hex(buffer, buflen);
}

/**
 * Get next SREC record from a char buffer.
 *
 * @param buffer is the char buffer.
 * @param buflen is the char buffer length.
 * @param lbuffer is the line char buffer (updated in this function).
 * @param p_lbuflen is a pointer to the line char buffer length (updated in this function).
 * @param p_charRead is a pointer to the number of char that have been read from buffer.
 *
 * @return IRC_SUCCESS if a complete line has been copied into line char buffer.
 * @return IRC_NOT_DONE if a chars have been copied into line char buffer but no terminator have been met.
 * @return IRC_FAILURE if maximum number of char have been copied into line char buffer but no terminator have been met.
 */
IRC_Status_t SREC_GetNextLine(const char *buffer, uint32_t buflen, char *lbuffer, uint32_t *p_lbuflen, uint32_t *p_charRead)
{
   *p_charRead = 0;

   while (*p_charRead < buflen)
   {
      lbuffer[(*p_lbuflen)++] = buffer[(*p_charRead)++];

      if ((*p_lbuflen) > 1)
      {
         if ((lbuffer[(*p_lbuflen) - 2] == (char)0x0D) && (lbuffer[(*p_lbuflen) - 1] == (char)0x0A))
         {
            return IRC_SUCCESS;
         }
      }

      if ((*p_lbuflen) == SREC_MAX_LINE_SIZE)
      {
         SREC_ERR("Maximum line size has been reached.");
         return IRC_FAILURE;
      }
   }

   return IRC_NOT_DONE;
}

/**
 * Parse SREC from a line char buffer.
 *
 * @param lbuffer is the line char buffer.
 * @param lbuflen is the line char buffer length.
 * @param termCount is the number of terminator at the end of the line.
 * @param srecInfo is a pointer to the SREC data structure to fill.
 *
 * @return IRC_SUCCESS if a SREC has been successfully parsed.
 * @return IRC_FAILURE if failed to parse SREC.
 */
IRC_Status_t SREC_ParseLine(const char *lbuffer, uint32_t lbuflen, srecInfo_t *srecInfo)
{
   uint32_t charIdx = 0;
   uint32_t charCount;

   // Read SREC type
   if (lbuflen < SREC_TYPE_SIZE)
   {
      SREC_ERR("Not enough chars to read type.");
      return IRC_FAILURE;
   }

   if (lbuffer[charIdx++] != 'S')
   {
      SREC_ERR("SREC must start with ""S"".");
      return IRC_FAILURE;
   }

   srecInfo->type = (uint8_t)(lbuffer[charIdx++] - '0');

   // Read SREC count
   if (lbuflen < (charIdx + SREC_COUNT_SIZE))
   {
      SREC_ERR("Not enough chars to read count.");
      return IRC_FAILURE;
   }

   srecInfo->count = Hex2Byte(&lbuffer[charIdx]);
   charIdx += 2;

   if (lbuflen != (charIdx + (srecInfo->count * 2) + SREC_TERMINATOR_SIZE))
   {
      SREC_ERR("Invalid SREC line length.");
      return IRC_FAILURE;
   }

   // Read SREC address
   switch (srecInfo->type)
   {
      case SRECT_S0: // Header
      case SRECT_S1: // Data (16-bit address)
      case SRECT_S9: // Start address (16-bit address)
         if ((srecInfo->count * 2) < (4 + SREC_CHECKSUM_SIZE))
         {
            SREC_ERR("Not enough chars to read addr16.");
            return IRC_FAILURE;
         }
         srecInfo->addr = ((uint32_t)Hex2Byte(&lbuffer[charIdx]) << 8) +
                      (uint32_t)Hex2Byte(&lbuffer[charIdx + 2]);
         charIdx += 4;
         break;

      case SRECT_S2: // Data (24-bit address)
      case SRECT_S8: // Start address (24-bit address)
         if ((srecInfo->count * 2) < (6 + SREC_CHECKSUM_SIZE))
         {
            SREC_ERR("Not enough chars to read addr24.");
            return IRC_FAILURE;
         }
         srecInfo->addr = ((uint32_t)Hex2Byte(&lbuffer[charIdx]) << 16) +
                      ((uint32_t)Hex2Byte(&lbuffer[charIdx + 2]) << 8) +
                      (uint32_t)Hex2Byte(&lbuffer[charIdx + 4]);
         charIdx += 6;
         break;

      case SRECT_S3: // Data (32-bit address)
      case SRECT_S7: // Start address (32-bit address)
         if ((srecInfo->count * 2) < (8 + SREC_CHECKSUM_SIZE))
         {
            SREC_ERR("Not enough chars to read addr32.");
            return IRC_FAILURE;
         }
         srecInfo->addr = ((uint32_t)Hex2Byte(&lbuffer[charIdx]) << 24) +
                      ((uint32_t)Hex2Byte(&lbuffer[charIdx + 2]) << 16) +
                      ((uint32_t)Hex2Byte(&lbuffer[charIdx + 4]) << 8) +
                      (uint32_t)Hex2Byte(&lbuffer[charIdx + 6]);
         charIdx += 8;
         break;

      case SRECT_S4: // Reserved
      case SRECT_S5: // Count (16-bit count)
      case SRECT_S6: // Count (24-bit count)
         SREC_ERR("Unsupported SREC type.");
         return IRC_FAILURE;
         break;

      default:
         SREC_ERR("Invalid SREC type.");
         return IRC_FAILURE;
   }

   // Read SREC data
   charCount = SREC_TYPE_SIZE + SREC_COUNT_SIZE + (srecInfo->count * 2) - charIdx - SREC_CHECKSUM_SIZE;
   srecInfo->dalaLength = Hex2Bytes(&lbuffer[charIdx], charCount, srecInfo->dataBytes, SREC_MAX_DATA_SIZE / 2);
   charIdx += charCount;

   // Read SREC checksum
   srecInfo->chksum = Hex2Byte(&lbuffer[charIdx]);
   charIdx += 2;

   if (srecInfo->chksum != SREC_ComputeChecksum(&lbuffer[2], SREC_COUNT_SIZE + (srecInfo->count * 2) - SREC_CHECKSUM_SIZE))
   {
      SREC_ERR("Invalid SREC checksum.");
      return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}
