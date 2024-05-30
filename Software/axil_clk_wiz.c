#include <stdint.h>
#include <math.h>
#include "axil_clk_wiz.h"

typedef enum {RESET = 0xA} soft_reset_reg_t;

typedef struct {
    uint32_t locked : 1;
} status_reg_t;

typedef union {
    struct {
        uint32_t clkusr0_overrun  : 1;
        uint32_t clkusr1_overrun  : 1;
        uint32_t clkusr2_overrun  : 1;
        uint32_t clkusr3_overrun  : 1;
        uint32_t clkusr0_underrun : 1;
        uint32_t clkusr1_underrun : 1;
        uint32_t clkusr2_underrun : 1;
        uint32_t clkusr3_underrun : 1;
        uint32_t clkusr0_glitch   : 1;
        uint32_t clkusr1_glitch   : 1;
        uint32_t clkusr2_glitch   : 1;
        uint32_t clkusr3_glitch   : 1;
        uint32_t clkusr0_stop     : 1;
        uint32_t clkusr1_stop     : 1;
        uint32_t clkusr2_stop     : 1;
        uint32_t clkusr3_stop     : 1;
    };
    struct {
        uint32_t clkusr_overrun  : 4;
        uint32_t clkusr_underrun : 4;
        uint32_t clkusr_glitch   : 4;
        uint32_t clkusr_stop     : 4;
    };
} cmon_error_status_reg_t;

typedef cmon_error_status_reg_t intr_status_reg_t;

typedef cmon_error_status_reg_t intr_enable_reg_t;

typedef union {
    uint32_t divclk_divide : 8;
    struct {
        uint32_t      : 8;
        uint32_t mult : 8;
        uint32_t frac : 10;
    } clkfbout_multiply;
} clock_config_reg0_t;

typedef struct {
    int32_t clkfbout_phase;
} clock_config_reg1_t;

typedef struct {
    uint32_t div  : 8;
    uint32_t frac : 10; // Only valid for clkout0
} clock_config_reg2_t;

typedef int32_t clock_config_reg3_t;

typedef uint32_t clock_config_reg4_t;

typedef struct {
    clock_config_reg2_t clkout_divide;
    clock_config_reg3_t clkout_phase;
    clock_config_reg4_t clkout_duty;
} clock_config_reg2to4_t;

typedef struct {
    uint32_t load_sen : 1;
    uint32_t saddr    : 1;
} clock_config_reg23_t;

typedef struct {
    soft_reset_reg_t        soft_reset_reg;
    status_reg_t            status_reg;
    cmon_error_status_reg_t cmon_error_status_reg;
    intr_status_reg_t       intr_status_reg;
    intr_enable_reg_t       intr_enable_reg;
    uint32_t                reserved[123];
    clock_config_reg0_t     clock_config_reg0;
    clock_config_reg1_t     clock_config_reg1;
    clock_config_reg2to4_t  clock_config_reg2to22[7];
    clock_config_reg23_t    clock_config_reg23;
} axil_clk_wiz_reg_t;

#define MMCM_FINMAX   800.00f
#define MMCM_FINMIN    10.00f
#define MMCM_FOUTMAX  800.00f
#define MMCM_FOUTMIN    4.69f
#define MMCM_FPFDMAX  450.00f
#define MMCM_FPFDMIN   10.00f
#define MMCM_FVCOMAX 1200.00f
#define MMCM_FVCOMIN  600.00f

int axil_clk_wiz_setFreq(void *baseAddress, float inputActualFreqMHz, const float outputDesiredFreqMHz[7], float outputActualFreqMHz[7]) {
    if(baseAddress == NULL || inputActualFreqMHz > MMCM_FINMAX || inputActualFreqMHz < MMCM_FINMIN || outputDesiredFreqMHz == NULL) return -1;
    for(uint8_t i = 0; i < 7; i += 1) {
        if(outputDesiredFreqMHz[i] != 0.0f && (outputDesiredFreqMHz[i] > MMCM_FOUTMAX || outputDesiredFreqMHz[i] < MMCM_FOUTMIN)) return -1;
    }

    float relativeErrorMin = INFINITY;

    for(uint8_t divclk_divide = 1; divclk_divide <= 106; divclk_divide += 1) {
        float freqPFD = inputActualFreqMHz / divclk_divide;
        if(freqPFD > MMCM_FPFDMAX || freqPFD < MMCM_FPFDMIN) continue;
        for(uint16_t clkfbout_mult = 64000; clkfbout_mult >= 2000; clkfbout_mult -= 125) {
            float freqVCO = freqPFD * (clkfbout_mult / 1000.0f);
            if(freqVCO > MMCM_FVCOMAX || freqVCO < MMCM_FVCOMIN) continue;

            uint8_t clkout_divide[7] = {0};
            float relativeError = 0.0f;
            for(uint8_t i = 0; i < 7; i += 1) {
                if(outputDesiredFreqMHz[i] == 0.0f) continue;

                clkout_divide[i] = roundf(freqVCO / outputDesiredFreqMHz[i]);
                if(clkout_divide[i] > 128 || clkout_divide[i] < 1) relativeError = INFINITY;

                float freqOUT = freqVCO / clkout_divide[i];
                if(freqOUT > MMCM_FOUTMAX || freqOUT < MMCM_FOUTMIN) relativeError = INFINITY;

                relativeError += fabsf((freqOUT - outputDesiredFreqMHz[i]) / outputDesiredFreqMHz[i]);
            }
            if(relativeError < relativeErrorMin) {
                relativeErrorMin = relativeError;

                {
                    clock_config_reg0_t regValue = {.divclk_divide = divclk_divide, .clkfbout_multiply = {.mult = clkfbout_mult / 1000, .frac = clkfbout_mult % 1000}};
                    ((axil_clk_wiz_reg_t *)baseAddress)->clock_config_reg0 = regValue;
                }

                for(uint8_t i = 0; i < 7; i += 1) {
                    float freqOUT = 0.0f;

                    if(outputDesiredFreqMHz[i] != 0.0f) {
                        freqOUT = freqVCO / clkout_divide[i];

                        {
                            clock_config_reg2_t regValue = {.div = clkout_divide[i]};
                            ((axil_clk_wiz_reg_t *)baseAddress)->clock_config_reg2to22[i].clkout_divide = regValue;
                        }
                    }

                    if(outputActualFreqMHz != NULL) outputActualFreqMHz[i] = freqOUT;
                }
            }
        }
    }

    return (relativeErrorMin == INFINITY) ? -1 : 0;
}

int axil_clk_wiz_doReset(void *baseAddress) {
    if(baseAddress == NULL) return -1;

    ((axil_clk_wiz_reg_t *)baseAddress)->soft_reset_reg = RESET;

    return 0;
}

int axil_clk_wiz_isLocked(const void *baseAddress) {
    if(baseAddress == NULL) return -1;

    status_reg_t regValue = ((const axil_clk_wiz_reg_t *)baseAddress)->status_reg;

    return regValue.locked;
}

int axil_clk_wiz_doReconfig(void *baseAddress, bool defaultConfig) {
    if(baseAddress == NULL) return -1;

    clock_config_reg23_t regValue = {.load_sen = 1, .saddr = !defaultConfig};

    ((axil_clk_wiz_reg_t *)baseAddress)->clock_config_reg23 = regValue;

    return 0;
}