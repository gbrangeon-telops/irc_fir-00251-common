onerror { resume }
transcript off
add wave -named_row "USART_SERIAL_TB"
add wave -noreg -logic {/USART_B_TB/U2/TX_Serial}
add wave -noreg -logic {/USART_B_TB/U2/RX_SERIAL}
add wave -noreg -logic {/USART_B_TB/U2/CLK_USART}
add wave -noreg -logic {/USART_B_TB/U2/clk16_o}
add wave -noreg -logic {/USART_B_TB/U2/r_RX_SERIAL}
add wave -noreg -logic {/USART_B_TB/U2/w_TX_SERIAL}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U2/w_RX_BYTE}
add wave -noreg -logic {/USART_B_TB/U2/w_RX_DV}
add wave -noreg -logic {/USART_B_TB/U2/r_RX_SERIAL}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U2/tx_value}
add wave -noreg -decimal -literal -signed2 {/USART_B_TB/U2/rx_packet_id}
add wave -noreg -decimal -literal -signed2 {/USART_B_TB/U2/rx_bytes_cnt}
add wave -noreg -decimal -literal -signed2 {/USART_B_TB/U2/rx_timeout_cnt}
add wave -named_row "USART"
add wave -named_row "USART_RX"
add wave -noreg -logic {/USART_B_TB/U1/U8/RX_SERIAL}
add wave -noreg -logic {/USART_B_TB/U1/U8/RX_DV}
add wave -noreg -hexadecimal -literal -signed2 {/USART_B_TB/U1/U8/RX_BYTE}
add wave -noreg -logic {/USART_B_TB/U1/U8/STOP_BIT_ERROR}
add wave -noreg -logic {/USART_B_TB/U1/U8/ARESETN}
add wave -noreg -literal {/USART_B_TB/U1/U8/r_SM_Main}
add wave -noreg -logic {/USART_B_TB/U1/U8/stop_bit_error_o}
add wave -named_row "USART_TO_AXIS"
add wave -noreg -logic {/USART_B_TB/U1/U3/RX_CLK}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U3/AXIS_MOSI}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U3/AXIS_MISO}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U3/TIMEOUT_COUNT}
add wave -noreg -logic {/USART_B_TB/U1/U3/RX_VALID}
add wave -noreg -hexadecimal -literal -signed2 {/USART_B_TB/U1/U3/RX_BYTES}
add wave -noreg -logic {/USART_B_TB/U1/U3/RX_FULL}
add wave -noreg -logic {/USART_B_TB/U1/U3/TIMEOUT}
add wave -noreg -logic {/USART_B_TB/U1/U3/CLEAR_RX_FULL}
add wave -noreg -logic {/USART_B_TB/U1/U3/CLEAR_TIMEOUT}
add wave -noreg -literal {/USART_B_TB/U1/U3/rs_state}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U3/tdata}
add wave -noreg -logic {/USART_B_TB/U1/U3/timeout_o}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U3/time_delay_s}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U3/timeout_delay}
add wave -named_row "RX_FIFO"
add wave -noreg -logic {/USART_B_TB/U1/U4/RX_CLK}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U4/RX_MOSI}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U4/RX_MISO}
add wave -noreg -logic {/USART_B_TB/U1/U4/TX_CLK}
add wave -noreg -hexadecimal -literal -signed2 {/USART_B_TB/U1/U4/TX_MOSI}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U4/TX_MISO}
add wave -noreg -logic {/USART_B_TB/U1/U4/OVFL}
add wave -noreg -logic {/USART_B_TB/U1/U4/rx_tvalid}
add wave -noreg -logic {/USART_B_TB/U1/U4/rx_tready}
add wave -named_row "RX_COUNTER"
add wave -noreg -logic {/USART_B_TB/U1/U10/MB_CLK}
add wave -noreg -logic {/USART_B_TB/U1/U10/ARESETN}
add wave -noreg -logic {/USART_B_TB/U1/U10/reset}
add wave -noreg -logic {/USART_B_TB/U1/U10/RX_VALID}
add wave -noreg -logic {/USART_B_TB/U1/U10/MB_READ_VALID}
add wave -noreg -logic {/USART_B_TB/U1/U10/MB_READ_READY}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U10/RX_COUNT}
add wave -noreg -logic {/USART_B_TB/U1/U10/CLEAR}
add wave -noreg -logic {/USART_B_TB/U1/U10/rx_valid_d1}
add wave -noreg -logic {/USART_B_TB/U1/U10/rx_valid_d2}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U10/rx_fifo_bytes_count}
add wave -named_row "TX_FIFO"
add wave -noreg -logic {/USART_B_TB/U1/U7/RX_CLK}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U7/RX_MOSI}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U7/RX_MISO}
add wave -noreg -logic {/USART_B_TB/U1/U7/TX_CLK}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U7/TX_MOSI}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U7/TX_MISO}
add wave -noreg -logic {/USART_B_TB/U1/U7/OVFL}
add wave -named_row "AXIS_TO_USART"
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U6/TX_BYTES}
add wave -noreg -logic {/USART_B_TB/U1/U6/TX_VALID}
add wave -noreg -logic {/USART_B_TB/U1/U6/TX_CLK}
add wave -noreg -logic {/USART_B_TB/U1/U6/TX_ACTIVE}
add wave -noreg -logic {/USART_B_TB/U1/U6/TX_DONE}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U6/AXIS_MOSI}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U6/AXIS_MISO}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U6/BYTES_TO_TRANSMIT}
add wave -noreg -logic {/USART_B_TB/U1/U6/TRANSMIT_DONE}
add wave -noreg -logic {/USART_B_TB/U1/U6/TR_RESET}
add wave -noreg -logic {/USART_B_TB/U1/U6/ERROR}
add wave -noreg -logic {/USART_B_TB/U1/U6/ARESETN}
add wave -noreg -literal {/USART_B_TB/U1/U6/tx_state}
add wave -noreg -literal {/USART_B_TB/U1/U6/next_tx_state}
add wave -noreg -logic {/USART_B_TB/U1/U6/tx_ready}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U6/tx_data}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U6/bytes_to_send}
add wave -named_row "USART_TX"
add wave -noreg -logic {/USART_B_TB/U1/U1/USART_CLK}
add wave -noreg -logic {/USART_B_TB/U1/U1/TX_DV}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U1/TX_BYTE}
add wave -noreg -logic {/USART_B_TB/U1/U1/TX_ACTIVE}
add wave -noreg -logic {/USART_B_TB/U1/U1/TX_SERIAL}
add wave -noreg -logic {/USART_B_TB/U1/U1/TX_DONE}
add wave -noreg -literal {/USART_B_TB/U1/U1/r_SM_Main}
add wave -noreg -decimal -literal -signed2 {/USART_B_TB/U1/U1/r_Bit_Index}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U1/r_TX_Data}
add wave -noreg -logic {/USART_B_TB/U1/U1/r_TX_Done}
add wave -named_row "USART_CTRL"
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U9/AXI4_LITE_MOSI}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U9/AXI4_LITE_MISO}
add wave -noreg -logic {/USART_B_TB/U1/U9/INTERUPT}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U9/TX_BYTES_TO_TRANSMIT}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U9/TIMOUT_LENGTH}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U9/RX_BYTES_COUNT}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U9/CLEAR_INTR}
add wave -noreg -logic {/USART_B_TB/U1/U9/RX_FULL}
add wave -noreg -logic {/USART_B_TB/U1/U9/RX_TIMEOUT}
add wave -noreg -logic {/USART_B_TB/U1/U9/TX_DONE}
add wave -noreg -logic {/USART_B_TB/U1/U9/ARESETN}
add wave -noreg -logic {/USART_B_TB/U1/U9/CLK_MB}
add wave -noreg -logic {/USART_B_TB/U1/U9/CLK_USART}
add wave -noreg -logic {/USART_B_TB/U1/U9/sresetn}
add wave -noreg -logic {/USART_B_TB/U1/U9/rx_full_i}
add wave -noreg -logic {/USART_B_TB/U1/U9/rx_timeout_i}
add wave -noreg -logic {/USART_B_TB/U1/U9/tx_done_i}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U9/rx_bytes_cnt_i}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U9/tx_bytes_to_transmit_o}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U9/rx_timeout_length_o}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U9/clear_intr_o}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U1/U9/reg_data_out}
add wave -named_row "TB_PROCESS"
add wave -noreg -hexadecimal -literal {/USART_B_TB/U3/RX_MOSI}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U3/RX_MISO}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U3/TX_MOSI}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U3/TX_MISO}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U3/AXIL_MOSI}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U3/AXIL_MISO}
add wave -noreg -logic {/USART_B_TB/U3/INTR}
add wave -noreg -logic {/USART_B_TB/U3/MB_CLK}
add wave -noreg -decimal -literal -signed2 {/USART_B_TB/U3/MB_PROCESS/i}
add wave -noreg -decimal -literal -signed2 {/USART_B_TB/U3/MB_PROCESS/j}
add wave -noreg -logic -signed2 {/USART_B_TB/U3/ARESETN}
add wave -noreg -logic -signed2 {/USART_B_TB/U3/rstn_i}
add wave -noreg -logic {/USART_B_TB/U3/rx_rdy}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U3/tx_word}
add wave -noreg -logic {/USART_B_TB/U3/tx_word_valid}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U3/intr_vect}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U3/rx_bytes_count}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U3/rx_bytes_count_u}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U3/bytes_rd}
add wave -noreg -hexadecimal -literal {/USART_B_TB/U3/fifo}
cursor "Cursor 1" 17923991ps  
cursor "Cursor 2" 1370.07us  
cursor "Cursor 3" 10ms  
cursor "Cursor 4" 643985705ps  
transcript on
