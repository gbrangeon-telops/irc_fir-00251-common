setactivelib work

#get root directory relative to this file
set current_file_location_absolute_path [file normalize [file dirname [info script]]]

#FAN CTRL
acom -relax "$current_file_location_absolute_path/pwm_ctrl.vhd"
acom "$COMMON_HDL/gh_vhdl_lib/custom_MSI/gh_PWM.vhd"
acom "$current_file_location_absolute_path/PWM_GEN1.vhd"
acom "$current_file_location_absolute_path/PWM_GEN3.vhd"
acom "$current_file_location_absolute_path/PWM_GEN4.vhd"
