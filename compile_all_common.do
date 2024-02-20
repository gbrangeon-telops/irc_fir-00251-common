alib work
SetActiveLib work

setenv COMMON "D:\Telops\FIR-00251-Common"

## Package and Defines
acom "$COMMON\VHDL\tel2000pkg.vhd"
acom "$COMMON\VHDL\img_header_define.vhd"
acom "$COMMON\VHDL\Calibration\calib_define.vhd" 
acom "$COMMON\VHDL\Buffering\BufferingDefine.vhd"
 
## Compile All VHDL Source
#MGT
do "$COMMON\VHDL\MGT\hdl\compile_mgt_wrapper.do"

# PWM_CTRL
do "$COMMON\VHDL\PWM_CTRL\hdl\compile_pwm.do"

# Fifo
acom \
 "$COMMON\VHDL\Fifo\t_axi4_lite32_fifo.vhd" \
 "$COMMON\VHDL\Fifo\t_axi4_stream8_fifo.vhd" \
 "$COMMON\VHDL\Fifo\t_axi4_stream16_fifo.vhd" \
 "$COMMON\VHDL\Fifo\t_axi4_stream32_fifo.vhd" \
 "$COMMON\VHDL\Fifo\t_axi4_stream64_fifo.vhd" \
 "$COMMON\VHDL\Fifo\t_axi4_stream128_fifo.vhd" \
 "$COMMON\VHDL\Fifo\t_axi4_stream_wr16_rd64_fifo.vhd" \
 "$COMMON\VHDL\Fifo\t_axi4_stream_wr32_rd64_fifo.vhd" \
 "$COMMON\VHDL\Fifo\t_axi4_stream_wr32_rd16_fifo.vhd" \
 "$COMMON\VHDL\Fifo\t_axi4_stream_wr64_rd16_fifo.vhd" \
 "$COMMON\VHDL\Fifo\t_axi4_stream_wr64_rd32_fifo.vhd" \
 "$COMMON\VHDL\Fifo\t_axi4_stream_wr64_rd64_fifo.vhd" \
 "$COMMON\VHDL\Fifo\t_axi4_stream_wr64_rd128_fifo.vhd" \
 "$COMMON\VHDL\Fifo\t_axi4_stream_wr128_rd64_fifo.vhd" \
 "$COMMON\VHDL\Fifo\t_axi4_stream_wr128_rd128_fifo.vhd" 
 
#hdr extractor
acom -relax \
 "$COMMON\VHDL\hdr_extractor\axis16_hder_extractor.vhd" \
 "$COMMON\VHDL\hdr_extractor\axis32_hder_extractor.vhd" \
 "$COMMON\VHDL\hdr_extractor\axis64_hder_extractor.vhd"	\
 "$COMMON\VHDL\hdr_extractor\axis128_hder_extractor.vhd"

# Utilities
acom \
 "$COMMON\VHDL\Utilities\axil32_to_native.vhd" \
 "$COMMON\VHDL\Utilities\native_to_axil32.vhd" \
 "$COMMON\VHDL\Utilities\axil32_to_native96.vhd" \
 "$COMMON\VHDL\Utilities\axis_sync_flow.vhd" \
 "$COMMON\VHDL\Utilities\axis8_fanout2.vhd" \
 "$COMMON\VHDL\Utilities\axis32_tdata_extractor.vhd" \
 "$COMMON\VHDL\Utilities\axis32_to_native.vhd" \
 "$COMMON\VHDL\Utilities\native_to_axis32.vhd"  \
 "$COMMON\VHDL\Utilities\native_to_axis8.vhd"  \
 "$COMMON\VHDL\Utilities\axis32_fanout2.vhd" \
 "$COMMON\VHDL\Utilities\axis64_fanout2.vhd" \
 "$COMMON\VHDL\Utilities\axis32_fanout3.vhd" \
 "$COMMON\VHDL\Utilities\axis32_hole.vhd"   \
 "$COMMON\VHDL\Utilities\axis32_img_boundaries.vhd"   \
 "$COMMON\VHDL\Utilities\axis64_img_boundaries.vhd"   \
 "$COMMON\VHDL\Utilities\axis128_img_boundaries.vhd"   \
 "$COMMON\VHDL\Utilities\axis32_reg.vhd" \
 "$COMMON\VHDL\Utilities\axis64_reg.vhd" \
 "$COMMON\VHDL\Utilities\axis128_reg.vhd" \
 "$COMMON\VHDL\Utilities\axis32_hole_sync.vhd"   \
 "$COMMON\VHDL\Utilities\axis64_hole_sync.vhd"   \
 "$COMMON\VHDL\Utilities\axis128_hole_sync.vhd"   \
 "$COMMON\VHDL\Utilities\axis32_sw_1_2.vhd" \
 "$COMMON\VHDL\Utilities\axis64_sw_1_2.vhd" \
 "$COMMON\VHDL\Utilities\axis32_sw_2_1.vhd" \
 "$COMMON\VHDL\Utilities\axis64_sw_2_1.vhd" \
 "$COMMON\VHDL\Utilities\axis32_tid_gen.vhd"   \
 "$COMMON\VHDL\Utilities\axis64_tid_gen.vhd"   \
 "$COMMON\VHDL\Utilities\axis16_to_axis32.vhd" \
 "$COMMON\VHDL\Utilities\axis16_sw_1_2.vhd" \
 "$COMMON\VHDL\Utilities\axis16_auto_sw_1_2.vhd" \
 "$COMMON\VHDL\Utilities\axis32_auto_sw_1_2.vhd" \
 "$COMMON\VHDL\Utilities\axis32_auto_sw_2_1.vhd" \
 "$COMMON\VHDL\Utilities\axis64_auto_sw_2_1.vhd" \
 "$COMMON\VHDL\Utilities\axis64_auto_sw_1_2.vhd" \
 "$COMMON\VHDL\Utilities\axis16_sw_2_1.vhd" \
 "$COMMON\VHDL\Utilities\axis16_sw_3_1.vhd" \
 "$COMMON\VHDL\Utilities\axis16_hole.vhd" \
 "$COMMON\VHDL\Utilities\axil32_demux3.vhd" \
 "$COMMON\VHDL\Utilities\axil32_mux2.vhd" \
 "$COMMON\VHDL\Utilities\axil32_addr_demux4.vhd" \
 "$COMMON\VHDL\Utilities\axis32_sw_3_1.vhd" \
 "$COMMON\VHDL\axis128_pixel_cnt.vhd" \
 "$COMMON\VHDL\axis64_pixel_cnt.vhd" \
 "$COMMON\VHDL\axis32_pixel_cnt.vhd" \
 "$COMMON\VHDL\axis16_pixel_cnt.vhd" \
 "$COMMON\VHDL\axis64_frame_rate.vhd" \
 "$COMMON\VHDL\axis32_frame_rate.vhd" \
 "$COMMON\VHDL\axis16_frame_rate.vhd" \
 "$COMMON\VHDL\axis16_lite_frame_rate.vhd" \
 "$COMMON\VHDL\axis64_frame_pix_cnt.vhd" \
 "$COMMON\VHDL\axis32_frame_pix_cnt.vhd" \
 "$COMMON\VHDL\axis16_frame_pix_cnt.vhd" \
 "$COMMON\VHDL\Utilities\axis16_merge_axis32.vhd" \
 "$COMMON\VHDL\Utilities\axis16_merge_axis64.vhd" \
 "$COMMON\VHDL\Utilities\axis32_merge_axis64.vhd" \
 "$COMMON\VHDL\Utilities\axis16_combine_axis32.vhd" \
 "$COMMON\VHDL\Utilities\axis16_combine_axis64.vhd" \
 "$COMMON\VHDL\Utilities\axis32_split_axis16.vhd" \
 "$COMMON\VHDL\Utilities\axis128_split_axis64.vhd" \
 "$COMMON\VHDL\Utilities\badpixel_handler.vhd" \
 "$COMMON\VHDL\Utilities\axis_32_to_16_wrap.vhd" \
 "$COMMON\VHDL\Utilities\axis_64_to_32_wrap.vhd" \
 "$COMMON\VHDL\Utilities\axis_64_to_16_wrap.vhd" \
 "$COMMON\VHDL\Utilities\axis64_throughput_ctrl.vhd" \
 "$COMMON\VHDL\Utilities\axis_128_to_64_wrap.vhd" \
 "$COMMON\VHDL\Utilities\axis32_tuser_merge.vhd" \
 "$COMMON\VHDL\Utilities\rst_conditioner.vhd"
 
acom -nowarn DAGGEN_0523 \
 "$COMMON\VHDL\Utilities\axis16_reg.vhd" \
 "$COMMON\VHDL\Utilities\axis16_reg_wrap.vhd" \
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
 "$COMMON\VHDL\Math\fp32_axis_exp.vhd" \
 "$COMMON\VHDL\Math\fp32_axis_log.vhd" \
 "$COMMON\VHDL\Math\fp32_axis_mult.vhd" \
 "$COMMON\VHDL\Math\fp32_axis_sqroot.vhd" \
 "$COMMON\VHDL\Math\fp32_axis_subtract.vhd" \
 "$COMMON\VHDL\Math\axis_fi32tou16.vhd" \
 "$COMMON\VHDL\Math\axis_fi16tofp32.vhd" \
 "$COMMON\VHDL\Math\axis_fp32tofi16.vhd" \
 "$COMMON\VHDL\Math\fi16_axis_min.vhd" \
 "$COMMON\VHDL\Math\sync_native2axis.vhd" \
 "$COMMON\VHDL\Math\fp32_axis_power.bde" \
 "$COMMON\VHDL\Math\fi32_axis_power.bde"

# RAM
acom "$COMMON\VHDL\Ram\tdp_ram_w32.vhd"

# LUT
acom \
 "$COMMON\VHDL\Lut\LUT_native_switch.vhd" \
 "$COMMON\VHDL\Lut\lut_axil_absolute_add.vhd" \
 "$COMMON\VHDL\Lut\param_lut_fifo.bde" \
 "$COMMON\VHDL\Lut\axis_lut_X_to_ADD.bde" \
 "$COMMON\VHDL\Lut\axis_lut_core_a32_d32.bde"  
 
 # Xcropping
acom \
 "$COMMON\VHDL\Utilities\xcropping_watchdog.vhd" \
 "$COMMON\VHDL\Utilities\axis64_line_pos.vhd" \
 "$COMMON\VHDL\Utilities\axis64_data_sel.vhd" \
 "$COMMON\VHDL\Utilities\axis64_data_pos.vhd" \
 "$COMMON\VHDL\Utilities\axis64_xcropping.bde"