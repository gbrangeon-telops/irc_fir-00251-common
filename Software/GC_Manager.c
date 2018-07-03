/**
 * @file GC_Manager.c
 * GenICam command manager module implementation.
 *
 * This file implements the GenICam command manager module.
 *
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "GC_Manager.h"
#include "GC_Registers.h"
#include "BuiltInTests.h"
#include <stdio.h> // For NULL
#include <string.h> // For memcpy

#ifdef SIM
   #include <systemc.h> // For sc_time_stamp().value()
   //#include <stdarg.h> // To support ... argument in sim_printf
   //#include <iostream.h>
   //#include <iomanip>
   #include "mb_transactor.h"
   extern sc_port<mb_transactor_task_if> *global_trans_ptr;
#endif

/**
 * GenICam manager network port.
 */
netIntfPort_t gcmPort;


/** Private functions */
static gcSelectedReg_t* findSelectedRegister(uint32_t registerIdx);

/**
 * Initializes the GenICam Manager.
 *
 * @param netIntf is the pointer to the network interface data structure.
 * @param cmdQueue is the pointer to the GenICam manager command queue.
 *
 * @return IRC_SUCCESS if successfully initialized
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t GC_Manager_Init(netIntf_t *netIntf, circBuffer_t *cmdQueue)
{
   gcmPort.port = NIP_GC_MANAGER;
   gcmPort.cmdQueue = cmdQueue;

   // Connect GenICam manager to network interface
   if (NetIntf_Connect(netIntf, &gcmPort) != IRC_SUCCESS)
   {
      GCM_ERR("Failed to connect to network interface.");
      return IRC_FAILURE;
   }

   return IRC_SUCCESS;
}

/**
 * GenICam manager state machine.
 *
 * @return IRC_NOT_DONE if GenICam manager handshake with its slave is not done.
 * @return IRC_DONE if GenICam manager handshake with its slave is done or there is no slave.
 * @return IRC_FAILURE if GenICam manager handshake with its slave failed.

\dot
digraph G {
GCMS_INIT -> GCMS_WAITING_SLAVE_HANDSHAKE -> GCMS_SEND_SLAVE_INIT_REQ -> GCMS_WAITING_SLAVE_INIT_RESP -> GCMS_WAITING_REQUEST_FROM_MASTER
GCMS_WAITING_SLAVE_HANDSHAKE -> GCMS_WAITING_SLAVE_HANDSHAKE
GCMS_WAITING_SLAVE_INIT_RESP -> GCMS_SEND_SLAVE_INIT_REQ
GCMS_INIT -> GCMS_WAITING_REQUEST_FROM_MASTER
GCMS_WAITING_REQUEST_FROM_MASTER -> GCMS_WAITING_RESPONSE_FROM_SLAVE -> GCMS_WAITING_REQUEST_FROM_MASTER
}
\enddot

 */
void GC_Manager_SM()
{
   static gcmState_t gcCurrentState = GCMS_INIT;
   static uint32_t regInitIdx = 0;
   static uint32_t regInitSelectorIdx = 0;
   static uint32_t regInitSelectorBackup = 0;
   static gcSelectedReg_t* pSelectedReg = NULL;
   static uint64_t tic_sharedRegInit;
   
   networkCommand_t gcmRequest;
   networkCommand_t gcmResponse;

   // Check for new request
   if (CB_Pop(gcmPort.cmdQueue, &gcmRequest) == IRC_SUCCESS)
   {
      F1F2_CommandClear(&gcmResponse.f1f2);

      GCM_DBG("Request has been received (cmd: 0x%02X, addr: 0x%08X).", gcmRequest.f1f2.cmd, gcmRequest.f1f2.payload.regRW.address);

      // Process request
      switch (gcmRequest.f1f2.cmd)
      {
         case F1F2_CMD_REG_READ_REQ:
            GC_RegisterReadRequest(&gcmRequest.f1f2, &gcmResponse.f1f2);
            break;

         case F1F2_CMD_REG_WRITE:
            GC_RegisterWriteRequest(&gcmRequest.f1f2, &gcmResponse.f1f2);
            break;

         case F1F2_CMD_PING:
            F1F2_BuildACKResponse(&gcmRequest.f1f2, &gcmResponse.f1f2);
            break;

         default:
            GCM_ERR("Invalid GC manager request command code.");
            F1F2_BuildNAKResponse(&gcmRequest.f1f2, &gcmResponse.f1f2);
            break;
      }

      if ((gcmRequest.f1f2.destAddr != NIA_BROADCAST) && (gcmResponse.f1f2.cmd != F1F2_CMD_NONE))
      {
         // Transmit response to master device
         gcmResponse.port = &gcmPort;
         if (NetIntf_EnqueueCmd(gcmPort.netIntf, &gcmResponse) != IRC_SUCCESS)
         {
            GCM_ERR("Failed to push command in network interface command queue.");
         }
      }
   }

   switch (gcCurrentState)
   {
      case GCMS_INIT:
         tic_sharedRegInit = 0;
         gcCurrentState = GCMS_WAITING_FOR_NETWORK_INTF;
         break;

      case GCMS_WAITING_FOR_NETWORK_INTF:
         if (gcmPort.netIntf->currentState == NIS_READY)
         {
            gcCurrentState = GCMS_SHARED_REG_INIT;
         }
         break;

      case GCMS_SHARED_REG_INIT:
         if (elapsed_time_us(tic_sharedRegInit) > GC_SHARED_REG_INIT_PERIOD_US)
         {
            // Looking for the next register to initialize
            while ((regInitIdx < GC_REG_COUNT) &&
                  !((gcRegsDef[regInitIdx].owner == (gcRegistersOwner_t) gcmPort.netIntf->address)
                        && RegIsShared(&gcRegsDef[regInitIdx])))
            {
               regInitIdx++;
            }

            if (regInitIdx < GC_REG_COUNT)
            {
               // Find if this register is a selected register
               pSelectedReg = findSelectedRegister(regInitIdx);

               // Normal registers
               if (pSelectedReg == NULL)
               {
                  GC_BroadcastRegisterWrite(&gcRegsDef[regInitIdx]);
                  regInitIdx++;
               }
               // Selected registers
               else
               {
                  // Backup current selector value
                  if (regInitSelectorIdx == 0)
                     regInitSelectorBackup = *((uint32_t *)gcRegsDef[pSelectedReg->selectorRegIdx].p_data);

                  // Broadcast value corresponding to this selector
                  GC_RegisterWrite32(pSelectedReg->selectorRegIdx, regInitSelectorIdx);
                  GC_BroadcastRegisterWrite(&gcRegsDef[regInitIdx]);
                  regInitSelectorIdx++;

                  // All selector values have been shared
                  if (regInitSelectorIdx >= pSelectedReg->selectorRegNbVal)
                  {
                     // Restore selector value
                     GC_RegisterWrite32(pSelectedReg->selectorRegIdx, regInitSelectorBackup);

                     regInitIdx++;     // Go to next register
                     regInitSelectorIdx = 0;    // Reset for next selectable
                  }
               }

               GETTIME(&tic_sharedRegInit);
            }
            else
            {
               // No more register to initialize
               GCM_INF("Shared registers initialization done.");
               builtInTests[BITID_NetworkHostsSynchronization].result = BITR_Passed;
               gcCurrentState = GCMS_SHARED_REG_INIT_DONE;
            }
         }
         break;

      case GCMS_SHARED_REG_INIT_DONE:
         // Nothing to do
         break;
   }
}

/**
 * Process a register read request.
 *
 * @param p_request is the pointer to the request command.
 * @param p_response is the pointer to the response command to fill.
 *
 * @return IRC_SUCCESS if the register read is successful.
 * @return IRC_FAILURE if the register read failed.
 */
IRC_Status_t GC_RegisterReadRequest(F1F2Command_t *p_request, F1F2Command_t *p_response)
{
   gcRegister_t *p_register = GC_DecodeAddr(p_request->payload.regRW.address);

   if (p_register == NULL)
   {
      GCM_ERR("Read: No register found @ 0x%08X.", p_request->payload.regRW.address);
      F1F2_BuildNAKResponse(p_request, p_response);

      return IRC_FAILURE;
   }

   if ((p_request->srcPort != NIP_GC_MANAGER) && (p_request->srcPort != NIP_GC_POLLER))
   {
      if (p_register->owner != (gcRegistersOwner_t) gcmPort.netIntf->address)
      {
         GCM_ERR("Read: Device is not the owner of register @ 0x%08X.", p_register->address);
         F1F2_BuildNAKResponse(p_request, p_response);

         return IRC_FAILURE;
      }
   }

   if (RegIsWO(p_register))
   {
      GCM_ERR("Read: Register @ 0x%08X is write only.", p_register->address);
      F1F2_BuildNAKResponse(p_request, p_response);

      return IRC_FAILURE;
   }

   if (p_register->p_data == NULL)
   {
      GCM_ERR("Read: Register @ 0x%08X has no associated data.", p_register->address);
      F1F2_BuildNAKResponse(p_request, p_response);

      return IRC_FAILURE;
   }

   // Read register
   if (p_register->callback != NULL)
   {
      (*p_register->callback)(GCCP_BEFORE, GCCA_READ);
   }

   F1F2_BuildResponse(p_request, p_response);
   p_response->cmd = F1F2_CMD_REG_READ_RSP;
   p_response->payload.regRW.address = p_register->address;
   memcpy_swap(p_response->payload.regRW.data, p_register->p_data, p_register->dataLength, p_register->dataLength, RegIsBigEndian(p_register));
   p_response->payload.regRW.dataLength = p_register->dataLength;
   p_response->payload.regRW.padLength = p_register->length - p_register->dataLength;

   if (p_register->callback != NULL)
   {
      (*p_register->callback)(GCCP_AFTER, GCCA_READ);
   }

   return IRC_SUCCESS;
}

/**
 * Process a register write request.
 *
 * @param p_request is the pointer to the request command.
 * @param p_response is the pointer to the response command to fill.
 *
 * @return IRC_SUCCESS if the register write is successful.
 * @return IRC_FAILURE if the register write failed.
 */
IRC_Status_t GC_RegisterWriteRequest(F1F2Command_t *p_request, F1F2Command_t *p_response)
{
   gcRegister_t *p_register = GC_DecodeAddr(p_request->payload.regRW.address);
   uint8_t tmpRegDataBuffer[GC_REG_MAX_WRITE_LENGTH];

   if (p_register == NULL)
   {
      GCM_ERR("Write: No register found @ 0x%08X.", p_request->payload.regRW.address);
      F1F2_BuildNAKResponse(p_request, p_response);

      return IRC_FAILURE;
   }

   if (p_request->payload.regRW.padLength != 0)
   {
      GCM_ERR("Write: Pad length of register @ 0x%08X is not null.", p_register->address);
      F1F2_BuildNAKResponse(p_request, p_response);

      return IRC_FAILURE;
   }

   if ((p_request->srcPort != NIP_GC_MANAGER) && (p_request->srcPort != NIP_GC_POLLER))
   {
      if (RegIsRO(p_register))
      {
         GCM_ERR("Write: Register @ 0x%08X is read only.", p_register->address);
         F1F2_BuildNAKResponse(p_request, p_response);

         return IRC_FAILURE;
      }

      GC_UpdateLockedFlag();
      if (RegIsLocked(p_register))
      {
         GCM_ERR("Write: Register @ 0x%08X is locked.", p_register->address);
         F1F2_BuildNAKResponse(p_request, p_response);

         return IRC_FAILURE;
      }
   }

   memcpy_swap(tmpRegDataBuffer, p_request->payload.regRW.data, p_request->payload.regRW.dataLength,
         p_request->payload.regRW.dataLength, RegIsBigEndian(p_register));

   if (GC_RegisterWrite(p_register, tmpRegDataBuffer, p_request->payload.regRW.dataLength) != IRC_SUCCESS)
   {
      F1F2_BuildNAKResponse(p_request, p_response);
      return IRC_FAILURE;
   }

   F1F2_BuildACKResponse(p_request, p_response);

   return IRC_SUCCESS;
}

/**
 * Process a register write.
 *
 * @param p_register is the pointer to the register definition data structure.
 * @param p_data is the pointer to data buffer to write to register.
 * @param dataLength is the length of data buffer.
 *
 * @return IRC_SUCCESS if the register write is successful.
 * @return IRC_FAILURE if the register write failed.
 */
IRC_Status_t GC_RegisterWrite(gcRegister_t *p_register, void *p_data, uint16_t dataLength)
{
   if (dataLength != p_register->dataLength)
   {
      GCM_ERR("Write: Data length mismatch for register @ 0x%08X.", p_register->address);
      return IRC_FAILURE;
   }

   if (p_register->p_data == NULL)
   {
      GCM_ERR("Write: Register @ 0x%08X has no associated data.", p_register->address);
      return IRC_FAILURE;
   }

   // Write register
   if (p_register->callback != NULL)
   {
      (*p_register->callback)(GCCP_BEFORE, GCCA_WRITE);
   }

   memcpy(p_register->p_data, p_data, p_register->dataLength);

   if (p_register->callback != NULL)
   {
      (*p_register->callback)(GCCP_AFTER, GCCA_WRITE);
   }

   if ((p_register->owner == (gcRegistersOwner_t) gcmPort.netIntf->address) && (RegIsShared(p_register)))
   {
      GC_BroadcastRegisterWrite(p_register);
   }

   return IRC_SUCCESS;
}

/**
 * Process a register write on an unsigned integer register.
 *
 * @param p_register is the pointer to the register definition data structure.
 * @param value is the integer value to write to register.
 *
 * @return IRC_SUCCESS if the register write is successful.
 * @return IRC_FAILURE if the register write failed.
 */
IRC_Status_t GC_RegisterWriteUI32(gcRegister_t *p_register, uint32_t value)
{
   if (!RegIsInt(p_register))
   {
      return IRC_FAILURE;
   }

   return GC_RegisterWrite(p_register, &value, sizeof(value));
}

/**
 * Set masked bit(s) in unsigned integer bit field register.
 *
 * @param p_register is the pointer to the register definition data structure.
 * @param mask is the bit mask. Bits to be set are masked on.
 *
 * @return IRC_SUCCESS if the register write is successful.
 * @return IRC_FAILURE if the register write failed.
 */
IRC_Status_t GC_RegisterSetBitsUI32(gcRegister_t *p_register, uint32_t mask)
{
   uint32_t value;

   if (!RegIsInt(p_register))
   {
      return IRC_FAILURE;
   }

   value = *((uint32_t*)p_register->p_data);
   BitMaskSet(value, mask);

   return GC_RegisterWrite(p_register, &value, sizeof(value));
}

/**
 * Clear masked bit(s) in unsigned integer bit field register.
 *
 * @param p_register is the pointer to the register definition data structure.
 * @param mask is the bit mask. Bits to be cleared are masked on.
 *
 * @return IRC_SUCCESS if the register write is successful.
 * @return IRC_FAILURE if the register write failed.
 */
IRC_Status_t GC_RegisterClearBitsUI32(gcRegister_t *p_register, uint32_t mask)
{
   uint32_t value;

   if (!RegIsInt(p_register))
   {
      return IRC_FAILURE;
   }

   value = *((uint32_t*)p_register->p_data);
   BitMaskClr(value, mask);

   return GC_RegisterWrite(p_register, &value, sizeof(value));
}

/**
 * Process a register write on a signed integer register.
 *
 * @param p_register is the pointer to the register definition data structure.
 * @param value is the integer value to write to register.
 *
 * @return IRC_SUCCESS if the register write is successful.
 * @return IRC_FAILURE if the register write failed.
 */
IRC_Status_t GC_RegisterWriteI32(gcRegister_t *p_register, int32_t value)
{
   if (!RegIsInt(p_register))
   {
      return IRC_FAILURE;
   }

   return GC_RegisterWrite(p_register, &value, sizeof(value));
}

/**
 * Process a register write on an float register.
 *
 * @param p_register is the pointer to the register definition data structure.
 * @param value is the float value to write to register.
 *
 * @return IRC_SUCCESS if the register write is successful.
 * @return IRC_FAILURE if the register write failed.
 */
IRC_Status_t GC_RegisterWriteFloat(gcRegister_t *p_register, float value)
{
   if (!RegIsFloat(p_register))
   {
      return IRC_FAILURE;
   }

   return GC_RegisterWrite(p_register, &value, sizeof(value));
}

/**
 * Broadcast a register write request to the other device(s).
 *
 * @param p_request is the pointer to the request command.
 * @param p_response is the pointer to the response command to fill.
 *
 * @return IRC_SUCCESS if the register write is successful.
 * @return IRC_FAILURE if the register write failed.
 */
IRC_Status_t GC_BroadcastRegisterWrite(gcRegister_t *p_register)
{
   networkCommand_t gcmBroadcast;

   if (gcmPort.netIntf->currentState != NIS_READY)
   {
      return IRC_SUCCESS;  // nothing to do for now
   }

   if (p_register->callback != NULL)
   {
      (*p_register->callback)(GCCP_BEFORE, GCCA_READ);
   }

   F1F2_CommandClear(&gcmBroadcast.f1f2);
   NetIntf_BuildBroadcastRequest(&gcmPort, &gcmBroadcast.f1f2, NIP_GC_MANAGER);
   gcmBroadcast.f1f2.cmd = F1F2_CMD_REG_WRITE;
   gcmBroadcast.f1f2.payload.regRW.address = p_register->address;
   memcpy_swap(gcmBroadcast.f1f2.payload.regRW.data, p_register->p_data, p_register->dataLength, p_register->dataLength, RegIsBigEndian(p_register));
   gcmBroadcast.f1f2.payload.regRW.dataLength = p_register->dataLength;
   gcmBroadcast.f1f2.payload.regRW.padLength = p_register->length - p_register->dataLength;

   if (p_register->callback != NULL)
   {
      (*p_register->callback)(GCCP_AFTER, GCCA_READ);
   }

   gcmBroadcast.port = &gcmPort;
   if (NetIntf_EnqueueCmd(gcmPort.netIntf, &gcmBroadcast) != IRC_SUCCESS)
   {
      GCM_ERR("Failed to broadcast register write request @ 0x%08X.", p_register->address);
      return IRC_FAILURE;
   }

   GCM_DBG("Register write request @ 0x%08X is broadcasted.", p_register->address);

   return IRC_SUCCESS;
}

/**
 * Find the selected register corresponding to this register.
 *
 * @param registerIdx is the index of the register to find.
 *
 * @return selected register pointer if found.
 * @return NULL if not found.
 */
static gcSelectedReg_t* findSelectedRegister(uint32_t registerIdx)
{
   gcSelectedReg_t* pReg = NULL;
   uint32_t idx;

   for (idx = 0; idx < gcSelectedRegListLen; idx++)
   {
      if (gcSelectedRegList[idx].registerIdx == registerIdx)
      {
         pReg = &gcSelectedRegList[idx];
         break;
      }
   }

   return pReg;
}
