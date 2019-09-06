/**
* @file CDMA_DefragMem.c
 * CDMA Defrag sub-module header file.
 *
 * CDMA Defrag perform defragmentation of the memory by removing
 * deleted sequences and concatenating free space all together
 * at the end of memory space.
 *
 * $Rev: 19874 $
 * $Author: odionne $
 * $Date: 2017-01-11 10:54:00 -0500 (mer., 11 janv. 2017) $
 * $Id: BufferManager.c 19874 2017-01-11 15:54:00Z odionne $
 * $URL: http://einstein/svn/firmware/FIR-00257-Storage/branchs/2016-10-31%20-%20Bus%204%20pixels/src/Buffering/Drivers/BufferManager.c $
 *
 * (c) Copyright 2017 Telops Inc.
 */

#include "CDMA_DefragMem.h"
#include "xaxicdma.h"

// Global variables
XAxiCdma axiCDMA0, axiCDMA1;
t_memoryTable *gMemoryTablePtr;
t_CDM_functionPtr gDoneFunctionPtr = NULL;
t_CDM_functionPtr gErrFunctionPtr = NULL;
bool gDefragRequest = false;

// Private function prototypes
static cdmSequenceType_t CDMADefrag_SequenceType(struct seqInfo *seqInfo);
bool CDMADefrag_StartCopy(uint64_t *DstAddr, uint64_t *SrcAddr, uint64_t *Length);
u32 XAxiCdma_SimpleTransfer_64bitPatch(XAxiCdma *InstancePtr, uint64_t SrcAddr, uint64_t DstAddr,
        int Length, XAxiCdma_CallBackFn SimpleCallBack, void *CallbackRef);

/**
 * Initialize the CDMA Defrag sub-module.
 *
 * @param pMemoryTable Pointer to the Buffer Manager memory table.
 *
 * @return IRC_SUCCESS if successfully initialized.
 * @return IRC_FAILURE if failed to initialize.
 */
IRC_Status_t CDMADefrag_Init(t_memoryTable *pMemoryTable)
{
   XAxiCdma_Config *cfgPtr0, *cfgPtr1;
   uint32_t status0, status1;

   gDefragRequest = false;
   gMemoryTablePtr = pMemoryTable;

   // Initialize both CDMAs
   cfgPtr0 = XAxiCdma_LookupConfig(XPAR_AXICDMA_0_DEVICE_ID);
   cfgPtr1 = XAxiCdma_LookupConfig(XPAR_AXICDMA_1_DEVICE_ID);
   if(!cfgPtr0 || !cfgPtr1)
   {
      // TOTO generate ERROR
      BUFFERING_ERR("CDMA config lookup failure.");
      return IRC_FAILURE;
   }
   status0 = XAxiCdma_CfgInitialize(&axiCDMA0, cfgPtr0, cfgPtr0->BaseAddress);
   status1 = XAxiCdma_CfgInitialize(&axiCDMA1, cfgPtr1, cfgPtr1->BaseAddress);
   if(status0 != XST_SUCCESS || status1 != XST_SUCCESS)
   {
      // TOTO generate ERROR
      BUFFERING_ERR("CDMA initialization failure.");
      return IRC_FAILURE;
   }
   XAxiCdma_IntrDisable(&axiCDMA0, XAXICDMA_XR_IRQ_ALL_MASK);
   XAxiCdma_IntrDisable(&axiCDMA1, XAXICDMA_XR_IRQ_ALL_MASK);

   return IRC_SUCCESS;
}

/**
 * Starts a defrag procedure in the CDMA Defrag sub-module.
 *
 * @param doneFuncPtr Pointer to the function to be called when defrag is completed.
 * @param errFuncPtr  Pointer to the function to be called when defrag generates an error.
 * @param funcParam   Parameter that will be passed to previous functions.
 *
 * @return void
 */
bool CDMADefrag_StartDefrag(t_CDM_functionPtr doneFuncPtr, t_CDM_functionPtr errFuncPtr)
{
   if(gDefragRequest || XAxiCdma_IsBusy(&axiCDMA0) || XAxiCdma_IsBusy(&axiCDMA1))
   {
      BUFFERING_DBG("Defragger busy.");
      return false;
   }
   XAxiCdma_Reset(&axiCDMA0);
   XAxiCdma_Reset(&axiCDMA1);

   gDefragRequest = true;
   gDoneFunctionPtr = doneFuncPtr;
   gErrFunctionPtr = errFuncPtr;
   return true;
}

/**
 * CDMA Compute Sequence Fragmented Space
 *
 * @param Sequence selector Index
 *
 * @return (uint64_t) Fragmended space (bytes)
 */
uint64_t CDMADefrag_ComputeSequenceFragmentedSpace(uint32_t sequenceSelector)
{
   struct seqInfo *seqInfo;
   cdmSequenceType_t seqType;

   seqInfo = &(gMemoryTablePtr->data[sequenceSelector]);
   seqType = CDMADefrag_SequenceType(seqInfo);
   switch(seqType)
   {
      case CDM_FULL:
         return 0;

      case CDM_FREESPACE_BEFORE:
         return (uint64_t)BM_START_IMAGE*(uint64_t)BM_IMAGE_SIZE_BYTE;

      case CDM_FREESPACE_AFTER:
         return (uint64_t)(seqInfo->bufferLength-(BM_STOP_IMAGE+1))*(uint64_t)BM_IMAGE_SIZE_BYTE;

      case CDM_FREESPACE_BOTHENDS:
         return (uint64_t)(BM_START_IMAGE + seqInfo->bufferLength-(BM_STOP_IMAGE+1))*(uint64_t)BM_IMAGE_SIZE_BYTE;

      case CDM_FREESPACE_WITHIN:
         return (uint64_t)(BM_START_IMAGE-(BM_STOP_IMAGE+1))*(uint64_t)BM_IMAGE_SIZE_BYTE;

      case CDM_EMPTY: // Use next sequence start address : last sequence should never be empty !!!
         return ((uint64_t)(gMemoryTablePtr->data[sequenceSelector+1].startAddress-seqInfo->startAddress) << BM_ADDRBITS_ALIGN) * BM_NB_MEMORY_ADDR_SPACES;
   }
   return 0; // Should never happen !
}

/**
 * CDMA Defrag state machine
 *
 * @param void
 *
 * @return void
 */
void CDMADefrag_SM()
{
   #define BITS_ALIGN BM_ADDRBITS_ALIGN

   static cdmState_t cdmState = CDM_IDLE;
   static uint64_t DstAddr, SrcAddr, FullLength;
   static uint64_t DefragDstAddr, DefragSrcAddr, DefragFullLength;
   static uint32_t parsingStatus = CDM_SEARCH_HOLE; // 0: looking for free space (DstAddr), 1: looking for valid data (SrcAddr), 2: looking for end of data (FullLength), 3: ready for copy
   static int32_t NextDefragSequence = 0, NextFreeSequence = 0;
   static bool ReprocessAfterCopy = false;
   struct seqInfo *seqInfo;
   cdmSequenceType_t seqType;
   uint64_t NextSeqStart=0;
   uint32_t i, CDMAerr1, CDMAerr2;

   // State change SM
   switch (cdmState)
   {
      case CDM_IDLE:
         if(gDefragRequest)
         {
            if(XAxiCdma_ResetIsDone(&axiCDMA0) && XAxiCdma_ResetIsDone(&axiCDMA1))
            {
               if(gMemoryTablePtr->NbValidSequences)
                  cdmState = CDM_PARSE;
               else // No sequences in memory
                  cdmState = CDM_DONE;
            }
         }
         break;

      case CDM_PARSE:
         BUFFERING_DBG("State CDM_PARSE");
         cdmState = CDM_COPY;
         BUFFERING_DBG("State CDM_COPY");
         // break; NO! Continue to CDM_COPY and start Defrag immediately !

      case CDM_COPY:
         if(!DefragFullLength)
         {
            if(parsingStatus == CDM_SEARCH_COMPLETED)
            {
               cdmState = CDM_WAIT;
               BUFFERING_DBG("State CDM_WAIT");
            }
            else
               cdmState = CDM_PARSE;
         }
         break;

      case CDM_WAIT:
         if(!XAxiCdma_IsBusy(&axiCDMA0) && !XAxiCdma_IsBusy(&axiCDMA1))
            cdmState = CDM_DONE;
         break;

      case CDM_DONE:
         BUFFERING_DBG("State CDM_DONE");
         cdmState = CDM_IDLE;
         BUFFERING_DBG("State CDM_IDLE");
         break;

      default:
         break;
   }

   // State processing SM
   switch (cdmState)
   {
      case CDM_IDLE:
         NextDefragSequence = 0;
         NextFreeSequence = 0;
         parsingStatus = CDM_SEARCH_HOLE;
         ReprocessAfterCopy = false;
         break;

      case CDM_PARSE:
         for(; NextDefragSequence<gMemoryTablePtr->NbValidSequences; NextDefragSequence++)
         {
            seqInfo = &(gMemoryTablePtr->data[NextDefragSequence]);
            // Check if sequence is valid (or deleted)
            if(seqInfo->bufferLength)
            {
               // Valid Sequence
               // Backup end of data position in case it is the last sequence
               NextSeqStart = ((uint64_t)seqInfo->startAddress << BITS_ALIGN) + (uint64_t)BM_IMAGE_MEM_IDX(seqInfo->bufferLength)*(uint64_t)BM_IMAGE_SIZE_BYTE;
            }
            // Check if sequence contains free space
            seqType = CDMADefrag_SequenceType(seqInfo);
            switch(parsingStatus)
            {
               case CDM_SEARCH_HOLE: // CDM_SEARCH_HOLE is the first search state so NextDefragSequence==NextFreeSequence, except when ReprocessAfterCopy
                  switch(seqType)
                  {
                     case CDM_FULL:
                        NextFreeSequence++;
                        break;
                     case CDM_FREESPACE_BEFORE:
                        DstAddr = (uint64_t)seqInfo->startAddress << BITS_ALIGN;
                        SrcAddr = ((uint64_t)seqInfo->startAddress << BITS_ALIGN) + (uint64_t)BM_IMAGE_MEM_IDX(BM_START_IMAGE)*(uint64_t)BM_IMAGE_SIZE_BYTE;
                        parsingStatus = CDM_SEARCH_LENGTH;
                        seqInfo->bufferLength         -= BM_START_IMAGE;
                        seqInfo->bufImgIdx.stop_img   -= BM_START_IMAGE;
                        seqInfo->bufImgIdx.moi_img    -= BM_START_IMAGE;
                        seqInfo->bufImgIdx.start_img  -= BM_START_IMAGE;
                        NextFreeSequence++;
                        break;
                     case CDM_FREESPACE_AFTER:
                        DstAddr = ((uint64_t)seqInfo->startAddress << BITS_ALIGN) + (uint64_t)BM_IMAGE_MEM_IDX(BM_STOP_IMAGE+1)*(uint64_t)BM_IMAGE_SIZE_BYTE;
                        parsingStatus = CDM_SEARCH_DATA;
                        seqInfo->bufferLength =  BM_STOP_IMAGE+1;
                        NextFreeSequence++;
                        break;
                     case CDM_FREESPACE_BOTHENDS:
                        DstAddr = (uint64_t)seqInfo->startAddress << BITS_ALIGN;
                        SrcAddr = ((uint64_t)seqInfo->startAddress << BITS_ALIGN) + (uint64_t)BM_IMAGE_MEM_IDX(BM_START_IMAGE)*(uint64_t)BM_IMAGE_SIZE_BYTE;
                        FullLength = (uint64_t)BM_IMAGE_MEM_IDX(BM_STOP_IMAGE-BM_START_IMAGE+1)*(uint64_t)BM_IMAGE_SIZE_BYTE;
                        parsingStatus = CDM_SEARCH_DONE;
                        seqInfo->bufferLength          = BM_STOP_IMAGE-BM_START_IMAGE+1;
                        seqInfo->bufImgIdx.stop_img   -= BM_START_IMAGE;
                        seqInfo->bufImgIdx.moi_img    -= BM_START_IMAGE;
                        seqInfo->bufImgIdx.start_img  -= BM_START_IMAGE;
                        NextFreeSequence++;
                        break;
                     case CDM_FREESPACE_WITHIN:
                        DstAddr = ((uint64_t)seqInfo->startAddress << BITS_ALIGN) + (uint64_t)BM_IMAGE_MEM_IDX(BM_STOP_IMAGE+1)*(uint64_t)BM_IMAGE_SIZE_BYTE;
                        SrcAddr = ((uint64_t)seqInfo->startAddress << BITS_ALIGN) + (uint64_t)BM_IMAGE_MEM_IDX(BM_START_IMAGE)*(uint64_t)BM_IMAGE_SIZE_BYTE;
                        parsingStatus = CDM_SEARCH_LENGTH;
                        seqInfo->bufferLength         -= BM_START_IMAGE-BM_STOP_IMAGE-1;
                        if(seqInfo->bufImgIdx.moi_img > seqInfo->bufImgIdx.stop_img)
                           seqInfo->bufImgIdx.moi_img -= BM_START_IMAGE-BM_STOP_IMAGE-1;
                        seqInfo->bufImgIdx.start_img  -= BM_START_IMAGE-BM_STOP_IMAGE-1;
                        if(ReprocessAfterCopy)
                        {
                           // Copy immediately because there is a hole (sequence gap) after this sequence (it has already been moved before)
                           ReprocessAfterCopy = false;
                           FullLength = (uint64_t)BM_IMAGE_MEM_IDX(seqInfo->bufferLength-BM_START_IMAGE)*(uint64_t)BM_IMAGE_SIZE_BYTE;
                           parsingStatus = CDM_SEARCH_DONE;
                           gMemoryTablePtr->data[NextFreeSequence] = *seqInfo;
                        }
                        NextFreeSequence++;
                        break;
                     case CDM_EMPTY:
                        DstAddr = ((uint64_t)(seqInfo->startAddress)) << BITS_ALIGN;
                        parsingStatus++;
                        break;
                  }
                  break;
               case CDM_SEARCH_DATA:
                  switch(seqType)
                  {
                     case CDM_FULL:
                        SrcAddr = (uint64_t)seqInfo->startAddress << BITS_ALIGN;
                        parsingStatus = CDM_SEARCH_LENGTH;
                        seqInfo->startAddress         = DstAddr >> BITS_ALIGN;
                        gMemoryTablePtr->data[NextFreeSequence] = *seqInfo;
                        NextFreeSequence++;
                        break;
                     case CDM_FREESPACE_BEFORE:
                        SrcAddr = ((uint64_t)seqInfo->startAddress << BITS_ALIGN) + (uint64_t)BM_IMAGE_MEM_IDX(BM_START_IMAGE)*(uint64_t)BM_IMAGE_SIZE_BYTE;
                        parsingStatus = CDM_SEARCH_LENGTH;
                        seqInfo->startAddress          = DstAddr >> BITS_ALIGN;
                        seqInfo->bufferLength         -= BM_START_IMAGE;
                        seqInfo->bufImgIdx.stop_img   -= BM_START_IMAGE;
                        seqInfo->bufImgIdx.moi_img    -= BM_START_IMAGE;
                        seqInfo->bufImgIdx.start_img  -= BM_START_IMAGE;
                        gMemoryTablePtr->data[NextFreeSequence] = *seqInfo;
                        NextFreeSequence++;
                        break;
                     case CDM_FREESPACE_AFTER:
                        SrcAddr = (uint64_t)seqInfo->startAddress << BITS_ALIGN;
                        FullLength = (uint64_t)BM_IMAGE_MEM_IDX(BM_STOP_IMAGE+1)*(uint64_t)BM_IMAGE_SIZE_BYTE;
                        parsingStatus = CDM_SEARCH_DONE;
                        seqInfo->startAddress          = DstAddr >> BITS_ALIGN;
                        seqInfo->bufferLength          = BM_STOP_IMAGE+1;
                        gMemoryTablePtr->data[NextFreeSequence] = *seqInfo;
                        NextFreeSequence++;
                        break;
                     case CDM_FREESPACE_BOTHENDS:
                        SrcAddr = ((uint64_t)seqInfo->startAddress << BITS_ALIGN) + (uint64_t)BM_IMAGE_MEM_IDX(BM_START_IMAGE)*(uint64_t)BM_IMAGE_SIZE_BYTE;
                        FullLength = (uint64_t)BM_IMAGE_MEM_IDX(BM_STOP_IMAGE-BM_START_IMAGE+1)*(uint64_t)BM_IMAGE_SIZE_BYTE;
                        parsingStatus = CDM_SEARCH_DONE;
                        seqInfo->startAddress          = DstAddr >> BITS_ALIGN;
                        seqInfo->bufferLength          = BM_STOP_IMAGE-BM_START_IMAGE+1;
                        seqInfo->bufImgIdx.stop_img   -= BM_START_IMAGE;
                        seqInfo->bufImgIdx.moi_img    -= BM_START_IMAGE;
                        seqInfo->bufImgIdx.start_img  -= BM_START_IMAGE;
                        gMemoryTablePtr->data[NextFreeSequence] = *seqInfo;
                        NextFreeSequence++;
                        break;
                     case CDM_FREESPACE_WITHIN:
                        // Shift whole sequence and re-process on next iteration to ensure that buffer length stays at a multiple of image size
                        SrcAddr = (uint64_t)seqInfo->startAddress << BITS_ALIGN;
                        FullLength = (uint64_t)BM_IMAGE_MEM_IDX(seqInfo->bufferLength)*(uint64_t)BM_IMAGE_SIZE_BYTE;
                        parsingStatus = CDM_SEARCH_DONE;
                        seqInfo->startAddress         = DstAddr >> BITS_ALIGN;
                        ReprocessAfterCopy = true;
                        break;
                     case CDM_EMPTY:
                        break;
                  }
                  break;
               case CDM_SEARCH_LENGTH:
                  switch(seqType)
                  {
                     case CDM_FULL:
                        seqInfo->startAddress         -= (SrcAddr-DstAddr) >> BITS_ALIGN;
                        gMemoryTablePtr->data[NextFreeSequence] = *seqInfo;
                        NextFreeSequence++;
                        break;
                     case CDM_FREESPACE_AFTER:
                        FullLength = ((uint64_t)seqInfo->startAddress << BITS_ALIGN) + (uint64_t)BM_IMAGE_MEM_IDX(BM_STOP_IMAGE+1)*(uint64_t)BM_IMAGE_SIZE_BYTE - SrcAddr;
                        parsingStatus = CDM_SEARCH_DONE;
                        seqInfo->startAddress         -= (SrcAddr-DstAddr) >> BITS_ALIGN;
                        seqInfo->bufferLength          = BM_STOP_IMAGE+1;
                        gMemoryTablePtr->data[NextFreeSequence] = *seqInfo;
                        NextFreeSequence++;
                        break;
                     case CDM_FREESPACE_BEFORE:
                     case CDM_FREESPACE_BOTHENDS:
                     case CDM_FREESPACE_WITHIN:
                        // Copy previous data and Process this sequence afterwards
                        FullLength = ((uint64_t)seqInfo->startAddress << BITS_ALIGN) - SrcAddr;
                        parsingStatus = CDM_SEARCH_DONE;
                        NextDefragSequence--; // Process this sequence afterwards
                        break;
                     case CDM_EMPTY:
                        FullLength = ((uint64_t)seqInfo->startAddress << BITS_ALIGN) - SrcAddr;
                        parsingStatus++;
                        break;
                  }
                  break;
            }
            if(parsingStatus==CDM_SEARCH_DONE)
            {
               if(!ReprocessAfterCopy) NextDefragSequence++;
               break;
            }
         }
         if(parsingStatus==CDM_SEARCH_LENGTH)
         {
            // Last sequence reached: Set FullLenght for copy until end of last sequence
            FullLength = NextSeqStart - SrcAddr;
            parsingStatus = CDM_SEARCH_DONE;
         }
         if(parsingStatus!=CDM_SEARCH_DONE)
         {
            // Defrag completed, inform main state machine
            parsingStatus = CDM_SEARCH_COMPLETED;
            break;
         }
         DefragDstAddr = DstAddr;
         DefragSrcAddr = SrcAddr;
         DefragFullLength = FullLength;

         // break; NO! Continue to CDM_COPY and start Defrag immediately !

      case CDM_COPY:
         if(DefragFullLength == 0)
            break;
         if(XAxiCdma_IsBusy(&axiCDMA0) || XAxiCdma_IsBusy(&axiCDMA1))
            break;
         CDMAerr1 = XAxiCdma_GetError(&axiCDMA0);
         CDMAerr2 = XAxiCdma_GetError(&axiCDMA1);
         if(CDMAerr1 || CDMAerr2)
         {
            BUFFERING_ERR("CDMA error: CDMAerr1 = 0x%08x, CDMAerr2 = 0x%08x.",
                          CDMAerr1, CDMAerr2);
            (*gErrFunctionPtr)();
         }
         if(!CDMADefrag_StartCopy(&DefragDstAddr, &DefragSrcAddr, &DefragFullLength))
         {
            (*gErrFunctionPtr)();
         }
         if(DefragFullLength && (DefragFullLength < BM_BYTES_ALIGN))
         {
            BUFFERING_ERR("Defrag full length misaligned.");
            (*gErrFunctionPtr)();
            DefragFullLength = 0;
         }

         // Set state for next defrag loop
         if(ReprocessAfterCopy)
         {
            // Re-processing sequence with free-space within. Search for hole.
            parsingStatus = CDM_SEARCH_HOLE;
         }
         else if(NextDefragSequence < gMemoryTablePtr->NbValidSequences)
         {
            // Copy generates a hole. Search for data.
            DstAddr += FullLength;
            parsingStatus = CDM_SEARCH_DATA;
         }
         else
         {
            // Defrag completed, inform main state machine
            parsingStatus = CDM_SEARCH_COMPLETED;
         }

         break;

      case CDM_WAIT:
         break;

      case CDM_DONE:
         if(XAxiCdma_GetError(&axiCDMA0) || XAxiCdma_GetError(&axiCDMA1))
         {
            BUFFERING_ERR("CDMA error: CDMAerr1 = 0x%08x, CDMAerr2 = 0x%08x.",
                          CDMAerr1, CDMAerr2);
            (*gErrFunctionPtr)();
         }
         for(i=NextFreeSequence; i<gMemoryTablePtr->NbValidSequences; i++)
         {
            gMemoryTablePtr->data[i].bufferLength = 0;
         }
         gMemoryTablePtr->NbValidSequences = NextFreeSequence;
         gDefragRequest = false;
         if(gDoneFunctionPtr)
            (*gDoneFunctionPtr)();
         break;

      default:
         break;
   }
}

cdmSequenceType_t CDMADefrag_SequenceType(struct seqInfo *seqInfo)
{
   #define START  ((int32_t)seqInfo->bufImgIdx.start_img)
   #define STOP   ((int32_t)seqInfo->bufImgIdx.stop_img)
   #define LENGTH seqInfo->bufferLength
   #define MULT   ((int32_t)BM_NB_MEMORY_ADDR_SPACES)
   bool spaceBefore = true;
   bool spaceAfter = true;

   if(!LENGTH)
      return CDM_EMPTY;

   if((START==0 && STOP==LENGTH-1) || (STOP==START-1) || (LENGTH==1))
      return CDM_FULL;  // Sequence is full

   if(STOP >= START)
   {
      // No wrap-around of circular buffer sequence
      if(START < MULT)        spaceBefore = false;
      if(STOP >= LENGTH-MULT) spaceAfter = false;

      if(spaceBefore && !spaceAfter)   return CDM_FREESPACE_BEFORE;
      if(!spaceBefore && spaceAfter)   return CDM_FREESPACE_AFTER;
      if(spaceBefore && spaceAfter)    return CDM_FREESPACE_BOTHENDS;
      return CDM_FULL;
   }
   else
   {
      // Wrap-around of circular buffer sequence occurred
      if((START - STOP) - (START%MULT) - (-STOP%MULT+MULT)) // For equation details, see "F:\Projets\DP1608 – IRCam Next GenSoft Phase1\Technique\BufferDev\equation_FragSpaceWithinSequence.xlsx"
         return CDM_FREESPACE_WITHIN;
      return CDM_FULL;
   }
}

bool CDMADefrag_StartCopy(uint64_t *DstAddr, uint64_t *SrcAddr, uint64_t *FullLength)
{
   uint32_t Length, status0, status1;

   BUFFERING_DBG("CDMADefrag_StartCopy: DstAddr=0x%08x%08x, SrcAddr=0x%08x%08x, FullLength=0x%08x%08x.",
                 *DstAddr >> 32, *DstAddr & 0x00000000ffffffffull,
                 *SrcAddr >> 32, *SrcAddr & 0x00000000ffffffffull,
                 *FullLength >> 32, *FullLength & 0x00000000ffffffffull);

   // Align to MEM_BUFFER_BYTES_ALIGN bytes
   if(*FullLength > XAXICDMA_MAX_TRANSFER_LEN) // Limit transfer length to maximal DMA transfer length
      Length = (((uint32_t)XAXICDMA_MAX_TRANSFER_LEN) >> BM_ADDRBITS_ALIGN) << BM_ADDRBITS_ALIGN;
   else
      Length = (((uint32_t)*FullLength) >> BM_ADDRBITS_ALIGN) << BM_ADDRBITS_ALIGN;

   // Use patched function to use 64-bit CDMA address with 32-bit Microblaze (bypass UINTPTR data type)
   status0 = XAxiCdma_SimpleTransfer_64bitPatch(&axiCDMA0, MEM0_BUFFER_BASEADDR + *SrcAddr, MEM0_BUFFER_BASEADDR + *DstAddr, Length, NULL, NULL);
   status1 = XAxiCdma_SimpleTransfer_64bitPatch(&axiCDMA1, MEM1_BUFFER_BASEADDR + *SrcAddr, MEM1_BUFFER_BASEADDR + *DstAddr, Length, NULL, NULL);
   *DstAddr += Length;
   *SrcAddr += Length;
   *FullLength -= Length;
   if(status0 != XST_SUCCESS || status1 != XST_SUCCESS)
   {
      BUFFERING_ERR("CDMA transfer failure: status0=0x%08x, status1=0x%08x.",
                    status0, status1);
      return false;
   }

   return true;
}

/*****************************************************************************/
// JDE 2017-05-03
// THIS IS A PATCH TO USE A 64-BIT ADDRESS CDMA IN A 32-BIT ADDRESS MICROBLAZE (bypass UINTPTR data type)
// SIMPLE MODE CHECK REMOVED ! CDMA NEEDS TO BE IN SIMPLE MODE BEFORE USING THIS FUNCTION !
/*****************************************************************************/
/**
 * This function does one simple transfer submission
 *
 * It checks in the following sequence:
 * - if engine is busy, cannot submit
 * - if software is still handling the completion of the previous simple
 *    transfer, cannot submit
 * - if engine is in SG mode and cannot switch to simple mode, cannot submit
 *
 * @param   InstancePtr is the pointer to the driver instance
 * @param   SrcAddr is the address of the source buffer
 * @param   DstAddr is the address of the destination buffer
 * @param   Length is the length of the transfer
 * @param   SimpleCallBack is the callback function for the simple transfer
 * @param   CallBackRef is the callback reference pointer
 *
 * @return
 *    - XST_SUCCESS for success of submission
 *    - XST_FAILURE for submission failure, maybe caused by:
 *       Another simple transfer is still going
 *   .      Another SG transfer is still going
 *    - XST_INVALID_PARAM if:
 *    Length out of valid range [1:8M]
 *    Or, address not aligned when DRE is not built in
 *
 * @note Only set the callback function if using interrupt to signal
 *    the completion.If used in polling mode, please set the callback
 *       function to be NULL.
 *
 *****************************************************************************/
u32 XAxiCdma_SimpleTransfer_64bitPatch(XAxiCdma *InstancePtr, uint64_t SrcAddr, uint64_t DstAddr,
   int Length, XAxiCdma_CallBackFn SimpleCallBack, void *CallBackRef)
{
   u32 WordBits;

   if ((Length < 1) || (Length > XAXICDMA_MAX_TRANSFER_LEN)) {
      return XST_INVALID_PARAM;
   }

   WordBits = (u32)(InstancePtr->WordLength - 1);

   if ((SrcAddr & WordBits) || (DstAddr & WordBits)) {

      if (!InstancePtr->HasDRE) {
         xdbg_printf(XDBG_DEBUG_ERROR,
             "Unaligned transfer without DRE %x/%x\r\n",
             (unsigned int)SrcAddr, (unsigned int)DstAddr);

         return XST_INVALID_PARAM;
      }
   }

   /* If the engine is doing transfer, cannot submit
    */
   if (XAxiCdma_IsBusy(InstancePtr)) {
      xdbg_printf(XDBG_DEBUG_ERROR, "Engine is busy\r\n");

      return XST_FAILURE;
   }

   /* The driver is still handling the previous simple transfer
    */
   if (InstancePtr->SimpleNotDone) {
      xdbg_printf(XDBG_DEBUG_ERROR, "Simple ongoing\r\n");

      return XST_FAILURE;
   }

   /* Setup the flag so that others will not step on us
    *
    * This flag is only set if callback function is used and if the
    * system is in interrupt mode; otherwise, when the hardware is done
    * with the transfer, the driver is done with the transfer
    */
   if ((SimpleCallBack != NULL) ||
          ((XAxiCdma_IntrGetEnabled(InstancePtr) &
           XAXICDMA_XR_IRQ_SIMPLE_ALL_MASK) != 0x0)) {

      InstancePtr->SimpleNotDone = 1;
   }

   InstancePtr->SimpleCallBackFn = SimpleCallBack;
   InstancePtr->SimpleCallBackRef = CallBackRef;

   XAxiCdma_WriteReg(InstancePtr->BaseAddr, XAXICDMA_SRCADDR_OFFSET,
           LOWER_32_BITS(SrcAddr));
   if (InstancePtr->AddrWidth > 32)
      XAxiCdma_WriteReg(InstancePtr->BaseAddr,
              XAXICDMA_SRCADDR_MSB_OFFSET,
              UPPER_32_BITS(SrcAddr));

   XAxiCdma_WriteReg(InstancePtr->BaseAddr, XAXICDMA_DSTADDR_OFFSET,
           LOWER_32_BITS(DstAddr));
   if (InstancePtr->AddrWidth > 32)
      XAxiCdma_WriteReg(InstancePtr->BaseAddr,
              XAXICDMA_DSTADDR_MSB_OFFSET,
              UPPER_32_BITS(DstAddr));

   /* Writing to the BTT register starts the transfer
    */
   XAxiCdma_WriteReg(InstancePtr->BaseAddr, XAXICDMA_BTT_OFFSET,
      Length);

   return XST_SUCCESS;
}
