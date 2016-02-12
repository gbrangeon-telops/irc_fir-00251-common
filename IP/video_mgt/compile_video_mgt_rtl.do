alib work
SetActiveLib -work

#setenv FIR251PROC "$dsn"
setenv VIDEOMGTIP "D:\Telops\FIR-00251-Common\IP\video_mgt"
#clearlibrary FIR_00180_IRC


acom -nowarn DAGGEN_0523 "$VIDEOMGTIP\video_mgt\src\video_mgt_aurora_pkg.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_cdc_sync.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_reset_logic.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_hotplug.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_err_detect_4byte.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_sym_dec_4byte.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_sym_gen_4byte.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_chbond_count_dec_4byte.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_lane_init_sm_4byte.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_aurora_lane_4byte.vhd" \
  "$VIDEOMGTIP\video_mgt\gt\video_mgt_tx_startup_fsm.vhd" \
  "$VIDEOMGTIP\video_mgt\gt\video_mgt_rx_startup_fsm.vhd" \
  "$VIDEOMGTIP\video_mgt\gt\video_mgt_gt.vhd" \
  "$VIDEOMGTIP\video_mgt\gt\video_mgt_multi_gt.vhd" \
  "$VIDEOMGTIP\video_mgt\gt\video_mgt_transceiver_wrapper.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_channel_init_sm.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_idle_and_ver_gen.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_channel_err_detect.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_global_logic.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_axi_to_ll.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_tx_ll_datapath.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_tx_ll_control.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_tx_ll.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_ll_to_axi.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_rx_ll_deframer.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_left_align_control.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_valid_data_counter.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_left_align_mux.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_storage_count_control.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_storage_ce_control.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_storage_switch_control.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_output_switch_control.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_sideband_output.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_storage_mux.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_output_mux.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_rx_ll_pdu_datapath.vhd" \
  "$VIDEOMGTIP\video_mgt\src\video_mgt_rx_ll.vhd" \
  "$VIDEOMGTIP\video_mgt_core.vhd" \
  "$VIDEOMGTIP\video_mgt.vhd"
                          
