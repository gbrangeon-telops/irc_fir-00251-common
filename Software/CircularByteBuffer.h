/**
 * @file CircularByteBuffer.h
 * Circular byte buffer module header.
 *
 * This file defines the circular byte buffer module.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef CIRCULARBYTEBUFFER_H
#define CIRCULARBYTEBUFFER_H

#include <stdint.h>
#include "IRC_Status.h"

/**
 * Circular byte buffer structure.
 */
struct circByteBufferStruct {
   uint8_t *buffer;
   uint16_t size;
   uint16_t length;
   uint16_t maxLength;
   uint16_t idxHead;
   uint16_t idxTail;
};

/**
 * Circular byte buffer data type.
 */
typedef struct circByteBufferStruct circByteBuffer_t;

IRC_Status_t CBB_Init(circByteBuffer_t *circByteBuffer, uint8_t *buffer, uint16_t size);
IRC_Status_t CBB_Push(circByteBuffer_t *circByteBuffer, uint8_t data);
IRC_Status_t CBB_Pushn(circByteBuffer_t *circByteBuffer, uint16_t length, uint8_t* data);
IRC_Status_t CBB_Pop(circByteBuffer_t *circByteBuffer, uint8_t *data);
IRC_Status_t CBB_Popn(circByteBuffer_t *circByteBuffer, uint16_t length, uint8_t *data);
IRC_Status_t CBB_Peek(circByteBuffer_t *circByteBuffer, uint16_t index, uint8_t *data);
IRC_Status_t CBB_Peekn(circByteBuffer_t *circByteBuffer, uint16_t index, uint16_t length, uint8_t *data);
IRC_Status_t CBB_Flush(circByteBuffer_t *circByteBuffer);
IRC_Status_t CBB_Flushn(circByteBuffer_t *circByteBuffer, uint16_t length);
uint16_t CBB_Length(circByteBuffer_t *circByteBuffer);
uint8_t CBB_Empty(circByteBuffer_t *circByteBuffer);
uint8_t CBB_Full(circByteBuffer_t *circByteBuffer);
uint16_t CBB_CRC16(uint16_t crc, circByteBuffer_t *circByteBuffer);
uint16_t CBB_CRC16n(uint16_t crc, circByteBuffer_t *circByteBuffer, uint16_t index, uint16_t length);
IRC_Status_t CBB_Dump(circByteBuffer_t *circByteBuffer, uint32_t lineSize);

#endif // CIRCULARBYTEBUFFER_H
