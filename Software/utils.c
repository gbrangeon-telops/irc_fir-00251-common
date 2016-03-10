/**
 *  @file utils.c
 *  Usefull functions for the FPGA
 *
 *  Defines usefull functions to utilise in the project
 *
 *  $Rev$
 *  $Author$
 *  $LastChangedDate$
 *  $Id$
 *  $URL$
 */

#include "utils.h"
#include "timer.h"
#include "xparameters.h"
#include "printf_utils.h"
#include <math.h>
#include <float.h>

#ifdef SIM
   #include <systemc.h> // For sc_time_stamp().value()
   #include <stdarg.h> // To support ... argument in sim_printf
   //#include <iostream.h>
   //#include <iomanip>
   #include "mb_transactor.h"
   #include "mb_axi4l_bridge_SC.h" // Used to bridge Microblaze AXI4-Lite transaction in SystemC transaction
   extern sc_port<mb_transactor_task_if> *global_trans_ptr;
#else
   #include "mb_axi4l_bridge.h"
#endif


//extern float *(*EHDRIExposureTimeAry);
// extern float EHDRIExposureTimeAry[8][4];
//extern float *EHDRIExposureTimeAry;


uint32_t bitget(uint32_t value, uint8_t bitposition)
{
//   uint32_t mask  = (uint32_t)1 << bitposition;

//   return ((value & mask) >> bitposition);

   return (value & ( 1 << bitposition )) >> bitposition;
}

/**
 *  elapsed_time_us.
 *  Use this function compute the time elapsed from a starting time in us.
 *
 *  @param tic Starting time in ticks
 *
 *  @return Elapsed time in us
 */
uint64_t elapsed_time_us(uint64_t tic)
{
   uint64_t etime_ticks;   // Elapsed time in ticks count.
   uint64_t etime_us;      // Elapsed time in us.
   uint64_t toc;           // Number of ticks at this time.

   // Get the number ticks at this time
   GETTIME(&toc); 

   // Compute the elapsed time in ticks count
   #ifndef SIM
   if (tic < toc)
   {
      etime_ticks = toc - tic;
   }
   else
   {
      // Manage wrap-around
      etime_ticks = (TIMER_MAX_TICKS - tic) + toc;
   }
   #else
      etime_ticks = toc - tic;
   #endif
   // Translate elapsed time in us
   etime_us = etime_ticks * 1000000 / XPAR_CPU_CORE_CLOCK_FREQ_HZ;

#ifdef SIM
   // JRO : This verification is added because sometime in simulation the counter restart for no reason
   if((toc-tic) >= (uint64_t)2147483647) // 2^31 : ~10s at 200Mhz
      return 0;
#endif

   return etime_us;
}

//---------------------------------------------------------------------------
// Generic function to read a structure on the Wishbone bus
// The structure MUST contain only 32-bit values and its FIRST element must
// contain the number of elements (payload) in the structure, excluding the
// Size element and the wishbone address element.
// The second element MUST contain the Wishbone address.
//
// Inputs
//--------
// pStruct  : pointer to a generic structure
//---------------------------------------------------------------------------
/*
void ReadStruct(void* pStruct)
{
   uint32_t* sp = (uint32_t*)pStruct; // Convert the generic pointer into a 4-byte pointer.

   uint32_t EndAdd;
   uint32_t add;
   EndAdd = (*sp) * 4; // (*sp) is the Size element of the struct. *4 because it's byte-wise addresses.
   //Increment sp so that it points to the wishbone address in the struct
   sp++;
   add = (*sp);
   // Add the wishbone address to EndAdd;
   EndAdd += add;

   // Loop through all the structure elements.
   for (; add < EndAdd; add += 4)
   {
      // Increment structure pointer to point to next 32-bit element
      sp++;

      // Read wishbone address and assign the value to the structure element pointed by sp
      *sp = WB_read32(add);
   }
}
*/
//---------------------------------------------------------------------------
// Generic function to read a RS232 structure on the Wishbone bus
// (such as a RS-232 config for example).
//
// Inputs
//--------
// pStruct  : pointer to a generic structure
//---------------------------------------------------------------------------
//void ReadRS232Struct(void* pStruct)
//{
//   uint32_t* sp = (uint32_t*)pStruct; // Convert the generic pointer into a 4-byte pointer.
//
//   uint32_t SizeInBytes;
//   uint32_t EndAdd;
//   uint32_t add;
//   uint32_t byte;
//   uint32_t temp;
//
//   SizeInBytes = (*sp) * 4 - 4; // (*sp) is the Size element of the struct. *4 because each address corresponds to one byte (-4 because we removed the field ADD).
//   //Increment sp so that it points to the wishbone address in the struct
//   sp++;
//   add = (*sp);
//   // Add the wishbone address to EndAdd;
//   EndAdd = add + SizeInBytes;
//
//   // The first byte of the RS232 command is the header, we don't care.
//   add++;
//
//   // Let's read the 2nd byte (size) to see if it fits with the size of the structure
//   if (WB_read16(add) != SizeInBytes)
//      PRINTF("The structure size (%d) and RS232 size (%d) don't match.\n", SizeInBytes, WB_read16(add));
//   add++;
//
//   // Loop through all the structure elements.
//   while (add < EndAdd)
//   {
//      // Increment structure pointer to point to next 32-bit element
//      sp++;
//
//      // Read wishbone address and assign the value to the structure element pointed by sp
//      temp = 0;
//      int32_t i = 24;
//      for (; i>=0; i=i-8)
//      {
//         byte = WB_read16(add);
//         //PRINTF("Byte at address %d: %d\n", add, byte);
//         byte = byte << i;
//         temp = byte | temp;
//         //PRINTF("temp: %d\n", temp);
//         add++;
//      }
//      //PRINTF("32-bit word : %d\n", temp);
//      *sp = temp;
//   }
//}

//---------------------------------------------------------------------------
// Generic function to write a structure on the Wishbone bus
// (such as a module config for example).
// The structure MUST contain only 32-bit values and its FIRST element must
// contain the number of elements in the structure, excluding the Size element
// and the wishbone address element.
// The second element MUST contain the Wishbone address.
//
// Inputs
//--------
// pStruct  : pointer to a generic structure
//---------------------------------------------------------------------------

void WriteStruct(const void* pStruct)
{
   const uint32_t* sp = (const uint32_t*)pStruct; // Convert the generic pointer into a 4-byte pointer.

   uint32_t EndAdd;
   uint32_t add;
   EndAdd = (*sp) * 4; // (*sp) is the Size element of the struct. *4 because it's byte-wise addresses.
   //PRINTF("EndAdd : %d\n", EndAdd);
   //Increment sp so that it points to the wishbone address in the struct
   sp++;
   add = (*sp);
   // Add the wishbone address to EndAdd;
   EndAdd += add;

   // Loop through all the structure elements.
   for (; add < EndAdd; add += 4)
   {
      // Increment structure pointer to point to next 32-bit element
      sp++;

      // Write the structure element pointed by sp to the wishbone address
      AXI4L_write32(*sp, add);
   }
}

//---------------------------------------------------------------------------
// Generic function to read an array on the Wishbone bus.
//
// Inputs
//--------
// pAry  : pointer to the first element of an array
//---------------------------------------------------------------------------
//void ReadArray16(uint16_t pAry[], uint32_t Length, uint32_t add)
//{
//   uint32_t EndAdd = add + Length;
//
//   // Loop through all the array elements.
//   for (; add < EndAdd; add += 1)
//   {
//      // Read wishbone address and assign the value to the array element pointed by sp
//      *pAry = WB_read16(add);
//
//      // Increment pointer to point to next 16-bit element
//      pAry++;
//   }
//}

//---------------------------------------------------------------------------
// Generic function to write an array on the Wishbone bus.
//
// Inputs
//--------
// pAry  : pointer to the first element of an array
//---------------------------------------------------------------------------
//void WriteArray16(const uint16_t pAry[], uint32_t Length, uint32_t add)
//{
//   uint32_t EndAdd = add + Length;
//
//   // Loop through all the array elements.
//   for (; add < EndAdd; add += 1)
//   {
//      // Write the array element pointed by sp to the wishbone address
//      WB_write16(*pAry, add);
//
//      // Increment pointer to point to next 16-bit element
//      pAry++;
//   }
//}

//---------------------------------------------------------------------------
// Generic function to print an array on stdout.
//
// Inputs
//--------
// pAry  : pointer to the first element of an array
//---------------------------------------------------------------------------
/*void PrintArray16(const uint16_t pAry[], uint32_t Length)
{
   //uint32_t EndAdd = add + Length;
   uint32_t i = 0;

   // Loop through all the array elements.
   PRINTF("** Content of 16-bit array of length %d at address 0x%X\n", Length, pAry);
   for (; i < Length; i++)
   {
      // Write the array element pointed by sp to the wishbone address
      PRINTF("Array16[%d] = 0x%X\n", i, *pAry);

      // Increment pointer to point to next 16-bit element
      pAry++;
   }
}
*/
//---------------------------------------------------------------------------
// Generic function to print an array on stdout.
//
// Inputs
//--------
// pAry  : pointer to the first element of an array
//---------------------------------------------------------------------------
/*
void PrintArray32(const uint32_t pAry[], uint32_t Length)
{
   //uint32_t EndAdd = add + Length;
   uint32_t i = 0;

   // Loop through all the array elements.
   PRINTF("** Content of 32-bit array of length %d at address 0x%X\n", Length, pAry);
   for (; i < Length; i++)
   {
      // Write the array element pointed by sp to the wishbone address
      PRINTF("Array32[%d] = 0x%X\n", i, *pAry);

      // Increment pointer to point to next 32-bit element
      pAry++;
   }
}
*/
////---------------------------------------------------------------------------
//// Generic function to read a float array on the Wishbone bus.
////
//// Inputs
////--------
//// pAry  : pointer to the first element of an array
////---------------------------------------------------------------------------
//void ReadArrayFloat(float pAry[], uint32_t Length, uint32_t add)
//{
//   uint32_t EndAdd = add + Length*2;
//
//   // Create a pointer to 16-bit data
//   uint16_t *p16 = (uint16_t *)pAry;
//
//   // Loop through all the array elements.
//   for (; add < EndAdd; add += 1)
//   {
//      // Read wishbone address and assign the value to the array element pointed by sp
//      *p16 = WB_read16(add);
//
//      // Increment pointer to point to next 16-bit element
//      p16++;
//   }
//}

//---------------------------------------------------------------------------
// Generic function to read a float array on the Wishbone bus.
// This function is special because it always reads at the same address.
// This is for special blocks that increment the address internally (like
// calib_ctrl).
//
// Inputs
//--------
// pAry  : pointer to the first element of an array
//---------------------------------------------------------------------------
//void ReadArrayFloatLong(float pAry[], uint32_t Length, uint32_t add)
//{
//   uint32_t BeginAdd = add;
//   uint32_t EndAdd = add + Length;
//
//   // Create a pointer to 16-bit data
//   uint16_t *p16 = (uint16_t *)pAry;
//
//   // Loop through all the array elements.
//   for (; add < EndAdd; add += 1)
//   {
//
//      #ifdef SIM /* Little endian architecture (x86) */
//
//         float pi = 3.14159;
//         float float_val;
//         uint32_t hexa_val;
//         uint16_t msb, lsb;
//         uint8_t *byte_ptr;
//         byte_ptr = (uint8_t*)&pi;
//
//         //PRINTF("p16 = 0x%X\n", p16);
//         //PRINTF("Bytes starting at add 0x%X = 0x%X, 0x%X, 0x%X, 0x%X\n", byte_ptr, *byte_ptr, *(byte_ptr+1), *(byte_ptr+2), *(byte_ptr+3));
//
//         // Read MSB and then LSB (THIS ORDER IS MANDATORY)
//         msb = WB_read16(BeginAdd);
//         lsb = WB_read16(BeginAdd+1);
//
//         *p16 = lsb;
//         hexa_val = (uint32_t)*p16;
//         // Increment pointer to point to MSB
//         byte_ptr = (uint8_t*)p16;
//         p16++;
//
//         // Read wishbone address and assign the value to the array element pointed by sp
//         *p16 = msb;
//         hexa_val = hexa_val | (uint32_t)(*p16 << 16);
//
//         float_val = (float) *((float*)byte_ptr);
//         PRINTF("msb = 0x%X, lsb = 0x%X, 32-bit value = 0x%X, float_val = %f\n", msb, lsb, hexa_val, float_val);
//         //PRINTF("Bytes starting at add 0x%X = 0x%X, 0x%X, 0x%X, 0x%X\n", byte_ptr, *byte_ptr, *(byte_ptr+1), *(byte_ptr+2), *(byte_ptr+3));
//
//         // Increment pointer to point to next float value
//         p16++;
//
//      #else /* Big endian architecture (PowerPC) */
//
//         // Read MSB
//         *p16 = WB_read16(BeginAdd);
//
//         // Increment pointer to point to LSB
//         p16++;
//
//         // Read wishbone address and assign the value to the array element pointed by sp
//         *p16 = WB_read16(BeginAdd+1);
//
//         // Increment pointer to point to next float value
//         p16++;
//
//      #endif
//
//
//   }
//}

//---------------------------------------------------------------------------
// Returns the largest multiple of a given quantity that is not greater than
// the given value.
//
// Parameters
// -----------
// value    Value to round.
// quantity Quamtity to multiply by an integer to obtain the multiple.
//
// Return
// -----------
// The largest multiple that is not greater than the given value.
//---------------------------------------------------------------------------

float floorMultiple( float value, float quantity )
{
   return ( floorf( value / quantity ) * quantity );
}

//---------------------------------------------------------------------------
// Returns the smallest multiple of a given quantity that is not less than
// the given value.
//
// Parameters
// -----------
// value    Value to round.
// quantity Quamtity to multiply by an integer to obtain the multiple.
//
// Return
// -----------
// The smallest multiple that is not less than the given value.
//---------------------------------------------------------------------------

float ceilMultiple( float value, float quantity )
{
   return ( ceilf( value / quantity ) * quantity );
}

/*
uint32_t endian_swap_32(uint32_t x)
{
   #ifdef SIM
   uint8_t ary8_x[4];
   uint8_t ary8_y[4];
   uint32_t y;

   memcpy(ary8_x, &x, 4);

   // Swap each byte
   ary8_y[0] = ary8_x[3];
   ary8_y[1] = ary8_x[2];
   ary8_y[2] = ary8_x[1];
   ary8_y[3] = ary8_x[0];

   // Now convert the y array to a 32-bit value
   memcpy(&y, ary8_y, 4);

   return y;

   #else
   return x;
   #endif
}
*/

#ifdef SIM
// The following code is to support printing to the console during SystemC debug
// but also to send stdout to the UART (with outbyte)

extern void outbyte (char);

/**
 *  sim_print.
 *  Display a string in a console for SystemC simulation.
 *  
 *  @param str String to display
 *  
 *  @return Void
 */
void sim_print(char *str)
{
   unsigned long now_us;
   unsigned long now_ns;
   now_us = (unsigned long)(sc_time_stamp().value()/1000000);
   now_ns = (unsigned long)(sc_time_stamp().value()/1000) - now_us*1000;

   cout << now_us << "." << now_ns << " us: " << str;

   // Uncomment the following lines to send to UART during simulation
   //   while (*str)
   //   {
   //      outbyte (*str++);
   //   }
}

/**
 *  sim_printf.
 *  Display a formatted string in a console for SystemC simulation.
 *  
 *  @param format string that contains the text to be displays with format specifiers
 *  @param ... Additionnal arguments depending on the format string
 *  
 *  @return Void
 */
void sim_printf(const char *format, ...)
{
   char str[1000];
   unsigned long now_us;
   unsigned long now_ns;

   now_us = (unsigned long)(sc_time_stamp().value()/1000000);
   now_ns = (unsigned long)(sc_time_stamp().value()/1000) - now_us*1000;

   // The va stuff is from stdarg.h
   va_list ap;
   va_start(ap, format);

   // Format the string using vsprintf
   vsprintf(str, format, ap);

   // Then send it to SystemC console
   cout << now_us << "." << now_ns << " us: " << str;

   // Clean up the argument list to be able to use it again
   va_end(ap);
   va_start(ap, format);

   // Use vprintf to print to stdout (UART)
   //vprintf(format, ap);
}

#endif
/*
void outbyte(char c) // outbyte is used for stdout, printf uses it for example.
{
   AXI4L_write32(c, STDOUT_BASEADDRESS);
}
*/
/*
// Return the first bit position that is set to high (1) from 0.
uint8_t GetFirstHighBitPos( uint32_t data, uint8_t bitSize )
{
   uint8_t i;

   i = 0;
   while ( !( ( data >> i ) & 1L ) && ( i < bitSize ) )
   {
      i++;
   }

   return i;
}
*/
/*
float MaxExposureTime(GeniCam_Registers_Set_t *pGCRegs)
{
   float maxValue = 0.0f;
   uint8_t i, j;

   if(pGCRegs->SFWMode == SFWM_Fixed)
   {
      if(pGCRegs->EHDRINumberOfExposures > 1)
         for(i=0; i<pGCRegs->EHDRINumberOfExposures; i++) // Max of the EHDRI values of 1 spectral filter
            maxValue = MAX(GETEHDRIEXPOSURE(pGCRegs->SFWPositionSetpoint,i), maxValue);
      else
         maxValue = GETEHDRIEXPOSURE(pGCRegs->SFWPositionSetpoint,0); // The value of the spactral filter
   }
   else // if ROTATING
   {
      if(pGCRegs->EHDRINumberOfExposures > 1)
         for(i=0; i<SFW_FILTER_NB; i++) // Max of EHDRI values of all spectral filters
            for(j=0; j<pGCRegs->EHDRINumberOfExposures; j++)
               maxValue = MAX(GETEHDRIEXPOSURE(i,j), maxValue);
      else
         for(i=0; i<SFW_FILTER_NB; i++)
            maxValue = MAX(GETEHDRIEXPOSURE(i,0), maxValue); // Max values of all spectral filters
   }


   return maxValue;
}
*/
/*
float MinExposureTime(GeniCam_Registers_Set_t *pGCRegs)
{
   float minValue = 999999999.0f;
   uint8_t i, j;

   if(pGCRegs->SFWMode == SFWM_Fixed)
   {
      if(pGCRegs->EHDRINumberOfExposures > 1)
         for(i=0; i<pGCRegs->EHDRINumberOfExposures; i++) // Min of the EHDRI values of 1 spectral filter
            minValue = MIN(GETEHDRIEXPOSURE(pGCRegs->SFWPositionSetpoint,i), minValue);
      else
         minValue = GETEHDRIEXPOSURE(pGCRegs->SFWPositionSetpoint,0); // The value of the spactral filter
   }
   else // if ROTATING
   {
      if(pGCRegs->EHDRINumberOfExposures > 1)
         for(i=0; i<SFW_FILTER_NB; i++) // Min of EHDRI values of all spectral filters
            for(j=0; j<pGCRegs->EHDRINumberOfExposures; j++)
               minValue = MIN(GETEHDRIEXPOSURE(i,j), minValue);
      else
         for(i=0; i<SFW_FILTER_NB; i++)
            minValue = MIN(GETEHDRIEXPOSURE(i,0), minValue); // Min values of all spectral filters
   }


   return minValue;
}
*/
/*
 * Name         : itoa
 *
 * Synopsis     : char* itoa(int val, int base)
 * Arguments    : int  val : numerical value to convert in ASCII
 *                int  base : numerical base of the value
 *
 * Description  : Convert an integer number to a string of ASCII
 *
 * Returns      : char* : a pointer to a string of ASCII
 */
/*
char* itoa(int val, int base){

   static char buf[32] = {0};
   bool sign = false;

   int i = 30;

   if (val < 0)
   {
      sign = true;
      val *= -1;
   }

   for(; val && i ; i--, val /= base)
      buf[i] = "0123456789abcdef"[val % base];

   if (sign)
   {
      buf[i--] = '-';
   }

   return &buf[i+1];
}
*/

/**
 * Perform a memory copy. This version allows data bytes swapping.
 *
 * @param dst is the pointer to the destination memory.
 * @param src is the pointer to the source memory.
 * @param length is the amount of data to copy in bytes.
 * @param dataSize is the size of individual data elements in bytes
 *        (1 for char/uint8/int8, 2 for uint16/int16 and 4 for uint32/int32).
 * @param swap indicates whether the data bytes must be swapped.
 *
 * @return a pointer to destination data.
 */
void *memcpy_swap(void *dst, const void *src, size_t length, uint8_t dataSize, uint8_t swap)
{
   uint8_t *p_src = (uint8_t *)src;
   uint8_t *p_dst = (uint8_t *)dst;

   if (swap)
   {
      if  ((length % dataSize) == 0)
      {
         while (length > 0)
         {
            length--;

            *(p_dst + (length % dataSize)) = *p_src++;

            if  ((length % dataSize) == 0)
            {
               p_dst += dataSize;
            }
         }
      }
   }
   else
   {
      while (length > 0)
      {
         length--;

         *p_dst++ = *p_src++;
      }
   }

   return dst;
}

/**
 * Print memory data.
 *
 * @param buffer is the pointer to the memory buffer to print.
 * @param length is the amount of data to print in bytes.
 * @param baseAddr is the address corresponding to the first buffer byte.
 * @param lineSize is the number of bytes to print on a single line.
 */
void memdump(const void *buffer, size_t length, uint32_t baseAddr, uint32_t lineSize)
{
#ifdef ENABLE_PRINTF
   uint8_t *p_buffer = (uint8_t *)buffer;
   uint32_t i;

   for (i = 0; i < length; i++)
   {
     if ( i % lineSize == 0)
     {
       PRINTF("0x%08X: 0x", baseAddr + i);
     }

     PRINTF("%02X", p_buffer[i]);

     if ( i % lineSize == lineSize - 1)
     {
       PRINTF("\n");
     }
     else
     {
       PRINTF(" ");
     }
   }

   if (length % lineSize != 0)
   {
      PRINTF("\n");
   }
#endif
}

/**
 * Convert hex digit to its numerical value.
 *
 * @param x is the hex digit to convert.
 *
 * @return The value corresponding to the hex digit.
 * @return 0 if the specified char is not an hex digit.
 */
uint8_t Hex2Val(char x)
{
   uint8_t val = 0;

   if ((x >= '0') && (x <= '9'))
   {
      val = (uint8_t)(x - '0');
   }
   else if ((x >= 'A') && (x <= 'F'))
   {
      val = ((uint8_t)(x - 'A')) + 10;
   }
   else if ((x >= 'a') && (x <= 'f'))
   {
      val = ((uint8_t)(x - 'a')) + 10;
   }

   return val;
}

/**
 * Convert two hex digits to its a byte value.
 *
 * @param buffer is char buffer containing the hex digits to convert.
 *
 * @return The byte value corresponding to the hex digits.
 */
uint8_t Hex2Byte(const char *buffer)
{
   return ((Hex2Val(buffer[0]) << 4) + Hex2Val(buffer[1]));
}

/**
 * Convert (2 * N) hex digits to their N bytes value.
 *
 * @param buffer is a char buffer containing the hex digits to convert.
 * @param buflen is the char buffer length.
 * @param bytebuffer is the byte buffer where the converted bytes will be written.
 * @param bytebuflen is the byte buffer length.
 *
 * @return The number of bytes written in byte buffer.
 */
uint32_t Hex2Bytes(const char *buffer, uint32_t buflen, uint8_t *bytebuffer, uint32_t bytebuflen)
{
   uint32_t i;
   uint32_t byteCount = 0;

   for (i = 0; ((i < buflen) && (byteCount < bytebuflen)); i += 2)
   {
      bytebuffer[byteCount++] = Hex2Byte(&buffer[i]);
   }

   return byteCount;
}

/**
 * Mathematically correct implementation of a modulus operator.
 *
 * performs y = a mod b
 *            = a - n.*b where n = floor(a./b) if b ~= 0
 *
 * the C '%' operator is actually a remainder operation, which has the same
 * result when a and b have the same sign
 *
 * @param a is an integer.
 * @param b is an integer
 *
 * @return The number of bytes written in byte buffer.
 */
int mod(int a, int b) {
   return ((a % b) + b) % b;
}

/**
 * Round an integer value to the next multiple.
 *
 * @param x is the integer
 * @param m is the multiple
 *
 * @return Next multiple.
 */
uint32_t roundUp(uint32_t x, uint32_t m)
{
   if (m == 0)
      return x;

   if (x == 0)
      return 0;

   return ((((x - 1) / m) + 1) * m);
}

/**
 * Round an integer value to the previous multiple.
 *
 * @param x is the integer
 * @param m is the multiple
 *
 * @return Previous multiple.
 */
uint32_t roundDown(uint32_t x, uint32_t m)
{
   if (m == 0)
      return x;

   return x - (x % m);
}

void resetStats(statistics_t* s)
{
   if (s != 0)
   {
      s->N = 0;
      s->max = FLT_MIN;
      s->min = FLT_MAX;
      s->mu = 0;
      s->R = 0;
      s->var = -1; // invalid result for N < 2
   }
}

void updateStats(statistics_t* s, float x)
{
   if (s != 0)
   {
      float N = ++s->N;
      float tmp = x - s->mu;

      s->mu += tmp/N;

      s->R += tmp * (x - s->mu);

      if (x > s->max)
         s->max = x;

      if (x < s->min)
         s->min = x;

      if (N > 1)
         s->var = s->R/(N-1);
   }
}

void reportStats(statistics_t* s, char* label)
{
#ifdef ENABLE_PRINTF
   char defaultLabel[12] = "Untitled";
   char* str;

   if (label == 0)
      str = defaultLabel;
   else
      str = label;

   PRINTF("Statistics report for %s\n", str);
   PRINTF("Number of samples %d\n", s->N);
   PRINTF("Min value :" _PCF(3) "\n", _FFMT(s->min, 3));
   PRINTF("Max value :" _PCF(3) "\n", _FFMT(s->max, 3));
   PRINTF("Average :" _PCF(3) "\n", _FFMT(s->mu, 3));
   PRINTF("Std :" _PCF(3) "\n", _FFMT(sqrtf(s->var), 3));
#endif
}

int gcd(int x, int y)
{
   int a, b;
   int r;

   a = x;
   b = y;

   r = a % b;
   while(r)
   {
      a = b;
      b = r;
      r = a % b;
   }

   return b;
}

int lcm(int x, int y)
{
   return x * (y/gcd(x,y));
}

uint32_t select(uint32_t* list, int left, int right, int n)
{
     while (1)
     {
         if (left == right)
             return list[left];

         int pivotIndex = (left + right)/2; // select pivotIndex between left and right
         pivotIndex = partition(list, left, right, pivotIndex);
         if (n == pivotIndex)
             return list[n];
         else if (n < pivotIndex)
             right = pivotIndex - 1;
         else
             left = pivotIndex + 1;
     }
}

int partition(uint32_t* list, int left, int right, int pivotIndex)
{
   int i;
   int pivotValue = list[pivotIndex];
   uint32_t tmp;
   int storeIndex = left;

   tmp = list[right];
   list[right] = list[pivotIndex]; // Move pivot to end
   list[pivotIndex] = tmp;

   for (i=left; i<right; ++i)
   {
      if (list[i] < pivotValue)
      {
         tmp = list[i];
         list[i] = list[storeIndex];
         list[storeIndex] = tmp;
         ++storeIndex;
      }
   }
   tmp = list[right];
   list[right] = list[storeIndex]; // Move pivot to its final place
   list[storeIndex] = tmp;

   return storeIndex;
}
