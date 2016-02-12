/**
 * @file NetworkInterface.h
 * Network interface module header.
 *
 * This file defines the network interface module.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef NETWORKINTERFACE_H
#define NETWORKINTERFACE_H

#include "Protocol_F1F2.h"
#include "GenICam.h"
#include "IRC_Status.h"
#include "verbose.h"
#include "utils.h"
#include <stdint.h>

/**
 * Network command data type.
 */
typedef struct networkCommandStruct networkCommand_t;

#include "CircularBuffer.h"

#ifdef NI_VERBOSE
   #define NI_PRINTF(fmt, ...)      PRINTF("NI: " fmt, ##__VA_ARGS__)
#else
   #define NI_PRINTF(fmt, ...)      DUMMY_PRINTF("NI: " fmt, ##__VA_ARGS__)
#endif

#define NI_ERR(fmt, ...)            PRINTF("NI: Error: " fmt "\n", ##__VA_ARGS__)
#define NI_INF(fmt, ...)            PRINTF("NI: Info: " fmt "\n", ##__VA_ARGS__)
#define NI_DBG(fmt, ...)            NI_PRINTF("Debug: " fmt "\n", ##__VA_ARGS__)

#define NI_MAX_NUM_OF_CONNECTIONS   2
#define NI_PING_TIMEOUT_US          TIME_ONE_SECOND_US   /**< Ping request timeout */
#define NI_MAX_PING_RETRY           30                   /**< Maximum retry for ping request */

/**
 * Network interface state.
 */
enum niStateEnum {
   NIS_INIT = 0,                 /**< Initializing network interface state machine */
   NIS_WATING_FOR_PING_RESPONSE, /**< Waiting for ping response */
   NIS_READY                     /**< Network interface is ready */
};

/**
 * Network interface state data type.
 */
typedef enum niStateEnum niState_t;

/**
 * Network address.
 */
enum niAddressEnum {
   NIA_UNDEFINED = 0,                           /**< The network address is not defined */
   NIA_PROCESSING_FPGA = GCRO_Processing_FPGA,  /**< Processing FPGA network address */
   NIA_OUTPUT_FPGA = GCRO_Output_FPGA,          /**< Output FPGA network address */
   NIA_STORAGE_FPGA = GCRO_Storage_FPGA,        /**< Storage FPGA network address */
   NIA_COUNTP1,                                 /**< Number of addresses + 1 */
   NIA_BROADCAST = 255                          /**< Broadcast network address */
};

/**
 * Network address data type.
 */
typedef enum niAddressEnum niAddress_t;

#define NI_NUM_OF_HOSTS (NIA_COUNTP1 - 1)

/**
 * Network port.
 */
enum niPortEnum {
   NIP_UNDEFINED = 0,   /**< The network port is not defined */
   NIP_GC_MANAGER,      /**< GenICam manager network port */
   NIP_GC_POLLER,       /**< GenICam poller network port */
   NIP_FIRM_UPDATER,    /**< Firmware updater network port */
   NIP_FILE_MANAGER,    /**< File manager network port */
   NIP_CI_CLINK,        /**< Camera link control interface network port */
   NIP_CI_PLEORA,       /**< Pleora control interface network port */
   NIP_CI_OEM,          /**< OEM control interface network port */
   NIP_CI_FILE_MANAGER, /**< File manager control interface network port */
   NIP_COUNTP1,         /**< Number of ports + 1 */
   NIP_BROADCAST = 255  /**< Broadcast network port */
};

/**
 * Network port data type.
 */
typedef enum niPortEnum niPort_t;

#define NI_MAX_NUM_OF_PORTS         (NIP_COUNTP1 - 1)

/**
 * Network interface data type.
 */
typedef struct netIntfStruct netIntf_t;

/**
 * Network interface local port data structure.
 */
struct netIntfPortStruct {
   netIntf_t *netIntf;        /**< Network interface pointer (NULL for connection) */
   niPort_t port;             /**< Network local port number (NIP_UNDEFINED for connection) */ 
   circBuffer_t *cmdQueue;    /**< Network local port command queue pointer */
};

/**
 * Network interface local port data type.
 */
typedef struct netIntfPortStruct netIntfPort_t;

/**
 * Network command data structure.
 */
struct networkCommandStruct {
   netIntfPort_t *port;    /**< Network command source port */
   F1F2Command_t f1f2;     /**< Network F1F2 command */
};


/**
 * Network interface data structure.
 */
struct netIntfStruct {
   niState_t currentState;
   niAddress_t address;
   uint8_t numberOfPorts;
   netIntfPort_t *ports[NI_MAX_NUM_OF_PORTS];
   uint8_t numberOfConnections;
   netIntfPort_t *connections[NI_MAX_NUM_OF_CONNECTIONS];
   netIntfPort_t *routingTable[NI_NUM_OF_HOSTS];
   circBuffer_t *cmdQueue;
   uint32_t retryCount;
   uint64_t tic_pingTimeout;
   uint64_t tic_pingStart;
   uint8_t showPackets;
};

#define NetIntf_HostReached(netIntf, address) (((address - 1) < NI_NUM_OF_HOSTS) && ((netIntf)->routingTable[address - 1] != NULL))

IRC_Status_t NetIntf_Init(netIntf_t *netIntf, niAddress_t address, circBuffer_t *cmdQueue);
IRC_Status_t NetIntf_Connect(netIntf_t *netIntf, netIntfPort_t *netIntfPort);
IRC_Status_t NetIntf_EnqueueCmd(netIntf_t *netIntf, networkCommand_t *netCmd);
void NetIntf_BuildBroadcastRequest(netIntfPort_t *netIntfPort, F1F2Command_t *p_request, niPort_t port);
void NetIntf_SM(netIntf_t *netIntf);

#endif // NETWORKINTERFACE_H


