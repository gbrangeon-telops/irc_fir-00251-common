/**
 * @file Startup_TestMem.c
 * Memory Tests implementation
 *
 * This file implements the Memory tests method
 *
 * $Rev: 17659 $
 * $Author: dalain $
 * $Date: 2015-12-10 11:42:57 -0500 (jeu., 10 déc. 2015) $
 * $Id: DebugTerminal.h 17659 2015-12-10 16:42:57Z dalain $
 * $URL: http://einstein/svn/firmware/FIR-00251-Proc/trunk/src/sw/DebugTerminal.h $
 *
 * (c) Copyright 2016 Telops Inc.
 */

#include "Startup_TestMem.h"

#include "xil_types.h"
#include "xil_testmem.h"
#include "verbose.h"
#include "utils.h"

#define NUM_MEM_TESTS                              6
#define DEFAULT_FIXED_PATTERN                      0xDEADBEEF
#define MEMORY_BLOCK_SIZE_WORDS                    0x100000     // Memory tests done in blocks of 4M

#ifdef FPGA_OUTPUT
   extern void Startup_InstantPrint(void);
#endif

static char* testDescription[NUM_MEM_TESTS] = {
      "All",
      "Incremental",
      "Walking Ones",
      "Walking Zeros",
      "Inverse Address",
      "Fixed Pattern"
};

/*
 * Runs the XIL_TESTMEM memory test step by step while keeping a progression counter.
 * Outputs test results at every step.
 *
 * @param baseAddr is the base address of the memory block to be tested
 * @param sizeWords is the tested memory block size, measured in 32-bit words
 *
 * @return IRC_SUCCESS if every test was successful
 * @return IRC_FAILURE otherwise
 */
IRC_Status_t Startup_TestMem(uint32_t baseAddr, uint32_t sizeWords) {

   int status;
   uint32_t testIndex;
   uint32_t curAddr;
   uint32_t memBlockIndex;
   float percentComplete;

#ifdef SHORT_MEMORY_TEST
   const uint32_t numMemBlocks = sizeWords / (MEMORY_BLOCK_SIZE_WORDS * 32);      // in Demonstration mode, only run mem tests on 1/32nd of the memory block
#else
   const uint32_t numMemBlocks = sizeWords / MEMORY_BLOCK_SIZE_WORDS;
#endif

   const float percentIncr = 100.0 / (float)numMemBlocks;

   PRINTF("\n");

   for (testIndex = 1; testIndex < NUM_MEM_TESTS; testIndex++) {

      // Reset advancement counter
      percentComplete = 0;

      // Begin Xilinx memory test
      for (memBlockIndex = 0; memBlockIndex < numMemBlocks; memBlockIndex++) {

         curAddr = baseAddr + 4 * memBlockIndex * MEMORY_BLOCK_SIZE_WORDS;

#ifdef FPGA_OUTPUT
         if ((testIndex != 2) && (testIndex != 3)) {
            PRINTF("\r");
            FPGA_PRINTF("%s Memory Test \t%3d%%", testDescription[testIndex], (int)percentComplete);
            Startup_InstantPrint();
         }
#else
         // Test header
         PRINTF("\r");
         FPGA_PRINTF("%s Memory Test\t%3d%%", testDescription[testIndex], (int)percentComplete);
#endif


         status = Xil_TestMem32((u32 *)curAddr, MEMORY_BLOCK_SIZE_WORDS, DEFAULT_FIXED_PATTERN, testIndex);


         if (status) {  // Xil_TestMem returns 0 for success, 1 for failure
            PRINTF("\tFAIL\n", testDescription[testIndex]);
            return IRC_FAILURE;
         }

         percentComplete += percentIncr;
      }

      PRINTF("\r");
      FPGA_PRINTF("%s Memory Test\t100%%\tPASS\n", testDescription[testIndex]);

#ifdef FPGA_OUTPUT
      Startup_InstantPrint();
#endif

   }

   PRINTF("\n");
   return IRC_SUCCESS;
}
