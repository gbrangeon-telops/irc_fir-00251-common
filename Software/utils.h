/**
 *  @file utils.h
 *  Header file for utilities and usefull functions.
 *  
 *  Defines many macros and function usefull for the Processing FPGA.
 *  
 *  $Rev$
 *  $Author$
 *  $LastChangedDate$
 *  $Id$
 *  $URL$
 */
#ifndef __UTILS_H__
#define __UTILS_H__

#include <stdint.h>
#include <math.h>

#ifdef SIM
   #define WAIT_US(a) ((*global_trans_ptr)->mb_wait_us(a))  /**< wait function for simulation */
   #define GETTIME(a) ((*global_trans_ptr)->XTime_GetTime(a))  /**< get ticks function for simulation */
#else   
   #include <stdio.h>
   #include "sleep.h"
   #include "Timer.h"
   #define WAIT_US(a) (usleep(a))   /**< wait function for rtl */
   #define GETTIME(a) (Timer_GetTime(a))  /**< get ticks function for rtl */
#endif

// Stringnification macros
#define XSTR(s) STR(s)
#define STR(s) #s

#define BitMaskSet(arg, mask) ((arg) |= (mask))             /**< Set masked bits in arg */
#define BitMaskClr(arg, mask) ((arg) &= ~(mask))            /**< Clear masked bits in arg */
#define BitMaskTst(arg, mask) (((arg) & (mask)) == (mask))  /**< Test if masked bits in arg are all set */
#define BitMaskTstAny(arg, mask) (((arg) & (mask)) != 0)    /**< Test if at least of of the masked bits in arg is set */
#define BitMaskFlp(arg, mask) ((arg) ^= (mask))              /**< Flip masked bits in arg */

#define BitSet(arg, pos) BitMaskSet(arg, (1ULL << (pos)))   	/**< Set bit(pos) in arg */
#define BitClr(arg, pos) BitMaskClr(arg, (1ULL << (pos)))   	/**< Clear bit(pos) in arg */
#define BitTst(arg, pos) BitMaskTst(arg, (1ULL << (pos)))   	/**< Test if bit(pos) in arg is true else false */
#define BitFlp(arg, pos) BitMaskFlp(arg, (1ULL << (pos)))   	/**< Flip bit(pos) in arg */

#define MAX(a,b) (a>b? a : b) /**< Find maximum between to number */
#define MIN(a,b) (a>b? b : a) /**< Find minimum between to number */
#define NUM_OF(x) (sizeof (x) / sizeof *(x)) /**< Get the number of element in an array */
#define XOR(a,b) (!a != !b)

typedef struct
{
   uint32_t N;
   float max;
   float min;
   float avg;
   float R; // for variance calculation -> var = R/(N-1)
   float var;
} statistics_t;

void resetStats(statistics_t* s);
void updateStats(statistics_t* s, float x);
void reportStats(statistics_t* s, char* label);

/*******************************************************/
// Sign extension macros
// Parameters:
//    value       Signed value coded on n bits
//    bitlength   Original number of bits (n) of coded value (e.g. 20, 24 ...)
#define SIGN_EXT16(value, bitlength)   if ( ( value & ( 0x0001 << ( bitlength - 1 ) ) ) != 0 ) value |= ( 0xFFFF << bitlength )  /**< Extend the bit sign of value to 16 bits from bitlength (number of bits) */
#define SIGN_EXT32(value, bitlength)   if ( ( value & ( 0x00000001 << ( bitlength - 1 ) ) ) != 0 ) value |= ( 0xFFFFFFFF << bitlength )   /**< Extend the bit sign of value to 32 bits from bitlength (number of bits) */
/*******************************************************/

#define TIME_ONE_SECOND_US    ((uint64_t)1000000)
#define TIME_TEN_SECOND_US    ((uint64_t)10000000)
#define TIME_ONE_MINUTE_US    ((uint64_t)60000000)

// Temperature conversion macros
#define CC_TO_C(temp_cC)   ((float)temp_cC / 100.0F)
#define C_TO_CC(temp_C)    ((int16_t)(temp_C * 100.0F))
#define C_TO_K(temp_C)     (temp_C + 273.15F)
#define K_TO_C(temp_K)     (temp_K - 273.15F)
#define CC_TO_K(temp_cC)   C_TO_K(CC_TO_C(temp_cC))
#define K_TO_CC(temp_K)    C_TO_CC(K_TO_C(temp_K))

// Functions prototype
uint64_t elapsed_time_us(uint64_t tic);
uint32_t bitget(uint32_t value, uint8_t bitposition);
void WriteStruct(const void* pStruct);
float floorMultiple( float value, float quantity );
float ceilMultiple( float value, float quantity );
void *memcpy_swap(void *dst, const void *src, size_t length, uint8_t dataSize, uint8_t swap);
void memdump(const void *buffer, size_t length, uint32_t baseAddr, uint32_t lineSize);
uint8_t Hex2Val(const char x);
uint8_t Hex2Byte(const char *buffer);
uint32_t Hex2Bytes(const char *buffer, uint32_t buflen, uint8_t *bytebuffer, uint32_t bytebuflen);

int mod(int a, int b); /*< correct modulo operator implementation (vs %, which is actually a remainder operator) */
uint32_t roundUp(uint32_t x, uint32_t m);
uint32_t roundDown(uint32_t x, uint32_t m);

int gcd(int a, int b); /*< greatest common divisor of a and b */
int lcm(int a, int b); /*< lowest common multiple of a and b */

// quick selection algorithm
uint32_t select(uint32_t* list, int left, int right, int n);
// used by select()
int partition(uint32_t* list, int left, int right, int pivotIndex);

/*
void ReadStruct(void* pStruct);
void ReadRS232Struct(void* pStruct);
void ReadArray16(uint16_t pAry[], uint32_t Length, uint32_t add);
void WriteArray16(const uint16_t pAry[], uint32_t Length, uint32_t add);
void PrintArray16(const uint16_t pAry[], uint32_t Length);
void ReadArrayFloatLong(float pAry[], uint32_t Length, uint32_t add);

uint8_t GetFirstHighBitPos( uint32_t data, uint8_t bitSize );
uint32_t endian_swap_32(uint32_t x);
char* itoa(int val, int base);
*/
#ifdef SIM
   void sim_print(char *ptr);
   void sim_printf(const char *format, ...);
#endif

/*
float MaxExposureTime(GeniCam_Registers_Set_t *pGCRegs);
static float MaxFloat(float val1, float val2);
float MinExposureTime(GeniCam_Registers_Set_t *pGCRegs);
static float MinFloat(float val1, float val2);
*/
#endif //__UTILS_H__
