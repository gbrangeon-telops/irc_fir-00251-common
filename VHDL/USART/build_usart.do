alib work
setactivelib work

#get root directory relative to this file
set current_file_location_absolute_path [file normalize [file dirname [info script]]]
set parts [file split $current_file_location_absolute_path]
setenv root_location_absolute_path [file join {*}[lrange $parts 0 end-3]]
				 

setenv FIR251OUT "$root_location_absolute_path/irc_fir-00251-output/"
setenv FIR251PROC "$root_location_absolute_path/irc_fir-00251-proc/"
setenv FIR251COMMON "$root_location_absolute_path/irc_fir-00251-common/"
setenv COMMON_HDL "$root_location_absolute_path/irc_common_hdl/"
setenv USART "$FIR251COMMON/VHDL/USART"


# Package
acom -nowarn DAGGEN_0523 "$FIR251COMMON/VHDL/tel2000pkg.vhd"

#common_hdl
acom -incr -nowarn DAGGEN_0523 \
 "$COMMON_HDL/Utilities/SYNC_RESET.vhd" \
 "$COMMON_HDL/Utilities/double_sync.vhd" \
 "$COMMON_HDL/Utilities/double_sync_vector.vhd" \
 "$COMMON_HDL/Utilities/sync_resetn.vhd" \
 "$COMMON_HDL/Utilities/dcm_reset.vhd" \
  "$COMMON_HDL/gh_vhdl_lib/custom_MSI/gh_stretch.vhd"

#common

acom -incr -nowarn DAGGEN_0523 \
	"$FIR251COMMON/VHDL/Fifo/t_axi4_stream32_fifo.vhd"

#source USART
acom  -incr 	"$USART/usart_rx.vhd" \
		-relax "$USART/Usart_Ctrl.vhd" \
		"$USART/usart_tx.vhd" \
	"$USART/USART_TO_AXIS.vhd" \
	"$USART/AXIS_TO_USART.vhd" \
	"$USART/rx_counter.vhd" \
	"$USART/usart_mmcm_rst.vhd" \
	"$USART/USART.bde"

