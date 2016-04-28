/**
 * @file DebugTerminal.c
 *  Debug terminal module implementation.
 *  
 *  This file implements the debug terminal module.
 * 
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "DebugTerminal.h"
#include "StackUtils.h"
#include <string.h>

static IRC_Status_t DebugTerminalParser(circByteBuffer_t *cbuf);

debugTerminal_t gDebugTerminal;

char inbyte(void)
{
   char c = 0;

   if (gDebugTerminal.uart.IsReady == XIL_COMPONENT_IS_READY)
   {
      c = XUartNs550_RecvByte(gDebugTerminal.uart.BaseAddress);
   }

   return c;
}

void outbyte(char c)
{
   if (gDebugTerminal.uart.IsReady == XIL_COMPONENT_IS_READY)
   {
      XUartNs550_SendByte(gDebugTerminal.uart.BaseAddress, c);
   }
   else
   {
      CBB_Push(&gDebugTerminal.txCircDataBuffer, c);
      GETTIME(&gDebugTerminal.txByteTime);
   }
}

/**
 * Initialize debug terminal.
 *
 * @param rxCircBuffer is a pointer to the buffer used to initialize received data circular buffer.
 * @param rxCircBufferSize is the size of the buffer used to initialize received data circular buffer.
 * @param txCircBuffer is a pointer to the buffer used to initialize transmitted data circular buffer.
 * @param txCircBufferSize is the size of the buffer used to initialize transmitted data circular buffer.
 *
 * @return IRC_SUCCESS when debug terminal successfully initialized.
 * @return IRC_FAILURE when debug terminal failed to initialize.
 */
IRC_Status_t DebugTerminal_Init(uint8_t *rxCircBuffer,
      uint16_t rxCircBufferSize,
      uint8_t *txCircBuffer,
      uint16_t txCircBufferSize)
{
   debugTerminal_t *debugTerminal = &gDebugTerminal;

   CBB_Init(&debugTerminal->rxCircDataBuffer, rxCircBuffer, rxCircBufferSize);
   CBB_Init(&debugTerminal->txCircDataBuffer, txCircBuffer, txCircBufferSize);

   return IRC_SUCCESS;
}

/**
 * Initialize debug terminal serial port.
 *
 * @param uartDeviceId is the UART device ID that can be found in xparameters.h file.
 *
 * @return IRC_SUCCESS when debug terminal serial port successfully initialized.
 * @return IRC_FAILURE when debug terminal serial port failed to initialize.
 */
IRC_Status_t DebugTerminal_InitSerial(uint16_t uartDeviceId)
{
   debugTerminal_t *debugTerminal = &gDebugTerminal;
   XUartNs550Format uartFormat;
   XStatus status;

   /*
    * Initialize the debug terminal UART driver.
    */
   status = XUartNs550_Initialize(&debugTerminal->uart, uartDeviceId);
   if (status != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   /*
    * Perform a self-test to ensure that the hardware was built correctly.
    */
   status = XUartNs550_SelfTest(&debugTerminal->uart);
   if (status != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   // Set UART device data format
   uartFormat.BaudRate = 115200;
   uartFormat.DataBits = XUN_FORMAT_8_BITS;
   uartFormat.Parity = XUN_FORMAT_NO_PARITY;
   uartFormat.StopBits = XUN_FORMAT_1_STOP_BIT;

   status = XUartNs550_SetDataFormat(&debugTerminal->uart, &uartFormat);
   if (status != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   // Flush Rx FIFO
   while (XUartNs550_IsReceiveData(debugTerminal->uart.BaseAddress))
   {
      XUartNs550_ReadReg(debugTerminal->uart.BaseAddress, XUN_RBR_OFFSET);
   }

   // Transmit queued char if any
   DebugTerminal_Output();

   return IRC_SUCCESS;
}

/**
 * Connect debug terminal to network interface.
 *
 * @param netIntf is the pointer to the network interface data structure.
 * @param cmdQueue is the pointer to the debug terminal command queue.
 *
 * @return IRC_SUCCESS when debug terminal successfully initialized.
 * @return IRC_FAILURE when debug terminal failed to initialize.
 */
IRC_Status_t DebugTerminal_Connect(netIntf_t *netIntf,
      circBuffer_t *cmdQueue)
{
   debugTerminal_t *debugTerminal = &gDebugTerminal;

   debugTerminal->port.port = NIP_DEBUG_TERMINAL;
   debugTerminal->port.cmdQueue = cmdQueue;

   // Connect debug terminal to network interface
   if (NetIntf_Connect(netIntf, &debugTerminal->port) != IRC_SUCCESS)
   {
      DT_ERR("Failed to connect to network interface.");
      return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}

/**
 * Receive data from debug terminal serial port.
 * This function also manage the debug terminal unlock.
 */
void DebugTerminal_Input()
{
   static uint8_t debugTerminalUnlocked = 0;
   static uint8_t lastByte = 0;
   debugTerminal_t *debugTerminal = &gDebugTerminal;
   uint8_t cmdStr[DT_MAX_CMD_SIZE + 1];
   uint32_t cmdlen;
   uint8_t byte;

   if (debugTerminal->uart.IsReady == XIL_COMPONENT_IS_READY)
   {
      // Check for new terminal command
      while (XUartNs550_IsReceiveData(debugTerminal->uart.BaseAddress) && !CBB_Full(&debugTerminal->rxCircDataBuffer))
      {
         byte = XUartNs550_ReadReg(debugTerminal->uart.BaseAddress, XUN_RBR_OFFSET);

         if ((byte == DT_LF) && (lastByte == DT_CR))
         {
            // CR + LF
            // LF char is ignored
         }
         else if ((byte == DT_CR) || (byte == DT_LF))
         {
            // CR or LF
            if (debugTerminalUnlocked == 1)
            {
               if (DebugTerminalParser(&debugTerminal->rxCircDataBuffer) != IRC_SUCCESS)
               {
                  CBB_Flush(&debugTerminal->rxCircDataBuffer);
               }
            }
            else
            {
               cmdlen = GetNextArg(&debugTerminal->rxCircDataBuffer, cmdStr, DT_MAX_CMD_SIZE);
               cmdStr[cmdlen++] = '\0'; // Add string terminator

               if ((strcasecmp((char *)cmdStr, "SPOLET") == 0) && (CBB_Empty(&debugTerminal->rxCircDataBuffer)))
               {
                  debugTerminalUnlocked = 1;
                  DT_INF("Debug terminal unlocked!!!");
               }
               else
               {
                  CBB_Flush(&debugTerminal->rxCircDataBuffer);
               }
            }
         }
         else
         {
            CBB_Push(&debugTerminal->rxCircDataBuffer, byte);
         }

         lastByte = byte;
      }
   }
}

/**
 * Transmit data to debug terminal serial port or to other
 * FPGA debug terminal when there is no available serial port.
 */
void DebugTerminal_Output()
{
   debugTerminal_t *debugTerminal = &gDebugTerminal;
   uint8_t byte;

   if (debugTerminal->uart.IsReady == XIL_COMPONENT_IS_READY)
   {
      // Transmit output bytes through serial port
      while(!CBB_Empty(&debugTerminal->txCircDataBuffer))
      {
         CBB_Pop(&debugTerminal->txCircDataBuffer, &byte);
         XUartNs550_SendByte(debugTerminal->uart.BaseAddress, byte);
      }
   }
   else if ((debugTerminal->port.netIntf->address != NIA_PROCESSING_FPGA) &&
         ((CBB_Length(&debugTerminal->txCircDataBuffer) >= F1F2_MAX_DEBUG_DATA_SIZE) ||
         ((!CBB_Empty(&debugTerminal->txCircDataBuffer)) && (elapsed_time_us(debugTerminal->txByteTime) > DT_TX_BUFFER_TIMEOUT))) &&
         (debugTerminal->port.netIntf->currentState == NIS_READY))
   {
      // Transmit output to processing FPGA debug terminal
       DebugTerminal_SendMsgRequest(debugTerminal);
   }
}

/**
 * Builds a F1F2 TEXT command from the Debug Terminal TX Buffer
 */
void DebugTerminal_SendMsgRequest(debugTerminal_t *debugTerminal) {

   networkCommand_t dtRequest;
  
   F1F2_CommandClear(&dtRequest.f1f2);
   dtRequest.f1f2.isNetwork = 1;
   dtRequest.f1f2.srcAddr = debugTerminal->port.netIntf->address;
   dtRequest.f1f2.srcPort = debugTerminal->port.port;
   dtRequest.f1f2.destAddr = NIA_PROCESSING_FPGA;
   dtRequest.f1f2.destPort = NIP_DEBUG_TERMINAL;
   dtRequest.f1f2.cmd = F1F2_CMD_DEBUG_TEXT;
   CBB_Popn(&debugTerminal->txCircDataBuffer,
      MIN(CBB_Length(&debugTerminal->txCircDataBuffer), F1F2_MAX_DEBUG_DATA_SIZE),
	  (uint8_t *)dtRequest.f1f2.payload.debug.text);
   dtRequest.port = &debugTerminal->port;

   if (NetIntf_EnqueueCmd(debugTerminal->port.netIntf, &dtRequest) != IRC_SUCCESS)
   {
      DT_ERR("Failed to push debug TEXT command in network interface command queue.");
   }
}

/**
 * Debug terminal process.
 */
void DebugTerminal_Process()
{
   static networkCommand_t dtRequest;
   static networkCommand_t dtResponse;
   debugTerminal_t *debugTerminal = &gDebugTerminal;
   circByteBuffer_t cbufCommand;

   // Clear debug terminal commands
   F1F2_CommandClear(&dtRequest.f1f2);
   F1F2_CommandClear(&dtResponse.f1f2);

   // Check for new request
   if (CB_Pop(debugTerminal->port.cmdQueue, &dtRequest) == IRC_SUCCESS)
   {
      if (dtRequest.f1f2.destAddr != NIA_BROADCAST)
      {
         DT_DBG("Request has been received (cmd: 0x%02X).", dtRequest.f1f2.cmd);

         // Process request
         switch (dtRequest.f1f2.cmd)
         {
            case F1F2_CMD_DEBUG_TEXT:
               PRINTF("%s", dtRequest.f1f2.payload.debug.text);
               F1F2_BuildACKResponse(&dtRequest.f1f2, &dtResponse.f1f2);
               break;

            case F1F2_CMD_DEBUG_CMD:
               CBB_InitFromBuffer(&cbufCommand,
                     (uint8_t *) dtRequest.f1f2.payload.debug.text,
                     sizeof(dtRequest.f1f2.payload.debug.text),
                     strlen(dtRequest.f1f2.payload.debug.text));
               DebugTerminalParser(&cbufCommand);
               F1F2_BuildACKResponse(&dtRequest.f1f2, &dtResponse.f1f2);
               break;

            case F1F2_CMD_PING:
               F1F2_BuildACKResponse(&dtRequest.f1f2, &dtResponse.f1f2);
               break;

            case F1F2_CMD_ACK:
            case F1F2_CMD_NAK:
               // Do nothing
               break;

            default:
               DT_ERR("Invalid debug terminal request command code.");
               F1F2_BuildNAKResponse(&dtRequest.f1f2, &dtResponse.f1f2);
               break;
         }
      }
      else
      {
         DT_ERR("Broadcasted commands are not supported.");
      }
   }

   if (dtResponse.f1f2.cmd != F1F2_CMD_NONE)
   {
      // Transmit response to master
      dtResponse.port = &debugTerminal->port;
      if (NetIntf_EnqueueCmd(debugTerminal->port.netIntf, &dtResponse) == IRC_SUCCESS)
      {
         DT_DBG("Response is transmitted to master device.");
      }
      else
      {
         DT_ERR("Failed to push command in network interface command queue.");
      }
   }

   DebugTerminal_Input();
   DebugTerminal_Output();
}

/**
 * Debug terminal command parser.
 * This general command parser is used to parse and validate command mnemonic.
 * It also calls command parsers related to command mnemonic.
 *
 * @param cbuf is the pointer to the circular buffer containing the data to be parsed.
 *
 * @return IRC_SUCCESS when debug terminal command was successfully executed.
 * @return IRC_FAILURE otherwise.
 */
IRC_Status_t DebugTerminalParser(circByteBuffer_t *cbuf)
{
   extern debugTerminalCommand_t gDebugTerminalCommands[];
   extern uint32_t gDebugTerminalCommandsCount;
   debugTerminal_t *debugTerminal = &gDebugTerminal;
   networkCommand_t dtRequest;
   uint8_t cmdStr[DT_MAX_CMD_SIZE + 1];
   uint32_t cmdlen;
   niAddress_t destAddr;
   uint32_t i;

   cmdlen = GetNextArg(cbuf, cmdStr, DT_MAX_CMD_SIZE);
   cmdStr[cmdlen++] = '\0'; // Add string terminator

   if (cmdStr[1] == '>')
   {
      switch (cmdStr[0])
      {
         case 'p':
         case 'P':
            destAddr = NIA_PROCESSING_FPGA;
            break;

         case 'o':
         case 'O':
            destAddr = NIA_OUTPUT_FPGA;
            break;

         case 's':
         case 'S':
            destAddr = NIA_STORAGE_FPGA;
            break;

         default:
            DT_ERR("Invalid command prefix. Type HLP for help.");
            return IRC_FAILURE;
            break;
      }

      if (destAddr != debugTerminal->port.netIntf->address)
      {
         // Transmit remaining command data to specified FPGA debug terminal
         F1F2_CommandClear(&dtRequest.f1f2);
         dtRequest.f1f2.isNetwork = 1;
         dtRequest.f1f2.srcAddr = debugTerminal->port.netIntf->address;
         dtRequest.f1f2.srcPort = debugTerminal->port.port;
         dtRequest.f1f2.destAddr = destAddr;
         dtRequest.f1f2.destPort = NIP_DEBUG_TERMINAL;
         dtRequest.f1f2.cmd = F1F2_CMD_DEBUG_CMD;
         CBB_Popn(cbuf, MIN(CBB_Length(cbuf), F1F2_MAX_DEBUG_DATA_SIZE), (uint8_t*) dtRequest.f1f2.payload.debug.text);
         dtRequest.port = &debugTerminal->port;

         if (NetIntf_EnqueueCmd(debugTerminal->port.netIntf, &dtRequest) != IRC_SUCCESS)
         {
            DT_ERR("Failed to push debug CMD command in network interface command queue.");
         }

         return IRC_SUCCESS;
      }
      else
      {
         cmdlen = GetNextArg(cbuf, cmdStr, DT_MAX_CMD_SIZE);
         cmdStr[cmdlen++] = '\0'; // Add string terminator
      }
   }
   else if ((gDebugTerminalCommands != NULL) && (gDebugTerminalCommandsCount > 0))
   {
      i = 0;
      while ((i < gDebugTerminalCommandsCount) && (strcasecmp((char *)cmdStr, gDebugTerminalCommands[i].mnemonic) != 0))
      {
         i++;
      }

      if (i == gDebugTerminalCommandsCount)
      {
         DT_ERR("Invalid command. Type HLP for help.");
         return IRC_FAILURE;
      }

      return gDebugTerminalCommands[i].parserFunc(cbuf);
   }

   return IRC_SUCCESS;
}

/**
 * Debug terminal command's arguments parser.
 * This parser is used to get the next command's argument.
 *
 * @param cbuf is the pointer to the circular buffer containing the data to be parsed.
 * @param buffer is the pointer to the byte buffer where the argument data is going to copied.
 * @param buflen is the length of the buffer passed as parameter.
 *
 * @return the argument length (without the terminator).
 * @return 0 if no terminated argument was found.
 */
uint16_t GetNextArg(circByteBuffer_t *cbuf, uint8_t *buffer, uint16_t buflen)
{
   uint8_t byte = 0;
   uint16_t length = 0;
   IRC_Status_t result = IRC_SUCCESS;
   uint8_t argTerminated = 0;

   do
   {
      result = CBB_Pop(cbuf, &byte);
      if ((result == IRC_SUCCESS) && (byte != ' '))
      {
         buffer[length++] = byte;
      }
      else
      {
         argTerminated = 1;
      }
   }
   while ((argTerminated == 0) && (length < buflen));

   if (length == buflen)
   {
      // Check if argument is terminated
      result = CBB_Peek(cbuf, 0, &byte);
      if ((result != IRC_SUCCESS) || (byte == ' '))
      {
         argTerminated = 1;
         CBB_Flushn(cbuf, 1);
      }
   }

   if (argTerminated == 1)
   {
      return length;
   }
   else
   {
      return 0;
   }
}

/**
 * Debug terminal numeric command's arguments parser.
 * This parser is used to parse a numeric command's argument (hex or decimal).
 *
 * @param str is the argument string to be parsed.
 * @param length is the length of string parameter.
 * @param value is the pointer to the uint32_t value to be returned.
 *
 * @return IRC_SUCCESS if the numeric argument was successfully parsed. value parameter content is valid.
 * @return IRC_FAILURE if the numeric argument cannot be parsed. value parameter content is not valid.
 */
IRC_Status_t ParseNumArg(char *str, uint8_t length, uint32_t *value)
{
   if ((length > 2) && (str[0] == '0') && (str[1] == 'x'))
   {
      return ParseNumHex(&str[2], length - 2, value);
   }
   else
   {
      return ParseNumDec(str, length, value);
   }
}

/**
 * Debug terminal hex command's arguments parser.
 * This parser is used to parse a hex numeric command's argument.
 *
 * @param str is the argument string to be parsed (without the 0x).
 * @param length is the length of string parameter.
 * @param value is the pointer to the uint32_t value to be returned.
 *
 * @return IRC_SUCCESS if the numeric argument was successfully parsed. value parameter content is valid.
 * @return IRC_FAILURE if the numeric argument cannot be parsed. value parameter content is not valid.
 */
IRC_Status_t ParseNumHex(char *str, uint8_t length, uint32_t *value)
{
   uint8_t i;
   uint32_t val;
   uint32_t mult;

   if ((length < 1) || (length > 8))
   {
      return IRC_FAILURE;
   }

   *value = 0;
   mult = 1;
   i = length;

   while (i > 0)
   {
      i--;
      if ((str[i] >= '0') && (str[i] <= '9'))
      {
         val = str[i] - '0';
      }
      else if ((str[i] >= 'a') && (str[i] <= 'f'))
      {
         val = 10 + str[i] - 'a';
      }
      else if ((str[i] >= 'A') && (str[i] <= 'F'))
      {
         val = 10 + str[i] - 'A';
      }
      else
      {
         return IRC_FAILURE;
      }
      *value += val * mult;
      mult *= 16;
   }

   return IRC_SUCCESS;
}

/**
 * Debug terminal decimal command's arguments parser.
 * This parser is used to parse a decimal numeric command's argument.
 *
 * @param str is the argument string to be parsed.
 * @param length is the length of string parameter.
 * @param value is the pointer to the uint32_t value to be returned.
 *
 * @return IRC_SUCCESS if the numeric argument was successfully parsed. value parameter content is valid.
 * @return IRC_FAILURE if the numeric argument cannot be parsed. value parameter content is not valid.
 */
IRC_Status_t ParseNumDec(char *str, uint8_t length, uint32_t *value)
{
   uint8_t i;
   uint32_t val;
   uint32_t mult;

   if ((length < 1) || (length > 10))
   {
      return IRC_FAILURE;
   }

   *value = 0;
   mult = 1;
   i = length;

   while (i > 0)
   {
      i--;
      if ((str[i] >= '0') && (str[i] <= '9'))
      {
         val = str[i] - '0';
      }
      else
      {
         return IRC_FAILURE;
      }

      // Check maximum 32-bit value
      if ((i == 10) && ((val > 4) ||
               ((val = 4) && (*value > (uint32_t)294967295))))
      {
            return IRC_FAILURE;
      }

      *value += val * mult;
      mult *= 10;
   }

   return IRC_SUCCESS;
}

/**
 * Debug terminal signed decimal command's arguments parser.
 * This parser is used to parse a signed decimal numeric command's argument.
 *
 * @param str is the argument string to be parsed.
 * @param length is the length of string parameter.
 * @param value is the pointer to the int32_t value to be returned.
 *
 * @return IRC_SUCCESS if the numeric argument was successfully parsed. value parameter content is valid.
 * @return IRC_FAILURE if the numeric argument cannot be parsed. value parameter content is not valid.
 */
IRC_Status_t ParseSignedNumDec(char *str, uint8_t length, int32_t *value)
{
   uint8_t i;
   uint32_t val;
   uint32_t mult;

   if ((length < 1) || (length > 11))
   {
      return IRC_FAILURE;
   }

   *value = 0;
   mult = 1;
   i = length;

   while (i > 0)
   {
      i--;
      if ((i == 0) && (str[i] == '-'))
      {
         *value *= -1;
      }
      else
      {
         if ((str[i] >= '0') && (str[i] <= '9'))
         {
            val = str[i] - '0';
         }
         else
         {
            return IRC_FAILURE;
         }

         // Check maximum 32-bit value
         if ((i == 10) && ((val > 4) ||
                  ((val = 4) && (*value > (uint32_t)294967295))))
         {
               return IRC_FAILURE;
         }

         *value += val * mult;
         mult *= 10;
      }
   }

   return IRC_SUCCESS;
}

/**
 * Debug terminal float decimal command's arguments parser.
 * This parser is used to parse a float decimal numeric command's argument.
 *
 * @param str is the argument string to be parsed.
 * @param length is the length of string parameter.
 * @param value is the pointer to the float value to be returned.
 *
 * @return IRC_SUCCESS if the numeric argument was successfully parsed. value parameter content is valid.
 * @return IRC_FAILURE if the numeric argument cannot be parsed. value parameter content is not valid.
 */
IRC_Status_t ParseFloatNumDec(char *str, uint8_t length, float *value)
{
   uint8_t dotPos;
   float negMult = 1.0F;
   uint32_t intPart = 0;
   uint32_t fractPart = 0;
   float precision = 0.0F;

   if (length == 0)
   {
      return IRC_FAILURE;
   }

   // Parse the sign
   if (str[0] == '-')
   {
      negMult = -1.0F;

      // Skip the minus sign
      str++;
      length--;
   }

   dotPos = 0;
   while ((str[dotPos] != '.') && (dotPos < length))
   {
      dotPos++;
   }

   // Parse the integer part
   if (dotPos != 0)
   {
      if (ParseNumDec(str, dotPos, &intPart) != IRC_SUCCESS)
      {
         return IRC_FAILURE;
      }
      str += dotPos;
      length -= dotPos;
   }

   if (length > 0)
   {
      // Skip the dot
      str++;
      length--;
   }

   // Parse the fractional part
   if (length > 0)
   {
      if (ParseNumDec((char *)str, length, &fractPart) != IRC_SUCCESS)
      {
         return IRC_FAILURE;
      }

      precision = 1.0F / pow10f(length);
   }

   *value = negMult * ( (float)intPart + ((float)fractPart * precision) );

   return IRC_SUCCESS;
}

/******************************************************************************
 * Common debug terminal commands
 ******************************************************************************/

/**
 * Debug terminal Read Memory command parser.
 * This parser is used to parse and validate Read Memory command arguments and to
 * execute the command.
 *
 * @param cbuf is the pointer to the circular buffer containing the data to be parsed.
 *
 * @return IRC_SUCCESS when Read Memory command was successfully executed.
 * @return IRC_FAILURE otherwise.
 */
IRC_Status_t DebugTerminalParseRDM(circByteBuffer_t *cbuf)
{
   uint32_t i;
   uint32_t addr;
   uint8_t isInteger;
   uint32_t nbit;
   uint32_t length;
   uint8_t argStr[11];
   uint32_t arglen;
   uint32_t dataPerLine = 8;

   // Read Address
   arglen = GetNextArg(cbuf, argStr, 10);
   if (ParseNumArg((char *)argStr, arglen, &addr) != IRC_SUCCESS)
   {
      DT_ERR("Invalid address.");
      return IRC_FAILURE;
   }

   isInteger = 1;
   nbit = 32;
   length = 1;

   // Try to read optional data type
   if (CBB_Pop(cbuf, argStr) == IRC_SUCCESS)
   {
      // Parse data type
      switch (argStr[0])
      {
         case 'c':
         case 'C':
            isInteger = 0;
            break;

         case 'u':
         case 'U':
         case 's':
         case 'S':
            isInteger = 1;
            break;

         default:
            DT_ERR("Invalid data type.");
            return IRC_FAILURE;
      }
      arglen = GetNextArg(cbuf, argStr, 2);
      if (((isInteger == 0) && (arglen > 0)) || ((isInteger == 1) && (arglen == 0)))
      {
         DT_ERR("Invalid data type.");
         return IRC_FAILURE;
      }
      if (isInteger == 1)
      {
         if (ParseNumArg((char *)argStr, arglen, &nbit) != IRC_SUCCESS)
         {
            DT_ERR("Invalid data type.");
            return IRC_FAILURE;
         }
         if ((nbit != 8) && (nbit != 16) && (nbit != 32))
         {
            DT_ERR("Invalid data type.");
            return IRC_FAILURE;
         }
      }

      // Read data length
      arglen = GetNextArg(cbuf, argStr, 10);
      if (ParseNumArg((char *)argStr, arglen, &length) != IRC_SUCCESS)
      {
         DT_ERR("Invalid data length.");
         return IRC_FAILURE;
      }
   }

   // There is supposed to be no remaining bytes in the buffer
   if (!CBB_Empty(cbuf))
   {
      DT_ERR("Unsupported command arguments");
      return IRC_FAILURE;
   }

   if (isInteger == 0)
   {
      // Output chars
      FPGA_PRINTF("DT: 0x%08X: \"", addr);
      for (i = 0; i < length; i++)
      {
         if ((*((char *)addr) >= ' ' ) && (*((char *)addr) <= '~' ))
         {
            PRINTF("%c", *((char *)addr));
         }
         else
         {
            PRINTF("[%03d]", *((uint8_t *)addr));
         }
         addr += 1;
      }
      PRINTF("\"\n");
   }
   else
   {
      // Validate address alignment
      if (((nbit == 16) && (addr % 2 != 0)) || ((nbit == 32) && (addr % 4 != 0)))
      {
         DT_ERR("Invalid address alignment.");
         return IRC_FAILURE;
      }

      // Output integers
      for (i = 0; i < length; i++)
      {
         if ( i % dataPerLine == 0)
         {
            FPGA_PRINTF("DT: 0x%08X: 0x", addr);
         }
         switch (nbit)
         {
            case 8:
               PRINTF("%02X ", *((uint8_t *)addr));
               break;

            case 16:
               PRINTF("%04X ", *((uint16_t *)addr));
               break;

            case 32:
               PRINTF("%08X ", *((uint32_t *)addr));
               break;
         }
         addr += (nbit / 8);

         if ( i % dataPerLine == (dataPerLine - 1))
         {
            PRINTF("\n");
         }
      }
      PRINTF("\n");
   }

   return IRC_SUCCESS;
}

/**
 * Debug terminal Write Memory command parser.
 * This parser is used to parse and validate Write Memory command arguments and to
 * execute the command.
 *
 * @param cbuf is the pointer to the circular buffer containing the data to be parsed.
 *
 * @return IRC_SUCCESS when Write Memory command was successfully executed.
 * @return IRC_FAILURE otherwise.
 */
IRC_Status_t DebugTerminalParseWRM(circByteBuffer_t *cbuf)
{
   uint32_t addr;
   uint32_t value;
   uint8_t argStr[11];
   uint32_t arglen;

   // Read Address
   arglen = GetNextArg(cbuf, argStr, 10);
   if (ParseNumArg((char *)argStr, arglen, &addr) != IRC_SUCCESS)
   {
      DT_ERR("Invalid address.");
      return IRC_FAILURE;
   }

   // Validate address alignment
   if (addr % 4 != 0)
   {
      DT_ERR("Invalid address alignment.");
      return IRC_FAILURE;
   }

   // Read data value
   arglen = GetNextArg(cbuf, argStr, 10);
   if (ParseNumArg((char *)argStr, arglen, &value) != IRC_SUCCESS)
   {
      DT_ERR("Invalid data value.");
      return IRC_FAILURE;
   }

   // There is supposed to be no remaining bytes in the buffer
   if (!CBB_Empty(cbuf))
   {
      DT_ERR("Unsupported command arguments");
      return IRC_FAILURE;
   }

   // Write data to memory
   *((uint32_t *)addr) = value;

   DT_INF("%d (0x%08X) has been written @ 0x%08X", value, value, addr);

   return IRC_SUCCESS;
}

/**
 * Debug terminal get network status command parser.
 * This parser is used to parse and validate get network
 * status command arguments and to execute the command.
 *
 * @return IRC_SUCCESS when get network status command was successfully executed.
 * @return IRC_FAILURE otherwise.
 */
IRC_Status_t DebugTerminalParseNET(circByteBuffer_t *cbuf)
{
   extern netIntf_t gNetworkIntf;
   uint8_t argStr[3];
   uint32_t arglen;
   uint32_t showPacketsMode;
   uint32_t showPacketsPortFilter = 0;
   uint32_t i, j;

   if (!CBB_Empty(cbuf))
   {
      // Read show packet value
      arglen = GetNextArg(cbuf, argStr, 1);
      if ((ParseNumArg((char *)argStr, arglen, &showPacketsMode) != IRC_SUCCESS) ||
            ((showPacketsMode != 0) && (showPacketsMode != 1)))
      {
         DT_ERR("Invalid logical value.");
         return IRC_FAILURE;
      }

      if ((showPacketsMode) && (!CBB_Empty(cbuf)))
      {
         // Read show packet port filter
         arglen = GetNextArg(cbuf, argStr, 2);
         if ((ParseNumArg((char *)argStr, arglen, &showPacketsPortFilter) != IRC_SUCCESS) ||
               (showPacketsPortFilter > NI_MAX_NUM_OF_PORTS))
         {
            DT_ERR("Invalid port value.");
            return IRC_FAILURE;
         }

         showPacketsMode = NISPM_FILTERED;
      }

      // There is supposed to be no remaining bytes in the buffer
      if (!CBB_Empty(cbuf))
      {
         DT_ERR("Unsupported command arguments");
         return IRC_FAILURE;
      }

      gNetworkIntf.showPacketsMode = showPacketsMode;
      gNetworkIntf.showPacketsPortFilter = showPacketsPortFilter;
   }

   DT_PRINTF("Address: %d", gNetworkIntf.address);
   DT_PRINTF("Routing table:");
   for (i = 0; i < NI_NUM_OF_HOSTS; i++)
   {
      if ((i + 1) != gNetworkIntf.address)
      {
         if (gNetworkIntf.routingTable[i] == NULL)
         {
            DT_PRINTF("   Host %d is unreachable.", (i + 1));
         }
         else
         {
            for (j = 0; j < gNetworkIntf.numberOfConnections; j++)
            {
               if (gNetworkIntf.routingTable[i] == gNetworkIntf.connections[j])
               {
                  DT_PRINTF("   Host %d is reachable through connection %d.", (i + 1), j);
               }
            }
         }
      }
   }

   DT_PRINTF("Command queues:");
   DT_PRINTF("   Network: %d / %d (%d)%c", gNetworkIntf.cmdQueue->length, gNetworkIntf.cmdQueue->size, gNetworkIntf.cmdQueue->maxLength,
         (gNetworkIntf.cmdQueue->maxLength == gNetworkIntf.cmdQueue->size)?'*':' ');

   for (i = 0; i < gNetworkIntf.numberOfPorts; i++)
   {
      DT_PRINTF("   Port %d:  %d / %d (%d)%c", gNetworkIntf.ports[i]->port, gNetworkIntf.ports[i]->cmdQueue->length,
            gNetworkIntf.ports[i]->cmdQueue->size, gNetworkIntf.ports[i]->cmdQueue->maxLength,
            (gNetworkIntf.ports[i]->cmdQueue->maxLength == gNetworkIntf.ports[i]->cmdQueue->size)?'*':' ');
   }

   for (i = 0; i < gNetworkIntf.numberOfConnections; i++)
   {
      DT_PRINTF("   Conn %d:  %d / %d (%d)%c", i, gNetworkIntf.connections[i]->cmdQueue->length,
            gNetworkIntf.connections[i]->cmdQueue->size, gNetworkIntf.connections[i]->cmdQueue->maxLength,
            (gNetworkIntf.connections[i]->cmdQueue->maxLength == gNetworkIntf.connections[i]->cmdQueue->size)?'*':' ');
   }

   return IRC_SUCCESS;
}

/**
 * Get Stack Level command parser.
 * This parser is used to parse and validate Get Stack Level command arguments
 * and to execute the command.
 *
 * @param cbuf is the pointer to the circular buffer containing the data to be parsed.
 *
 * @return IRC_SUCCESS when Get Stack Level command was successfully executed.
 * @return IRC_FAILURE otherwise.
 */
IRC_Status_t DebugTerminalParseSTACK(circByteBuffer_t *cbuf)
{
   // There is supposed to be no remaining bytes in the buffer
   if (!CBB_Empty(cbuf))
   {
      DT_ERR("Unsupported command arguments");
      return IRC_FAILURE;
   }

   DT_PRINTF("Stack level: %d/%d (%d)",
         Stack_GetActualLevel(), Stack_GetSize(), Stack_GetMaximumLevel());

   return IRC_SUCCESS;
}
