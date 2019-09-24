/**
 *  @file XADC.c
 *  XADC and XSysmon module implementation.
 *  
 *  This file implements the XADC and XSysmon module.
 *  
 *  $Rev$
 *  $Author$
 *  $Date$
 *  $Id$
 *  $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include <string.h>
#include <math.h>
#include "XADC.h"
#include "XADC_Channels.h"
#include "xstatus.h"
#include "utils.h"
#ifdef XADC_EXTERNAL_CHANNELS_ENABLED
#include "power_ctrl.h"
#endif

#define FILTER_DEPTH 5  /* depth of the moving average filter */

XSysMon xsm;


/* Prototypes */
static void FilterAdcData(xadcChannel_t *xadcCh);

IRC_Status_t XADC_Init(uint16_t xsmDeviceId)
{
   XSysMon_Config *xsmConfig;
   XStatus status;

   // Get the configuration of system monitor
   xsmConfig = XSysMon_LookupConfig(xsmDeviceId);

   // Initialize the system monitor
   status = XSysMon_CfgInitialize(&xsm, xsmConfig, xsmConfig->BaseAddress);
   if (status != XST_SUCCESS)
   {
     return IRC_FAILURE;
   }

   // Disable Averaging
   XSysMon_SetAvg(&xsm, XSM_AVG_64_SAMPLES);

   // Set the ADCCLK frequency equal to 1/32 of System clock
   XSysMon_SetAdcClkDivisor(&xsm, 32);

   // Disable all the alarms
   XSysMon_SetAlarmEnables(&xsm, 0x0000);

   // Disable the Sequencer before configuring registers.
   XSysMon_SetSequencerMode(&xsm, XSM_SEQ_MODE_SAFE);

   /*
    * Input mode is set to bipolar mode for VRefN and to
    * unipolar mode for every other channels.
    */
   status = XSysMon_SetSeqInputMode(&xsm, XSM_SEQ_CH_VREFN);
   if (status != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   /*
    * Settling time is set to 10 ADCCLK cycles for external
    * channels (VPVN) and to the default 4 ADCCLK cycles for
    * internal channels.
    */
   status = XSysMon_SetSeqAcqTime(&xsm, XSM_SEQ_CH_VPVN);
   if (status != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   /*
    * Averaging is disabled for every channels.
    */
   status =  XSysMon_SetSeqAvgEnables(&xsm, 0xFFFFFFFF);
   if (status != XST_SUCCESS)
   {
      return IRC_FAILURE;
   }

   /*
    * The following channels are enabled in the sequencer registers:
    *    - On-chip Temperature
    *    - On-chip VCCINT supply sensor
    *    - On-chip VCCAUX supply sensor
    *    - VPVN external channel reading (if external channels enabled)
    *    - VREFP reference voltage
    *    - VREFN reference voltage
    *    - On-chip VCCBRAM supply sensor
    */
   status =  XSysMon_SetSeqChEnables(&xsm,
         XSM_SEQ_CH_TEMP |
         XSM_SEQ_CH_VCCINT |
         XSM_SEQ_CH_VCCAUX |
#ifdef XADC_EXTERNAL_CHANNELS_ENABLED
         XSM_SEQ_CH_VPVN |
#endif
         XSM_SEQ_CH_VREFP |
         XSM_SEQ_CH_VREFN |
         XSM_SEQ_CH_VBRAM);
   if (status != XST_SUCCESS) {
      return XST_FAILURE;
   }

   return IRC_SUCCESS;
}

/*
 * XADC offset gain voltage value to physical unit value converter.
 *
 * @param xadcCh is the pointer to the XADC channel data structure to use for conversion.
 */
void XADC_OGPhyConv(xadcChannel_t *xadcCh)
{
   if(xadcCh->p_physical != NULL)
   {
      *(xadcCh->p_physical) = (xadcCh->voltage * xadcCh->phyGain) + xadcCh->phyOffset;
   }
}

void StartXADCSequence()
{
   // Disable the sequencer
   XSysMon_SetSequencerMode(&xsm, XSM_SEQ_MODE_SAFE);

   // Start sequence
   XSysMon_SetSequencerMode(&xsm, XSM_SEQ_MODE_ONEPASS);

   // Clear the old status
   XSysMon_GetStatus(&xsm);
}

void ProcessAdcChannel(xadcChannel_t *xadcCh)
{
   switch (xadcCh->polarity)
   {
      case XCP_UNIPOLAR:
         xadcCh->voltage = ((float)(xadcCh->raw.unipolar) * xadcCh->voltGain) + xadcCh->voltOffset;
         break;
      case XCP_BIPOLAR:
         xadcCh->voltage = ((float)(xadcCh->raw.bipolar) * xadcCh->voltGain) + xadcCh->voltOffset;
         break;
   }

   FilterAdcData(xadcCh);

   if (xadcCh->phyConverter != NULL)
   {
      (*xadcCh->phyConverter)(xadcCh);

      xadcCh->isValid = 1;

      if (xadcCh->callback != NULL)
      {
         (*xadcCh->callback)(xadcCh);
      }

      switch (xadcCh->unit)
      {
         case XCU_NONE:
            XADC_DBG("ADC @ 0x%02X: %04X, %d mV, %d", xadcCh->muxAddr, xadcCh->raw.unipolar, (int32_t)(xadcCh->voltage * 1000.0f), (int32_t)(*(xadcCh->p_physical)));
            break;

         case XCU_VOLT:
            XADC_DBG("ADC @ 0x%02X: %04X, %d mV, %d mV", xadcCh->muxAddr, xadcCh->raw.unipolar, (int32_t)(xadcCh->voltage * 1000.0f), (int32_t)(*(xadcCh->p_physical) * 1000.0f));
            break;

         case XCU_CELCIUS:
            XADC_DBG("ADC @ 0x%02X: %04X, %d mV, %d mC", xadcCh->muxAddr, xadcCh->raw.unipolar, (int32_t)(xadcCh->voltage * 1000.0f), (int32_t)(*(xadcCh->p_physical) * 1000.0f));
            break;

         case XCU_AMPERE:
            XADC_DBG("ADC @ 0x%02X: %04X, %d mV, %d mA", xadcCh->muxAddr, xadcCh->raw.unipolar, (int32_t)(xadcCh->voltage * 1000.0f), (int32_t)(*(xadcCh->p_physical) * 1000.0f));
            break;
      }
   }
}

/**
 * XADC monitor state machine.

\dot
digraph G {
   XADC_INIT -> XADC_START_SEQUENCE -> XADC_READ_CHANNELS -> XADC_START_SEQUENCE
}
\enddot

 */
void XADC_SM()
{
   static xadcState_t xadcState = XADC_INIT;
   static uint64_t tic_xadcSampling;
#ifdef XADC_EXTERNAL_CHANNELS_ENABLED
   static uint32_t curExtCh;
#endif
   uint32_t i;

   switch (xadcState)
   {
      case XADC_INIT:
#ifdef XADC_EXTERNAL_CHANNELS_ENABLED
         curExtCh = 0;
         Power_SetMuxAddr(extAdcChannels[curExtCh].muxAddr);
#endif
         GETTIME(&tic_xadcSampling);
         xadcState = XADC_START_SEQUENCE;
         break;

      case XADC_START_SEQUENCE:
         if (elapsed_time_us(tic_xadcSampling) > XADC_SAMPLING_PERIOD_US)
         {
            StartXADCSequence();
            xadcState = XADC_READ_CHANNELS;
         }
         break;

      case XADC_READ_CHANNELS:
         // Wait the end of internal sequence
         if ((XSysMon_GetStatus(&xsm) & XSM_SR_EOS_MASK) == XSM_SR_EOS_MASK)
         {
            // Read the internal ADC channels data from the data registers
            intAdcChannels[XIC_TEMP].raw.unipolar = XSysMon_GetAdcData(&xsm, XSM_CH_TEMP);
            intAdcChannels[XIC_VCCINT].raw.unipolar = XSysMon_GetAdcData(&xsm, XSM_CH_VCCINT);
            intAdcChannels[XIC_VCCAUX].raw.unipolar = XSysMon_GetAdcData(&xsm, XSM_CH_VCCAUX);
            intAdcChannels[XIC_VREFP].raw.unipolar = XSysMon_GetAdcData(&xsm, XSM_CH_VREFP);
            intAdcChannels[XIC_VREFN].raw.unipolar = XSysMon_GetAdcData(&xsm, XSM_CH_VREFN);
            intAdcChannels[XIC_VBRAM].raw.unipolar = XSysMon_GetAdcData(&xsm, XSM_CH_VBRAM);

            // Process internal ADC channels data
            for (i = 0; i < XIC_COUNT; ++i)
            {
               ProcessAdcChannel(&intAdcChannels[i]);
            }
            
#ifdef XADC_EXTERNAL_CHANNELS_ENABLED
            // Read the external ADC channel data from the data register
            extAdcChannels[curExtCh].raw.unipolar = XSysMon_GetAdcData(&xsm, XSM_CH_VPVN);

            // Process external ADC channel data
            ProcessAdcChannel(&extAdcChannels[curExtCh]);

            // Prepare XADC to read next external ADC channel
            curExtCh = (curExtCh + 1) % XEC_COUNT;
            Power_SetMuxAddr(extAdcChannels[curExtCh].muxAddr);
#endif

            GETTIME(&tic_xadcSampling);
            xadcState = XADC_START_SEQUENCE;
         }
         else if (elapsed_time_us(tic_xadcSampling) > XADC_TIMEOUT_PERIOD_US)
         {
#ifndef STARTUP
            XADC_INF("XADC Timeout");
#endif
            xadcState = XADC_INIT;
            XADC_Init(xsm.Config.DeviceId);
         }
         break;
   }
}


/*
 * Moving average filter
 */
static void FilterAdcData(xadcChannel_t *xadcCh)
{
   static float intChanSamples[XIC_COUNT][FILTER_DEPTH];
#ifdef XADC_EXTERNAL_CHANNELS_ENABLED
   static float extChanSamples[XEC_COUNT][FILTER_DEPTH];
#endif
   float sum = 0.0F;
   int i;

   if (xadcCh->muxAddr == 0xFF)
   {
      if (!xadcCh->isValid)
      {
         for (i = 0; i < FILTER_DEPTH-1; i++)
            intChanSamples[xadcCh->id][i] = xadcCh->voltage;
      }
      memmove(&intChanSamples[xadcCh->id][1], &intChanSamples[xadcCh->id][0],
              sizeof(float) * (FILTER_DEPTH-1));
      intChanSamples[xadcCh->id][0] = xadcCh->voltage;

      for (i = 0; i < FILTER_DEPTH; i++)
         sum += intChanSamples[xadcCh->id][i];
   }
#ifdef XADC_EXTERNAL_CHANNELS_ENABLED
   else
   {
      if (!xadcCh->isValid)
      {
         for (i = 0; i < FILTER_DEPTH-1; i++)
            extChanSamples[xadcCh->id][i] = xadcCh->voltage;
      }
      memmove(&extChanSamples[xadcCh->id][1], &extChanSamples[xadcCh->id][0],
              sizeof(float) * (FILTER_DEPTH-1));
      extChanSamples[xadcCh->id][0] = xadcCh->voltage;

      for (i = 0; i < FILTER_DEPTH; i++)
         sum += extChanSamples[xadcCh->id][i];
   }
#endif

   xadcCh->voltage = sum / FILTER_DEPTH;
}
