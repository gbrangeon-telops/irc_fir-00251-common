/**
 * @file CircularByteBuffer.c
 * Circular byte buffer module implementation.
 *  
 * This file implements the circular byte buffer module.
 * 
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "CircularByteBuffer.h"
#include "CRC.h"
#include "printf_utils.h"
#include <stdio.h> // For NULL

/**
 * Initialize circular byte buffer.
 * This function initializes the circular byte buffer structure.
 *
 * @param circByteBuffer is the pointer to the circular byte buffer structure to initialize.
 * @param buffer is the pointer to the byte buffer that will contain circular byte buffer data.
 * @param size is the size, in bytes, of the pointed byte buffer.
 */
IRC_Status_t CBB_Init(circByteBuffer_t *circByteBuffer, uint8_t *buffer, uint16_t size)
{
   if (circByteBuffer == NULL)
   {
      return IRC_FAILURE;
   }

   circByteBuffer->buffer = buffer;
   circByteBuffer->size = size;
   circByteBuffer->length = 0;
   circByteBuffer->maxLength = 0;
   circByteBuffer->idxHead = 0;
   circByteBuffer->idxTail = 0;

   return IRC_SUCCESS;
}

/**
 * Initialize circular byte buffer.
 * This function initializes the circular byte buffer structure from existing data buffer.
 *
 * @param circByteBuffer is the pointer to the circular byte buffer structure to initialize.
 * @param buffer is the pointer to the byte buffer that contain buffer data.
 * @param size is the size, in bytes, of the pointed byte buffer.
 * @param length is the length, in bytes, of the data contained in the byte buffer.
 */
IRC_Status_t CBB_InitFromBuffer(circByteBuffer_t *circByteBuffer, uint8_t *buffer, uint16_t size, uint16_t length)
{
   if (circByteBuffer == NULL)
   {
      return IRC_FAILURE;
   }

   circByteBuffer->buffer = buffer;
   circByteBuffer->size = size;
   circByteBuffer->length = length;
   circByteBuffer->maxLength = length;
   circByteBuffer->idxHead = length % size;
   circByteBuffer->idxTail = 0;

   return IRC_SUCCESS;
}

/**
 * Push a byte in the circular byte buffer.
 * This function pushes a byte at the head position of the circular byte buffer.
 *
 * @param circByteBuffer is the pointer to the circular byte buffer structure.
 * @param data is the byte value to push in the circular byte buffer.
 *
 * @return IRC_SUCCESS if the byte was successfully pushed in the circular byte buffer.
 * @return IRC_FAILURE if the circular byte buffer was full.
 */
IRC_Status_t CBB_Push(circByteBuffer_t *circByteBuffer, uint8_t data)
{
   if ((circByteBuffer == NULL) || CBB_Full(circByteBuffer))
   {
      return IRC_FAILURE;
   }

   circByteBuffer->buffer[circByteBuffer->idxHead++] = data;
   circByteBuffer->idxHead %= circByteBuffer->size;
   circByteBuffer->length++;

   if (circByteBuffer->length > circByteBuffer->maxLength)
   {
      circByteBuffer->maxLength = circByteBuffer->length;
   }

   return IRC_SUCCESS;
}

/**
 * Push many bytes in the circular byte buffer.
 * This function pushes 'length' bytes at the head position of the circular byte buffer.
 *
 * @param circByteBuffer is the pointer to the circular byte buffer structure.
 * @param length is a the number of bytes to be pushed.
 * @param data is the pointer to the data buffer to push in the circular byte buffer.
 *
 * @return IRC_SUCCESS if the byte was successfully pushed in the circular byte buffer.
 * @return IRC_FAILURE if the circular could not fit the entire byte buffer.
 */
IRC_Status_t CBB_Pushn(circByteBuffer_t *circByteBuffer, uint16_t length, uint8_t* data)
{
   uint16_t i;

   if ((circByteBuffer == NULL) ||
         ((length + CBB_Length(circByteBuffer)) > circByteBuffer->size))
   {
      return IRC_FAILURE;
   }

   if (length > 0)
   {
      for (i = 0; i < length; ++i)
      {
         circByteBuffer->buffer[circByteBuffer->idxHead++] = data[i];
         circByteBuffer->idxHead %= circByteBuffer->size;
      }

      circByteBuffer->length += length;

      if (circByteBuffer->length > circByteBuffer->maxLength)
      {
         circByteBuffer->maxLength = circByteBuffer->length;
      }
   }

   return IRC_SUCCESS;
}

/**
 * Pop one byte from the circular byte buffer.
 * This function pops one byte at the tail position of the circular byte buffer.
 * The tail position is updated.
 *
 * @param circByteBuffer is the pointer to the circular byte buffer structure.
 * @param data is a pointer to the popped byte value to be returned.
 *
 * @return IRC_SUCCESS if the byte was successfully popped from the circular byte buffer.
 * @return IRC_FAILURE if the circular byte buffer was empty.
 */
IRC_Status_t CBB_Pop(circByteBuffer_t *circByteBuffer, uint8_t *data)
{
   if ((circByteBuffer == NULL) || CBB_Empty(circByteBuffer))
   {
      return IRC_FAILURE;
   }

   *data = circByteBuffer->buffer[circByteBuffer->idxTail++];
   circByteBuffer->idxTail %= circByteBuffer->size;
   circByteBuffer->length--;

   return IRC_SUCCESS;
}

/**
 * Pop N bytes from the circular byte buffer.
 * This function pops N bytes at the tail position of the circular byte buffer.
 * The tail position is updated.
 *
 * @param circByteBuffer is the pointer to the circular byte buffer structure.
 * @param length is a the number of bytes to be popped.
 * @param data is a pointer to the popped byte values to be returned.
 *
 * @return IRC_SUCCESS if the bytes were successfully popped from the circular byte buffer.
 * @return IRC_FAILURE if the circular byte buffer length in not sufficient.
 */
IRC_Status_t CBB_Popn(circByteBuffer_t *circByteBuffer, uint16_t length, uint8_t *data)
{
   uint16_t i;

   if ((circByteBuffer == NULL) || (length > CBB_Length(circByteBuffer)))
   {
      return IRC_FAILURE;
   }

   if (length > 0)
   {
      for (i = 0; i < length; ++i)
      {
         data[i] = circByteBuffer->buffer[circByteBuffer->idxTail++];
         circByteBuffer->idxTail %= circByteBuffer->size;
      }

      circByteBuffer->length -= length;
   }

   return IRC_SUCCESS;
}

/**
 * Return the byte at the tail of the circular byte buffer.
 * This function returns the byte at the tail position of the circular byte buffer.
 * The tail position is NOT updated so the byte has to be popped or flushed later.
 *
 * @param circByteBuffer is the pointer to the circular byte buffer structure.
 * @param index is the index of the byte to be returned relative to the tail (from 0 to circular byte buffer length -1).
 * @param data is a pointer to the byte value to be returned.
 *
 * @return IRC_SUCCESS if the byte was successfully returned.
 * @return IRC_FAILURE if the byte at index is not available.
 */
IRC_Status_t CBB_Peek(circByteBuffer_t *circByteBuffer, uint16_t index, uint8_t *data)
{
   if ((circByteBuffer == NULL) || ((index + 1) > CBB_Length(circByteBuffer)))
   {
      return IRC_FAILURE;
   }

   index += circByteBuffer->idxTail;
   index %= circByteBuffer->size;
   *data = circByteBuffer->buffer[index];

   return IRC_SUCCESS;
}

/**
 * Return the N bytes at the tail of the circular byte buffer.
 * This function returns the N bytes at the tail position of the circular byte buffer.
 * The tail position is NOT updated so the bytes have to be popped or flushed later.
 *
 * @param circByteBuffer is the pointer to the circular byte buffer structure.
 * @param index is the index of the first byte to be returned relative to the tail (from 0 to circular byte buffer length -1).
 * @param length is the number of byte to be returned.
 * @param data is a pointer to the byte values to be returned.
 *
 * @return IRC_SUCCESS if the bytes were successfully returned.
 * @return IRC_FAILURE if not all the N bytes at index are available.
 */
IRC_Status_t CBB_Peekn(circByteBuffer_t *circByteBuffer, uint16_t index, uint16_t length, uint8_t *data)
{
   uint16_t i;

   if ((circByteBuffer == NULL) || ((index + length) > CBB_Length(circByteBuffer)))
   {
      return IRC_FAILURE;
   }

   index += circByteBuffer->idxTail;
   index %= circByteBuffer->size;

   for (i = 0; i < length; ++i)
   {
      data[i] = circByteBuffer->buffer[index++];
      index %= circByteBuffer->size;
   }

   return IRC_SUCCESS;
}

/**
 * Flush all the bytes contained in the circular byte buffer.
 *
 * @param circByteBuffer is the pointer to the circular byte buffer structure.
 */
IRC_Status_t CBB_Flush(circByteBuffer_t *circByteBuffer)
{
   if (circByteBuffer == NULL)
   {
      return IRC_FAILURE;
   }

   circByteBuffer->length = 0;
   circByteBuffer->idxHead = 0;
   circByteBuffer->idxTail = 0;

   return IRC_SUCCESS;
}

/**
 * Flush N bytes from the circular byte buffer.
 * This function flushes N bytes at the tail position of the circular byte buffer.
 * The tail position is updated.
 *
 * @param circByteBuffer is the pointer to the circular byte buffer structure.
 * @param length is the number of byte to be flushed.
 *
 * @return IRC_SUCCESS if the bytes were successfully flushed.
 * @return IRC_FAILURE if the circular byte buffer length in not sufficient.
 */
IRC_Status_t CBB_Flushn(circByteBuffer_t *circByteBuffer, uint16_t length)
{
   if ((circByteBuffer == NULL) || (length > CBB_Length(circByteBuffer)))
   {
      return IRC_FAILURE;
   }

   if (length > 0)
   {
      circByteBuffer->idxTail += length;
      circByteBuffer->idxTail %= circByteBuffer->size;
      circByteBuffer->length -= length;
   }

   return IRC_SUCCESS;
}

/**
 * Return the length of the circular byte buffer.
 * This function returns the length of the data actually contained in
 * the circular byte buffer.
 *
 * @param circByteBuffer is the pointer to the circular byte buffer structure.
 *
 * @return the length of the circular byte buffer.
 */
uint16_t CBB_Length(circByteBuffer_t *circByteBuffer)
{
   if (circByteBuffer == NULL)
   {
      return 0;
   }

   return circByteBuffer->length;
}

/**
 * Indicates whether the circular byte buffer is empty.
 *
 * @param circByteBuffer is the pointer to the circular byte buffer structure.
 *
 * @return 1 if the circular byte buffer is empty.
 * @return 0 if the circular byte buffer is not empty.
 */
uint8_t CBB_Empty(circByteBuffer_t *circByteBuffer)
{
   if (circByteBuffer == NULL)
   {
      return 0;
   }

   return (CBB_Length(circByteBuffer) == 0);
}

/**
 * Indicates whether the circular byte buffer is full.
 *
 * @param circByteBuffer is the pointer to the circular byte buffer structure.
 *
 * @return 1 if the circular byte buffer is full.
 * @return 0 if the circular byte buffer is not full.
 */
uint8_t CBB_Full(circByteBuffer_t *circByteBuffer)
{
   if (circByteBuffer == NULL)
   {
      return 0;
   }

   return (CBB_Length(circByteBuffer) == circByteBuffer->size);
}

/**
 * Circular buffer data CRC-16 computation function.
 *
 * @param crc is the starting value for the CRC-16 computation (use 0x0000 for standard CRC-16 and 0xFFFF for Modbus CRC-16).
 * @param circByteBuffer is a pointer to the circular buffer on which the CRC-16 is going to be computed.
 *
 * @return The CRC-16 value.
 */
uint16_t CBB_CRC16(uint16_t crc, circByteBuffer_t *circByteBuffer)
{
   return CBB_CRC16n(crc, circByteBuffer, 0, CBB_Length(circByteBuffer));
}

/**
 * Circular buffer data CRC-16 computation function.
 *
 * @param crc is the starting value for the CRC-16 computation (use 0x0000 for standard CRC-16 and 0xFFFF for Modbus CRC-16).
 * @param circByteBuffer is a pointer to the circular buffer on which the CRC-16 is going to be computed.
 * @param index is the index of the first byte to process relative to the tail (from 0 to circular byte buffer length -1).
 * @param length is the number of byte to be processed.
 *
 * @return The CRC-16 value.
 */
uint16_t CBB_CRC16n(uint16_t crc, circByteBuffer_t *circByteBuffer, uint16_t index, uint16_t length)
{
   if (circByteBuffer == NULL)
   {
      return 0;
   }

   index += circByteBuffer->idxTail;
   index %= circByteBuffer->size;

   while (length > 0)
   {
      crc = CRC16(crc, &circByteBuffer->buffer[index++], 1);
      index %= circByteBuffer->size;
      length--;
   }

   return crc;
}

/**
 * Circular buffer data dump.
 *
 * @param circByteBuffer is a pointer to the circular buffer.
 * @param lineSize is the number of bytes to print on a single line.
 *
 * @return IRC_SUCCESS if the bytes were successfully dumped.
 * @return IRC_FAILURE if failed to dump bytes from circular buffer.
 */
IRC_Status_t CBB_Dump(circByteBuffer_t *circByteBuffer, uint32_t lineSize)
{
   if (circByteBuffer == NULL)
   {
      return IRC_FAILURE;
   }

#ifdef ENABLE_PRINTF
   uint16_t i;
   uint16_t length = CBB_Length(circByteBuffer);
   uint32_t baseAddr = 0;

   for (i = 0; i < length; i++)
   {
     if ( i % lineSize == 0)
     {
       PRINTF("0x%08X: 0x", baseAddr + i);
     }

     PRINTF("%02X", circByteBuffer->buffer[(i + circByteBuffer->idxTail) % circByteBuffer->size]);

     if ( i % lineSize == lineSize - 1)
     {
       PRINTF("\n");
     }
     else
     {
       PRINTF(" ");
     }
   }

   if (length % lineSize != 0)
   {
      PRINTF("\n");
   }
#endif

   return IRC_SUCCESS;
}

