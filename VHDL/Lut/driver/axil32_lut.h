/* $Id: axil32_lut.h 7677 2010-04-09 14:36:26Z rd\pdubois $ */
/****************************************************************************/
/**
*
* @file axil32_lut.h
* 
* This driver controls the module axil32_lut via Wishbone.
* Please see the following documentation about details of this module:
* \IRCDEV\Technique\Electronique\M9 - ROIC\Calibration\PDR - axil32_lut.doc
* 
* Author(s) : Patrick Dubois
*
*****************************************************************************/

#ifndef __AXIL32_LUT_H__
#define __AXIL32_LUT_H__

/***************************** Include Files ********************************/
#include <stdint.h>

/************************** Constant Definitions ****************************/

/**************************** Type Definitions ******************************/

/**
 * LUT driver object
 */
typedef struct
{					   
   float    x_min;     
   float    x_range; 
   float    lut_size;
   uint32_t lut_start_add;   
   uint32_t lut_end_add;
   float    lut_factor;    
   float    lut_factor_inv;
} t_lut;


/***************** Macros (Inline Functions) Definitions ********************/

#define LUT_Ctor() {0.0F, 0.0F, 0.0F, 0, 0, 0.0F, 0.0F}

/************************** Function Prototypes *****************************/

/*****************************************************************************
   build the LUT config   
   @param pObj Pointer to a LUT object
   @param x_min Minimum value of input data X
   @param x_range Range of values of input data X (effectively x_max-x_min)
   @param lut_size Size of one LUT (there can be many LUTs stored in ram)
   
*******************************************************************************/
void LUT_BuildConfig(t_lut *pObj, const float x_min, const float x_range, const float lut_size);


#endif // __AXIL32_LUT_H__
