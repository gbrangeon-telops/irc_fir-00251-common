/**
 * @file CRC.h
 * Cyclic redundancy check and checksum module header.
 *
 * This file defines the cyclic redundancy check and checksum module interface.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef CRC_H
#define CRC_H

#include <stdint.h>

uint8_t Checksum8(const uint8_t *buffer, uint32_t buflen);
uint8_t Checksum8Hex(const char *buffer, uint32_t buflen);
uint16_t CRC16(uint16_t crc, const uint8_t *buffer, uint32_t length);

#endif // CRC_H
