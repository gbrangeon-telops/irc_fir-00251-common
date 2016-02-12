alib work
SetActiveLib work

setenv DATAMGTIP "D:\Telops\FIR-00251-Common\IP\data_mgt"
#clearlibrary FIR_00180_IRC

acom -nowarn DAGGEN_0523 "$DATAMGTIP\data_mgt\src\data_mgt_aurora_pkg.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_cdc_sync.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_reset_logic.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_hotplug.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_err_detect_4byte.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_sym_dec_4byte.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_sym_gen_4byte.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_chbond_count_dec_4byte.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_lane_init_sm_4byte.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_aurora_lane_4byte.vhd" \
 "$DATAMGTIP\data_mgt\gt\data_mgt_tx_startup_fsm.vhd" \
 "$DATAMGTIP\data_mgt\gt\data_mgt_rx_startup_fsm.vhd" \
 "$DATAMGTIP\data_mgt\gt\data_mgt_gt.vhd" \
 "$DATAMGTIP\data_mgt\gt\data_mgt_multi_gt.vhd" \
 "$DATAMGTIP\data_mgt\gt\data_mgt_transceiver_wrapper.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_channel_init_sm.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_idle_and_ver_gen.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_channel_err_detect.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_global_logic.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_axi_to_ll.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_tx_ll_datapath.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_tx_ll_control.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_tx_ll.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_ll_to_axi.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_rx_ll_deframer.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_left_align_control.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_valid_data_counter.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_left_align_mux.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_storage_count_control.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_storage_ce_control.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_storage_switch_control.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_output_switch_control.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_sideband_output.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_storage_mux.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_output_mux.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_rx_ll_pdu_datapath.vhd" \
 "$DATAMGTIP\data_mgt\src\data_mgt_rx_ll.vhd" \
 "$DATAMGTIP\data_mgt_core.vhd" \
 "$DATAMGTIP\data_mgt.vhd"