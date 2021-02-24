
adel -all

acom D:\Telops\Common_HDL\Utilities\sync_resetn.vhd

acom D:\Telops\FIR-00251-Common\VHDL\signal_stat\axi_monitor_define.vhd
acom D:\Telops\FIR-00251-Common\VHDL\signal_stat\axi_monitor.vhd


acom D:\Telops\FIR-00251-Common\VHDL\signal_stat\Sim\src\axi_monitor_testbench.vhd


asim -ses axi_monitor_testbench 

wave UUT/*

run 5 us
