/**
 * @file IntelHex.h
 * Intel Hex file format parser module header.
 *
 * This file defines the module used to parse Intel HEX file format.
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

#ifndef INTELHEX_H
#define INTELHEX_H

#include <stdint.h>
#include "IRC_Status.h"
#include "verbose.h"

#ifdef IHEX_VERBOSE
   #define IHEX_PRINTF(fmt, ...)    PRINTF("IHEX: " fmt, ##__VA_ARGS__)
#else
   #define IHEX_PRINTF(fmt, ...)    DUMMY_PRINTF("IHEX: " fmt, ##__VA_ARGS__)
#endif

#define IHEX_ERR(fmt, ...)          PRINTF("IHEX: Error: " fmt "\n", ##__VA_ARGS__)
#define IHEX_INF(fmt, ...)          IHEX_PRINTF("Info: " fmt "\n", ##__VA_ARGS__)


#define IHEX_START_CODE          ':'   /** Intel HEX start code */

#define IHEX_MIN_DATA_COUNT      0     /** Minimum Intel HEX data count in bytes */
#define IHEX_MAX_DATA_COUNT      32    /** Maximum Intel HEX data count in bytes (Maximum data count supported by the parser) */

#define IHEX_START_CODE_SIZE     1     /** Intel HEX start code size in hex digits */
#define IHEX_DATA_COUNT_SIZE     2     /** Intel HEX data count size in hex digits */
#define IHEX_ADDR_SIZE           4     /** Intel HEX address size in hex digits */
#define IHEX_REC_TYPE_SIZE       2     /** Intel HEX record type size in hex digits */
#define IHEX_MAX_DATA_SIZE       (2 * IHEX_MAX_DATA_COUNT) /** Maximum Intel HEX data size in hex digits */
#define IHEX_CHECKSUM_SIZE       2     /** Intel HEX checksum size in hex digits */
#define IHEX_MAX_TERMINATOR_SIZE 2     /** Maximum Intel HEX terminator size in hex digits */


#define IHEX_MAX_LINE_SIZE       (IHEX_START_CODE_SIZE + IHEX_DATA_COUNT_SIZE + IHEX_ADDR_SIZE + IHEX_REC_TYPE_SIZE + IHEX_MAX_DATA_SIZE + IHEX_CHECKSUM_SIZE + IHEX_MAX_TERMINATOR_SIZE)   /** Maximum line size in chars */


/**
 * Intel HEX type enumeration.
 */
enum ihexRecordTypeEnum {
   IHEXRT_00 = 0, /** Data */
   IHEXRT_01 = 1, /** End Of File */
   IHEXRT_02 = 2, /** Extended Segment Address */
   IHEXRT_03 = 3, /** Start Segment Address */
   IHEXRT_04 = 4, /** Extended Linear Address */
   IHEXRT_05 = 5, /** Start Linear Address */
};

/**
 * Intel HEX type data type.
 */
typedef enum ihexRecordTypeEnum ihexRecordType_t;

/**
 * Intel HEX information data structure.
 */
struct ihexInfoStruct {
   uint8_t dataCount;
   uint16_t addr;
   ihexRecordType_t recordType;
   uint8_t dataBytes[IHEX_MAX_DATA_COUNT];
   uint8_t chksum;
};

/**
 * SREC information data type.
 */
typedef struct ihexInfoStruct ihexInfo_t;


uint8_t IHEX_ComputeChecksum(const char *buffer, uint32_t buflen);
IRC_Status_t IHEX_GetNextLine(const char *buffer, uint32_t buflen, char *lbuffer, uint32_t *p_lbuflen, uint32_t *p_charRead, uint8_t *p_termCount);
IRC_Status_t IHEX_ParseLine(const char *lbuffer, uint32_t lbuflen, uint8_t termCount, ihexInfo_t *ihexInfo);

#endif // INTELHEX_H
