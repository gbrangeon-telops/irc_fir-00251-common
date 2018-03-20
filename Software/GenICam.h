/**
 *  @file GeniCam.h
 *  GenICam registers definition module header.
 *  
 *  $Rev$
 *  $Author$
 *  $Date$
 *  $Id$
 *  $URL$
 *
 * (c) Copyright 2014 Telops Inc.
 */

#ifndef GENICAM_H
#define GENICAM_H

#include "IRC_Status.h"
#include "utils.h"
#include <stdio.h> // For NULL
#include <stdint.h>

#define GC_ERR(fmt, ...)   PRINTF("GC: Error: " fmt "\n", ##__VA_ARGS__)

// Bits 2:0 of attributes byte
#define RegDataTypeMask       0x07  /**< GenICam register data type mask */
#define REG_INT               0x00  /**< IntReg GenICam register data type */
#define REG_FLOAT             0x01  /**< FloatReg GenICam data type */
#define REG_MASKEDINT         0x02  /**< MaskedIntReg GenICam data type */
#define REG_STRING            0x03  /**< StringReg GenICam data type */
#define REG_STRUCT            0x04  /**< StructReg GenICam data type */

// Bits 4:3 of attributes byte
#define RegAccessModeMask     0x18  /**< GenICam register access mode mask */
#define REG_RW                0x00  /**< Read and write GenICam register access mode */
#define REG_RO                0x08  /**< Read only GenICam register access mode */
#define REG_WO                0x10  /**< Write only GenICam register access mode */

// Bit 5 of attributes byte
#define RegLockedMask         0x20  /**< GenICam register locked mask */
#define REG_UNLOCKED          0x00  /**< GenICam register is unlocked */
#define REG_LOCKED            0x20  /**< GenICam register is locked */

// Bit 6 of attributes byte
#define RegSharedMask         0x40  /**< GenICam register shared mask */
#define REG_NOTSHARED         0x00  /**< GenICam register is not shared between both FPGA */
#define REG_SHARED            0x40  /**< GenICam register is shared between both FPGA */

// Bit 7 of attributes byte
#define RegEndiannessMask     0x80  /**< GenICam register shared mask */
#define REG_LITTLEENDIAN      0x00  /**< GenICam register is little endian */
#define REG_BIGENDIAN         0x80  /**< GenICam register is big endian */

/**
 * GenICam registers owner.
 */
enum gcRegistersOwnerEnum {
   GCRO_Processing_FPGA = 1,        /**< Processing FPGA GenICam register owner */
   GCRO_Output_FPGA,                /**< Output FPGA GenICam register owner */
   GCRO_Storage_FPGA                /**< Storage FPGA GenICam register owner */
};

/**
 * GenICam registers owner data type.
 */
typedef enum gcRegistersOwnerEnum gcRegistersOwner_t;

/**
 * GenICam callback function phase.
 */
enum gcCallbackPhaseEnum {
   GCCP_BEFORE = 0,
   GCCP_AFTER
};

/**
 * GenICam callback function phase data type.
 */
typedef enum gcCallbackPhaseEnum gcCallbackPhase_t;

/**
 * GenICam callback function access.
 */
enum gcCallbackAccessEnum {
   GCCA_READ = 0,
   GCCA_WRITE
};

/**
 * GenICam callback function access data type.
 */
typedef enum gcCallbackAccessEnum gcCallbackAccess_t;

/**
 * GenICam register callback function pointer type
 */
typedef void (*gcCallbackFun_t)(gcCallbackPhase_t phase, gcCallbackAccess_t access);

#ifndef SIM
   #pragma pack(push)   // Push current alignment to stack
   #pragma pack(1)      // Set alignment to 1 byte boundary, so that each register
                        // attribute occupies the minimum space
#endif

/**
 * GenICam register definition
 */
struct gcRegister
{
   uint32_t             address;    /**< Register address. */
   void*                p_data;     /**< Register data pointer. */
   gcCallbackFun_t      callback;   /**< Register callback function pointer. */
   uint16_t             length;     /**< Register length (in bytes). */
   uint16_t             dataLength; /**< Register data storage length (in bytes). */
   gcRegistersOwner_t   owner;      /**< Register owner */
   uint8_t              attributes; /**< Register attributes: Bit 7 = endianness, Bit 6 = shared, Bit 5 = locked, Bits 4:3 = access mode, Bits 2:0 = data type. */
};

#ifndef SIM
   #pragma pack(pop)    // Restore original alignment from stack
#endif

/**
 * GenICam register definition data type
 */
typedef struct gcRegister gcRegister_t;


/*
 * MemoryBufferStatus register bit field definition
 */
#define MemoryBufferIsRecordingMask             0x00000001  /**< MemoryBufferStatus register bit mask for MemoryBufferIsRecording field */
#define MemoryBufferIsTransmittingMask          0x00000002  /**< MemoryBufferStatus register bit mask for MemoryBufferIsTransmitting field */
#define MemoryBufferIsDefraggingMask            0x00000004  /**< MemoryBufferStatus register bit mask for MemoryBufferIsDefragging field */
#define MemoryBufferIsUpdatingMask              0x00000008  /**< MemoryBufferStatus register bit mask for MemoryBufferIsUpdating field */

#define MEMORY_BUFFER_STATUS_INIT               (0)

#define MemoryBufferStatusSet(mask) GC_RegisterSetBitsUI32(&gcRegsDef[MemoryBufferStatusIdx], mask)  /**< Set masked bits in MemoryBufferStatus register */
#define MemoryBufferStatusClr(mask) GC_RegisterClearBitsUI32(&gcRegsDef[MemoryBufferStatusIdx], mask)  /**< Clear masked bits in MemoryBufferStatus register */
#define MemoryBufferStatusTst(mask) BitMaskTst(gcRegsData.MemoryBufferStatus, mask)  /**< Test if masked bits in MemoryBufferStatus register are all set */
#define MemoryBufferStatusTstAny(mask) BitMaskTstAny(gcRegsData.MemoryBufferStatus, mask)  /**< Test if at least one of the masked bits in MemoryBufferStatus register is set */

#define GC_MemoryBufferIsRecording     MemoryBufferStatusTst(MemoryBufferRecordingMask)
#define GC_MemoryBufferIsTransmitting  MemoryBufferStatusTst(MemoryBufferTransmittingMask)
#define GC_MemoryBufferIsDefragging    MemoryBufferStatusTst(MemoryBufferDefraggingMask)
#define GC_MemoryBufferIsUpdating      MemoryBufferStatusTst(MemoryBufferUpdatingMask)
#define GC_MemoryBufferIsBusy          MemoryBufferStatusTstAny(MemoryBufferRecordingMask | MemoryBufferTransmittingMask | MemoryBufferDefraggingMask | MemoryBufferUpdatingMask)

/* AUTO-CODE BEGIN */
// Auto-generated GeniCam library.
// Generated from XML camera definition file version 12.2.1
// using generateGenICamCommonCLib.m Matlab script.

#define GC_XMLMAJORVERSION    12
#define GC_XMLMINORVERSION    2
#define GC_XMLSUBMINORVERSION 1

// Enumerations values and data types
////////////////////////////////////////////////////////////////////////////////

/**
 * ExposureMode enumeration values
 */
enum ExposureModeEnum {
   EM_Off = 0,
   EM_Timed = 1,
   EM_TriggerWidth = 2,
   EM_TriggerControlled = 3
};

/**
 * ExposureMode enumeration values data type
 */
typedef enum ExposureModeEnum ExposureMode_t;

/**
 * AcquisitionMode enumeration values
 */
enum AcquisitionModeEnum {
   AM_Continuous = 0,
   AM_SingleFrame = 1,
   AM_MultiFrame = 2
};

/**
 * AcquisitionMode enumeration values data type
 */
typedef enum AcquisitionModeEnum AcquisitionMode_t;

/**
 * AcquisitionFrameRateMode enumeration values
 */
enum AcquisitionFrameRateModeEnum {
   AFRM_FixedLocked = 0,
   AFRM_Fixed = 1,
   AFRM_Maximum = 2,
   AFRM_Burst = 3
};

/**
 * AcquisitionFrameRateMode enumeration values data type
 */
typedef enum AcquisitionFrameRateModeEnum AcquisitionFrameRateMode_t;

/**
 * ExposureAuto enumeration values
 */
enum ExposureAutoEnum {
   EA_Off = 0,
   EA_Once = 1,
   EA_Continuous = 2,
   EA_OnceNDFilter = 4,
   EA_ContinuousNDFilter = 5,
   EA_ArmedNDFilter = 6
};

/**
 * ExposureAuto enumeration values data type
 */
typedef enum ExposureAutoEnum ExposureAuto_t;

/**
 * NDFilterArmedPositionSetpoint enumeration values
 */
enum NDFilterArmedPositionSetpointEnum {
   NDFAPS_NDFilter1 = 0,
   NDFAPS_NDFilter2 = 1,
   NDFAPS_NDFilter3 = 2
};

/**
 * NDFilterArmedPositionSetpoint enumeration values data type
 */
typedef enum NDFilterArmedPositionSetpointEnum NDFilterArmedPositionSetpoint_t;

/**
 * EHDRIMode enumeration values
 */
enum EHDRIModeEnum {
   EHDRIM_Simple = 0,
   EHDRIM_Advanced = 1
};

/**
 * EHDRIMode enumeration values data type
 */
typedef enum EHDRIModeEnum EHDRIMode_t;

/**
 * CalibrationMode enumeration values
 */
enum CalibrationModeEnum {
   CM_Raw0 = 0,
   CM_Raw = 255,
   CM_NUC = 1,
   CM_RT = 2,
   CM_IBR = 3,
   CM_IBI = 4
};

/**
 * CalibrationMode enumeration values data type
 */
typedef enum CalibrationModeEnum CalibrationMode_t;

/**
 * CalibrationCollectionType enumeration values
 */
enum CalibrationCollectionTypeEnum {
   CCT_TelopsFixed = 0,
   CCT_TelopsFW = 1,
   CCT_TelopsNDF = 2,
   CCT_MultipointFixed = 3,
   CCT_MultipointEHDRI = 4,
   CCT_MultipointFW = 5,
   CCT_MultipointNDF = 6,
   CCT_TelopsFOV = 7,
   CCT_MultipointFOV = 8
};

/**
 * CalibrationCollectionType enumeration values data type
 */
typedef enum CalibrationCollectionTypeEnum CalibrationCollectionType_t;

/**
 * CalibrationCollectionActiveType enumeration values
 */
enum CalibrationCollectionActiveTypeEnum {
   CCAT_TelopsFixed = 0,
   CCAT_TelopsFW = 1,
   CCAT_TelopsNDF = 2,
   CCAT_MultipointFixed = 3,
   CCAT_MultipointEHDRI = 4,
   CCAT_MultipointFW = 5,
   CCAT_MultipointNDF = 6,
   CCAT_TelopsFOV = 7,
   CCAT_MultipointFOV = 8
};

/**
 * CalibrationCollectionActiveType enumeration values data type
 */
typedef enum CalibrationCollectionActiveTypeEnum CalibrationCollectionActiveType_t;

/**
 * ImageCorrectionMode enumeration values
 */
enum ImageCorrectionModeEnum {
   ICM_BlackBody = 0,
   ICM_ICU = 1
};

/**
 * ImageCorrectionMode enumeration values data type
 */
typedef enum ImageCorrectionModeEnum ImageCorrectionMode_t;

/**
 * ImageCorrectionBlockSelector enumeration values
 */
enum ImageCorrectionBlockSelectorEnum {
   ICBS_AllBlocks = 0,
   ICBS_ActiveBlock = 1
};

/**
 * ImageCorrectionBlockSelector enumeration values data type
 */
typedef enum ImageCorrectionBlockSelectorEnum ImageCorrectionBlockSelector_t;

/**
 * ImageCorrectionFWMode enumeration values
 */
enum ImageCorrectionFWModeEnum {
   ICFWM_Fixed = 0,
   ICFWM_SynchronouslyRotating = 2
};

/**
 * ImageCorrectionFWMode enumeration values data type
 */
typedef enum ImageCorrectionFWModeEnum ImageCorrectionFWMode_t;

/**
 * NDFilterPositionSetpoint enumeration values
 */
enum NDFilterPositionSetpointEnum {
   NDFPS_NDFilter1 = 0,
   NDFPS_NDFilter2 = 1,
   NDFPS_NDFilter3 = 2
};

/**
 * NDFilterPositionSetpoint enumeration values data type
 */
typedef enum NDFilterPositionSetpointEnum NDFilterPositionSetpoint_t;

/**
 * NDFilterPosition enumeration values
 */
enum NDFilterPositionEnum {
   NDFP_NDFilter1 = 0,
   NDFP_NDFilter2 = 1,
   NDFP_NDFilter3 = 2,
   NDFP_NDFilterInTransition = 3,
   NDFP_NDFilterNotImplemented = 4
};

/**
 * NDFilterPosition enumeration values data type
 */
typedef enum NDFilterPositionEnum NDFilterPosition_t;

/**
 * FWMode enumeration values
 */
enum FWModeEnum {
   FWM_Fixed = 0,
   FWM_AsynchronouslyRotating = 1,
   FWM_SynchronouslyRotating = 2
};

/**
 * FWMode enumeration values data type
 */
typedef enum FWModeEnum FWMode_t;

/**
 * FWPositionSetpoint enumeration values
 */
enum FWPositionSetpointEnum {
   FWPS_Filter1 = 0,
   FWPS_Filter2 = 1,
   FWPS_Filter3 = 2,
   FWPS_Filter4 = 3,
   FWPS_Filter5 = 4,
   FWPS_Filter6 = 5,
   FWPS_Filter7 = 6,
   FWPS_Filter8 = 7
};

/**
 * FWPositionSetpoint enumeration values data type
 */
typedef enum FWPositionSetpointEnum FWPositionSetpoint_t;

/**
 * FWPosition enumeration values
 */
enum FWPositionEnum {
   FWP_Filter1 = 0,
   FWP_Filter2 = 1,
   FWP_Filter3 = 2,
   FWP_Filter4 = 3,
   FWP_Filter5 = 4,
   FWP_Filter6 = 5,
   FWP_Filter7 = 6,
   FWP_Filter8 = 7,
   FWP_FilterWheelInTransition = 8,
   FWP_FilterWheelNotImplemented = 9
};

/**
 * FWPosition enumeration values data type
 */
typedef enum FWPositionEnum FWPosition_t;

/**
 * FOVPositionSetpoint enumeration values
 */
enum FOVPositionSetpointEnum {
   FOVPS_FOV1 = 0,
   FOVPS_FOV2 = 1,
   FOVPS_FOV3 = 2,
   FOVPS_FOV4 = 3
};

/**
 * FOVPositionSetpoint enumeration values data type
 */
typedef enum FOVPositionSetpointEnum FOVPositionSetpoint_t;

/**
 * FOVPosition enumeration values
 */
enum FOVPositionEnum {
   FOVP_FOV1 = 0,
   FOVP_FOV2 = 1,
   FOVP_FOV3 = 2,
   FOVP_FOV4 = 3,
   FOVP_FOVInTransition = 254,
   FOVP_FOVNotImplemented = 255
};

/**
 * FOVPosition enumeration values data type
 */
typedef enum FOVPositionEnum FOVPosition_t;

/**
 * AutofocusMode enumeration values
 */
enum AutofocusModeEnum {
   AM_Off = 0,
   AM_Once = 1
};

/**
 * AutofocusMode enumeration values data type
 */
typedef enum AutofocusModeEnum AutofocusMode_t;

/**
 * ICUPositionSetpoint enumeration values
 */
enum ICUPositionSetpointEnum {
   ICUPS_Scene = 0,
   ICUPS_InternalCalibrationUnit = 1
};

/**
 * ICUPositionSetpoint enumeration values data type
 */
typedef enum ICUPositionSetpointEnum ICUPositionSetpoint_t;

/**
 * ICUPosition enumeration values
 */
enum ICUPositionEnum {
   ICUP_Scene = 0,
   ICUP_InternalCalibrationUnit = 1,
   ICUP_ICUInTransition = 2,
   ICUP_ICUNotImplemented = 3
};

/**
 * ICUPosition enumeration values data type
 */
typedef enum ICUPositionEnum ICUPosition_t;

/**
 * PixelFormat enumeration values
 */
enum PixelFormatEnum {
   PF_Mono8 = 17301505,
   PF_Mono8Signed = 17301506,
   PF_Mono10 = 17825795,
   PF_Mono10Packed = 17563652,
   PF_Mono12 = 17825797,
   PF_Mono12Packed = 17563654,
   PF_Mono14 = 17825829,
   PF_Mono16 = 17825799,
   PF_BayerGR8 = 17301512,
   PF_BayerRG8 = 17301513,
   PF_BayerGB8 = 17301514,
   PF_BayerBG8 = 17301515,
   PF_BayerGR10 = 17825804,
   PF_BayerRG10 = 17825805,
   PF_BayerGB10 = 17825806,
   PF_BayerBG10 = 17825807,
   PF_BayerGR12 = 17825808,
   PF_BayerRG12 = 17825809,
   PF_BayerGB12 = 17825810,
   PF_BayerBG12 = 17825811,
   PF_BayerGR10Packed = 17563686,
   PF_BayerRG10Packed = 17563687,
   PF_BayerGB10Packed = 17563688,
   PF_BayerBG10Packed = 17563689,
   PF_BayerGR12Packed = 17563690,
   PF_BayerRG12Packed = 17563691,
   PF_BayerGB12Packed = 17563692,
   PF_BayerBG12Packed = 17563693,
   PF_BayerGR16 = 17825838,
   PF_BayerRG16 = 17825839,
   PF_BayerGB16 = 17825840,
   PF_BayerBG16 = 17825841,
   PF_RGB8Packed = 35127316,
   PF_BGR8Packed = 35127317,
   PF_RGBA8Packed = 35651606,
   PF_RGB10Packed = 36700184,
   PF_RGB12Packed = 36700186,
   PF_YUV411Packed = 34340894,
   PF_YUV422Packed = 34603039,
   PF_YUV444Packed = 35127328
};

/**
 * PixelFormat enumeration values data type
 */
typedef enum PixelFormatEnum PixelFormat_t;

/**
 * TestImageSelector enumeration values
 */
enum TestImageSelectorEnum {
   TIS_Off = 0,
   TIS_TelopsStaticShade = 30,
   TIS_TelopsDynamicShade = 31,
   TIS_TelopsConstantValue1 = 35,
   TIS_ManufacturerStaticImage1 = 40,
   TIS_ManufacturerStaticImage2 = 41,
   TIS_ManufacturerStaticImage3 = 42,
   TIS_ManufacturerDynamicImage = 43,
   TIS_ManufacturerStaticImage = 44
};

/**
 * TestImageSelector enumeration values data type
 */
typedef enum TestImageSelectorEnum TestImageSelector_t;

/**
 * SensorWellDepth enumeration values
 */
enum SensorWellDepthEnum {
   SWD_LowGain = 0,
   SWD_HighGain = 1
};

/**
 * SensorWellDepth enumeration values data type
 */
typedef enum SensorWellDepthEnum SensorWellDepth_t;

/**
 * IntegrationMode enumeration values
 */
enum IntegrationModeEnum {
   IM_IntegrateThenRead = 0,
   IM_IntegrateWhileRead = 1
};

/**
 * IntegrationMode enumeration values data type
 */
typedef enum IntegrationModeEnum IntegrationMode_t;

/**
 * TriggerSelector enumeration values
 */
enum TriggerSelectorEnum {
   TS_AcquisitionStart = 0,
   TS_Flagging = 1,
   TS_Gating = 2
};

/**
 * TriggerSelector enumeration values data type
 */
typedef enum TriggerSelectorEnum TriggerSelector_t;

/**
 * TriggerMode enumeration values
 */
enum TriggerModeEnum {
   TM_Off = 0,
   TM_On = 1
};

/**
 * TriggerMode enumeration values data type
 */
typedef enum TriggerModeEnum TriggerMode_t;

/**
 * TriggerSource enumeration values
 */
enum TriggerSourceEnum {
   TS_Software = 0,
   TS_ExternalSignal = 48
};

/**
 * TriggerSource enumeration values data type
 */
typedef enum TriggerSourceEnum TriggerSource_t;

/**
 * TriggerActivation enumeration values
 */
enum TriggerActivationEnum {
   TA_RisingEdge = 0,
   TA_FallingEdge = 1,
   TA_AnyEdge = 2,
   TA_LevelHigh = 3,
   TA_LevelLow = 4
};

/**
 * TriggerActivation enumeration values data type
 */
typedef enum TriggerActivationEnum TriggerActivation_t;

/**
 * MemoryBufferMode enumeration values
 */
enum MemoryBufferModeEnum {
   MBM_Off = 0,
   MBM_On = 1
};

/**
 * MemoryBufferMode enumeration values data type
 */
typedef enum MemoryBufferModeEnum MemoryBufferMode_t;

/**
 * MemoryBufferLegacyMode enumeration values
 */
enum MemoryBufferLegacyModeEnum {
   MBLM_Off = 0,
   MBLM_On = 1
};

/**
 * MemoryBufferLegacyMode enumeration values data type
 */
typedef enum MemoryBufferLegacyModeEnum MemoryBufferLegacyMode_t;

/**
 * MemoryBufferMOISource enumeration values
 */
enum MemoryBufferMOISourceEnum {
   MBMOIS_AcquisitionStarted = 0,
   MBMOIS_Software = 1,
   MBMOIS_ExternalSignal = 2,
   MBMOIS_None = 255
};

/**
 * MemoryBufferMOISource enumeration values data type
 */
typedef enum MemoryBufferMOISourceEnum MemoryBufferMOISource_t;

/**
 * MemoryBufferMOIActivation enumeration values
 */
enum MemoryBufferMOIActivationEnum {
   MBMOIA_RisingEdge = 0,
   MBMOIA_FallingEdge = 1,
   MBMOIA_AnyEdge = 2
};

/**
 * MemoryBufferMOIActivation enumeration values data type
 */
typedef enum MemoryBufferMOIActivationEnum MemoryBufferMOIActivation_t;

/**
 * MemoryBufferSequenceDownloadMode enumeration values
 */
enum MemoryBufferSequenceDownloadModeEnum {
   MBSDM_Off = 0,
   MBSDM_Sequence = 1,
   MBSDM_Image = 2
};

/**
 * MemoryBufferSequenceDownloadMode enumeration values data type
 */
typedef enum MemoryBufferSequenceDownloadModeEnum MemoryBufferSequenceDownloadMode_t;

/**
 * GPSModeIndicator enumeration values
 */
enum GPSModeIndicatorEnum {
   GPSMI_NotAvailable = 0,
   GPSMI_Autonomous = 65,
   GPSMI_Differential = 68,
   GPSMI_Estimated = 69,
   GPSMI_DataNotValid = 78
};

/**
 * GPSModeIndicator enumeration values data type
 */
typedef enum GPSModeIndicatorEnum GPSModeIndicator_t;

/**
 * AutomaticExternalFanSpeedMode enumeration values
 */
enum AutomaticExternalFanSpeedModeEnum {
   AEFSM_Off = 0,
   AEFSM_On = 1
};

/**
 * AutomaticExternalFanSpeedMode enumeration values data type
 */
typedef enum AutomaticExternalFanSpeedModeEnum AutomaticExternalFanSpeedMode_t;

/**
 * TimeSource enumeration values
 */
enum TimeSourceEnum {
   TS_InternalRealTimeClock = 0,
   TS_IRIGB = 1,
   TS_GPS = 2
};

/**
 * TimeSource enumeration values data type
 */
typedef enum TimeSourceEnum TimeSource_t;

/**
 * VideoAGC enumeration values
 */
enum VideoAGCEnum {
   VAGC_Off = 0,
   VAGC_Once = 1,
   VAGC_Continuous = 3
};

/**
 * VideoAGC enumeration values data type
 */
typedef enum VideoAGCEnum VideoAGC_t;

/**
 * VideoColorMap enumeration values
 */
enum VideoColorMapEnum {
   VCM_Gray = 0,
   VCM_GrayInverted = 1,
   VCM_Rainbow = 2,
   VCM_Hot = 3,
   VCM_Cold = 4
};

/**
 * VideoColorMap enumeration values data type
 */
typedef enum VideoColorMapEnum VideoColorMap_t;

/**
 * VideoDigitalZoomFactor enumeration values
 */
enum VideoDigitalZoomFactorEnum {
   VDZF_x1 = 0,
   VDZF_x2 = 1,
   VDZF_x4 = 2,
   VDZF_x8 = 3,
   VDZF_x16 = 4,
   VDZF_x32 = 5
};

/**
 * VideoDigitalZoomFactor enumeration values data type
 */
typedef enum VideoDigitalZoomFactorEnum VideoDigitalZoomFactor_t;

/**
 * VideoEHDRIExposureIndex enumeration values
 */
enum VideoEHDRIExposureIndexEnum {
   VEHDRIEI_Exposure1 = 0,
   VEHDRIEI_Exposure2 = 1,
   VEHDRIEI_Exposure3 = 2,
   VEHDRIEI_Exposure4 = 3
};

/**
 * VideoEHDRIExposureIndex enumeration values data type
 */
typedef enum VideoEHDRIExposureIndexEnum VideoEHDRIExposureIndex_t;

/**
 * VideoFWPosition enumeration values
 */
enum VideoFWPositionEnum {
   VFWP_Filter1 = 0,
   VFWP_Filter2 = 1,
   VFWP_Filter3 = 2,
   VFWP_Filter4 = 3,
   VFWP_Filter5 = 4,
   VFWP_Filter6 = 5,
   VFWP_Filter7 = 6,
   VFWP_Filter8 = 7
};

/**
 * VideoFWPosition enumeration values data type
 */
typedef enum VideoFWPositionEnum VideoFWPosition_t;

/**
 * VideoDigitalZoomMode enumeration values
 */
enum VideoDigitalZoomModeEnum {
   VDZM_Simple = 0,
   VDZM_Advanced = 1
};

/**
 * VideoDigitalZoomMode enumeration values data type
 */
typedef enum VideoDigitalZoomModeEnum VideoDigitalZoomMode_t;

/**
 * DeviceSerialPortSelector enumeration values
 */
enum DeviceSerialPortSelectorEnum {
   DSPS_CameraLink = 0,
   DSPS_RS232 = 1,
   DSPS_USB = 2
};

/**
 * DeviceSerialPortSelector enumeration values data type
 */
typedef enum DeviceSerialPortSelectorEnum DeviceSerialPortSelector_t;

/**
 * DeviceSerialPortBaudRate enumeration values
 */
enum DeviceSerialPortBaudRateEnum {
   DSPBR_Baud9600 = 0,
   DSPBR_Baud19200 = 1,
   DSPBR_Baud38400 = 2,
   DSPBR_Baud57600 = 3,
   DSPBR_Baud115200 = 4,
   DSPBR_Baud230400 = 5,
   DSPBR_Baud460800 = 6,
   DSPBR_Baud921600 = 7
};

/**
 * DeviceSerialPortBaudRate enumeration values data type
 */
typedef enum DeviceSerialPortBaudRateEnum DeviceSerialPortBaudRate_t;

/**
 * DeviceSerialPortFunction enumeration values
 */
enum DeviceSerialPortFunctionEnum {
   DSPF_Disabled = 0,
   DSPF_Control = 1,
   DSPF_Terminal = 2
};

/**
 * DeviceSerialPortFunction enumeration values data type
 */
typedef enum DeviceSerialPortFunctionEnum DeviceSerialPortFunction_t;

/**
 * PixelDataResolution enumeration values
 */
enum PixelDataResolutionEnum {
   PDR_Bpp13 = 13,
   PDR_Bpp14 = 14,
   PDR_Bpp15 = 15,
   PDR_Bpp16 = 16
};

/**
 * PixelDataResolution enumeration values data type
 */
typedef enum PixelDataResolutionEnum PixelDataResolution_t;

/**
 * EventSelector enumeration values
 */
enum EventSelectorEnum {
   ES_Error = 2,
   ES_Telops = 32
};

/**
 * EventSelector enumeration values data type
 */
typedef enum EventSelectorEnum EventSelector_t;

/**
 * EventNotification enumeration values
 */
enum EventNotificationEnum {
   EN_Off = 0,
   EN_On = 1
};

/**
 * EventNotification enumeration values data type
 */
typedef enum EventNotificationEnum EventNotification_t;

/**
 * EventErrorCodeDesc enumeration values
 */
enum EventErrorCodeDescEnum {
   EECD_NoError = 0,
   EECD_InvalidExposure = 1,
   EECD_InvalidHeight = 2,
   EECD_InvalidWidth = 3,
   EECD_InvalidOffsetX = 4,
   EECD_InvalidOffsetY = 5,
   EECD_InvalidFrameRate = 6,
   EECD_InvalidWellDepth = 7,
   EECD_InvalidIntegrationMode = 8,
   EECD_RQNotAvailable = 9,
   EECD_WaitingForCooler = 10,
   EECD_FPATemperatureDifferent = 11,
   EECD_NUCNotAvailable = 12,
   EECD_InvalidCoolerTemperature = 13,
   EECD_WaitingForImageCorrection = 14,
   EECD_CoolerNotCooling = 15,
   EECD_ImageCorrectionFileIOError = 16,
   EECD_ImageCorrectionInvalidReferenceBlock = 17,
   EECD_ImageCorrectionAcquisitionTimeout = 18,
   EECD_FilterWheelTimeout = 19,
   EECD_FilterWheelHomingError = 20,
   EECD_NDFilterTimeout = 21,
   EECD_NDFilterInitializationError = 22,
   EECD_RawNotAvailable = 23,
   EECD_WaitingForICU = 24,
   EECD_WaitingForNDFilter = 25,
   EECD_WaitingForFilterWheel = 26,
   EECD_AcquisitionStarted = 27,
   EECD_WaitingForCalibrationData = 28,
   EECD_WaitingForOutputFPGA = 29,
   EECD_WaitingForPower = 30,
   EECD_GPSCommunicationLost = 31,
   EECD_BuiltInTestFailed = 32,
   EECD_MemoryBufferInitialisationError = 33,
   EECD_MemoryBufferDownloadFrameSizeMissmatch = 34,
   EECD_MemoryBufferDownloadClearedSequence = 35,
   EECD_MemoryBufferDefragError = 36,
   EECD_MemoryBufferDDRError = 37,
   EECD_MemoryBufferHardwareCompletionTimeout = 38,
   EECD_MotorizedLensError = 39,
   EECD_AutofocusModuleError = 40,
   EECD_AutofocusTimeout = 41
};

/**
 * EventErrorCodeDesc enumeration values data type
 */
typedef enum EventErrorCodeDescEnum EventErrorCodeDesc_t;

/**
 * EventTelopsCodeDesc enumeration values
 */
enum EventTelopsCodeDescEnum {
   ETCD_NoEvent = 0,
   ETCD_DeviceIsBusyEvent = 1,
   ETCD_ImageCorrectionEvent = 2
};

/**
 * EventTelopsCodeDesc enumeration values data type
 */
typedef enum EventTelopsCodeDescEnum EventTelopsCodeDesc_t;

/**
 * ClConfiguration enumeration values
 */
enum ClConfigurationEnum {
   CC_Base = 0,
   CC_Medium = 1,
   CC_Full = 2,
   CC_DualBase = 3,
   CC_Deca = 4
};

/**
 * ClConfiguration enumeration values data type
 */
typedef enum ClConfigurationEnum ClConfiguration_t;

/**
 * DeviceTapGeometry enumeration values
 */
enum DeviceTapGeometryEnum {
   DTG_Geometry_1X_1Y = 0,
   DTG_Geometry_1X2_1Y = 1,
   DTG_Geometry_2X_1Y = 2,
   DTG_Geometry_2XE_1Y = 3,
   DTG_Geometry_2XM_1Y = 4,
   DTG_Geometry_1X_1Y2 = 5,
   DTG_Geometry_1X_2YE = 6,
   DTG_Geometry_1X3_1Y = 7,
   DTG_Geometry_3X_1Y = 8,
   DTG_Geometry_1X = 9,
   DTG_Geometry_1X2 = 10,
   DTG_Geometry_2X = 11,
   DTG_Geometry_2XE = 12,
   DTG_Geometry_2XM = 13,
   DTG_Geometry_1X3 = 14,
   DTG_Geometry_3X = 15,
   DTG_Geometry_1X4_1Y = 16,
   DTG_Geometry_4X_1Y = 17,
   DTG_Geometry_2X2_1Y = 18,
   DTG_Geometry_2X2E_1Y = 19,
   DTG_Geometry_2X2M_1Y = 20,
   DTG_Geometry_1X2_2YE = 21,
   DTG_Geometry_2X_2YE = 22,
   DTG_Geometry_2XE_2YE = 23,
   DTG_Geometry_2XM_2YE = 24,
   DTG_Geometry_1X4 = 25,
   DTG_Geometry_4X = 26,
   DTG_Geometry_2X2 = 27,
   DTG_Geometry_2X2E = 28,
   DTG_Geometry_2X2M = 29,
   DTG_Geometry_1X8_1Y = 30,
   DTG_Geometry_8X_1Y = 31,
   DTG_Geometry_4X2_1Y = 32,
   DTG_Geometry_2X2E_2YE = 33,
   DTG_Geometry_1X8 = 34,
   DTG_Geometry_8X = 35,
   DTG_Geometry_4X2 = 36
};

/**
 * DeviceTapGeometry enumeration values data type
 */
typedef enum DeviceTapGeometryEnum DeviceTapGeometry_t;

/**
 * DeviceFirmwareModuleSelector enumeration values
 */
enum DeviceFirmwareModuleSelectorEnum {
   DFMS_ProcessingFPGAHardwareRevision = 0,
   DFMS_ProcessingFPGASoftwareRevision = 1,
   DFMS_ProcessingFPGABootLoaderRevision = 2,
   DFMS_ProcessingFPGACommonRevision = 3,
   DFMS_OutputFPGAHardwareRevision = 4,
   DFMS_OutputFPGASoftwareRevision = 5,
   DFMS_OutputFPGABootLoaderRevision = 6,
   DFMS_OutputFPGACommonRevision = 7,
   DFMS_StorageFPGAHardwareRevision = 8,
   DFMS_StorageFPGASoftwareRevision = 9,
   DFMS_StorageFPGABootLoaderRevision = 10,
   DFMS_StorageFPGACommonRevision = 11
};

/**
 * DeviceFirmwareModuleSelector enumeration values data type
 */
typedef enum DeviceFirmwareModuleSelectorEnum DeviceFirmwareModuleSelector_t;

/**
 * DeviceTemperatureSelector enumeration values
 */
enum DeviceTemperatureSelectorEnum {
   DTS_Sensor = 0,
   DTS_Mainboard = 1,
   DTS_InternalLens = 2,
   DTS_ExternalLens = 3,
   DTS_InternalCalibrationUnit = 4,
   DTS_SpectralFilterWheel = 5,
   DTS_Compressor = 6,
   DTS_ColdFinger = 7,
   DTS_Spare = 8,
   DTS_ExternalThermistor = 9,
   DTS_ProcessingFPGA = 10,
   DTS_OutputFPGA = 11,
   DTS_StorageFPGA = 12
};

/**
 * DeviceTemperatureSelector enumeration values data type
 */
typedef enum DeviceTemperatureSelectorEnum DeviceTemperatureSelector_t;

/**
 * DeviceClockSelector enumeration values
 */
enum DeviceClockSelectorEnum {
   DCS_Sensor = 0,
   DCS_SensorDigitization = 1,
   DCS_CameraLink = 2
};

/**
 * DeviceClockSelector enumeration values data type
 */
typedef enum DeviceClockSelectorEnum DeviceClockSelector_t;

/**
 * DeviceVoltageSelector enumeration values
 */
enum DeviceVoltageSelectorEnum {
   DVS_ProcessingFPGA_VCCINT = 0,
   DVS_ProcessingFPGA_VCCAUX = 1,
   DVS_ProcessingFPGA_VREFP = 2,
   DVS_ProcessingFPGA_VREFN = 3,
   DVS_ProcessingFPGA_VBRAM = 4,
   DVS_OutputFPGA_VCCINT = 5,
   DVS_OutputFPGA_VCCAUX = 6,
   DVS_OutputFPGA_VREFP = 7,
   DVS_OutputFPGA_VREFN = 8,
   DVS_OutputFPGA_VBRAM = 9,
   DVS_Cooler = 10,
   DVS_Supply24V = 11,
   DVS_USB_VBUS = 12,
   DVS_USB1V8 = 13,
   DVS_DDR3_VREF = 14,
   DVS_VCC10GigE = 15,
   DVS_VCCAUX_IO_P = 16,
   DVS_VCCAUX_IO_O = 17,
   DVS_Supply3V3 = 18,
   DVS_Supply2V5 = 19,
   DVS_Supply1V8 = 20,
   DVS_Supply1V5 = 21,
   DVS_MGT1V0 = 22,
   DVS_MGT1V2 = 23,
   DVS_Supply12V = 24,
   DVS_Supply5V = 25,
   DVS_StorageFPGA_VCCINT = 26,
   DVS_StorageFPGA_VCCAUX = 27,
   DVS_StorageFPGA_VREFP = 28,
   DVS_StorageFPGA_VREFN = 29,
   DVS_StorageFPGA_VBRAM = 30
};

/**
 * DeviceVoltageSelector enumeration values data type
 */
typedef enum DeviceVoltageSelectorEnum DeviceVoltageSelector_t;

/**
 * DeviceCurrentSelector enumeration values
 */
enum DeviceCurrentSelectorEnum {
   DCS_Cooler = 0,
   DCS_Supply24V = 1
};

/**
 * DeviceCurrentSelector enumeration values data type
 */
typedef enum DeviceCurrentSelectorEnum DeviceCurrentSelector_t;

/**
 * DevicePowerStateSetpoint enumeration values
 */
enum DevicePowerStateSetpointEnum {
   DPSS_PowerStandby = 0,
   DPSS_PowerOn = 1
};

/**
 * DevicePowerStateSetpoint enumeration values data type
 */
typedef enum DevicePowerStateSetpointEnum DevicePowerStateSetpoint_t;

/**
 * DevicePowerState enumeration values
 */
enum DevicePowerStateEnum {
   DPS_PowerStandby = 0,
   DPS_PowerOn = 1,
   DPS_PowerInTransition = 2
};

/**
 * DevicePowerState enumeration values data type
 */
typedef enum DevicePowerStateEnum DevicePowerState_t;

/**
 * DeviceLedIndicatorState enumeration values
 */
enum DeviceLedIndicatorStateEnum {
   DLIS_Error = 0,
   DLIS_Warning = 1,
   DLIS_Standby = 2,
   DLIS_WarningWhileStreaming = 3,
   DLIS_Streaming = 4,
   DLIS_Busy = 5,
   DLIS_Ready = 6
};

/**
 * DeviceLedIndicatorState enumeration values data type
 */
typedef enum DeviceLedIndicatorStateEnum DeviceLedIndicatorState_t;

// Registers address definition
////////////////////////////////////////////////////////////////////////////////

// #define DeviceVendorNameAddr                          0x00000048  /**< DeviceVendorName register address */
// #define DeviceModelNameAddr                           0x00000068  /**< DeviceModelName register address */
// #define DeviceVersionAddr                             0x00000088  /**< DeviceVersion register address */
// #define DeviceManufacturerInfoAddr                    0x000000A8  /**< DeviceManufacturerInfo register address */
// #define DeviceIDAddr                                  0x000000D8  /**< DeviceID register address */
// #define GevFirstURLAddr                               0x00000200  /**< GevFirstURL register address */
// #define GevSecondURLAddr                              0x00000400  /**< GevSecondURL register address */
// #define SensorWidthAddr                               0x0000A020  /**< SensorWidth register address */
// #define SensorHeightAddr                              0x0000A024  /**< SensorHeight register address */
// #define DeviceRegistersStreamingStartAddr             0x0000D1BC  /**< DeviceRegistersStreamingStart register address */
// #define DeviceRegistersStreamingEndAddr               0x0000D1C0  /**< DeviceRegistersStreamingEnd register address */
// #define WidthAddr                                     0x0000D300  /**< Width register address */
// #define HeightAddr                                    0x0000D304  /**< Height register address */
// #define PixelFormatAddr                               0x0000D308  /**< PixelFormat register address */
// #define PayloadSizeAddr                               0x0000D30C  /**< PayloadSize register address */
// #define AcquisitionModeAddr                           0x0000D310  /**< AcquisitionMode register address */
// #define AcquisitionStartAddr                          0x0000D314  /**< AcquisitionStart register address */
// #define AcquisitionStopAddr                           0x0000D318  /**< AcquisitionStop register address */
// #define DeviceResetAddr                               0x0000D340  /**< DeviceReset register address */
// #define AcquisitionArmAddr                            0x0000E800  /**< AcquisitionArm register address */
// #define ExposureModeAddr                              0x0000E804  /**< ExposureMode register address */
// #define ExposureTimeAddr                              0x0000E808  /**< ExposureTime register address */
// #define ExposureTimeSetToMaxAddr                      0x0000E80C  /**< ExposureTimeSetToMax register address */
// #define AcquisitionFrameRateAddr                      0x0000E810  /**< AcquisitionFrameRate register address */
// #define AcquisitionFrameRateSetToMaxAddr              0x0000E814  /**< AcquisitionFrameRateSetToMax register address */
// #define AcquisitionFrameRateModeAddr                  0x0000E818  /**< AcquisitionFrameRateMode register address */
// #define AcquisitionFrameRateMaxFGAddr                 0x0000E81C  /**< AcquisitionFrameRateMaxFG register address */
// #define AECImageFractionAddr                          0x0000E820  /**< AECImageFraction register address */
// #define AECTargetWellFillingAddr                      0x0000E824  /**< AECTargetWellFilling register address */
// #define AECResponseTimeAddr                           0x0000E828  /**< AECResponseTime register address */
// #define ExposureAutoAddr                              0x0000E82C  /**< ExposureAuto register address */
// #define EHDRIModeAddr                                 0x0000E830  /**< EHDRIMode register address */
// #define EHDRIExpectedTemperatureMinAddr               0x0000E834  /**< EHDRIExpectedTemperatureMin register address */
// #define EHDRIExpectedTemperatureMinMaxAddr            0x0000E838  /**< EHDRIExpectedTemperatureMinMax register address */
// #define EHDRIExpectedTemperatureMaxAddr               0x0000E83C  /**< EHDRIExpectedTemperatureMax register address */
// #define EHDRIExpectedTemperatureMaxMinAddr            0x0000E840  /**< EHDRIExpectedTemperatureMaxMin register address */
// #define EHDRINumberOfExposuresAddr                    0x0000E844  /**< EHDRINumberOfExposures register address */
// #define EHDRIResetToDefaultAddr                       0x0000E848  /**< EHDRIResetToDefault register address */
// #define ExposureTime1Addr                             0x0000E84C  /**< ExposureTime1 register address */
// #define ExposureTime2Addr                             0x0000E850  /**< ExposureTime2 register address */
// #define ExposureTime3Addr                             0x0000E854  /**< ExposureTime3 register address */
// #define ExposureTime4Addr                             0x0000E858  /**< ExposureTime4 register address */
// #define EHDRIExposureOccurrence1Addr                  0x0000E85C  /**< EHDRIExposureOccurrence1 register address */
// #define EHDRIExposureOccurrence2Addr                  0x0000E860  /**< EHDRIExposureOccurrence2 register address */
// #define EHDRIExposureOccurrence3Addr                  0x0000E864  /**< EHDRIExposureOccurrence3 register address */
// #define EHDRIExposureOccurrence4Addr                  0x0000E868  /**< EHDRIExposureOccurrence4 register address */
// #define CalibrationModeAddr                           0x0000E86C  /**< CalibrationMode register address */
// #define CalibrationCollectionCountAddr                0x0000E870  /**< CalibrationCollectionCount register address */
// #define CalibrationCollectionSelectorAddr             0x0000E874  /**< CalibrationCollectionSelector register address */
// #define CalibrationCollectionPOSIXTimeAddr            0x0000E878  /**< CalibrationCollectionPOSIXTime register address */
// #define CalibrationCollectionLoadAddr                 0x0000E87C  /**< CalibrationCollectionLoad register address */
// #define CalibrationCollectionActivePOSIXTimeAddr      0x0000E880  /**< CalibrationCollectionActivePOSIXTime register address */
// #define ImageCorrectionModeAddr                       0x0000E884  /**< ImageCorrectionMode register address */
// #define ImageCorrectionAddr                           0x0000E888  /**< ImageCorrection register address */
// #define NDFilterPositionSetpointAddr                  0x0000E88C  /**< NDFilterPositionSetpoint register address */
// #define NDFilterPositionAddr                          0x0000E890  /**< NDFilterPosition register address */
// #define NDFilterNumberAddr                            0x0000E894  /**< NDFilterNumber register address */
// #define NDFilterPositionRawSetpointAddr               0x0000E898  /**< NDFilterPositionRawSetpoint register address */
// #define NDFilterPositionRawAddr                       0x0000E89C  /**< NDFilterPositionRaw register address */
// #define FWModeAddr                                    0x0000E8A0  /**< FWMode register address */
// #define FWPositionSetpointAddr                        0x0000E8A4  /**< FWPositionSetpoint register address */
// #define FWPositionAddr                                0x0000E8A8  /**< FWPosition register address */
// #define FWFilterNumberAddr                            0x0000E8AC  /**< FWFilterNumber register address */
// #define FWPositionRawSetpointAddr                     0x0000E8B0  /**< FWPositionRawSetpoint register address */
// #define FWPositionRawAddr                             0x0000E8B4  /**< FWPositionRaw register address */
// #define FWSpeedSetpointAddr                           0x0000E8B8  /**< FWSpeedSetpoint register address */
// #define FWSpeedAddr                                   0x0000E8BC  /**< FWSpeed register address */
// #define FWSpeedMaxAddr                                0x0000E8C0  /**< FWSpeedMax register address */
// #define ExternalLensSerialNumberAddr                  0x0000E8C4  /**< ExternalLensSerialNumber register address */
// #define ManualFilterSerialNumberAddr                  0x0000E8C8  /**< ManualFilterSerialNumber register address */
// #define ICUPositionSetpointAddr                       0x0000E8CC  /**< ICUPositionSetpoint register address */
// #define ICUPositionAddr                               0x0000E8D0  /**< ICUPosition register address */
// #define ReverseXAddr                                  0x0000E8D4  /**< ReverseX register address */
// #define ReverseYAddr                                  0x0000E8D8  /**< ReverseY register address */
// #define SensorWellDepthAddr                           0x0000E8DC  /**< SensorWellDepth register address */
// #define IntegrationModeAddr                           0x0000E8E0  /**< IntegrationMode register address */
// #define AcquisitionStartAtStartupAddr                 0x0000E8E4  /**< AcquisitionStartAtStartup register address */
// #define CenterImageAddr                               0x0000E8E8  /**< CenterImage register address */
// #define LockedCenterImageAddr                         0x0000E8EC  /**< LockedCenterImage register address */
// #define TriggerSelectorAddr                           0x0000E8F0  /**< TriggerSelector register address */
// #define TriggerModeAddr                               0x0000E8F4  /**< TriggerMode register address */
// #define TriggerSoftwareAddr                           0x0000E8F8  /**< TriggerSoftware register address */
// #define TriggerSourceAddr                             0x0000E8FC  /**< TriggerSource register address */
// #define TriggerActivationAddr                         0x0000E900  /**< TriggerActivation register address */
// #define TriggerDelayAddr                              0x0000E904  /**< TriggerDelay register address */
// #define MemoryBufferModeAddr                          0x0000E908  /**< MemoryBufferMode register address */
// #define MemoryBufferNumberOfImagesMaxAddr             0x0000E90C  /**< MemoryBufferNumberOfImagesMax register address */
// #define MemoryBufferNumberOfSequencesMaxAddr          0x0000E910  /**< MemoryBufferNumberOfSequencesMax register address */
// #define MemoryBufferSequenceCountAddr                 0x0000E914  /**< MemoryBufferSequenceCount register address */
// #define MemoryBufferNumberOfSequencesAddr             0x0000E918  /**< MemoryBufferNumberOfSequences register address */
// #define MemoryBufferSequenceSizeMaxAddr               0x0000E91C  /**< MemoryBufferSequenceSizeMax register address */
// #define MemoryBufferSequenceSizeAddr                  0x0000E920  /**< MemoryBufferSequenceSize register address */
// #define MemoryBufferSequencePreMOISizeAddr            0x0000E924  /**< MemoryBufferSequencePreMOISize register address */
// #define MemoryBufferSequenceSelectorAddr              0x0000E928  /**< MemoryBufferSequenceSelector register address */
// #define MemoryBufferSequenceFirstFrameIDAddr          0x0000E92C  /**< MemoryBufferSequenceFirstFrameID register address */
// #define MemoryBufferSequenceMOIFrameIDAddr            0x0000E930  /**< MemoryBufferSequenceMOIFrameID register address */
// #define MemoryBufferSequenceRecordedSizeAddr          0x0000E934  /**< MemoryBufferSequenceRecordedSize register address */
// #define MemoryBufferSequenceDownloadImageFrameIDAddr  0x0000E938  /**< MemoryBufferSequenceDownloadImageFrameID register address */
// #define MemoryBufferSequenceDownloadModeAddr          0x0000E93C  /**< MemoryBufferSequenceDownloadMode register address */
// #define MemoryBufferSequenceClearAllAddr              0x0000E940  /**< MemoryBufferSequenceClearAll register address */
// #define ExternalBlackBodyTemperatureAddr              0x0000E944  /**< ExternalBlackBodyTemperature register address */
// #define DevicePowerStateSetpointAddr                  0x0000E948  /**< DevicePowerStateSetpoint register address */
// #define DevicePowerStateAddr                          0x0000E94C  /**< DevicePowerState register address */
// #define DeviceLedIndicatorStateAddr                   0x0000E950  /**< DeviceLedIndicatorState register address */
// #define StealthModeAddr                               0x0000E954  /**< StealthMode register address */
// #define PowerOnAtStartupAddr                          0x0000E958  /**< PowerOnAtStartup register address */
// #define GPSLongitudeAddr                              0x0000E95C  /**< GPSLongitude register address */
// #define GPSLatitudeAddr                               0x0000E960  /**< GPSLatitude register address */
// #define GPSAltitudeAddr                               0x0000E964  /**< GPSAltitude register address */
// #define GPSModeIndicatorAddr                          0x0000E968  /**< GPSModeIndicator register address */
// #define GPSNumberOfSatellitesInUseAddr                0x0000E96C  /**< GPSNumberOfSatellitesInUse register address */
// #define AutomaticExternalFanSpeedModeAddr             0x0000E970  /**< AutomaticExternalFanSpeedMode register address */
// #define ExternalFanSpeedSetpointAddr                  0x0000E974  /**< ExternalFanSpeedSetpoint register address */
// #define ExternalFanSpeedAddr                          0x0000E978  /**< ExternalFanSpeed register address */
// #define TimeSourceAddr                                0x0000E97C  /**< TimeSource register address */
// #define POSIXTimeAddr                                 0x0000E980  /**< POSIXTime register address */
// #define SubSecondTimeAddr                             0x0000E984  /**< SubSecondTime register address */
// #define VideoAGCAddr                                  0x0000E988  /**< VideoAGC register address */
// #define VideoColorMapAddr                             0x0000E98C  /**< VideoColorMap register address */
// #define VideoColorMapMinAddr                          0x0000E990  /**< VideoColorMapMin register address */
// #define VideoColorMapMaxAddr                          0x0000E994  /**< VideoColorMapMax register address */
// #define VideoDigitalZoomFactorAddr                    0x0000E998  /**< VideoDigitalZoomFactor register address */
// #define VideoEHDRIExposureIndexAddr                   0x0000E99C  /**< VideoEHDRIExposureIndex register address */
// #define VideoFWPositionAddr                           0x0000E9A0  /**< VideoFWPosition register address */
// #define VideoBadPixelReplacementAddr                  0x0000E9A4  /**< VideoBadPixelReplacement register address */
// #define VideoAGCFractionMinAddr                       0x0000E9A8  /**< VideoAGCFractionMin register address */
// #define VideoAGCFractionMinMaxAddr                    0x0000E9AC  /**< VideoAGCFractionMinMax register address */
// #define VideoAGCFractionMaxAddr                       0x0000E9B0  /**< VideoAGCFractionMax register address */
// #define VideoAGCFractionMaxMinAddr                    0x0000E9B4  /**< VideoAGCFractionMaxMin register address */
// #define VideoAGCResponseTimeAddr                      0x0000E9B8  /**< VideoAGCResponseTime register address */
// #define VideoDigitalZoomModeAddr                      0x0000E9BC  /**< VideoDigitalZoomMode register address */
// #define VideoDigitalZoomWidthAddr                     0x0000E9C0  /**< VideoDigitalZoomWidth register address */
// #define VideoDigitalZoomHeightAddr                    0x0000E9C4  /**< VideoDigitalZoomHeight register address */
// #define VideoDigitalZoomOffsetXAddr                   0x0000E9C8  /**< VideoDigitalZoomOffsetX register address */
// #define VideoDigitalZoomOffsetYAddr                   0x0000E9CC  /**< VideoDigitalZoomOffsetY register address */
// #define VideoReverseXAddr                             0x0000E9D0  /**< VideoReverseX register address */
// #define VideoReverseYAddr                             0x0000E9D4  /**< VideoReverseY register address */
// #define VideoFreezeAddr                               0x0000E9D8  /**< VideoFreeze register address */
// #define DeviceSerialPortSelectorAddr                  0x0000E9E0  /**< DeviceSerialPortSelector register address */
// #define DeviceSerialPortBaudRateAddr                  0x0000E9E4  /**< DeviceSerialPortBaudRate register address */
// #define ProprietaryFeatureAddr                        0x0000E9E8  /**< ProprietaryFeature register address */
// #define DeviceSerialNumberAddr                        0x0000E9EC  /**< DeviceSerialNumber register address */
// #define SensorIDAddr                                  0x0000E9F0  /**< SensorID register address */
// #define WidthMaxAddr                                  0x0000E9F4  /**< WidthMax register address */
// #define HeightMaxAddr                                 0x0000E9F8  /**< HeightMax register address */
// #define WidthMinAddr                                  0x0000E9FC  /**< WidthMin register address */
// #define WidthIncAddr                                  0x0000EA00  /**< WidthInc register address */
// #define HeightMinAddr                                 0x0000EA04  /**< HeightMin register address */
// #define HeightIncAddr                                 0x0000EA08  /**< HeightInc register address */
// #define OffsetXIncAddr                                0x0000EA0C  /**< OffsetXInc register address */
// #define OffsetYIncAddr                                0x0000EA10  /**< OffsetYInc register address */
// #define PixelDataResolutionAddr                       0x0000EA14  /**< PixelDataResolution register address */
// #define EventSelectorAddr                             0x0000EA18  /**< EventSelector register address */
// #define EventNotificationAddr                         0x0000EA1C  /**< EventNotification register address */
// #define EventErrorAddr                                0x0000EA20  /**< EventError register address */
// #define EventErrorTimestampAddr                       0x0000EA24  /**< EventErrorTimestamp register address */
// #define EventErrorCodeAddr                            0x0000EA28  /**< EventErrorCode register address */
// #define EventTelopsAddr                               0x0000EA2C  /**< EventTelops register address */
// #define EventTelopsTimestampAddr                      0x0000EA30  /**< EventTelopsTimestamp register address */
// #define EventTelopsCodeAddr                           0x0000EA34  /**< EventTelopsCode register address */
// #define FValSizeAddr                                  0x0000EA38  /**< FValSize register address */
// #define LValSizeAddr                                  0x0000EA3C  /**< LValSize register address */
// #define ClConfigurationAddr                           0x0000EA40  /**< ClConfiguration register address */
// #define DeviceTapGeometryAddr                         0x0000EA44  /**< DeviceTapGeometry register address */
// #define DeviceXMLMajorVersionAddr                     0x0000EA48  /**< DeviceXMLMajorVersion register address */
// #define DeviceXMLMinorVersionAddr                     0x0000EA4C  /**< DeviceXMLMinorVersion register address */
// #define DeviceXMLSubMinorVersionAddr                  0x0000EA50  /**< DeviceXMLSubMinorVersion register address */
// #define DeviceFirmwareMajorVersionAddr                0x0000EA54  /**< DeviceFirmwareMajorVersion register address */
// #define DeviceFirmwareMinorVersionAddr                0x0000EA58  /**< DeviceFirmwareMinorVersion register address */
// #define DeviceFirmwareSubMinorVersionAddr             0x0000EA5C  /**< DeviceFirmwareSubMinorVersion register address */
// #define DeviceFirmwareBuildVersionAddr                0x0000EA60  /**< DeviceFirmwareBuildVersion register address */
// #define DeviceFirmwareModuleSelectorAddr              0x0000EA64  /**< DeviceFirmwareModuleSelector register address */
// #define DeviceFirmwareModuleRevisionAddr              0x0000EA68  /**< DeviceFirmwareModuleRevision register address */
// #define DeviceTemperatureSelectorAddr                 0x0000EA6C  /**< DeviceTemperatureSelector register address */
// #define DeviceTemperatureAddr                         0x0000EA70  /**< DeviceTemperature register address */
// #define DeviceClockSelectorAddr                       0x0000EA74  /**< DeviceClockSelector register address */
// #define DeviceClockFrequencyAddr                      0x0000EA78  /**< DeviceClockFrequency register address */
// #define DeviceRegistersCheckAddr                      0x0000EA7C  /**< DeviceRegistersCheck register address */
// #define DeviceRegistersValidAddr                      0x0000EA80  /**< DeviceRegistersValid register address */
// #define DeviceNotReadyAddr                            0x0000EA84  /**< DeviceNotReady register address */
// #define DeviceVoltageSelectorAddr                     0x0000EA88  /**< DeviceVoltageSelector register address */
// #define DeviceVoltageAddr                             0x0000EA8C  /**< DeviceVoltage register address */
// #define DeviceCurrentSelectorAddr                     0x0000EA90  /**< DeviceCurrentSelector register address */
// #define DeviceCurrentAddr                             0x0000EA94  /**< DeviceCurrent register address */
// #define DeviceRunningTimeAddr                         0x0000EA98  /**< DeviceRunningTime register address */
// #define DeviceCoolerRunningTimeAddr                   0x0000EA9C  /**< DeviceCoolerRunningTime register address */
// #define DevicePowerOnCyclesAddr                       0x0000EAA0  /**< DevicePowerOnCycles register address */
// #define DeviceCoolerPowerOnCyclesAddr                 0x0000EAA4  /**< DeviceCoolerPowerOnCycles register address */
// #define TDCFlagsAddr                                  0x0000EAA8  /**< TDCFlags register address */
// #define TDCStatusAddr                                 0x0000EAAC  /**< TDCStatus register address */
// #define AvailabilityFlagsAddr                         0x0000EAB0  /**< AvailabilityFlags register address */
// #define AcquisitionFrameRateMaxAddr                   0x0000EAB4  /**< AcquisitionFrameRateMax register address */
// #define ExposureTimeMinAddr                           0x0000EAB8  /**< ExposureTimeMin register address */
// #define ExposureTimeMaxAddr                           0x0000EABC  /**< ExposureTimeMax register address */
// #define DeviceBuiltInTestsResults1Addr                0x0000EAC0  /**< DeviceBuiltInTestsResults1 register address */
// #define DeviceBuiltInTestsResults2Addr                0x0000EAC4  /**< DeviceBuiltInTestsResults2 register address */
// #define DeviceBuiltInTestsResults3Addr                0x0000EAC8  /**< DeviceBuiltInTestsResults3 register address */
// #define TestImageSelectorAddr                         0x0000EACC  /**< TestImageSelector register address */
// #define TriggerFrameCountAddr                         0x0000EAD0  /**< TriggerFrameCount register address */
// #define MemoryBufferSequenceDownloadBitRateMaxAddr    0x0000EAD4  /**< MemoryBufferSequenceDownloadBitRateMax register address */
// #define AcquisitionFrameRateMinAddr                   0x0000EAD8  /**< AcquisitionFrameRateMin register address */
// #define VideoDigitalZoomFactorMaxAddr                 0x0000EADC  /**< VideoDigitalZoomFactorMax register address */
// #define PayloadSizeMinFGAddr                          0x0000EAE0  /**< PayloadSizeMinFG register address */
// #define CalibrationCollectionActiveTypeAddr           0x0000EAE4  /**< CalibrationCollectionActiveType register address */
// #define ExposureTime5Addr                             0x0000EAE8  /**< ExposureTime5 register address */
// #define ExposureTime6Addr                             0x0000EAEC  /**< ExposureTime6 register address */
// #define ExposureTime7Addr                             0x0000EAF0  /**< ExposureTime7 register address */
// #define ExposureTime8Addr                             0x0000EAF4  /**< ExposureTime8 register address */
// #define DeviceDetectorPolarizationVoltageAddr         0x0000EAF8  /**< DeviceDetectorPolarizationVoltage register address */
// #define CalibrationCollectionBlockCountAddr           0x0000EAFC  /**< CalibrationCollectionBlockCount register address */
// #define CalibrationCollectionBlockSelectorAddr        0x0000EB00  /**< CalibrationCollectionBlockSelector register address */
// #define CalibrationCollectionBlockPOSIXTimeAddr       0x0000EB04  /**< CalibrationCollectionBlockPOSIXTime register address */
// #define CalibrationCollectionBlockLoadAddr            0x0000EB08  /**< CalibrationCollectionBlockLoad register address */
// #define CalibrationCollectionActiveBlockPOSIXTimeAddr 0x0000EB0C  /**< CalibrationCollectionActiveBlockPOSIXTime register address */
// #define CalibrationCollectionTypeAddr                 0x0000EB10  /**< CalibrationCollectionType register address */
// #define DeviceBuiltInTestsResults4Addr                0x0000EB14  /**< DeviceBuiltInTestsResults4 register address */
// #define DeviceBuiltInTestsResults5Addr                0x0000EB18  /**< DeviceBuiltInTestsResults5 register address */
// #define DeviceBuiltInTestsResults6Addr                0x0000EB1C  /**< DeviceBuiltInTestsResults6 register address */
// #define DeviceBuiltInTestsResults7Addr                0x0000EB20  /**< DeviceBuiltInTestsResults7 register address */
// #define DeviceBuiltInTestsResults8Addr                0x0000EB24  /**< DeviceBuiltInTestsResults8 register address */
// #define OffsetXMinAddr                                0x0000EB28  /**< OffsetXMin register address */
// #define MemoryBufferMOISourceAddr                     0x0000EB2C  /**< MemoryBufferMOISource register address */
// #define MemoryBufferMOIActivationAddr                 0x0000EB30  /**< MemoryBufferMOIActivation register address */
// #define MemoryBufferMOISoftwareAddr                   0x0000EB34  /**< MemoryBufferMOISoftware register address */
// #define OffsetXMaxAddr                                0x0000EB38  /**< OffsetXMax register address */
// #define OffsetYMinAddr                                0x0000EB3C  /**< OffsetYMin register address */
// #define OffsetYMaxAddr                                0x0000EB40  /**< OffsetYMax register address */
// #define OffsetXAddr                                   0x0000EB44  /**< OffsetX register address */
// #define OffsetYAddr                                   0x0000EB48  /**< OffsetY register address */
// #define AECPlusExtrapolationWeightAddr                0x0000EB4C  /**< AECPlusExtrapolationWeight register address */
// #define IsActiveFlagsAddr                             0x0000EB50  /**< IsActiveFlags register address */
// #define DeviceKeyValidationLowAddr                    0x0000EB54  /**< DeviceKeyValidationLow register address */
// #define DeviceKeyValidationHighAddr                   0x0000EB58  /**< DeviceKeyValidationHigh register address */
// #define NDFilterArmedPositionSetpointAddr             0x0000EB5C  /**< NDFilterArmedPositionSetpoint register address */
// #define BadPixelReplacementAddr                       0x0000EB60  /**< BadPixelReplacement register address */
// #define DeviceDetectorElectricalTapsRefAddr           0x0000EB64  /**< DeviceDetectorElectricalTapsRef register address */
// #define DeviceDetectorElectricalRefOffsetAddr         0x0000EB68  /**< DeviceDetectorElectricalRefOffset register address */
// #define ExposureTimeSetToMinAddr                      0x0000EB6C  /**< ExposureTimeSetToMin register address */
// #define MemoryBufferAvailableFreeSpaceHighAddr        0x0000EB70  /**< MemoryBufferAvailableFreeSpaceHigh register address */
// #define MemoryBufferAvailableFreeSpaceLowAddr         0x0000EB74  /**< MemoryBufferAvailableFreeSpaceLow register address */
// #define MemoryBufferFragmentedFreeSpaceHighAddr       0x0000EB78  /**< MemoryBufferFragmentedFreeSpaceHigh register address */
// #define MemoryBufferFragmentedFreeSpaceLowAddr        0x0000EB7C  /**< MemoryBufferFragmentedFreeSpaceLow register address */
// #define MemoryBufferTotalSpaceHighAddr                0x0000EB80  /**< MemoryBufferTotalSpaceHigh register address */
// #define MemoryBufferTotalSpaceLowAddr                 0x0000EB84  /**< MemoryBufferTotalSpaceLow register address */
// #define MemoryBufferSequenceOffsetXAddr               0x0000EB88  /**< MemoryBufferSequenceOffsetX register address */
// #define MemoryBufferSequenceOffsetYAddr               0x0000EB8C  /**< MemoryBufferSequenceOffsetY register address */
// #define MemoryBufferSequenceWidthAddr                 0x0000EB90  /**< MemoryBufferSequenceWidth register address */
// #define MemoryBufferSequenceHeightAddr                0x0000EB94  /**< MemoryBufferSequenceHeight register address */
// #define MemoryBufferSequenceClearAddr                 0x0000EB98  /**< MemoryBufferSequenceClear register address */
// #define MemoryBufferSequenceDefragAddr                0x0000EB9C  /**< MemoryBufferSequenceDefrag register address */
// #define MemoryBufferSequenceSizeMinAddr               0x0000EBA0  /**< MemoryBufferSequenceSizeMin register address */
// #define MemoryBufferSequenceSizeIncAddr               0x0000EBA4  /**< MemoryBufferSequenceSizeInc register address */
// #define MemoryBufferSequenceDownloadFrameIDAddr       0x0000EBA8  /**< MemoryBufferSequenceDownloadFrameID register address */
// #define MemoryBufferSequenceDownloadFrameCountAddr    0x0000EBAC  /**< MemoryBufferSequenceDownloadFrameCount register address */
// #define MemoryBufferStatusAddr                        0x0000EBB0  /**< MemoryBufferStatus register address */
// #define MemoryBufferLegacyModeAddr                    0x0000EBB4  /**< MemoryBufferLegacyMode register address */
// #define DeviceSerialPortFunctionAddr                  0x0000EBB8  /**< DeviceSerialPortFunction register address */
// #define ImageCorrectionFWAcquisitionFrameRateMinAddr  0x0000EBBC  /**< ImageCorrectionFWAcquisitionFrameRateMin register address */
// #define ImageCorrectionFWAcquisitionFrameRateMaxAddr  0x0000EBC0  /**< ImageCorrectionFWAcquisitionFrameRateMax register address */
// #define ImageCorrectionBlockSelectorAddr              0x0000EBC4  /**< ImageCorrectionBlockSelector register address */
// #define ImageCorrectionFWModeAddr                     0x0000EBC8  /**< ImageCorrectionFWMode register address */
// #define ImageCorrectionFWAcquisitionFrameRateAddr     0x0000EBCC  /**< ImageCorrectionFWAcquisitionFrameRate register address */
// #define FOVPositionRawMinAddr                         0x0000EBD0  /**< FOVPositionRawMin register address */
// #define FOVPositionRawMaxAddr                         0x0000EBD4  /**< FOVPositionRawMax register address */
// #define FocusPositionRawMinAddr                       0x0000EBD8  /**< FocusPositionRawMin register address */
// #define FocusPositionRawMaxAddr                       0x0000EBDC  /**< FocusPositionRawMax register address */
// #define FOVPositionSetpointAddr                       0x0000EBE0  /**< FOVPositionSetpoint register address */
// #define FOVPositionAddr                               0x0000EBE4  /**< FOVPosition register address */
// #define FOVPositionNumberAddr                         0x0000EBE8  /**< FOVPositionNumber register address */
// #define ZoomInFastAddr                                0x0000EBEC  /**< ZoomInFast register address */
// #define ZoomInSlowAddr                                0x0000EBF0  /**< ZoomInSlow register address */
// #define ZoomOutSlowAddr                               0x0000EBF4  /**< ZoomOutSlow register address */
// #define ZoomOutFastAddr                               0x0000EBF8  /**< ZoomOutFast register address */
// #define HFOVAddr                                      0x0000EBFC  /**< HFOV register address */
// #define VFOVAddr                                      0x0000EC00  /**< VFOV register address */
// #define FOVPositionRawSetpointAddr                    0x0000EC04  /**< FOVPositionRawSetpoint register address */
// #define FOVPositionRawAddr                            0x0000EC08  /**< FOVPositionRaw register address */
// #define AutofocusModeAddr                             0x0000EC0C  /**< AutofocusMode register address */
// #define AutofocusROIAddr                              0x0000EC10  /**< AutofocusROI register address */
// #define AutofocusAddr                                 0x0000EC14  /**< Autofocus register address */
// #define FocusNearFastAddr                             0x0000EC18  /**< FocusNearFast register address */
// #define FocusNearSlowAddr                             0x0000EC1C  /**< FocusNearSlow register address */
// #define FocusFarSlowAddr                              0x0000EC20  /**< FocusFarSlow register address */
// #define FocusFarFastAddr                              0x0000EC24  /**< FocusFarFast register address */
// #define FocusPositionRawSetpointAddr                  0x0000EC28  /**< FocusPositionRawSetpoint register address */
// #define FocusPositionRawAddr                          0x0000EC2C  /**< FocusPositionRaw register address */

// Registers definition array indices
////////////////////////////////////////////////////////////////////////////////

#define DeviceVendorNameIdx                           0
#define DeviceModelNameIdx                            1
#define DeviceVersionIdx                              2
#define DeviceManufacturerInfoIdx                     3
#define DeviceIDIdx                                   4
#define GevFirstURLIdx                                5
#define GevSecondURLIdx                               6
#define SensorWidthIdx                                7
#define SensorHeightIdx                               8
#define DeviceRegistersStreamingStartIdx              9
#define DeviceRegistersStreamingEndIdx                10
#define WidthIdx                                      11
#define HeightIdx                                     12
#define PixelFormatIdx                                13
#define PayloadSizeIdx                                14
#define AcquisitionModeIdx                            15
#define AcquisitionStartIdx                           16
#define AcquisitionStopIdx                            17
#define DeviceResetIdx                                18
#define AcquisitionArmIdx                             19
#define ExposureModeIdx                               20
#define ExposureTimeIdx                               21
#define ExposureTimeSetToMaxIdx                       22
#define AcquisitionFrameRateIdx                       23
#define AcquisitionFrameRateSetToMaxIdx               24
#define AcquisitionFrameRateModeIdx                   25
#define AcquisitionFrameRateMaxFGIdx                  26
#define AECImageFractionIdx                           27
#define AECTargetWellFillingIdx                       28
#define AECResponseTimeIdx                            29
#define ExposureAutoIdx                               30
#define EHDRIModeIdx                                  31
#define EHDRIExpectedTemperatureMinIdx                32
#define EHDRIExpectedTemperatureMinMaxIdx             33
#define EHDRIExpectedTemperatureMaxIdx                34
#define EHDRIExpectedTemperatureMaxMinIdx             35
#define EHDRINumberOfExposuresIdx                     36
#define EHDRIResetToDefaultIdx                        37
#define ExposureTime1Idx                              38
#define ExposureTime2Idx                              39
#define ExposureTime3Idx                              40
#define ExposureTime4Idx                              41
#define EHDRIExposureOccurrence1Idx                   42
#define EHDRIExposureOccurrence2Idx                   43
#define EHDRIExposureOccurrence3Idx                   44
#define EHDRIExposureOccurrence4Idx                   45
#define CalibrationModeIdx                            46
#define CalibrationCollectionCountIdx                 47
#define CalibrationCollectionSelectorIdx              48
#define CalibrationCollectionPOSIXTimeIdx             49
#define CalibrationCollectionLoadIdx                  50
#define CalibrationCollectionActivePOSIXTimeIdx       51
#define ImageCorrectionModeIdx                        52
#define ImageCorrectionIdx                            53
#define NDFilterPositionSetpointIdx                   54
#define NDFilterPositionIdx                           55
#define NDFilterNumberIdx                             56
#define NDFilterPositionRawSetpointIdx                57
#define NDFilterPositionRawIdx                        58
#define FWModeIdx                                     59
#define FWPositionSetpointIdx                         60
#define FWPositionIdx                                 61
#define FWFilterNumberIdx                             62
#define FWPositionRawSetpointIdx                      63
#define FWPositionRawIdx                              64
#define FWSpeedSetpointIdx                            65
#define FWSpeedIdx                                    66
#define FWSpeedMaxIdx                                 67
#define ExternalLensSerialNumberIdx                   68
#define ManualFilterSerialNumberIdx                   69
#define ICUPositionSetpointIdx                        70
#define ICUPositionIdx                                71
#define ReverseXIdx                                   72
#define ReverseYIdx                                   73
#define SensorWellDepthIdx                            74
#define IntegrationModeIdx                            75
#define AcquisitionStartAtStartupIdx                  76
#define CenterImageIdx                                77
#define LockedCenterImageIdx                          78
#define TriggerSelectorIdx                            79
#define TriggerModeIdx                                80
#define TriggerSoftwareIdx                            81
#define TriggerSourceIdx                              82
#define TriggerActivationIdx                          83
#define TriggerDelayIdx                               84
#define MemoryBufferModeIdx                           85
#define MemoryBufferNumberOfImagesMaxIdx              86
#define MemoryBufferNumberOfSequencesMaxIdx           87
#define MemoryBufferSequenceCountIdx                  88
#define MemoryBufferNumberOfSequencesIdx              89
#define MemoryBufferSequenceSizeMaxIdx                90
#define MemoryBufferSequenceSizeIdx                   91
#define MemoryBufferSequencePreMOISizeIdx             92
#define MemoryBufferSequenceSelectorIdx               93
#define MemoryBufferSequenceFirstFrameIDIdx           94
#define MemoryBufferSequenceMOIFrameIDIdx             95
#define MemoryBufferSequenceRecordedSizeIdx           96
#define MemoryBufferSequenceDownloadImageFrameIDIdx   97
#define MemoryBufferSequenceDownloadModeIdx           98
#define MemoryBufferSequenceClearAllIdx               99
#define ExternalBlackBodyTemperatureIdx               100
#define DevicePowerStateSetpointIdx                   101
#define DevicePowerStateIdx                           102
#define DeviceLedIndicatorStateIdx                    103
#define StealthModeIdx                                104
#define PowerOnAtStartupIdx                           105
#define GPSLongitudeIdx                               106
#define GPSLatitudeIdx                                107
#define GPSAltitudeIdx                                108
#define GPSModeIndicatorIdx                           109
#define GPSNumberOfSatellitesInUseIdx                 110
#define AutomaticExternalFanSpeedModeIdx              111
#define ExternalFanSpeedSetpointIdx                   112
#define ExternalFanSpeedIdx                           113
#define TimeSourceIdx                                 114
#define POSIXTimeIdx                                  115
#define SubSecondTimeIdx                              116
#define VideoAGCIdx                                   117
#define VideoColorMapIdx                              118
#define VideoColorMapMinIdx                           119
#define VideoColorMapMaxIdx                           120
#define VideoDigitalZoomFactorIdx                     121
#define VideoEHDRIExposureIndexIdx                    122
#define VideoFWPositionIdx                            123
#define VideoBadPixelReplacementIdx                   124
#define VideoAGCFractionMinIdx                        125
#define VideoAGCFractionMinMaxIdx                     126
#define VideoAGCFractionMaxIdx                        127
#define VideoAGCFractionMaxMinIdx                     128
#define VideoAGCResponseTimeIdx                       129
#define VideoDigitalZoomModeIdx                       130
#define VideoDigitalZoomWidthIdx                      131
#define VideoDigitalZoomHeightIdx                     132
#define VideoDigitalZoomOffsetXIdx                    133
#define VideoDigitalZoomOffsetYIdx                    134
#define VideoReverseXIdx                              135
#define VideoReverseYIdx                              136
#define VideoFreezeIdx                                137
#define DeviceSerialPortSelectorIdx                   138
#define DeviceSerialPortBaudRateIdx                   139
#define ProprietaryFeatureIdx                         140
#define DeviceSerialNumberIdx                         141
#define SensorIDIdx                                   142
#define WidthMaxIdx                                   143
#define HeightMaxIdx                                  144
#define WidthMinIdx                                   145
#define WidthIncIdx                                   146
#define HeightMinIdx                                  147
#define HeightIncIdx                                  148
#define OffsetXIncIdx                                 149
#define OffsetYIncIdx                                 150
#define PixelDataResolutionIdx                        151
#define EventSelectorIdx                              152
#define EventNotificationIdx                          153
#define EventErrorIdx                                 154
#define EventErrorTimestampIdx                        155
#define EventErrorCodeIdx                             156
#define EventTelopsIdx                                157
#define EventTelopsTimestampIdx                       158
#define EventTelopsCodeIdx                            159
#define FValSizeIdx                                   160
#define LValSizeIdx                                   161
#define ClConfigurationIdx                            162
#define DeviceTapGeometryIdx                          163
#define DeviceXMLMajorVersionIdx                      164
#define DeviceXMLMinorVersionIdx                      165
#define DeviceXMLSubMinorVersionIdx                   166
#define DeviceFirmwareMajorVersionIdx                 167
#define DeviceFirmwareMinorVersionIdx                 168
#define DeviceFirmwareSubMinorVersionIdx              169
#define DeviceFirmwareBuildVersionIdx                 170
#define DeviceFirmwareModuleSelectorIdx               171
#define DeviceFirmwareModuleRevisionIdx               172
#define DeviceTemperatureSelectorIdx                  173
#define DeviceTemperatureIdx                          174
#define DeviceClockSelectorIdx                        175
#define DeviceClockFrequencyIdx                       176
#define DeviceRegistersCheckIdx                       177
#define DeviceRegistersValidIdx                       178
#define DeviceNotReadyIdx                             179
#define DeviceVoltageSelectorIdx                      180
#define DeviceVoltageIdx                              181
#define DeviceCurrentSelectorIdx                      182
#define DeviceCurrentIdx                              183
#define DeviceRunningTimeIdx                          184
#define DeviceCoolerRunningTimeIdx                    185
#define DevicePowerOnCyclesIdx                        186
#define DeviceCoolerPowerOnCyclesIdx                  187
#define TDCFlagsIdx                                   188
#define TDCStatusIdx                                  189
#define AvailabilityFlagsIdx                          190
#define AcquisitionFrameRateMaxIdx                    191
#define ExposureTimeMinIdx                            192
#define ExposureTimeMaxIdx                            193
#define DeviceBuiltInTestsResults1Idx                 194
#define DeviceBuiltInTestsResults2Idx                 195
#define DeviceBuiltInTestsResults3Idx                 196
#define TestImageSelectorIdx                          197
#define TriggerFrameCountIdx                          198
#define MemoryBufferSequenceDownloadBitRateMaxIdx     199
#define AcquisitionFrameRateMinIdx                    200
#define VideoDigitalZoomFactorMaxIdx                  201
#define PayloadSizeMinFGIdx                           202
#define CalibrationCollectionActiveTypeIdx            203
#define ExposureTime5Idx                              204
#define ExposureTime6Idx                              205
#define ExposureTime7Idx                              206
#define ExposureTime8Idx                              207
#define DeviceDetectorPolarizationVoltageIdx          208
#define CalibrationCollectionBlockCountIdx            209
#define CalibrationCollectionBlockSelectorIdx         210
#define CalibrationCollectionBlockPOSIXTimeIdx        211
#define CalibrationCollectionBlockLoadIdx             212
#define CalibrationCollectionActiveBlockPOSIXTimeIdx  213
#define CalibrationCollectionTypeIdx                  214
#define DeviceBuiltInTestsResults4Idx                 215
#define DeviceBuiltInTestsResults5Idx                 216
#define DeviceBuiltInTestsResults6Idx                 217
#define DeviceBuiltInTestsResults7Idx                 218
#define DeviceBuiltInTestsResults8Idx                 219
#define OffsetXMinIdx                                 220
#define MemoryBufferMOISourceIdx                      221
#define MemoryBufferMOIActivationIdx                  222
#define MemoryBufferMOISoftwareIdx                    223
#define OffsetXMaxIdx                                 224
#define OffsetYMinIdx                                 225
#define OffsetYMaxIdx                                 226
#define OffsetXIdx                                    227
#define OffsetYIdx                                    228
#define AECPlusExtrapolationWeightIdx                 229
#define IsActiveFlagsIdx                              230
#define DeviceKeyValidationLowIdx                     231
#define DeviceKeyValidationHighIdx                    232
#define NDFilterArmedPositionSetpointIdx              233
#define BadPixelReplacementIdx                        234
#define DeviceDetectorElectricalTapsRefIdx            235
#define DeviceDetectorElectricalRefOffsetIdx          236
#define ExposureTimeSetToMinIdx                       237
#define MemoryBufferAvailableFreeSpaceHighIdx         238
#define MemoryBufferAvailableFreeSpaceLowIdx          239
#define MemoryBufferFragmentedFreeSpaceHighIdx        240
#define MemoryBufferFragmentedFreeSpaceLowIdx         241
#define MemoryBufferTotalSpaceHighIdx                 242
#define MemoryBufferTotalSpaceLowIdx                  243
#define MemoryBufferSequenceOffsetXIdx                244
#define MemoryBufferSequenceOffsetYIdx                245
#define MemoryBufferSequenceWidthIdx                  246
#define MemoryBufferSequenceHeightIdx                 247
#define MemoryBufferSequenceClearIdx                  248
#define MemoryBufferSequenceDefragIdx                 249
#define MemoryBufferSequenceSizeMinIdx                250
#define MemoryBufferSequenceSizeIncIdx                251
#define MemoryBufferSequenceDownloadFrameIDIdx        252
#define MemoryBufferSequenceDownloadFrameCountIdx     253
#define MemoryBufferStatusIdx                         254
#define MemoryBufferLegacyModeIdx                     255
#define DeviceSerialPortFunctionIdx                   256
#define ImageCorrectionFWAcquisitionFrameRateMinIdx   257
#define ImageCorrectionFWAcquisitionFrameRateMaxIdx   258
#define ImageCorrectionBlockSelectorIdx               259
#define ImageCorrectionFWModeIdx                      260
#define ImageCorrectionFWAcquisitionFrameRateIdx      261
#define FOVPositionRawMinIdx                          262
#define FOVPositionRawMaxIdx                          263
#define FocusPositionRawMinIdx                        264
#define FocusPositionRawMaxIdx                        265
#define FOVPositionSetpointIdx                        266
#define FOVPositionIdx                                267
#define FOVPositionNumberIdx                          268
#define ZoomInFastIdx                                 269
#define ZoomInSlowIdx                                 270
#define ZoomOutSlowIdx                                271
#define ZoomOutFastIdx                                272
#define HFOVIdx                                       273
#define VFOVIdx                                       274
#define FOVPositionRawSetpointIdx                     275
#define FOVPositionRawIdx                             276
#define AutofocusModeIdx                              277
#define AutofocusROIIdx                               278
#define AutofocusIdx                                  279
#define FocusNearFastIdx                              280
#define FocusNearSlowIdx                              281
#define FocusFarSlowIdx                               282
#define FocusFarFastIdx                               283
#define FocusPositionRawSetpointIdx                   284
#define FocusPositionRawIdx                           285

// Registers general macros
////////////////////////////////////////////////////////////////////////////////

#define GC_REG_COUNT 286 /**< Number of GenICam registers */
#define GC_REG_MAX_LENGTH 512 /**< GenICam registers maximum length (in bytes) */
#define GC_REG_MAX_READ_LENGTH 512 /**< GenICam readable registers maximum length (in bytes) */
#define GC_REG_MAX_WRITE_LENGTH 4 /**< GenICam writable registers maximum length (in bytes) */
#define GC_REG_MAX_PROC_READ_LENGTH 512 /**< GenICam processing FPGA readable registers maximum length (in bytes) */
#define GC_REG_MAX_PROC_WRITE_LENGTH 4 /**< GenICam processing FPGA writable registers maximum length (in bytes) */
#define GC_REG_MAX_OUT_READ_LENGTH 4 /**< GenICam output FPGA readable registers maximum length (in bytes) */
#define GC_REG_MAX_OUT_WRITE_LENGTH 4 /**< GenICam output FPGA writable registers maximum length (in bytes) */
#define GC_REG_MAX_STORAGE_READ_LENGTH 4 /**< GenICam storage FPGA readable registers maximum length (in bytes) */
#define GC_REG_MAX_STORAGE_WRITE_LENGTH 4 /**< GenICam storage FPGA writable registers maximum length (in bytes) */

// GenICam global variables declaration
////////////////////////////////////////////////////////////////////////////////
extern gcRegister_t gcRegsDef[GC_REG_COUNT];

/* AUTO-CODE END */

#define GC_GEVFIRSTURL              "file:SchemaVersion.1.1@Telops#TSIR_CL@XMLVersion." XSTR(GC_XMLMAJORVERSION) "." XSTR(GC_XMLMINORVERSION) "." XSTR(GC_XMLSUBMINORVERSION) ".xml"
#define GC_GEVFIRSTURL_DATA_LENGTH  sizeof(GC_GEVFIRSTURL)
#define GC_REG_MAX_DATA_LENGTH      GC_GEVFIRSTURL_DATA_LENGTH /**< GenICam registers maximum data length (in bytes) */

uint16_t GetRegDataType(gcRegister_t *p_reg);
uint16_t GetRegAccessMode(gcRegister_t *p_reg);
uint16_t GetRegLocked(gcRegister_t *p_reg);
uint16_t GetRegRange(gcRegister_t *p_reg);
uint16_t GetRegShared(gcRegister_t *p_reg);
uint16_t GetRegEndianness(gcRegister_t *p_reg);

uint16_t RegIsInt(gcRegister_t *p_reg);
uint16_t RegIsFloat(gcRegister_t *p_reg);
uint16_t RegIsMaskedInt(gcRegister_t *p_reg);
uint16_t RegIsString(gcRegister_t *p_reg);
uint16_t RegIsStruct(gcRegister_t *p_reg);

uint16_t RegIsRW(gcRegister_t *p_reg);
uint16_t RegIsRO(gcRegister_t *p_reg);
uint16_t RegIsWO(gcRegister_t *p_reg);

uint16_t RegIsUnlocked(gcRegister_t *p_reg);
uint16_t RegIsLocked(gcRegister_t *p_reg);
void RegUnlock(gcRegister_t *p_reg);
void RegLock(gcRegister_t *p_reg);
void SetRegLocked(gcRegister_t *p_reg, uint8_t isLocked);

uint16_t RegIsProcFPGA(gcRegister_t *p_reg);
uint16_t RegIsOutputFPGA(gcRegister_t *p_reg);

uint16_t RegIsNotShared(gcRegister_t *p_reg);
uint16_t RegIsShared(gcRegister_t *p_reg);

uint16_t RegIsLittleEndian(gcRegister_t *p_reg);
uint16_t RegIsBigEndian(gcRegister_t *p_reg);

gcRegister_t *GC_DecodeAddr(uint32_t addr);

#endif // GENICAM_H
