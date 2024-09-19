#Simulation file

asim -ses +access +r Top
#transcript off	  
do "$FIR251COMMON/VHDL/decimator/Sims/src/waveform.do"
#transcript on

run 0.1 ms
