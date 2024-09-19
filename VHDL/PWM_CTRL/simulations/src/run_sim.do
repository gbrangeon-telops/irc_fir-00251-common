#Simulation file

asim -ses +access +r fan_tb
#transcript off
do "$FIR251COMMON/VHDL/FAN_CTRL/simulations/src/waveform.do"
#transcript on
run 10 ms
						