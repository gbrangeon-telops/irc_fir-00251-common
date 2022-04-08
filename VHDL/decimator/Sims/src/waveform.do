onerror { resume }
transcript off	  

add wave -named_row "stim" 	
add wave -noreg -logic {/Top/U1/ARESETN} 
add wave -noreg -logic {/Top/U1/CLK_DATA}
add wave -noreg -logic {/Top/U1/transmit}
add wave -noreg -logic {/Top/U1/MB_MISO} 	 
add wave -noreg -logic {/Top/U1/MB_MOSI} 

add wave -noreg -logic {/Top/U1/AXIS_MOSI.TDATA} 
add wave -noreg -logic {/Top/U1/AXIS_MOSI.TVALID} 
add wave -noreg -logic {/Top/U1/AXIS_MOSI.TLAST} 
add wave -noreg -logic {/Top/U1/AXIS_MISO.TREADY} 
													 
add wave -named_row "------------------------CTRL INTF-------------------------------------"
add wave -noreg -logic {/Top/CTRL/AXI4_LITE_MOSI}   
add wave -noreg -logic {/Top/CTRL/AXI4_LITE_MISO} 
add wave -noreg -logic {/Top/CTRL/FB_CONF} 
add wave -noreg -logic {/Top/CTRL/DECIMATOR_CONF} 
add wave -noreg -logic {/Top/CTRL/VIDEO_CONFIG}    
add wave -noreg -logic {/Top/CTRL/DECIMATOR_CFG} 
add wave -noreg -logic {} 
add wave -noreg -logic {} 
add wave -noreg -logic {}  
 add wave -noreg -logic {/Top/CTRL/decimator_cfg_i} 
 
add wave -named_row "------------------------hdr mng-------------------------------------"
add wave -noreg -logic {/Top/U3/RX_MOSI.TDATA} 
add wave -noreg -logic {/Top/U3/RX_MOSI.TVALID} 
add wave -noreg -logic {/Top/U3/RX_MOSI.TLAST} 
add wave -noreg -logic {/Top/U3/RX_MOSI.TID} 
add wave -noreg -logic {/Top/U3/RX_MISO.TREADY} 
add wave -noreg -logic {/Top/U3/TX_MOSI.TDATA} 
add wave -noreg -logic {/Top/U3/TX_MOSI.TVALID} 
add wave -noreg -logic {/Top/U3/TX_MOSI.TLAST} 
add wave -noreg -logic {/Top/U3/TX_MOSI.TID} 
add wave -noreg -logic {/Top/U3/TX_MISO.TREADY}
add wave -noreg -logic {/top/U3/RX_MOSI} 
add wave -noreg -logic {/top/U3/TX_MOSI} 
add wave -noreg -logic {/top/U3/gen_tid_o} 
add wave -noreg -logic {} 
add wave -noreg -logic {} 
add wave -noreg -logic {} 
add wave -noreg -logic {}    
   add wave -named_row "------------------------video handler-------------------------------------"
add wave -noreg -logic {/top/U4/VIDEO_IN_MOSI} 
add wave -noreg -logic {/top/U4/VIDEO_OUT_MOSI} 
add wave -noreg -logic {} 
add wave -noreg -logic {} 


add wave -named_row "------------------------row decimator-------------------------------------"


add wave -noreg -logic {/Top/U9/g0/U4/AXIS_RX_DATA_MOSI.TVALID} 
add wave -noreg -logic {/Top/U9/g0/U4/AXIS_RX_DATA_MISO.TREADY} 
add wave -noreg -logic {/Top/U9/g0/U4/AXIS_RX_DATA_MOSI.TDATA} 
add wave -noreg -logic {/Top/U9/g0/U4/AXIS_RX_DATA_MOSI.TLAST} 
add wave -noreg -logic {/Top/U9/g0/U4/AXIS_TX_DATA_MOSI.TVALID} 
add wave -noreg -logic {/Top/U9/g0/U4/AXIS_TX_DATA_MISO.TREADY} 
add wave -noreg -logic {/Top/U9/g0/U4/AXIS_TX_DATA_MOSI.TDATA} 
add wave -noreg -logic {/Top/U9/g0/U4/AXIS_TX_DATA_MOSI.TLAST} 
add wave -noreg -logic {/Top/U9/g0/U4/pix_cnt} 
add wave -noreg -logic {/Top/U9/g0/U4/row_decimator_state}   
add wave -noreg -logic {/Top/U9/g0/U4/AXIS_RX_DATA_MOSI} 
add wave -noreg -logic {/Top/U9/g0/U4/AXIS_TX_DATA_MOSI} 
add wave -noreg -logic {/Top/U9/g0/U4/CFG} 

add wave -noreg -logic {}


add wave -named_row "------------------------column decimator-------------------------------------"
add wave -noreg -logic {/Top/U9/g1/U2/AXIS_RX_DATA_MOSI.TVALID} 
add wave -noreg -logic {/Top/U9/g1/U2/AXIS_RX_DATA_MISO.TREADY} 
add wave -noreg -logic {/Top/U9/g1/U2/AXIS_RX_DATA_MOSI.TDATA} 
add wave -noreg -logic {/Top/U9/g1/U2/AXIS_RX_DATA_MOSI.TLAST} 

add wave -noreg -logic {/Top/U9/g1/U2/asym_fifo_input_i.TVALID} 
add wave -noreg -logic {/Top/U9/g1/U2/asym_fifo_input_i.TDATA} 
add wave -noreg -logic {/Top/U9/g1/U2/asym_fifo_input_i.TLAST}

add wave -noreg -logic {/Top/U9/g1/U2/AXIS_TX_DATA_MOSI.TVALID} 
add wave -noreg -logic {/Top/U9/g1/U2/AXIS_TX_DATA_MISO.TREADY}
add wave -noreg -logic {/Top/U9/g1/U2/AXIS_TX_DATA_MOSI.TDATA} 
add wave -noreg -logic {/Top/U9/g1/U2/AXIS_TX_DATA_MOSI.TLAST}	
add wave -noreg -logic {/Top/U9/g1/U2/AXIS_RX_DATA_MOSI} 
add wave -noreg -logic {/Top/U9/g1/U2/AXIS_TX_DATA_MOSI} 


add wave -named_row "------------------------asym fifo-------------------------------------"

add wave -noreg -logic {/Top/U9/U2/U9/fifo_din} 
add wave -noreg -logic {/Top/U9/U2/U9/fifo_wr_en} 
add wave -noreg -logic {/Top/U9/U2/U9/rx_tready} 
add wave -noreg -logic {/Top/U9/U2/U9/fifo_rd_en} 
add wave -noreg -logic {/Top/U9/U2/U9/fifo_full} 
add wave -noreg -logic {/Top/U9/U2/U9/fifo_overflow} 
add wave -noreg -logic {/Top/U9/U2/U9/fifo_valid} 
add wave -noreg -logic {/Top/U9/U2/U9/fifo_dout} 
add wave -noreg -logic {/Top/U9/U2/U9/RX_MOSI} 
add wave -noreg -logic {/Top/U9/U2/U9/RX_MISO} 
add wave -noreg -logic {/Top/U9/U2/U9/TX_MOSI}
add wave -noreg -logic {/Top/U9/U2/U9/TX_MISO}

add wave -named_row "------------------------th ctler-------------------------------------"

add wave -noreg -logic {/Top/U6/RX_MOSI.TVALID} 
add wave -noreg -logic {/Top/U6/RX_MISO.TREADY} 
add wave -noreg -logic {/Top/U6/RX_MOSI.TDATA} 
add wave -noreg -logic {/Top/U6/RX_MOSI.TLAST} 
add wave -noreg -logic {/Top/U6/TX_MOSI.TVALID} 
add wave -noreg -logic {/Top/U6/TX_MISO.TREADY}
add wave -noreg -logic {/Top/U6/TX_MOSI.TDATA} 
add wave -noreg -logic {/Top/U6/TX_MOSI.TLAST} 

add wave -noreg -logic {/Top/U6/ctrl_fsm} 
add wave -noreg -logic {/Top/U6/flow_enabled} 
add wave -noreg -logic {/Top/U6/downstream_afull} 
add wave -noreg -logic {/Top/U6/frame_in_progress} 
add wave -noreg -logic {/Top/U6/img_eof} 
add wave -noreg -logic {/Top/U6/img_sof} 
add wave -noreg -logic {/Top/U6/fifo_dcnt_i}  
 add wave -noreg -logic {/Top/U6/RX_MOSI} 
add wave -noreg -logic {/Top/U6/rx_mosi_pipe(0)} 

add wave -noreg -logic {/Top/U6/rx_mosi_pipe(1)} 
add wave -noreg -logic {/Top/U6/fifo_rx_mosi_i} 
add wave -noreg -logic {} 


#add wave -noreg -logic {/Top/DM_IN_FIFO/RX_MOSI} 
#add wave -noreg -logic {/Top/DM_IN_FIFO/RX_MISO} 
#add wave -noreg -logic {/Top/DM_IN_FIFO/TX_MOSI}
#add wave -noreg -logic {/Top/DM_IN_FIFO/TX_MISO} 
#add wave -noreg -logic {/Top/DM_IN_FIFO/RX_MOSI.TVALID} 
#add wave -noreg -logic {/Top/DM_IN_FIFO/RX_MISO.TREADY} 
#add wave -noreg -logic {/Top/DM_IN_FIFO/RX_MOSI.TDATA} 
#add wave -noreg -logic {/Top/DM_IN_FIFO/RX_MOSI.TLAST} 
#add wave -noreg -logic {/Top/DM_IN_FIFO/TX_MOSI.TVALID} 
#add wave -noreg -logic {/Top/DM_IN_FIFO/TX_MISO.TREADY} 
#add wave -noreg -logic {/Top/DM_IN_FIFO/TX_MOSI.TDATA}
#add wave -noreg -logic {/Top/DM_IN_FIFO/TX_MOSI.TLAST} 
#add wave -noreg -logic {} 

add wave -noreg -logic {} 
add wave -noreg -logic {} 

add wave -noreg -logic {} 
add wave -noreg -logic {} 
add wave -noreg -logic {} 
add wave -noreg -logic {} 
add wave -noreg -logic {} 
add wave -noreg -logic {} 
add wave -noreg -logic {} 
add wave -noreg -logic {} 
add wave -noreg -logic {} 
add wave -noreg -logic {} 
add wave -noreg -logic {} 
add wave -noreg -logic {} 
add wave -noreg -logic {} 
add wave -noreg -logic {} 
add wave -noreg -logic {} 
add wave -noreg -logic {} 

  
transcript on
