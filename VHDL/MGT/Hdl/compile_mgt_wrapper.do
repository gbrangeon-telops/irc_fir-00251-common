alib work
SetActiveLib work

setenv MGTIP "D:\Telops\FIR-00251-Common\VHDL\MGT\Hdl"		

#Shared Logic
acom  \
  "$MGTIP\data_mgt_clock_module.vhd" \
  "$MGTIP\data_mgt_gt_common_wrapper.vhd" \
  "$MGTIP\data_mgt_support_reset_logic.vhd" \
  "$MGTIP\exp_mgt_clock_module.vhd" \
  "$MGTIP\exp_mgt_gt_common_wrapper.vhd" \
  "$MGTIP\exp_mgt_support_reset_logic.vhd" \
  "$MGTIP\mgt_init.vhd"

#MGT Controller
acom -relax "$MGTIP\mgt_ctrl.vhd"
