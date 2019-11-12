/**
 * @file BufferManager.h
 * Buffer Manager module header file.
 * 
 * Buffer Manager controls the start/stop of the buffering mode and
 * the sequence reading and deleting commands.
 *
 * $Rev: 20466 $
 * $Author: jdery $
 * $Date: 2017-05-19 11:20:05 -0400 (ven., 19 mai 2017) $
 * $Id: BufferManager.h 20466 2017-05-19 15:20:05Z jdery $
 * $URL: http://einstein/svn/firmware/FIR-00251-Common/branchs/2017-03-30%20Forrest%20Gump%20BufferDefrag%20Branch/Software/BufferManager.h $
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef BUFFERMANAGER_H
#define BUFFERMANAGER_H


/***************************** Include Files ********************************/
#include "GC_Registers.h"
#include "IRC_Status.h"
#include "tel2000_param.h"
#include "mb_axi4l_bridge.h"
#include "verbose.h"
#include <stdint.h>
#include <stdbool.h>


/************************** Macro Definitions ****************************/
#ifdef BUFFERING_VERBOSE
   #define BUFFERING_PRINTF(fmt, ...)    FPGA_PRINTF("BUF: " fmt, ##__VA_ARGS__)
#else
   #define BUFFERING_PRINTF(fmt, ...)    DUMMY_PRINTF("BUF: " fmt, ##__VA_ARGS__)
#endif
#define BUFFERING_ERR(fmt, ...)          FPGA_PRINTF("BUF: Error: " fmt "\n", ##__VA_ARGS__)
#define BUFFERING_INF(fmt, ...)          FPGA_PRINTF("BUF: Info: " fmt "\n", ##__VA_ARGS__)
#define BUFFERING_DBG(fmt, ...)          BUFFERING_PRINTF("Debug: " fmt "\n", ##__VA_ARGS__)

/************************** Constant Definitions ****************************/
#define BM_SEQ_SIZE_MIN                      BM_NB_MEMORY_ADDR_SPACES
#define BM_SEQ_SIZE_INC                      BM_NB_MEMORY_ADDR_SPACES
#define BM_READY_TIMEOUT_IN_S                10       // seconds
#define BM_WRITE_COMPLETION_TIMEOUT_IN_MS    1000     // ms
#define BM_BITS_PER_PIXEL                    16       // 2 bytes
#define BM_MAX_FRAME_PERIOD_US               (20e6)   // 0.05 Hz min
#define BM_NB_SEQ_MIN                        1



// NTx-mini on board memory is configured for 28 Mb (32Mb*0.875) 
#define BM_FRAME_IMG_COUNT_PAYLOAD_SIZE_MIN 990720 // = 12 frames x 320x258 (15.11719 Mb), 3 frames in 640x514, 1 frame in 1280x1026

/**
 * Memory address map.
 */
#ifdef FPGA_STORAGE
   #define MEM0_BUFFER_BASEADDR        ((uint64_t)TEL_PAR_TEL_dimm0_ctrl_memaddr_BASEADDR)
   #define MEM0_BUFFER_HIGHADDR        ((uint64_t)TEL_PAR_TEL_dimm0_ctrl_memaddr_HIGHADDR)
   #define MEM0_BUFFER_SIZE            ((uint64_t)(MEM0_BUFFER_HIGHADDR - MEM0_BUFFER_BASEADDR + 1))

   #define MEM1_BUFFER_BASEADDR        ((uint64_t)TEL_PAR_TEL_dimm1_ctrl_memaddr_BASEADDR)
   #define MEM1_BUFFER_HIGHADDR        ((uint64_t)TEL_PAR_TEL_dimm1_ctrl_memaddr_HIGHADDR)
   #define MEM1_BUFFER_SIZE            ((uint64_t)(MEM1_BUFFER_HIGHADDR - MEM1_BUFFER_BASEADDR + 1))

   #define BM_AXIL_BUFDDR_BASE_ADDR    XPAR_AXIL_MEM_OUT_BASEADDR
   #define BM_AXIL_BUFDDR_SIZE         ((uint32_t)(XPAR_AXIL_MEM_OUT_HIGHADDR - XPAR_AXIL_MEM_OUT_BASEADDR + 1))

   #define BM_USE_CDMA
   #define BM_NB_MEMORY_ADDR_SPACES    2     // MEM0_BUFFER_SIZE == MEM1_BUFFER_SIZE
   #define BM_ADDRBITS_ALIGN           6     // 6 address bits (64 bytes, 32 pixels, 512 data bits = CDMA data width)
#endif
#ifdef FPGA_PROC
#include "proc_memory.h"
   #define MEM0_BUFFER_BASEADDR        ((uint64_t)PROC_MEM_MEMORY_BUFFER_BASEADDR)
   #define MEM0_BUFFER_HIGHADDR        ((uint64_t)PROC_MEM_MEMORY_BUFFER_HIGHADDR)
   #define MEM0_BUFFER_SIZE            ((uint64_t)(MEM0_BUFFER_HIGHADDR - MEM0_BUFFER_BASEADDR + 1))

   #define MEM1_BUFFER_BASEADDR        0
   #define MEM1_BUFFER_HIGHADDR        0
   #define MEM1_BUFFER_SIZE            0

   #define BM_AXIL_BUFDDR_BASE_ADDR    PROC_MEM_MEMORY_BUFFER_BASEADDR
   #define BM_AXIL_BUFDDR_SIZE         PROC_MEM_MEMORY_BUFFER_SIZE

   #define BM_NB_MEMORY_ADDR_SPACES    1
   #define BM_ADDRBITS_ALIGN           3     // 3 address bits (8 bytes, 4 pixels, 64 bits)

#endif

#ifndef BM_USE_CDMA
   #define CDMADefrag_SM()             ((void)0)   // Defrag not available if no CDMA implemented
#endif

#define BM_TOTAL_SPACE_BYTES        (MEM0_BUFFER_SIZE+MEM1_BUFFER_SIZE)

#if defined TELOPS_DEBUG && defined FPGA_STORAGE
   #define BM_MAX_SEQUENCE          256   // Full software buffer table does not fit in Storage microblaze BRAM in debug mode. Reduce size for debug.
#else
   #define BM_MAX_SEQUENCE          1024
#endif
#define BM_ADDRPIX_ALIGN         (BM_ADDRBITS_ALIGN-1)      // 2 bytes per pixel
#define BM_BYTES_ALIGN           (1<<BM_ADDRBITS_ALIGN)     // 64 bytes (512 data bits = CDMA bus width)
#define BM_PIXELS_ALIGN          (1<<BM_ADDRPIX_ALIGN)      // 32 pixels (512 data bits = CDMA bus width)
#define BM_COMPUTE_FRAMESIZE(w,h) ((((uint32_t)w*((uint32_t)h+2)+BM_PIXELS_ALIGN-1)>>BM_ADDRPIX_ALIGN)<<BM_ADDRPIX_ALIGN)  // In pixel (+2 for header lines)
#define BM_IMAGE_MEM_IDX(ID)     ((uint32_t)ID/BM_NB_MEMORY_ADDR_SPACES)      // Divide by 2 when separated in two DIMMs

// define sequence parameters (usage requires local definition and assignment of "struct seqInfo *seqInfo;")
#define BM_IMAGE_SIZE_BYTE    (BM_COMPUTE_FRAMESIZE(seqInfo->imageWidth,seqInfo->imageHeight)*2)  // Full size both DIMMs (2 bytes per pixels)
#define BM_START_IMAGE        ((seqInfo->bufImgIdx.start_img/BM_NB_MEMORY_ADDR_SPACES)*BM_NB_MEMORY_ADDR_SPACES)       // Always even (lower) in Storage with 2 DIMMs
#define BM_STOP_IMAGE         (((seqInfo->bufImgIdx.stop_img/BM_NB_MEMORY_ADDR_SPACES)*BM_NB_MEMORY_ADDR_SPACES)+BM_NB_MEMORY_ADDR_SPACES-1)    // Always odd (higher) in Storage with 2 DIMMs

//BUFFER CTRL ADDRESS MAP
// Content of t_bufferManager structure:
#define BM_MEM0_BASE_ADDR_LSB 0x00  //MEMORY 0 BASE ADDR LSB
#define BM_MEM0_BASE_ADDR_MSB 0x04  //MEMORY 0 BASE ADDR MSB
#define BM_MEM1_BASE_ADDR_LSB 0x08  //MEMORY 1 BASE ADDR LSB
#define BM_MEM1_BASE_ADDR_MSB 0x0C  //MEMORY 1 BASE ADDR MSB
#define NB_SEQUENCE_MAX			0x10  //SEQUENCE
#define BM_NB_IMG_PER_SEQ 		0x14  //IMAGES
#define BM_FRAME_SIZE 			0x18	//pIXEL
#define BM_BUFFER_MODE			0x1C	//BM_OFF - BMWRITE - BMREAD
#define BM_HDR_SIZE 			   0x20	//BYTES
#define BM_IMG_SIZE 			   0x24	//BYTES
#define BM_NB_IMG_PRE 			0x28	//PRE = 0 -> no PREMOI
#define BM_NB_IMG_POST 			0x2C	//NB image including MOI to the end
#define BM_READ_SEQUENCE_ID 	0x30	//READ seq ID
#define BM_READ_START_ID		0x34	//READ Start image ID(in buffer memory)
#define BM_READ_STOP_ID			0x38	//READ STOP image ID(in buffer memory)
//#define BM_CLEAR_MEMORY			0x3C	//Pulse to clear memory (obsolete, now cleared on BM_CONFIG_VALID==0)
#define BM_ACQ_STOP				0x40	//When acquisition is stop assert this signal.
#define BM_CONFIG_VALID			0x44	//Hold at 1 when valid. Do not change param when valid

// Other registers not in config structure:
#define BM_AXIL_MEM_ADDR_WIDTH  0x48    //nb of bits kept in the AXIL memory address
#define BM_NB_SEQ_IN_MEM		0x4C	//Return number of sequence int the buffer
#define BM_ERROR			      0x50	//Return errors
#define BM_MEM_READY 			0x54	//Return status of memory interface
#define BM_MIN_FRAME_TIME     0x58  //Configure frame duration in read mode
#define BM_SEQ_COMPLETED      0x5C  //>0 when write or read is completed (all wr sequences or all rd images completed)

#define BM_SWITCH_CONFIG      0x60
#define BM_MOI_SOURCE         0x64
#define BM_MOI_ACTIVATION     0x68
#define BM_SOFT_MOI_SIG       0x6C
#define BM_EXT_BUF_PRSNT      0x70

// BM_SEQ_COMPLETED bit assignment
#define BM_SEQ_WR_COMPLETED   0x00000001
#define BM_SEQ_RD_COMPLETED   0x00000002

// BUFFER TABLE ADDRESS MAP
#define BT_START_IMG_OFFSET   0
#define BT_MOI_IMG_OFFSET     1
#define BT_END_IMG_OFFSET     2


#define BM_MemoryBufferHalted      (gcRegsData.MemoryBufferMOISource == MBMOIS_None)
#define BM_MemoryBufferOff         (gcRegsData.MemoryBufferMode == MBM_Off || (gcRegsData.MemoryBufferSequenceDownloadMode == MBSDM_Off && BM_MemoryBufferHalted))
#define BM_MemoryBufferWrite       (gcRegsData.MemoryBufferMode == MBM_On && gcRegsData.MemoryBufferSequenceDownloadMode == MBSDM_Off && !BM_MemoryBufferHalted)
#define BM_MemoryBufferRead        (gcRegsData.MemoryBufferMode == MBM_On && gcRegsData.MemoryBufferSequenceDownloadMode != MBSDM_Off)
#define BM_MemoryBufferSequence    (gcRegsData.MemoryBufferMode == MBM_On && gcRegsData.MemoryBufferSequenceDownloadMode == MBSDM_Sequence)
#define BM_MemoryBufferImage       (gcRegsData.MemoryBufferMode == MBM_On && gcRegsData.MemoryBufferSequenceDownloadMode == MBSDM_Image)


/**************************** Type Definitions ******************************/
/**
 * BUFFER MANAGER STRUCT
 */
struct s_bufferManagerStruct
{
   uint32_t SIZE;      // Number of config elements (uint64_t counts as 2), excluding SIZE and ADD.
   uint32_t ADD;

   uint64_t Mem0_base_addr;  // 32bit-LSB is sent first
   uint64_t Mem1_base_addr;  // 32bit-LSB is sent first
   uint32_t nbSequenceMax;
   uint32_t nbImagePerSeq;
   uint32_t FrameSize;
   uint32_t BufferMode;
   uint32_t HDR_Size;
   uint32_t IMG_Size;
   uint32_t nb_img_pre; //exluding MOI
   uint32_t nb_img_post; //including MOI
   uint32_t rd_sequence_id;
   uint32_t rd_start_img;
   uint32_t rd_stop_img;
   uint32_t clear_memory;
   uint32_t acq_stop;
   uint32_t ConfigValid;
};
typedef struct s_bufferManagerStruct t_bufferManager;

/**
 * BUFFER MODE ENUM
 */
enum BufferMode_enum
{
   BM_OFF = 0,
   BM_WRITE = 1,
   BM_READ = 2
};
typedef enum BufferMode_enum t_bufferMode;

/**
 * BUFFER TABLE STRUCT
 */
struct s_bufferTable
{
   uint32_t start_img;
   uint32_t moi_img;
   uint32_t stop_img;
};
typedef struct s_bufferTable t_bufferTable;

/**
 * MEMORY TABLE STRUCT
 */
struct seqInfo{
   uint32_t       startAddress;  // 8- or 64- byte aligned (MEM_BUFFER_BYTES_ALIGN), 0 = memory start (not address mapping)
   uint16_t       imageWidth;    // pixels
   uint16_t       imageHeight;   // pixels (header NOT included)
   uint16_t       OffsetX;    // pixels
   uint16_t       OffsetY;   // pixels
   uint32_t       bufferLength;  // nb images in sequence (total for both DIMMs) (if 0 : sequence deleted)
   t_bufferTable  bufImgIdx;
};
struct s_memoryTable
{
   uint32_t NbValidSequences;
   struct seqInfo data[BM_MAX_SEQUENCE];
};
typedef struct s_memoryTable t_memoryTable;

typedef enum
{
   BMS_IDLE = 0,
   BMS_READ,
   BMS_DONE
} bmState_t;

/**
 * BUFFER MANAGER STATUS STRUCT
 */
struct s_bufferStatus
{
   uint32_t error;
   bool     mem_ready;
   bool     ext_buf_prsnt;
};
typedef struct s_bufferStatus t_bufferStatus;

//Switch Configuration
enum BM_Switch_enum {
   BM_SWITCH_EXTERNAL_LIVE,
   BM_SWITCH_EXTERNAL_PLAYBACK,
   BM_SWITCH_INTERNAL_LIVE,
   BM_SWITCH_INTERNAL_PLAYBACK,
};
typedef enum BM_Switch_enum t_bufferSwitch;

//MOI Configuration
enum BM_MOI_SRC_enum {
   BM_EXTERNAL_MOI,
   BM_SOFTARE_MOI,
   BM_NO_MOI
};
typedef enum BM_MOI_SRC_enum t_bufferMoiSrc;
enum BM_MOI_Activation_enum {
   RISING_EDGE,
   FALLING_EDGE,
   ANY_EDGE
};
typedef enum BM_MOI_Activation_enum t_bufferMoiActivation;


/***************** Macros (Inline Functions) Definitions ********************/
#define Buffering_Intf_Ctor(add)    {sizeof(t_bufferManager)/4 - 2, add, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
#define BM_TURN_OFF_DOWNLOAD_MODE() (pGCRegs->MemoryBufferLegacyMode?0:GC_SetMemoryBufferSequenceDownloadMode(MBSDM_Off)); // Shared Register write
// Local Buffer Hardware Access Macros made available for Actualization/ImageCorrection
// *** Disabling buffer also clears hardware table***
#define BM_HW_SetLocalDisableBuffer(pBufferCtrl)      (AXI4L_write32((pBufferCtrl)->ConfigValid = 0, (pBufferCtrl)->ADD + BM_CONFIG_VALID))
#define BM_HW_SetLocalEnableBuffer(pBufferCtrl)       (AXI4L_write32((pBufferCtrl)->ConfigValid = 1, (pBufferCtrl)->ADD + BM_CONFIG_VALID))
#define BM_HW_SetLocalAcquisitionStop(pBufferCtrl)    (AXI4L_write32((pBufferCtrl)->acq_stop = 1, (pBufferCtrl)->ADD + BM_ACQ_STOP))
#define BM_HW_GetLocalSequenceCount(pBufferCtrl)      ((uint32_t)(AXI4L_read32((pBufferCtrl)->ADD + BM_NB_SEQ_IN_MEM)))
#define BM_HW_GetLocalWriteSeqCompleted(pBufferCtrl)  ((bool)(AXI4L_read32((pBufferCtrl)->ADD + BM_SEQ_COMPLETED) & BM_SEQ_WR_COMPLETED))
#define BM_HW_GetLocalReadSeqCompleted(pBufferCtrl)   ((bool)(AXI4L_read32((pBufferCtrl)->ADD + BM_SEQ_COMPLETED) & BM_SEQ_RD_COMPLETED))
#define BM_HW_GetLocalBufferSequenceSizeMax(pGCRegs)  ((uint32_t)((MEM0_BUFFER_SIZE+MEM1_BUFFER_SIZE)/BM_COMPUTE_FRAMESIZE((pGCRegs)->Width,(pGCRegs)->Height)/2 / BM_SEQ_SIZE_INC) * BM_SEQ_SIZE_INC)

/************************** Function Prototypes *****************************/
IRC_Status_t BufferManager_Init(t_bufferManager *pBufferCtrl, gcRegistersData_t *pGCRegs);
void BufferManager_OnAcquisitionStart(t_bufferManager *pBufferCtrl, gcRegistersData_t *pGCRegs);
void BufferManager_OnAcquisitionStop(t_bufferManager *pBufferCtrl, gcRegistersData_t *pGCRegs);
void BufferManager_OnSequenceClearAll(t_bufferManager *pBufferCtrl, gcRegistersData_t *pGCRegs);
void BufferManager_OnSequenceClearSelected(gcRegistersData_t *pGCRegs);
void BufferManager_OnDefrag(t_bufferManager *pBufferCtrl, gcRegistersData_t *pGCRegs);
void BufferManager_OnWindowSizeInit(gcRegistersData_t *pGCRegs);

void BufferManager_SequenceSizeLimits(gcRegistersData_t *pGCRegs);
void BufferManager_NumberOfSequencesLimits(gcRegistersData_t *pGCRegs);
void BufferManager_SequencePreMOISizeLimits(gcRegistersData_t *pGCRegs);
bool BufferManager_SequenceDownloadLimits(gcRegistersData_t *pGCRegs);
void BufferManager_UpdateSequenceMaxParameters(gcRegistersData_t *pGCRegs);
void BufferManager_UpdateSelectedSequenceParameters(gcRegistersData_t *pGCRegs);

void BufferManager_GetStatus(t_bufferManager *pBufferCtrl, t_bufferStatus *pStat);
void BufferManager_SM();

void BufferManager_HW_SetSwitchConfig(t_bufferManager *pBufferCtrl);
void BufferManager_HW_SetMoiConfig(t_bufferManager *pBufferCtrl);
void BufferManager_HW_SendSoftwareMoi(t_bufferManager *pBufferCtrl);

/**
 * Direct Internal Buffer Hardware Access Function Prototypes for Actualization/ImageCorrection
 */
uint32_t BufferManager_HW_GetDirectInternalBufferSequenceRecordedSize(t_bufferManager *pBufferCtrl, uint32_t seqSelector);
void     BufferManager_HW_ForceLoadInternalBufferTable(t_bufferManager *pBufferCtrl, gcRegistersData_t *pGCRegs);
void     BufferManager_HW_ForceDirectInternalBufferWriteConfig(t_bufferManager *pBufferCtrl, gcRegistersData_t *pGCRegs, \
                                                           uint32_t nbSeq, uint32_t seqSize, uint32_t preMOISize);

void BufferManager_UpdateSuggestedFrameImageCount(gcRegistersData_t *pGCRegs);

#endif // BUFFERMANAGER_H
