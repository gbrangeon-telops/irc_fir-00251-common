#Simulation file
setenv USART_SIM "D:\Telops\FIR-00251-Common-usart\VHDL\USART_B\sims\src"

asim -ses +access +r USART_B_TB
#transcript off
do "$USART_SIM\waveform.do"
#transcript on
run 20 ms
