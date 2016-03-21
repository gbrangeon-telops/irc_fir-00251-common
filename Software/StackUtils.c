/**
 *  @file StackUtils.c
 *  Implementation file for stack utilities.
 *  
 *  $Rev$
 *  $Author$
 *  $Date$
 *  $Id$
 *  $URL$
 */

#include "StackUtils.h"
#include "mb_interface.h"
#include "utils.h"

#define STACK_FILLVALUE    0xDEADBEEF

void Stack_ConfigStackViolationException()
{
   extern unsigned int *_stack_end;
   extern unsigned int *_stack;
   mtshr(&_stack);
   mtslr(&_stack_end);
}

uint32_t Stack_FillRemaining()
{
   extern unsigned int *_stack_end;
   uint32_t *p_stack;
   register uint32_t *stackPointer asm("r1");

   p_stack = stackPointer;
   while (p_stack >= (uint32_t *)&_stack_end)
   {
      *(p_stack--) = STACK_FILLVALUE;
   }

   return ((uint32_t)stackPointer - (uint32_t)&_stack_end) + sizeof(uint32_t);
}

uint32_t Stack_GetSize()
{
   extern unsigned int *_STACK_SIZE;
   return (uint32_t)&_STACK_SIZE;
}

uint32_t Stack_GetActualLevel()
{
   extern unsigned int *_stack_end;
   extern unsigned int *_STACK_SIZE;
   register uint32_t *stackPointer asm("r1");

   return (uint32_t)&_STACK_SIZE - (((uint32_t)stackPointer - (uint32_t)&_stack_end) + sizeof(uint32_t));;
}

uint32_t Stack_GetMaximumLevel()
{
   extern unsigned int *_stack_end;
   extern unsigned int *_STACK_SIZE;
   register uint32_t *stackPointer asm("r1");
   uint32_t *p_stack;

   p_stack = (uint32_t *)&_stack_end;
   while ((p_stack <= stackPointer) && (*p_stack == STACK_FILLVALUE))
   {
      p_stack++;
   }

   return  (uint32_t)&_STACK_SIZE - ((uint32_t)p_stack - (uint32_t)&_stack_end);
}

void Stack_Overflow()
{
   uint8_t data[256];
   uint32_t i;

   for (i = 0; i < NUM_OF(data); i++)
   {
      data[i] = (uint8_t)(i % 0x000000FF);
   }

   Stack_Overflow();
}

