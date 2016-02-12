/**
 * @file SREC.h
 * Motorola S-record file format parser module header.
 *
 * This file defines the module used to parse Motorola S-record file format.
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

#ifndef SREC_H
#define SREC_H

#include <stdint.h>
#include "IRC_Status.h"
#include "verbose.h"

#ifdef SREC_VERBOSE
   #define SREC_PRINTF(fmt, ...)    PRINTF("SREC: " fmt, ##__VA_ARGS__)
#else
   #define SREC_PRINTF(fmt, ...)    DUMMY_PRINTF("SREC: " fmt, ##__VA_ARGS__)
#endif

#define SREC_ERR(fmt, ...)          PRINTF("SREC: Error: " fmt "\n", ##__VA_ARGS__)
#define SREC_INF(fmt, ...)          SREC_PRINTF("Info: " fmt "\n", ##__VA_ARGS__)


#define SREC_MIN_COUNT        3     /** Minimum SREC count in bytes */
#define SREC_MAX_COUNT        255   /** Maximum SREC count in bytes */

#define SREC_TYPE_SIZE        2     /** SREC type size in hex digits */
#define SREC_COUNT_SIZE       2     /** SREC count size in hex digits */
#define SREC_MIN_ADDR_SIZE    4     /** Minimum SREC address size in hex digits (16-bit) */
#define SREC_MAX_ADDR_SIZE    8     /** Maximum SREC address size in hex digits (32-bit) */
#define SREC_MIN_DATA_SIZE    0     /** Minimum SREC data size in hex digits */
#define SREC_MAX_DATA_SIZE    64    /** Maximum SREC data size in hex digits */
#define SREC_CHECKSUM_SIZE    2     /** SREC checksum size in hex digits */
#define SREC_TERMINATOR_SIZE  2     /** SREC terminator size in hex digits */

#define SREC_MAX_LINE_SIZE    (SREC_TYPE_SIZE + SREC_COUNT_SIZE + SREC_MAX_ADDR_SIZE + SREC_MAX_DATA_SIZE + SREC_CHECKSUM_SIZE + SREC_TERMINATOR_SIZE)   /** Maximum line size in chars */


/**
 * SREC type enumeration.
 */
enum srecTypeEnum {
   SRECT_S0 = 0, /** Header */
   SRECT_S1 = 1, /** Data (16-bit address) */
   SRECT_S2 = 2, /** Data (24-bit address) */
   SRECT_S3 = 3, /** Data (32-bit address) */
   SRECT_S4 = 4, /** Reserved */
   SRECT_S5 = 5, /** Count (16-bit count) */
   SRECT_S6 = 6, /** Count (24-bit count) */
   SRECT_S7 = 7, /** Start address (32-bit address) */
   SRECT_S8 = 8, /** Start address (24-bit address) */
   SRECT_S9 = 9  /** Start address (16-bit address) */
};

/**
 * SREC type data type.
 */
typedef enum srecTypeEnum srecType_t;

/**
 * SREC information data structure.
 */
struct srecInfoStruct {
   srecType_t type;
   uint8_t count;
   uint32_t addr;
   uint8_t dataBytes[SREC_MAX_DATA_SIZE / 2];
   uint32_t dalaLength;
   uint8_t chksum;
};

/**
 * SREC information data type.
 */
typedef struct srecInfoStruct srecInfo_t;


uint8_t SREC_ComputeChecksum(const char *buffer, uint32_t buflen);
IRC_Status_t SREC_GetNextLine(const char *buffer, uint32_t buflen, char *lbuffer, uint32_t *lbuflen, uint32_t *charRead);
IRC_Status_t SREC_ParseLine(const char *lbuffer, uint32_t lbuflen, srecInfo_t *srecInfo);

#endif // SREC_H
