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

#include "CircularByteBuffer.h"
#include "CircularBuffer.h"
#include "NetworkInterface.h"
#include "xuartns550.h"
#include "xintc.h"
#include "IRC_Status.h"
#include "utils.h"
#include "verbose.h"

#if (defined(STDOUT_BASEADDRESS) || defined(STDIN_BASEADDRESS))
#error STDIN and STDOUT must be set to "none" in the BSP.
#endif

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
 * Debug terminal structure
 */
struct debugTerminalStruct {
   XUartNs550 uart;           /**< The UART link of the debug terminal */
   circByteBuffer_t rxCircDataBuffer; /**< Circular buffer to receive data */
   circByteBuffer_t txCircDataBuffer; /**< Circular buffer to transmit data */
   uint64_t txByteTime;       /**< Indicates when the last byte was pushed into txCircDataBuffer */
   netIntfPort_t port;        /**< Debug terminal network port. */
};

/**
 * DebugTerminal data type.
 */
typedef struct debugTerminalStruct debugTerminal_t;


IRC_Status_t DebugTerminal_Init(uint8_t *rxCircBuffer,
      uint16_t rxCircBufferSize,
      uint8_t *txCircBuffer,
      uint16_t txCircBufferSize);
IRC_Status_t DebugTerminal_InitSerial(uint16_t uartDeviceId);
IRC_Status_t DebugTerminal_Connect(netIntf_t *netIntf,
      circBuffer_t *cmdQueue);
void DebugTerminal_Input();
void DebugTerminal_Output();
void DebugTerminal_SendMsgRequest(debugTerminal_t *debugTerminal);
void DebugTerminal_Process();
uint16_t GetNextArg(circByteBuffer_t *cbuf, uint8_t *buffer, uint16_t buflen);
IRC_Status_t ParseNumArg(char *str, uint8_t length, uint32_t *value);
IRC_Status_t ParseNumHex(char *str, uint8_t length, uint32_t *value);
IRC_Status_t ParseNumDec(char *str, uint8_t length, uint32_t *value);
IRC_Status_t ParseSignedNumDec(char *str, uint8_t length, int32_t *value);

// Common debug terminal commands
IRC_Status_t DebugTerminalParseRDM(circByteBuffer_t *cbuf);
IRC_Status_t DebugTerminalParseWRM(circByteBuffer_t *cbuf);
IRC_Status_t DebugTerminalParseNET(circByteBuffer_t *cbuf);
IRC_Status_t DebugTerminalParseSTACK(circByteBuffer_t *cbuf);

#endif // DEBUGTERMINAL_H
