/**
 *  @file XADC.h
 *  XADC and XSysmon monitor module header.
 *  
 *  This file defines the XADC and XSysmon module.
 *  
 *  $Rev$
 *  $Author$
 *  $Date$
 *  $Id$
 *  $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef XADC_H
#define XADC_H

#include <stdint.h>
#include "xsysmon.h"
#include "IRC_Status.h"
#include "verbose.h"

#ifdef XADC_VERBOSE
   #define XADC_PRINTF(fmt, ...)    FPGA_PRINTF("XADC: " fmt, ##__VA_ARGS__)
#else
   #define XADC_PRINTF(fmt, ...)    DUMMY_PRINTF("XADC: " fmt, ##__VA_ARGS__)
#endif

#define XADC_ERR(fmt, ...)          FPGA_PRINTF("XADC: Error: " fmt "\n", ##__VA_ARGS__)
#define XADC_INF(fmt, ...)          FPGA_PRINTF("XADC: Info: " fmt "\n", ##__VA_ARGS__)
#define XADC_DBG(fmt, ...)          XADC_PRINTF("Debug: " fmt "\n", ##__VA_ARGS__)

#define XADC_SAMPLING_PERIOD_US     (uint64_t) 100000
#define XADC_TIMEOUT_PERIOD_US      (uint64_t) 2000000

#define XADC_NUM_SKIPPED_SAMPLES    1

/**
 * XADC state.
 */
enum xadcStateEnum {
   XADC_INIT = 0,          /**< State machine initialization */
   XADC_START_SEQUENCE,    /**< Start XADC sequence */
   XADC_READ_CHANNELS      /**< Read XADC channels */
};

/**
 * XADC state data type.
 */
typedef enum xadcStateEnum xadcState_t;

/**
 * XADC channel polarity.
 */
enum xadcChPolarityEnum {
   XCP_UNIPOLAR = 0,    /**< Unipolar */
   XCP_BIPOLAR          /**< Bipolar */
};

/**
 * XADC channel polarity data type.
 */
typedef enum xadcChPolarityEnum xadcChPolarity_t;

/**
 * XADC channel units.
 */
enum xadcChUnitEnum {
   XCU_NONE = 0,  /**< None */
   XCU_VOLT,      /**< Voltage (V) */
   XCU_CELCIUS,   /**< Temperature (oC) */
   XCU_AMPERE     /**< CURRENT (A) */
};

/**
 * XADC channel unit data type.
 */
typedef enum xadcChUnitEnum xadcChUnit_t;

/**
 * XADC channel data type.
 */
typedef struct xadcChannelStruct xadcChannel_t;

/**
 * XADC function pointer type.
 */
typedef void (*xadcFunc_t)(xadcChannel_t *xadcCh);

/**
 * XADC channel data structure.
 */
struct xadcChannelStruct {
   uint8_t id;                /**< XADC channel id **/
   uint8_t isValid;           /**< XADC channel validity flag **/
   uint8_t muxAddr;           /**< XADC channel external multiplexer address (5-bit, 0xFF for internal) */
   xadcChPolarity_t polarity; /**< XADC channel polarity **/
   xadcChUnit_t unit;         /**< Physical value unit */
   union {
      uint16_t unipolar;
      int16_t bipolar;
   } raw;                     /**< Raw ADC value in count */
   float voltOffset;          /**< Raw ADC value to voltage value offset */
   float voltGain;            /**< Raw ADC value to voltage value  gain */
   float voltage;             /**< Voltage value corresponding to raw ADC value */
   float phyOffset;           /**< Voltage value to physical value offset */
   float phyGain;             /**< Voltage value to physical value gain */
   xadcFunc_t phyConverter;   /**< Voltage value to physical unit value converter function pointer */
   float * p_physical;        /**< Physical value corresponding to voltage value */
   xadcFunc_t callback;       /**< XADC channel process callback function pointer */
};


IRC_Status_t XADC_Init(uint16_t xsmDeviceId);
void XADC_SM();
void XADC_OGPhyConv(xadcChannel_t *xadcCh);
void StartXADCSequence();
void ProcessAdcChannel(xadcChannel_t *xadcCh);

#endif // XADC_H
