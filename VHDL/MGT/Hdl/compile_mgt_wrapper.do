alib work
setactivelib work

#get root directory relative to this file
set current_file_location_absolute_path [file normalize [file dirname [info script]]]

setenv MGTIP "$current_file_location_absolute_path"		

#Shared Logic
acom  \
  "$MGTIP/data_mgt_clock_module.vhd" \
  "$MGTIP/data_mgt_gt_common_wrapper.vhd" \
  "$MGTIP/data_mgt_support_reset_logic.vhd" \
  "$MGTIP/exp_mgt_clock_module.vhd" \
  "$MGTIP/exp_mgt_gt_common_wrapper.vhd" \
  "$MGTIP/exp_mgt_support_reset_logic.vhd" \
  "$MGTIP/mgt_init.vhd"

#MGT Controller
acom -relax "$MGTIP/mgt_ctrl.vhd"
