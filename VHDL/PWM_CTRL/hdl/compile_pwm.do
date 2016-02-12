SetActiveLib -work

#FAN CTRL
acom -relax "D:\Telops\FIR-00251-Common\VHDL\PWM_CTRL\hdl\pwm_ctrl.vhd"
acom "D:\Telops\Common_HDL\gh_vhdl_lib\custom_MSI\gh_PWM.vhd"
acom "D:\Telops\FIR-00251-Common\VHDL\PWM_CTRL\hdl\PWM_GEN1.vhd"
acom "D:\Telops\FIR-00251-Common\VHDL\PWM_CTRL\hdl\PWM_GEN3.vhd"
acom "D:\Telops\FIR-00251-Common\VHDL\PWM_CTRL\hdl\PWM_GEN4.vhd"
