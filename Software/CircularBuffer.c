/**
 * @file CircularBuffer.c
 * Circular  buffer module implementation.
 *  
 * This file implements the circular  buffer module.
 * 
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "CircularBuffer.h"
#include <string.h>

/**
 * Push an item in the circular buffer.
 * This function pushes an item at the head position of the circular buffer.
 *
 * @param circBuffer is the pointer to the circular buffer structure.
 * @param p_item is the pointer of the item to push in the circular buffer.
 *
 * @return IRC_SUCCESS if the item was successfully pushed in the circular buffer.
 * @return IRC_FAILURE if the circular buffer was full.
 */
IRC_Status_t CB_Push(circBuffer_t *circBuffer, const void *p_item)
{
   if (CB_Full(circBuffer))
   {
      return IRC_FAILURE;
   }

   memcpy(circBuffer->buffer + (circBuffer->idxHead++ * circBuffer->itemSize), p_item, circBuffer->itemSize);
   
   circBuffer->idxHead %= circBuffer->size;
   circBuffer->length++;

   if (circBuffer->length > circBuffer->maxLength)
   {
      circBuffer->maxLength = circBuffer->length;
   }

   return IRC_SUCCESS;
}

/**
 * Pop one item from the circular buffer.
 * This function pops one item at the tail position of the circular buffer.
 * The tail position is updated.
 *
 * @param circBuffer is the pointer to the circular buffer structure.
 * @param p_item is the pointer of the item to pop from the circular buffer.
 *
 * @return IRC_SUCCESS if the item was successfully popped from the circular buffer.
 * @return IRC_FAILURE if the circular buffer was empty.
 */
IRC_Status_t CB_Pop(circBuffer_t *circBuffer, void *p_item)
{
   if (CB_Empty(circBuffer))
   {
      return IRC_FAILURE;
   }

   memcpy(p_item, circBuffer->buffer + (circBuffer->idxTail++ * circBuffer->itemSize), circBuffer->itemSize);

   circBuffer->idxTail %= circBuffer->size;
   circBuffer->length--;

   return IRC_SUCCESS;
}

/**
 * Return the item at the tail of the circular buffer.
 * This function returns the item at the tail position of the circular buffer.
 * The tail position is NOT updated so the item has to be popped or flushed later.
 *
 * @param circBuffer is the pointer to the circular buffer structure.
 * @param index is the index of the item to be returned relative to the tail (from 0 to circular buffer length -1).
 * @param p_item is the pointer of the item to peek from the circular buffer.
 *
 * @return IRC_SUCCESS if the item was successfully peeked from the circular buffer.
 * @return IRC_FAILURE if the item index is not valid.
 */
IRC_Status_t CB_Peek(circBuffer_t *circBuffer, uint16_t index, void *p_item)
{
   if (index > (CB_Length(circBuffer) - 1))
   {
      return IRC_FAILURE;
   }

   index += circBuffer->idxTail;
   index %= circBuffer->size;

   memcpy(p_item, circBuffer->buffer + (index * circBuffer->itemSize), circBuffer->itemSize);

   return IRC_SUCCESS;
}

/**
 * Flush all the items contained in the circular buffer.
 *
 * @param circBuffer is the pointer to the circular buffer structure.
 */
void CB_Flush(circBuffer_t *circBuffer)
{
   circBuffer->length = 0;
   circBuffer->idxHead = 0;
   circBuffer->idxTail = 0;
}

/**
 * Flush N items from the circular buffer.
 * This function flushes N items at the tail position of the circular buffer.
 * The tail position is updated.
 *
 * @param circBuffer is the pointer to the circular buffer structure.
 * @param length is the number of items to be flushed.
 *
 * @return IRC_SUCCESS if the items were successfully flushed.
 * @return IRC_FAILURE if the circular buffer length in not sufficient.
 */
IRC_Status_t CB_Flushn(circBuffer_t *circBuffer, uint16_t length)
{
   if (length > CB_Length(circBuffer))
   {
      return IRC_FAILURE;
   }

   circBuffer->idxTail += length;
   circBuffer->idxTail %= circBuffer->size;
   circBuffer->length -= length;

   return IRC_SUCCESS;
}

/**
 * Return the length of the circular buffer.
 * This function returns the length of the data actually contained in
 * the circular buffer.
 *
 * @param circBuffer is the pointer to the circular buffer structure.
 *
 * @return the length of the circular buffer.
 */
uint16_t CB_Length(circBuffer_t *circBuffer)
{
   return circBuffer->length;
}

/**
 * Indicates whether the circular buffer is empty.
 *
 * @param circBuffer is the pointer to the circular buffer structure.
 *
 * @return 1 if the circular buffer is empty.
 * @return 0 if the circular buffer is not empty.
 */
uint8_t CB_Empty(circBuffer_t *circBuffer)
{
   return (CB_Length(circBuffer) == 0);
}

/**
 * Indicates whether the circular buffer is full.
 *
 * @param circBuffer is the pointer to the circular buffer structure.
 *
 * @return 1 if the circular buffer is full.
 * @return 0 if the circular buffer is not full.
 */
uint8_t CB_Full(circBuffer_t *circBuffer)
{
   return (CB_Length(circBuffer) == circBuffer->size);
}
