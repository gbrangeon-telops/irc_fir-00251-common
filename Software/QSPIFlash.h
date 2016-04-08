/**
 * @file QSPIFlash.h
 * QSPI flash module header.
 *
 * This file defines the interface used to manage QSPI flash.
 * This module use XSpi library based on xspi_numonyx_flash_quad_example.c.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */
#ifndef QSPIFLASH_H
#define QSPIFLASH_H

#include "xspi.h"
#include "xintc.h"
#include "IRC_Status.h"
#include "verbose.h"
#include <stdint.h>

#ifdef QSPI_VERBOSE
   #define QSPI_PRINTF(fmt, ...) FPGA_PRINTF("QSPI: " fmt, ##__VA_ARGS__)
#else
   #define QSPI_PRINTF(fmt, ...) DUMMY_PRINTF("QSPI: " fmt, ##__VA_ARGS__)
#endif

#define QSPI_ERR(fmt, ...)       FPGA_PRINTF("QSPI: Error: " fmt "\n", ##__VA_ARGS__)
#define QSPI_INF(fmt, ...)       FPGA_PRINTF("QSPI: Info: " fmt "\n", ##__VA_ARGS__)
#define QSPI_DBG(fmt, ...)       QSPI_PRINTF("Debug: " fmt "\n", ##__VA_ARGS__)

/**
 * The following constant defines the slave select signal that is used to
 * to select the Flash device on the SPI bus, this signal is typically
 * connected to the chip select of the device.
 */
#define SPI_SELECT               0x01

/**
 * Definitions of the commands shown in this example.
 */
#define COMMAND_PAGE_PROGRAM     0x02 /* Page Program command */
#define COMMAND_QUAD_WRITE       0x32 /* Quad Input Fast Program */
#define COMMAND_RANDOM_READ      0x03 /* Random read command */
#define COMMAND_DUAL_READ        0x3B /* Dual Output Fast Read */
#define COMMAND_DUAL_IO_READ     0xBB /* Dual IO Fast Read */
#define COMMAND_QUAD_READ        0x6B /* Quad Output Fast Read */
#define COMMAND_QUAD_IO_READ     0xEB /* Quad IO Fast Read */
#define COMMAND_WRITE_ENABLE     0x06 /* Write Enable command */
#define COMMAND_SECTOR_ERASE     0xD8 /* Sector Erase command */
#define COMMAND_BULK_ERASE       0xC7 /* Bulk Erase command */
#define COMMAND_STATUSREG_READ   0x05 /* Status read command */

/**
 * This definitions specify the EXTRA bytes in each of the command
 * transactions. This count includes Command byte, address bytes and any
 * don't care bytes needed.
 */
#define READ_WRITE_EXTRA_BYTES   4 /* Read/Write extra bytes */
#define WRITE_ENABLE_BYTES       1 /* Write Enable bytes */
#define SECTOR_ERASE_BYTES       4 /* Sector erase extra bytes */
#define BULK_ERASE_BYTES         1 /* Bulk erase extra bytes */
#define STATUS_READ_BYTES        2 /* Status read bytes count */
#define STATUS_WRITE_BYTES       2 /* Status write bytes count */

/**
 * Flash not busy mask in the status register of the flash device.
 */
#define FLASH_SR_IS_READY_MASK   0x01 /* Ready mask */

/**
 * Number of bytes in one page
 */
#define PAGE_SIZE                256

/**
 * Number of bytes in one sector
 */
#define SECTOR_SIZE              65536

/**
 * Number of bytes in one sector
 */
#define QSPIFLASH_SIZE           (256 * SECTOR_SIZE)

/*
 * The following definitions specify the number of dummy bytes to ignore in the
 * data read from the flash. This is apart from the dummy bytes returned in
 * response to the command and address transmitted.
 */
#define DUAL_READ_DUMMY_BYTES    2
#define QUAD_READ_DUMMY_BYTES    4

#define DUAL_IO_READ_DUMMY_BYTES 2
#define QUAD_IO_READ_DUMMY_BYTES 5


#define QSPIF_RXBUFFER_SIZE      (PAGE_SIZE + READ_WRITE_EXTRA_BYTES + QUAD_IO_READ_DUMMY_BYTES)
#define QSPIF_TXBUFFER_SIZE      (PAGE_SIZE + READ_WRITE_EXTRA_BYTES)

/**
 * QSPI flash status.
 */
enum qspiFlashStatusEnum {
   QSPIFS_IDLE = 0,
   QSPIFS_READ,
   QSPIFS_SECTOR_ERASE,
   QSPIFS_WRITE
};

/**
 * QSPI flash status data type.
 */
typedef enum qspiFlashStatusEnum qspiFlashStatus_t;

/**
 * QSPI flash transfer status.
 */
enum qspiFlashTransferStatusEnum {
   QSPIFTS_STATUS_REQUEST = 0,
   QSPIFTS_WAIT_FLASH_READY,
   QSPIFTS_FLASH_READY,
   QSPIFTS_WAIT_FLASH_WRITE_ENABLED,
   QSPIFTS_FLASH_WRITE_ENABLED,
   QSPIFTS_WAIT_TRANSFER_DONE,
   QSPIFTS_TRANSFER_DONE,
   QSPIFTS_ERROR
};

/**
 * QSPI flash transfer status data type.
 */
typedef enum qspiFlashTransferStatusEnum qspiFlashTransferStatus_t;

/**
 * QSPI flash data structure.
 * Contains all necessary information to manage QSPI flash.
 */
struct qspiFlashStruct {
   qspiFlashStatus_t status;                          /**< Status of the QSPI flash */
   volatile qspiFlashTransferStatus_t transferStatus; /**< Status of the QSPI flash transfer */
   XSpi spiDevice;                                    /**< Instance of the QSPI device */
   uint32_t address;                                  /**< Read or write address */
   uint8_t rxDataBuffer[QSPIF_RXBUFFER_SIZE];         /**< Buffer for receiving data */
   uint8_t txDataBuffer[QSPIF_TXBUFFER_SIZE];         /**< Buffer for transmitting data */
   uint8_t *p_data;                                   /**< Pointer to byte buffer containing data to transmit or receive */
   uint32_t dataCount;                                /**< Number of data bytes to transmit or received (without dummy and extra bytes) */
   uint32_t dataOffset;                               /**< Number of bytes that already been transmitted or received */
   uint16_t byteCount;                                /**< Number of transmitted or received bytes (including dummy and extra bytes) */
   uint32_t dataLength;                               /**< Number of bytes that are currently transmitted or received */
   uint8_t writeEnabled;                              /**< Indicate whether the write enable latch has been set */
};

/**
 * QSPI flash type definition.
 */
typedef struct qspiFlashStruct qspiFlash_t;

IRC_Status_t QSPIFlash_Init(qspiFlash_t *qspiFlash,
      uint16_t spiDeviceId,
      XIntc *intc,
      uint16_t spiIntrId);
IRC_Status_t QSPIFlash_Reset(qspiFlash_t *qspiFlash);
IRC_Status_t QSPIFlash_StatusReq(qspiFlash_t *qspiFlash);
IRC_Status_t QSPIFlash_WriteEnable(qspiFlash_t *qspiFlash);
IRC_Status_t QSPIFlash_Read(qspiFlash_t *qspiFlash, uint32_t address, uint8_t *buffer, uint32_t dataCount);
IRC_Status_t QSPIFlash_SectorErase(qspiFlash_t *qspiFlash, uint32_t address, uint32_t dataCount);
IRC_Status_t QSPIFlash_Write(qspiFlash_t *qspiFlash, uint8_t *buffer, uint32_t address, uint32_t dataCount);
IRC_Status_t QSPIFlash_UnitTest(qspiFlash_t *qspiFlash);
void QSPIFlash_Handler(void *CallBackRef, u32 StatusEvent, unsigned int ByteCount);

#endif // QSPIFLASH_H
