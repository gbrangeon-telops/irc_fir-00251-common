alib work
setActivelib work

setenv USART "D:\Telops\FIR-00251-Common\VHDL\USART"
setenv COMMON "D:\Telops\FIR-00251-Common\VHDL"
setenv COMMON_HDL "D:\Telops\Common_HDL"

# Package
acom -nowarn DAGGEN_0523 "D:\Telops\FIR-00251-Common\VHDL\tel2000pkg.vhd"

#common_hdl
acom -incr -nowarn DAGGEN_0523 \
 "$COMMON_HDL\Utilities\SYNC_RESET.vhd" \
 "$COMMON_HDL\Utilities\double_sync.vhd" \
 "$COMMON_HDL\Utilities\double_sync_vector.vhd" \
 "$COMMON_HDL\Utilities\sync_resetn.vhd" \
 "$COMMON_HDL\Utilities\dcm_reset.vhd" \
  "$COMMON_HDL\gh_vhdl_lib\custom_MSI\gh_stretch.vhd"

#common

acom -incr -nowarn DAGGEN_0523 \
	"$COMMON\Fifo\t_axi4_stream32_fifo.vhd"

#source USART
acom  -incr 	"$USART\usart_rx.vhd" \
		-relax "$USART\Usart_Ctrl.vhd" \
		"$USART\usart_tx.vhd" \
	"$USART\USART_TO_AXIS.vhd" \
	"$USART\AXIS_TO_USART.vhd" \
	"$USART\rx_counter.vhd" \
	"$USART\usart_mmcm_rst.vhd" \
	"$USART\USART.bde"

