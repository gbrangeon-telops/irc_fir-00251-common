
adel -all

acom $COMMON_HDL/Utilities/sync_resetn.vhd

acom $FIR251COMMON/VHDL/signal_stat/axi_monitor_define.vhd
acom $FIR251COMMON/VHDL/signal_stat/axi_monitor.vhd


acom $FIR251COMMON/VHDL/signal_stat/Sim/src/axi_monitor_testbench.vhd


asim -ses axi_monitor_testbench 

wave UUT/*

run 5 us
