alib work
setactivelib  work

#get root directory relative to this file
set current_file_location_absolute_path [file normalize [file dirname [info script]]]

setenv FIR251COMMON "$current_file_location_absolute_path"

## Package and Defines
acom "$FIR251COMMON/VHDL/tel2000pkg.vhd"
acom "$FIR251COMMON/VHDL/img_header_define.vhd"
acom "$FIR251COMMON/VHDL/Calibration/calib_define.vhd" 
acom "$FIR251COMMON/VHDL/Buffering/BufferingDefine.vhd"
 
## Compile All VHDL Source
#MGT
do "$FIR251COMMON/VHDL/MGT/hdl/compile_mgt_wrapper.do"

# PWM_CTRL
do "$FIR251COMMON/VHDL/PWM_CTRL/hdl/compile_pwm.do"

# Fifo
acom \
 "$FIR251COMMON/VHDL/Fifo/t_axi4_lite32_fifo.vhd" \
 "$FIR251COMMON/VHDL/Fifo/t_axi4_stream8_fifo.vhd" \
 "$FIR251COMMON/VHDL/Fifo/t_axi4_stream16_fifo.vhd" \
 "$FIR251COMMON/VHDL/Fifo/t_axi4_stream32_fifo.vhd" \
 "$FIR251COMMON/VHDL/Fifo/t_axi4_stream64_fifo.vhd" \
 "$FIR251COMMON/VHDL/Fifo/t_axi4_stream128_fifo.vhd" \
 "$FIR251COMMON/VHDL/Fifo/t_axi4_stream_wr16_rd64_fifo.vhd" \
 "$FIR251COMMON/VHDL/Fifo/t_axi4_stream_wr32_rd64_fifo.vhd" \
 "$FIR251COMMON/VHDL/Fifo/t_axi4_stream_wr32_rd16_fifo.vhd" \
 "$FIR251COMMON/VHDL/Fifo/t_axi4_stream_wr64_rd16_fifo.vhd" \
 "$FIR251COMMON/VHDL/Fifo/t_axi4_stream_wr64_rd32_fifo.vhd" \
 "$FIR251COMMON/VHDL/Fifo/t_axi4_stream_wr64_rd64_fifo.vhd" \
 "$FIR251COMMON/VHDL/Fifo/t_axi4_stream_wr64_rd128_fifo.vhd" \
 "$FIR251COMMON/VHDL/Fifo/t_axi4_stream_wr128_rd64_fifo.vhd" \
 "$FIR251COMMON/VHDL/Fifo/t_axi4_stream_wr128_rd128_fifo.vhd" 
 
#hdr extractor
acom -relax \
 "$FIR251COMMON/VHDL/hdr_extractor/axis16_hder_extractor.vhd" \
 "$FIR251COMMON/VHDL/hdr_extractor/axis32_hder_extractor.vhd" \
 "$FIR251COMMON/VHDL/hdr_extractor/axis64_hder_extractor.vhd"	\
 "$FIR251COMMON/VHDL/hdr_extractor/axis128_hder_extractor.vhd"

# Utilities
acom \
 "$FIR251COMMON/VHDL/Utilities/axil32_to_native.vhd" \
 "$FIR251COMMON/VHDL/Utilities/native_to_axil32.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axil32_to_native96.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis_sync_flow.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis8_fanout2.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis32_tdata_extractor.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis32_to_native.vhd" \
 "$FIR251COMMON/VHDL/Utilities/native_to_axis32.vhd"  \
 "$FIR251COMMON/VHDL/Utilities/native_to_axis8.vhd"  \
 "$FIR251COMMON/VHDL/Utilities/axis32_fanout2.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis64_fanout2.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis32_fanout3.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis32_hole.vhd"   \
 "$FIR251COMMON/VHDL/Utilities/axis32_img_boundaries.vhd"   \
 "$FIR251COMMON/VHDL/Utilities/axis64_img_boundaries.vhd"   \
 "$FIR251COMMON/VHDL/Utilities/axis128_img_boundaries.vhd"   \
 "$FIR251COMMON/VHDL/Utilities/axis32_reg.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis64_reg.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis128_reg.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis32_hole_sync.vhd"   \
 "$FIR251COMMON/VHDL/Utilities/axis64_hole_sync.vhd"   \
 "$FIR251COMMON/VHDL/Utilities/axis128_hole_sync.vhd"   \
 "$FIR251COMMON/VHDL/Utilities/axis32_sw_1_2.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis64_sw_1_2.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis32_sw_2_1.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis64_sw_2_1.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis32_tid_gen.vhd"   \
 "$FIR251COMMON/VHDL/Utilities/axis64_tid_gen.vhd"   \
 "$FIR251COMMON/VHDL/Utilities/axis16_to_axis32.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis16_sw_1_2.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis16_auto_sw_1_2.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis32_auto_sw_1_2.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis32_auto_sw_2_1.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis64_auto_sw_2_1.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis64_auto_sw_1_2.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis16_sw_2_1.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis16_sw_3_1.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis16_hole.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axil32_demux3.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axil32_mux2.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axil32_addr_demux4.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axil32_addr_demux.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis32_sw_3_1.vhd" \
 "$FIR251COMMON/VHDL/axis128_pixel_cnt.vhd" \
 "$FIR251COMMON/VHDL/axis64_pixel_cnt.vhd" \
 "$FIR251COMMON/VHDL/axis32_pixel_cnt.vhd" \
 "$FIR251COMMON/VHDL/axis16_pixel_cnt.vhd" \
 "$FIR251COMMON/VHDL/axis64_frame_rate.vhd" \
 "$FIR251COMMON/VHDL/axis32_frame_rate.vhd" \
 "$FIR251COMMON/VHDL/axis16_frame_rate.vhd" \
 "$FIR251COMMON/VHDL/axis16_lite_frame_rate.vhd" \
 "$FIR251COMMON/VHDL/axis64_frame_pix_cnt.vhd" \
 "$FIR251COMMON/VHDL/axis32_frame_pix_cnt.vhd" \
 "$FIR251COMMON/VHDL/axis16_frame_pix_cnt.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis16_merge_axis32.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis16_merge_axis64.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis32_merge_axis64.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis16_combine_axis32.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis16_combine_axis64.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis32_split_axis16.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis128_split_axis64.vhd" \
 "$FIR251COMMON/VHDL/Utilities/badpixel_handler.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis_32_to_16_wrap.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis_64_to_32_wrap.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis_64_to_16_wrap.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis64_throughput_ctrl.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis_128_to_64_wrap.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis32_tuser_merge.vhd" \
 "$FIR251COMMON/VHDL/Utilities/rst_conditioner.vhd"
 
acom -nowarn DAGGEN_0523 \
 "$FIR251COMMON/VHDL/Utilities/axis16_reg.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis16_reg_wrap.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis16_hole_sync.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis16_delay.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis16_img_boundaries.vhd"

# Math
acom \
 "$FIR251COMMON/VHDL/Math/axis_fp32tofi32round.vhd" \
 "$FIR251COMMON/VHDL/Math/fp32_axis_greaterThan.vhd" \
 "$FIR251COMMON/VHDL/Math/axis_fp32tofi32floor.bde" \
 "$FIR251COMMON/VHDL/Math/axis_fi32tofp32.vhd" \
 "$FIR251COMMON/VHDL/Math/axis_fp32tofi32.vhd" \
 "$FIR251COMMON/VHDL/Math/fi32_axis_max.vhd" \
 "$FIR251COMMON/VHDL/Math/fi32_axis_min.vhd" \
 "$FIR251COMMON/VHDL/Math/fp32_axis_add.vhd" \
 "$FIR251COMMON/VHDL/Math/fp32_axis_divide.vhd" \
 "$FIR251COMMON/VHDL/Math/fp32_axis_exp.vhd" \
 "$FIR251COMMON/VHDL/Math/fp32_axis_log.vhd" \
 "$FIR251COMMON/VHDL/Math/fp32_axis_mult.vhd" \
 "$FIR251COMMON/VHDL/Math/fp32_axis_sqroot.vhd" \
 "$FIR251COMMON/VHDL/Math/fp32_axis_subtract.vhd" \
 "$FIR251COMMON/VHDL/Math/axis_fi32tou16.vhd" \
 "$FIR251COMMON/VHDL/Math/axis_fi16tofp32.vhd" \
 "$FIR251COMMON/VHDL/Math/axis_fp32tofi16.vhd" \
 "$FIR251COMMON/VHDL/Math/fi16_axis_min.vhd" \
 "$FIR251COMMON/VHDL/Math/sync_native2axis.vhd" \
 "$FIR251COMMON/VHDL/Math/fp32_axis_power.bde" \
 "$FIR251COMMON/VHDL/Math/fi32_axis_power.bde"

# RAM
acom "$FIR251COMMON/VHDL/Ram/tdp_ram_w32.vhd"

# LUT
acom \
 "$FIR251COMMON/VHDL/Lut/LUT_native_switch.vhd" \
 "$FIR251COMMON/VHDL/Lut/lut_axil_absolute_add.vhd" \
 "$FIR251COMMON/VHDL/Lut/param_lut_fifo.bde" \
 "$FIR251COMMON/VHDL/Lut/axis_lut_X_to_ADD.bde" \
 "$FIR251COMMON/VHDL/Lut/axis_lut_core_a32_d32.bde"  
 
 # Xcropping
acom \
 "$FIR251COMMON/VHDL/Utilities/xcropping_watchdog.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis64_line_pos.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis64_data_sel.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis64_data_pos.vhd" \
 "$FIR251COMMON/VHDL/Utilities/axis64_xcropping.bde"