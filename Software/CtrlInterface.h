/**
 * @file CtrlInterface.h
 * Control interface module header.
 *
 * This file defines the control interface module.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef CTRLINTERFACE_H
#define CTRLINTERFACE_H

#include "CircularByteBuffer.h"
#include "CircularBuffer.h"
#include "NetworkInterface.h"
#include "IRC_Status.h"
#include "xuartns550.h"
#include "CircularUART.h"
#include "usart.h"
#include "xintc.h"
#include "verbose.h"
#include "utils.h"
#include <stdint.h>

#ifdef CI_VERBOSE
   #define CI_PRINTF(fmt, ...)      PRINTF("CI: " fmt, ##__VA_ARGS__)
#else
   #define CI_PRINTF(fmt, ...)      DUMMY_PRINTF("CI: " fmt, ##__VA_ARGS__)
#endif

#define CI_ERR(fmt, ...)            PRINTF("CI: Error: " fmt "\n", ##__VA_ARGS__)
#define CI_INF(fmt, ...)            PRINTF("CI: Info: " fmt "\n", ##__VA_ARGS__)
#define CI_DBG(fmt, ...)            CI_PRINTF("Debug: " fmt "\n", ##__VA_ARGS__)

#define CI_LINKERR(p_ctrlIntf, fmt, ...) \
      p_ctrlIntf->linkType == CILT_UART ? CI_ERR("UART @ 0x%08X: " fmt, p_ctrlIntf->link.uart.BaseAddress, ##__VA_ARGS__) : \
      p_ctrlIntf->linkType == CILT_CUART ? CI_ERR("CUART @ 0x%08X: " fmt, p_ctrlIntf->link.cuart.uart.BaseAddress, ##__VA_ARGS__) : \
      CI_ERR("USART @ 0x%08X: " fmt, p_ctrlIntf->link.usart.BaseAddress, ##__VA_ARGS__)

#ifdef DEBUG
// #define CI_REQUEST_PROCESSING_DURATION_TEST
#endif

#define CI_RX_TIMEOUT_US            100000
#define CI_ERROR_COUNTER_RESET_US   (2 * TIME_ONE_SECOND_US)
#define CI_ERROR_COUNTER_THRESHOLD  10


/**
 * Control interface protocol.
 */
enum ciProtocolEnum {
   CIP_F1F2 = 0,           /**< The control interface uses F1F2 protocol */
   CIP_F1F2_NETWORK,       /**< The control interface uses F1F2 network protocol */
   CIP_PLEORA              /**< The control interface uses Pleora protocol */
};

/**
 * Control interface protocol data type.
 */
typedef enum ciProtocolEnum ciProtocol_t;

/**
 * Control interface link type.
 */
enum ciLinkTypeEnum {
   CILT_UART = 0,          /**< The control interface uses UART link */
   CILT_CUART,             /**< The control interface uses circular buffer UART link */
   CILT_USART              /**< The control interface uses USART link */
};

/**
 * Control interface link type data type.
 */
typedef enum ciLinkTypeEnum ciLinkType_t;

/**
 * Control interface transmission status.
 */
enum ciTxStatusEnum {
   CITS_READY = 0,        /**< The control interface is ready to transmit data */
   CITS_BUSY,             /**< The control interface is transmitting data */
};

/**
 * Control interface transmission status data type.
 */
typedef enum ciTxStatusEnum ciTxStatus_t;

/**
 * Control interface structure
 */
struct ctrlIntfStruct {
   ciProtocol_t protocol;     /**< The control interface protocol */

   ciLinkType_t linkType;     /**< The control interface link type */
   union {
      XUartNs550 uart;        /**< The UART link of the control interface */
      circularUART_t cuart;   /**< The circular buffer UART link of the control interface */
      usart_t usart;          /**< The USART link of the control interface */
   } link;                    /**< The physical link of the control interface */
   XIntc *intc;               /**< The pointer to the Interrupt controller instance */
   uint16_t linkIntrId;       /**< The physical link interrupt ID */
   uint32_t linkErrorCount;   /**< The physical link error counter */

   uint8_t *rxDataBuffer;     /**< Buffer for receiving data */
   uint16_t rxDataBufferSize; /**< Receiving data buffer size */
   circByteBuffer_t rxCircDataBuffer; /**< Circular buffer to receive data */
   uint8_t rxDataReady;       /**< Indicates whether new data is ready to be processed */
   uint64_t rxByteTime;       /**< Indicates when the last byte was received */

#ifdef CI_REQUEST_PROCESSING_DURATION_TEST
   uint64_t rxCmdTime;        /**< Indicates when the last command was received */
#endif

   uint8_t *txDataBuffer;     /**< Buffer for transmitting data */
   uint16_t txDataBufferSize; /**< Transmitting data buffer size */
   ciTxStatus_t txStatus;     /**< Indicates control interface transmission status */

   netIntfPort_t port;        /**< Control interface network port. */

   uint32_t errorCount;       /**< Control interface error counter */
   uint64_t tic_errorCount;   /**< Control interface error counter reset timer */

   uint8_t showBytes;         /**< Show RX and TX bytes flag */
   uint8_t loopback;          /**< Loopback flag */
};

/**
 * Control interface data type.
 */
typedef struct ctrlIntfStruct ctrlIntf_t;


IRC_Status_t CtrlIntf_InitUART(ctrlIntf_t *ctrlIntf,
      ciProtocol_t protocol,
      uint16_t uartDeviceId,
      XIntc *intc,
      uint16_t uartIntrId,
      uint8_t *rxBuffer,
      uint16_t rxBufferSize,
      uint8_t *rxCircBuffer,
      uint16_t rxCircBufferSize,
      uint8_t *txBuffer,
      uint16_t txBufferSize,
      netIntf_t *netIntf,
      circBuffer_t *cmdQueue,
      niPort_t niPort);

IRC_Status_t CtrlIntf_InitCircularUART(ctrlIntf_t *ctrlIntf,
      ciProtocol_t protocol,
      uint16_t uartDeviceId,
      XIntc *intc,
      uint16_t uartIntrId,
      uint8_t *rxCircBuffer,
      uint16_t rxCircBufferSize,
      uint8_t *txBuffer,
      uint16_t txBufferSize,
      netIntf_t *netIntf,
      circBuffer_t *cmdQueue,
      niPort_t niPort);

IRC_Status_t CtrlIntf_InitUSART(ctrlIntf_t *ctrlIntf,
      ciProtocol_t protocol,
      uint32_t usartBaseAddress,
      XIntc *intc,
      uint16_t uartIntrId,
      uint8_t *rxCircBuffer,
      uint16_t rxCircBufferSize,
      uint8_t *txBuffer,
      uint16_t txBufferSize,
      netIntf_t *netIntf,
      circBuffer_t *cmdQueue,
      niPort_t niPort);

void CtrlIntf_Process(ctrlIntf_t *ctrlIntf);

#endif // CTRLINTERFACE_H


