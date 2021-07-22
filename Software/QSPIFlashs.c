/**
 * @file QSPIFlash.c
 * QSPI flash module implementation.
 *
 * This file implements the interface used to manage QSPI flash.
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

#include "QSPIFlash.h"
#include "utils.h"
#include <string.h>

/**
 * Initializes QSPI flash.
 * Initializes QSPI flash by initializing the QSPI flash data structure.
 * It also connects and enables SPI interrupt.
 *
 * @param qspiFlash is the pointer to the QSPI flash data structure.
 * @param spiDeviceId is the QSPI device ID that can be found in xparameters.h file.
 * @param intc is the pointer to the Interrupt controller instance.
 * @param spiIntrId is the UART interrupt ID that can be found in xparameters.h file.
 *
 * @return IRC_SUCCESS if successfully initialized
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t QSPIFlash_Init(qspiFlash_t *qspiFlash,
      uint16_t spiDeviceId,
      XIntc *intc,
      uint16_t spiIntrId)
{
   XStatus status;
   XSpi_Config *spiConfig;
   
	/*
	 * Initialize the SPI driver so that it's ready to use.
	 */
	spiConfig = XSpi_LookupConfig(spiDeviceId);
	if (spiConfig == NULL)
	{
		return IRC_FAILURE;
	}

  	status = XSpi_CfgInitialize(&qspiFlash->spiDevice, spiConfig, spiConfig->BaseAddress);
	if (status != XST_SUCCESS)
	{
		return IRC_FAILURE;
	}

   /*
    * Connect a device driver handler that will be called when an interrupt
    * for the device occurs, the device driver handler performs the specific
    * interrupt processing for the device.
    */
   status = XIntc_Connect(intc, spiIntrId,
                        (XInterruptHandler)XSpi_InterruptHandler,
                        &qspiFlash->spiDevice);
   if (status != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   /*
    * Setup the handler for the SPI that will be called from the interrupt
    * context when an SPI status occurs, specify a pointer to the SPI
    * driver instance as the callback reference so the handler is able to
    * access the instance data.
    */
   XSpi_SetStatusHandler(&qspiFlash->spiDevice, qspiFlash, (XSpi_StatusHandler)QSPIFlash_Handler);

   /*
    * Set the SPI device as a master and in manual slave select mode such
    * that the slave select signal does not toggle for every byte of a
    * transfer, this must be done before the slave select is set.
    */
   status = XSpi_SetOptions(&qspiFlash->spiDevice, XSP_MASTER_OPTION | XSP_MANUAL_SSELECT_OPTION);
   if(status != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   /*
    * Select the quad flash device on the SPI bus, so that it can be
    * read and written using the SPI bus.
    */
   status = XSpi_SetSlaveSelect(&qspiFlash->spiDevice, SPI_SELECT);
   if(status != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   /*
    * Start the SPI driver so that interrupts and the device are enabled.
    */
   // TODO Verify that we really need to execute the following line or the XIntc_Enable in proc_init.c
   XSpi_Start(&qspiFlash->spiDevice);
   
   /*
    * Initialize QSPI flash data structure.
    */
   QSPIFlash_Reset(qspiFlash);
   
   return IRC_SUCCESS;
}

/**
 * Reset QSPI flash data structure.
 *
 * @param qspiFlash is the pointer to the QSPI flash data structure.
 *
 * @return IRC_SUCCESS always.
 */
IRC_Status_t QSPIFlash_Reset(qspiFlash_t *qspiFlash)
{
   qspiFlash->status = QSPIFS_IDLE;
   qspiFlash->transferStatus = QSPIFTS_STATUS_REQUEST;
   qspiFlash->address = 0;
   qspiFlash->p_data = NULL;
   qspiFlash->dataCount = 0;
   qspiFlash->dataOffset = 0;
   qspiFlash->byteCount = 0;
   qspiFlash->dataLength = 0;
   qspiFlash->writeEnabled = 0;

   return IRC_SUCCESS;
}

/**
 * Transmit status request command to QSPI flash.
 *
 * @param qspiFlash is the pointer to the QSPI flash data structure.
 *
 * @return IRC_SUCCESS if successfully transmitted status request command to QSPI flash.
 * @return IRC_FAILURE if failed to transmit status request command to QSPI flash.
 */
IRC_Status_t QSPIFlash_StatusReq(qspiFlash_t *qspiFlash)
{
   XStatus xstatus;

   qspiFlash->txDataBuffer[0] = COMMAND_STATUSREG_READ;

   qspiFlash->byteCount = STATUS_READ_BYTES;

   xstatus = XSpi_Transfer(&qspiFlash->spiDevice, qspiFlash->txDataBuffer, qspiFlash->rxDataBuffer, qspiFlash->byteCount);
   if(xstatus != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}

/**
 * Transmit write enable command to QSPI flash.
 *
 * @param qspiFlash is the pointer to the QSPI flash data structure.
 *
 * @return IRC_SUCCESS if successfully transmitted write enable command to QSPI flash.
 * @return IRC_FAILURE if failed to transmit write enable command to QSPI flash.
 */
IRC_Status_t QSPIFlash_WriteEnable(qspiFlash_t *qspiFlash)
{
   XStatus xstatus;

   qspiFlash->txDataBuffer[0] = COMMAND_WRITE_ENABLE;

   qspiFlash->byteCount = WRITE_ENABLE_BYTES;

   xstatus = XSpi_Transfer(&qspiFlash->spiDevice, qspiFlash->txDataBuffer, NULL, qspiFlash->byteCount);
   if(xstatus != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}

/**
 * Read data from QSPI Flash at specified address.
 *
 * @param qspiFlash is the pointer to the QSPI flash data structure.
 * @param address is address where to read the data.
 * @param buffer is a pointer to the byte buffer that will be filled using received data.
 * @param dataCount is the number of bytes to read.
 *
 * @return IRC_NOT_DONE if the flash reading is not done.
 * @return IRC_SUCCESS if successfully read the flash.
 * @return IRC_FAILURE if failed to read the flash.
 */
IRC_Status_t QSPIFlash_Read(qspiFlash_t *qspiFlash, uint32_t address, uint8_t *buffer, uint32_t dataCount)
{
   uint32_t tmpAddress;
   uint32_t nextPageAddr;
   IRC_Status_t status;
   XStatus xstatus;

   if (qspiFlash->status == QSPIFS_IDLE)
   {
      QSPIFlash_Reset(qspiFlash);
      qspiFlash->status = QSPIFS_READ;
      qspiFlash->address = address;
      qspiFlash->p_data = buffer;
      qspiFlash->dataCount = dataCount;
   }
   else if (qspiFlash->status != QSPIFS_READ)
   {
      QSPIFlash_Reset(qspiFlash);
      return IRC_FAILURE;
   }

   switch(qspiFlash->transferStatus)
   {
      case QSPIFTS_STATUS_REQUEST:
         qspiFlash->transferStatus = QSPIFTS_WAIT_FLASH_READY;
         status = QSPIFlash_StatusReq(qspiFlash);
         if (status != IRC_SUCCESS)
         {
            QSPIFlash_Reset(qspiFlash);
            return IRC_FAILURE;
         }
         break;

      case QSPIFTS_WAIT_FLASH_READY:
      case QSPIFTS_WAIT_TRANSFER_DONE:
         // Nothing to do
         break;

      case QSPIFTS_FLASH_READY:
         tmpAddress = qspiFlash->address + qspiFlash->dataOffset;
         nextPageAddr = ((tmpAddress / PAGE_SIZE) + 1 ) * PAGE_SIZE;
         qspiFlash->dataLength = MIN(nextPageAddr - tmpAddress, qspiFlash->dataCount - qspiFlash->dataOffset);

         qspiFlash->txDataBuffer[0] = COMMAND_RANDOM_READ;
         qspiFlash->txDataBuffer[1] = (uint8_t)((tmpAddress >> 16) & 0x000000FF);
         qspiFlash->txDataBuffer[2] = (uint8_t)((tmpAddress >> 8) & 0x000000FF);
         qspiFlash->txDataBuffer[3] = (uint8_t)(tmpAddress & 0x000000FF);

         qspiFlash->byteCount = qspiFlash->dataLength + READ_WRITE_EXTRA_BYTES;

         qspiFlash->transferStatus = QSPIFTS_WAIT_TRANSFER_DONE;

         xstatus = XSpi_Transfer(&qspiFlash->spiDevice, qspiFlash->txDataBuffer, qspiFlash->rxDataBuffer, qspiFlash->byteCount);
         if(xstatus != XST_SUCCESS)
         {
            QSPIFlash_Reset(qspiFlash);
            return IRC_FAILURE;
         }

         QSPI_DBG("Reading %d bytes @ 0x%08X...", qspiFlash->dataLength, tmpAddress);
         break;

      case QSPIFTS_TRANSFER_DONE:
         memcpy(&qspiFlash->p_data[qspiFlash->dataOffset],
               &qspiFlash->rxDataBuffer[READ_WRITE_EXTRA_BYTES],
               qspiFlash->dataLength);
         qspiFlash->dataOffset += qspiFlash->dataLength;

         if (qspiFlash->dataOffset != qspiFlash->dataCount)
         {
            qspiFlash->transferStatus = QSPIFTS_WAIT_FLASH_READY;
            status = QSPIFlash_StatusReq(qspiFlash);
            if (status != IRC_SUCCESS)
            {
               QSPIFlash_Reset(qspiFlash);
               return IRC_FAILURE;
            }
         }
         else
         {
            qspiFlash->status = QSPIFS_IDLE;
            return IRC_SUCCESS;
         }
         break;

      case QSPIFTS_WAIT_FLASH_WRITE_ENABLED:
      case QSPIFTS_FLASH_WRITE_ENABLED:
      case QSPIFTS_ERROR:
         QSPIFlash_Reset(qspiFlash);
         return IRC_FAILURE;
         break; // Unreachable
   }

   return IRC_NOT_DONE;
}

/**
 * Read ID from QSPI Flash
 *
 * @param qspiFlash is the pointer to the QSPI flash data structure.
 * @param buffer is a pointer to the byte buffer that will be filled using received data.
 *
 * @return IRC_NOT_DONE if the flash reading is not done.
 * @return IRC_SUCCESS if successfully read the flash.
 * @return IRC_FAILURE if failed to read the flash.
 */
IRC_Status_t QSPIFlash_ReadID(qspiFlash_t *qspiFlash, uint8_t *buffer)
{
   IRC_Status_t status;
   XStatus xstatus;

   if (qspiFlash->status == QSPIFS_IDLE)
   {
      QSPIFlash_Reset(qspiFlash);
      qspiFlash->status = QSPIFS_READ_ID;
      qspiFlash->address = 0;
      qspiFlash->p_data = buffer;
      qspiFlash->dataCount = FLASH_ID_SIZE;
   }
   else if (qspiFlash->status != QSPIFS_READ_ID)
   {
      QSPIFlash_Reset(qspiFlash);
      return IRC_FAILURE;
   }

   switch(qspiFlash->transferStatus)
   {
      case QSPIFTS_STATUS_REQUEST:
         qspiFlash->transferStatus = QSPIFTS_WAIT_FLASH_READY;
         status = QSPIFlash_StatusReq(qspiFlash);
         if (status != IRC_SUCCESS)
         {
            QSPIFlash_Reset(qspiFlash);
            return IRC_FAILURE;
         }
         break;

      case QSPIFTS_WAIT_FLASH_READY:
      case QSPIFTS_WAIT_TRANSFER_DONE:
         // Nothing to do
         break;

      case QSPIFTS_FLASH_READY:
         qspiFlash->dataLength = qspiFlash->dataCount - qspiFlash->dataOffset;
         qspiFlash->txDataBuffer[0] = COMMAND_READ_ID;
         qspiFlash->byteCount = qspiFlash->dataLength + READ_ID_BYTES;
         qspiFlash->transferStatus = QSPIFTS_WAIT_TRANSFER_DONE;

         xstatus = XSpi_Transfer(&qspiFlash->spiDevice, qspiFlash->txDataBuffer, qspiFlash->rxDataBuffer, qspiFlash->byteCount);
         if(xstatus != XST_SUCCESS)
         {
            QSPIFlash_Reset(qspiFlash);
            return IRC_FAILURE;
         }

         QSPI_DBG("Reading %d bytes...", qspiFlash->dataLength);
         break;

      case QSPIFTS_TRANSFER_DONE:
         memcpy(&qspiFlash->p_data[qspiFlash->dataOffset],
               &qspiFlash->rxDataBuffer[READ_ID_BYTES],
               qspiFlash->dataLength);
         qspiFlash->dataOffset += qspiFlash->dataLength;

         if (qspiFlash->dataOffset != qspiFlash->dataCount)
         {
            qspiFlash->transferStatus = QSPIFTS_WAIT_FLASH_READY;
            status = QSPIFlash_StatusReq(qspiFlash);
            if (status != IRC_SUCCESS)
            {
               QSPIFlash_Reset(qspiFlash);
               return IRC_FAILURE;
            }
         }
         else
         {
            qspiFlash->status = QSPIFS_IDLE;
            return IRC_SUCCESS;
         }
         break;

      case QSPIFTS_WAIT_FLASH_WRITE_ENABLED:
      case QSPIFTS_FLASH_WRITE_ENABLED:
      case QSPIFTS_ERROR:
         QSPIFlash_Reset(qspiFlash);
         return IRC_FAILURE;
         break; // Unreachable
   }

   return IRC_NOT_DONE;
}

/**
 * Decode Flash ID data
 *
 * @param buffer is a pointer to the byte buffer that contains the ID data
 * @return decoded identification
 */

qspiFlashID_t QSPIFlash_DecodeID(uint8_t *buffer)
{
   uint8_t manID = buffer[0];
   uint8_t devIdMSB = buffer[1];
   uint8_t devIdLSB = buffer[2];
   qspiFlashID_t rv;

   if (manID == FLASH_MANUFACTUER_ID_MICRON)
   {
      if (devIdMSB == FLASH_MICRON_MEMTYPE_3V)
      {
         if (devIdLSB == FLASH_MICRON_MEMSIZE_128M)
            rv = QSPIFID_MICRON_MT25QL128;
         else if (devIdLSB == FLASH_MICRON_MEMSIZE_256M)
            rv = QSPIFID_MICRON_MT25QL256;
         else
            rv = QSPIFID_MICRON_UNKNOWN_MEMSIZE;
      }
      else
         rv = QSPIFID_MICRON_UNKNOWN_MEMTYPE;
   }
   else if (manID == FLASH_MANUFACTUER_ID_CYPRESS)
   {
      if (devIdMSB == FLASH_CYPRESS_MEMTYPE_FL_S)
      {
         if (devIdLSB == FLASH_CYPRESS_MEMSIZE_256M)
            rv = QSPIFID_CYPRESS_S25FL256S;
         else
            rv = QSPIFID_CYPRESS_UNKNOWN_MEMSIZE;
      }
      else if (devIdMSB == FLASH_CYPRESS_MEMTYPE_FL_L)
      {
         if (devIdLSB == FLASH_CYPRESS_MEMSIZE_256M)
            rv = QSPIFID_CYPRESS_S25FL256L;
         else
            rv = QSPIFID_CYPRESS_UNKNOWN_MEMSIZE;
      }
      else
         rv = QSPIFID_CYPRESS_UNKNOWN_MEMTYPE;
   }
   else
      rv = QSPIFID_UNKNOWN_MANUFACTURER;

   return rv;
}

/**
 * Erase QSPI Flash at specified address.
 *
 * @param qspiFlash is the pointer to the QSPI flash data structure.
 * @param address is address where to erase the data.
 * @param dataCount is the number of bytes to erase.
 *
 * @return IRC_NOT_DONE if the flash erasing is not done.
 * @return IRC_SUCCESS if successfully erased the flash.
 * @return IRC_FAILURE if failed to erase the flash.
 */
IRC_Status_t QSPIFlash_SectorErase(qspiFlash_t *qspiFlash, uint32_t address, uint32_t dataCount)
{
   uint32_t tmpAddress;
   uint32_t nextSectorAddr;
   IRC_Status_t status;
   XStatus xstatus;

   if (qspiFlash->status == QSPIFS_IDLE)
   {
      QSPIFlash_Reset(qspiFlash);
      qspiFlash->status = QSPIFS_SECTOR_ERASE;
      qspiFlash->address = address;
      qspiFlash->dataCount = dataCount;
   }
   else if (qspiFlash->status != QSPIFS_SECTOR_ERASE)
   {
      QSPIFlash_Reset(qspiFlash);
      return IRC_FAILURE;
   }

   switch(qspiFlash->transferStatus)
   {
      case QSPIFTS_STATUS_REQUEST:
         qspiFlash->transferStatus = QSPIFTS_WAIT_FLASH_READY;
         status = QSPIFlash_StatusReq(qspiFlash);
         if (status != IRC_SUCCESS)
         {
            QSPIFlash_Reset(qspiFlash);
            return IRC_FAILURE;
         }
         break;

      case QSPIFTS_WAIT_FLASH_READY:
      case QSPIFTS_WAIT_FLASH_WRITE_ENABLED:
      case QSPIFTS_WAIT_TRANSFER_DONE:
         // Nothing to do
         break;

      case QSPIFTS_FLASH_READY:
         if (qspiFlash->writeEnabled == 0)
         {
            qspiFlash->transferStatus = QSPIFTS_WAIT_FLASH_WRITE_ENABLED;
            status = QSPIFlash_WriteEnable(qspiFlash);
            if (status != IRC_SUCCESS)
            {
               QSPIFlash_Reset(qspiFlash);
               return IRC_FAILURE;
            }
         }
         else
         {
            tmpAddress = qspiFlash->address + qspiFlash->dataOffset;
            nextSectorAddr = ((tmpAddress / SECTOR_SIZE) + 1 ) * SECTOR_SIZE;
            qspiFlash->dataLength = MIN(nextSectorAddr - tmpAddress, qspiFlash->dataCount - qspiFlash->dataOffset);

            qspiFlash->txDataBuffer[0] = COMMAND_SECTOR_ERASE;
            qspiFlash->txDataBuffer[1] = (uint8_t)((tmpAddress >> 16) & 0x000000FF);
            qspiFlash->txDataBuffer[2] = (uint8_t)((tmpAddress >> 8) & 0x000000FF);
            qspiFlash->txDataBuffer[3] = (uint8_t)(tmpAddress & 0x000000FF);

            qspiFlash->byteCount = SECTOR_ERASE_BYTES;

            qspiFlash->transferStatus = QSPIFTS_WAIT_TRANSFER_DONE;

            xstatus = XSpi_Transfer(&qspiFlash->spiDevice, qspiFlash->txDataBuffer, NULL, qspiFlash->byteCount);
            if(xstatus != XST_SUCCESS)
            {
               QSPIFlash_Reset(qspiFlash);
               return IRC_FAILURE;
            }

            QSPI_DBG("Erasing sector @ 0x%08X...", tmpAddress);
         }
         break;

      case QSPIFTS_FLASH_WRITE_ENABLED:
         qspiFlash->transferStatus = QSPIFTS_WAIT_FLASH_READY;
         status = QSPIFlash_StatusReq(qspiFlash);
         if (status != IRC_SUCCESS)
         {
            QSPIFlash_Reset(qspiFlash);
            return IRC_FAILURE;
         }
         break;

      case QSPIFTS_TRANSFER_DONE:
         qspiFlash->dataOffset += qspiFlash->dataLength;

         if (qspiFlash->dataOffset != qspiFlash->dataCount)
         {
            qspiFlash->writeEnabled = 0;
            qspiFlash->transferStatus = QSPIFTS_WAIT_FLASH_READY;
            status = QSPIFlash_StatusReq(qspiFlash);
            if (status != IRC_SUCCESS)
            {
               QSPIFlash_Reset(qspiFlash);
               return IRC_FAILURE;
            }
         }
         else
         {
            qspiFlash->status = QSPIFS_IDLE;
            return IRC_SUCCESS;
         }
         break;

      case QSPIFTS_ERROR:
         QSPIFlash_Reset(qspiFlash);
         return IRC_FAILURE;
         break; // Unreachable
   }

   return IRC_NOT_DONE;
}

/**
 * Write data to QSPI Flash at specified address.
 *
 * @param qspiFlash is the pointer to the QSPI flash data structure.
 * @param buffer is a pointer to the byte buffer that contains data to be transmitted.
 * @param address is address where to write the data.
 * @param dataCount is the number of bytes to write.
 *
 * @return IRC_NOT_DONE if the flash writing is not done.
 * @return IRC_SUCCESS if successfully written the flash.
 * @return IRC_FAILURE if failed to write the flash.
 */
IRC_Status_t QSPIFlash_Write(qspiFlash_t *qspiFlash, uint8_t *buffer, uint32_t address, uint32_t dataCount)
{
   uint32_t tmpAddress;
   uint32_t nextPageAddr;
   IRC_Status_t status;
   XStatus xstatus;

   if (qspiFlash->status == QSPIFS_IDLE)
   {
      QSPIFlash_Reset(qspiFlash);
      qspiFlash->status = QSPIFS_WRITE;
      qspiFlash->address = address;
      qspiFlash->p_data = buffer;
      qspiFlash->dataCount = dataCount;
   }
   else if (qspiFlash->status != QSPIFS_WRITE)
   {
      QSPIFlash_Reset(qspiFlash);
      return IRC_FAILURE;
   }

   switch(qspiFlash->transferStatus)
   {
      case QSPIFTS_STATUS_REQUEST:
         qspiFlash->transferStatus = QSPIFTS_WAIT_FLASH_READY;
         status = QSPIFlash_StatusReq(qspiFlash);
         if (status != IRC_SUCCESS)
         {
            QSPIFlash_Reset(qspiFlash);
            return IRC_FAILURE;
         }
         break;

      case QSPIFTS_WAIT_FLASH_READY:
      case QSPIFTS_WAIT_FLASH_WRITE_ENABLED:
      case QSPIFTS_WAIT_TRANSFER_DONE:
         // Nothing to do
         break;

      case QSPIFTS_FLASH_READY:
         if (qspiFlash->writeEnabled == 0)
         {
            qspiFlash->transferStatus = QSPIFTS_WAIT_FLASH_WRITE_ENABLED;
            status = QSPIFlash_WriteEnable(qspiFlash);
            if (status != IRC_SUCCESS)
            {
               QSPIFlash_Reset(qspiFlash);
               return IRC_FAILURE;
            }
         }
         else
         {
            tmpAddress = qspiFlash->address + qspiFlash->dataOffset;
            nextPageAddr = ((tmpAddress / PAGE_SIZE) + 1 ) * PAGE_SIZE;
            qspiFlash->dataLength = MIN(nextPageAddr - tmpAddress, qspiFlash->dataCount - qspiFlash->dataOffset);

            qspiFlash->txDataBuffer[0] = COMMAND_QUAD_WRITE;
            qspiFlash->txDataBuffer[1] = (uint8_t)((tmpAddress >> 16) & 0x000000FF);
            qspiFlash->txDataBuffer[2] = (uint8_t)((tmpAddress >> 8) & 0x000000FF);
            qspiFlash->txDataBuffer[3] = (uint8_t)(tmpAddress & 0x000000FF);
            memcpy(&qspiFlash->txDataBuffer[READ_WRITE_EXTRA_BYTES],
                  &qspiFlash->p_data[qspiFlash->dataOffset],
                  qspiFlash->dataLength);

            qspiFlash->byteCount = qspiFlash->dataLength + READ_WRITE_EXTRA_BYTES;

            qspiFlash->transferStatus = QSPIFTS_WAIT_TRANSFER_DONE;

            xstatus = XSpi_Transfer(&qspiFlash->spiDevice, qspiFlash->txDataBuffer, NULL, qspiFlash->byteCount);
            if(xstatus != XST_SUCCESS)
            {
               QSPIFlash_Reset(qspiFlash);
               return IRC_FAILURE;
            }

            QSPI_DBG("Writing %d bytes @ 0x%08X...", qspiFlash->dataLength, tmpAddress);
         }
         break;

      case QSPIFTS_FLASH_WRITE_ENABLED:
         qspiFlash->transferStatus = QSPIFTS_WAIT_FLASH_READY;
         status = QSPIFlash_StatusReq(qspiFlash);
         if (status != IRC_SUCCESS)
         {
            QSPIFlash_Reset(qspiFlash);
            return IRC_FAILURE;
         }
         break;

      case QSPIFTS_TRANSFER_DONE:
         qspiFlash->dataOffset += qspiFlash->dataLength;

         if (qspiFlash->dataOffset != qspiFlash->dataCount)
         {
            qspiFlash->writeEnabled = 0;
            qspiFlash->transferStatus = QSPIFTS_WAIT_FLASH_READY;
            status = QSPIFlash_StatusReq(qspiFlash);
            if (status != IRC_SUCCESS)
            {
               QSPIFlash_Reset(qspiFlash);
               return IRC_FAILURE;
            }
         }
         else
         {
            qspiFlash->status = QSPIFS_IDLE;
            return IRC_SUCCESS;
         }
         break;

      case QSPIFTS_ERROR:
         QSPIFlash_Reset(qspiFlash);
         return IRC_FAILURE;
         break; // Unreachable
   }

   return IRC_NOT_DONE;
}

/**
 * QSPI Flash unit test.
 *
 * @param qspiFlash is the pointer to the QSPI flash data structure.
 *
 * @return IRC_SUCCESS if the QSPI flash unit test succeeded.
 * @return IRC_FAILURE if the QSPI flash unit test failed.
 */
#define FLASH_TEST_BASEADDR         0x00FEFF10
#define FLASH_TEST_DATA_SIZE        512
#define FLASH_TEST_DUMP_LINE_SIZE   16
IRC_Status_t QSPIFlash_UnitTest(qspiFlash_t *qspiFlash)
{
   IRC_Status_t status;
   uint8_t flashData[FLASH_TEST_DATA_SIZE];
   uint32_t i;

   do {
      status = QSPIFlash_SectorErase(qspiFlash, FLASH_TEST_BASEADDR, FLASH_TEST_DATA_SIZE);
   } while (status == IRC_NOT_DONE);
   if (status == IRC_SUCCESS)
   {
      PRINTF("QSPI flash erased\n");
   }
   else
   {
      PRINTF("Failed to erase QSPI flash\n");
      return IRC_FAILURE;
   }

   do {
      status = QSPIFlash_Read(qspiFlash, FLASH_TEST_BASEADDR, flashData, FLASH_TEST_DATA_SIZE);
   } while (status == IRC_NOT_DONE);
   if (status != IRC_SUCCESS)
   {
      PRINTF("Failed to read QSPI flash\n");
      return IRC_FAILURE;
   }
   memdump(flashData, FLASH_TEST_DATA_SIZE, FLASH_TEST_BASEADDR, FLASH_TEST_DUMP_LINE_SIZE);

   for (i = 0; i < FLASH_TEST_DATA_SIZE; i += 4)
   {
      flashData[i] = 0xDE;
      flashData[i + 1] = 0xAD;
      flashData[i + 2] = 0xBE;
      flashData[i + 3] = 0xEF;
   }

   do {
      status = QSPIFlash_Write(qspiFlash, flashData, FLASH_TEST_BASEADDR, FLASH_TEST_DATA_SIZE);
   } while (status == IRC_NOT_DONE);
   if (status == IRC_SUCCESS)
   {
      PRINTF("QSPI flash written\n");
   }
   else
   {
      PRINTF("Failed to write QSPI flash\n");
      return IRC_FAILURE;
   }

   do {
      status = QSPIFlash_Read(qspiFlash, FLASH_TEST_BASEADDR, flashData, FLASH_TEST_DATA_SIZE);
   } while (status == IRC_NOT_DONE);
   if (status != IRC_SUCCESS)
   {
      PRINTF("Failed to read QSPI flash\n");
      return IRC_FAILURE;
   }
   memdump(flashData, FLASH_TEST_DATA_SIZE, FLASH_TEST_BASEADDR, FLASH_TEST_DUMP_LINE_SIZE);

   for (i = 0; i < FLASH_TEST_DATA_SIZE; i += 4)
   {
      if ( (flashData[i] != 0xDE) ||
            (flashData[i + 1] != 0xAD) ||
            (flashData[i + 2] != 0xBE) ||
            (flashData[i + 3] != 0xEF) )
      {
         PRINTF("Wrong byte value near byte #%d\n", i);
      }
   }

   return IRC_SUCCESS;
}

/**
 * QSPI Flash interrupt handler function.
 *
 * @param CallBackRef is a pointer to the QSPI flash data structure.
 * @param Event is used to identify the cause of the interrupt.
 * @param EventData is the number of received or sent bytes.
 */
void QSPIFlash_Handler(void *CallBackRef, u32 StatusEvent, unsigned int ByteCount)
{
   qspiFlash_t *qspiFlash = (qspiFlash_t *)CallBackRef;

   if ((StatusEvent == XST_SPI_TRANSFER_DONE) && (ByteCount == qspiFlash->byteCount))
   {
      switch(qspiFlash->transferStatus)
      {
         case QSPIFTS_WAIT_FLASH_READY:
            if ((qspiFlash->rxDataBuffer[1] & FLASH_SR_IS_READY_MASK) == 0)
            {
               qspiFlash->transferStatus = QSPIFTS_FLASH_READY;
            }
            else
            {
               qspiFlash->transferStatus = QSPIFTS_STATUS_REQUEST;
            }
            break;

         case QSPIFTS_WAIT_FLASH_WRITE_ENABLED:
            qspiFlash->writeEnabled = 1;
            qspiFlash->transferStatus = QSPIFTS_FLASH_WRITE_ENABLED;
            break;

         case QSPIFTS_WAIT_TRANSFER_DONE:
            qspiFlash->transferStatus = QSPIFTS_TRANSFER_DONE;
            break;

         case QSPIFTS_STATUS_REQUEST:
         case QSPIFTS_FLASH_READY:
         case QSPIFTS_FLASH_WRITE_ENABLED:
         case QSPIFTS_TRANSFER_DONE:
         case QSPIFTS_ERROR:
            // Not supposed to get there
            qspiFlash->transferStatus = QSPIFTS_ERROR;
            break;
      }
   }
   else
   {
      qspiFlash->transferStatus = QSPIFTS_ERROR;
   }
}
