/**
 * @file GC_Manager.h
 * GenICam command manager module header.
 *
 * This file defines the GenICam command manager module interface.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef GC_MANAGER_H
#define GC_MANAGER_H

#include "NetworkInterface.h"
#include "CircularBuffer.h"
#include "Protocol_F1F2.h"
#include "IRC_Status.h"
#include "GenICam.h"
#include "verbose.h"
#include <stdint.h>


#ifdef GCM_VERBOSE
   #define GCM_PRINTF(fmt, ...)  PRINTF("GCM: " fmt, ##__VA_ARGS__)
#else
   #define GCM_PRINTF(fmt, ...)  DUMMY_PRINTF("GCM: " fmt, ##__VA_ARGS__)
#endif

#define GCM_ERR(fmt, ...)        PRINTF("GCM: Error: " fmt "\n", ##__VA_ARGS__)
#define GCM_INF(fmt, ...)        PRINTF("GCM: Info: " fmt "\n", ##__VA_ARGS__)
#define GCM_DBG(fmt, ...)        GCM_PRINTF("Debug: " fmt "\n", ##__VA_ARGS__)

#define GC_SHARED_REG_INIT_PERIOD_US   (uint64_t)500000

#define GC_RegisterWrite32(regIndex, data) GC_RegisterWrite(&gcRegsDef[regIndex], (uint32_t) &data, sizeof(uint32_t))



/**
 * GenICam manager state.
 */
enum gcmState {
   GCMS_INIT = 0,                /**< Initializing GC manager state machine */
   GCMS_WAITING_FOR_NETWORK_INTF,/**< Waiting for network interface to be ready */
   GCMS_SHARED_REG_INIT,         /**< Initializing shared registers */
   GCMS_SHARED_REG_INIT_DONE     /**< Shared registers initialization is done */
};

/**
 * GenICam manager state data type.
 */
typedef enum gcmState gcmState_t;


IRC_Status_t GC_Manager_Init(netIntf_t *netIntf, circBuffer_t *cmdQueue);
void GC_Manager_SM();
IRC_Status_t GC_RegisterReadRequest(F1F2Command_t *p_request, F1F2Command_t *p_response);
IRC_Status_t GC_RegisterWriteRequest(F1F2Command_t *p_request, F1F2Command_t *p_response);
IRC_Status_t GC_RegisterWrite(gcRegister_t *p_register, void *p_data, uint16_t dataLength);
IRC_Status_t GC_RegisterWriteUI32(gcRegister_t *p_register, uint32_t value);
IRC_Status_t GC_RegisterWriteI32(gcRegister_t *p_register, int32_t value);
IRC_Status_t GC_RegisterWriteFloat(gcRegister_t *p_register, float value);
IRC_Status_t GC_BroadcastRegisterWrite(gcRegister_t *p_register);

#endif // GC_MANAGER_H


