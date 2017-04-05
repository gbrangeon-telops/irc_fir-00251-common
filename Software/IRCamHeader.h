/**
 *  @file IRCamHeader.h
 *  IRCam header definition module header.
 *  
 *  $Rev$
 *  $Author$
 *  $Date$
 *  $Id$
 *  $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef __IRCAMHEADER_H__
#define __IRCAMHEADER_H__

/* AUTO-CODE BEGIN */
// Auto-generated IRCam header library.
// Generated from the IRCam header definition XLS file version 12.1
// using generateIRCamHeaderCLib.m Matlab script.

#define SignatureHdrAddr                              0x00  /**< Signature header field address */
#define DeviceXMLMinorVersionHdrAddr                  0x02  /**< DeviceXMLMinorVersion header field address */
#define DeviceXMLMajorVersionHdrAddr                  0x03  /**< DeviceXMLMajorVersion header field address */
#define ImageHeaderLengthHdrAddr                      0x04  /**< ImageHeaderLength header field address */
#define FrameIDHdrAddr                                0x08  /**< FrameID header field address */
#define DataOffsetHdrAddr                             0x0C  /**< DataOffset header field address */
#define DataExpHdrAddr                                0x10  /**< DataExp header field address */
#define ExposureTimeHdrAddr                           0x18  /**< ExposureTime header field address */
#define CalibrationModeHdrAddr                        0x1C  /**< CalibrationMode header field address */
#define BPRAppliedHdrAddr                             0x1D  /**< BPRApplied header field address */
#define FrameBufferModeHdrAddr                        0x1E  /**< FrameBufferMode header field address */
#define CalibrationBlockIndexHdrAddr                  0x1F  /**< CalibrationBlockIndex header field address */
#define WidthHdrAddr                                  0x20  /**< Width header field address */
#define HeightHdrAddr                                 0x22  /**< Height header field address */
#define OffsetXHdrAddr                                0x24  /**< OffsetX header field address */
#define OffsetYHdrAddr                                0x26  /**< OffsetY header field address */
#define ReverseXHdrAddr                               0x28  /**< ReverseX header field address */
#define ReverseYHdrAddr                               0x29  /**< ReverseY header field address */
#define TestImageSelectorHdrAddr                      0x2A  /**< TestImageSelector header field address */
#define SensorWellDepthHdrAddr                        0x2B  /**< SensorWellDepth header field address */
#define AcquisitionFrameRateHdrAddr                   0x2C  /**< AcquisitionFrameRate header field address */
#define TriggerDelayHdrAddr                           0x30  /**< TriggerDelay header field address */
#define TriggerModeHdrAddr                            0x34  /**< TriggerMode header field address */
#define TriggerSourceHdrAddr                          0x35  /**< TriggerSource header field address */
#define IntegrationModeHdrAddr                        0x36  /**< IntegrationMode header field address */
#define AveragingNumberHdrAddr                        0x38  /**< AveragingNumber header field address */
#define ADCReadoutHdrAddr                             0x39  /**< ADCReadout header field address */
#define ExposureAutoHdrAddr                           0x3B  /**< ExposureAuto header field address */
#define AECResponseTimeHdrAddr                        0x3C  /**< AECResponseTime header field address */
#define AECImageFractionHdrAddr                       0x40  /**< AECImageFraction header field address */
#define AECTargetWellFillingHdrAddr                   0x44  /**< AECTargetWellFilling header field address */
#define FWModeHdrAddr                                 0x4B  /**< FWMode header field address */
#define FWSpeedSetpointHdrAddr                        0x4C  /**< FWSpeedSetpoint header field address */
#define FWSpeedHdrAddr                                0x4E  /**< FWSpeed header field address */
#define POSIXTimeHdrAddr                              0x64  /**< POSIXTime header field address */
#define SubSecondTimeHdrAddr                          0x68  /**< SubSecondTime header field address */
#define TimeSourceHdrAddr                             0x6C  /**< TimeSource header field address */
#define GPSModeIndicatorHdrAddr                       0x6F  /**< GPSModeIndicator header field address */
#define GPSLongitudeHdrAddr                           0x70  /**< GPSLongitude header field address */
#define GPSLatitudeHdrAddr                            0x74  /**< GPSLatitude header field address */
#define GPSAltitudeHdrAddr                            0x78  /**< GPSAltitude header field address */
#define FWEncoderAtExposureStartHdrAddr               0x7C  /**< FWEncoderAtExposureStart header field address */
#define FWEncoderAtExposureEndHdrAddr                 0x7E  /**< FWEncoderAtExposureEnd header field address */
#define FWPositionHdrAddr                             0x80  /**< FWPosition header field address */
#define ICUPositionHdrAddr                            0x81  /**< ICUPosition header field address */
#define NDFilterPositionHdrAddr                       0x82  /**< NDFilterPosition header field address */
#define EHDRIExposureIndexHdrAddr                     0x83  /**< EHDRIExposureIndex header field address */
#define FrameFlagHdrAddr                              0x84  /**< FrameFlag header field address */
#define PostProcessedHdrAddr                          0x85  /**< PostProcessed header field address */
#define SensorTemperatureRawHdrAddr                   0x86  /**< SensorTemperatureRaw header field address */
#define AlarmVectorHdrAddr                            0x88  /**< AlarmVector header field address */
#define LowCutHdrAddr                                 0x94  /**< LowCut header field address */
#define HighCutHdrAddr                                0x98  /**< HighCut header field address */
#define ExternalBlackBodyTemperatureHdrAddr           0x9C  /**< ExternalBlackBodyTemperature header field address */
#define TemperatureSensorHdrAddr                      0xA0  /**< TemperatureSensor header field address */
#define TemperatureInternalLensHdrAddr                0xA4  /**< TemperatureInternalLens header field address */
#define TemperatureExternalLensHdrAddr                0xA6  /**< TemperatureExternalLens header field address */
#define TemperatureInternalCalibrationUnitHdrAddr     0xA8  /**< TemperatureInternalCalibrationUnit header field address */
#define TemperatureExternalThermistorHdrAddr          0xB4  /**< TemperatureExternalThermistor header field address */
#define TemperatureFilterWheelHdrAddr                 0xB6  /**< TemperatureFilterWheel header field address */
#define TemperatureCompressorHdrAddr                  0xB8  /**< TemperatureCompressor header field address */
#define TemperatureColdFingerHdrAddr                  0xBA  /**< TemperatureColdFinger header field address */
#define CalibrationBlockPOSIXTimeHdrAddr              0xD4  /**< CalibrationBlockPOSIXTime header field address */
#define ExternalLensSerialNumberHdrAddr               0xD8  /**< ExternalLensSerialNumber header field address */
#define ManualFilterSerialNumberHdrAddr               0xDC  /**< ManualFilterSerialNumber header field address */
#define SensorIDHdrAddr                               0xE0  /**< SensorID header field address */
#define PixelDataResolutionHdrAddr                    0xE1  /**< PixelDataResolution header field address */
#define DeviceCalibrationFilesMajorVersionHdrAddr     0xEB  /**< DeviceCalibrationFilesMajorVersion header field address */
#define DeviceCalibrationFilesMinorVersionHdrAddr     0xEC  /**< DeviceCalibrationFilesMinorVersion header field address */
#define DeviceCalibrationFilesSubMinorVersionHdrAddr  0xED  /**< DeviceCalibrationFilesSubMinorVersion header field address */
#define DeviceDataFlowMajorVersionHdrAddr             0xEE  /**< DeviceDataFlowMajorVersion header field address */
#define DeviceDataFlowMinorVersionHdrAddr             0xEF  /**< DeviceDataFlowMinorVersion header field address */
#define DeviceFirmwareMajorVersionHdrAddr             0xF0  /**< DeviceFirmwareMajorVersion header field address */
#define DeviceFirmwareMinorVersionHdrAddr             0xF1  /**< DeviceFirmwareMinorVersion header field address */
#define DeviceFirmwareSubMinorVersionHdrAddr          0xF2  /**< DeviceFirmwareSubMinorVersion header field address */
#define DeviceFirmwareBuildVersionHdrAddr             0xF3  /**< DeviceFirmwareBuildVersion header field address */
#define ImageCorrectionPOSIXTimeHdrAddr               0xF4  /**< ImageCorrectionPOSIXTime header field address */
#define DeviceSerialNumberHdrAddr                     0xF8  /**< DeviceSerialNumber header field address */

/* AUTO-CODE END */

#endif // __IRCAMHEADER_H__
