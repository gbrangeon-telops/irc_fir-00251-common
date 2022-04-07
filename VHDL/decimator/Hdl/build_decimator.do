alib work
setActivelib work

setenv COMMON "D:\Telops\FIR-00251-Common"
setenv UTILITIES "D:\Telops\Common_HDL\Utilities"

# Package
acom "$COMMON\VHDL\tel2000pkg.vhd"	 
acom "$COMMON\VHDL\decimator\Hdl\decimator_define.vhd"

#common_hdl
do "D:\Telops\FIR-00251-Proc\src\compil_utilities.do"

#source 
acom "D:\Telops\FIR-00251-Common\VHDL\Fifo\t_axi4_stream_wr32_rd64_fifo.vhd"
acom "$COMMON\VHDL\decimator\Hdl\column_decimator.vhd"	
acom "$COMMON\VHDL\decimator\Hdl\row_decimator.vhd"

#Top
acom "$COMMON\VHDL\decimator\Hdl\decimator.bde"
											  
