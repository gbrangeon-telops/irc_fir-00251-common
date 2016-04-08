/**
 * @file BuiltInTests.c
 * Built-in tests module implementation.
 *
 * This file implements camera Built-in tests module.
 * 
 * $Rev$
 * $Author$
 * $Date$
 * $Id$
 * $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "BuiltInTests.h"
#include "printf_utils.h"
#include "utils.h"
#include "verbose.h"
#include <string.h>


/**
 * Update built-in tests global result.
 *
 * @return IRC_FAILURE if at least one of the built-in test failed.
 * @return IRC_NOT_DONE if no built-in test failed there at least one built-in test is pending.
 * @return IRC_SUCCESS otherwise.
 */
IRC_Status_t BuiltInTest_UpdateGlobalResult()
{
   uint32_t i;
   uint32_t pendingResult = 0;

   for (i = 1; i < BITID_Count; i++)
   {
      if (builtInTests[i].result == BITR_Failed)
      {
         return IRC_FAILURE;
      }
      else if (builtInTests[i].result == BITR_Pending)
      {
         pendingResult++;
      }
   }

   if (pendingResult > 0)
   {
      return IRC_NOT_DONE;
   }

   return IRC_SUCCESS;
}

/**
 * Check built-in tests data structure array.
 *
 * @return IRC_SUCCESS if successfully checked.
 * @return IRC_FAILURE if failed to check.
 */
IRC_Status_t BuiltInTest_Check()
{
   uint32_t i;

   for (i = 0; i < BITID_Count; i++)
   {
      if (builtInTests[i].id != i)
      {
         return IRC_FAILURE;
      }
   }

   return IRC_SUCCESS;
}

/*
 * Execute built-in test and store result.
 *
 * @param builtInTest is a pointer to the built-in test data structure to execute.
 */
void BuiltInTest_Execute(builtInTestID_t builtInTestID)
{
   builtInTest_t *builtInTest = &builtInTests[builtInTestID];

   if (builtInTest == NULL)
   {
      return;
   }

   if (strlen(builtInTest->description) > 0)
   {
      FPGA_PRINTF("%s...", builtInTest->description);
   }

   if (builtInTest->testFunc != NULL)
   {
      switch (builtInTest->testFunc())
      {
         case IRC_NOT_DONE:
            builtInTest->result = BITR_Pending;
            break;

         case IRC_SUCCESS:
            builtInTest->result = BITR_Passed;
            break;

         case IRC_FAILURE:
         default:
            builtInTest->result = BITR_Failed;
      }
   }
   else
   {
      builtInTest->result = BITR_Failed;
   }

   if (strlen(builtInTest->description) > 0)
   {
      if (builtInTest->result == BITR_Passed)
      {
         PRINTF(" passed.\n");
      }
      else if (builtInTest->result == BITR_Passed)
      {
         PRINTF(" failed.\n");
      }
   }
}

uint32_t BuiltInTest_FillResultRegister(uint32_t regOffset)
{
   uint32_t regData = 0;
   uint32_t builtIntestOffset = regOffset * BIT_NUM_OF_RESULTS_IN_REG;
   uint32_t i;

   // Fill result register data
   for (i = builtIntestOffset; i < MIN(builtIntestOffset + BIT_NUM_OF_RESULTS_IN_REG, BITID_Count); i++)
   {
      regData |= ((builtInTests[i].result & 0x00000003) << ((i % BIT_NUM_OF_RESULTS_IN_REG) * 2));
   }

   return regData;
}
