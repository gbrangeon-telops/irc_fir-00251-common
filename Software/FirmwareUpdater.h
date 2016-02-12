/**
 * @file FirmwareUpdater.h
 * Firmware updater module declaration.
 *
 * This file declares the firmware updater module.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef FIRMWAREUPDATER_H
#define FIRMWAREUPDATER_H

#include "NetworkInterface.h"
#include "CircularBuffer.h"
#include "QSPIFlash.h"
#include "IRC_Status.h"
#include "verbose.h"
#include <stdint.h>

#ifdef FU_VERBOSE
   #define FU_PRINTF(fmt, ...)   PRINTF("FU: " fmt, ##__VA_ARGS__)
#else
   #define FU_PRINTF(fmt, ...)   DUMMY_PRINTF("FU: " fmt, ##__VA_ARGS__)
#endif

#define FU_ERR(fmt, ...)         PRINTF("FU: Error: " fmt "\n", ##__VA_ARGS__)
#define FU_INF(fmt, ...)         PRINTF("FU: Info: " fmt "\n", ##__VA_ARGS__)
#define FU_DBG(fmt, ...)         FU_PRINTF("Debug: " fmt "\n", ##__VA_ARGS__)


/**
 * Firmware updater state.
 */
enum fuStateEnum {
   FUS_INIT = 0,                 /**< Initialize firmware updater state machine */
   FUS_WAITING_FOR_REQUEST,      /**< Waiting for request from master */
   FUS_ERASING_FLASH,            /**< Erasing QSPI flash */
   FUS_READING_FLASH,            /**< Reading QSPI flash */
   FUS_WRITING_FLASH,            /**< Writing QSPI flash */
   FUS_CHECKING_FLASH            /**< Checking QSPI flash */
};

/**
 * Firmware updater state data type.
 */
typedef enum fuStateEnum fuState_t;


IRC_Status_t Firmware_Updater_Init(netIntf_t *netIntf, circBuffer_t *cmdQueue, qspiFlash_t *qspiFlash);
void Firmware_Updater_SM();

#endif // FIRMWAREUPDATER_H
