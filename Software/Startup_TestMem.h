/**
 * @file Startup_TestMem.h
 * Memory Tests definition
 *
 * This file defines the Memory tests method
 *
 * $Rev: 17659 $
 * $Author: dalain $
 * $Date: 2015-12-10 11:42:57 -0500 (jeu., 10 déc. 2015) $
 * $Id: DebugTerminal.h 17659 2015-12-10 16:42:57Z dalain $
 * $URL: http://einstein/svn/firmware/FIR-00251-Proc/trunk/src/sw/DebugTerminal.h $
 *
 * (c) Copyright 2016 Telops Inc.
 */

#ifndef STARTUP_TESTMEM_H_
#define STARTUP_TESTMEM_H_

#include "IRC_Status.h"
#include <stdint.h>

#ifdef TELOPS_DEBUG
#define SHORT_MEMORY_TEST
#else
#undef SHORT_MEMORY_TEST
#endif

IRC_Status_t Startup_TestMem(uint32_t baseAddr, uint32_t sizeWords);

#endif /* STARTUP_TESTMEM_H_ */
