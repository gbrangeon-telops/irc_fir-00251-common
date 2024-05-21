#include <stdint.h>

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