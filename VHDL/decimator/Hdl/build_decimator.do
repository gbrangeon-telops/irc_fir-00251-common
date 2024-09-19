alib work
setactivelib work

setenv UTILITIES "$COMMON_HDL/Utilities"

# Package
acom "$FIR251COMMON/VHDL/tel2000pkg.vhd"	 
acom "$FIR251COMMON/VHDL/decimator/Hdl/decimator_define.vhd"

#common_hdl
#do "$FIR251PROC/src/compil_utilities.do"

#source 
acom "$FIR251COMMON/VHDL/Fifo/t_axi4_stream_wr32_rd64_fifo.vhd"
acom "$FIR251COMMON/VHDL/decimator/Hdl/column_decimator.vhd"	
acom "$FIR251COMMON/VHDL/decimator/Hdl/row_decimator.vhd"

#Top
acom "$FIR251COMMON/VHDL/decimator/Hdl/decimator.bde"
											  
