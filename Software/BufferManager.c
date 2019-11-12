/**
 * @file BufferManager.c
 * Buffer Manager module source file.
 * 
 * Buffer Manager controls the start/stop of the buffering mode and
 * the sequence reading and deleting commands.
 *
 * $Rev: 20466 $
 * $Author: jdery $
 * $Date: 2017-05-19 11:20:05 -0400 (ven., 19 mai 2017) $
 * $Id: BufferManager.c 20466 2017-05-19 15:20:05Z jdery $
 * $URL: http://einstein/svn/firmware/FIR-00251-Common/branchs/2017-03-30%20Forrest%20Gump%20BufferDefrag%20Branch/Software/BufferManager.c $
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "BufferManager.h"
#ifdef BM_USE_CDMA
   #include "CDMA_DefragMem.h"
#endif
#include "xparameters.h"
#include "GenICam.h"
#ifdef FPGA_STORAGE
   #include "gpio.h"
#endif
#include "irc_status.h"
#include "utils.h"
#include "Timer.h"
#include "IRCamHeader.h"
#include "GC_Events.h"
#include <math.h>


// Global variables
t_memoryTable gMemoryTable;
bool gBufferStartDownloadTrigger = false;

// Private Function Prototypes
IRC_Status_t BufferManager_WaitMemReady(t_bufferManager *pBufferCtrl);
static void  BufferManager_UpdateFirstOrSelectedSequenceParameters(gcRegistersData_t *pGCRegs, bool hwFirstSequence);
static void  BufferManager_DefragCompletedCallback() __attribute__ ((unused)); // Unused in processing FPGA : suppress compilation warning when this happens
static void  BufferManager_DefragErrorCallback() __attribute__ ((unused)); // Unused in processing FPGA : suppress compilation warning when this happens

// Private Memory Space Function Prototypes
static inline uint64_t BufferManager_ComputeSequenceFragmentedSpace(uint32_t sequenceSelector);
static uint64_t        BufferManager_ComputeTotalFragmentedSpace();
static uint64_t        BufferManager_ComputeAvailableSpace();

// Private Hardware Access Function Prototypes
static void            BufferManager_HW_WriteSequence(t_bufferManager *pBufferCtrl, const gcRegistersData_t *pGCRegs);
static void            BufferManager_HW_ReadSequence(t_bufferManager *pBufferCtrl, const gcRegistersData_t *pGCRegs);
static void            BufferManager_HW_ReadImage(t_bufferManager *pBufferCtrl, gcRegistersData_t *pGCRegs);
static void            BufferManager_HW_ReadBufferTable(uint32_t SequenceID, t_bufferTable *table);
static void            BufferManager_HW_DownloadBufferTable(t_bufferManager *pBufferCtrl, gcRegistersData_t *pGCRegs);
static void            BufferManager_HW_ConfigureMinFrameTime(t_bufferManager *pBufferCtrl, bool verbose);
static uint32_t        BufferManager_HW_GetFrameId(uint32_t SequenceID, uint32_t ImageID);


/**
 * Initialize the Buffer Manager module.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t BufferManager_Init(t_bufferManager *pBufferCtrl, gcRegistersData_t *pGCRegs)
{
   uint64_t totalSpace;
   IRC_Status_t status = IRC_SUCCESS;

   // Initialize Memory Table
   gMemoryTable.NbValidSequences = 0;
   gMemoryTable.data[0].startAddress = 0;
   gMemoryTable.data[0].bufferLength = 0;

   // Initialize memory registers
   pGCRegs->MemoryBufferSequenceSizeMin = BM_SEQ_SIZE_MIN;
   pGCRegs->MemoryBufferNumberOfSequencesMin = BM_NB_SEQ_MIN;
   pGCRegs->MemoryBufferSequenceSizeInc = BM_SEQ_SIZE_INC;
   totalSpace = BM_TOTAL_SPACE_BYTES;
   pGCRegs->MemoryBufferTotalSpaceHigh = totalSpace >> 32;
   pGCRegs->MemoryBufferTotalSpaceLow = totalSpace & 0x00000000FFFFFFFF;
   pGCRegs->MemoryBufferAvailableFreeSpaceHigh = pGCRegs->MemoryBufferTotalSpaceHigh;
   pGCRegs->MemoryBufferAvailableFreeSpaceLow = pGCRegs->MemoryBufferTotalSpaceLow;
   pGCRegs->MemoryBufferFragmentedFreeSpaceHigh = 0;
   pGCRegs->MemoryBufferFragmentedFreeSpaceLow = 0;
   GC_SetMemoryBufferSequenceCount(0);                // Shared Register write
   BufferManager_UpdateSequenceMaxParameters(pGCRegs);
   pGCRegs->MemoryBufferSequencePreMOISize = 0;
   BufferManager_OnWindowSizeInit(pGCRegs);
   BufferManager_UpdateSelectedSequenceParameters(pGCRegs);

   // Configure MOI registers
   BufferManager_HW_SetMoiConfig(pBufferCtrl);
   // Configure Switch registers
   BufferManager_HW_SetSwitchConfig(pBufferCtrl);

   // Configure memory AXIL addressable size
   AXI4L_write32((uint32_t)log2((double)BM_AXIL_BUFDDR_SIZE), pBufferCtrl->ADD + BM_AXIL_MEM_ADDR_WIDTH);

   if(BufferManager_WaitMemReady(pBufferCtrl) != IRC_SUCCESS)
   {
      BUFFERING_ERR("DDR memory error.");
      GC_GenerateEventError(EECD_MemoryBufferDDRError);
      status = IRC_FAILURE;
   }
   #ifdef BM_USE_CDMA
      if(CDMADefrag_Init(&gMemoryTable) != IRC_SUCCESS)
      {
         BUFFERING_ERR("CDMA initialization error.");
         GC_GenerateEventError(EECD_MemoryBufferInitialisationError);
         status = IRC_FAILURE;
      }
   #endif

   return status;
}

/**
 * Wait for Mem Ready signal from Buffer Manager module.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t BufferManager_WaitMemReady(t_bufferManager *pBufferCtrl)
{
   const uint32_t loop_time_in_us = 1000;
   uint32_t loop_cnt = BM_READY_TIMEOUT_IN_S * TIME_ONE_SECOND_US / loop_time_in_us;

   while (loop_cnt--)
   {
      WAIT_US(loop_time_in_us);

      // Get Mem Ready signal from Buffer Manager module
      if ( AXI4L_read32(pBufferCtrl->ADD + BM_MEM_READY) == 1 )
         return IRC_SUCCESS;
   }
   return IRC_FAILURE;
}

/**
 * Updates registers on AcquisitionStart.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
void BufferManager_OnAcquisitionStart(t_bufferManager *pBufferCtrl, gcRegistersData_t *pGCRegs)
{
   BUFFERING_DBG("OnAcquisitionStart callback");

   if(BM_MemoryBufferWrite)
   {
      if(pGCRegs->MemoryBufferNumberOfSequencesMax)
      {
         BufferManager_HW_WriteSequence(pBufferCtrl, pGCRegs);
         GC_SetMemoryBufferStatus(MBS_Recording);
      }
   }
   else if(BM_MemoryBufferRead)
   {
      if(!gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].bufferLength || (pGCRegs->MemoryBufferSequenceSelector>=gMemoryTable.NbValidSequences))
      {
         BUFFERING_ERR("Download of a cleared sequence.");
         GC_GenerateEventError(EECD_MemoryBufferDownloadClearedSequence);
         return;
      }
      if((pGCRegs->Width != gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].imageWidth) ||
         (pGCRegs->Height != gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].imageHeight))
      {
         BUFFERING_ERR("Download frame size mismatch.");
         GC_GenerateEventError(EECD_MemoryBufferDownloadFrameSizeMissmatch);
         return;
      }
      gBufferStartDownloadTrigger = 1;
      GC_SetMemoryBufferStatus(MBS_Transmitting);
   }
   else if(gcRegsData.MemoryBufferMode == MBM_On && gcRegsData.MemoryBufferSequenceDownloadMode == MBSDM_Off && gcRegsData.MemoryBufferMOISource == MBMOIS_None){
      BufferManager_OnAcquisitionStop(pBufferCtrl, pGCRegs);
      GC_SetMemoryBufferStatus(MBS_Holding);
   }
}

/**
 * Updates registers on AcquisitionStop.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
void BufferManager_OnAcquisitionStop(t_bufferManager *pBufferCtrl, gcRegistersData_t *pGCRegs)
{
   timerData_t timer;

   BUFFERING_DBG("OnAcquisitionStop callback");

   BM_HW_SetLocalAcquisitionStop(pBufferCtrl);

   if (pGCRegs->MemoryBufferStatus == MBS_Recording)
   {
      StartTimer(&timer, BM_WRITE_COMPLETION_TIMEOUT_IN_MS);

      // Wait for stop to be applied (wait for current image completion)
      // Waiting takes up to 16.4ms with Scorpio detector, full frame.
      // Buffer download takes 2.44ms for 256 sequences : <10ms for 1024 sequences
      while (!BM_HW_GetLocalWriteSeqCompleted(pBufferCtrl))
      {
         if (TimedOut(&timer))
         {
            BUFFERING_ERR("Write completion timeout");
            GC_GenerateEventError(EECD_MemoryBufferHardwareCompletionTimeout);
            return;
         }
      }
      GC_SetMemoryBufferStatus(MBS_Idle);
      BufferManager_HW_DownloadBufferTable(pBufferCtrl, pGCRegs);
   }
   else if (pGCRegs->MemoryBufferStatus == MBS_Transmitting)
   {
      GC_SetMemoryBufferStatus(MBS_Idle);
   }
   else if (pGCRegs->MemoryBufferStatus == MBS_Holding)
   {
      GC_SetMemoryBufferStatus(MBS_Idle);
   }
}

/**
 * Clear the entire memory.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
void BufferManager_OnSequenceClearAll(t_bufferManager *pBufferCtrl, gcRegistersData_t *pGCRegs)
{
   int32_t i=0;

   BUFFERING_DBG("OnSequenceClearAll callback");

   for(; i<gMemoryTable.NbValidSequences; i++)
      gMemoryTable.data[i].bufferLength = 0;

   gMemoryTable.NbValidSequences = 0;
   pGCRegs->MemoryBufferFragmentedFreeSpaceHigh = 0;
   pGCRegs->MemoryBufferFragmentedFreeSpaceLow = 0;
   pGCRegs->MemoryBufferAvailableFreeSpaceHigh = pGCRegs->MemoryBufferTotalSpaceHigh;
   pGCRegs->MemoryBufferAvailableFreeSpaceLow = pGCRegs->MemoryBufferTotalSpaceLow;
   GC_SetMemoryBufferSequenceCount(0);                // Shared Register write
   BufferManager_UpdateSequenceMaxParameters(pGCRegs);
   BufferManager_UpdateSelectedSequenceParameters(pGCRegs);
   BM_TURN_OFF_DOWNLOAD_MODE();
}

/**
 * Clear the selected sequence.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
void BufferManager_OnSequenceClearSelected(gcRegistersData_t *pGCRegs)
{
   int32_t i;
   uint64_t FreeSpace, FragSpace;

   BUFFERING_DBG("OnSequenceClearSelected callback");

   FragSpace = ((uint64_t)pGCRegs->MemoryBufferFragmentedFreeSpaceHigh << 32) + (uint64_t)pGCRegs->MemoryBufferFragmentedFreeSpaceLow;

   // Check if Free space generated
   if(pGCRegs->MemoryBufferSequenceSelector == gMemoryTable.NbValidSequences-1)
   {
      // Clear Last Sequence
      gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].bufferLength = 0;
      // Check how much free space was generated at the end of used space
      for(i=(int32_t)pGCRegs->MemoryBufferSequenceSelector-1; i>=0; i--)
      {
         if(gMemoryTable.data[i].bufferLength)
            break;
         FragSpace -= BufferManager_ComputeSequenceFragmentedSpace(i);
      }
      gMemoryTable.NbValidSequences = i+1;
      GC_SetMemoryBufferSequenceCount(i+1);  // Shared Register write
      if(i<0) BM_TURN_OFF_DOWNLOAD_MODE();     // Last sequence cleared (NbValidSequences == 0)

      FreeSpace = BufferManager_ComputeAvailableSpace();
      pGCRegs->MemoryBufferAvailableFreeSpaceHigh = FreeSpace >> 32;
      pGCRegs->MemoryBufferAvailableFreeSpaceLow = FreeSpace & 0x00000000FFFFFFFF;
      BufferManager_UpdateSequenceMaxParameters(pGCRegs);
   }
   else
   {
      // Clear Selected Sequence, remove partially fragmented space and add fully deleted sequence space to fragmented space
      FragSpace -= BufferManager_ComputeSequenceFragmentedSpace(pGCRegs->MemoryBufferSequenceSelector);
      gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].bufferLength = 0;
      FragSpace += BufferManager_ComputeSequenceFragmentedSpace(pGCRegs->MemoryBufferSequenceSelector);
   }

   pGCRegs->MemoryBufferFragmentedFreeSpaceHigh = FragSpace >> 32;
   pGCRegs->MemoryBufferFragmentedFreeSpaceLow = FragSpace & 0x00000000FFFFFFFF;
   BufferManager_UpdateSelectedSequenceParameters(pGCRegs);
}

/**
 * Launch Memory Defrag
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
void BufferManager_OnDefrag(t_bufferManager *pBufferCtrl, gcRegistersData_t *pGCRegs)
{
#ifdef BM_USE_CDMA
   uint32_t i;
   uint32_t nShift = 0;
   uint32_t nbDefragFreeSequences = 0;
   uint64_t FreeSpace;

   BUFFERING_DBG("OnDefrag callback");

   if(CDMADefrag_StartDefrag(&BufferManager_DefragCompletedCallback, &BufferManager_DefragErrorCallback))
   {
      // Defrag Command Accepted
      GC_SetMemoryBufferStatus(MBS_Defraging);
      if(!(gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].bufferLength))
      {
         // Return selection to first non-empty sequence if current sequence doesn't exist
         for(i=0; i<gMemoryTable.NbValidSequences; i++)
         {
            if(gMemoryTable.data[i].bufferLength)
            {
               pGCRegs->MemoryBufferSequenceSelector = i;
               break;
            }
         }
         BufferManager_UpdateSelectedSequenceParameters(pGCRegs);
         pGCRegs->MemoryBufferSequenceSelector = 0; // Will be sequence 0 after defrag
      }
      else
      {
         // Count the number of empty sequences before the selected sequence to determine the sequence shift after defrag
         for(i=0; i<pGCRegs->MemoryBufferSequenceSelector; i++)
         {
            if(!(gMemoryTable.data[i].bufferLength))
               nShift++;
         }
         pGCRegs->MemoryBufferSequenceSelector -= nShift;
      }
      for(i=0; i<gMemoryTable.NbValidSequences; i++)
      {
         // Count the total number of empty sequences
         if(!(gMemoryTable.data[i].bufferLength))
            nbDefragFreeSequences++;
      }
      GC_SetMemoryBufferSequenceCount(gMemoryTable.NbValidSequences-nbDefragFreeSequences);  // Shared Register write
      FreeSpace = ((uint64_t)pGCRegs->MemoryBufferAvailableFreeSpaceHigh << 32) + (uint64_t)pGCRegs->MemoryBufferAvailableFreeSpaceLow;
      FreeSpace += ((uint64_t)pGCRegs->MemoryBufferFragmentedFreeSpaceHigh << 32) + (uint64_t)pGCRegs->MemoryBufferFragmentedFreeSpaceLow;
      pGCRegs->MemoryBufferAvailableFreeSpaceHigh = FreeSpace >> 32;
      pGCRegs->MemoryBufferAvailableFreeSpaceLow = FreeSpace & 0x00000000FFFFFFFF;
      pGCRegs->MemoryBufferFragmentedFreeSpaceHigh = 0;
      pGCRegs->MemoryBufferFragmentedFreeSpaceLow = 0;
      BufferManager_UpdateSequenceMaxParameters(pGCRegs);
   }
   else
   {
      // Defrag Command Refused
      BUFFERING_ERR("Defrag command refused.");
      BufferManager_DefragErrorCallback(pGCRegs);
   }
#else
   BUFFERING_ERR("Defragging not supported.");
   BufferManager_DefragErrorCallback(pGCRegs);
#endif
}

/**
 * Initialize registers on first window size change
 *
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
void BufferManager_OnWindowSizeInit(gcRegistersData_t *pGCRegs)
{
   BUFFERING_DBG("OnWindowSizeInit callback");

   pGCRegs->MemoryBufferSequenceSize = pGCRegs->MemoryBufferSequenceSizeMax;
   // Set NumberOfSequences to max with callback to reduce SequenceSize accordingly
   GC_SetMemoryBufferNumberOfSequences(pGCRegs->MemoryBufferNumberOfSequencesMax);
}

/**
 * Checks limits on SequenceSize change.
 *
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
void BufferManager_SequenceSizeLimits(gcRegistersData_t *pGCRegs)
{
   uint32_t maxNbSeq;

   if(!pGCRegs->MemoryBufferSequenceSizeMax || pGCRegs->MemoryBufferSequenceSize < pGCRegs->MemoryBufferSequenceSizeMin)
   {
      pGCRegs->MemoryBufferSequenceSize = pGCRegs->MemoryBufferSequenceSizeMin;
      BufferManager_SequencePreMOISizeLimits(pGCRegs);
   }
   else if(pGCRegs->MemoryBufferSequenceSize > pGCRegs->MemoryBufferSequenceSizeMax)
   {
      pGCRegs->MemoryBufferSequenceSize = pGCRegs->MemoryBufferSequenceSizeMax;
      BufferManager_SequencePreMOISizeLimits(pGCRegs);
   }
   else if(pGCRegs->MemoryBufferSequenceSize % pGCRegs->MemoryBufferSequenceSizeInc != 0)
   {
      pGCRegs->MemoryBufferSequenceSize = (pGCRegs->MemoryBufferSequenceSize/pGCRegs->MemoryBufferSequenceSizeInc)*pGCRegs->MemoryBufferSequenceSizeInc;
      BufferManager_SequencePreMOISizeLimits(pGCRegs);
   }

   maxNbSeq = pGCRegs->MemoryBufferSequenceSizeMax/pGCRegs->MemoryBufferSequenceSize;
   if(pGCRegs->MemoryBufferNumberOfSequences > maxNbSeq)
   {
      pGCRegs->MemoryBufferNumberOfSequences = maxNbSeq;
   }
}

/**
 * Checks limits on NumberOfSequences change.
 *
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
void BufferManager_NumberOfSequencesLimits(gcRegistersData_t *pGCRegs)
{
    uint32_t maxSeqSize;

    if(pGCRegs->MemoryBufferNumberOfSequences > pGCRegs->MemoryBufferNumberOfSequencesMax)
   {
       pGCRegs->MemoryBufferNumberOfSequences = pGCRegs->MemoryBufferNumberOfSequencesMax;
   }

    maxSeqSize = pGCRegs->MemoryBufferSequenceSizeMax/pGCRegs->MemoryBufferNumberOfSequences;
    if(pGCRegs->MemoryBufferSequenceSize > maxSeqSize)
   {
       pGCRegs->MemoryBufferSequenceSize = roundDown(maxSeqSize,pGCRegs->MemoryBufferSequenceSizeInc);
       BufferManager_SequencePreMOISizeLimits(pGCRegs);
   }
   }

/**
 * Checks limits on NumberOfSequences change.
 *
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
void BufferManager_SequencePreMOISizeLimits(gcRegistersData_t *pGCRegs)
{
   if(pGCRegs->MemoryBufferSequencePreMOISize > (pGCRegs->MemoryBufferSequenceSize -1))
      pGCRegs->MemoryBufferSequencePreMOISize = pGCRegs->MemoryBufferSequenceSize -1;
}

/**
 * Updates registers on SequenceDownloadFrameCount/ID change.
 *
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return true if all parameters valid, false if a parameter was limited to min/max value
 */
bool BufferManager_SequenceDownloadLimits(gcRegistersData_t *pGCRegs)
{
   bool validParams = true;
   uint32_t lastID;

   if(!pGCRegs->MemoryBufferSequenceRecordedSize)
   {
      pGCRegs->MemoryBufferSequenceDownloadImageFrameID = 0;
      pGCRegs->MemoryBufferSequenceDownloadFrameID = 0;
      pGCRegs->MemoryBufferSequenceDownloadFrameCount = gcRegsDataFactory.MemoryBufferSequenceDownloadFrameCount;
      return false;
   }

   lastID = pGCRegs->MemoryBufferSequenceFirstFrameID + pGCRegs->MemoryBufferSequenceRecordedSize - 1;

   if(pGCRegs->MemoryBufferSequenceDownloadImageFrameID < pGCRegs->MemoryBufferSequenceFirstFrameID)
   {
      pGCRegs->MemoryBufferSequenceDownloadImageFrameID = pGCRegs->MemoryBufferSequenceFirstFrameID;
      validParams = false;
   }
   else if(pGCRegs->MemoryBufferSequenceDownloadImageFrameID > lastID)
   {
      pGCRegs->MemoryBufferSequenceDownloadImageFrameID = lastID;
      validParams = false;
   }

   if(pGCRegs->MemoryBufferSequenceDownloadFrameID < pGCRegs->MemoryBufferSequenceFirstFrameID)
   {
      pGCRegs->MemoryBufferSequenceDownloadFrameID = pGCRegs->MemoryBufferSequenceFirstFrameID;
      validParams = false;
   }
   else if(pGCRegs->MemoryBufferSequenceDownloadFrameID > lastID)
   {
      pGCRegs->MemoryBufferSequenceDownloadFrameID = lastID;
      validParams = false;
   }

   if(pGCRegs->MemoryBufferSequenceDownloadFrameCount > (lastID - pGCRegs->MemoryBufferSequenceDownloadFrameID + 1))
   {
      pGCRegs->MemoryBufferSequenceDownloadFrameCount = lastID - pGCRegs->MemoryBufferSequenceDownloadFrameID + 1;
      validParams = false;
   }

   return validParams;
}

/**
 * Updates the max values of sequence parameters
 *
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
void BufferManager_UpdateSequenceMaxParameters(gcRegistersData_t *pGCRegs)
{
   uint64_t FreeSpace;
   uint32_t FrameSize; // Bytes;
   uint32_t maxNbSeq;

   FreeSpace = ((uint64_t)(pGCRegs->MemoryBufferAvailableFreeSpaceHigh) << 32) + (uint64_t)pGCRegs->MemoryBufferAvailableFreeSpaceLow;
   FrameSize = BM_COMPUTE_FRAMESIZE(pGCRegs->Width,pGCRegs->Height)*2; // Bytes

   pGCRegs->MemoryBufferSequenceSizeMax = ((FreeSpace/FrameSize) / BM_SEQ_SIZE_INC) * BM_SEQ_SIZE_INC; // even number of images if external storage
   pGCRegs->MemoryBufferNumberOfSequencesMax = BM_MAX_SEQUENCE - pGCRegs->MemoryBufferSequenceCount;

   if(pGCRegs->MemoryBufferLegacyMode && pGCRegs->MemoryBufferSequenceCount)
   {
      // Keep SequenceSize fixed until buffer is cleared in legacy mode
      maxNbSeq = pGCRegs->MemoryBufferSequenceSizeMax/pGCRegs->MemoryBufferSequenceSize; // SequenceSizeMax is nbImagesMax on this line
      if(pGCRegs->MemoryBufferNumberOfSequencesMax > maxNbSeq)
         pGCRegs->MemoryBufferNumberOfSequencesMax = maxNbSeq;
      pGCRegs->MemoryBufferSequenceSizeMin = pGCRegs->MemoryBufferSequenceSize;
      pGCRegs->MemoryBufferSequenceSizeMax = pGCRegs->MemoryBufferSequenceSize;
      if(!pGCRegs->MemoryBufferNumberOfSequencesMax)
         pGCRegs->MemoryBufferNumberOfSequences = 1;
      else if(pGCRegs->MemoryBufferNumberOfSequences > pGCRegs->MemoryBufferNumberOfSequencesMax)
         pGCRegs->MemoryBufferNumberOfSequences = pGCRegs->MemoryBufferNumberOfSequencesMax;
      // SequenceSize unchanged, PreMOISize does not need to be checked
   }
   else
   {
      pGCRegs->MemoryBufferSequenceSizeMin = BM_SEQ_SIZE_MIN;
      pGCRegs->MemoryBufferNumberOfSequencesMin = BM_NB_SEQ_MIN;

      if(pGCRegs->MemoryBufferNumberOfSequencesMax > (pGCRegs->MemoryBufferSequenceSizeMax / BM_SEQ_SIZE_MIN))
         pGCRegs->MemoryBufferNumberOfSequencesMax = pGCRegs->MemoryBufferSequenceSizeMax / BM_SEQ_SIZE_MIN;

      if(!pGCRegs->MemoryBufferSequenceSizeMax) //Ensure minimal sequence size is respected
      {
         pGCRegs->MemoryBufferSequenceSize = 0;
         pGCRegs->MemoryBufferSequenceSizeMin = 0;
      }
      else if(pGCRegs->MemoryBufferSequenceSize < pGCRegs->MemoryBufferSequenceSizeMin)
      {
         pGCRegs->MemoryBufferSequenceSize = pGCRegs->MemoryBufferSequenceSizeMin;
      }
      else if(pGCRegs->MemoryBufferSequenceSize > pGCRegs->MemoryBufferSequenceSizeMax)
      {
         pGCRegs->MemoryBufferSequenceSize = pGCRegs->MemoryBufferSequenceSizeMax;
      }

      if(!pGCRegs->MemoryBufferNumberOfSequencesMax)
      {
         pGCRegs->MemoryBufferNumberOfSequences = 0;
         pGCRegs->MemoryBufferNumberOfSequencesMin = 0;
      }
      else if(pGCRegs->MemoryBufferNumberOfSequences < pGCRegs->MemoryBufferNumberOfSequencesMin)
      {
            pGCRegs->MemoryBufferNumberOfSequences = pGCRegs->MemoryBufferNumberOfSequencesMin;
      }
      else
      {
         maxNbSeq = pGCRegs->MemoryBufferSequenceSizeMax/pGCRegs->MemoryBufferSequenceSize;
         if(pGCRegs->MemoryBufferNumberOfSequences > pGCRegs->MemoryBufferNumberOfSequencesMax)
            pGCRegs->MemoryBufferNumberOfSequences = pGCRegs->MemoryBufferNumberOfSequencesMax;
         if(pGCRegs->MemoryBufferNumberOfSequences > maxNbSeq)
            pGCRegs->MemoryBufferNumberOfSequences = maxNbSeq;
      }
      BufferManager_SequencePreMOISizeLimits(pGCRegs);
   }
}

/**
 * Updates the registers selected by the Sequence Selector
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
void BufferManager_UpdateSelectedSequenceParameters(gcRegistersData_t *pGCRegs)
{
   BufferManager_UpdateFirstOrSelectedSequenceParameters(pGCRegs, false);
}

/**
 * Updates the registers selected by the Sequence Selector (software) or after first sequence completion (hardware)
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
static void BufferManager_UpdateFirstOrSelectedSequenceParameters(gcRegistersData_t *pGCRegs, bool hwFirstSequence)
{
   t_bufferTable SequenceTable;
   uint32_t bufferLength;

   if(!gMemoryTable.NbValidSequences)
      pGCRegs->MemoryBufferSequenceSelector = 0;
   else if(pGCRegs->MemoryBufferSequenceSelector >= gMemoryTable.NbValidSequences)
      pGCRegs->MemoryBufferSequenceSelector = gMemoryTable.NbValidSequences-1;

   if(hwFirstSequence)
   {
      // Sequence info read from hardware
      BufferManager_HW_ReadBufferTable(0, &SequenceTable);
      bufferLength = pGCRegs->MemoryBufferSequenceSize;
      pGCRegs->MemoryBufferSequenceOffsetX = pGCRegs->OffsetX;
      pGCRegs->MemoryBufferSequenceOffsetY = pGCRegs->OffsetY;
      pGCRegs->MemoryBufferSequenceWidth = pGCRegs->Width;
      GC_SetMemoryBufferSequenceHeight(pGCRegs->Height);
   }
   else
   {
      // Sequence info read from software
      SequenceTable = gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].bufImgIdx;
      bufferLength = gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].bufferLength;
      pGCRegs->MemoryBufferSequenceOffsetX = gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].OffsetX;
      pGCRegs->MemoryBufferSequenceOffsetY = gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].OffsetY;
      pGCRegs->MemoryBufferSequenceWidth = gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].imageWidth;
      GC_SetMemoryBufferSequenceHeight(gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].imageHeight);
   }

   if(!bufferLength)
   {
      pGCRegs->MemoryBufferSequenceFirstFrameID = 0;
      pGCRegs->MemoryBufferSequenceMOIFrameID = 0;
      pGCRegs->MemoryBufferSequenceRecordedSize = 0;
      pGCRegs->MemoryBufferSequenceOffsetX = 0;
      pGCRegs->MemoryBufferSequenceOffsetY = 0;
      pGCRegs->MemoryBufferSequenceWidth = 0;
      GC_SetMemoryBufferSequenceHeight(0);
      pGCRegs->MemoryBufferSequenceDownloadImageFrameID = 0;
      pGCRegs->MemoryBufferSequenceDownloadFrameID = 0;
      pGCRegs->MemoryBufferSequenceDownloadFrameCount = gcRegsDataFactory.MemoryBufferSequenceDownloadFrameCount;
      return;
   }

   pGCRegs->MemoryBufferSequenceFirstFrameID = BufferManager_HW_GetFrameId(pGCRegs->MemoryBufferSequenceSelector, SequenceTable.start_img);
   pGCRegs->MemoryBufferSequenceMOIFrameID = BufferManager_HW_GetFrameId(pGCRegs->MemoryBufferSequenceSelector, SequenceTable.moi_img);
   if(SequenceTable.start_img > SequenceTable.stop_img )
      pGCRegs->MemoryBufferSequenceRecordedSize = bufferLength - SequenceTable.start_img + SequenceTable.stop_img + 1;
   else
      pGCRegs->MemoryBufferSequenceRecordedSize = SequenceTable.stop_img - SequenceTable.start_img + 1;
   // This function is only called when selector has changed. Reset download IDs to default values.
   pGCRegs->MemoryBufferSequenceDownloadImageFrameID = pGCRegs->MemoryBufferSequenceMOIFrameID;
   pGCRegs->MemoryBufferSequenceDownloadFrameID = pGCRegs->MemoryBufferSequenceFirstFrameID;
   pGCRegs->MemoryBufferSequenceDownloadFrameCount = pGCRegs->MemoryBufferSequenceRecordedSize;
}

/**
 * Callback for defrag completion
 *
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
static void BufferManager_DefragCompletedCallback()
{
   GC_SetMemoryBufferStatus(MBS_Idle);
   BUFFERING_INF("Defrag completed!");
}

/**
 * Callback for defrag error
 *
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
static void BufferManager_DefragErrorCallback()
{
   BUFFERING_ERR("Defrag error.");
   GC_GenerateEventError(EECD_MemoryBufferDefragError);
}

/**
 * Compute Sequence Fragmented Space
 *
 * @param Sequence selector Index
 *
 * @return (uint64_t) Fragmended space (bytes)
 */
uint64_t inline BufferManager_ComputeSequenceFragmentedSpace(uint32_t sequenceSelector)
{
   #ifdef BM_USE_CDMA
      return CDMADefrag_ComputeSequenceFragmentedSpace(sequenceSelector);
   #else
      return 0;
   #endif
}

/**
 * Compute Total Fragmented Space
 *
 * @param void
 *
 * @return (uint64_t) Total Fragmended space (bytes)
 */
static uint64_t BufferManager_ComputeTotalFragmentedSpace()
{
   uint64_t FragSpace = 0;
   uint32_t i;

   for(i=0; i<gMemoryTable.NbValidSequences; i++)
   {
      FragSpace += BufferManager_ComputeSequenceFragmentedSpace(i);
   }

   return FragSpace;
}

/**
 *  Compute Available Space
 *
 * @param void
 *
 * @return (uint64_t) Available space (bytes)
 */
static uint64_t BufferManager_ComputeAvailableSpace()
{
   struct seqInfo *seqInfo;

   if(!gMemoryTable.NbValidSequences)
      return BM_TOTAL_SPACE_BYTES;

   seqInfo = &(gMemoryTable.data[gMemoryTable.NbValidSequences-1]);
   return BM_TOTAL_SPACE_BYTES - (((uint64_t)seqInfo->startAddress << BM_ADDRBITS_ALIGN) + (uint64_t)BM_IMAGE_MEM_IDX(seqInfo->bufferLength)*(uint64_t)BM_IMAGE_SIZE_BYTE)*BM_NB_MEMORY_ADDR_SPACES;
}

/**
 * Get status from Buffer Manager module.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param pStat Pointer to the Buffer Status to update.
 *
 * @return void.
 */
void BufferManager_GetStatus(t_bufferManager *pBufferCtrl, t_bufferStatus *pStat)
{
   pStat->error         = AXI4L_read32(pBufferCtrl->ADD + BM_ERROR);
   pStat->mem_ready     = AXI4L_read32(pBufferCtrl->ADD + BM_MEM_READY);
   pStat->ext_buf_prsnt = AXI4L_read32(pBufferCtrl->ADD + BM_EXT_BUF_PRSNT);
}

void BufferManager_SM()
{
   extern t_bufferManager gBufManager;
   static bmState_t cstate = BMS_IDLE;
   uint32_t sequenceCount, sequenceCountDiff;
   uint64_t FreeSpace;

   switch (cstate)
   {
      case BMS_IDLE:
         // Wait completion flag. Write completion flag is cleared when config is disabled after buffer download
         if(BM_MemoryBufferWrite)
         {
            if(BM_HW_GetLocalWriteSeqCompleted(&gBufManager))
            {
               // Download completed sequences (and update registers)
               BM_HW_SetLocalAcquisitionStop(&gBufManager);
               GC_SetMemoryBufferStatus(MBS_Idle);
               BufferManager_HW_DownloadBufferTable(&gBufManager, &gcRegsData); // 2.44ms for 256 sequences : <10ms for 1024 sequences
            }
            else if(gcRegsData.MemoryBufferStatus != MBS_Defraging)
            {
               // Update sequence count
               sequenceCount = gMemoryTable.NbValidSequences + BM_HW_GetLocalSequenceCount(&gBufManager);
               sequenceCountDiff = sequenceCount - gcRegsData.MemoryBufferSequenceCount;
               if(sequenceCountDiff) // Update associated registers
               {
                  // Update AvailableFreeSpace for sequence max parameters update.
                  // Fragmented space will be updated after hardware table download
                  FreeSpace = ((uint64_t)gcRegsData.MemoryBufferAvailableFreeSpaceHigh << 32) + (uint64_t)gcRegsData.MemoryBufferAvailableFreeSpaceLow;
                  FreeSpace -= (uint64_t)sequenceCountDiff*(uint64_t)gBufManager.nbImagePerSeq*(uint64_t)gBufManager.FrameSize*2; // 2 bytes/pixel
                  gcRegsData.MemoryBufferAvailableFreeSpaceHigh = FreeSpace >> 32;
                  gcRegsData.MemoryBufferAvailableFreeSpaceLow  = FreeSpace & 0x00000000FFFFFFFF;
                  if(!gcRegsData.MemoryBufferSequenceCount)
                  {
                     // Populate valid sequence registers when first sequence is completed
                     BufferManager_UpdateFirstOrSelectedSequenceParameters(&gcRegsData, true);
                  }
                  GC_SetMemoryBufferSequenceCount(sequenceCount); // Shared Register write
                  BufferManager_UpdateSequenceMaxParameters(&gcRegsData);
               }
            }
         }
         if(BM_MemoryBufferRead && gBufferStartDownloadTrigger)
         {
            gBufferStartDownloadTrigger = 0;
            BufferManager_HW_ConfigureMinFrameTime(&gBufManager, true);
            if(gcRegsData.MemoryBufferSequenceDownloadMode == MBSDM_Sequence)
               BufferManager_HW_ReadSequence(&gBufManager, &gcRegsData);
            else // MBSDM_Image
               BufferManager_HW_ReadImage(&gBufManager, &gcRegsData);
            cstate = BMS_READ;
         }
         break;

      case BMS_READ:
         BUFFERING_DBG("State BMS_READ");
         // Live throttling of the average bit rate
         BufferManager_HW_ConfigureMinFrameTime(&gBufManager, false);
         // Wait completion flag. Read completion flag is also set when acquisition is stopped
         if(!BM_HW_GetLocalReadSeqCompleted(&gBufManager))
            break;

         cstate = BMS_DONE;
      case BMS_DONE:
         BUFFERING_DBG("State BMS_DONE");
         BM_HW_SetLocalAcquisitionStop(&gBufManager);
         if(!gBufferStartDownloadTrigger) // Do not clear flag if restart is requested !
            GC_SetMemoryBufferStatus(MBS_Idle);
         BUFFERING_INF("Buffer download completed or stopped");
         cstate = BMS_IDLE;
         BUFFERING_DBG("State BMS_IDLE");
         break;

      default:
         cstate = BMS_IDLE;
         break;
   }

   // Restart download on gBufferStartDownloadTrigger
   if(gBufferStartDownloadTrigger)
   {
      //gBufferStartDownloadTrigger is not RAZ, restart a buffer read sequence at BMS_IDLE
      if(BM_MemoryBufferRead)
         BM_HW_SetLocalAcquisitionStop(&gBufManager);
      else
         gBufferStartDownloadTrigger = 0; // Clear if no longer in read mode
   }

   // Run CDMA Defrag State-Machine
   CDMADefrag_SM();
}

/**
 * Set the hardware registers for sequence write operation.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
static void BufferManager_HW_WriteSequence(t_bufferManager *pBufferCtrl, const gcRegistersData_t *pGCRegs)
{
   uint64_t startAddress = 0;
   struct seqInfo *seqInfo;

   BM_HW_SetLocalDisableBuffer(pBufferCtrl); // Also clears hardware table

   // Set write control values
   if(gMemoryTable.NbValidSequences)
   {
      // First sequence is always at address 0, no need to recalculate when NbValidSequences==0
      seqInfo = &(gMemoryTable.data[gMemoryTable.NbValidSequences-1]);
      startAddress = ((uint64_t)seqInfo->startAddress << BM_ADDRBITS_ALIGN) + (uint64_t)BM_IMAGE_MEM_IDX(seqInfo->bufferLength)*(uint64_t)BM_IMAGE_SIZE_BYTE;
   }
   pBufferCtrl->Mem0_base_addr   = MEM0_BUFFER_BASEADDR + startAddress;
   pBufferCtrl->Mem1_base_addr   = MEM1_BUFFER_BASEADDR + startAddress;
   pBufferCtrl->nbSequenceMax    = pGCRegs->MemoryBufferNumberOfSequences;
   pBufferCtrl->nbImagePerSeq    = pGCRegs->MemoryBufferSequenceSize;
   pBufferCtrl->FrameSize        = BM_COMPUTE_FRAMESIZE(pGCRegs->Width,pGCRegs->Height); // In pixel
   pBufferCtrl->BufferMode       = BM_WRITE;
   pBufferCtrl->HDR_Size         = pGCRegs->Width*4; // In bytes (2 lines * 2 bytes/pixel)
   pBufferCtrl->IMG_Size         = pGCRegs->Width*pGCRegs->Height*2; // In bytes (2 bytes/pixel)
   pBufferCtrl->nb_img_pre       = pGCRegs->MemoryBufferSequencePreMOISize;
   pBufferCtrl->nb_img_post      = pBufferCtrl->nbImagePerSeq - pBufferCtrl->nb_img_pre;
   pBufferCtrl->clear_memory     = 0;
   pBufferCtrl->acq_stop         = 0;
   // Write values
   WriteStruct(pBufferCtrl);

   BM_HW_SetLocalEnableBuffer(pBufferCtrl);
}

/**
 * Set the hardware registers for sequence read operation
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
static void BufferManager_HW_ReadSequence(t_bufferManager *pBufferCtrl, const gcRegistersData_t *pGCRegs)
{
   uint32_t firstFrameId, img_offset, download_img_start, download_img_stop;

   // Get the firstFrameId
   firstFrameId = BufferManager_HW_GetFrameId(pGCRegs->MemoryBufferSequenceSelector, gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].bufImgIdx.start_img);
   // Get the image location of the RequieredimageFrameID
   img_offset = pGCRegs->MemoryBufferSequenceDownloadFrameID - firstFrameId;
   // Find the location of the frame id (modulo to rollover the circular buffer)
   download_img_start = (img_offset + gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].bufImgIdx.start_img) % gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].bufferLength;
   download_img_stop = ((img_offset+pGCRegs->MemoryBufferSequenceDownloadFrameCount-1) + gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].bufImgIdx.start_img) % gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].bufferLength;

   BM_HW_SetLocalDisableBuffer(pBufferCtrl); // Also clears hardware table

   // Set read control values
   pBufferCtrl->Mem0_base_addr   = MEM0_BUFFER_BASEADDR + ((uint64_t)gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].startAddress << BM_ADDRBITS_ALIGN);
   pBufferCtrl->Mem1_base_addr   = MEM1_BUFFER_BASEADDR + ((uint64_t)gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].startAddress << BM_ADDRBITS_ALIGN);
   pBufferCtrl->nbImagePerSeq    = gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].bufferLength;
   pBufferCtrl->FrameSize        = BM_COMPUTE_FRAMESIZE(gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].imageWidth,gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].imageHeight); // In pixel (+2 for header lines)
   pBufferCtrl->BufferMode       = BM_READ;
   pBufferCtrl->HDR_Size         = gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].imageWidth*4; // In bytes (2 lines * 2 bytes/pixel)
   pBufferCtrl->IMG_Size         = gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].imageWidth*gMemoryTable.data[pGCRegs->MemoryBufferSequenceSelector].imageHeight*2; // In bytes (2 bytes/pixel)
   pBufferCtrl->rd_sequence_id   = 0;
   pBufferCtrl->rd_start_img     = download_img_start;
   pBufferCtrl->rd_stop_img      = download_img_stop;
   pBufferCtrl->clear_memory     = 0;
   pBufferCtrl->acq_stop         = 0;
   // Write values
   WriteStruct(pBufferCtrl);

   BM_HW_SetLocalEnableBuffer(pBufferCtrl);
}

/**
 * Set the hardware registers for image read operation
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
static void BufferManager_HW_ReadImage(t_bufferManager *pBufferCtrl, gcRegistersData_t *pGCRegs)
{
   uint32_t FrameID, FrameCount;

   // Backup sequence read registers
   FrameID = pGCRegs->MemoryBufferSequenceDownloadFrameID;
   FrameCount = pGCRegs->MemoryBufferSequenceDownloadFrameCount;
   pGCRegs->MemoryBufferSequenceDownloadFrameID = pGCRegs->MemoryBufferSequenceDownloadImageFrameID;
   pGCRegs->MemoryBufferSequenceDownloadFrameCount = 1;
   BufferManager_HW_ReadSequence(pBufferCtrl, pGCRegs);
   // Restore sequence read registers
   pGCRegs->MemoryBufferSequenceDownloadFrameID = FrameID;
   pGCRegs->MemoryBufferSequenceDownloadFrameCount = FrameCount;
}

/**
 * Read hardware buffer table to get sequence info values.
 *
 * @param SequenceID Number of the sequence to get.
 * @param table Pointer to the table to fill with sequence data
 *
 * @return Sequence info values.
 */
static void BufferManager_HW_ReadBufferTable(uint32_t SequenceID, t_bufferTable *table)
{
   const uint32_t seqAddr = XPAR_M_BUF_TABLE_BASEADDR + SequenceID*4;

   // Read sequence info values
   table->start_img =  AXI4L_read32(seqAddr + BT_START_IMG_OFFSET);
   table->moi_img   =  AXI4L_read32(seqAddr + BT_MOI_IMG_OFFSET);
   table->stop_img  =  AXI4L_read32(seqAddr + BT_END_IMG_OFFSET);
}

/**
 * Download hardware buffer table content to software memory table.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
static void BufferManager_HW_DownloadBufferTable(t_bufferManager *pBufferCtrl, gcRegistersData_t *pGCRegs)
{
   uint64_t addressOffset, sequenceAddrSize;
   uint32_t sequenceCount, sequenceOffset;
   uint16_t imageWidth, imageHeight;
   uint32_t i=0, n;
   uint64_t FreeSpace, FragSpace;

   GC_SetMemoryBufferStatus(MBS_Updating);
   addressOffset = pBufferCtrl->Mem0_base_addr-MEM0_BUFFER_BASEADDR; // Bytes
   sequenceAddrSize = (uint64_t)pBufferCtrl->FrameSize*2*(uint64_t)BM_IMAGE_MEM_IDX(pBufferCtrl->nbImagePerSeq); // Bytes for each DIMM
   sequenceCount = BM_HW_GetLocalSequenceCount(pBufferCtrl);
   sequenceOffset = gMemoryTable.NbValidSequences;
   imageWidth = pBufferCtrl->HDR_Size/4; // Pixels
   imageHeight = pBufferCtrl->IMG_Size/imageWidth/2; // Pixels
   for(i=0; i<sequenceCount; i++)
   {
      n=i+sequenceOffset;
      gMemoryTable.data[n].startAddress = (addressOffset + (uint64_t)i*sequenceAddrSize) >> BM_ADDRBITS_ALIGN;
      gMemoryTable.data[n].imageWidth = imageWidth;
      gMemoryTable.data[n].imageHeight = imageHeight;
      gMemoryTable.data[n].bufferLength = pBufferCtrl->nbImagePerSeq;
      gMemoryTable.data[n].OffsetX = pGCRegs->OffsetX;
      gMemoryTable.data[n].OffsetY = pGCRegs->OffsetY;
      BufferManager_HW_ReadBufferTable(i, &gMemoryTable.data[n].bufImgIdx);
   }
   BM_HW_SetLocalDisableBuffer(pBufferCtrl); // Also clears hardware table
   gMemoryTable.NbValidSequences += sequenceCount;
   FreeSpace = BufferManager_ComputeAvailableSpace();
   pGCRegs->MemoryBufferAvailableFreeSpaceHigh = FreeSpace >> 32;
   pGCRegs->MemoryBufferAvailableFreeSpaceLow  = FreeSpace & 0x00000000FFFFFFFF;
   FragSpace = BufferManager_ComputeTotalFragmentedSpace();
   pGCRegs->MemoryBufferFragmentedFreeSpaceHigh = FragSpace >> 32;
   pGCRegs->MemoryBufferFragmentedFreeSpaceLow  = FragSpace & 0x00000000FFFFFFFF;
   GC_SetMemoryBufferSequenceCount(gMemoryTable.NbValidSequences); // Shared Register write
   BufferManager_UpdateSequenceMaxParameters(&gcRegsData);
   if(!sequenceOffset) // Update selected parameters if first sequence was just recorded
      BufferManager_UpdateSelectedSequenceParameters(pGCRegs);
   GC_SetMemoryBufferStatus(MBS_Idle);
}

/**
 * Configure the hardware frame duration in read mode.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 *
 * @return void.
 */
static void BufferManager_HW_ConfigureMinFrameTime(t_bufferManager *pBufferCtrl, bool newDownload)
{
   const float clk_freq_MHz = CLK_DATA_FREQ_HZ / 1E6;
   static uint32_t frameSize; // frame size, including header [pixels]
   float timeout_delay_us; // configured delay between frames, [us]
   float maxBandWidth; // maximum average bit rate as requested by the client [bps]
   uint32_t cnt;

   if(newDownload)
      frameSize = gcRegsData.Width * (gcRegsData.Height + 2);

   maxBandWidth = gcRegsData.MemoryBufferSequenceDownloadBitRateMax; // Mb/s (1.0e6)
   timeout_delay_us = frameSize * BM_BITS_PER_PIXEL / maxBandWidth;
   timeout_delay_us = MIN(timeout_delay_us, BM_MAX_FRAME_PERIOD_US);
   cnt = timeout_delay_us * clk_freq_MHz;

   if(newDownload)
   {
      BUFFERING_INF("Initiating sequence/image download from the memory buffer");
      BUFFERING_INF("max output average bit rate target: " _PCF(2) " Mbps", _FFMT(maxBandWidth,2));
      BUFFERING_INF("max output frame rate: " _PCF(2) "Hz", _FFMT(1.0e6/timeout_delay_us, 2));
   }

   AXI4L_write32(cnt, pBufferCtrl->ADD + BM_MIN_FRAME_TIME);
}

/**
 * Get FrameID value from an image.
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param SequenceID Number of the sequence where the image is.
 * @param ImageID Location of the image inside the sequence.
 *
 * @return FrameID value.
 */
static uint32_t BufferManager_HW_GetFrameId(uint32_t SequenceID, uint32_t ImageID)
{
   uint64_t readAddrLoc;
   struct seqInfo *seqInfo;

   //readAddrLoc = BaseAddr + sequence offset + image offset + FrameIdReg offset

   // In External Storage, Memory 0 contains even images and memory 1 contains odd images, so begin with the right base address
   readAddrLoc = MEM0_BUFFER_BASEADDR;
#if BM_NB_MEMORY_ADDR_SPACES==2
   if (ImageID % 2) // odd
      readAddrLoc = MEM1_BUFFER_BASEADDR;
#elif BM_NB_MEMORY_ADDR_SPACES>2
   #error "Unsupported number of memory address spaces"
#endif
   // Add sequence start address (offset) in memory, image offset and FrameIdReg offset
   seqInfo = &gMemoryTable.data[SequenceID];
   readAddrLoc += ((uint64_t)seqInfo->startAddress << BM_ADDRBITS_ALIGN) +
                  (uint64_t)BM_IMAGE_MEM_IDX(ImageID) * (uint64_t)BM_IMAGE_SIZE_BYTE +
                  FrameIDHdrAddr;

#ifdef FPGA_STORAGE
   // Convert address location to GPIO + AXI4L_32
   // Set GPIO values with the part that multiplies the address space
   GPIO_SetMemAddrMsb((uint32_t)(readAddrLoc / BM_AXIL_BUFDDR_SIZE));
   // Take only the part that fits in the address space
   readAddrLoc = (readAddrLoc % BM_AXIL_BUFDDR_SIZE + BM_AXIL_BUFDDR_BASE_ADDR);
#endif

   return AXI4L_read32((uint32_t)readAddrLoc);
}

/**
 * Set Hardware AXI Switch config for buffer data flow
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 *
 * @return void.
 */
void BufferManager_HW_SetSwitchConfig(t_bufferManager *pBufferCtrl)
{
   if(BM_MemoryBufferRead)
   {
      if (GC_ExternalMemoryBufferIsImplemented)
         AXI4L_write32(BM_SWITCH_EXTERNAL_PLAYBACK, pBufferCtrl->ADD + BM_SWITCH_CONFIG);
      else
         AXI4L_write32(BM_SWITCH_INTERNAL_PLAYBACK, pBufferCtrl->ADD + BM_SWITCH_CONFIG);
   }
   else
   {
      if (GC_ExternalMemoryBufferIsImplemented)
         AXI4L_write32(BM_SWITCH_EXTERNAL_LIVE, pBufferCtrl->ADD + BM_SWITCH_CONFIG);
      else
         AXI4L_write32(BM_SWITCH_INTERNAL_LIVE, pBufferCtrl->ADD + BM_SWITCH_CONFIG);
   }
   BUFFERING_DBG("SetSwitchConfig");
}

/**
 * Set Hardware MOI config
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 *
 * @return void.
 */
void BufferManager_HW_SetMoiConfig(t_bufferManager *pBufferCtrl)
{
   // Config MOI source
   switch (gcRegsData.MemoryBufferMOISource)
   {
      case MBMOIS_AcquisitionStarted:
      default:
         AXI4L_write32(BM_NO_MOI, pBufferCtrl->ADD + BM_MOI_SOURCE);
         break;

      case MBMOIS_Software:
         AXI4L_write32(BM_SOFTARE_MOI, pBufferCtrl->ADD + BM_MOI_SOURCE);
         break;

      case MBMOIS_ExternalSignal:
         AXI4L_write32(BM_EXTERNAL_MOI, pBufferCtrl->ADD + BM_MOI_SOURCE);
         break;

      case MBMOIS_None: // Do nothing ! Buffer is stopped !
         break;
   }

   // Config MOI activation
   switch (gcRegsData.MemoryBufferMOIActivation)
   {
      case MBMOIA_RisingEdge:
      default:
         AXI4L_write32(RISING_EDGE, pBufferCtrl->ADD + BM_MOI_ACTIVATION);
         break;

      case MBMOIA_FallingEdge:
         AXI4L_write32(FALLING_EDGE, pBufferCtrl->ADD + BM_MOI_ACTIVATION);
         break;

      case MBMOIA_AnyEdge:
         AXI4L_write32(ANY_EDGE, pBufferCtrl->ADD + BM_MOI_ACTIVATION);
         break;
   }

   BUFFERING_DBG("SetMoiConfig");
}

/**
 * Set Hardware MOI config
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 *
 * @return void.
 */
void BufferManager_HW_SendSoftwareMoi(t_bufferManager *pBufferCtrl)
{
   AXI4L_write32( 1, pBufferCtrl->ADD + BM_SOFT_MOI_SIG);
   AXI4L_write32( 0, pBufferCtrl->ADD + BM_SOFT_MOI_SIG);
   BUFFERING_INF("Software MOI");
}

/**
 * Get Hardware Write Sequence Completed
 * Direct Internal Buffer Hardware Access Function Prototypes for Actualization/ImageCorrection
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 *
 * @return void.
 */
uint32_t BufferManager_HW_GetDirectInternalBufferSequenceRecordedSize(t_bufferManager *pBufferCtrl, uint32_t seqSelector)
{
   t_bufferTable SequenceTable;

   if(seqSelector>=BM_HW_GetLocalSequenceCount(pBufferCtrl))
      return 0;
   BufferManager_HW_ReadBufferTable(seqSelector, &SequenceTable);
   if(SequenceTable.start_img > SequenceTable.stop_img)
      return pBufferCtrl->nbImagePerSeq - SequenceTable.start_img + SequenceTable.stop_img + 1;
   else
      return SequenceTable.stop_img - SequenceTable.start_img + 1;
}

/**
 * Load hardware table for debug purposes (only works with the internal buffer [without the external storage board])
 * Direct Internal Buffer Hardware Access Function Prototypes for Actualization/ImageCorrection
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param pGCRegs Pointer to the Genicam registers.
 *
 * @return void.
 */
void BufferManager_HW_ForceLoadInternalBufferTable(t_bufferManager *pBufferCtrl, gcRegistersData_t *pGCRegs)
{
   if(!GC_ExternalMemoryBufferIsImplemented)
      BufferManager_HW_DownloadBufferTable(pBufferCtrl, pGCRegs);
}

/**
 * Set Hardware Configuration
 * Direct Internal Buffer Hardware Access Function Prototypes for Actualization/ImageCorrection
 *
 * @param pBufferCtrl Pointer to the Buffer Manager controller instance.
 * @param pGCRegs Pointer to the Genicam registers.
 * @param uint32_t number of sequences (0 to disable buffer)
 * @param uint32_t sequence size
 * @param uint32_t pre-MOI size
 *
 * @return void.
 */
void BufferManager_HW_ForceDirectInternalBufferWriteConfig(t_bufferManager *pBufferCtrl, gcRegistersData_t *pGCRegs, \
                                                           uint32_t nbSeq, uint32_t seqSize, uint32_t preMOISize)
{
   // Internal Software Buffer Table must be empty
   if(!gMemoryTable.NbValidSequences)
   {
      // Turn Off Memory Buffer Driver => work with Hardware Memory Buffer Only
      pGCRegs->MemoryBufferMode = MBM_Off;

      // Force data routing to internal buffer live
      AXI4L_write32(BM_SWITCH_INTERNAL_LIVE, pBufferCtrl->ADD + BM_SWITCH_CONFIG);

      // Disable buffer and clear hardware table
      BM_HW_SetLocalDisableBuffer(pBufferCtrl);

      // Done if nb sequences or size to acquire == 0
      if(!nbSeq || !seqSize) return;

      pBufferCtrl->Mem0_base_addr   = MEM0_BUFFER_BASEADDR;
      pBufferCtrl->Mem1_base_addr   = MEM1_BUFFER_BASEADDR;
      pBufferCtrl->nbSequenceMax    = nbSeq;
      pBufferCtrl->nbImagePerSeq    = seqSize;
      pBufferCtrl->FrameSize        = BM_COMPUTE_FRAMESIZE(pGCRegs->Width,pGCRegs->Height); // In pixel
      pBufferCtrl->BufferMode       = BM_WRITE;
      pBufferCtrl->HDR_Size         = pGCRegs->Width*4; // In bytes (2 lines * 2 bytes/pixel)
      pBufferCtrl->IMG_Size         = pGCRegs->Width*pGCRegs->Height*2; // In bytes (2 bytes/pixel)
      pBufferCtrl->nb_img_pre       = preMOISize;
      pBufferCtrl->nb_img_post      = pBufferCtrl->nbImagePerSeq - pBufferCtrl->nb_img_pre;
      pBufferCtrl->clear_memory     = 0;
      pBufferCtrl->acq_stop         = 0;
      WriteStruct(pBufferCtrl);

      BM_HW_SetLocalEnableBuffer(pBufferCtrl);
   }
}

void BufferManager_UpdateSuggestedFrameImageCount(gcRegistersData_t *pGCRegs)
{
   uint32_t NbPixPerSubFrame;
   uint32_t suggestedFrameImageCount;

   if (BM_MemoryBufferSequence)
   {
      NbPixPerSubFrame = (pGCRegs->MemoryBufferSequenceHeight + 2)*pGCRegs->MemoryBufferSequenceWidth;
      suggestedFrameImageCount = MIN(BM_FRAME_IMG_COUNT_PAYLOAD_SIZE_MIN/NbPixPerSubFrame, pGCRegs->MemoryBufferSequenceDownloadFrameCount);
   }
   else
   {
      suggestedFrameImageCount = 1;
   }

   GC_SetMemoryBufferSequenceDownloadSuggestedFrameImageCount(suggestedFrameImageCount);
}
