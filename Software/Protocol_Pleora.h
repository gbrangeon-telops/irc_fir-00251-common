/**
 * @file Protocol_Pleora.h
 * Pleora protocol module header.
 *
 * This file defines the Pleora protocol interface.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef PROTOCOL_PLEORA_H
#define PROTOCOL_PLEORA_H

#include <stdint.h>
#include "Protocol_F1F2.h"
#include "CircularByteBuffer.h"
#include "IRC_Status.h"
#include "GenICam.h"
#include "verbose.h"

#ifdef PLEORA_VERBOSE
   #define PLEORA_PRINTF(fmt, ...)  FPGA_PRINTF("PLEORA: " fmt, ##__VA_ARGS__)
#else
   #define PLEORA_PRINTF(fmt, ...)  DUMMY_PRINTF("PLEORA: " fmt, ##__VA_ARGS__)
#endif

#define PLEORA_ERR(fmt, ...)        FPGA_PRINTF("PLEORA: Error: " fmt "\n", ##__VA_ARGS__)
#define PLEORA_INF(fmt, ...)        PLEORA_PRINTF("Info: " fmt "\n", ##__VA_ARGS__)

// Pleora command codes
#define PLEORA_CMD_NONE                0x00     /**< Pleora empty command code */
#define PLEORA_CMD_WRITE_REQ           0x57     /**< Pleora Write Request command code */
#define PLEORA_CMD_READ_REQ            0x52     /**< Pleora Read Request command code */
#define PLEORA_CMD_ACK                 0x06     /**< Pleora Acknowledge command code */

// Pleora fields size
#define PLEORA_CMD_CODE_SIZE           1        /**< Pleora command code field size in bytes */
#define PLEORA_REG_ADDR_SIZE           2        /**< Pleora register address field size in bytes */
#define PLEORA_REG_VALUE_SIZE          4        /**< Pleora register value field size in bytes */

// Pleora packet offset
#define PLEORA_OFFSET_CMD              0                                               /**< Pleora Command code offset */
#define PLEORA_OFFSET_REG_ADDR         (PLEORA_OFFSET_CMD + PLEORA_CMD_CODE_SIZE)      /**< Pleora Register Address offset */
#define PLEORA_OFFSET_REG_VALUE        (PLEORA_OFFSET_REG_ADDR + PLEORA_REG_ADDR_SIZE) /**< Pleora Register Value offset */
#define PLEORA_OFFSET_ACK_REG_VALUE    (PLEORA_OFFSET_CMD + PLEORA_CMD_CODE_SIZE)      /**< Pleora Acknowledge Register Value offset */

#define PLEORA_MIN_PACKET_SIZE         PLEORA_CMD_CODE_SIZE                         /**< Minimum Pleora packet size in bytes */
#define PLEORA_MAX_PACKET_SIZE         (PLEORA_CMD_CODE_SIZE + PLEORA_REG_ADDR_SIZE + GC_REG_MAX_LENGTH) /**< Maximum Pleora packet size in bytes */


/**
 * Pleora command data structure.
 */
struct PleoraCommandStruct {
   uint8_t cmd;            /**< Pleora command code */
   uint16_t address;       /**< Register address */
   uint8_t data[GC_REG_MAX_WRITE_LENGTH]; /**< Register data pointer */
   uint16_t dataLength;    /**< Register data length in bytes */
   uint16_t padLength;     /**< Register data padding length in bytes */
};

/**
 * Pleora command type definition.
 */
typedef struct PleoraCommandStruct PleoraCommand_t;

void Pleora_CommandClear(PleoraCommand_t *pleoraCmd);
IRC_Status_t Pleora_CommandParser(uint8_t *buffer, uint16_t buflen, PleoraCommand_t *pleoraCmd);
IRC_Status_t Pleora_CircCommandParser(circByteBuffer_t *circByteBuffer, PleoraCommand_t *pleoraCmd, uint16_t *byteParsed);
uint32_t Pleora_CommandBuilder(PleoraCommand_t *pleoraCmd, uint8_t *buffer, uint16_t buflen);
IRC_Status_t Pleora_ConvertToF1F2(PleoraCommand_t *pleoraCmd, F1F2Command_t *f1f2Cmd);
IRC_Status_t Pleora_ConvertFromF1F2(F1F2Command_t *f1f2Cmd, PleoraCommand_t *pleoraCmd);

#endif // PROTOCOL_PLEORA_H
