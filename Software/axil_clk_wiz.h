#ifndef AXIL_CLK_WIZ
#define AXIL_CLK_WIZ

int axil_clk_wiz_setFreq(void *baseAddress, float inputActualFreqMHz, const float outputDesiredFreqMHz[7], float outputActualFreqMHz[7]);

#endif