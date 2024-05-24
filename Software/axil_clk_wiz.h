#ifndef AXIL_CLK_WIZ
#define AXIL_CLK_WIZ

#include <stdbool.h>

int axil_clk_wiz_setFreq(void *baseAddress, float inputActualFreqMHz, const float outputDesiredFreqMHz[7], float outputActualFreqMHz[7]);

int axil_clk_wiz_doReset(void *baseAddress);

int axil_clk_wiz_isLocked(const void *baseAddress);

int axil_clk_wiz_doReconfig(void *baseAddress, bool defaultConfig);

#endif