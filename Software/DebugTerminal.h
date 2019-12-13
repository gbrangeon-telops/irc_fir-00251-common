/**
 * @file DebugTerminal.h
 * Debug terminal module header.
 *
 * This file defines the debug terminal module.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef DEBUGTERMINAL_H
#define DEBUGTERMINAL_H


#include "xuartns550.h"
#include "CircularUART.h"
#include "CircularByteBuffer.h"
#include "CircularBuffer.h"
#include "NetworkInterface.h"
#include "CtrlInterface.h"
#include "xuartlite.h"
#include "xintc.h"
#include "IRC_Status.h"
#include "utils.h"
#include "verbose.h"


#define DT_ERR(fmt, ...)         FPGA_PRINTF("DT: Error: " fmt "\n", ##__VA_ARGS__)
#define DT_INF(fmt, ...)         FPGA_PRINTF("DT: Info: " fmt "\n", ##__VA_ARGS__)
#define DT_PRINTF(fmt, ...)      FPGA_PRINTF("DT: " fmt "\n", ##__VA_ARGS__)
#define DT_PRINT(fmt, ...)       FPGA_PRINTF("DT: " fmt "\n", ##__VA_ARGS__)

#ifdef DT_VERBOSE
   #define DT_DBG(fmt, ...)      FPGA_PRINTF("DT: Debug: " fmt "\n", ##__VA_ARGS__)
#else
   #define DT_DBG(fmt, ...)      DUMMY_PRINTF("DT: Debug: " fmt, ##__VA_ARGS__)
#endif

#define DT_TX_BUFFER_TIMEOUT     ((uint64_t)500000)

#define DT_MAX_CMD_SIZE          6

#define DT_LF                    0x0A
#define DT_CR                    0x0D

#define DT_CMD_IS_EMPTY(p_cbuf, byte)  ((CBB_Empty(p_cbuf)) || (CBB_Peek(p_cbuf, 0, &byte) == IRC_SUCCESS) && ((byte == DT_LF) || (byte == DT_CR)))


/**
 * Debug terminal command parser function pointer data type.
 */
typedef IRC_Status_t (*debugTerminalCommandParserFunc_t)(circByteBuffer_t *cbuf);

/**
 * Debug terminal command data structure declaration.
 */
struct DebugTerminalCommandStruct {
   char *mnemonic;            /**< Debug terminal command mnemonic */
   debugTerminalCommandParserFunc_t parserFunc;   /**< Debug terminal command parser function pointer */
};

/**
 * Debug terminal command data type.
 */
typedef struct DebugTerminalCommandStruct debugTerminalCommand_t;

/**
 * Debug terminal ctrl intf data structure declaration.
 */
struct DebugTerminalCtrlIntfStruct {
   char *mnemonic;            /**< Debug terminal ctrl intf mnemonic */
   ctrlIntf_t *pCtrlIntf;     /**< Debug terminal ctrl intf pointer */
};

/**
 * Debug terminal ctrl intf data type.
 */
typedef struct DebugTerminalCtrlIntfStruct debugTerminalCtrlIntf_t;

/**
 * Debug terminal structure
 */
struct debugTerminalStruct {
   circularUART_t *cuart;           /**< Pointer to the UART link of the debug terminal */
   circByteBuffer_t *rxCircBuffer;  /**< Circular buffer to receive data */
   circByteBuffer_t *txCircBuffer;  /**< Circular buffer to transmit data */
   uint64_t txByteTime;             /**< Indicates when the last byte was pushed into txCircDataBuffer */
   netIntfPort_t port;              /**< Debug terminal network port. */
};

/**
 * DebugTerminal data type.
 */
typedef struct debugTerminalStruct debugTerminal_t;


IRC_Status_t DebugTerminal_Init(debugTerminal_t *debugTerminal,
      circByteBuffer_t *rxCircBuffer,
      circByteBuffer_t *txCircBuffer);
IRC_Status_t DebugTerminal_SetSerial(debugTerminal_t *debugTerminal, circularUART_t *uart);
IRC_Status_t DebugTerminal_Connect(debugTerminal_t *debugTerminal,
      netIntf_t *netIntf,
      circBuffer_t *cmdQueue);
void DebugTerminal_Process(debugTerminal_t *debugTerminal);
void DebugTerminal_SendMsgRequest(debugTerminal_t *debugTerminal);
uint8_t DebugTerminal_CommandIsEmpty(circByteBuffer_t *cbuf);

uint16_t GetNextArg(circByteBuffer_t *cbuf, uint8_t *buffer, uint16_t buflen);
IRC_Status_t ParseNumArg(char *str, uint8_t length, uint32_t *value);
IRC_Status_t ParseNumHex(char *str, uint8_t length, uint32_t *value);
IRC_Status_t ParseNumDec(char *str, uint8_t length, uint32_t *value);
IRC_Status_t ParseSignedNumDec(char *str, uint8_t length, int32_t *value);
IRC_Status_t ParseFloatNumDec(char *str, uint8_t length, float *value);

// Common debug terminal commands
IRC_Status_t DebugTerminalParseRDM(circByteBuffer_t *cbuf);
IRC_Status_t DebugTerminalParseWRM(circByteBuffer_t *cbuf);
IRC_Status_t DebugTerminalParseNET(circByteBuffer_t *cbuf);
IRC_Status_t DebugTerminalParseSTACK(circByteBuffer_t *cbuf);
IRC_Status_t DebugTerminalParseCI(circByteBuffer_t *cbuf);

#endif // DEBUGTERMINAL_H
