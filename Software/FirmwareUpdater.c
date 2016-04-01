/**
 * @file FirmwareUpdater.c
 * Firmware updater module definition.
 *
 * This file defines firmware updater module.
 * 
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "FirmwareUpdater.h"
#include "CRC.h"
#include <string.h>


/**
 * Firmware updater network port.
 */
netIntfPort_t fuPort;

/**
 * Firmware updater QSPI flash pointer.
 */
qspiFlash_t *p_qspiFlash;

/**
 * Firmware updater QSPI flash write protection.
 */
uint8_t gFuPromIsWriteProtected = 0;

/**
 * Initializes the firmware updater.
 *
 * @param netIntf is the pointer to the network interface data structure.
 * @param cmdQueue is the pointer to the firmware updater command queue.
 *
 * @return IRC_SUCCESS if successfully initialized
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t Firmware_Updater_Init(netIntf_t *netIntf, circBuffer_t *cmdQueue, qspiFlash_t *qspiFlash)
{
   fuPort.port = NIP_FIRM_UPDATER;
   fuPort.cmdQueue = cmdQueue;
   p_qspiFlash = qspiFlash;

   // Connect file manager to network interface
   if (NetIntf_Connect(netIntf, &fuPort) != IRC_SUCCESS)
   {
      FU_ERR("Failed to connect to network interface.");
      return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}

/**
 * Firmware updater state machine.
 */
void Firmware_Updater_SM()
{
   static fuState_t fuCurrentState = FUS_INIT;
   static networkCommand_t fuRequest;
   static uint8_t tmpFlashDataBuffer[MAX(F1F2_MAX_PROM_DATA_SIZE, PAGE_SIZE)];
   static uint32_t dataOffset;
   static uint32_t dataLength;
   static uint16_t promCRC16;
   networkCommand_t fuResponse;
   uint32_t nextPageAddr;
   IRC_Status_t status;

   F1F2_CommandClear(&fuResponse.f1f2);

   switch (fuCurrentState)
   {
      case FUS_INIT:
         F1F2_CommandClear(&fuRequest.f1f2);

         fuCurrentState = FUS_WAITING_FOR_REQUEST;
         break;

      case FUS_WAITING_FOR_REQUEST:
         // Check for new request
         if (CB_Pop(fuPort.cmdQueue, &fuRequest) == IRC_SUCCESS)
         {
            if (fuRequest.f1f2.destAddr != NIA_BROADCAST)
            {
               FU_DBG("Request has been received (cmd: %d).", fuRequest.f1f2.cmd);

               // Process request
               switch (fuRequest.f1f2.cmd)
               {
                  case F1F2_CMD_PROM_ERASE:
                     if (gFuPromIsWriteProtected == 0)
                     {
                        if ((fuRequest.f1f2.payload.promErase.offset + fuRequest.f1f2.payload.promErase.dataLength) <= QSPIFLASH_SIZE)
                        {
                           status = QSPIFlash_SectorErase(p_qspiFlash,
                                 fuRequest.f1f2.payload.promErase.offset,
                                 fuRequest.f1f2.payload.promErase.dataLength);
                           if (status == IRC_FAILURE)
                           {
                              FU_ERR("Failed to erase %d bytes in PROM @ 0x%08X.",
                                    fuRequest.f1f2.payload.promErase.dataLength, fuRequest.f1f2.payload.promErase.offset);
                              F1F2_BuildNAKResponse(&fuRequest.f1f2, &fuResponse.f1f2);
                           }
                           else
                           {
                              fuCurrentState = FUS_ERASING_FLASH;
                           }
                        }
                        else
                        {
                           FU_ERR("Cannot erase data outside PROM boundaries (%d bytes @ 0x%08X).",
                                 fuRequest.f1f2.payload.promErase.dataLength, fuRequest.f1f2.payload.promErase.offset);
                           F1F2_BuildNAKResponse(&fuRequest.f1f2, &fuResponse.f1f2);
                        }
                     }
                     else
                     {
                        FU_ERR("PROM is write protected.");
                        F1F2_BuildNAKResponse(&fuRequest.f1f2, &fuResponse.f1f2);
                     }
                     break;

                  case F1F2_CMD_PROM_READ_REQ:
                     if (fuRequest.f1f2.payload.promRW.dataLength <= F1F2_MAX_PROM_DATA_SIZE)
                     {
                        if ((fuRequest.f1f2.payload.promRW.offset + fuRequest.f1f2.payload.promRW.dataLength) <= QSPIFLASH_SIZE)
                        {
                           status = QSPIFlash_Read(p_qspiFlash,
                                 fuRequest.f1f2.payload.promRW.offset,
                                 tmpFlashDataBuffer,
                                 fuRequest.f1f2.payload.promRW.dataLength);
                           if (status == IRC_FAILURE)
                           {
                              FU_ERR("Failed to erase %d bytes in PROM @ 0x%08X.",
                                    fuRequest.f1f2.payload.promRW.dataLength, fuRequest.f1f2.payload.promRW.offset);
                              F1F2_BuildNAKResponse(&fuRequest.f1f2, &fuResponse.f1f2);
                           }
                           else
                           {
                              fuCurrentState = FUS_READING_FLASH;
                           }
                        }
                        else
                        {
                           FU_ERR("Cannot read data outside PROM boundaries (%d bytes @ 0x%08X).",
                                 fuRequest.f1f2.payload.promRW.dataLength, fuRequest.f1f2.payload.promRW.offset);
                           F1F2_BuildNAKResponse(&fuRequest.f1f2, &fuResponse.f1f2);
                        }
                     }
                     else
                     {
                        FU_ERR("Cannot read more than %d bytes at a time.", fuRequest.f1f2.payload.promRW.dataLength);
                        F1F2_BuildNAKResponse(&fuRequest.f1f2, &fuResponse.f1f2);
                     }
                     break;

                  case F1F2_CMD_PROM_WRITE:
                     if (gFuPromIsWriteProtected == 0)
                     {
                        if (fuRequest.f1f2.payload.promRW.dataLength <= F1F2_MAX_PROM_DATA_SIZE)
                        {
                           if ((fuRequest.f1f2.payload.promRW.offset + fuRequest.f1f2.payload.promRW.dataLength) <= QSPIFLASH_SIZE)
                           {
                              status = QSPIFlash_Write(p_qspiFlash,
                                    fuRequest.f1f2.payload.promRW.data,
                                    fuRequest.f1f2.payload.promRW.offset,
                                    fuRequest.f1f2.payload.promRW.dataLength);
                              if (status == IRC_FAILURE)
                              {
                                 FU_ERR("Failed to write %d bytes in PROM @ 0x%08X.",
                                       fuRequest.f1f2.payload.promRW.dataLength, fuRequest.f1f2.payload.promRW.offset);
                                 F1F2_BuildNAKResponse(&fuRequest.f1f2, &fuResponse.f1f2);
                              }
                              else
                              {
                                 fuCurrentState = FUS_WRITING_FLASH;
                              }
                           }
                           else
                           {
                              FU_ERR("Cannot write data outside PROM boundaries (%d bytes @ 0x%08X).",
                                    fuRequest.f1f2.payload.promRW.dataLength, fuRequest.f1f2.payload.promRW.offset);
                              F1F2_BuildNAKResponse(&fuRequest.f1f2, &fuResponse.f1f2);
                           }
                        }
                        else
                        {
                           FU_ERR("Cannot write more than %d bytes at a time.", fuRequest.f1f2.payload.promRW.dataLength);
                           F1F2_BuildNAKResponse(&fuRequest.f1f2, &fuResponse.f1f2);
                        }
                     }
                     else
                     {
                        FU_ERR("PROM is write protected.");
                        F1F2_BuildNAKResponse(&fuRequest.f1f2, &fuResponse.f1f2);
                     }
                     break;

                  case F1F2_CMD_PROM_CHECK_REQ:
                     if ((fuRequest.f1f2.payload.promCheck.offset + fuRequest.f1f2.payload.promCheck.dataLength) <= QSPIFLASH_SIZE)
                     {
                        promCRC16 = 0xFFFF;
                        dataOffset = 0;
                        nextPageAddr = ((fuRequest.f1f2.payload.promCheck.offset / PAGE_SIZE) + 1 ) * PAGE_SIZE;
                        dataLength = MIN(nextPageAddr - fuRequest.f1f2.payload.promCheck.offset, fuRequest.f1f2.payload.promCheck.dataLength);

                        status = QSPIFlash_Read(p_qspiFlash,
                              fuRequest.f1f2.payload.promCheck.offset,
                              tmpFlashDataBuffer,
                              dataLength);
                        if (status == IRC_FAILURE)
                        {
                           FU_ERR("Failed to check %d bytes in PROM @ 0x%08X.",
                                 fuRequest.f1f2.payload.promCheck.dataLength, fuRequest.f1f2.payload.promCheck.offset);
                           F1F2_BuildNAKResponse(&fuRequest.f1f2, &fuResponse.f1f2);
                        }
                        else
                        {
                           fuCurrentState = FUS_CHECKING_FLASH;
                        }
                     }
                     else
                     {
                        FU_ERR("Cannot check data outside PROM boundaries (%d bytes @ 0x%08X).",
                              fuRequest.f1f2.payload.promCheck.dataLength, fuRequest.f1f2.payload.promCheck.offset);
                        F1F2_BuildNAKResponse(&fuRequest.f1f2, &fuResponse.f1f2);
                     }
                     break;

                  default:
                     FU_ERR("Invalid firmware updater request command code.");
                     F1F2_BuildNAKResponse(&fuRequest.f1f2, &fuResponse.f1f2);
                     break;
               }
            }
            else
            {
               FU_ERR("Broadcasted commands are not supported.");
            }
         }
         break;

      case FUS_ERASING_FLASH:
         status = QSPIFlash_SectorErase(p_qspiFlash,
               fuRequest.f1f2.payload.promErase.offset,
               fuRequest.f1f2.payload.promErase.dataLength);
         if (status == IRC_SUCCESS)
         {
            FU_DBG("%d bytes have been erased in QPSI flash @ 0x%08X.",
                  fuRequest.f1f2.payload.promErase.dataLength, fuRequest.f1f2.payload.promErase.offset);
            F1F2_BuildACKResponse(&fuRequest.f1f2, &fuResponse.f1f2);
            fuCurrentState = FUS_WAITING_FOR_REQUEST;
         }
         else if (status == IRC_FAILURE)
         {
            FU_ERR("Failed to erase %d bytes in QPSI flash @ 0x%08X.",
                  fuRequest.f1f2.payload.promErase.dataLength, fuRequest.f1f2.payload.promErase.offset);
            F1F2_BuildNAKResponse(&fuRequest.f1f2, &fuResponse.f1f2);
            fuCurrentState = FUS_WAITING_FOR_REQUEST;
         }
         break;

      case FUS_READING_FLASH:
         status = QSPIFlash_Read(p_qspiFlash,
               fuRequest.f1f2.payload.promRW.offset,
               tmpFlashDataBuffer,
               fuRequest.f1f2.payload.promRW.dataLength);
         if (status == IRC_SUCCESS)
         {
            FU_DBG("%d bytes have been read in QPSI flash @ 0x%08X.",
                  fuRequest.f1f2.payload.promRW.dataLength, fuRequest.f1f2.payload.promRW.offset);
            F1F2_BuildResponse(&fuRequest.f1f2, &fuResponse.f1f2);
            fuResponse.f1f2.cmd = F1F2_CMD_PROM_READ_RSP;
            fuResponse.f1f2.payload.promRW.device = fuRequest.f1f2.payload.promRW.device;
            fuResponse.f1f2.payload.promRW.offset = fuRequest.f1f2.payload.promRW.offset;
            fuResponse.f1f2.payload.promRW.dataLength = fuRequest.f1f2.payload.promRW.dataLength;
            memcpy(fuResponse.f1f2.payload.promRW.data, tmpFlashDataBuffer, fuRequest.f1f2.payload.promRW.dataLength);
            fuCurrentState = FUS_WAITING_FOR_REQUEST;
         }
         else if (status == IRC_FAILURE)
         {
            FU_ERR("Failed to write %d bytes in QPSI flash @ 0x%08X.",
                  fuRequest.f1f2.payload.promRW.dataLength, fuRequest.f1f2.payload.promRW.offset);
            F1F2_BuildNAKResponse(&fuRequest.f1f2, &fuResponse.f1f2);
            fuCurrentState = FUS_WAITING_FOR_REQUEST;
         }
         break;

      case FUS_WRITING_FLASH:
         status = QSPIFlash_Write(p_qspiFlash,
               fuRequest.f1f2.payload.promRW.data,
               fuRequest.f1f2.payload.promRW.offset,
               fuRequest.f1f2.payload.promRW.dataLength);
         if (status == IRC_SUCCESS)
         {
            FU_DBG("%d bytes have been written in QPSI flash @ 0x%08X.",
                  fuRequest.f1f2.payload.promRW.dataLength, fuRequest.f1f2.payload.promRW.offset);
            F1F2_BuildACKResponse(&fuRequest.f1f2, &fuResponse.f1f2);
            fuCurrentState = FUS_WAITING_FOR_REQUEST;
         }
         else if (status == IRC_FAILURE)
         {
            FU_ERR("Failed to write %d bytes in QPSI flash @ 0x%08X.",
                  fuRequest.f1f2.payload.promRW.dataLength, fuRequest.f1f2.payload.promRW.offset);
            F1F2_BuildNAKResponse(&fuRequest.f1f2, &fuResponse.f1f2);
            fuCurrentState = FUS_WAITING_FOR_REQUEST;
         }
         break;

      case FUS_CHECKING_FLASH:
         status = QSPIFlash_Read(p_qspiFlash,
               fuRequest.f1f2.payload.promCheck.offset + dataOffset,
               tmpFlashDataBuffer,
               dataLength);
         if (status == IRC_SUCCESS)
         {
            promCRC16 = CRC16(promCRC16, tmpFlashDataBuffer, dataLength);
            dataOffset += dataLength;

            if (dataOffset == fuRequest.f1f2.payload.promCheck.dataLength)
            {
               FU_DBG("%d bytes have been checked in QPSI flash @ 0x%08X (CRC16: 0x%04X).",
                     fuRequest.f1f2.payload.promCheck.dataLength, fuRequest.f1f2.payload.promCheck.offset, promCRC16);
               F1F2_BuildResponse(&fuRequest.f1f2, &fuResponse.f1f2);
               fuResponse.f1f2.cmd = F1F2_CMD_PROM_CHECK_RSP;
               fuResponse.f1f2.payload.promCheck.device = fuRequest.f1f2.payload.promCheck.device;
               fuResponse.f1f2.payload.promCheck.offset = fuRequest.f1f2.payload.promCheck.offset;
               fuResponse.f1f2.payload.promCheck.dataLength = fuRequest.f1f2.payload.promCheck.dataLength;
               fuResponse.f1f2.payload.promCheck.crc16 = promCRC16;
               fuCurrentState = FUS_WAITING_FOR_REQUEST;
            }
            else
            {
               nextPageAddr = (((fuRequest.f1f2.payload.promCheck.offset + dataOffset) / PAGE_SIZE) + 1 ) * PAGE_SIZE;
               dataLength = MIN(nextPageAddr - (fuRequest.f1f2.payload.promCheck.offset + dataOffset), fuRequest.f1f2.payload.promCheck.dataLength - dataOffset);

               status = QSPIFlash_Read(p_qspiFlash,
                     fuRequest.f1f2.payload.promCheck.offset + dataOffset,
                     tmpFlashDataBuffer,
                     dataLength);
               if (status == IRC_FAILURE)
               {
                  FU_ERR("Failed to check %d bytes in PROM @ 0x%08X.",
                        fuRequest.f1f2.payload.promCheck.dataLength, fuRequest.f1f2.payload.promCheck.offset);
                  F1F2_BuildNAKResponse(&fuRequest.f1f2, &fuResponse.f1f2);
                  fuCurrentState = FUS_WAITING_FOR_REQUEST;
               }
            }
         }
         else if (status == IRC_FAILURE)
         {
            FU_ERR("Failed to check %d bytes in QPSI flash @ 0x%08X.",
                  fuRequest.f1f2.payload.promCheck.dataLength, fuRequest.f1f2.payload.promCheck.offset);
            F1F2_BuildNAKResponse(&fuRequest.f1f2, &fuResponse.f1f2);
            fuCurrentState = FUS_WAITING_FOR_REQUEST;
         }
        break;
   }

   if (fuResponse.f1f2.cmd != F1F2_CMD_NONE)
   {
      // Transmit response to master device
      fuResponse.port = &fuPort;
      if (NetIntf_EnqueueCmd(fuPort.netIntf, &fuResponse) == IRC_SUCCESS)
      {
         FU_DBG("Response is transmitted to master device.");
      }
      else
      {
         FU_ERR("Failed to push command in network interface command queue.");
      }
   }
}
