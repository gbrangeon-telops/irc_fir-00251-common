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
#include "CircularUART.h"
#include "usart.h"
#include "xintc.h"
#include "verbose.h"
#include "utils.h"
#include <stdint.h>

#define XUN_EVENT_RECV_DATA      1 /**< Data has been received */
#define XUN_EVENT_RECV_TIMEOUT      2 /**< A receive timeout occurred */
#define XUN_EVENT_SENT_DATA      3 /**< Data has been sent */
#define XUN_EVENT_RECV_ERROR     4 /**< A receive error was detected */
#define XUN_EVENT_MODEM       5 /**< A change in modem status */


#ifdef CI_VERBOSE
   #define CI_PRINTF(fmt, ...)      FPGA_PRINTF("CI: " fmt, ##__VA_ARGS__)
#else
   #define CI_PRINTF(fmt, ...)      DUMMY_PRINTF("CI: " fmt, ##__VA_ARGS__)
#endif

#define CI_ERR(fmt, ...)            FPGA_PRINTF("CI: Error: " fmt "\n", ##__VA_ARGS__)
#define CI_INF(fmt, ...)            FPGA_PRINTF("CI: Info: " fmt "\n", ##__VA_ARGS__)
#define CI_DBG(fmt, ...)            CI_PRINTF("Debug: " fmt "\n", ##__VA_ARGS__)

#define CtrlIntf_GetLink(p_ctrlIntf) (p_ctrlIntf->linkType == CILT_CUART)  ? ((circularUART_t *)p_ctrlIntf->p_link) : ((usart_t *)p_ctrlIntf->p_link)

#define CtrlIntf_GetLinkTypeStr(p_ctrlIntf) (p_ctrlIntf->linkType == CILT_CUART) ? "CUART": (p_ctrlIntf->linkType == CILT_USART ? "USART" : "UNDEFINED")

#define CtrlIntf_GetLinkBaseAddress(p_ctrlIntf) \
      p_ctrlIntf->linkType == CILT_USART ? ((usart_t *)p_ctrlIntf->p_link)->BaseAddress : \
        (((circularUART_t *)p_ctrlIntf->p_link)->uartType == Lite ? ((circularUART_t *)p_ctrlIntf->p_link)->uart.Lite.RegBaseAddress :\
        ((circularUART_t *)p_ctrlIntf->p_link)->uart.Ns550.BaseAddress)\

#define CI_LINKERR(p_ctrlIntf, fmt, ...) CI_ERR("%s @ 0x%08X: " fmt, CtrlIntf_GetLinkTypeStr(p_ctrlIntf), CtrlIntf_GetLinkBaseAddress(p_ctrlIntf), ##__VA_ARGS__)


#ifdef TELOPS_DEBUG
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
   CILT_UNDEFINED = 0,  /**< Undefined link for the control interface */
   CILT_CUART,          /**< The control interface uses circular buffer UART link */
   CILT_USART           /**< The control interface uses USART link */
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
   void *p_link;              /**< Pointer to the physical link of the control interface */
   uint32_t linkErrorCount;   /**< The physical link error counter */

   circByteBuffer_t *rxCircBuffer;
   circByteBuffer_t *txCircBuffer;

   uint64_t rxByteTime;       /**< Indicates when the last byte was received */
   ciTxStatus_t txStatus;

#ifdef CI_REQUEST_PROCESSING_DURATION_TEST
   uint64_t rxCmdTime;        /**< Indicates when the last command was received */
#endif

   netIntfPort_t port;        /**< Control interface network port. */

   uint32_t errorCount;       /**< Control interface error counter */
   uint64_t tic_errorCount;   /**< Control interface error counter reset timer */

   uint8_t showBytes;         /**< Show RX and TX bytes flag */
};

/**
 * Control interface data type.
 */
typedef struct ctrlIntfStruct ctrlIntf_t;

IRC_Status_t CtrlIntf_Init(ctrlIntf_t *ctrlIntf,
      ciProtocol_t protocol,
      circByteBuffer_t *rxCircBuffer,
      circByteBuffer_t *txCircBuffer,
      netIntf_t *netIntf,
      circBuffer_t *cmdQueue,
      niPort_t niPort);
IRC_Status_t CtrlIntf_SetLink(ctrlIntf_t *ctrlIntf, ciLinkType_t linkType, void *p_link);
IRC_Status_t CtrlIntf_Enable(ctrlIntf_t *ctrlIntf);
IRC_Status_t CtrlIntf_Disable(ctrlIntf_t *ctrlIntf);
IRC_Status_t CtrlIntf_Reset(ctrlIntf_t *ctrlIntf);
void CtrlIntf_Process(ctrlIntf_t *ctrlIntf);
void CtrlIntf_MBSD_OutputDetection(networkCommand_t netCmd, gcRegister_t *p_register);
#endif // CTRLINTERFACE_H


