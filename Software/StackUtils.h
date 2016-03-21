/**
 *  @file StackUtils.h
 *  Header file for stack utilities.
 *  
 *  $Rev$
 *  $Author$
 *  $Date$
 *  $Id$
 *  $URL$
 */
#ifndef __STACKUTILS_H__
#define __STACKUTILS_H__

#include <stdint.h>

void Stack_ConfigStackViolationException();
uint32_t Stack_FillRemaining();
uint32_t Stack_GetSize();
uint32_t Stack_GetActualLevel();
uint32_t Stack_GetMaximumLevel();
void Stack_Overflow();

#endif //__STACKUTILS_H__
