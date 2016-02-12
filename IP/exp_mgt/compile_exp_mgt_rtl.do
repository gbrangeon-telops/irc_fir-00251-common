alib work
SetActiveLib -work

#setenv FIR251PROC "$dsn"
setenv EXPMGTIP "D:\Telops\FIR-00251-Common\IP\exp_mgt"
#clearlibrary FIR_00180_IRC

acom -nowarn DAGGEN_0523 "$EXPMGTIP\exp_mgt\src\exp_mgt_aurora_pkg.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_cdc_sync.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_reset_logic.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_hotplug.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_err_detect_4byte.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_sym_dec_4byte.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_sym_gen_4byte.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_chbond_count_dec_4byte.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_lane_init_sm_4byte.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_aurora_lane_4byte.vhd" \
 "$EXPMGTIP\exp_mgt\gt\exp_mgt_tx_startup_fsm.vhd" \
 "$EXPMGTIP\exp_mgt\gt\exp_mgt_rx_startup_fsm.vhd" \
 "$EXPMGTIP\exp_mgt\gt\exp_mgt_gt.vhd" \
 "$EXPMGTIP\exp_mgt\gt\exp_mgt_multi_gt.vhd" \
 "$EXPMGTIP\exp_mgt\gt\exp_mgt_transceiver_wrapper.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_channel_init_sm.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_idle_and_ver_gen.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_channel_err_detect.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_global_logic.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_axi_to_ll.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_tx_ll_datapath.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_tx_ll_control.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_tx_ll.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_ll_to_axi.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_rx_ll_deframer.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_left_align_control.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_valid_data_counter.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_left_align_mux.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_storage_count_control.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_storage_ce_control.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_storage_switch_control.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_output_switch_control.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_sideband_output.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_storage_mux.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_output_mux.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_rx_ll_pdu_datapath.vhd" \
 "$EXPMGTIP\exp_mgt\src\exp_mgt_rx_ll.vhd" \
 "$EXPMGTIP\exp_mgt_core.vhd" \
 "$EXPMGTIP\exp_mgt.vhd"