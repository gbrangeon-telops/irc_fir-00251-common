/**
 * @file CircularBuffer.h
 * Circular buffer module header.
 *
 * This file defines the circular buffer module.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef CIRCULARBUFFER_H
#define CIRCULARBUFFER_H

#include "IRC_Status.h"
#include <stdint.h>

/**
 * Circular buffer structure.
 */
struct circBufferStruct {
   void *buffer;
   uint16_t size;
   uint16_t itemSize;
   uint16_t length;
   uint16_t maxLength;
   uint16_t idxHead;
   uint16_t idxTail;
   uint8_t ovfl;
};

/**
 * Circular buffer data type.
 */
typedef struct circBufferStruct circBuffer_t;

/**
 * Circular buffer initializer (constructor).
 */
#define CB_Ctor(buffer, size, itemSize) {buffer, size, itemSize, 0, 0, 0, 0, 0}

IRC_Status_t CB_Push(circBuffer_t *circBuffer, const void *p_item);
IRC_Status_t CB_Pop(circBuffer_t *circBuffer, void *p_item);
IRC_Status_t CB_Peek(circBuffer_t *circBuffer, uint16_t index, void *p_item);
void CB_Flush(circBuffer_t *circBuffer);
IRC_Status_t CB_Flushn(circBuffer_t *circBuffer, uint16_t length);
uint16_t CB_Length(circBuffer_t *circBuffer);
uint8_t CB_Empty(circBuffer_t *circBuffer);
uint8_t CB_Full(circBuffer_t *circBuffer);

#endif // CIRCULARBUFFER_H
