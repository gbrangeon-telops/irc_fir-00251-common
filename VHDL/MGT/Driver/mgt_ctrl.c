/**
 *  @file mgt_ctrl.c
 *  Source file for MGT Cores.
 *  
 *  Theses functions permit to control and read status from the MGT Cores.
 *  
 *  $Rev$
 *  $Author$
 *  $LastChangedDate$
 *  $Id$
 *  $URL$
 */


/***************************** Include Files *******************************/
#include "MGT_CTRL.h"
#include "utils.h"
#ifdef SIM
   #include "proc_ctrl.h" // Contains the class SC_MODULE for SystemC simulation
   #include "mb_transactor.h" // Contains virtual functions that emulates microblaze functions
   #include "mb_axi4l_bridge_SC.h" // Used to bridge Microblaze AXI4-Lite transaction in SystemC transaction
#else
   #include "mb_axi4l_bridge.h" // Used to bridge Microblaze AXI4-Lite transaction
   //#include "xtime_l.h"
   //#include "xcache_l.h"
#endif


/************************** Function Definitions ***************************/

/**
 *  MGT_Init.
 *  Initialize the MGT cores at Startup.
 *  
 *  @param inst Pointer to the instance
 *  
 *  @return void
 */
void MGT_Init(t_mgt *inst)
{

   // Enable all MGT
   AXI4L_write32(0, inst->ADD + POWER_DOWN_OFFSET);
   
   // No loopback
   AXI4L_write32(0, inst->ADD + LOOPBACK_OFFSET);

}

/**
 *  MGT_EnableMGT.
 *  Enable a MGT core (Data, Video or EXP).
 *  
 *  @param inst Pointer to the instance
 *  @param mgt MGT Core to enable (Data, Video or EXP)
 *  
 *  @return void
 */
void MGT_EnableMGT(t_mgt *inst, uint8_t mgt)
{
   uint32_t power_down;

   power_down = AXI4L_read32(inst->ADD + POWER_DOWN_OFFSET);
   
   BitClr(power_down,mgt);
   
   AXI4L_write32(power_down, inst->ADD + POWER_DOWN_OFFSET);

}

/**
 *  MGT_DisableMGT.
 *  Disable (Power Down) a MGT core (Data, Video or EXP).
 *  
 *  @param inst Pointer to the instance
 *  @param mgt MGT Core to disable (Data, Video or EXP)
 *  
 *  @return void
 */
void MGT_DisableMGT(t_mgt *inst, uint8_t mgt)
{
   uint32_t power_down;

   power_down = AXI4L_read32(inst->ADD + POWER_DOWN_OFFSET);
   
   BitSet(power_down,mgt);
   
   AXI4L_write32(power_down, inst->ADD + POWER_DOWN_OFFSET);

}

/**
 *  MGT_SetMGTLoopback.
 *  Set a loopback option for a MGT Core.
 *  
 *  @param inst Pointer to the instance
 *  @param mgt MGT Core to set the loopback (Data, Video or EXP)
 *  @param mode Loopback mode to set
 *  
 *  @return void
 */
void MGT_SetMGTLoopback(t_mgt *inst, uint8_t mgt, uint8_t mode)
{

   inst->LOOPBACK = AXI4L_read32(inst->ADD + LOOPBACK_OFFSET);
   
   switch (mgt)
   {
      case DATA_MGT :
    	  inst->LOOPBACK = ( ( inst->LOOPBACK & ~LOOPBACK_DATA_MASK ) | mode );
         break;
      case VIDEO_MGT :
    	  inst->LOOPBACK = ( ( inst->LOOPBACK & ~LOOPBACK_VIDEO_MASK ) | ( mode << 3 ) );
         break;
      case EXP_MGT :
    	  inst->LOOPBACK = ( ( inst->LOOPBACK & ~LOOPBACK_EXP_MASK ) | ( mode << 6 ) );
         break;
      default:
         break;
   }

   AXI4L_write32(inst->LOOPBACK, inst->ADD + LOOPBACK_OFFSET);

}

/**
 *  MGT_ReadCoreStatus.
 *  Read the status of the MGT cores.
 *  
 *  @param inst Pointer to the instance
 *  
 *  @return Status bits read for MGT Cores
 */
uint32_t MGT_ReadCoreStatus(t_mgt *inst)
{

   
   uint8_t i;
   
   inst->POWER_DOWN = AXI4L_read32(inst->ADD + POWER_DOWN_OFFSET);
   
   inst->CORE_STATUS = AXI4L_read32(inst->ADD + CORE_STATUS_OFFSET);
   
   for ( i=0; i <=29; i++ )
   {
   
      // Frame, Hard or Soft Error
      if ( i >= 0 && i <= 8 )
      {
         if ( bitget(inst->CORE_STATUS,i) == 1 )
         {
            MGT_PRINTF("Error Detected : bit %d",i);
         }
      }
      
      // Check if channel is up and not in power_down
      if ( i >= 9 && i <= 11 )
      {
         if ( bitget(inst->CORE_STATUS,i) == 0 && (bitget(inst->POWER_DOWN,(i-9))) == 0 )
         {
            MGT_PRINTF("Channel is not up : %d",i);
         }
      }
      
      // Check if lane for DATA is up and not in power_down
      if ( (i == 12 || i == 13) && bitget(inst->POWER_DOWN,0) == 0 )
      {
         if ( bitget(inst->CORE_STATUS,i) == 0 )
         {
            MGT_PRINTF("Lane is not up : %d",i);
         }
      }
   
      // Check if lane for VIDEO is up and not in power_down
      if ( (i == 14 || i == 15) && bitget(inst->POWER_DOWN,1) == 0 )
      {
         if ( bitget(inst->CORE_STATUS,i) == 0 )
         {
            MGT_PRINTF("Lane is not up : %d",i);
         }
      }

      // Check if lane for EXP is up and not in power_down
      if ( (i == 16 || i == 17) && bitget(inst->POWER_DOWN,2) == 0 )
      {
         if ( bitget(inst->CORE_STATUS,i) == 0 )
         {
            MGT_PRINTF("Lane is not up : %d",i);
         }
      }
      
      // Check if RX reset is done and not in power_down
      if ( i >= 18 && i <= 20 )
      {
         if ( bitget(inst->CORE_STATUS,i) == 0 && (bitget(inst->POWER_DOWN,(i-18))) == 0 )
         {
            MGT_PRINTF("RX reset is not done : %d",i);
         }
      }

      // Check if TX reset is done and not in power_down
      if ( i >= 21 && i <= 23 )
      {
         if ( bitget(inst->CORE_STATUS,i) == 0 && (bitget(inst->POWER_DOWN,(i-21))) == 0 )
         {
            MGT_PRINTF("TX reset is not done : %d",i);
         }
      }

      // Check if TX Clock out is locked and not in power_down
      if ( i >= 24 && i <= 26 )
      {
         if ( bitget(inst->CORE_STATUS,i) == 0 && (bitget(inst->POWER_DOWN,(i-24))) == 0 )
         {
            MGT_PRINTF("RX reset is not done : %d",i);
         }
      }
      
      // Check if link is in reset and not in power_down
      if ( i >= 27 && i <= 29 )
      {
         if ( bitget(inst->CORE_STATUS,i) == 0 && (bitget(inst->POWER_DOWN,(i-27))) == 0 )
         {
            MGT_PRINTF("Link is in reset : %d",i);
         }
      }
   }
   
   return inst->CORE_STATUS;
}

/**
 *  MGT_ReadPLLStatus.
 *  Read the PLL Status.
 *  
 *  @param inst Pointer to the instance
 *  
 *  @return Return the status bits read for the PLL Quad
 */
uint32_t MGT_ReadPLLStatus(t_mgt *inst)
{


   inst->POWER_DOWN = AXI4L_read32(inst->ADD + POWER_DOWN_OFFSET);
   
   inst->PLL_STATUS = AXI4L_read32(inst->ADD + PLL_STATUS_OFFSET);
   
   if ( (bitget(inst->PLL_STATUS,0) == 0) && (bitget(inst->POWER_DOWN,0) == 0) )
   {
      MGT_PRINT("QPLL for Quad 1 is not locked");
   }

   if ( (bitget(inst->PLL_STATUS,1) == 0) && (bitget(inst->POWER_DOWN,2) == 0) )
   {
      MGT_PRINT("QPLL for Quad 2 is not locked");
   }

   if ( (bitget(inst->PLL_STATUS,2) == 0) && ((bitget(inst->POWER_DOWN,0) == 0) ) )
   {
      MGT_PRINT("QPLL reference clock for Quad 1 is lost");
   }

   if ( (bitget(inst->PLL_STATUS,3) == 0) && (bitget(inst->POWER_DOWN,2) == 0) )
   {
      MGT_PRINT("QPLL reference clock for Quad 2 is lost");
   }

   if ( (bitget(inst->PLL_STATUS,4) == 1) && (bitget(inst->POWER_DOWN,0) == 0) )
   {
      MGT_PRINT("QPPL for Data is in reset");
   }

   if ( (bitget(inst->PLL_STATUS,5) == 1) && (bitget(inst->POWER_DOWN,1) == 0) )
   {
      MGT_PRINT("QPPL for Video is in reset");
   }

   if ( (bitget(inst->PLL_STATUS,6) == 1) && (bitget(inst->POWER_DOWN,2) == 0) )
   {
      MGT_PRINT("QPPL for Exp is in reset");
   }
   
   return inst->PLL_STATUS;
}
