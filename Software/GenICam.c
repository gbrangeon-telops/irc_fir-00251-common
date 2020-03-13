/**
 *  @file GenICam.c
 *  GenICam registers definition module implementation.
 *  
 *  $Rev$
 *  $Author$
 *  $Date$
 *  $Id$
 *  $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#include "GenICam.h"
#include "utils.h"

/* AUTO-CODE BEGIN */
// Auto-generated GeniCam library.
// Generated from XML camera definition file version 12.8.0
// using generateGenICamCommonCLib.m Matlab script.

// GenICam global variables definition
////////////////////////////////////////////////////////////////////////////////

/**
 * Registers definition array
 */
gcRegister_t gcRegsDef[GC_REG_COUNT] = {
   /* DeviceVendorName */                                      {0x00000048, NULL, NULL, 32, 32, GCRO_Processing_FPGA, REG_UNLOCKED|REG_STRING|REG_RO|REG_NOTSHARED},
   /* DeviceModelName */                                       {0x00000068, NULL, NULL, 32, 32, GCRO_Processing_FPGA, REG_UNLOCKED|REG_STRING|REG_RO|REG_NOTSHARED},
   /* DeviceVersion */                                         {0x00000088, NULL, NULL, 32, 32, GCRO_Processing_FPGA, REG_UNLOCKED|REG_STRING|REG_RO|REG_NOTSHARED},
   /* DeviceManufacturerInfo */                                {0x000000A8, NULL, NULL, 48, 48, GCRO_Processing_FPGA, REG_UNLOCKED|REG_STRING|REG_RO|REG_NOTSHARED},
   /* DeviceID */                                              {0x000000D8, NULL, NULL, 16, 16, GCRO_Processing_FPGA, REG_UNLOCKED|REG_STRING|REG_RO|REG_NOTSHARED},
   /* GevFirstURL */                                           {0x00000200, NULL, NULL, 512, GC_GEVFIRSTURL_DATA_LENGTH, GCRO_Processing_FPGA, REG_UNLOCKED|REG_STRING|REG_RO|REG_NOTSHARED},
   /* GevSecondURL */                                          {0x00000400, NULL, NULL, 512, 0, GCRO_Processing_FPGA, REG_UNLOCKED|REG_STRING|REG_RO|REG_NOTSHARED},
   /* SensorWidth */                                           {0x0000A020, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_SHARED|REG_BIGENDIAN},
   /* SensorHeight */                                          {0x0000A024, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_SHARED|REG_BIGENDIAN},
   /* DeviceRegistersStreamingStart */                         {0x0000D1BC, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceRegistersStreamingEnd */                           {0x0000D1C0, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* Width */                                                 {0x0000D300, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* Height */                                                {0x0000D304, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* PixelFormat */                                           {0x0000D308, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* PayloadSize */                                           {0x0000D30C, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* AcquisitionMode */                                       {0x0000D310, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* AcquisitionStart */                                      {0x0000D314, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_SHARED|REG_BIGENDIAN},
   /* AcquisitionStop */                                       {0x0000D318, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_SHARED|REG_BIGENDIAN},
   /* DeviceReset */                                           {0x0000D340, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* AcquisitionArm */                                        {0x0000E800, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_SHARED|REG_BIGENDIAN},
   /* ExposureMode */                                          {0x0000E804, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* ExposureTime */                                          {0x0000E808, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* ExposureTimeSetToMax */                                  {0x0000E80C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* AcquisitionFrameRate */                                  {0x0000E810, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* AcquisitionFrameRateSetToMax */                          {0x0000E814, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* AcquisitionFrameRateMode */                              {0x0000E818, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* AcquisitionFrameRateMaxFG */                             {0x0000E81C, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* AECImageFraction */                                      {0x0000E820, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* AECTargetWellFilling */                                  {0x0000E824, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* AECResponseTime */                                       {0x0000E828, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* ExposureAuto */                                          {0x0000E82C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* EHDRIMode */                                             {0x0000E830, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* EHDRIExpectedTemperatureMin */                           {0x0000E834, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* EHDRIExpectedTemperatureMinMax */                        {0x0000E838, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* EHDRIExpectedTemperatureMax */                           {0x0000E83C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* EHDRIExpectedTemperatureMaxMin */                        {0x0000E840, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* EHDRINumberOfExposures */                                {0x0000E844, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* EHDRIResetToDefault */                                   {0x0000E848, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* ExposureTime1 */                                         {0x0000E84C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* ExposureTime2 */                                         {0x0000E850, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* ExposureTime3 */                                         {0x0000E854, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* ExposureTime4 */                                         {0x0000E858, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* EHDRIExposureOccurrence1 */                              {0x0000E85C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* EHDRIExposureOccurrence2 */                              {0x0000E860, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* EHDRIExposureOccurrence3 */                              {0x0000E864, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* EHDRIExposureOccurrence4 */                              {0x0000E868, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* CalibrationMode */                                       {0x0000E86C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* CalibrationCollectionCount */                            {0x0000E870, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* CalibrationCollectionSelector */                         {0x0000E874, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* CalibrationCollectionPOSIXTime */                        {0x0000E878, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* CalibrationCollectionLoad */                             {0x0000E87C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* CalibrationCollectionActivePOSIXTime */                  {0x0000E880, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* ImageCorrectionMode */                                   {0x0000E884, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* ImageCorrection */                                       {0x0000E888, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* NDFilterPositionSetpoint */                              {0x0000E88C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* NDFilterPosition */                                      {0x0000E890, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* NDFilterNumber */                                        {0x0000E894, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* NDFilterPositionRawSetpoint */                           {0x0000E898, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* NDFilterPositionRaw */                                   {0x0000E89C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* FWMode */                                                {0x0000E8A0, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* FWPositionSetpoint */                                    {0x0000E8A4, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* FWPosition */                                            {0x0000E8A8, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* FWFilterNumber */                                        {0x0000E8AC, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* FWPositionRawSetpoint */                                 {0x0000E8B0, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* FWPositionRaw */                                         {0x0000E8B4, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* FWSpeedSetpoint */                                       {0x0000E8B8, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* FWSpeed */                                               {0x0000E8BC, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* FWSpeedMax */                                            {0x0000E8C0, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* ExternalLensSerialNumber */                              {0x0000E8C4, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* ManualFilterSerialNumber */                              {0x0000E8C8, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* ICUPositionSetpoint */                                   {0x0000E8CC, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* ICUPosition */                                           {0x0000E8D0, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* ReverseX */                                              {0x0000E8D4, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* ReverseY */                                              {0x0000E8D8, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* SensorWellDepth */                                       {0x0000E8DC, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* IntegrationMode */                                       {0x0000E8E0, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* AcquisitionStartAtStartup */                             {0x0000E8E4, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* CenterImage */                                           {0x0000E8E8, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* LockedCenterImage */                                     {0x0000E8EC, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* TriggerSelector */                                       {0x0000E8F0, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* TriggerMode */                                           {0x0000E8F4, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* TriggerSoftware */                                       {0x0000E8F8, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* TriggerSource */                                         {0x0000E8FC, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* TriggerActivation */                                     {0x0000E900, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* TriggerDelay */                                          {0x0000E904, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferMode */                                      {0x0000E908, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* MemoryBufferNumberOfImagesMax */                         {0x0000E90C, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferNumberOfSequencesMax */                      {0x0000E910, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferSequenceCount */                             {0x0000E914, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_SHARED|REG_BIGENDIAN},
   /* MemoryBufferNumberOfSequences */                         {0x0000E918, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferSequenceSizeMax */                           {0x0000E91C, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferSequenceSize */                              {0x0000E920, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferSequencePreMOISize */                        {0x0000E924, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferSequenceSelector */                          {0x0000E928, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferSequenceFirstFrameID */                      {0x0000E92C, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferSequenceMOIFrameID */                        {0x0000E930, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferSequenceRecordedSize */                      {0x0000E934, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferSequenceDownloadImageFrameID */              {0x0000E938, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferSequenceDownloadMode */                      {0x0000E93C, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* MemoryBufferSequenceClearAll */                          {0x0000E940, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* ExternalBlackBodyTemperature */                          {0x0000E944, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* DevicePowerStateSetpoint */                              {0x0000E948, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* DevicePowerState */                                      {0x0000E94C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceLedIndicatorState */                               {0x0000E950, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* StealthMode */                                           {0x0000E954, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* PowerOnAtStartup */                                      {0x0000E958, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* GPSLongitude */                                          {0x0000E95C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* GPSLatitude */                                           {0x0000E960, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* GPSAltitude */                                           {0x0000E964, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* GPSModeIndicator */                                      {0x0000E968, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* GPSNumberOfSatellitesInUse */                            {0x0000E96C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* AutomaticExternalFanSpeedMode */                         {0x0000E970, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* ExternalFanSpeedSetpoint */                              {0x0000E974, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* ExternalFanSpeed */                                      {0x0000E978, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* TimeSource */                                            {0x0000E97C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* POSIXTime */                                             {0x0000E980, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* SubSecondTime */                                         {0x0000E984, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* VideoAGC */                                              {0x0000E988, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* VideoColorMap */                                         {0x0000E98C, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* VideoColorMapMin */                                      {0x0000E990, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* VideoColorMapMax */                                      {0x0000E994, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* VideoDigitalZoomFactor */                                {0x0000E998, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* VideoEHDRIExposureIndex */                               {0x0000E99C, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* VideoFWPosition */                                       {0x0000E9A0, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* VideoBadPixelReplacement */                              {0x0000E9A4, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* VideoAGCFractionMin */                                   {0x0000E9A8, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* VideoAGCFractionMinMax */                                {0x0000E9AC, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* VideoAGCFractionMax */                                   {0x0000E9B0, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* VideoAGCFractionMaxMin */                                {0x0000E9B4, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* VideoAGCResponseTime */                                  {0x0000E9B8, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* VideoDigitalZoomMode */                                  {0x0000E9BC, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* VideoDigitalZoomWidth */                                 {0x0000E9C0, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* VideoDigitalZoomHeight */                                {0x0000E9C4, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* VideoDigitalZoomOffsetX */                               {0x0000E9C8, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* VideoDigitalZoomOffsetY */                               {0x0000E9CC, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* VideoReverseX */                                         {0x0000E9D0, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* VideoReverseY */                                         {0x0000E9D4, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* VideoFreeze */                                           {0x0000E9D8, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* DeviceSerialPortSelector */                              {0x0000E9E0, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceSerialPortBaudRate */                              {0x0000E9E4, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* ProprietaryFeature */                                    {0x0000E9E8, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceSerialNumber */                                    {0x0000E9EC, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* SensorID */                                              {0x0000E9F0, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* WidthMax */                                              {0x0000E9F4, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* HeightMax */                                             {0x0000E9F8, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* WidthMin */                                              {0x0000E9FC, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* WidthInc */                                              {0x0000EA00, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* HeightMin */                                             {0x0000EA04, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* HeightInc */                                             {0x0000EA08, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* OffsetXInc */                                            {0x0000EA0C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* OffsetYInc */                                            {0x0000EA10, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* PixelDataResolution */                                   {0x0000EA14, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* EventSelector */                                         {0x0000EA18, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* EventNotification */                                     {0x0000EA1C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* EventError */                                            {0x0000EA20, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_SHARED|REG_BIGENDIAN},
   /* EventErrorTimestamp */                                   {0x0000EA24, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_SHARED|REG_BIGENDIAN},
   /* EventErrorCode */                                        {0x0000EA28, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_SHARED|REG_BIGENDIAN},
   /* EventTelops */                                           {0x0000EA2C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_SHARED|REG_BIGENDIAN},
   /* EventTelopsTimestamp */                                  {0x0000EA30, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_SHARED|REG_BIGENDIAN},
   /* EventTelopsCode */                                       {0x0000EA34, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_SHARED|REG_BIGENDIAN},
   /* FValSize */                                              {0x0000EA38, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_SHARED|REG_BIGENDIAN},
   /* LValSize */                                              {0x0000EA3C, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* ClConfiguration */                                       {0x0000EA40, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* DeviceTapGeometry */                                     {0x0000EA44, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceXMLMajorVersion */                                 {0x0000EA48, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceXMLMinorVersion */                                 {0x0000EA4C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceXMLSubMinorVersion */                              {0x0000EA50, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceFirmwareMajorVersion */                            {0x0000EA54, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceFirmwareMinorVersion */                            {0x0000EA58, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceFirmwareSubMinorVersion */                         {0x0000EA5C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceFirmwareBuildVersion */                            {0x0000EA60, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceFirmwareModuleSelector */                          {0x0000EA64, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* DeviceFirmwareModuleRevision */                          {0x0000EA68, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_SHARED|REG_BIGENDIAN},
   /* DeviceTemperatureSelector */                             {0x0000EA6C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* DeviceTemperature */                                     {0x0000EA70, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RO|REG_SHARED|REG_BIGENDIAN},
   /* DeviceClockSelector */                                   {0x0000EA74, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* DeviceClockFrequency */                                  {0x0000EA78, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RO|REG_SHARED|REG_BIGENDIAN},
   /* DeviceRegistersCheck */                                  {0x0000EA7C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceRegistersValid */                                  {0x0000EA80, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceNotReady */                                        {0x0000EA84, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceVoltageSelector */                                 {0x0000EA88, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* DeviceVoltage */                                         {0x0000EA8C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RO|REG_SHARED|REG_BIGENDIAN},
   /* DeviceCurrentSelector */                                 {0x0000EA90, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceCurrent */                                         {0x0000EA94, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceRunningTime */                                     {0x0000EA98, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceCoolerRunningTime */                               {0x0000EA9C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DevicePowerOnCycles */                                   {0x0000EAA0, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceCoolerPowerOnCycles */                             {0x0000EAA4, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* TDCFlags */                                              {0x0000EAA8, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_SHARED|REG_BIGENDIAN},
   /* TDCStatus */                                             {0x0000EAAC, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* AvailabilityFlags */                                     {0x0000EAB0, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* AcquisitionFrameRateMax */                               {0x0000EAB4, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* ExposureTimeMin */                                       {0x0000EAB8, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* ExposureTimeMax */                                       {0x0000EABC, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceBuiltInTestsResults1 */                            {0x0000EAC0, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceBuiltInTestsResults2 */                            {0x0000EAC4, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceBuiltInTestsResults3 */                            {0x0000EAC8, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* TestImageSelector */                                     {0x0000EACC, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* TriggerFrameCount */                                     {0x0000EAD0, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferSequenceDownloadBitRateMax */                {0x0000EAD4, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* AcquisitionFrameRateMin */                               {0x0000EAD8, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* VideoDigitalZoomFactorMax */                             {0x0000EADC, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* PayloadSizeMinFG */                                      {0x0000EAE0, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* CalibrationCollectionActiveType */                       {0x0000EAE4, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* ExposureTime5 */                                         {0x0000EAE8, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* ExposureTime6 */                                         {0x0000EAEC, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* ExposureTime7 */                                         {0x0000EAF0, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* ExposureTime8 */                                         {0x0000EAF4, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceDetectorPolarizationVoltage */                     {0x0000EAF8, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* CalibrationCollectionBlockCount */                       {0x0000EAFC, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* CalibrationCollectionBlockSelector */                    {0x0000EB00, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* CalibrationCollectionBlockPOSIXTime */                   {0x0000EB04, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* CalibrationCollectionBlockLoad */                        {0x0000EB08, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* CalibrationCollectionActiveBlockPOSIXTime */             {0x0000EB0C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* CalibrationCollectionType */                             {0x0000EB10, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceBuiltInTestsResults4 */                            {0x0000EB14, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceBuiltInTestsResults5 */                            {0x0000EB18, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceBuiltInTestsResults6 */                            {0x0000EB1C, NULL, NULL, 4, 4, GCRO_Output_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceBuiltInTestsResults7 */                            {0x0000EB20, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceBuiltInTestsResults8 */                            {0x0000EB24, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* OffsetXMin */                                            {0x0000EB28, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferMOISource */                                 {0x0000EB2C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* MemoryBufferMOIActivation */                             {0x0000EB30, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* MemoryBufferMOISoftware */                               {0x0000EB34, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* OffsetXMax */                                            {0x0000EB38, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* OffsetYMin */                                            {0x0000EB3C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* OffsetYMax */                                            {0x0000EB40, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* OffsetX */                                               {0x0000EB44, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* OffsetY */                                               {0x0000EB48, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* AECPlusExtrapolationWeight */                            {0x0000EB4C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* IsActiveFlags */                                         {0x0000EB50, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_SHARED|REG_BIGENDIAN},
   /* DeviceKeyValidationLow */                                {0x0000EB54, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceKeyValidationHigh */                               {0x0000EB58, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* NDFilterArmedPositionSetpoint */                         {0x0000EB5C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* BadPixelReplacement */                                   {0x0000EB60, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceDetectorElectricalTapsRef */                       {0x0000EB64, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DeviceDetectorElectricalRefOffset */                     {0x0000EB68, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* ExposureTimeSetToMin */                                  {0x0000EB6C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferAvailableFreeSpaceHigh */                    {0x0000EB70, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferAvailableFreeSpaceLow */                     {0x0000EB74, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferFragmentedFreeSpaceHigh */                   {0x0000EB78, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferFragmentedFreeSpaceLow */                    {0x0000EB7C, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferTotalSpaceHigh */                            {0x0000EB80, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferTotalSpaceLow */                             {0x0000EB84, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferSequenceOffsetX */                           {0x0000EB88, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferSequenceOffsetY */                           {0x0000EB8C, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferSequenceWidth */                             {0x0000EB90, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferSequenceHeight */                            {0x0000EB94, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_SHARED|REG_BIGENDIAN},
   /* MemoryBufferSequenceClear */                             {0x0000EB98, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferSequenceDefrag */                            {0x0000EB9C, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferSequenceSizeMin */                           {0x0000EBA0, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferSequenceSizeInc */                           {0x0000EBA4, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferSequenceDownloadFrameID */                   {0x0000EBA8, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferSequenceDownloadFrameCount */                {0x0000EBAC, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* MemoryBufferStatus */                                    {0x0000EBB0, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* MemoryBufferLegacyMode */                                {0x0000EBB4, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_SHARED|REG_BIGENDIAN},
   /* DeviceSerialPortFunction */                              {0x0000EBB8, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* ImageCorrectionFWAcquisitionFrameRateMin */              {0x0000EBBC, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* ImageCorrectionFWAcquisitionFrameRateMax */              {0x0000EBC0, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* ImageCorrectionBlockSelector */                          {0x0000EBC4, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* ImageCorrectionFWMode */                                 {0x0000EBC8, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* ImageCorrectionFWAcquisitionFrameRate */                 {0x0000EBCC, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* FOVPositionRawMin */                                     {0x0000EBD0, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* FOVPositionRawMax */                                     {0x0000EBD4, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* FocusPositionRawMin */                                   {0x0000EBD8, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* FocusPositionRawMax */                                   {0x0000EBDC, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* FOVPositionSetpoint */                                   {0x0000EBE0, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* FOVPosition */                                           {0x0000EBE4, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* FOVPositionNumber */                                     {0x0000EBE8, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* ZoomInFast */                                            {0x0000EBEC, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* ZoomInSlow */                                            {0x0000EBF0, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* ZoomOutSlow */                                           {0x0000EBF4, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* ZoomOutFast */                                           {0x0000EBF8, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* HFOV */                                                  {0x0000EBFC, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* VFOV */                                                  {0x0000EC00, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* FOVPositionRawSetpoint */                                {0x0000EC04, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* FOVPositionRaw */                                        {0x0000EC08, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* AutofocusMode */                                         {0x0000EC0C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* AutofocusROI */                                          {0x0000EC10, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* Autofocus */                                             {0x0000EC14, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* FocusNearFast */                                         {0x0000EC18, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* FocusNearSlow */                                         {0x0000EC1C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* FocusFarSlow */                                          {0x0000EC20, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* FocusFarFast */                                          {0x0000EC24, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* FocusPositionRawSetpoint */                              {0x0000EC28, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* FocusPositionRaw */                                      {0x0000EC2C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* LoadSavedConfigurationAtStartup */                       {0x0000EC30, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* SaveConfiguration */                                     {0x0000EC34, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_WO|REG_NOTSHARED|REG_BIGENDIAN},
   /* DetectorMode */                                          {0x0000EC38, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RW|REG_NOTSHARED|REG_BIGENDIAN},
   /* AcquisitionFrameRateUnrestrictedMin */                   {0x0000EC3C, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* AcquisitionFrameRateUnrestrictedMax */                   {0x0000EC40, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_FLOAT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* MemoryBufferSequenceDownloadSuggestedFrameImageCount */  {0x0000EC44, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_SHARED|REG_BIGENDIAN},
   /* MemoryBufferSequenceDownloadFrameImageCount */           {0x0000EC48, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_SHARED|REG_BIGENDIAN},
   /* MemoryBufferNumberOfSequencesMin */                      {0x0000EC4C, NULL, NULL, 4, 4, GCRO_Storage_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_NOTSHARED|REG_BIGENDIAN},
   /* TDCFlags2 */                                             {0x0000EC50, NULL, NULL, 4, 4, GCRO_Processing_FPGA, REG_UNLOCKED|REG_INT|REG_RO|REG_SHARED|REG_BIGENDIAN}
};

/* AUTO-CODE END */

uint16_t GetRegDataType(gcRegister_t *p_reg) {return ((p_reg->attributes) & (RegDataTypeMask));}
uint16_t GetRegAccessMode(gcRegister_t *p_reg) {return ((p_reg->attributes) & (RegAccessModeMask));}
uint16_t GetRegLocked(gcRegister_t *p_reg) {return ((p_reg->attributes) & (RegLockedMask));}
uint16_t GetRegShared(gcRegister_t *p_reg) {return ((p_reg->attributes) & (RegSharedMask));}
uint16_t GetRegEndianness(gcRegister_t *p_reg) {return ((p_reg->attributes) & (RegEndiannessMask));}

uint16_t RegIsInt(gcRegister_t *p_reg) {return (GetRegDataType(p_reg) == REG_INT);}
uint16_t RegIsFloat(gcRegister_t *p_reg) {return (GetRegDataType(p_reg) == REG_FLOAT);}
uint16_t RegIsMaskedInt(gcRegister_t *p_reg) {return (GetRegDataType(p_reg) == REG_MASKEDINT);}
uint16_t RegIsString(gcRegister_t *p_reg) {return (GetRegDataType(p_reg) == REG_STRING);}
uint16_t RegIsStruct(gcRegister_t *p_reg) {return (GetRegDataType(p_reg) == REG_STRUCT);}

uint16_t RegIsRW(gcRegister_t *p_reg) {return (GetRegAccessMode(p_reg) == REG_RW);}
uint16_t RegIsRO(gcRegister_t *p_reg) {return (GetRegAccessMode(p_reg) == REG_RO);}
uint16_t RegIsWO(gcRegister_t *p_reg) {return (GetRegAccessMode(p_reg) == REG_WO);}

uint16_t RegIsUnlocked(gcRegister_t *p_reg) {return (GetRegLocked(p_reg) == REG_UNLOCKED);}
uint16_t RegIsLocked(gcRegister_t *p_reg) {return (GetRegLocked(p_reg) == REG_LOCKED);}
void RegUnlock(gcRegister_t *p_reg) {BitMaskClr(p_reg->attributes, RegLockedMask); BitMaskSet(p_reg->attributes, REG_UNLOCKED);}
void RegLock(gcRegister_t *p_reg) {BitMaskClr(p_reg->attributes, RegLockedMask); BitMaskSet(p_reg->attributes, REG_LOCKED);}
void SetRegLocked(gcRegister_t *p_reg, uint8_t isLocked) {if (isLocked) RegLock(p_reg); else RegUnlock(p_reg);}

uint16_t RegIsNotShared(gcRegister_t *p_reg) {return (GetRegShared(p_reg) == REG_NOTSHARED);}
uint16_t RegIsShared(gcRegister_t *p_reg) {return (GetRegShared(p_reg) == REG_SHARED);}

uint16_t RegIsLittleEndian(gcRegister_t *p_reg) {return (GetRegEndianness(p_reg) == REG_LITTLEENDIAN);}
uint16_t RegIsBigEndian(gcRegister_t *p_reg) {return (GetRegEndianness(p_reg) == REG_BIGENDIAN);}

/**
 * GenICam register address decoder function.
 *
 * @param addr is the register address to decode.
 *
 * @return the pointer to the register structure that fits specified address. NULL if addr is not found.
 */
gcRegister_t *GC_DecodeAddr(uint32_t addr)
{
   uint32_t lowerIdx = 0;
   uint32_t upperIdx = GC_REG_COUNT + 1;
   uint32_t bisectionIdx;

   while (upperIdx - lowerIdx > 1)
   {
      bisectionIdx = (lowerIdx + upperIdx) >> 1; // divide by 2
      if (addr >= gcRegsDef[bisectionIdx - 1].address)
      {
         lowerIdx = bisectionIdx;
      }
      else
      {
         upperIdx = bisectionIdx;
      }
   }

   if (gcRegsDef[lowerIdx - 1].address == addr)
   {
      return &gcRegsDef[lowerIdx - 1];
   }

   return NULL;
}
