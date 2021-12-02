------------------------------------------------------------------
--!   @file img_header_define.vhd
--!   @brief Package file for IRCam image header definition.
--!   @details This file contains the constants that define IRCam image header fields.
--!
--!   $Rev$
--!   $Author$
--!   $Date$
--!   $Id$
--!   $URL$
--!   
--!   (c) Copyright 2014 Telops Inc.
------------------------------------------------------------------

--!   Use IEEE standard library.
library IEEE;
--!   Use logic elements package from IEEE library.
use IEEE.STD_LOGIC_1164.all; 
--!   Use numeric package package from IEEE library. 
use ieee.numeric_std.all;


-- AUTO-CODE BEGIN
-- Auto-generated IRCam image header definition package.
-- Generated from the IRCam header definition XLS file version 13.1
-- using generateIRCamHeaderVHDLLib.m Matlab script.

package img_header_define is
   constant SignatureAdd8                                : std_logic_vector(7 downto 0) := x"00";                                --! Signature field's 8-bit address
   constant SignatureAdd32                               : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(0,6));   --! Signature field's 32-bit address

   constant DeviceXMLMinorVersionAdd8                    : std_logic_vector(7 downto 0) := x"02";                                --! DeviceXMLMinorVersion field's 8-bit address
   constant DeviceXMLMinorVersionAdd32                   : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(0,6));   --! DeviceXMLMinorVersion field's 32-bit address
   constant DeviceXMLMinorVersionBWE                     : std_logic_vector(3 downto 0) := "0010";                               --! DeviceXMLMinorVersion field's word mask
   constant DeviceXMLMinorVersionShift                   : natural := 8;                                                         --! DeviceXMLMinorVersion field's shift value

   constant DeviceXMLMajorVersionAdd8                    : std_logic_vector(7 downto 0) := x"03";                                --! DeviceXMLMajorVersion field's 8-bit address
   constant DeviceXMLMajorVersionAdd32                   : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(0,6));   --! DeviceXMLMajorVersion field's 32-bit address
   constant DeviceXMLMajorVersionBWE                     : std_logic_vector(3 downto 0) := "0001";                               --! DeviceXMLMajorVersion field's word mask
   constant DeviceXMLMajorVersionShift                   : natural := 0;                                                         --! DeviceXMLMajorVersion field's shift value

   constant ImageHeaderLengthAdd8                        : std_logic_vector(7 downto 0) := x"04";                                --! ImageHeaderLength field's 8-bit address
   constant ImageHeaderLengthAdd32                       : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(1,6));   --! ImageHeaderLength field's 32-bit address
   constant ImageHeaderLengthBWE                         : std_logic_vector(3 downto 0) := "1100";                               --! ImageHeaderLength field's word mask
   constant ImageHeaderLengthShift                       : natural := 16;                                                        --! ImageHeaderLength field's shift value

   constant FrameIDAdd8                                  : std_logic_vector(7 downto 0) := x"08";                                --! FrameID field's 8-bit address
   constant FrameIDAdd32                                 : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(2,6));   --! FrameID field's 32-bit address
   constant FrameIDBWE                                   : std_logic_vector(3 downto 0) := "1111";                               --! FrameID field's word mask
   constant FrameIDShift                                 : natural := 0;                                                         --! FrameID field's shift value

   constant DataOffsetAdd8                               : std_logic_vector(7 downto 0) := x"0C";                                --! DataOffset field's 8-bit address
   constant DataOffsetAdd32                              : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(3,6));   --! DataOffset field's 32-bit address
   constant DataOffsetBWE                                : std_logic_vector(3 downto 0) := "1111";                               --! DataOffset field's word mask
   constant DataOffsetShift                              : natural := 0;                                                         --! DataOffset field's shift value

   constant DataExpAdd8                                  : std_logic_vector(7 downto 0) := x"10";                                --! DataExp field's 8-bit address
   constant DataExpAdd32                                 : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(4,6));   --! DataExp field's 32-bit address
   constant DataExpBWE                                   : std_logic_vector(3 downto 0) := "1000";                               --! DataExp field's word mask
   constant DataExpShift                                 : natural := 24;                                                        --! DataExp field's shift value

   constant ExposureTimeAdd8                             : std_logic_vector(7 downto 0) := x"18";                                --! ExposureTime field's 8-bit address
   constant ExposureTimeAdd32                            : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(6,6));   --! ExposureTime field's 32-bit address
   constant ExposureTimeBWE                              : std_logic_vector(3 downto 0) := "1111";                               --! ExposureTime field's word mask
   constant ExposureTimeShift                            : natural := 0;                                                         --! ExposureTime field's shift value

   constant CalibrationModeAdd8                          : std_logic_vector(7 downto 0) := x"1C";                                --! CalibrationMode field's 8-bit address
   constant CalibrationModeAdd32                         : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(7,6));   --! CalibrationMode field's 32-bit address
   constant CalibrationModeBWE                           : std_logic_vector(3 downto 0) := "1000";                               --! CalibrationMode field's word mask
   constant CalibrationModeShift                         : natural := 24;                                                        --! CalibrationMode field's shift value

   constant BPRAppliedAdd8                               : std_logic_vector(7 downto 0) := x"1D";                                --! BPRApplied field's 8-bit address
   constant BPRAppliedAdd32                              : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(7,6));   --! BPRApplied field's 32-bit address
   constant BPRAppliedBWE                                : std_logic_vector(3 downto 0) := "0100";                               --! BPRApplied field's word mask
   constant BPRAppliedShift                              : natural := 16;                                                        --! BPRApplied field's shift value

   constant FrameBufferModeAdd8                          : std_logic_vector(7 downto 0) := x"1E";                                --! FrameBufferMode field's 8-bit address
   constant FrameBufferModeAdd32                         : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(7,6));   --! FrameBufferMode field's 32-bit address
   constant FrameBufferModeBWE                           : std_logic_vector(3 downto 0) := "0010";                               --! FrameBufferMode field's word mask
   constant FrameBufferModeShift                         : natural := 8;                                                         --! FrameBufferMode field's shift value

   constant CalibrationBlockIndexAdd8                    : std_logic_vector(7 downto 0) := x"1F";                                --! CalibrationBlockIndex field's 8-bit address
   constant CalibrationBlockIndexAdd32                   : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(7,6));   --! CalibrationBlockIndex field's 32-bit address
   constant CalibrationBlockIndexBWE                     : std_logic_vector(3 downto 0) := "0001";                               --! CalibrationBlockIndex field's word mask
   constant CalibrationBlockIndexShift                   : natural := 0;                                                         --! CalibrationBlockIndex field's shift value

   constant WidthAdd8                                    : std_logic_vector(7 downto 0) := x"20";                                --! Width field's 8-bit address
   constant WidthAdd32                                   : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(8,6));   --! Width field's 32-bit address
   constant WidthBWE                                     : std_logic_vector(3 downto 0) := "1100";                               --! Width field's word mask
   constant WidthShift                                   : natural := 16;                                                        --! Width field's shift value

   constant HeightAdd8                                   : std_logic_vector(7 downto 0) := x"22";                                --! Height field's 8-bit address
   constant HeightAdd32                                  : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(8,6));   --! Height field's 32-bit address
   constant HeightBWE                                    : std_logic_vector(3 downto 0) := "0011";                               --! Height field's word mask
   constant HeightShift                                  : natural := 0;                                                         --! Height field's shift value

   constant OffsetXAdd8                                  : std_logic_vector(7 downto 0) := x"24";                                --! OffsetX field's 8-bit address
   constant OffsetXAdd32                                 : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(9,6));   --! OffsetX field's 32-bit address
   constant OffsetXBWE                                   : std_logic_vector(3 downto 0) := "1100";                               --! OffsetX field's word mask
   constant OffsetXShift                                 : natural := 16;                                                        --! OffsetX field's shift value

   constant OffsetYAdd8                                  : std_logic_vector(7 downto 0) := x"26";                                --! OffsetY field's 8-bit address
   constant OffsetYAdd32                                 : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(9,6));   --! OffsetY field's 32-bit address
   constant OffsetYBWE                                   : std_logic_vector(3 downto 0) := "0011";                               --! OffsetY field's word mask
   constant OffsetYShift                                 : natural := 0;                                                         --! OffsetY field's shift value

   constant ReverseXAdd8                                 : std_logic_vector(7 downto 0) := x"28";                                --! ReverseX field's 8-bit address
   constant ReverseXAdd32                                : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(10,6));  --! ReverseX field's 32-bit address
   constant ReverseXBWE                                  : std_logic_vector(3 downto 0) := "1000";                               --! ReverseX field's word mask
   constant ReverseXShift                                : natural := 24;                                                        --! ReverseX field's shift value

   constant ReverseYAdd8                                 : std_logic_vector(7 downto 0) := x"29";                                --! ReverseY field's 8-bit address
   constant ReverseYAdd32                                : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(10,6));  --! ReverseY field's 32-bit address
   constant ReverseYBWE                                  : std_logic_vector(3 downto 0) := "0100";                               --! ReverseY field's word mask
   constant ReverseYShift                                : natural := 16;                                                        --! ReverseY field's shift value

   constant TestImageSelectorAdd8                        : std_logic_vector(7 downto 0) := x"2A";                                --! TestImageSelector field's 8-bit address
   constant TestImageSelectorAdd32                       : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(10,6));  --! TestImageSelector field's 32-bit address
   constant TestImageSelectorBWE                         : std_logic_vector(3 downto 0) := "0010";                               --! TestImageSelector field's word mask
   constant TestImageSelectorShift                       : natural := 8;                                                         --! TestImageSelector field's shift value

   constant SensorWellDepthAdd8                          : std_logic_vector(7 downto 0) := x"2B";                                --! SensorWellDepth field's 8-bit address
   constant SensorWellDepthAdd32                         : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(10,6));  --! SensorWellDepth field's 32-bit address
   constant SensorWellDepthBWE                           : std_logic_vector(3 downto 0) := "0001";                               --! SensorWellDepth field's word mask
   constant SensorWellDepthShift                         : natural := 0;                                                         --! SensorWellDepth field's shift value

   constant AcquisitionFrameRateAdd8                     : std_logic_vector(7 downto 0) := x"2C";                                --! AcquisitionFrameRate field's 8-bit address
   constant AcquisitionFrameRateAdd32                    : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(11,6));  --! AcquisitionFrameRate field's 32-bit address
   constant AcquisitionFrameRateBWE                      : std_logic_vector(3 downto 0) := "1111";                               --! AcquisitionFrameRate field's word mask
   constant AcquisitionFrameRateShift                    : natural := 0;                                                         --! AcquisitionFrameRate field's shift value

   constant TriggerDelayAdd8                             : std_logic_vector(7 downto 0) := x"30";                                --! TriggerDelay field's 8-bit address
   constant TriggerDelayAdd32                            : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(12,6));  --! TriggerDelay field's 32-bit address
   constant TriggerDelayBWE                              : std_logic_vector(3 downto 0) := "1111";                               --! TriggerDelay field's word mask
   constant TriggerDelayShift                            : natural := 0;                                                         --! TriggerDelay field's shift value

   constant TriggerModeAdd8                              : std_logic_vector(7 downto 0) := x"34";                                --! TriggerMode field's 8-bit address
   constant TriggerModeAdd32                             : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(13,6));  --! TriggerMode field's 32-bit address
   constant TriggerModeBWE                               : std_logic_vector(3 downto 0) := "1000";                               --! TriggerMode field's word mask
   constant TriggerModeShift                             : natural := 24;                                                        --! TriggerMode field's shift value

   constant TriggerSourceAdd8                            : std_logic_vector(7 downto 0) := x"35";                                --! TriggerSource field's 8-bit address
   constant TriggerSourceAdd32                           : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(13,6));  --! TriggerSource field's 32-bit address
   constant TriggerSourceBWE                             : std_logic_vector(3 downto 0) := "0100";                               --! TriggerSource field's word mask
   constant TriggerSourceShift                           : natural := 16;                                                        --! TriggerSource field's shift value

   constant IntegrationModeAdd8                          : std_logic_vector(7 downto 0) := x"36";                                --! IntegrationMode field's 8-bit address
   constant IntegrationModeAdd32                         : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(13,6));  --! IntegrationMode field's 32-bit address
   constant IntegrationModeBWE                           : std_logic_vector(3 downto 0) := "0010";                               --! IntegrationMode field's word mask
   constant IntegrationModeShift                         : natural := 8;                                                         --! IntegrationMode field's shift value

   constant EHDRINumberOfExposuresAdd8                   : std_logic_vector(7 downto 0) := x"37";                                --! EHDRINumberOfExposures field's 8-bit address
   constant EHDRINumberOfExposuresAdd32                  : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(13,6));  --! EHDRINumberOfExposures field's 32-bit address
   constant EHDRINumberOfExposuresBWE                    : std_logic_vector(3 downto 0) := "0001";                               --! EHDRINumberOfExposures field's word mask
   constant EHDRINumberOfExposuresShift                  : natural := 0;                                                         --! EHDRINumberOfExposures field's shift value

   constant AveragingNumberAdd8                          : std_logic_vector(7 downto 0) := x"38";                                --! AveragingNumber field's 8-bit address
   constant AveragingNumberAdd32                         : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(14,6));  --! AveragingNumber field's 32-bit address
   constant AveragingNumberBWE                           : std_logic_vector(3 downto 0) := "1000";                               --! AveragingNumber field's word mask
   constant AveragingNumberShift                         : natural := 24;                                                        --! AveragingNumber field's shift value

   constant ADCReadoutAdd8                               : std_logic_vector(7 downto 0) := x"39";                                --! ADCReadout field's 8-bit address
   constant ADCReadoutAdd32                              : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(14,6));  --! ADCReadout field's 32-bit address
   constant ADCReadoutBWE                                : std_logic_vector(3 downto 0) := "0110";                               --! ADCReadout field's word mask
   constant ADCReadoutShift                              : natural := 8;                                                         --! ADCReadout field's shift value

   constant ExposureAutoAdd8                             : std_logic_vector(7 downto 0) := x"3B";                                --! ExposureAuto field's 8-bit address
   constant ExposureAutoAdd32                            : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(14,6));  --! ExposureAuto field's 32-bit address
   constant ExposureAutoBWE                              : std_logic_vector(3 downto 0) := "0001";                               --! ExposureAuto field's word mask
   constant ExposureAutoShift                            : natural := 0;                                                         --! ExposureAuto field's shift value

   constant AECResponseTimeAdd8                          : std_logic_vector(7 downto 0) := x"3C";                                --! AECResponseTime field's 8-bit address
   constant AECResponseTimeAdd32                         : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(15,6));  --! AECResponseTime field's 32-bit address
   constant AECResponseTimeBWE                           : std_logic_vector(3 downto 0) := "1111";                               --! AECResponseTime field's word mask
   constant AECResponseTimeShift                         : natural := 0;                                                         --! AECResponseTime field's shift value

   constant AECImageFractionAdd8                         : std_logic_vector(7 downto 0) := x"40";                                --! AECImageFraction field's 8-bit address
   constant AECImageFractionAdd32                        : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(16,6));  --! AECImageFraction field's 32-bit address
   constant AECImageFractionBWE                          : std_logic_vector(3 downto 0) := "1111";                               --! AECImageFraction field's word mask
   constant AECImageFractionShift                        : natural := 0;                                                         --! AECImageFraction field's shift value

   constant AECTargetWellFillingAdd8                     : std_logic_vector(7 downto 0) := x"44";                                --! AECTargetWellFilling field's 8-bit address
   constant AECTargetWellFillingAdd32                    : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(17,6));  --! AECTargetWellFilling field's 32-bit address
   constant AECTargetWellFillingBWE                      : std_logic_vector(3 downto 0) := "1111";                               --! AECTargetWellFilling field's word mask
   constant AECTargetWellFillingShift                    : natural := 0;                                                         --! AECTargetWellFilling field's shift value

   constant BufferingFlagAdd8                            : std_logic_vector(7 downto 0) := x"4A";                                --! BufferingFlag field's 8-bit address
   constant BufferingFlagAdd32                           : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(18,6));  --! BufferingFlag field's 32-bit address
   constant BufferingFlagBWE                             : std_logic_vector(3 downto 0) := "0010";                               --! BufferingFlag field's word mask
   constant BufferingFlagShift                           : natural := 8;                                                         --! BufferingFlag field's shift value

   constant FWModeAdd8                                   : std_logic_vector(7 downto 0) := x"4B";                                --! FWMode field's 8-bit address
   constant FWModeAdd32                                  : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(18,6));  --! FWMode field's 32-bit address
   constant FWModeBWE                                    : std_logic_vector(3 downto 0) := "0001";                               --! FWMode field's word mask
   constant FWModeShift                                  : natural := 0;                                                         --! FWMode field's shift value

   constant FWSpeedSetpointAdd8                          : std_logic_vector(7 downto 0) := x"4C";                                --! FWSpeedSetpoint field's 8-bit address
   constant FWSpeedSetpointAdd32                         : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(19,6));  --! FWSpeedSetpoint field's 32-bit address
   constant FWSpeedSetpointBWE                           : std_logic_vector(3 downto 0) := "1100";                               --! FWSpeedSetpoint field's word mask
   constant FWSpeedSetpointShift                         : natural := 16;                                                        --! FWSpeedSetpoint field's shift value

   constant FWSpeedAdd8                                  : std_logic_vector(7 downto 0) := x"4E";                                --! FWSpeed field's 8-bit address
   constant FWSpeedAdd32                                 : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(19,6));  --! FWSpeed field's 32-bit address
   constant FWSpeedBWE                                   : std_logic_vector(3 downto 0) := "0011";                               --! FWSpeed field's word mask
   constant FWSpeedShift                                 : natural := 0;                                                         --! FWSpeed field's shift value

   constant POSIXTimeAdd8                                : std_logic_vector(7 downto 0) := x"64";                                --! POSIXTime field's 8-bit address
   constant POSIXTimeAdd32                               : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(25,6));  --! POSIXTime field's 32-bit address
   constant POSIXTimeBWE                                 : std_logic_vector(3 downto 0) := "1111";                               --! POSIXTime field's word mask
   constant POSIXTimeShift                               : natural := 0;                                                         --! POSIXTime field's shift value

   constant SubSecondTimeAdd8                            : std_logic_vector(7 downto 0) := x"68";                                --! SubSecondTime field's 8-bit address
   constant SubSecondTimeAdd32                           : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(26,6));  --! SubSecondTime field's 32-bit address
   constant SubSecondTimeBWE                             : std_logic_vector(3 downto 0) := "1111";                               --! SubSecondTime field's word mask
   constant SubSecondTimeShift                           : natural := 0;                                                         --! SubSecondTime field's shift value

   constant TimeSourceAdd8                               : std_logic_vector(7 downto 0) := x"6C";                                --! TimeSource field's 8-bit address
   constant TimeSourceAdd32                              : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(27,6));  --! TimeSource field's 32-bit address
   constant TimeSourceBWE                                : std_logic_vector(3 downto 0) := "1000";                               --! TimeSource field's word mask
   constant TimeSourceShift                              : natural := 24;                                                        --! TimeSource field's shift value

   constant GPSModeIndicatorAdd8                         : std_logic_vector(7 downto 0) := x"6F";                                --! GPSModeIndicator field's 8-bit address
   constant GPSModeIndicatorAdd32                        : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(27,6));  --! GPSModeIndicator field's 32-bit address
   constant GPSModeIndicatorBWE                          : std_logic_vector(3 downto 0) := "0001";                               --! GPSModeIndicator field's word mask
   constant GPSModeIndicatorShift                        : natural := 0;                                                         --! GPSModeIndicator field's shift value

   constant GPSLongitudeAdd8                             : std_logic_vector(7 downto 0) := x"70";                                --! GPSLongitude field's 8-bit address
   constant GPSLongitudeAdd32                            : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(28,6));  --! GPSLongitude field's 32-bit address
   constant GPSLongitudeBWE                              : std_logic_vector(3 downto 0) := "1111";                               --! GPSLongitude field's word mask
   constant GPSLongitudeShift                            : natural := 0;                                                         --! GPSLongitude field's shift value

   constant GPSLatitudeAdd8                              : std_logic_vector(7 downto 0) := x"74";                                --! GPSLatitude field's 8-bit address
   constant GPSLatitudeAdd32                             : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(29,6));  --! GPSLatitude field's 32-bit address
   constant GPSLatitudeBWE                               : std_logic_vector(3 downto 0) := "1111";                               --! GPSLatitude field's word mask
   constant GPSLatitudeShift                             : natural := 0;                                                         --! GPSLatitude field's shift value

   constant GPSAltitudeAdd8                              : std_logic_vector(7 downto 0) := x"78";                                --! GPSAltitude field's 8-bit address
   constant GPSAltitudeAdd32                             : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(30,6));  --! GPSAltitude field's 32-bit address
   constant GPSAltitudeBWE                               : std_logic_vector(3 downto 0) := "1111";                               --! GPSAltitude field's word mask
   constant GPSAltitudeShift                             : natural := 0;                                                         --! GPSAltitude field's shift value

   constant FWEncoderAtExposureStartAdd8                 : std_logic_vector(7 downto 0) := x"7C";                                --! FWEncoderAtExposureStart field's 8-bit address
   constant FWEncoderAtExposureStartAdd32                : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(31,6));  --! FWEncoderAtExposureStart field's 32-bit address
   constant FWEncoderAtExposureStartBWE                  : std_logic_vector(3 downto 0) := "1100";                               --! FWEncoderAtExposureStart field's word mask
   constant FWEncoderAtExposureStartShift                : natural := 16;                                                        --! FWEncoderAtExposureStart field's shift value

   constant FWEncoderAtExposureEndAdd8                   : std_logic_vector(7 downto 0) := x"7E";                                --! FWEncoderAtExposureEnd field's 8-bit address
   constant FWEncoderAtExposureEndAdd32                  : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(31,6));  --! FWEncoderAtExposureEnd field's 32-bit address
   constant FWEncoderAtExposureEndBWE                    : std_logic_vector(3 downto 0) := "0011";                               --! FWEncoderAtExposureEnd field's word mask
   constant FWEncoderAtExposureEndShift                  : natural := 0;                                                         --! FWEncoderAtExposureEnd field's shift value

   constant FWPositionAdd8                               : std_logic_vector(7 downto 0) := x"80";                                --! FWPosition field's 8-bit address
   constant FWPositionAdd32                              : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(32,6));  --! FWPosition field's 32-bit address
   constant FWPositionBWE                                : std_logic_vector(3 downto 0) := "1000";                               --! FWPosition field's word mask
   constant FWPositionShift                              : natural := 24;                                                        --! FWPosition field's shift value

   constant ICUPositionAdd8                              : std_logic_vector(7 downto 0) := x"81";                                --! ICUPosition field's 8-bit address
   constant ICUPositionAdd32                             : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(32,6));  --! ICUPosition field's 32-bit address
   constant ICUPositionBWE                               : std_logic_vector(3 downto 0) := "0100";                               --! ICUPosition field's word mask
   constant ICUPositionShift                             : natural := 16;                                                        --! ICUPosition field's shift value

   constant NDFilterPositionAdd8                         : std_logic_vector(7 downto 0) := x"82";                                --! NDFilterPosition field's 8-bit address
   constant NDFilterPositionAdd32                        : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(32,6));  --! NDFilterPosition field's 32-bit address
   constant NDFilterPositionBWE                          : std_logic_vector(3 downto 0) := "0010";                               --! NDFilterPosition field's word mask
   constant NDFilterPositionShift                        : natural := 8;                                                         --! NDFilterPosition field's shift value

   constant EHDRIExposureIndexAdd8                       : std_logic_vector(7 downto 0) := x"83";                                --! EHDRIExposureIndex field's 8-bit address
   constant EHDRIExposureIndexAdd32                      : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(32,6));  --! EHDRIExposureIndex field's 32-bit address
   constant EHDRIExposureIndexBWE                        : std_logic_vector(3 downto 0) := "0001";                               --! EHDRIExposureIndex field's word mask
   constant EHDRIExposureIndexShift                      : natural := 0;                                                         --! EHDRIExposureIndex field's shift value

   constant FrameFlagAdd8                                : std_logic_vector(7 downto 0) := x"84";                                --! FrameFlag field's 8-bit address
   constant FrameFlagAdd32                               : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(33,6));  --! FrameFlag field's 32-bit address
   constant FrameFlagBWE                                 : std_logic_vector(3 downto 0) := "1000";                               --! FrameFlag field's word mask
   constant FrameFlagShift                               : natural := 24;                                                        --! FrameFlag field's shift value

   constant PostProcessedAdd8                            : std_logic_vector(7 downto 0) := x"85";                                --! PostProcessed field's 8-bit address
   constant PostProcessedAdd32                           : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(33,6));  --! PostProcessed field's 32-bit address
   constant PostProcessedBWE                             : std_logic_vector(3 downto 0) := "0100";                               --! PostProcessed field's word mask
   constant PostProcessedShift                           : natural := 16;                                                        --! PostProcessed field's shift value

   constant SensorTemperatureRawAdd8                     : std_logic_vector(7 downto 0) := x"86";                                --! SensorTemperatureRaw field's 8-bit address
   constant SensorTemperatureRawAdd32                    : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(33,6));  --! SensorTemperatureRaw field's 32-bit address
   constant SensorTemperatureRawBWE                      : std_logic_vector(3 downto 0) := "0011";                               --! SensorTemperatureRaw field's word mask
   constant SensorTemperatureRawShift                    : natural := 0;                                                         --! SensorTemperatureRaw field's shift value

   constant AlarmVectorAdd8                              : std_logic_vector(7 downto 0) := x"88";                                --! AlarmVector field's 8-bit address
   constant AlarmVectorAdd32                             : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(34,6));  --! AlarmVector field's 32-bit address
   constant AlarmVectorBWE                               : std_logic_vector(3 downto 0) := "1111";                               --! AlarmVector field's word mask
   constant AlarmVectorShift                             : natural := 0;                                                         --! AlarmVector field's shift value

   constant LowCutAdd8                                   : std_logic_vector(7 downto 0) := x"94";                                --! LowCut field's 8-bit address
   constant LowCutAdd32                                  : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(37,6));  --! LowCut field's 32-bit address
   constant LowCutBWE                                    : std_logic_vector(3 downto 0) := "1111";                               --! LowCut field's word mask
   constant LowCutShift                                  : natural := 0;                                                         --! LowCut field's shift value

   constant HighCutAdd8                                  : std_logic_vector(7 downto 0) := x"98";                                --! HighCut field's 8-bit address
   constant HighCutAdd32                                 : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(38,6));  --! HighCut field's 32-bit address
   constant HighCutBWE                                   : std_logic_vector(3 downto 0) := "1111";                               --! HighCut field's word mask
   constant HighCutShift                                 : natural := 0;                                                         --! HighCut field's shift value

   constant ExternalBlackBodyTemperatureAdd8             : std_logic_vector(7 downto 0) := x"9C";                                --! ExternalBlackBodyTemperature field's 8-bit address
   constant ExternalBlackBodyTemperatureAdd32            : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(39,6));  --! ExternalBlackBodyTemperature field's 32-bit address
   constant ExternalBlackBodyTemperatureBWE              : std_logic_vector(3 downto 0) := "1111";                               --! ExternalBlackBodyTemperature field's word mask
   constant ExternalBlackBodyTemperatureShift            : natural := 0;                                                         --! ExternalBlackBodyTemperature field's shift value

   constant TemperatureSensorAdd8                        : std_logic_vector(7 downto 0) := x"A0";                                --! TemperatureSensor field's 8-bit address
   constant TemperatureSensorAdd32                       : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(40,6));  --! TemperatureSensor field's 32-bit address
   constant TemperatureSensorBWE                         : std_logic_vector(3 downto 0) := "1100";                               --! TemperatureSensor field's word mask
   constant TemperatureSensorShift                       : natural := 16;                                                        --! TemperatureSensor field's shift value

   constant TemperatureInternalLensAdd8                  : std_logic_vector(7 downto 0) := x"A4";                                --! TemperatureInternalLens field's 8-bit address
   constant TemperatureInternalLensAdd32                 : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(41,6));  --! TemperatureInternalLens field's 32-bit address
   constant TemperatureInternalLensBWE                   : std_logic_vector(3 downto 0) := "1100";                               --! TemperatureInternalLens field's word mask
   constant TemperatureInternalLensShift                 : natural := 16;                                                        --! TemperatureInternalLens field's shift value

   constant TemperatureExternalLensAdd8                  : std_logic_vector(7 downto 0) := x"A6";                                --! TemperatureExternalLens field's 8-bit address
   constant TemperatureExternalLensAdd32                 : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(41,6));  --! TemperatureExternalLens field's 32-bit address
   constant TemperatureExternalLensBWE                   : std_logic_vector(3 downto 0) := "0011";                               --! TemperatureExternalLens field's word mask
   constant TemperatureExternalLensShift                 : natural := 0;                                                         --! TemperatureExternalLens field's shift value

   constant TemperatureInternalCalibrationUnitAdd8       : std_logic_vector(7 downto 0) := x"A8";                                --! TemperatureInternalCalibrationUnit field's 8-bit address
   constant TemperatureInternalCalibrationUnitAdd32      : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(42,6));  --! TemperatureInternalCalibrationUnit field's 32-bit address
   constant TemperatureInternalCalibrationUnitBWE        : std_logic_vector(3 downto 0) := "1100";                               --! TemperatureInternalCalibrationUnit field's word mask
   constant TemperatureInternalCalibrationUnitShift      : natural := 16;                                                        --! TemperatureInternalCalibrationUnit field's shift value

   constant TemperatureExternalThermistorAdd8            : std_logic_vector(7 downto 0) := x"B4";                                --! TemperatureExternalThermistor field's 8-bit address
   constant TemperatureExternalThermistorAdd32           : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(45,6));  --! TemperatureExternalThermistor field's 32-bit address
   constant TemperatureExternalThermistorBWE             : std_logic_vector(3 downto 0) := "1100";                               --! TemperatureExternalThermistor field's word mask
   constant TemperatureExternalThermistorShift           : natural := 16;                                                        --! TemperatureExternalThermistor field's shift value

   constant TemperatureFilterWheelAdd8                   : std_logic_vector(7 downto 0) := x"B6";                                --! TemperatureFilterWheel field's 8-bit address
   constant TemperatureFilterWheelAdd32                  : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(45,6));  --! TemperatureFilterWheel field's 32-bit address
   constant TemperatureFilterWheelBWE                    : std_logic_vector(3 downto 0) := "0011";                               --! TemperatureFilterWheel field's word mask
   constant TemperatureFilterWheelShift                  : natural := 0;                                                         --! TemperatureFilterWheel field's shift value

   constant TemperatureCompressorAdd8                    : std_logic_vector(7 downto 0) := x"B8";                                --! TemperatureCompressor field's 8-bit address
   constant TemperatureCompressorAdd32                   : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(46,6));  --! TemperatureCompressor field's 32-bit address
   constant TemperatureCompressorBWE                     : std_logic_vector(3 downto 0) := "1100";                               --! TemperatureCompressor field's word mask
   constant TemperatureCompressorShift                   : natural := 16;                                                        --! TemperatureCompressor field's shift value

   constant TemperatureColdFingerAdd8                    : std_logic_vector(7 downto 0) := x"BA";                                --! TemperatureColdFinger field's 8-bit address
   constant TemperatureColdFingerAdd32                   : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(46,6));  --! TemperatureColdFinger field's 32-bit address
   constant TemperatureColdFingerBWE                     : std_logic_vector(3 downto 0) := "0011";                               --! TemperatureColdFinger field's word mask
   constant TemperatureColdFingerShift                   : natural := 0;                                                         --! TemperatureColdFinger field's shift value

   constant CalibrationBlockPOSIXTimeAdd8                : std_logic_vector(7 downto 0) := x"D4";                                --! CalibrationBlockPOSIXTime field's 8-bit address
   constant CalibrationBlockPOSIXTimeAdd32               : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(53,6));  --! CalibrationBlockPOSIXTime field's 32-bit address
   constant CalibrationBlockPOSIXTimeBWE                 : std_logic_vector(3 downto 0) := "1111";                               --! CalibrationBlockPOSIXTime field's word mask
   constant CalibrationBlockPOSIXTimeShift               : natural := 0;                                                         --! CalibrationBlockPOSIXTime field's shift value

   constant ExternalLensSerialNumberAdd8                 : std_logic_vector(7 downto 0) := x"D8";                                --! ExternalLensSerialNumber field's 8-bit address
   constant ExternalLensSerialNumberAdd32                : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(54,6));  --! ExternalLensSerialNumber field's 32-bit address
   constant ExternalLensSerialNumberBWE                  : std_logic_vector(3 downto 0) := "1111";                               --! ExternalLensSerialNumber field's word mask
   constant ExternalLensSerialNumberShift                : natural := 0;                                                         --! ExternalLensSerialNumber field's shift value

   constant ManualFilterSerialNumberAdd8                 : std_logic_vector(7 downto 0) := x"DC";                                --! ManualFilterSerialNumber field's 8-bit address
   constant ManualFilterSerialNumberAdd32                : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(55,6));  --! ManualFilterSerialNumber field's 32-bit address
   constant ManualFilterSerialNumberBWE                  : std_logic_vector(3 downto 0) := "1111";                               --! ManualFilterSerialNumber field's word mask
   constant ManualFilterSerialNumberShift                : natural := 0;                                                         --! ManualFilterSerialNumber field's shift value

   constant SensorIDAdd8                                 : std_logic_vector(7 downto 0) := x"E0";                                --! SensorID field's 8-bit address
   constant SensorIDAdd32                                : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(56,6));  --! SensorID field's 32-bit address
   constant SensorIDBWE                                  : std_logic_vector(3 downto 0) := "1000";                               --! SensorID field's word mask
   constant SensorIDShift                                : natural := 24;                                                        --! SensorID field's shift value

   constant PixelDataResolutionAdd8                      : std_logic_vector(7 downto 0) := x"E1";                                --! PixelDataResolution field's 8-bit address
   constant PixelDataResolutionAdd32                     : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(56,6));  --! PixelDataResolution field's 32-bit address
   constant PixelDataResolutionBWE                       : std_logic_vector(3 downto 0) := "0100";                               --! PixelDataResolution field's word mask
   constant PixelDataResolutionShift                     : natural := 16;                                                        --! PixelDataResolution field's shift value

   constant HFOVAdd8                                     : std_logic_vector(7 downto 0) := x"E2";                                --! HFOV field's 8-bit address
   constant HFOVAdd32                                    : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(56,6));  --! HFOV field's 32-bit address
   constant HFOVBWE                                      : std_logic_vector(3 downto 0) := "0011";                               --! HFOV field's word mask
   constant HFOVShift                                    : natural := 0;                                                         --! HFOV field's shift value

   constant VFOVAdd8                                     : std_logic_vector(7 downto 0) := x"E4";                                --! VFOV field's 8-bit address
   constant VFOVAdd32                                    : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(57,6));  --! VFOV field's 32-bit address
   constant VFOVBWE                                      : std_logic_vector(3 downto 0) := "1100";                               --! VFOV field's word mask
   constant VFOVShift                                    : natural := 16;                                                        --! VFOV field's shift value

   constant FocusPositionRawAdd8                         : std_logic_vector(7 downto 0) := x"E6";                                --! FocusPositionRaw field's 8-bit address
   constant FocusPositionRawAdd32                        : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(57,6));  --! FocusPositionRaw field's 32-bit address
   constant FocusPositionRawBWE                          : std_logic_vector(3 downto 0) := "0011";                               --! FocusPositionRaw field's word mask
   constant FocusPositionRawShift                        : natural := 0;                                                         --! FocusPositionRaw field's shift value

   constant FOVPositionRawAdd8                           : std_logic_vector(7 downto 0) := x"E8";                                --! FOVPositionRaw field's 8-bit address
   constant FOVPositionRawAdd32                          : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(58,6));  --! FOVPositionRaw field's 32-bit address
   constant FOVPositionRawBWE                            : std_logic_vector(3 downto 0) := "1100";                               --! FOVPositionRaw field's word mask
   constant FOVPositionRawShift                          : natural := 16;                                                        --! FOVPositionRaw field's shift value

   constant FOVPositionAdd8                              : std_logic_vector(7 downto 0) := x"EA";                                --! FOVPosition field's 8-bit address
   constant FOVPositionAdd32                             : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(58,6));  --! FOVPosition field's 32-bit address
   constant FOVPositionBWE                               : std_logic_vector(3 downto 0) := "0010";                               --! FOVPosition field's word mask
   constant FOVPositionShift                             : natural := 8;                                                         --! FOVPosition field's shift value

   constant DeviceCalibrationFilesMajorVersionAdd8       : std_logic_vector(7 downto 0) := x"EB";                                --! DeviceCalibrationFilesMajorVersion field's 8-bit address
   constant DeviceCalibrationFilesMajorVersionAdd32      : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(58,6));  --! DeviceCalibrationFilesMajorVersion field's 32-bit address
   constant DeviceCalibrationFilesMajorVersionBWE        : std_logic_vector(3 downto 0) := "0001";                               --! DeviceCalibrationFilesMajorVersion field's word mask
   constant DeviceCalibrationFilesMajorVersionShift      : natural := 0;                                                         --! DeviceCalibrationFilesMajorVersion field's shift value

   constant DeviceCalibrationFilesMinorVersionAdd8       : std_logic_vector(7 downto 0) := x"EC";                                --! DeviceCalibrationFilesMinorVersion field's 8-bit address
   constant DeviceCalibrationFilesMinorVersionAdd32      : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(59,6));  --! DeviceCalibrationFilesMinorVersion field's 32-bit address
   constant DeviceCalibrationFilesMinorVersionBWE        : std_logic_vector(3 downto 0) := "1000";                               --! DeviceCalibrationFilesMinorVersion field's word mask
   constant DeviceCalibrationFilesMinorVersionShift      : natural := 24;                                                        --! DeviceCalibrationFilesMinorVersion field's shift value

   constant DeviceCalibrationFilesSubMinorVersionAdd8    : std_logic_vector(7 downto 0) := x"ED";                                --! DeviceCalibrationFilesSubMinorVersion field's 8-bit address
   constant DeviceCalibrationFilesSubMinorVersionAdd32   : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(59,6));  --! DeviceCalibrationFilesSubMinorVersion field's 32-bit address
   constant DeviceCalibrationFilesSubMinorVersionBWE     : std_logic_vector(3 downto 0) := "0100";                               --! DeviceCalibrationFilesSubMinorVersion field's word mask
   constant DeviceCalibrationFilesSubMinorVersionShift   : natural := 16;                                                        --! DeviceCalibrationFilesSubMinorVersion field's shift value

   constant DeviceDataFlowMajorVersionAdd8               : std_logic_vector(7 downto 0) := x"EE";                                --! DeviceDataFlowMajorVersion field's 8-bit address
   constant DeviceDataFlowMajorVersionAdd32              : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(59,6));  --! DeviceDataFlowMajorVersion field's 32-bit address
   constant DeviceDataFlowMajorVersionBWE                : std_logic_vector(3 downto 0) := "0010";                               --! DeviceDataFlowMajorVersion field's word mask
   constant DeviceDataFlowMajorVersionShift              : natural := 8;                                                         --! DeviceDataFlowMajorVersion field's shift value

   constant DeviceDataFlowMinorVersionAdd8               : std_logic_vector(7 downto 0) := x"EF";                                --! DeviceDataFlowMinorVersion field's 8-bit address
   constant DeviceDataFlowMinorVersionAdd32              : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(59,6));  --! DeviceDataFlowMinorVersion field's 32-bit address
   constant DeviceDataFlowMinorVersionBWE                : std_logic_vector(3 downto 0) := "0001";                               --! DeviceDataFlowMinorVersion field's word mask
   constant DeviceDataFlowMinorVersionShift              : natural := 0;                                                         --! DeviceDataFlowMinorVersion field's shift value

   constant DeviceFirmwareMajorVersionAdd8               : std_logic_vector(7 downto 0) := x"F0";                                --! DeviceFirmwareMajorVersion field's 8-bit address
   constant DeviceFirmwareMajorVersionAdd32              : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(60,6));  --! DeviceFirmwareMajorVersion field's 32-bit address
   constant DeviceFirmwareMajorVersionBWE                : std_logic_vector(3 downto 0) := "1000";                               --! DeviceFirmwareMajorVersion field's word mask
   constant DeviceFirmwareMajorVersionShift              : natural := 24;                                                        --! DeviceFirmwareMajorVersion field's shift value

   constant DeviceFirmwareMinorVersionAdd8               : std_logic_vector(7 downto 0) := x"F1";                                --! DeviceFirmwareMinorVersion field's 8-bit address
   constant DeviceFirmwareMinorVersionAdd32              : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(60,6));  --! DeviceFirmwareMinorVersion field's 32-bit address
   constant DeviceFirmwareMinorVersionBWE                : std_logic_vector(3 downto 0) := "0100";                               --! DeviceFirmwareMinorVersion field's word mask
   constant DeviceFirmwareMinorVersionShift              : natural := 16;                                                        --! DeviceFirmwareMinorVersion field's shift value

   constant DeviceFirmwareSubMinorVersionAdd8            : std_logic_vector(7 downto 0) := x"F2";                                --! DeviceFirmwareSubMinorVersion field's 8-bit address
   constant DeviceFirmwareSubMinorVersionAdd32           : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(60,6));  --! DeviceFirmwareSubMinorVersion field's 32-bit address
   constant DeviceFirmwareSubMinorVersionBWE             : std_logic_vector(3 downto 0) := "0010";                               --! DeviceFirmwareSubMinorVersion field's word mask
   constant DeviceFirmwareSubMinorVersionShift           : natural := 8;                                                         --! DeviceFirmwareSubMinorVersion field's shift value

   constant DeviceFirmwareBuildVersionAdd8               : std_logic_vector(7 downto 0) := x"F3";                                --! DeviceFirmwareBuildVersion field's 8-bit address
   constant DeviceFirmwareBuildVersionAdd32              : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(60,6));  --! DeviceFirmwareBuildVersion field's 32-bit address
   constant DeviceFirmwareBuildVersionBWE                : std_logic_vector(3 downto 0) := "0001";                               --! DeviceFirmwareBuildVersion field's word mask
   constant DeviceFirmwareBuildVersionShift              : natural := 0;                                                         --! DeviceFirmwareBuildVersion field's shift value

   constant ImageCorrectionPOSIXTimeAdd8                 : std_logic_vector(7 downto 0) := x"F4";                                --! ImageCorrectionPOSIXTime field's 8-bit address
   constant ImageCorrectionPOSIXTimeAdd32                : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(61,6));  --! ImageCorrectionPOSIXTime field's 32-bit address
   constant ImageCorrectionPOSIXTimeBWE                  : std_logic_vector(3 downto 0) := "1111";                               --! ImageCorrectionPOSIXTime field's word mask
   constant ImageCorrectionPOSIXTimeShift                : natural := 0;                                                         --! ImageCorrectionPOSIXTime field's shift value

   constant DeviceSerialNumberAdd8                       : std_logic_vector(7 downto 0) := x"F8";                                --! DeviceSerialNumber field's 8-bit address
   constant DeviceSerialNumberAdd32                      : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(62,6));  --! DeviceSerialNumber field's 32-bit address
   constant DeviceSerialNumberBWE                        : std_logic_vector(3 downto 0) := "1111";                               --! DeviceSerialNumber field's word mask
   constant DeviceSerialNumberShift                      : natural := 0;                                                         --! DeviceSerialNumber field's shift value

   constant CalibrationCollectionPOSIXTimeAdd8           : std_logic_vector(7 downto 0) := x"FC";                                --! CalibrationCollectionPOSIXTime field's 8-bit address
   constant CalibrationCollectionPOSIXTimeAdd32          : std_logic_vector(5 downto 0) := std_logic_vector(to_unsigned(63,6));  --! CalibrationCollectionPOSIXTime field's 32-bit address
   constant CalibrationCollectionPOSIXTimeBWE            : std_logic_vector(3 downto 0) := "1111";                               --! CalibrationCollectionPOSIXTime field's word mask
   constant CalibrationCollectionPOSIXTimeShift          : natural := 0;                                                         --! CalibrationCollectionPOSIXTime field's shift value

end img_header_define;

-- AUTO-CODE END
