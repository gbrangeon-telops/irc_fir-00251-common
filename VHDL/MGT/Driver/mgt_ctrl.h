/**
 *  @file mgt_ctrl.h
 *  MGT Controller header file.
 *
 *  This is the header file for the three MGT Cores.
 *  It contains the driver structure.
 *
 *  $Rev$
 *  $Author$
 *  $LastChangedDate$
 *  $Id$
 *  $URL$
 */

#ifndef MGT_CTRL_H
#define MGT_CTRL_H


/****************** Include Files ********************/
#include "verbose.h"
#include "xbasic_types.h"
#include <stdint.h>

#define CORE_STATUS_OFFSET 0
#define PLL_STATUS_OFFSET 4
#define POWER_DOWN_OFFSET 8
#define LOOPBACK_OFFSET 12

#ifdef MGT_VERBOSE
   #define MGT_PRINTF(fmt, ...)     FPGA_PRINTF("MGT: " fmt "\n", ##__VA_ARGS__)
   #define MGT_PRINT(str)           FPGA_PRINT("MGT: " str "\n")
#else
   #define MGT_PRINTF(fmt, ...)     DUMMY_PRINTF("MGT: " fmt "\n", ##__VA_ARGS__)
   #define MGT_PRINT(str)           DUMMY_PRINT("MGT: " str "\n")
#endif


/**
 * MGT driver object
 */
typedef struct
{
   uint32_t SIZE;                // Number of config elements, excluding SIZE and ADD.
   uint32_t ADD;
   
   uint32_t  CORE_STATUS;
   uint32_t  PLL_STATUS;
   uint32_t  POWER_DOWN;
   uint32_t  LOOPBACK;
} t_mgt;

/***************** Macros (Inline Functions) Definitions ********************/
#define MGT_Ctor(add) {sizeof(t_mgt)/4 - 2, add, 0, 0, 0, 0}


// Mask for POWER_DOWN register
#define POWER_DOWN_DATA_MASK  1
#define POWER_DOWN_VIDEO_MASK 2
#define POWER_DOWN_EXP_MASK   4

// Mask for LOOPBACK register
#define LOOPBACK_DATA_MASK    0x00000007
#define LOOPBACK_VIDEO_MASK   0x00000038
#define LOOPBACK_EXP_MASK     0x000001C0

// Mask for CORE_STATUS register 
#define FRAME_ERR_MASK     0x00000007
#define HARD_ERR_MASK      0x00000038
#define SOFT_ERR_MASK      0x000001C0
#define CHANNEL_UP_MASK    0x00000E00
#define LANE_UP_MASK       0x0003F000
#define RX_RESETDONE_MASK  0x001C0000
#define TX_RESETDONE_MASK  0x00E00000
#define TX_OUT_LOCK_MASK   0x07000000
#define LINK_RESET_MASK    0x38000000

// Mask for PLL_STATUS register
#define GT0_QPLLLOCK_MASK        0x00000003
#define GT0_QPLLREFCLKLOST_MASK  0x0000000C
#define GT0_QPLLRESET_MASK       0x00000070

// Loopback mode
#define LOOPBACK_NORMAL       0x0
#define LOOPBACK_NEAREND_PCS  0x1
#define LOOPBACK_NEAREND_PMA  0x2
#define LOOPBACK_FAREND_PMA   0x4
#define LOOPBACK_FAREND_PCS   0x6

// MGT Assignation
#define DATA_MGT  0
#define VIDEO_MGT 1
#define EXP_MGT 2

// Function Prototype
void MGT_Init(t_mgt *inst);

uint32_t MGT_ReadCoreStatus(t_mgt *inst);
uint32_t MGT_ReadPLLStatus(t_mgt *inst);

void MGT_EnableMGT(t_mgt *inst, uint8_t mgt);
void MGT_DisableMGT(t_mgt *inst, uint8_t mgt);
void MGT_SetMGTLoopback(t_mgt *inst, uint8_t mgt, uint8_t mode);

#endif // MGT_CTRL_H

