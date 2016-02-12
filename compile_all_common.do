alib work
SetActiveLib work

setenv COMMON "D:\Telops\FIR-00251-Common"

## Package and Defines
acom "$COMMON\VHDL\tel2000pkg.vhd"
acom "$COMMON\VHDL\img_header_define.vhd"

## Compile All IP
do "$COMMON\IP\data_mgt\compile_data_mgt_rtl.do"
do "$COMMON\IP\exp_mgt\compile_exp_mgt_rtl.do"
do "$COMMON\IP\video_mgt\compile_video_mgt_rtl.do"
#do "$COMMON\IP\AXI4_Stream32_to_64\compile_AXI4_Stream32_to_64_rtl.do"
#do "$COMMON\IP\AXI4_Stream64_to_32\compile_AXI4_Stream64_to_32_rtl.do"
acom "$COMMON\IP\axis_conv_linebuffer_64w_1024d\axis_conv_linebuffer_64w_1024d_funcsim.vhdl"
acom "$COMMON\IP\axis_data_fifo_32w_1024d_aclk\axis_data_fifo_32w_1024d_aclk_funcsim.vhdl"

acom  "$COMMON\VHDL\Utilities\AXI4_Stream32_to_64_wrapper.vhd"
acom  "$COMMON\VHDL\Utilities\AXI4_Stream64_to_32_wrapper.vhd" 
 
## Compile All VHDL Source
#MGT
do "$COMMON\VHDL\MGT\hdl\compile_mgt_wrapper.do"

# PWM_CTRL
do "$COMMON\VHDL\PWM_CTRL\hdl\compile_pwm.do"

# Fifo
acom \
 "$COMMON\VHDL\Fifo\t_axi4_lite32_fifo.vhd" \
 "$COMMON\VHDL\Fifo\t_axi4_stream32_fifo.vhd" \
 "$COMMON\VHDL\Fifo\t_axi4_stream8_fifo.vhd"

#hdr extractor
acom -relax "$COMMON\VHDL\hdr_extractor\hder_extractor.vhd"

# Utilities
acom \
 "$COMMON\VHDL\Utilities\axil32_to_native.vhd" \
 "$COMMON\VHDL\Utilities\axis_sync_flow.vhd" \
 "$COMMON\VHDL\Utilities\axis8_fanout2.vhd" \
 "$COMMON\VHDL\Utilities\axis32_tdata_extractor.vhd" \
 "$COMMON\VHDL\Utilities\axis32_to_native.vhd" \
 "$COMMON\VHDL\Utilities\native_to_axis32.vhd"  \
 "$COMMON\VHDL\Utilities\native_to_axis8.vhd"  \
 "$COMMON\VHDL\Utilities\axis32_fanout2.vhd" \
 "$COMMON\VHDL\Utilities\axis32_fanout3.vhd" \
 "$COMMON\VHDL\Utilities\axis32_hole.vhd"   \
 "$COMMON\VHDL\Utilities\axis32_hole_sync.vhd"   \
 "$COMMON\VHDL\Utilities\axis32_img_boundaries.vhd"   \
 "$COMMON\VHDL\Utilities\axis32_tid_gen.vhd"   \
 "$COMMON\VHDL\Utilities\axis16_to_axis32.vhd" \
 "$COMMON\VHDL\Utilities\axis16_sw_1_2.vhd" \
 "$COMMON\VHDL\Utilities\axis16_auto_sw_1_2.vhd" \
 "$COMMON\VHDL\Utilities\axis16_sw_2_1.vhd" \
 "$COMMON\VHDL\Utilities\axis16_sw_3_1.vhd" \
 "$COMMON\VHDL\Utilities\axis16_hole.vhd" \
 "$COMMON\VHDL\Utilities\axil32_demux3.vhd" \
 "$COMMON\VHDL\Utilities\axil32_mux2.vhd" \
 "$COMMON\VHDL\Utilities\axil32_addr_demux4.vhd" \
 "$COMMON\VHDL\Utilities\axis32_sw_3_1.vhd" \
 "$COMMON\VHDL\axis64_pixel_cnt.vhd" \
 "$COMMON\VHDL\axis32_pixel_cnt.vhd" \
 "$COMMON\VHDL\axis16_pixel_cnt.vhd" \
 "$COMMON\VHDL\Utilities\axis16_merge_axis32.vhd" \
 "$COMMON\VHDL\Utilities\badpixel_handler.vhd" \
 "$COMMON\IP\axis_32_to_16\axis_32_to_16_funcsim.vhdl" \
 "$COMMON\VHDL\Utilities\axis_32_to_16_wrap.vhd"

acom -nowarn DAGGEN_0523 \
 "$COMMON\VHDL\Utilities\axis16_reg.vhd" \
 "$COMMON\VHDL\Utilities\axis16_hole_sync.vhd" \
 "$COMMON\VHDL\Utilities\axis16_delay.vhd" \
 "$COMMON\VHDL\Utilities\axis16_img_boundaries.vhd"

# Math
acom \
 "$COMMON\VHDL\Math\axis_fp32tofi32round.vhd" \
 "$COMMON\VHDL\Math\fp32_axis_greaterThan.vhd" \
 "$COMMON\VHDL\Math\axis_fp32tofi32floor.bde" \
 "$COMMON\VHDL\Math\axis_fi32tofp32.vhd" \
 "$COMMON\VHDL\Math\axis_fp32tofi32.vhd" \
 "$COMMON\VHDL\Math\fi32_axis_max.vhd" \
 "$COMMON\VHDL\Math\fi32_axis_min.vhd" \
 "$COMMON\VHDL\Math\fp32_axis_add.vhd" \
 "$COMMON\VHDL\Math\fp32_axis_divide.vhd" \
 "$COMMON\VHDL\Math\fp32_axis_mult.vhd" \
 "$COMMON\VHDL\Math\fp32_axis_sqroot.vhd" \
 "$COMMON\VHDL\Math\fp32_axis_subtract.vhd" \
 "$COMMON\VHDL\Math\axis_fi32tou16.vhd" \
 "$COMMON\VHDL\Math\axis_fi16tofp32.vhd" \
 "$COMMON\VHDL\Math\axis_fp32tofi16.vhd" \
 "$COMMON\VHDL\Math\fi16_axis_min.vhd"

# RAM
acom "$COMMON\VHDL\Ram\tdp_ram_w32.vhd"

# LUT
acom \
 "$COMMON\VHDL\Lut\axis_lut_X_to_ADD.bde" \
 "$COMMON\VHDL\Lut\axis_lut_core_a32_d32.bde" \
 "$COMMON\VHDL\Lut\axis_lut_a32_d32.bde"