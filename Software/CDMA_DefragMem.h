/**
* @file CDMA_DefragMem.h
 * CDMA Defrag sub-module header file.
 *
 * CDMA Defrag perform defragmentation of the memory by removing
 * deleted sequences and concatenating free space all together
 * at the end of memory space.
 *
 * $Rev: 19874 $
 * $Author: odionne $
 * $Date: 2017-01-11 10:54:00 -0500 (mer., 11 janv. 2017) $
 * $Id: BufferManager.h 19874 2017-01-11 15:54:00Z odionne $
 * $URL: http://einstein/svn/firmware/FIR-00257-Storage/branchs/2016-10-31%20-%20Bus%204%20pixels/src/Buffering/Drivers/BufferManager.h $
 *
 * (c) Copyright 2017 Telops Inc.
 */

#ifndef CDMA_DEFRAGMEM_H
#define CDMA_DEFRAGMEM_H

/***************************** Include Files ********************************/
#include "IRC_Status.h"
#include "BufferManager.h"

/************************** Constant Definitions ****************************/

/**************************** Type Definitions ******************************/
typedef void (*t_CDM_functionPtr)();

typedef enum
{
   CDM_IDLE = 0,
   CDM_PARSE,
   CDM_COPY,
   CDM_WAIT,
   CDM_DONE
} cdmState_t;

typedef enum
{
   CDM_SEARCH_HOLE = 0,
   CDM_SEARCH_DATA,
   CDM_SEARCH_LENGTH,
   CDM_SEARCH_DONE,
   CDM_SEARCH_COMPLETED
} cdmParsingState_t;

typedef enum
{
   CDM_FULL = 0,
   CDM_FREESPACE_BEFORE,
   CDM_FREESPACE_AFTER,
   CDM_FREESPACE_BOTHENDS,
   CDM_FREESPACE_WITHIN,
   CDM_EMPTY
} cdmSequenceType_t;

/***************** Macros (Inline Functions) Definitions ********************/

/************************** Function Prototypes *****************************/
IRC_Status_t CDMADefrag_Init(t_memoryTable *pMemoryTable);
bool CDMADefrag_StartDefrag(t_CDM_functionPtr doneFuncPtr, t_CDM_functionPtr errFuncPtr);
uint64_t CDMADefrag_ComputeSequenceFragmentedSpace(uint32_t sequenceSelector);
void CDMADefrag_SM();

#endif // CDMA_DEFRAGMEM_H
