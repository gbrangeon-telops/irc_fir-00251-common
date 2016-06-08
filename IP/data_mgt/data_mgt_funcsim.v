// Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2013.4 (win64) Build 353583 Mon Dec  9 17:49:19 MST 2013
// Date        : Fri Mar 11 21:47:37 2016
// Host        : TELOPS177 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim d:/Telops/fir-00251-Common/IP/data_mgt/data_mgt_funcsim.v
// Design      : data_mgt
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* core_generation_info = "data_mgt,aurora_8b10b_v10_1,{user_interface=AXI_4_Streaming,backchannel_mode=Sidebands,c_aurora_lanes=2,c_column_used=left,c_gt_clock_1=GTXQ0,c_gt_clock_2=None,c_gt_loc_1=1,c_gt_loc_10=X,c_gt_loc_11=X,c_gt_loc_12=X,c_gt_loc_13=X,c_gt_loc_14=X,c_gt_loc_15=X,c_gt_loc_16=X,c_gt_loc_17=X,c_gt_loc_18=X,c_gt_loc_19=X,c_gt_loc_2=2,c_gt_loc_20=X,c_gt_loc_21=X,c_gt_loc_22=X,c_gt_loc_23=X,c_gt_loc_24=X,c_gt_loc_25=X,c_gt_loc_26=X,c_gt_loc_27=X,c_gt_loc_28=X,c_gt_loc_29=X,c_gt_loc_3=X,c_gt_loc_30=X,c_gt_loc_31=X,c_gt_loc_32=X,c_gt_loc_33=X,c_gt_loc_34=X,c_gt_loc_35=X,c_gt_loc_36=X,c_gt_loc_37=X,c_gt_loc_38=X,c_gt_loc_39=X,c_gt_loc_4=X,c_gt_loc_40=X,c_gt_loc_41=X,c_gt_loc_42=X,c_gt_loc_43=X,c_gt_loc_44=X,c_gt_loc_45=X,c_gt_loc_46=X,c_gt_loc_47=X,c_gt_loc_48=X,c_gt_loc_5=X,c_gt_loc_6=X,c_gt_loc_7=X,c_gt_loc_8=X,c_gt_loc_9=X,c_lane_width=4,c_line_rate=40000,c_nfc=false,c_nfc_mode=IMM,c_refclk_frequency=125000,c_simplex=false,c_simplex_mode=TX,c_stream=false,c_ufc=false,flow_mode=None,interface_mode=Framing,dataflow_config=Duplex}" *) 
(* NotValidForBitStream *)
module data_mgt
   (s_axi_tx_tdata,
    s_axi_tx_tvalid,
    s_axi_tx_tready,
    s_axi_tx_tkeep,
    s_axi_tx_tlast,
    m_axi_rx_tdata,
    m_axi_rx_tvalid,
    m_axi_rx_tkeep,
    m_axi_rx_tlast,
    rxp,
    rxn,
    txp,
    txn,
    gt_refclk1,
    frame_err,
    hard_err,
    soft_err,
    channel_up,
    lane_up,
    warn_cc,
    do_cc,
    user_clk,
    sync_clk,
    reset,
    power_down,
    loopback,
    gt_reset,
    tx_lock,
    sys_reset_out,
    init_clk_in,
    tx_resetdone_out,
    rx_resetdone_out,
    link_reset_out,
    drpclk_in,
    drpaddr_in,
    drpdi_in,
    drpdo_out,
    drpen_in,
    drprdy_out,
    drpwe_in,
    drpaddr_in_lane1,
    drpdi_in_lane1,
    drpdo_out_lane1,
    drpen_in_lane1,
    drprdy_out_lane1,
    drpwe_in_lane1,
    gt0_qplllock_in,
    gt0_qpllrefclklost_in,
    gt0_qpllreset_out,
    gt_qpllclk_quad1_in,
    gt_qpllrefclk_quad1_in,
    tx_out_clk,
    pll_not_locked);
  input [0:63]s_axi_tx_tdata;
  input s_axi_tx_tvalid;
  output s_axi_tx_tready;
  input [0:7]s_axi_tx_tkeep;
  input s_axi_tx_tlast;
  output [0:63]m_axi_rx_tdata;
  output m_axi_rx_tvalid;
  output [0:7]m_axi_rx_tkeep;
  output m_axi_rx_tlast;
  input [0:1]rxp;
  input [0:1]rxn;
  output [0:1]txp;
  output [0:1]txn;
  input gt_refclk1;
  output frame_err;
  output hard_err;
  output soft_err;
  output channel_up;
  output [0:1]lane_up;
  input warn_cc;
  input do_cc;
  input user_clk;
  input sync_clk;
  input reset;
  input power_down;
  input [2:0]loopback;
  input gt_reset;
  output tx_lock;
  output sys_reset_out;
  input init_clk_in;
  output tx_resetdone_out;
  output rx_resetdone_out;
  output link_reset_out;
  input drpclk_in;
  input [8:0]drpaddr_in;
  input [15:0]drpdi_in;
  output [15:0]drpdo_out;
  input drpen_in;
  output drprdy_out;
  input drpwe_in;
  input [8:0]drpaddr_in_lane1;
  input [15:0]drpdi_in_lane1;
  output [15:0]drpdo_out_lane1;
  input drpen_in_lane1;
  output drprdy_out_lane1;
  input drpwe_in_lane1;
  input gt0_qplllock_in;
  input gt0_qpllrefclklost_in;
  output gt0_qpllreset_out;
  input gt_qpllclk_quad1_in;
  input gt_qpllrefclk_quad1_in;
  output tx_out_clk;
  input pll_not_locked;

  wire channel_up;
  wire do_cc;
  wire [8:0]drpaddr_in;
  wire [8:0]drpaddr_in_lane1;
  wire drpclk_in;
  wire [15:0]drpdi_in;
  wire [15:0]drpdi_in_lane1;
  wire [15:0]drpdo_out;
  wire [15:0]drpdo_out_lane1;
  wire drpen_in;
  wire drpen_in_lane1;
  wire drprdy_out;
  wire drprdy_out_lane1;
  wire drpwe_in;
  wire drpwe_in_lane1;
  wire frame_err;
  wire gt0_qplllock_in;
  wire gt0_qpllrefclklost_in;
  wire gt0_qpllreset_out;
  wire gt_qpllclk_quad1_in;
  wire gt_qpllrefclk_quad1_in;
  wire gt_refclk1;
  wire gt_reset;
  wire hard_err;
  wire init_clk_in;
  wire [0:1]lane_up;
  wire link_reset_out;
  wire [2:0]loopback;
  wire [0:63]m_axi_rx_tdata;
  wire [0:7]m_axi_rx_tkeep;
  wire m_axi_rx_tlast;
  wire m_axi_rx_tvalid;
  wire pll_not_locked;
  wire power_down;
  wire reset;
  wire rx_resetdone_out;
  wire [0:1]rxn;
  wire [0:1]rxp;
  wire [0:63]s_axi_tx_tdata;
  wire [0:7]s_axi_tx_tkeep;
  wire s_axi_tx_tlast;
  wire s_axi_tx_tready;
  wire s_axi_tx_tvalid;
  wire soft_err;
  wire sync_clk;
  wire sys_reset_out;
  wire tx_lock;
  wire tx_out_clk;
  wire tx_resetdone_out;
  wire [0:1]txn;
  wire [0:1]txp;
  wire user_clk;
  wire warn_cc;

(* SIM_GTRESET_SPEEDUP = "FALSE" *) 
   (* core_generation_info = "data_mgt,aurora_8b10b_v10_1,{user_interface=AXI_4_Streaming,backchannel_mode=Sidebands,c_aurora_lanes=2,c_column_used=left,c_gt_clock_1=GTXQ0,c_gt_clock_2=None,c_gt_loc_1=1,c_gt_loc_10=X,c_gt_loc_11=X,c_gt_loc_12=X,c_gt_loc_13=X,c_gt_loc_14=X,c_gt_loc_15=X,c_gt_loc_16=X,c_gt_loc_17=X,c_gt_loc_18=X,c_gt_loc_19=X,c_gt_loc_2=2,c_gt_loc_20=X,c_gt_loc_21=X,c_gt_loc_22=X,c_gt_loc_23=X,c_gt_loc_24=X,c_gt_loc_25=X,c_gt_loc_26=X,c_gt_loc_27=X,c_gt_loc_28=X,c_gt_loc_29=X,c_gt_loc_3=X,c_gt_loc_30=X,c_gt_loc_31=X,c_gt_loc_32=X,c_gt_loc_33=X,c_gt_loc_34=X,c_gt_loc_35=X,c_gt_loc_36=X,c_gt_loc_37=X,c_gt_loc_38=X,c_gt_loc_39=X,c_gt_loc_4=X,c_gt_loc_40=X,c_gt_loc_41=X,c_gt_loc_42=X,c_gt_loc_43=X,c_gt_loc_44=X,c_gt_loc_45=X,c_gt_loc_46=X,c_gt_loc_47=X,c_gt_loc_48=X,c_gt_loc_5=X,c_gt_loc_6=X,c_gt_loc_7=X,c_gt_loc_8=X,c_gt_loc_9=X,c_lane_width=4,c_line_rate=40000,c_nfc=false,c_nfc_mode=IMM,c_refclk_frequency=125000,c_simplex=false,c_simplex_mode=TX,c_stream=false,c_ufc=false,flow_mode=None,interface_mode=Framing,dataflow_config=Duplex}" *) 
   data_mgtdata_mgt_core U0
       (.CHANNEL_UP(channel_up),
        .DO_CC(do_cc),
        .DRPADDR_IN(drpaddr_in),
        .DRPADDR_IN_LANE1(drpaddr_in_lane1),
        .DRPDI_IN(drpdi_in),
        .DRPDI_IN_LANE1(drpdi_in_lane1),
        .DRPDO_OUT(drpdo_out),
        .DRPDO_OUT_LANE1(drpdo_out_lane1),
        .DRPEN_IN(drpen_in),
        .DRPEN_IN_LANE1(drpen_in_lane1),
        .DRPRDY_OUT(drprdy_out),
        .DRPRDY_OUT_LANE1(drprdy_out_lane1),
        .DRPWE_IN(drpwe_in),
        .DRPWE_IN_LANE1(drpwe_in_lane1),
        .FRAME_ERR(frame_err),
        .GT_REFCLK1(gt_refclk1),
        .GT_RESET(gt_reset),
        .HARD_ERR(hard_err),
        .LANE_UP(lane_up),
        .LINK_RESET_OUT(link_reset_out),
        .LOOPBACK(loopback),
        .M_AXI_RX_TDATA(m_axi_rx_tdata),
        .M_AXI_RX_TKEEP(m_axi_rx_tkeep),
        .M_AXI_RX_TLAST(m_axi_rx_tlast),
        .M_AXI_RX_TVALID(m_axi_rx_tvalid),
        .PLL_NOT_LOCKED(pll_not_locked),
        .POWER_DOWN(power_down),
        .RESET(reset),
        .RXN(rxn),
        .RXP(rxp),
        .RX_RESETDONE_OUT(rx_resetdone_out),
        .SOFT_ERR(soft_err),
        .SYNC_CLK(sync_clk),
        .S_AXI_TX_TDATA(s_axi_tx_tdata),
        .S_AXI_TX_TKEEP(s_axi_tx_tkeep),
        .S_AXI_TX_TLAST(s_axi_tx_tlast),
        .S_AXI_TX_TREADY(s_axi_tx_tready),
        .S_AXI_TX_TVALID(s_axi_tx_tvalid),
        .TXN(txn),
        .TXP(txp),
        .TX_OUT_CLK(tx_out_clk),
        .TX_RESETDONE_OUT(tx_resetdone_out),
        .WARN_CC(warn_cc),
        .drpclk_in(drpclk_in),
        .gt0_qplllock_in(gt0_qplllock_in),
        .gt0_qpllrefclklost_in(gt0_qpllrefclklost_in),
        .gt0_qpllreset_out(gt0_qpllreset_out),
        .gt_qpllclk_quad1_in(gt_qpllclk_quad1_in),
        .gt_qpllrefclk_quad1_in(gt_qpllrefclk_quad1_in),
        .init_clk_in(init_clk_in),
        .sys_reset_out(sys_reset_out),
        .tx_lock(tx_lock),
        .user_clk(user_clk));
endmodule

module data_mgtdata_mgt_AURORA_LANE_4BYTE
   (D,
    ENMCOMMAALIGN_IN,
    GT0_TXCHARISK_IN,
    O1,
    O2,
    GOT_V,
    RXPOLARITY_IN,
    O3,
    I13,
    S4_in,
    O4,
    S,
    O5,
    O6,
    O7,
    good_as_r0,
    O8,
    LINK_RESET_OUT,
    O9,
    O10,
    O11,
    O12,
    GT0_TXDATA_IN,
    O13,
    O14,
    O15,
    O16,
    O17,
    I1,
    user_clk,
    GEN_CC,
    GEN_SCP,
    GEN_A,
    I2,
    I3,
    hard_err_gt0,
    init_clk_in,
    I4,
    I5,
    Q,
    CI,
    I6,
    RXREALIGN_OUT,
    GT0_RXDISPERR_OUT,
    I7,
    GT0_RXCHARISK_OUT,
    GT0_RXDATA_OUT,
    I8,
    I9,
    I10,
    I11,
    I12,
    I14,
    I15,
    I16,
    I17,
    I18,
    I19,
    I20,
    I21,
    I22,
    I23,
    I24);
  output [0:0]D;
  output ENMCOMMAALIGN_IN;
  output [3:0]GT0_TXCHARISK_IN;
  output O1;
  output O2;
  output GOT_V;
  output RXPOLARITY_IN;
  output O3;
  output [1:0]I13;
  output S4_in;
  output [1:0]O4;
  output S;
  output [0:0]O5;
  output [0:0]O6;
  output [7:0]O7;
  output good_as_r0;
  output [3:0]O8;
  output LINK_RESET_OUT;
  output O9;
  output O10;
  output [1:0]O11;
  output O12;
  output [31:0]GT0_TXDATA_IN;
  output [7:0]O13;
  output [7:0]O14;
  output [7:0]O15;
  output [7:0]O16;
  output [1:0]O17;
  input I1;
  input user_clk;
  input GEN_CC;
  input GEN_SCP;
  input GEN_A;
  input I2;
  input I3;
  input hard_err_gt0;
  input init_clk_in;
  input I4;
  input I5;
  input [1:0]Q;
  input CI;
  input I6;
  input RXREALIGN_OUT;
  input [1:0]GT0_RXDISPERR_OUT;
  input I7;
  input [3:0]GT0_RXCHARISK_OUT;
  input [31:0]GT0_RXDATA_OUT;
  input [3:0]I8;
  input I9;
  input [3:0]I10;
  input [1:0]I11;
  input [1:0]I12;
  input [2:0]I14;
  input [3:0]I15;
  input [3:0]I16;
  input [7:0]I17;
  input [7:0]I18;
  input [7:0]I19;
  input I20;
  input I21;
  input I22;
  input I23;
  input [31:0]I24;

  wire CI;
  wire [0:0]D;
  wire ENABLE_ERR_DETECT;
  wire ENMCOMMAALIGN_IN;
  wire GEN_A;
  wire GEN_CC;
  wire GEN_SCP;
  wire GEN_SP;
  wire GEN_SPA;
  wire GOT_V;
  wire [3:0]GT0_RXCHARISK_OUT;
  wire [31:0]GT0_RXDATA_OUT;
  wire [1:0]GT0_RXDISPERR_OUT;
  wire [3:0]GT0_TXCHARISK_IN;
  wire [31:0]GT0_TXDATA_IN;
  wire I1;
  wire [3:0]I10;
  wire [1:0]I11;
  wire [1:0]I12;
  wire [1:0]I13;
  wire [2:0]I14;
  wire [3:0]I15;
  wire [3:0]I16;
  wire [7:0]I17;
  wire [7:0]I18;
  wire [7:0]I19;
  wire I2;
  wire I20;
  wire I21;
  wire I22;
  wire I23;
  wire [31:0]I24;
  wire I3;
  wire I4;
  wire I5;
  wire I6;
  wire I7;
  wire [3:0]I8;
  wire I9;
  wire LINK_RESET_OUT;
  wire O1;
  wire O10;
  wire [1:0]O11;
  wire O12;
  wire [7:0]O13;
  wire [7:0]O14;
  wire [7:0]O15;
  wire [7:0]O16;
  wire [1:0]O17;
  wire O2;
  wire O3;
  wire [1:0]O4;
  wire [0:0]O5;
  wire [0:0]O6;
  wire [7:0]O7;
  wire [3:0]O8;
  wire O9;
  wire [1:0]Q;
  wire RXPOLARITY_IN;
  wire RXREALIGN_OUT;
  wire RX_CC;
  wire RX_NEG_Buffer;
  wire S;
  wire S4_in;
  wire begin_r0;
  wire counter3_r0;
  wire counter4_r0;
  wire first_v_received_r;
  wire good_as_r0;
  wire good_cnt_r3;
  wire hard_err_gt0;
  wire init_clk_in;
  wire ready_r;
  wire user_clk;

data_mgtdata_mgt_ERR_DETECT_4BYTE_7 data_mgt_err_detect_4byte_i
       (.ENABLE_ERR_DETECT(ENABLE_ERR_DETECT),
        .I1(I1),
        .I20(I20),
        .I21(I21),
        .I22(I22),
        .I23(I23),
        .O17(O17),
        .O5(O5),
        .begin_r0(begin_r0),
        .good_cnt_r3(good_cnt_r3),
        .hard_err_gt0(hard_err_gt0),
        .user_clk(user_clk));
data_mgtdata_mgt_HOTPLUG_6 data_mgt_hotplug_i
       (.I1(I1),
        .I9(I9),
        .LINK_RESET_OUT(LINK_RESET_OUT),
        .RX_CC(RX_CC),
        .init_clk_in(init_clk_in),
        .user_clk(user_clk));
data_mgtdata_mgt_LANE_INIT_SM_4BYTE_5 data_mgt_lane_init_sm_4byte_i
       (.D(D),
        .ENABLE_ERR_DETECT(ENABLE_ERR_DETECT),
        .GEN_SP(GEN_SP),
        .GEN_SPA(GEN_SPA),
        .GT0_RXCHARISK_OUT(GT0_RXCHARISK_OUT[3:2]),
        .GT0_RXDISPERR_OUT(GT0_RXDISPERR_OUT),
        .I1(I1),
        .I10(I10),
        .I7(I7),
        .O1(ENMCOMMAALIGN_IN),
        .O9(O9),
        .RXPOLARITY_IN(RXPOLARITY_IN),
        .RXREALIGN_OUT(RXREALIGN_OUT),
        .RX_NEG_Buffer(RX_NEG_Buffer),
        .begin_r0(begin_r0),
        .counter3_r0(counter3_r0),
        .counter4_r0(counter4_r0),
        .first_v_received_r(first_v_received_r),
        .good_cnt_r3(good_cnt_r3),
        .ready_r(ready_r),
        .user_clk(user_clk));
data_mgtdata_mgt_SYM_DEC_4BYTE_3 data_mgt_sym_dec_4byte_i
       (.CI(CI),
        .D(D),
        .GEN_SPA(GEN_SPA),
        .GOT_V(GOT_V),
        .GT0_RXCHARISK_OUT(GT0_RXCHARISK_OUT),
        .GT0_RXDATA_OUT(GT0_RXDATA_OUT),
        .I13(I13),
        .I17(I17),
        .I18(I18),
        .I19(I19),
        .I2(I2),
        .I3(I3),
        .I4(I4),
        .I5(I5),
        .I6(I6),
        .I8(I8),
        .O1(O1),
        .O10(O10),
        .O11(O11),
        .O12(O12),
        .O13(O15),
        .O14(O16),
        .O2(O2),
        .O3(O3),
        .O4(O4),
        .O5(O13),
        .O6(O6),
        .O7(O7),
        .O8(O8),
        .O9(O14),
        .Q(Q),
        .RX_CC(RX_CC),
        .RX_NEG_Buffer(RX_NEG_Buffer),
        .S(S),
        .S4_in(S4_in),
        .counter3_r0(counter3_r0),
        .counter4_r0(counter4_r0),
        .first_v_received_r(first_v_received_r),
        .good_as_r0(good_as_r0),
        .ready_r(ready_r),
        .user_clk(user_clk));
data_mgtdata_mgt_SYM_GEN_4BYTE_4 data_mgt_sym_gen_4byte_i
       (.GEN_A(GEN_A),
        .GEN_CC(GEN_CC),
        .GEN_SCP(GEN_SCP),
        .GEN_SP(GEN_SP),
        .GEN_SPA(GEN_SPA),
        .GT0_TXCHARISK_IN(GT0_TXCHARISK_IN),
        .GT0_TXDATA_IN(GT0_TXDATA_IN),
        .I11(I11),
        .I12(I12),
        .I14(I14),
        .I15(I15),
        .I16(I16),
        .I24(I24),
        .user_clk(user_clk));
endmodule

(* ORIG_REF_NAME = "data_mgt_AURORA_LANE_4BYTE" *) 
module data_mgtdata_mgt_AURORA_LANE_4BYTE_0
   (LANE_UP,
    ENMCOMMAALIGN_IN_LANE1,
    GT1_TXCHARISK_IN,
    O1,
    O2,
    O3,
    RXPOLARITY_IN_LANE1,
    I13,
    S7_in,
    Q,
    S1_in,
    O4,
    O5,
    O6,
    O7,
    O9,
    O10,
    O11,
    O12,
    O13,
    O14,
    O15,
    GT1_TXDATA_IN,
    O16,
    O17,
    O18,
    O19,
    O20,
    O21,
    I1,
    user_clk,
    I2,
    I3,
    I4,
    I5,
    I6,
    hard_err_gt0,
    init_clk_in,
    I7,
    I8,
    I9,
    O,
    RXREALIGN_OUT_LANE1,
    GT1_RXDISPERR_OUT,
    I10,
    GT1_RXCHARISK_OUT,
    GT1_RXDATA_OUT,
    O8,
    GOT_V,
    I11,
    D,
    I12,
    I14,
    I15,
    I16,
    I17,
    I18,
    I19,
    I20,
    I21,
    I22,
    I23,
    I24,
    I25);
  output [0:0]LANE_UP;
  output ENMCOMMAALIGN_IN_LANE1;
  output [3:0]GT1_TXCHARISK_IN;
  output O1;
  output O2;
  output O3;
  output RXPOLARITY_IN_LANE1;
  output [1:0]I13;
  output S7_in;
  output [1:0]Q;
  output S1_in;
  output [0:0]O4;
  output [0:0]O5;
  output [7:0]O6;
  output O7;
  output [3:0]O9;
  output O10;
  output O11;
  output O12;
  output [1:0]O13;
  output O14;
  output O15;
  output [31:0]GT1_TXDATA_IN;
  output [7:0]O16;
  output [7:0]O17;
  output [7:0]O18;
  output [7:0]O19;
  output [1:0]O20;
  output [1:0]O21;
  input I1;
  input user_clk;
  input I2;
  input I3;
  input I4;
  input I5;
  input I6;
  input hard_err_gt0;
  input init_clk_in;
  input I7;
  input I8;
  input I9;
  input O;
  input RXREALIGN_OUT_LANE1;
  input [1:0]GT1_RXDISPERR_OUT;
  input I10;
  input [3:0]GT1_RXCHARISK_OUT;
  input [31:0]GT1_RXDATA_OUT;
  input [3:0]O8;
  input GOT_V;
  input [0:0]I11;
  input [3:0]D;
  input [1:0]I12;
  input [1:0]I14;
  input [2:0]I15;
  input [3:0]I16;
  input [3:0]I17;
  input [7:0]I18;
  input [7:0]I19;
  input [7:0]I20;
  input I21;
  input I22;
  input I23;
  input I24;
  input [31:0]I25;

  wire [3:0]D;
  wire ENABLE_ERR_DETECT;
  wire ENMCOMMAALIGN_IN_LANE1;
  wire GEN_SP;
  wire GEN_SPA;
  wire GOT_V;
  wire [3:0]GT1_RXCHARISK_OUT;
  wire [31:0]GT1_RXDATA_OUT;
  wire [1:0]GT1_RXDISPERR_OUT;
  wire [3:0]GT1_TXCHARISK_IN;
  wire [31:0]GT1_TXDATA_IN;
  wire I1;
  wire I10;
  wire [0:0]I11;
  wire [1:0]I12;
  wire [1:0]I13;
  wire [1:0]I14;
  wire [2:0]I15;
  wire [3:0]I16;
  wire [3:0]I17;
  wire [7:0]I18;
  wire [7:0]I19;
  wire I2;
  wire [7:0]I20;
  wire I21;
  wire I22;
  wire I23;
  wire I24;
  wire [31:0]I25;
  wire I3;
  wire I4;
  wire I5;
  wire I6;
  wire I7;
  wire I8;
  wire I9;
  wire [0:0]LANE_UP;
  wire O;
  wire O1;
  wire O10;
  wire O11;
  wire O12;
  wire [1:0]O13;
  wire O14;
  wire O15;
  wire [7:0]O16;
  wire [7:0]O17;
  wire [7:0]O18;
  wire [7:0]O19;
  wire O2;
  wire [1:0]O20;
  wire [1:0]O21;
  wire O3;
  wire [0:0]O4;
  wire [0:0]O5;
  wire [7:0]O6;
  wire O7;
  wire [3:0]O8;
  wire [3:0]O9;
  wire [1:0]Q;
  wire RXPOLARITY_IN_LANE1;
  wire RXREALIGN_OUT_LANE1;
  wire RX_CC;
  wire RX_NEG_Buffer;
  wire S1_in;
  wire S7_in;
  wire begin_r0;
  wire counter3_r0;
  wire counter4_r0;
  wire first_v_received_r;
  wire good_cnt_r3;
  wire hard_err_gt0;
  wire init_clk_in;
  wire ready_r;
  wire user_clk;

data_mgtdata_mgt_ERR_DETECT_4BYTE data_mgt_err_detect_4byte_i
       (.ENABLE_ERR_DETECT(ENABLE_ERR_DETECT),
        .I1(I1),
        .I21(I21),
        .I22(I22),
        .I23(I23),
        .I24(I24),
        .O21(O21),
        .O4(O4),
        .begin_r0(begin_r0),
        .good_cnt_r3(good_cnt_r3),
        .hard_err_gt0(hard_err_gt0),
        .user_clk(user_clk));
data_mgtdata_mgt_HOTPLUG data_mgt_hotplug_i
       (.I1(I1),
        .O3(O3),
        .RX_CC(RX_CC),
        .init_clk_in(init_clk_in),
        .user_clk(user_clk));
data_mgtdata_mgt_LANE_INIT_SM_4BYTE data_mgt_lane_init_sm_4byte_i
       (.D(D),
        .ENABLE_ERR_DETECT(ENABLE_ERR_DETECT),
        .GEN_SP(GEN_SP),
        .GEN_SPA(GEN_SPA),
        .GT1_RXCHARISK_OUT(GT1_RXCHARISK_OUT[3:2]),
        .GT1_RXDISPERR_OUT(GT1_RXDISPERR_OUT),
        .I1(I1),
        .I10(I10),
        .I11(I11),
        .LANE_UP(LANE_UP),
        .O1(ENMCOMMAALIGN_IN_LANE1),
        .O10(O10),
        .O15(O15),
        .RXPOLARITY_IN_LANE1(RXPOLARITY_IN_LANE1),
        .RXREALIGN_OUT_LANE1(RXREALIGN_OUT_LANE1),
        .RX_NEG_Buffer(RX_NEG_Buffer),
        .begin_r0(begin_r0),
        .counter3_r0(counter3_r0),
        .counter4_r0(counter4_r0),
        .first_v_received_r(first_v_received_r),
        .good_cnt_r3(good_cnt_r3),
        .ready_r(ready_r),
        .user_clk(user_clk));
data_mgtdata_mgt_SYM_DEC_4BYTE data_mgt_sym_dec_4byte_i
       (.GEN_SPA(GEN_SPA),
        .GOT_V(GOT_V),
        .GT1_RXCHARISK_OUT(GT1_RXCHARISK_OUT),
        .GT1_RXDATA_OUT(GT1_RXDATA_OUT),
        .I13(I13),
        .I18(I18),
        .I19(I19),
        .I20(I20),
        .I5(I5),
        .I6(I6),
        .I7(I7),
        .I8(I8),
        .I9(I9),
        .LANE_UP(LANE_UP),
        .O(O),
        .O1(O1),
        .O10(O18),
        .O11(O11),
        .O12(O12),
        .O13(O13),
        .O14(O14),
        .O15(O19),
        .O2(O2),
        .O20(O20),
        .O3(O16),
        .O4(O17),
        .O5(O5),
        .O6(O6),
        .O7(O7),
        .O8(O8),
        .O9(O9),
        .Q(Q),
        .RX_CC(RX_CC),
        .RX_NEG_Buffer(RX_NEG_Buffer),
        .S1_in(S1_in),
        .S7_in(S7_in),
        .counter3_r0(counter3_r0),
        .counter4_r0(counter4_r0),
        .first_v_received_r(first_v_received_r),
        .ready_r(ready_r),
        .user_clk(user_clk));
data_mgtdata_mgt_SYM_GEN_4BYTE data_mgt_sym_gen_4byte_i
       (.GEN_SP(GEN_SP),
        .GEN_SPA(GEN_SPA),
        .GT1_TXCHARISK_IN(GT1_TXCHARISK_IN),
        .GT1_TXDATA_IN(GT1_TXDATA_IN),
        .I12(I12),
        .I14(I14),
        .I15(I15),
        .I16(I16),
        .I17(I17),
        .I2(I2),
        .I25(I25),
        .I3(I3),
        .I4(I4),
        .user_clk(user_clk));
endmodule

(* ORIG_REF_NAME = "data_mgt_AXI_TO_LL" *) 
module data_mgtdata_mgt_AXI_TO_LL__parameterized0
   (O1,
    TX_SOF_N,
    new_pkt_r,
    user_clk,
    TX_DST_RDY_N,
    S_AXI_TX_TVALID);
  output O1;
  output TX_SOF_N;
  input new_pkt_r;
  input user_clk;
  input TX_DST_RDY_N;
  input S_AXI_TX_TVALID;

  wire \<const0> ;
  wire \<const1> ;
  wire O1;
  wire S_AXI_TX_TVALID;
  wire TX_DST_RDY_N;
  wire TX_SOF_N;
  wire new_pkt_r;
  wire user_clk;

GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
FDRE new_pkt_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(new_pkt_r),
        .Q(O1),
        .R(\<const0> ));
LUT3 #(
    .INIT(8'hEF)) 
     tx_sof_n_pipeline_r_i_1
       (.I0(O1),
        .I1(TX_DST_RDY_N),
        .I2(S_AXI_TX_TVALID),
        .O(TX_SOF_N));
endmodule

module data_mgtdata_mgt_CHANNEL_ERR_DETECT
   (SOFT_ERR,
    HARD_ERR,
    RESET_CHANNEL,
    user_clk,
    POWER_DOWN,
    I4,
    LANE_UP,
    I5);
  output SOFT_ERR;
  output HARD_ERR;
  output RESET_CHANNEL;
  input user_clk;
  input POWER_DOWN;
  input [3:0]I4;
  input [0:1]LANE_UP;
  input [1:0]I5;

  wire \<const0> ;
  wire \<const1> ;
  wire HARD_ERR;
  wire [3:0]I4;
  wire [1:0]I5;
  wire [0:1]LANE_UP;
  wire POWER_DOWN;
  wire RESET_CHANNEL;
  wire RESET_CHANNEL_Buffer0;
  wire SOFT_ERR;
  wire channel_hard_err_c;
  wire channel_soft_err_c;
  wire [0:1]hard_err_r;
  wire [0:1]lane_up_r;
  wire \n_0_soft_err_r_reg[0] ;
  wire \n_0_soft_err_r_reg[3] ;
  wire p_0_in;
  wire p_1_in2_in;
  wire user_clk;

LUT2 #(
    .INIT(4'hE)) 
     CHANNEL_HARD_ERR_Buffer_i_1
       (.I0(hard_err_r[1]),
        .I1(hard_err_r[0]),
        .O(channel_hard_err_c));
FDRE #(
    .INIT(1'b1)) 
     CHANNEL_HARD_ERR_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(channel_hard_err_c),
        .Q(HARD_ERR),
        .R(\<const0> ));
LUT4 #(
    .INIT(16'hFFFE)) 
     CHANNEL_SOFT_ERR_Buffer_i_1
       (.I0(p_0_in),
        .I1(p_1_in2_in),
        .I2(\n_0_soft_err_r_reg[0] ),
        .I3(\n_0_soft_err_r_reg[3] ),
        .O(channel_soft_err_c));
FDRE #(
    .INIT(1'b1)) 
     CHANNEL_SOFT_ERR_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(channel_soft_err_c),
        .Q(SOFT_ERR),
        .R(\<const0> ));
GND GND
       (.G(\<const0> ));
LUT3 #(
    .INIT(8'hBF)) 
     RESET_CHANNEL_Buffer_i_1
       (.I0(POWER_DOWN),
        .I1(lane_up_r[1]),
        .I2(lane_up_r[0]),
        .O(RESET_CHANNEL_Buffer0));
FDRE #(
    .INIT(1'b1)) 
     RESET_CHANNEL_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(RESET_CHANNEL_Buffer0),
        .Q(RESET_CHANNEL),
        .R(\<const0> ));
VCC VCC
       (.P(\<const1> ));
FDRE \hard_err_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I5[1]),
        .Q(hard_err_r[0]),
        .R(\<const0> ));
FDRE \hard_err_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I5[0]),
        .Q(hard_err_r[1]),
        .R(\<const0> ));
FDRE \lane_up_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(LANE_UP[0]),
        .Q(lane_up_r[0]),
        .R(\<const0> ));
FDRE \lane_up_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(LANE_UP[1]),
        .Q(lane_up_r[1]),
        .R(\<const0> ));
FDRE \soft_err_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I4[3]),
        .Q(\n_0_soft_err_r_reg[0] ),
        .R(\<const0> ));
FDRE \soft_err_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I4[2]),
        .Q(p_0_in),
        .R(\<const0> ));
FDRE \soft_err_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I4[1]),
        .Q(p_1_in2_in),
        .R(\<const0> ));
FDRE \soft_err_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I4[0]),
        .Q(\n_0_soft_err_r_reg[3] ),
        .R(\<const0> ));
endmodule

module data_mgtdata_mgt_CHANNEL_INIT_SM
   (O1,
    O2,
    EN_CHAN_SYNC,
    GEN_VER,
    O6,
    START_RX,
    RESET,
    new_pkt_r,
    R,
    user_clk,
    I1,
    SS,
    I2,
    sys_reset_out,
    good_as_r0,
    txver_count_r0,
    S_AXI_TX_TLAST,
    I3,
    TX_DST_RDY_N,
    S_AXI_TX_TVALID,
    RESET_CHANNEL,
    Q,
    I6);
  output O1;
  output O2;
  output EN_CHAN_SYNC;
  output GEN_VER;
  output O6;
  output START_RX;
  output RESET;
  output new_pkt_r;
  output R;
  input user_clk;
  input I1;
  input [0:0]SS;
  input I2;
  input sys_reset_out;
  input good_as_r0;
  input txver_count_r0;
  input S_AXI_TX_TLAST;
  input I3;
  input TX_DST_RDY_N;
  input S_AXI_TX_TVALID;
  input RESET_CHANNEL;
  input [1:0]Q;
  input [1:0]I6;

  wire \<const0> ;
  wire \<const1> ;
  wire D;
  wire EN_CHAN_SYNC;
  wire GEN_VER;
  wire GND_2;
  wire I1;
  wire I2;
  wire I3;
  wire [1:0]I6;
  wire O1;
  wire O2;
  wire O6;
  wire [1:0]Q;
  wire R;
  wire RESET;
  wire RESET_CHANNEL;
  wire [0:0]SS;
  wire START_RX;
  wire START_RX_Buffer0;
  wire S_AXI_TX_TLAST;
  wire S_AXI_TX_TVALID;
  wire TX_DST_RDY_N;
  wire VCC_2;
  wire all_ch_bond_done_r;
  wire all_channel_bond_load_r;
  wire all_lanes_v_r;
  wire bad_as_r;
  wire bad_v_r;
  wire bad_v_r0;
  wire bond_passed_r;
  wire [15:15]bonding_watchdog_r;
  wire bonding_watchdog_r0;
  wire [0:1]ch_bond_done_r;
  wire [0:1]channel_bond_load_r;
  wire channel_bond_r;
  wire check_bond_r;
  wire four_as_r;
  wire [0:10]free_count_r_reg__0;
  wire good_as_r;
  wire good_as_r0;
  wire got_first_v_r;
  wire [10:0]minusOp;
  wire \n_0_a_count_r[0]_i_1 ;
  wire \n_0_a_count_r[1]_i_1 ;
  wire \n_0_a_count_r[2]_i_1 ;
  wire \n_0_a_count_r_reg[1] ;
  wire \n_0_a_count_r_reg[2] ;
  wire n_0_all_ch_bond_done_r_i_1;
  wire n_0_all_channel_bond_load_r_i_1;
  wire \n_0_bonding_watchdog_r_reg[14]_srl15 ;
  wire \n_0_bonding_watchdog_r_reg[14]_srl15_i_2 ;
  wire \n_0_bonding_watchdog_r_reg[14]_srl15_i_3 ;
  wire \n_0_free_count_r[0]_i_2 ;
  wire \n_0_free_count_r[4]_i_2 ;
  wire \n_0_free_count_r[9]_i_1 ;
  wire n_0_got_first_v_r_i_1;
  wire n_0_reset_lanes_flop_0_i_i_2;
  wire \n_0_rxver_count_r_reg[1]_srl2 ;
  wire \n_0_rxver_count_r_reg[1]_srl2_i_1 ;
  wire \n_0_txver_count_r_reg[6]_srl7 ;
  wire \n_0_v_count_r_reg[14]_srl15 ;
  wire \n_0_verify_watchdog_r_reg[14]_srl15 ;
  wire \n_0_verify_watchdog_r_reg[14]_srl15_i_1 ;
  wire new_pkt_r;
  wire next_channel_bond_c;
  wire next_check_bond_c;
  wire next_ready_c;
  wire next_verify_c;
  wire [15:15]p_2_out;
  wire ready_r;
  wire ready_r2;
  wire [2:2]rxver_count_r;
  wire sys_reset_out;
  wire [7:7]txver_count_r;
  wire txver_count_r0;
  wire user_clk;
  wire [15:15]v_count_r;
  wire [15:15]verify_watchdog_r;
  wire wait_for_lane_up_r;

FDRE CHANNEL_UP_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(ready_r2),
        .Q(O6),
        .R(\<const0> ));
LUT1 #(
    .INIT(2'h1)) 
     FRAME_ERR_Buffer_i_1
       (.I0(START_RX),
        .O(RESET));
GND GND
       (.G(\<const0> ));
GND GND_1
       (.G(GND_2));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair119" *) 
   LUT1 #(
    .INIT(2'h1)) 
     START_RX_Buffer_i_1
       (.I0(wait_for_lane_up_r),
        .O(START_RX_Buffer0));
FDRE START_RX_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(START_RX_Buffer0),
        .Q(START_RX),
        .R(sys_reset_out));
VCC VCC
       (.P(\<const1> ));
VCC VCC_1
       (.P(VCC_2));
(* SOFT_HLUTNM = "soft_lutpair122" *) 
   LUT5 #(
    .INIT(32'h6AAA0000)) 
     \a_count_r[0]_i_1 
       (.I0(four_as_r),
        .I1(good_as_r),
        .I2(\n_0_a_count_r_reg[2] ),
        .I3(\n_0_a_count_r_reg[1] ),
        .I4(check_bond_r),
        .O(\n_0_a_count_r[0]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair122" *) 
   LUT4 #(
    .INIT(16'h6A00)) 
     \a_count_r[1]_i_1 
       (.I0(\n_0_a_count_r_reg[1] ),
        .I1(good_as_r),
        .I2(\n_0_a_count_r_reg[2] ),
        .I3(check_bond_r),
        .O(\n_0_a_count_r[1]_i_1 ));
LUT3 #(
    .INIT(8'h60)) 
     \a_count_r[2]_i_1 
       (.I0(\n_0_a_count_r_reg[2] ),
        .I1(good_as_r),
        .I2(check_bond_r),
        .O(\n_0_a_count_r[2]_i_1 ));
FDRE \a_count_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_a_count_r[0]_i_1 ),
        .Q(four_as_r),
        .R(\<const0> ));
FDRE \a_count_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_a_count_r[1]_i_1 ),
        .Q(\n_0_a_count_r_reg[1] ),
        .R(\<const0> ));
FDRE \a_count_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_a_count_r[2]_i_1 ),
        .Q(\n_0_a_count_r_reg[2] ),
        .R(\<const0> ));
LUT3 #(
    .INIT(8'h80)) 
     all_ch_bond_done_r_i_1
       (.I0(channel_bond_r),
        .I1(ch_bond_done_r[0]),
        .I2(ch_bond_done_r[1]),
        .O(n_0_all_ch_bond_done_r_i_1));
FDRE all_ch_bond_done_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_all_ch_bond_done_r_i_1),
        .Q(all_ch_bond_done_r),
        .R(\<const0> ));
LUT2 #(
    .INIT(4'h8)) 
     all_channel_bond_load_r_i_1
       (.I0(channel_bond_load_r[1]),
        .I1(channel_bond_load_r[0]),
        .O(n_0_all_channel_bond_load_r_i_1));
FDRE all_channel_bond_load_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_all_channel_bond_load_r_i_1),
        .Q(all_channel_bond_load_r),
        .R(\<const0> ));
FDRE all_lanes_v_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I1),
        .Q(all_lanes_v_r),
        .R(\<const0> ));
FDRE bad_as_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I2),
        .Q(bad_as_r),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair124" *) 
   LUT3 #(
    .INIT(8'h28)) 
     bad_v_r_i_1
       (.I0(got_first_v_r),
        .I1(v_count_r),
        .I2(all_lanes_v_r),
        .O(bad_v_r0));
FDRE bad_v_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(bad_v_r0),
        .Q(bad_v_r),
        .R(\<const0> ));
FDRE bond_passed_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(all_ch_bond_done_r),
        .Q(bond_passed_r),
        .R(\<const0> ));
(* srl_bus_name = "U0/\data_mgt_global_logic_i/channel_init_sm_i/bonding_watchdog_r_reg " *) 
   (* srl_name = "U0/\data_mgt_global_logic_i/channel_init_sm_i/bonding_watchdog_r_reg[14]_srl15 " *) 
   SRL16E \bonding_watchdog_r_reg[14]_srl15 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const1> ),
        .A3(\<const1> ),
        .CE(bonding_watchdog_r0),
        .CLK(user_clk),
        .D(channel_bond_r),
        .Q(\n_0_bonding_watchdog_r_reg[14]_srl15 ));
LUT6 #(
    .INIT(64'hFFFFFFFF040404FF)) 
     \bonding_watchdog_r_reg[14]_srl15_i_1 
       (.I0(free_count_r_reg__0[0]),
        .I1(\n_0_bonding_watchdog_r_reg[14]_srl15_i_2 ),
        .I2(free_count_r_reg__0[1]),
        .I3(check_bond_r),
        .I4(channel_bond_r),
        .I5(all_channel_bond_load_r),
        .O(bonding_watchdog_r0));
LUT6 #(
    .INIT(64'h0000000000000001)) 
     \bonding_watchdog_r_reg[14]_srl15_i_2 
       (.I0(free_count_r_reg__0[2]),
        .I1(free_count_r_reg__0[4]),
        .I2(free_count_r_reg__0[9]),
        .I3(free_count_r_reg__0[10]),
        .I4(\n_0_bonding_watchdog_r_reg[14]_srl15_i_3 ),
        .I5(free_count_r_reg__0[3]),
        .O(\n_0_bonding_watchdog_r_reg[14]_srl15_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair123" *) 
   LUT4 #(
    .INIT(16'hFFFE)) 
     \bonding_watchdog_r_reg[14]_srl15_i_3 
       (.I0(free_count_r_reg__0[5]),
        .I1(free_count_r_reg__0[6]),
        .I2(free_count_r_reg__0[7]),
        .I3(free_count_r_reg__0[8]),
        .O(\n_0_bonding_watchdog_r_reg[14]_srl15_i_3 ));
FDRE \bonding_watchdog_r_reg[15] 
       (.C(user_clk),
        .CE(bonding_watchdog_r0),
        .D(\n_0_bonding_watchdog_r_reg[14]_srl15 ),
        .Q(bonding_watchdog_r),
        .R(\<const0> ));
FDRE \ch_bond_done_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I6[1]),
        .Q(ch_bond_done_r[0]),
        .R(\<const0> ));
FDRE \ch_bond_done_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I6[0]),
        .Q(ch_bond_done_r[1]),
        .R(\<const0> ));
FDRE \channel_bond_load_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(Q[1]),
        .Q(channel_bond_load_r[0]),
        .R(\<const0> ));
FDRE \channel_bond_load_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(Q[0]),
        .Q(channel_bond_load_r[1]),
        .R(\<const0> ));
LUT5 #(
    .INIT(32'hFFFFF444)) 
     channel_bond_r_i_1
       (.I0(bond_passed_r),
        .I1(channel_bond_r),
        .I2(check_bond_r),
        .I3(bad_as_r),
        .I4(wait_for_lane_up_r),
        .O(next_channel_bond_c));
FDRE channel_bond_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_channel_bond_c),
        .Q(channel_bond_r),
        .R(SS));
LUT5 #(
    .INIT(32'hFF040404)) 
     check_bond_r_i_1
       (.I0(bad_as_r),
        .I1(check_bond_r),
        .I2(four_as_r),
        .I3(bond_passed_r),
        .I4(channel_bond_r),
        .O(next_check_bond_c));
FDRE check_bond_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_check_bond_c),
        .Q(check_bond_r),
        .R(SS));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     en_chan_sync_flop_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(channel_bond_r),
        .Q(EN_CHAN_SYNC),
        .R(GND_2));
(* SOFT_HLUTNM = "soft_lutpair121" *) 
   LUT5 #(
    .INIT(32'hAAAAA9AA)) 
     \free_count_r[0]_i_1 
       (.I0(free_count_r_reg__0[0]),
        .I1(free_count_r_reg__0[1]),
        .I2(free_count_r_reg__0[2]),
        .I3(\n_0_free_count_r[0]_i_2 ),
        .I4(free_count_r_reg__0[3]),
        .O(minusOp[10]));
LUT6 #(
    .INIT(64'h0000000000000001)) 
     \free_count_r[0]_i_2 
       (.I0(free_count_r_reg__0[4]),
        .I1(free_count_r_reg__0[9]),
        .I2(free_count_r_reg__0[10]),
        .I3(\n_0_free_count_r[4]_i_2 ),
        .I4(free_count_r_reg__0[6]),
        .I5(free_count_r_reg__0[5]),
        .O(\n_0_free_count_r[0]_i_2 ));
LUT1 #(
    .INIT(2'h1)) 
     \free_count_r[10]_i_1 
       (.I0(free_count_r_reg__0[10]),
        .O(minusOp[0]));
(* SOFT_HLUTNM = "soft_lutpair121" *) 
   LUT4 #(
    .INIT(16'hAA9A)) 
     \free_count_r[1]_i_1 
       (.I0(free_count_r_reg__0[1]),
        .I1(free_count_r_reg__0[3]),
        .I2(\n_0_free_count_r[0]_i_2 ),
        .I3(free_count_r_reg__0[2]),
        .O(minusOp[9]));
(* SOFT_HLUTNM = "soft_lutpair125" *) 
   LUT3 #(
    .INIT(8'hB4)) 
     \free_count_r[2]_i_1 
       (.I0(free_count_r_reg__0[3]),
        .I1(\n_0_free_count_r[0]_i_2 ),
        .I2(free_count_r_reg__0[2]),
        .O(minusOp[8]));
(* SOFT_HLUTNM = "soft_lutpair125" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \free_count_r[3]_i_1 
       (.I0(free_count_r_reg__0[3]),
        .I1(\n_0_free_count_r[0]_i_2 ),
        .O(minusOp[7]));
LUT6 #(
    .INIT(64'hFFFFFFFE00000001)) 
     \free_count_r[4]_i_1 
       (.I0(free_count_r_reg__0[10]),
        .I1(free_count_r_reg__0[9]),
        .I2(free_count_r_reg__0[6]),
        .I3(free_count_r_reg__0[5]),
        .I4(\n_0_free_count_r[4]_i_2 ),
        .I5(free_count_r_reg__0[4]),
        .O(minusOp[6]));
(* SOFT_HLUTNM = "soft_lutpair123" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \free_count_r[4]_i_2 
       (.I0(free_count_r_reg__0[8]),
        .I1(free_count_r_reg__0[7]),
        .O(\n_0_free_count_r[4]_i_2 ));
LUT6 #(
    .INIT(64'hFFFFFFFE00000001)) 
     \free_count_r[5]_i_1 
       (.I0(free_count_r_reg__0[6]),
        .I1(free_count_r_reg__0[9]),
        .I2(free_count_r_reg__0[10]),
        .I3(free_count_r_reg__0[8]),
        .I4(free_count_r_reg__0[7]),
        .I5(free_count_r_reg__0[5]),
        .O(minusOp[5]));
(* SOFT_HLUTNM = "soft_lutpair120" *) 
   LUT5 #(
    .INIT(32'hFFFE0001)) 
     \free_count_r[6]_i_1 
       (.I0(free_count_r_reg__0[7]),
        .I1(free_count_r_reg__0[8]),
        .I2(free_count_r_reg__0[10]),
        .I3(free_count_r_reg__0[9]),
        .I4(free_count_r_reg__0[6]),
        .O(minusOp[4]));
(* SOFT_HLUTNM = "soft_lutpair120" *) 
   LUT4 #(
    .INIT(16'hFE01)) 
     \free_count_r[7]_i_1 
       (.I0(free_count_r_reg__0[8]),
        .I1(free_count_r_reg__0[9]),
        .I2(free_count_r_reg__0[10]),
        .I3(free_count_r_reg__0[7]),
        .O(minusOp[3]));
(* SOFT_HLUTNM = "soft_lutpair126" *) 
   LUT3 #(
    .INIT(8'hE1)) 
     \free_count_r[8]_i_1 
       (.I0(free_count_r_reg__0[10]),
        .I1(free_count_r_reg__0[9]),
        .I2(free_count_r_reg__0[8]),
        .O(minusOp[2]));
(* SOFT_HLUTNM = "soft_lutpair126" *) 
   LUT2 #(
    .INIT(4'h9)) 
     \free_count_r[9]_i_1 
       (.I0(free_count_r_reg__0[10]),
        .I1(free_count_r_reg__0[9]),
        .O(\n_0_free_count_r[9]_i_1 ));
(* counter = "29" *) 
   FDSE \free_count_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(minusOp[10]),
        .Q(free_count_r_reg__0[0]),
        .S(SS));
(* counter = "29" *) 
   FDSE \free_count_r_reg[10] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(minusOp[0]),
        .Q(free_count_r_reg__0[10]),
        .S(SS));
(* counter = "29" *) 
   FDSE \free_count_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(minusOp[9]),
        .Q(free_count_r_reg__0[1]),
        .S(SS));
(* counter = "29" *) 
   FDSE \free_count_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(minusOp[8]),
        .Q(free_count_r_reg__0[2]),
        .S(SS));
(* counter = "29" *) 
   FDSE \free_count_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(minusOp[7]),
        .Q(free_count_r_reg__0[3]),
        .S(SS));
(* counter = "29" *) 
   FDSE \free_count_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(minusOp[6]),
        .Q(free_count_r_reg__0[4]),
        .S(SS));
(* counter = "29" *) 
   FDSE \free_count_r_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(minusOp[5]),
        .Q(free_count_r_reg__0[5]),
        .S(SS));
(* counter = "29" *) 
   FDSE \free_count_r_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(minusOp[4]),
        .Q(free_count_r_reg__0[6]),
        .S(SS));
(* counter = "29" *) 
   FDSE \free_count_r_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(minusOp[3]),
        .Q(free_count_r_reg__0[7]),
        .S(SS));
(* counter = "29" *) 
   FDSE \free_count_r_reg[8] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(minusOp[2]),
        .Q(free_count_r_reg__0[8]),
        .S(SS));
(* counter = "29" *) 
   FDSE \free_count_r_reg[9] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_free_count_r[9]_i_1 ),
        .Q(free_count_r_reg__0[9]),
        .S(SS));
LUT1 #(
    .INIT(2'h1)) 
     gen_cc_flop_0_i_i_1
       (.I0(O6),
        .O(R));
FDRE good_as_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(good_as_r0),
        .Q(good_as_r),
        .R(\<const0> ));
LUT3 #(
    .INIT(8'hA8)) 
     got_first_v_r_i_1
       (.I0(GEN_VER),
        .I1(got_first_v_r),
        .I2(all_lanes_v_r),
        .O(n_0_got_first_v_r_i_1));
FDRE got_first_v_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_got_first_v_r_i_1),
        .Q(got_first_v_r),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'h00000000C044C0C0)) 
     new_pkt_r_i_1
       (.I0(S_AXI_TX_TLAST),
        .I1(O6),
        .I2(I3),
        .I3(TX_DST_RDY_N),
        .I4(S_AXI_TX_TVALID),
        .I5(sys_reset_out),
        .O(new_pkt_r));
FDRE ready_r2_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(ready_r),
        .Q(ready_r2),
        .R(\<const0> ));
LUT4 #(
    .INIT(16'hEAAA)) 
     ready_r_i_1__1
       (.I0(ready_r),
        .I1(GEN_VER),
        .I2(rxver_count_r),
        .I3(txver_count_r),
        .O(next_ready_c));
FDRE ready_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_ready_c),
        .Q(ready_r),
        .R(SS));
(* BOX_TYPE = "PRIMITIVE" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     reset_lanes_flop_0_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(D),
        .Q(O1),
        .R(GND_2));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFF200)) 
     reset_lanes_flop_0_i_i_1
       (.I0(bad_v_r),
        .I1(rxver_count_r),
        .I2(verify_watchdog_r),
        .I3(GEN_VER),
        .I4(n_0_reset_lanes_flop_0_i_i_2),
        .I5(sys_reset_out),
        .O(D));
(* SOFT_HLUTNM = "soft_lutpair119" *) 
   LUT5 #(
    .INIT(32'hFFF44444)) 
     reset_lanes_flop_0_i_i_2
       (.I0(wait_for_lane_up_r),
        .I1(RESET_CHANNEL),
        .I2(check_bond_r),
        .I3(channel_bond_r),
        .I4(bonding_watchdog_r),
        .O(n_0_reset_lanes_flop_0_i_i_2));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     reset_lanes_flop_1_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(D),
        .Q(O2),
        .R(GND_2));
(* srl_bus_name = "U0/\data_mgt_global_logic_i/channel_init_sm_i/rxver_count_r_reg " *) 
   (* srl_name = "U0/\data_mgt_global_logic_i/channel_init_sm_i/rxver_count_r_reg[1]_srl2 " *) 
   SRL16E \rxver_count_r_reg[1]_srl2 
       (.A0(\<const1> ),
        .A1(\<const0> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\n_0_rxver_count_r_reg[1]_srl2_i_1 ),
        .CLK(user_clk),
        .D(GEN_VER),
        .Q(\n_0_rxver_count_r_reg[1]_srl2 ));
LUT3 #(
    .INIT(8'h8F)) 
     \rxver_count_r_reg[1]_srl2_i_1 
       (.I0(v_count_r),
        .I1(all_lanes_v_r),
        .I2(GEN_VER),
        .O(\n_0_rxver_count_r_reg[1]_srl2_i_1 ));
FDRE \rxver_count_r_reg[2] 
       (.C(user_clk),
        .CE(\n_0_rxver_count_r_reg[1]_srl2_i_1 ),
        .D(\n_0_rxver_count_r_reg[1]_srl2 ),
        .Q(rxver_count_r),
        .R(\<const0> ));
(* srl_bus_name = "U0/\data_mgt_global_logic_i/channel_init_sm_i/txver_count_r_reg " *) 
   (* srl_name = "U0/\data_mgt_global_logic_i/channel_init_sm_i/txver_count_r_reg[6]_srl7 " *) 
   SRL16E \txver_count_r_reg[6]_srl7 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const1> ),
        .A3(\<const0> ),
        .CE(txver_count_r0),
        .CLK(user_clk),
        .D(GEN_VER),
        .Q(\n_0_txver_count_r_reg[6]_srl7 ));
FDRE \txver_count_r_reg[7] 
       (.C(user_clk),
        .CE(txver_count_r0),
        .D(\n_0_txver_count_r_reg[6]_srl7 ),
        .Q(txver_count_r),
        .R(\<const0> ));
(* srl_bus_name = "U0/\data_mgt_global_logic_i/channel_init_sm_i/v_count_r_reg " *) 
   (* srl_name = "U0/\data_mgt_global_logic_i/channel_init_sm_i/v_count_r_reg[14]_srl15 " *) 
   SRL16E \v_count_r_reg[14]_srl15 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const1> ),
        .A3(\<const1> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(p_2_out),
        .Q(\n_0_v_count_r_reg[14]_srl15 ));
(* SOFT_HLUTNM = "soft_lutpair124" *) 
   LUT4 #(
    .INIT(16'h8F88)) 
     \v_count_r_reg[14]_srl15_i_1 
       (.I0(v_count_r),
        .I1(GEN_VER),
        .I2(got_first_v_r),
        .I3(all_lanes_v_r),
        .O(p_2_out));
FDRE \v_count_r_reg[15] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_v_count_r_reg[14]_srl15 ),
        .Q(v_count_r),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'h70FF707070707070)) 
     verify_r_i_2
       (.I0(rxver_count_r),
        .I1(txver_count_r),
        .I2(GEN_VER),
        .I3(bad_as_r),
        .I4(check_bond_r),
        .I5(four_as_r),
        .O(next_verify_c));
FDRE verify_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_verify_c),
        .Q(GEN_VER),
        .R(SS));
(* srl_bus_name = "U0/\data_mgt_global_logic_i/channel_init_sm_i/verify_watchdog_r_reg " *) 
   (* srl_name = "U0/\data_mgt_global_logic_i/channel_init_sm_i/verify_watchdog_r_reg[14]_srl15 " *) 
   SRL16E \verify_watchdog_r_reg[14]_srl15 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const1> ),
        .A3(\<const1> ),
        .CE(\n_0_verify_watchdog_r_reg[14]_srl15_i_1 ),
        .CLK(user_clk),
        .D(GEN_VER),
        .Q(\n_0_verify_watchdog_r_reg[14]_srl15 ));
LUT6 #(
    .INIT(64'h00000010FFFFFFFF)) 
     \verify_watchdog_r_reg[14]_srl15_i_1 
       (.I0(free_count_r_reg__0[0]),
        .I1(free_count_r_reg__0[3]),
        .I2(\n_0_free_count_r[0]_i_2 ),
        .I3(free_count_r_reg__0[2]),
        .I4(free_count_r_reg__0[1]),
        .I5(GEN_VER),
        .O(\n_0_verify_watchdog_r_reg[14]_srl15_i_1 ));
FDRE \verify_watchdog_r_reg[15] 
       (.C(user_clk),
        .CE(\n_0_verify_watchdog_r_reg[14]_srl15_i_1 ),
        .D(\n_0_verify_watchdog_r_reg[14]_srl15 ),
        .Q(verify_watchdog_r),
        .R(\<const0> ));
FDRE wait_for_lane_up_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(SS),
        .Q(wait_for_lane_up_r),
        .R(\<const0> ));
endmodule

module data_mgtdata_mgt_ERR_DETECT_4BYTE
   (O4,
    begin_r0,
    O21,
    good_cnt_r3,
    user_clk,
    hard_err_gt0,
    ENABLE_ERR_DETECT,
    I1,
    I21,
    I22,
    I23,
    I24);
  output [0:0]O4;
  output begin_r0;
  output [1:0]O21;
  input good_cnt_r3;
  input user_clk;
  input hard_err_gt0;
  input ENABLE_ERR_DETECT;
  input I1;
  input I21;
  input I22;
  input I23;
  input I24;

  wire \<const0> ;
  wire \<const1> ;
  wire ENABLE_ERR_DETECT;
  wire I1;
  wire I21;
  wire I22;
  wire I23;
  wire I24;
  wire [1:0]O21;
  wire [0:0]O4;
  wire begin_r0;
  wire cnt_good_code_r;
  wire cnt_soft_err_r;
  wire [1:0]err_cnt_r;
  wire good_cnt_r3;
  wire [3:0]good_cnt_r_reg;
  wire hard_err_frm_soft_err;
  wire hard_err_gt;
  wire hard_err_gt0;
  wire n_0_cnt_good_code_r_i_2__0;
  wire n_0_cnt_good_code_r_i_3__0;
  wire \n_0_err_cnt_r[0]_i_1__0 ;
  wire \n_0_err_cnt_r[1]_i_1__0 ;
  wire \n_0_err_cnt_r[2]_i_1__0 ;
  wire \n_0_err_cnt_r[2]_i_2__0 ;
  wire \n_0_good_cnt_r[3]_i_1__0 ;
  wire \n_0_soft_err_r_reg[0] ;
  wire \n_0_soft_err_r_reg[3] ;
  wire next_good_code_c;
  wire next_soft_err_c;
  wire next_start_c;
  wire p_0_in;
  wire p_1_in;
  wire p_2_in;
  wire [1:0]p_3_out;
  wire [3:0]plusOp;
  wire start_r;
  wire user_clk;

GND GND
       (.G(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair179" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \SOFT_ERR_Buffer[0]_i_1__0 
       (.I0(p_2_in),
        .I1(\n_0_soft_err_r_reg[0] ),
        .O(p_3_out[1]));
LUT2 #(
    .INIT(4'hE)) 
     \SOFT_ERR_Buffer[1]_i_1__0 
       (.I0(\n_0_soft_err_r_reg[3] ),
        .I1(p_1_in),
        .O(p_3_out[0]));
FDRE \SOFT_ERR_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_3_out[1]),
        .Q(O21[1]),
        .R(\<const0> ));
FDRE \SOFT_ERR_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_3_out[0]),
        .Q(O21[0]),
        .R(\<const0> ));
VCC VCC
       (.P(\<const1> ));
(* SOFT_HLUTNM = "soft_lutpair181" *) 
   LUT4 #(
    .INIT(16'hFFF4)) 
     align_r_i_1__0
       (.I0(hard_err_frm_soft_err),
        .I1(p_0_in),
        .I2(I1),
        .I3(hard_err_gt),
        .O(begin_r0));
(* SOFT_HLUTNM = "soft_lutpair177" *) 
   LUT4 #(
    .INIT(16'h8A88)) 
     cnt_good_code_r_i_1__0
       (.I0(n_0_cnt_good_code_r_i_2__0),
        .I1(cnt_soft_err_r),
        .I2(n_0_cnt_good_code_r_i_3__0),
        .I3(cnt_good_code_r),
        .O(next_good_code_c));
(* SOFT_HLUTNM = "soft_lutpair179" *) 
   LUT4 #(
    .INIT(16'h0001)) 
     cnt_good_code_r_i_2__0
       (.I0(\n_0_soft_err_r_reg[0] ),
        .I1(p_2_in),
        .I2(p_1_in),
        .I3(\n_0_soft_err_r_reg[3] ),
        .O(n_0_cnt_good_code_r_i_2__0));
(* SOFT_HLUTNM = "soft_lutpair180" *) 
   LUT4 #(
    .INIT(16'h8000)) 
     cnt_good_code_r_i_3__0
       (.I0(good_cnt_r_reg[3]),
        .I1(good_cnt_r_reg[2]),
        .I2(good_cnt_r_reg[0]),
        .I3(good_cnt_r_reg[1]),
        .O(n_0_cnt_good_code_r_i_3__0));
FDRE cnt_good_code_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_good_code_c),
        .Q(cnt_good_code_r),
        .R(good_cnt_r3));
(* SOFT_HLUTNM = "soft_lutpair177" *) 
   LUT4 #(
    .INIT(16'h5554)) 
     cnt_soft_err_r_i_1__0
       (.I0(n_0_cnt_good_code_r_i_2__0),
        .I1(cnt_soft_err_r),
        .I2(start_r),
        .I3(cnt_good_code_r),
        .O(next_soft_err_c));
FDRE cnt_soft_err_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_soft_err_c),
        .Q(cnt_soft_err_r),
        .R(good_cnt_r3));
(* SOFT_HLUTNM = "soft_lutpair176" *) 
   LUT5 #(
    .INIT(32'hAAAA5AA4)) 
     \err_cnt_r[0]_i_1__0 
       (.I0(err_cnt_r[0]),
        .I1(err_cnt_r[1]),
        .I2(cnt_soft_err_r),
        .I3(\n_0_err_cnt_r[2]_i_2__0 ),
        .I4(p_0_in),
        .O(\n_0_err_cnt_r[0]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCC6CC8)) 
     \err_cnt_r[1]_i_1__0 
       (.I0(err_cnt_r[0]),
        .I1(err_cnt_r[1]),
        .I2(cnt_soft_err_r),
        .I3(\n_0_err_cnt_r[2]_i_2__0 ),
        .I4(p_0_in),
        .O(\n_0_err_cnt_r[1]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair176" *) 
   LUT5 #(
    .INIT(32'hFFFF8000)) 
     \err_cnt_r[2]_i_1__0 
       (.I0(err_cnt_r[0]),
        .I1(err_cnt_r[1]),
        .I2(cnt_soft_err_r),
        .I3(\n_0_err_cnt_r[2]_i_2__0 ),
        .I4(p_0_in),
        .O(\n_0_err_cnt_r[2]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair178" *) 
   LUT4 #(
    .INIT(16'hEEEF)) 
     \err_cnt_r[2]_i_2__0 
       (.I0(good_cnt_r_reg[1]),
        .I1(good_cnt_r_reg[0]),
        .I2(good_cnt_r_reg[3]),
        .I3(good_cnt_r_reg[2]),
        .O(\n_0_err_cnt_r[2]_i_2__0 ));
FDRE \err_cnt_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_err_cnt_r[0]_i_1__0 ),
        .Q(err_cnt_r[0]),
        .R(good_cnt_r3));
FDRE \err_cnt_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_err_cnt_r[1]_i_1__0 ),
        .Q(err_cnt_r[1]),
        .R(good_cnt_r3));
FDRE \err_cnt_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_err_cnt_r[2]_i_1__0 ),
        .Q(p_0_in),
        .R(good_cnt_r3));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair182" *) 
   LUT1 #(
    .INIT(2'h1)) 
     \good_cnt_r[0]_i_1__0 
       (.I0(good_cnt_r_reg[0]),
        .O(plusOp[0]));
(* SOFT_HLUTNM = "soft_lutpair182" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \good_cnt_r[1]_i_1__0 
       (.I0(good_cnt_r_reg[0]),
        .I1(good_cnt_r_reg[1]),
        .O(plusOp[1]));
(* SOFT_HLUTNM = "soft_lutpair180" *) 
   LUT3 #(
    .INIT(8'h6A)) 
     \good_cnt_r[2]_i_1__0 
       (.I0(good_cnt_r_reg[2]),
        .I1(good_cnt_r_reg[1]),
        .I2(good_cnt_r_reg[0]),
        .O(plusOp[2]));
LUT4 #(
    .INIT(16'hEFFF)) 
     \good_cnt_r[3]_i_1__0 
       (.I0(start_r),
        .I1(cnt_soft_err_r),
        .I2(ENABLE_ERR_DETECT),
        .I3(cnt_good_code_r),
        .O(\n_0_good_cnt_r[3]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair178" *) 
   LUT4 #(
    .INIT(16'h6AAA)) 
     \good_cnt_r[3]_i_2__0 
       (.I0(good_cnt_r_reg[3]),
        .I1(good_cnt_r_reg[0]),
        .I2(good_cnt_r_reg[1]),
        .I3(good_cnt_r_reg[2]),
        .O(plusOp[3]));
(* counter = "17" *) 
   FDRE \good_cnt_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(plusOp[0]),
        .Q(good_cnt_r_reg[0]),
        .R(\n_0_good_cnt_r[3]_i_1__0 ));
(* counter = "17" *) 
   FDRE \good_cnt_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(plusOp[1]),
        .Q(good_cnt_r_reg[1]),
        .R(\n_0_good_cnt_r[3]_i_1__0 ));
(* counter = "17" *) 
   FDRE \good_cnt_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(plusOp[2]),
        .Q(good_cnt_r_reg[2]),
        .R(\n_0_good_cnt_r[3]_i_1__0 ));
(* counter = "17" *) 
   FDRE \good_cnt_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(plusOp[3]),
        .Q(good_cnt_r_reg[3]),
        .R(\n_0_good_cnt_r[3]_i_1__0 ));
FDRE hard_err_frm_soft_err_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_0_in),
        .Q(hard_err_frm_soft_err),
        .R(good_cnt_r3));
FDRE hard_err_gt_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(hard_err_gt0),
        .Q(hard_err_gt),
        .R(good_cnt_r3));
(* SOFT_HLUTNM = "soft_lutpair181" *) 
   LUT3 #(
    .INIT(8'hBA)) 
     \hard_err_r[1]_i_1 
       (.I0(hard_err_gt),
        .I1(hard_err_frm_soft_err),
        .I2(p_0_in),
        .O(O4));
FDRE \soft_err_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I21),
        .Q(\n_0_soft_err_r_reg[0] ),
        .R(good_cnt_r3));
FDRE \soft_err_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I22),
        .Q(p_2_in),
        .R(good_cnt_r3));
FDRE \soft_err_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I23),
        .Q(p_1_in),
        .R(good_cnt_r3));
FDRE \soft_err_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24),
        .Q(\n_0_soft_err_r_reg[3] ),
        .R(good_cnt_r3));
LUT4 #(
    .INIT(16'hA888)) 
     start_r_i_1__0
       (.I0(n_0_cnt_good_code_r_i_2__0),
        .I1(start_r),
        .I2(cnt_good_code_r),
        .I3(n_0_cnt_good_code_r_i_3__0),
        .O(next_start_c));
FDSE start_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_start_c),
        .Q(start_r),
        .S(good_cnt_r3));
endmodule

(* ORIG_REF_NAME = "data_mgt_ERR_DETECT_4BYTE" *) 
module data_mgtdata_mgt_ERR_DETECT_4BYTE_7
   (O5,
    begin_r0,
    O17,
    good_cnt_r3,
    user_clk,
    hard_err_gt0,
    ENABLE_ERR_DETECT,
    I1,
    I20,
    I21,
    I22,
    I23);
  output [0:0]O5;
  output begin_r0;
  output [1:0]O17;
  input good_cnt_r3;
  input user_clk;
  input hard_err_gt0;
  input ENABLE_ERR_DETECT;
  input I1;
  input I20;
  input I21;
  input I22;
  input I23;

  wire \<const0> ;
  wire \<const1> ;
  wire ENABLE_ERR_DETECT;
  wire I1;
  wire I20;
  wire I21;
  wire I22;
  wire I23;
  wire [1:0]O17;
  wire [0:0]O5;
  wire begin_r0;
  wire cnt_good_code_r;
  wire cnt_soft_err_r;
  wire [1:0]err_cnt_r;
  wire good_cnt_r3;
  wire [3:0]good_cnt_r_reg__0;
  wire hard_err_frm_soft_err;
  wire hard_err_gt;
  wire hard_err_gt0;
  wire n_0_cnt_good_code_r_i_2;
  wire n_0_cnt_good_code_r_i_3;
  wire \n_0_err_cnt_r[0]_i_1 ;
  wire \n_0_err_cnt_r[1]_i_1 ;
  wire \n_0_err_cnt_r[2]_i_1 ;
  wire \n_0_err_cnt_r[2]_i_2 ;
  wire \n_0_good_cnt_r[3]_i_1 ;
  wire \n_0_soft_err_r_reg[0] ;
  wire \n_0_soft_err_r_reg[3] ;
  wire next_good_code_c;
  wire next_soft_err_c;
  wire next_start_c;
  wire p_0_in;
  wire p_1_in;
  wire p_2_in;
  wire [1:0]p_3_out;
  wire [3:0]plusOp;
  wire start_r;
  wire user_clk;

GND GND
       (.G(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair110" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \SOFT_ERR_Buffer[0]_i_1 
       (.I0(p_2_in),
        .I1(\n_0_soft_err_r_reg[0] ),
        .O(p_3_out[1]));
LUT2 #(
    .INIT(4'hE)) 
     \SOFT_ERR_Buffer[1]_i_1 
       (.I0(\n_0_soft_err_r_reg[3] ),
        .I1(p_1_in),
        .O(p_3_out[0]));
FDRE \SOFT_ERR_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_3_out[1]),
        .Q(O17[1]),
        .R(\<const0> ));
FDRE \SOFT_ERR_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_3_out[0]),
        .Q(O17[0]),
        .R(\<const0> ));
VCC VCC
       (.P(\<const1> ));
(* SOFT_HLUTNM = "soft_lutpair112" *) 
   LUT4 #(
    .INIT(16'hFFF4)) 
     align_r_i_1
       (.I0(hard_err_frm_soft_err),
        .I1(p_0_in),
        .I2(I1),
        .I3(hard_err_gt),
        .O(begin_r0));
(* SOFT_HLUTNM = "soft_lutpair108" *) 
   LUT4 #(
    .INIT(16'h8A88)) 
     cnt_good_code_r_i_1
       (.I0(n_0_cnt_good_code_r_i_2),
        .I1(cnt_soft_err_r),
        .I2(n_0_cnt_good_code_r_i_3),
        .I3(cnt_good_code_r),
        .O(next_good_code_c));
(* SOFT_HLUTNM = "soft_lutpair110" *) 
   LUT4 #(
    .INIT(16'h0001)) 
     cnt_good_code_r_i_2
       (.I0(\n_0_soft_err_r_reg[0] ),
        .I1(p_2_in),
        .I2(p_1_in),
        .I3(\n_0_soft_err_r_reg[3] ),
        .O(n_0_cnt_good_code_r_i_2));
(* SOFT_HLUTNM = "soft_lutpair111" *) 
   LUT4 #(
    .INIT(16'h8000)) 
     cnt_good_code_r_i_3
       (.I0(good_cnt_r_reg__0[3]),
        .I1(good_cnt_r_reg__0[2]),
        .I2(good_cnt_r_reg__0[0]),
        .I3(good_cnt_r_reg__0[1]),
        .O(n_0_cnt_good_code_r_i_3));
FDRE cnt_good_code_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_good_code_c),
        .Q(cnt_good_code_r),
        .R(good_cnt_r3));
(* SOFT_HLUTNM = "soft_lutpair108" *) 
   LUT4 #(
    .INIT(16'h5554)) 
     cnt_soft_err_r_i_1
       (.I0(n_0_cnt_good_code_r_i_2),
        .I1(cnt_soft_err_r),
        .I2(start_r),
        .I3(cnt_good_code_r),
        .O(next_soft_err_c));
FDRE cnt_soft_err_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_soft_err_c),
        .Q(cnt_soft_err_r),
        .R(good_cnt_r3));
(* SOFT_HLUTNM = "soft_lutpair107" *) 
   LUT5 #(
    .INIT(32'hAAAA5AA4)) 
     \err_cnt_r[0]_i_1 
       (.I0(err_cnt_r[0]),
        .I1(err_cnt_r[1]),
        .I2(cnt_soft_err_r),
        .I3(\n_0_err_cnt_r[2]_i_2 ),
        .I4(p_0_in),
        .O(\n_0_err_cnt_r[0]_i_1 ));
LUT5 #(
    .INIT(32'hCCCC6CC8)) 
     \err_cnt_r[1]_i_1 
       (.I0(err_cnt_r[0]),
        .I1(err_cnt_r[1]),
        .I2(cnt_soft_err_r),
        .I3(\n_0_err_cnt_r[2]_i_2 ),
        .I4(p_0_in),
        .O(\n_0_err_cnt_r[1]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair107" *) 
   LUT5 #(
    .INIT(32'hFFFF8000)) 
     \err_cnt_r[2]_i_1 
       (.I0(err_cnt_r[0]),
        .I1(err_cnt_r[1]),
        .I2(cnt_soft_err_r),
        .I3(\n_0_err_cnt_r[2]_i_2 ),
        .I4(p_0_in),
        .O(\n_0_err_cnt_r[2]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair109" *) 
   LUT4 #(
    .INIT(16'hEEEF)) 
     \err_cnt_r[2]_i_2 
       (.I0(good_cnt_r_reg__0[1]),
        .I1(good_cnt_r_reg__0[0]),
        .I2(good_cnt_r_reg__0[3]),
        .I3(good_cnt_r_reg__0[2]),
        .O(\n_0_err_cnt_r[2]_i_2 ));
FDRE \err_cnt_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_err_cnt_r[0]_i_1 ),
        .Q(err_cnt_r[0]),
        .R(good_cnt_r3));
FDRE \err_cnt_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_err_cnt_r[1]_i_1 ),
        .Q(err_cnt_r[1]),
        .R(good_cnt_r3));
FDRE \err_cnt_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_err_cnt_r[2]_i_1 ),
        .Q(p_0_in),
        .R(good_cnt_r3));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair113" *) 
   LUT1 #(
    .INIT(2'h1)) 
     \good_cnt_r[0]_i_1 
       (.I0(good_cnt_r_reg__0[0]),
        .O(plusOp[0]));
(* SOFT_HLUTNM = "soft_lutpair113" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \good_cnt_r[1]_i_1 
       (.I0(good_cnt_r_reg__0[0]),
        .I1(good_cnt_r_reg__0[1]),
        .O(plusOp[1]));
(* SOFT_HLUTNM = "soft_lutpair111" *) 
   LUT3 #(
    .INIT(8'h6A)) 
     \good_cnt_r[2]_i_1 
       (.I0(good_cnt_r_reg__0[2]),
        .I1(good_cnt_r_reg__0[1]),
        .I2(good_cnt_r_reg__0[0]),
        .O(plusOp[2]));
LUT4 #(
    .INIT(16'hEFFF)) 
     \good_cnt_r[3]_i_1 
       (.I0(start_r),
        .I1(cnt_soft_err_r),
        .I2(ENABLE_ERR_DETECT),
        .I3(cnt_good_code_r),
        .O(\n_0_good_cnt_r[3]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair109" *) 
   LUT4 #(
    .INIT(16'h6AAA)) 
     \good_cnt_r[3]_i_2 
       (.I0(good_cnt_r_reg__0[3]),
        .I1(good_cnt_r_reg__0[0]),
        .I2(good_cnt_r_reg__0[1]),
        .I3(good_cnt_r_reg__0[2]),
        .O(plusOp[3]));
(* counter = "17" *) 
   FDRE \good_cnt_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(plusOp[0]),
        .Q(good_cnt_r_reg__0[0]),
        .R(\n_0_good_cnt_r[3]_i_1 ));
(* counter = "17" *) 
   FDRE \good_cnt_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(plusOp[1]),
        .Q(good_cnt_r_reg__0[1]),
        .R(\n_0_good_cnt_r[3]_i_1 ));
(* counter = "17" *) 
   FDRE \good_cnt_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(plusOp[2]),
        .Q(good_cnt_r_reg__0[2]),
        .R(\n_0_good_cnt_r[3]_i_1 ));
(* counter = "17" *) 
   FDRE \good_cnt_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(plusOp[3]),
        .Q(good_cnt_r_reg__0[3]),
        .R(\n_0_good_cnt_r[3]_i_1 ));
FDRE hard_err_frm_soft_err_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_0_in),
        .Q(hard_err_frm_soft_err),
        .R(good_cnt_r3));
FDRE hard_err_gt_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(hard_err_gt0),
        .Q(hard_err_gt),
        .R(good_cnt_r3));
(* SOFT_HLUTNM = "soft_lutpair112" *) 
   LUT3 #(
    .INIT(8'hBA)) 
     \hard_err_r[0]_i_1 
       (.I0(hard_err_gt),
        .I1(hard_err_frm_soft_err),
        .I2(p_0_in),
        .O(O5));
FDRE \soft_err_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I20),
        .Q(\n_0_soft_err_r_reg[0] ),
        .R(good_cnt_r3));
FDRE \soft_err_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I21),
        .Q(p_2_in),
        .R(good_cnt_r3));
FDRE \soft_err_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I22),
        .Q(p_1_in),
        .R(good_cnt_r3));
FDRE \soft_err_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I23),
        .Q(\n_0_soft_err_r_reg[3] ),
        .R(good_cnt_r3));
LUT4 #(
    .INIT(16'hA888)) 
     start_r_i_1
       (.I0(n_0_cnt_good_code_r_i_2),
        .I1(start_r),
        .I2(cnt_good_code_r),
        .I3(n_0_cnt_good_code_r_i_3),
        .O(next_start_c));
FDSE start_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_start_c),
        .Q(start_r),
        .S(good_cnt_r3));
endmodule

module data_mgtdata_mgt_GLOBAL_LOGIC
   (O1,
    O2,
    EN_CHAN_SYNC,
    I14,
    D,
    GEN_A,
    O3,
    I16,
    O4,
    I15,
    O5,
    O6,
    START_RX,
    SOFT_ERR,
    HARD_ERR,
    RESET_CHANNEL,
    RESET,
    new_pkt_r,
    R,
    user_clk,
    I1,
    SS,
    I2,
    sys_reset_out,
    good_as_r0,
    POWER_DOWN,
    S_AXI_TX_TLAST,
    I3,
    TX_DST_RDY_N,
    S_AXI_TX_TVALID,
    I4,
    LANE_UP,
    Q,
    I5,
    I6);
  output O1;
  output O2;
  output EN_CHAN_SYNC;
  output [2:0]I14;
  output [2:0]D;
  output GEN_A;
  output O3;
  output [3:0]I16;
  output [3:0]O4;
  output [3:0]I15;
  output [3:0]O5;
  output O6;
  output START_RX;
  output SOFT_ERR;
  output HARD_ERR;
  output RESET_CHANNEL;
  output RESET;
  output new_pkt_r;
  output R;
  input user_clk;
  input I1;
  input [0:0]SS;
  input I2;
  input sys_reset_out;
  input good_as_r0;
  input POWER_DOWN;
  input S_AXI_TX_TLAST;
  input I3;
  input TX_DST_RDY_N;
  input S_AXI_TX_TVALID;
  input [3:0]I4;
  input [0:1]LANE_UP;
  input [1:0]Q;
  input [1:0]I5;
  input [1:0]I6;

  wire [2:0]D;
  wire EN_CHAN_SYNC;
  wire GEN_A;
  wire GEN_VER;
  wire HARD_ERR;
  wire I1;
  wire [2:0]I14;
  wire [3:0]I15;
  wire [3:0]I16;
  wire I2;
  wire I3;
  wire [3:0]I4;
  wire [1:0]I5;
  wire [1:0]I6;
  wire [0:1]LANE_UP;
  wire O1;
  wire O2;
  wire O3;
  wire [3:0]O4;
  wire [3:0]O5;
  wire O6;
  wire POWER_DOWN;
  wire [1:0]Q;
  wire R;
  wire RESET;
  wire RESET_CHANNEL;
  wire SOFT_ERR;
  wire [0:0]SS;
  wire START_RX;
  wire S_AXI_TX_TLAST;
  wire S_AXI_TX_TVALID;
  wire TX_DST_RDY_N;
  wire good_as_r0;
  wire new_pkt_r;
  wire sys_reset_out;
  wire txver_count_r0;
  wire user_clk;

data_mgtdata_mgt_CHANNEL_ERR_DETECT channel_err_detect_i
       (.HARD_ERR(HARD_ERR),
        .I4(I4),
        .I5(I5),
        .LANE_UP(LANE_UP),
        .POWER_DOWN(POWER_DOWN),
        .RESET_CHANNEL(RESET_CHANNEL),
        .SOFT_ERR(SOFT_ERR),
        .user_clk(user_clk));
data_mgtdata_mgt_CHANNEL_INIT_SM channel_init_sm_i
       (.EN_CHAN_SYNC(EN_CHAN_SYNC),
        .GEN_VER(GEN_VER),
        .I1(I1),
        .I2(I2),
        .I3(I3),
        .I6(I6),
        .O1(O1),
        .O2(O2),
        .O6(O6),
        .Q(Q),
        .R(R),
        .RESET(RESET),
        .RESET_CHANNEL(RESET_CHANNEL),
        .SS(SS),
        .START_RX(START_RX),
        .S_AXI_TX_TLAST(S_AXI_TX_TLAST),
        .S_AXI_TX_TVALID(S_AXI_TX_TVALID),
        .TX_DST_RDY_N(TX_DST_RDY_N),
        .good_as_r0(good_as_r0),
        .new_pkt_r(new_pkt_r),
        .sys_reset_out(sys_reset_out),
        .txver_count_r0(txver_count_r0),
        .user_clk(user_clk));
data_mgtdata_mgt_IDLE_AND_VER_GEN idle_and_ver_gen_i
       (.D(D),
        .GEN_A(GEN_A),
        .GEN_VER(GEN_VER),
        .I14(I14),
        .I15(I15),
        .I16(I16),
        .O3(O3),
        .O4(O4),
        .O5(O5),
        .sys_reset_out(sys_reset_out),
        .txver_count_r0(txver_count_r0),
        .user_clk(user_clk));
endmodule

(* ORIG_REF_NAME = "data_mgt_GT_WRAPPER" *) 
module data_mgtdata_mgt_GT_WRAPPER__parameterized0
   (RX_RESETDONE_OUT,
    TX_RESETDONE_OUT,
    O1,
    GT0_RXCHARISK_OUT,
    O2,
    hard_err_gt0,
    GT0_RXBYTEREALIGN_OUT,
    D,
    GT0_RXDATA_OUT,
    O3,
    O4,
    O5,
    GT1_RXCHARISK_OUT,
    O6,
    hard_err_gt0_0,
    GT1_RXBYTEREALIGN_OUT,
    O7,
    GT1_RXDATA_OUT,
    O8,
    O9,
    O10,
    GT0_RXDISPERR_OUT,
    O11,
    O12,
    O13,
    O14,
    GT1_RXDISPERR_OUT,
    O15,
    O16,
    O17,
    tx_lock,
    O18,
    O19,
    O20,
    O21,
    O22,
    O23,
    DRPRDY_OUT,
    TXN,
    TXP,
    O24,
    TX_OUT_CLK,
    DRPDO_OUT,
    GT0_RXCHARISCOMMA_OUT,
    DRPRDY_OUT_LANE1,
    DRPDO_OUT_LANE1,
    GT1_RXCHARISCOMMA_OUT,
    init_clk_in,
    user_clk,
    LINK_RESET_OUT,
    rxfsm_data_valid_r,
    I1,
    I2,
    Q,
    I3,
    I4,
    I5,
    I6,
    I7,
    GT_RESET,
    I8,
    I9,
    drpclk_in,
    DRPEN_IN,
    DRPWE_IN,
    GT_REFCLK1,
    RXN,
    RXP,
    gt_qpllclk_quad1_in,
    gt_qpllrefclk_quad1_in,
    GT0_RXCHBONDEN_IN,
    ENMCOMMAALIGN_IN,
    GT0_RXPOLARITY_IN,
    SYNC_CLK,
    POWER_DOWN,
    DRPDI_IN,
    LOOPBACK,
    GT0_TXDATA_IN,
    GT0_TXCHARISK_IN,
    DRPADDR_IN,
    DRPEN_IN_LANE1,
    DRPWE_IN_LANE1,
    ENMCOMMAALIGN_IN_LANE1,
    GT1_RXPOLARITY_IN,
    DRPDI_IN_LANE1,
    GT1_TXDATA_IN,
    GT1_TXCHARISK_IN,
    DRPADDR_IN_LANE1);
  output RX_RESETDONE_OUT;
  output TX_RESETDONE_OUT;
  output O1;
  output [3:0]GT0_RXCHARISK_OUT;
  output O2;
  output hard_err_gt0;
  output GT0_RXBYTEREALIGN_OUT;
  output [7:0]D;
  output [31:0]GT0_RXDATA_OUT;
  output [7:0]O3;
  output [7:0]O4;
  output O5;
  output [3:0]GT1_RXCHARISK_OUT;
  output O6;
  output hard_err_gt0_0;
  output GT1_RXBYTEREALIGN_OUT;
  output [7:0]O7;
  output [31:0]GT1_RXDATA_OUT;
  output [7:0]O8;
  output [7:0]O9;
  output O10;
  output [1:0]GT0_RXDISPERR_OUT;
  output O11;
  output O12;
  output O13;
  output O14;
  output [1:0]GT1_RXDISPERR_OUT;
  output O15;
  output O16;
  output O17;
  output tx_lock;
  output O18;
  output O19;
  output O20;
  output O21;
  output O22;
  output O23;
  output DRPRDY_OUT;
  output [0:1]TXN;
  output [0:1]TXP;
  output [1:0]O24;
  output TX_OUT_CLK;
  output [15:0]DRPDO_OUT;
  output [3:0]GT0_RXCHARISCOMMA_OUT;
  output DRPRDY_OUT_LANE1;
  output [15:0]DRPDO_OUT_LANE1;
  output [3:0]GT1_RXCHARISCOMMA_OUT;
  input init_clk_in;
  input user_clk;
  input LINK_RESET_OUT;
  input rxfsm_data_valid_r;
  input I1;
  input I2;
  input [0:0]Q;
  input [7:0]I3;
  input I4;
  input I5;
  input [0:0]I6;
  input [7:0]I7;
  input GT_RESET;
  input I8;
  input I9;
  input drpclk_in;
  input DRPEN_IN;
  input DRPWE_IN;
  input GT_REFCLK1;
  input [0:1]RXN;
  input [0:1]RXP;
  input gt_qpllclk_quad1_in;
  input gt_qpllrefclk_quad1_in;
  input GT0_RXCHBONDEN_IN;
  input ENMCOMMAALIGN_IN;
  input GT0_RXPOLARITY_IN;
  input SYNC_CLK;
  input POWER_DOWN;
  input [15:0]DRPDI_IN;
  input [2:0]LOOPBACK;
  input [31:0]GT0_TXDATA_IN;
  input [3:0]GT0_TXCHARISK_IN;
  input [8:0]DRPADDR_IN;
  input DRPEN_IN_LANE1;
  input DRPWE_IN_LANE1;
  input ENMCOMMAALIGN_IN_LANE1;
  input GT1_RXPOLARITY_IN;
  input [15:0]DRPDI_IN_LANE1;
  input [31:0]GT1_TXDATA_IN;
  input [3:0]GT1_TXCHARISK_IN;
  input [8:0]DRPADDR_IN_LANE1;

  wire \<const0> ;
  wire \<const1> ;
  wire CPLLLOCK;
  wire CPLL_RESET;
  wire [7:0]D;
  wire [8:0]DRPADDR_IN;
  wire [8:0]DRPADDR_IN_LANE1;
  wire [15:0]DRPDI_IN;
  wire [15:0]DRPDI_IN_LANE1;
  wire [15:0]DRPDO_OUT;
  wire [15:0]DRPDO_OUT_LANE1;
  wire DRPEN_IN;
  wire DRPEN_IN_LANE1;
  wire DRPRDY_OUT;
  wire DRPRDY_OUT_LANE1;
  wire DRPWE_IN;
  wire DRPWE_IN_LANE1;
  wire ENMCOMMAALIGN_IN;
  wire ENMCOMMAALIGN_IN_LANE1;
  wire GT0_CPLLREFCLKLOST_OUT;
  wire GT0_RXBYTEREALIGN_OUT;
  wire [3:0]GT0_RXCHARISCOMMA_OUT;
  wire [3:0]GT0_RXCHARISK_OUT;
  wire GT0_RXCHBONDEN_IN;
  wire [31:0]GT0_RXDATA_OUT;
  wire [1:0]GT0_RXDISPERR_OUT;
  wire GT0_RXPOLARITY_IN;
  wire [3:0]GT0_TXCHARISK_IN;
  wire [31:0]GT0_TXDATA_IN;
  wire GT1_CPLLREFCLKLOST_OUT;
  wire GT1_RXBYTEREALIGN_OUT;
  wire [3:0]GT1_RXCHARISCOMMA_OUT;
  wire [3:0]GT1_RXCHARISK_OUT;
  wire [31:0]GT1_RXDATA_OUT;
  wire [1:0]GT1_RXDISPERR_OUT;
  wire GT1_RXPOLARITY_IN;
  wire [3:0]GT1_TXCHARISK_IN;
  wire [31:0]GT1_TXDATA_IN;
  wire GTRXRESET;
  wire GTTXRESET;
  wire GT_REFCLK1;
  wire GT_RESET;
  wire I1;
  wire I2;
  wire [7:0]I3;
  wire I4;
  wire I5;
  wire [0:0]I6;
  wire [7:0]I7;
  wire I8;
  wire I9;
  wire LINK_RESET_OUT;
  wire [2:0]LOOPBACK;
  wire O1;
  wire O10;
  wire O11;
  wire O12;
  wire O13;
  wire O14;
  wire O15;
  wire O16;
  wire O17;
  wire O18;
  wire O19;
  wire O2;
  wire O20;
  wire O21;
  wire O22;
  wire O23;
  wire [1:0]O24;
  wire [7:0]O3;
  wire [7:0]O4;
  wire O5;
  wire O6;
  wire [7:0]O7;
  wire [7:0]O8;
  wire [7:0]O9;
  wire POWER_DOWN;
  wire [0:0]Q;
  wire [0:1]RXN;
  wire [0:1]RXP;
  wire RXUSERRDY;
  wire RX_RESETDONE_OUT;
  wire SYNC_CLK;
  wire [0:1]TXN;
  wire [0:1]TXP;
  wire TXUSERRDY;
  wire TX_OUT_CLK;
  wire TX_RESETDONE_OUT;
  wire adapt_count_reset;
  wire cplllock_sync;
  wire drpclk_in;
  wire gt0_rxresetdone_r3;
  wire gt0_txresetdone_r3;
  wire gt1_rxresetdone_r3;
  wire gt1_txresetdone_r3;
  wire gt_qpllclk_quad1_in;
  wire gt_qpllrefclk_quad1_in;
  wire gt_rx_reset_i;
  wire hard_err_gt0;
  wire hard_err_gt0_0;
  wire init_clk_in;
  wire link_reset_r;
  wire link_reset_r2;
  wire n_0_gt0_rxresetdone_r2_reg_srl2;
  wire n_0_gt0_txresetdone_r2_reg_srl2;
  wire n_0_gt1_rxresetdone_r2_reg_srl2;
  wire n_0_gt1_txresetdone_r2_reg_srl2;
  wire \n_0_rx_cdrlock_counter[9]_i_2 ;
  wire \n_0_rx_cdrlock_counter_reg[0] ;
  wire \n_0_rx_cdrlock_counter_reg[1] ;
  wire \n_0_rx_cdrlock_counter_reg[2] ;
  wire \n_0_rx_cdrlock_counter_reg[3] ;
  wire \n_0_rx_cdrlock_counter_reg[4] ;
  wire \n_0_rx_cdrlock_counter_reg[5] ;
  wire \n_0_rx_cdrlock_counter_reg[6] ;
  wire \n_0_rx_cdrlock_counter_reg[7] ;
  wire \n_0_rx_cdrlock_counter_reg[8] ;
  wire \n_0_rx_cdrlock_counter_reg[9] ;
  wire n_0_rx_cdrlocked_i_1;
  wire n_0_rx_cdrlocked_i_2;
  wire n_0_rx_cdrlocked_i_3;
  wire n_0_rxfsm_soft_reset_r_i_1;
  wire n_128_data_mgt_multi_gt_i;
  wire n_131_data_mgt_multi_gt_i;
  wire n_159_data_mgt_multi_gt_i;
  wire n_161_data_mgt_multi_gt_i;
  wire n_183_data_mgt_multi_gt_i;
  wire n_184_data_mgt_multi_gt_i;
  wire n_1_gt_txresetfsm_i;
  wire n_2_gt_rxresetfsm_i;
  wire n_3_gt_rxresetfsm_i;
  wire n_6_gt_txresetfsm_i;
  wire [9:0]p_0_in__1;
  wire rx_cdrlocked;
  wire rxfsm_data_valid_r;
  wire rxfsm_rxresetdone_i;
  wire rxfsm_rxresetdone_r;
  wire rxfsm_rxresetdone_r2;
  wire rxfsm_soft_reset_r;
  wire tx_lock;
  wire txfsm_txresetdone_i;
  wire txfsm_txresetdone_r;
  wire user_clk;

GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
data_mgtdata_mgt_multi_gt__parameterized0 data_mgt_multi_gt_i
       (.CPLLLOCK(CPLLLOCK),
        .D(D),
        .DRPADDR_IN(DRPADDR_IN),
        .DRPADDR_IN_LANE1(DRPADDR_IN_LANE1),
        .DRPDI_IN(DRPDI_IN),
        .DRPDI_IN_LANE1(DRPDI_IN_LANE1),
        .DRPDO_OUT(DRPDO_OUT),
        .DRPDO_OUT_LANE1(DRPDO_OUT_LANE1),
        .DRPEN_IN(DRPEN_IN),
        .DRPEN_IN_LANE1(DRPEN_IN_LANE1),
        .DRPRDY_OUT(DRPRDY_OUT),
        .DRPRDY_OUT_LANE1(DRPRDY_OUT_LANE1),
        .DRPWE_IN(DRPWE_IN),
        .DRPWE_IN_LANE1(DRPWE_IN_LANE1),
        .ENMCOMMAALIGN_IN(ENMCOMMAALIGN_IN),
        .ENMCOMMAALIGN_IN_LANE1(ENMCOMMAALIGN_IN_LANE1),
        .GT0_CPLLREFCLKLOST_OUT(GT0_CPLLREFCLKLOST_OUT),
        .GT0_RXBYTEREALIGN_OUT(GT0_RXBYTEREALIGN_OUT),
        .GT0_RXCHARISCOMMA_OUT(GT0_RXCHARISCOMMA_OUT),
        .GT0_RXCHARISK_OUT(GT0_RXCHARISK_OUT),
        .GT0_RXCHBONDEN_IN(GT0_RXCHBONDEN_IN),
        .GT0_RXDATA_OUT(GT0_RXDATA_OUT),
        .GT0_RXDFEAGCHOLD_IN(n_2_gt_rxresetfsm_i),
        .GT0_RXDISPERR_OUT(GT0_RXDISPERR_OUT),
        .GT0_RXPOLARITY_IN(GT0_RXPOLARITY_IN),
        .GT0_RXRESETDONE_OUT(n_159_data_mgt_multi_gt_i),
        .GT0_TXCHARISK_IN(GT0_TXCHARISK_IN),
        .GT0_TXDATA_IN(GT0_TXDATA_IN),
        .GT0_TXRESETDONE_OUT(n_161_data_mgt_multi_gt_i),
        .GT1_CPLLREFCLKLOST_OUT(GT1_CPLLREFCLKLOST_OUT),
        .GT1_CPLLRESET_IN(CPLL_RESET),
        .GT1_GTTXRESET_IN(GTTXRESET),
        .GT1_RXBYTEREALIGN_OUT(GT1_RXBYTEREALIGN_OUT),
        .GT1_RXCHARISCOMMA_OUT(GT1_RXCHARISCOMMA_OUT),
        .GT1_RXCHARISK_OUT(GT1_RXCHARISK_OUT),
        .GT1_RXDATA_OUT(GT1_RXDATA_OUT),
        .GT1_RXDISPERR_OUT(GT1_RXDISPERR_OUT),
        .GT1_RXPOLARITY_IN(GT1_RXPOLARITY_IN),
        .GT1_RXRESETDONE_OUT(n_183_data_mgt_multi_gt_i),
        .GT1_RXUSERRDY_IN(RXUSERRDY),
        .GT1_TXCHARISK_IN(GT1_TXCHARISK_IN),
        .GT1_TXDATA_IN(GT1_TXDATA_IN),
        .GT1_TXRESETDONE_OUT(n_184_data_mgt_multi_gt_i),
        .GT1_TXUSERRDY_IN(TXUSERRDY),
        .GT_REFCLK1(GT_REFCLK1),
        .I1(I1),
        .I10(I9),
        .I2(I2),
        .I3(I3),
        .I4(I4),
        .I5(I5),
        .I6(I6),
        .I7(I7),
        .I8(n_3_gt_rxresetfsm_i),
        .I9(I8),
        .LOOPBACK(LOOPBACK),
        .O1(O1),
        .O10(n_128_data_mgt_multi_gt_i),
        .O11(n_131_data_mgt_multi_gt_i),
        .O12(O10),
        .O13(O11),
        .O14(O12),
        .O15(O13),
        .O16(O14),
        .O17(O15),
        .O18(O16),
        .O19(O17),
        .O2(O2),
        .O20(O18),
        .O21(O19),
        .O22(O20),
        .O23(O21),
        .O24(O22),
        .O25(O23),
        .O26(O24),
        .O3(O3),
        .O4(O4),
        .O5(O5),
        .O6(O6),
        .O7(O7),
        .O8(O8),
        .O9(O9),
        .POWER_DOWN(POWER_DOWN),
        .Q(Q),
        .RXN(RXN),
        .RXP(RXP),
        .SR(gt_rx_reset_i),
        .SYNC_CLK(SYNC_CLK),
        .TXN(TXN),
        .TXP(TXP),
        .TX_OUT_CLK(TX_OUT_CLK),
        .adapt_count_reset(adapt_count_reset),
        .drpclk_in(drpclk_in),
        .gt_qpllclk_quad1_in(gt_qpllclk_quad1_in),
        .gt_qpllrefclk_quad1_in(gt_qpllrefclk_quad1_in),
        .hard_err_gt0(hard_err_gt0),
        .hard_err_gt0_0(hard_err_gt0_0),
        .init_clk_in(init_clk_in),
        .rx_cdrlocked(rx_cdrlocked),
        .tx_lock(tx_lock),
        .user_clk(user_clk));
(* srl_name = "U0/\gt_wrapper_i/gt0_rxresetdone_r2_reg_srl2 " *) 
   SRL16E gt0_rxresetdone_r2_reg_srl2
       (.A0(\<const1> ),
        .A1(\<const0> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(n_159_data_mgt_multi_gt_i),
        .Q(n_0_gt0_rxresetdone_r2_reg_srl2));
FDRE gt0_rxresetdone_r3_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_gt0_rxresetdone_r2_reg_srl2),
        .Q(gt0_rxresetdone_r3),
        .R(\<const0> ));
(* srl_name = "U0/\gt_wrapper_i/gt0_txresetdone_r2_reg_srl2 " *) 
   SRL16E gt0_txresetdone_r2_reg_srl2
       (.A0(\<const1> ),
        .A1(\<const0> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(n_161_data_mgt_multi_gt_i),
        .Q(n_0_gt0_txresetdone_r2_reg_srl2));
FDRE gt0_txresetdone_r3_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_gt0_txresetdone_r2_reg_srl2),
        .Q(gt0_txresetdone_r3),
        .R(\<const0> ));
(* srl_name = "U0/\gt_wrapper_i/gt1_rxresetdone_r2_reg_srl2 " *) 
   SRL16E gt1_rxresetdone_r2_reg_srl2
       (.A0(\<const1> ),
        .A1(\<const0> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(n_183_data_mgt_multi_gt_i),
        .Q(n_0_gt1_rxresetdone_r2_reg_srl2));
FDRE gt1_rxresetdone_r3_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_gt1_rxresetdone_r2_reg_srl2),
        .Q(gt1_rxresetdone_r3),
        .R(\<const0> ));
(* srl_name = "U0/\gt_wrapper_i/gt1_txresetdone_r2_reg_srl2 " *) 
   SRL16E gt1_txresetdone_r2_reg_srl2
       (.A0(\<const1> ),
        .A1(\<const0> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(n_184_data_mgt_multi_gt_i),
        .Q(n_0_gt1_txresetdone_r2_reg_srl2));
FDRE gt1_txresetdone_r3_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_gt1_txresetdone_r2_reg_srl2),
        .Q(gt1_txresetdone_r3),
        .R(\<const0> ));
FDRE gt_rx_reset_i_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(GTRXRESET),
        .Q(gt_rx_reset_i),
        .R(\<const0> ));
data_mgtdata_mgt_rx_startup_fsm__parameterized0 gt_rxresetfsm_i
       (.GT0_CPLLREFCLKLOST_OUT(GT0_CPLLREFCLKLOST_OUT),
        .GT1_CPLLREFCLKLOST_OUT(GT1_CPLLREFCLKLOST_OUT),
        .GTRXRESET(GTRXRESET),
        .I1(n_131_data_mgt_multi_gt_i),
        .I2(n_1_gt_txresetfsm_i),
        .I3(n_128_data_mgt_multi_gt_i),
        .O1(n_2_gt_rxresetfsm_i),
        .O2(n_3_gt_rxresetfsm_i),
        .RXUSERRDY(RXUSERRDY),
        .SR(n_6_gt_txresetfsm_i),
        .TXUSERRDY(TXUSERRDY),
        .adapt_count_reset(adapt_count_reset),
        .cplllock_sync(cplllock_sync),
        .init_clk_in(init_clk_in),
        .rx_cdrlocked(rx_cdrlocked),
        .rxfsm_data_valid_r(rxfsm_data_valid_r),
        .rxfsm_rxresetdone_r(rxfsm_rxresetdone_r),
        .rxfsm_soft_reset_r(rxfsm_soft_reset_r),
        .user_clk(user_clk));
data_mgtdata_mgt_tx_startup_fsm__parameterized0 gt_txresetfsm_i
       (.CPLLLOCK(CPLLLOCK),
        .GT0_CPLLREFCLKLOST_OUT(GT0_CPLLREFCLKLOST_OUT),
        .GT1_CPLLREFCLKLOST_OUT(GT1_CPLLREFCLKLOST_OUT),
        .GT1_CPLLRESET_IN(CPLL_RESET),
        .GT1_GTTXRESET_IN(GTTXRESET),
        .GT1_TXUSERRDY_IN(TXUSERRDY),
        .GT_RESET(GT_RESET),
        .I1(n_131_data_mgt_multi_gt_i),
        .O1(n_1_gt_txresetfsm_i),
        .SR(n_6_gt_txresetfsm_i),
        .TX_RESETDONE_OUT(TX_RESETDONE_OUT),
        .cplllock_sync(cplllock_sync),
        .init_clk_in(init_clk_in),
        .txfsm_txresetdone_r(txfsm_txresetdone_r),
        .user_clk(user_clk));
FDRE link_reset_r2_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(link_reset_r),
        .Q(link_reset_r2),
        .R(\<const0> ));
FDRE link_reset_r_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(LINK_RESET_OUT),
        .Q(link_reset_r),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair64" *) 
   LUT2 #(
    .INIT(4'hB)) 
     \rx_cdrlock_counter[0]_i_1 
       (.I0(n_0_rx_cdrlocked_i_2),
        .I1(\n_0_rx_cdrlock_counter_reg[0] ),
        .O(p_0_in__1[0]));
(* SOFT_HLUTNM = "soft_lutpair64" *) 
   LUT3 #(
    .INIT(8'h06)) 
     \rx_cdrlock_counter[1]_i_1 
       (.I0(\n_0_rx_cdrlock_counter_reg[1] ),
        .I1(\n_0_rx_cdrlock_counter_reg[0] ),
        .I2(n_0_rx_cdrlocked_i_2),
        .O(p_0_in__1[1]));
(* SOFT_HLUTNM = "soft_lutpair63" *) 
   LUT3 #(
    .INIT(8'h6A)) 
     \rx_cdrlock_counter[2]_i_1 
       (.I0(\n_0_rx_cdrlock_counter_reg[2] ),
        .I1(\n_0_rx_cdrlock_counter_reg[1] ),
        .I2(\n_0_rx_cdrlock_counter_reg[0] ),
        .O(p_0_in__1[2]));
(* SOFT_HLUTNM = "soft_lutpair63" *) 
   LUT4 #(
    .INIT(16'h6AAA)) 
     \rx_cdrlock_counter[3]_i_1 
       (.I0(\n_0_rx_cdrlock_counter_reg[3] ),
        .I1(\n_0_rx_cdrlock_counter_reg[0] ),
        .I2(\n_0_rx_cdrlock_counter_reg[1] ),
        .I3(\n_0_rx_cdrlock_counter_reg[2] ),
        .O(p_0_in__1[3]));
(* SOFT_HLUTNM = "soft_lutpair61" *) 
   LUT5 #(
    .INIT(32'h6AAAAAAA)) 
     \rx_cdrlock_counter[4]_i_1 
       (.I0(\n_0_rx_cdrlock_counter_reg[4] ),
        .I1(\n_0_rx_cdrlock_counter_reg[2] ),
        .I2(\n_0_rx_cdrlock_counter_reg[1] ),
        .I3(\n_0_rx_cdrlock_counter_reg[0] ),
        .I4(\n_0_rx_cdrlock_counter_reg[3] ),
        .O(p_0_in__1[4]));
LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
     \rx_cdrlock_counter[5]_i_1 
       (.I0(\n_0_rx_cdrlock_counter_reg[5] ),
        .I1(\n_0_rx_cdrlock_counter_reg[3] ),
        .I2(\n_0_rx_cdrlock_counter_reg[0] ),
        .I3(\n_0_rx_cdrlock_counter_reg[1] ),
        .I4(\n_0_rx_cdrlock_counter_reg[2] ),
        .I5(\n_0_rx_cdrlock_counter_reg[4] ),
        .O(p_0_in__1[5]));
LUT3 #(
    .INIT(8'h6A)) 
     \rx_cdrlock_counter[6]_i_1 
       (.I0(\n_0_rx_cdrlock_counter_reg[6] ),
        .I1(\n_0_rx_cdrlock_counter[9]_i_2 ),
        .I2(\n_0_rx_cdrlock_counter_reg[5] ),
        .O(p_0_in__1[6]));
(* SOFT_HLUTNM = "soft_lutpair62" *) 
   LUT4 #(
    .INIT(16'h6AAA)) 
     \rx_cdrlock_counter[7]_i_1 
       (.I0(\n_0_rx_cdrlock_counter_reg[7] ),
        .I1(\n_0_rx_cdrlock_counter_reg[5] ),
        .I2(\n_0_rx_cdrlock_counter_reg[6] ),
        .I3(\n_0_rx_cdrlock_counter[9]_i_2 ),
        .O(p_0_in__1[7]));
(* SOFT_HLUTNM = "soft_lutpair62" *) 
   LUT5 #(
    .INIT(32'h6AAAAAAA)) 
     \rx_cdrlock_counter[8]_i_1 
       (.I0(\n_0_rx_cdrlock_counter_reg[8] ),
        .I1(\n_0_rx_cdrlock_counter[9]_i_2 ),
        .I2(\n_0_rx_cdrlock_counter_reg[6] ),
        .I3(\n_0_rx_cdrlock_counter_reg[5] ),
        .I4(\n_0_rx_cdrlock_counter_reg[7] ),
        .O(p_0_in__1[8]));
LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
     \rx_cdrlock_counter[9]_i_1 
       (.I0(\n_0_rx_cdrlock_counter_reg[9] ),
        .I1(\n_0_rx_cdrlock_counter_reg[7] ),
        .I2(\n_0_rx_cdrlock_counter_reg[5] ),
        .I3(\n_0_rx_cdrlock_counter_reg[6] ),
        .I4(\n_0_rx_cdrlock_counter[9]_i_2 ),
        .I5(\n_0_rx_cdrlock_counter_reg[8] ),
        .O(p_0_in__1[9]));
(* SOFT_HLUTNM = "soft_lutpair61" *) 
   LUT5 #(
    .INIT(32'h80000000)) 
     \rx_cdrlock_counter[9]_i_2 
       (.I0(\n_0_rx_cdrlock_counter_reg[4] ),
        .I1(\n_0_rx_cdrlock_counter_reg[2] ),
        .I2(\n_0_rx_cdrlock_counter_reg[1] ),
        .I3(\n_0_rx_cdrlock_counter_reg[0] ),
        .I4(\n_0_rx_cdrlock_counter_reg[3] ),
        .O(\n_0_rx_cdrlock_counter[9]_i_2 ));
(* counter = "26" *) 
   FDRE #(
    .INIT(1'b0)) 
     \rx_cdrlock_counter_reg[0] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(p_0_in__1[0]),
        .Q(\n_0_rx_cdrlock_counter_reg[0] ),
        .R(gt_rx_reset_i));
(* counter = "26" *) 
   FDRE #(
    .INIT(1'b0)) 
     \rx_cdrlock_counter_reg[1] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(p_0_in__1[1]),
        .Q(\n_0_rx_cdrlock_counter_reg[1] ),
        .R(gt_rx_reset_i));
(* counter = "26" *) 
   FDRE #(
    .INIT(1'b0)) 
     \rx_cdrlock_counter_reg[2] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(p_0_in__1[2]),
        .Q(\n_0_rx_cdrlock_counter_reg[2] ),
        .R(gt_rx_reset_i));
(* counter = "26" *) 
   FDRE #(
    .INIT(1'b0)) 
     \rx_cdrlock_counter_reg[3] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(p_0_in__1[3]),
        .Q(\n_0_rx_cdrlock_counter_reg[3] ),
        .R(gt_rx_reset_i));
(* counter = "26" *) 
   FDRE #(
    .INIT(1'b0)) 
     \rx_cdrlock_counter_reg[4] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(p_0_in__1[4]),
        .Q(\n_0_rx_cdrlock_counter_reg[4] ),
        .R(gt_rx_reset_i));
(* counter = "26" *) 
   FDRE #(
    .INIT(1'b0)) 
     \rx_cdrlock_counter_reg[5] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(p_0_in__1[5]),
        .Q(\n_0_rx_cdrlock_counter_reg[5] ),
        .R(gt_rx_reset_i));
(* counter = "26" *) 
   FDRE #(
    .INIT(1'b0)) 
     \rx_cdrlock_counter_reg[6] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(p_0_in__1[6]),
        .Q(\n_0_rx_cdrlock_counter_reg[6] ),
        .R(gt_rx_reset_i));
(* counter = "26" *) 
   FDRE #(
    .INIT(1'b0)) 
     \rx_cdrlock_counter_reg[7] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(p_0_in__1[7]),
        .Q(\n_0_rx_cdrlock_counter_reg[7] ),
        .R(gt_rx_reset_i));
(* counter = "26" *) 
   FDRE #(
    .INIT(1'b0)) 
     \rx_cdrlock_counter_reg[8] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(p_0_in__1[8]),
        .Q(\n_0_rx_cdrlock_counter_reg[8] ),
        .R(gt_rx_reset_i));
(* counter = "26" *) 
   FDRE #(
    .INIT(1'b0)) 
     \rx_cdrlock_counter_reg[9] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(p_0_in__1[9]),
        .Q(\n_0_rx_cdrlock_counter_reg[9] ),
        .R(gt_rx_reset_i));
LUT3 #(
    .INIT(8'h0E)) 
     rx_cdrlocked_i_1
       (.I0(rx_cdrlocked),
        .I1(n_0_rx_cdrlocked_i_2),
        .I2(gt_rx_reset_i),
        .O(n_0_rx_cdrlocked_i_1));
LUT5 #(
    .INIT(32'h02000000)) 
     rx_cdrlocked_i_2
       (.I0(n_0_rx_cdrlocked_i_3),
        .I1(\n_0_rx_cdrlock_counter_reg[2] ),
        .I2(\n_0_rx_cdrlock_counter_reg[7] ),
        .I3(\n_0_rx_cdrlock_counter_reg[6] ),
        .I4(\n_0_rx_cdrlock_counter_reg[5] ),
        .O(n_0_rx_cdrlocked_i_2));
LUT6 #(
    .INIT(64'h0010000000000000)) 
     rx_cdrlocked_i_3
       (.I0(\n_0_rx_cdrlock_counter_reg[1] ),
        .I1(\n_0_rx_cdrlock_counter_reg[3] ),
        .I2(\n_0_rx_cdrlock_counter_reg[4] ),
        .I3(\n_0_rx_cdrlock_counter_reg[8] ),
        .I4(\n_0_rx_cdrlock_counter_reg[9] ),
        .I5(\n_0_rx_cdrlock_counter_reg[0] ),
        .O(n_0_rx_cdrlocked_i_3));
FDRE rx_cdrlocked_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_rx_cdrlocked_i_1),
        .Q(rx_cdrlocked),
        .R(\<const0> ));
FDRE rxfsm_rxresetdone_r2_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(rxfsm_rxresetdone_r),
        .Q(rxfsm_rxresetdone_r2),
        .R(\<const0> ));
FDRE rxfsm_rxresetdone_r3_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(rxfsm_rxresetdone_r2),
        .Q(RX_RESETDONE_OUT),
        .R(\<const0> ));
LUT2 #(
    .INIT(4'h8)) 
     rxfsm_rxresetdone_r_i_1
       (.I0(gt0_rxresetdone_r3),
        .I1(gt1_rxresetdone_r3),
        .O(rxfsm_rxresetdone_i));
FDRE rxfsm_rxresetdone_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(rxfsm_rxresetdone_i),
        .Q(rxfsm_rxresetdone_r),
        .R(\<const0> ));
LUT2 #(
    .INIT(4'hE)) 
     rxfsm_soft_reset_r_i_1
       (.I0(GT_RESET),
        .I1(link_reset_r2),
        .O(n_0_rxfsm_soft_reset_r_i_1));
FDRE rxfsm_soft_reset_r_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_rxfsm_soft_reset_r_i_1),
        .Q(rxfsm_soft_reset_r),
        .R(\<const0> ));
LUT2 #(
    .INIT(4'h8)) 
     txfsm_txresetdone_r_i_1
       (.I0(gt0_txresetdone_r3),
        .I1(gt1_txresetdone_r3),
        .O(txfsm_txresetdone_i));
FDRE txfsm_txresetdone_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(txfsm_txresetdone_i),
        .Q(txfsm_txresetdone_r),
        .R(\<const0> ));
endmodule

module data_mgtdata_mgt_HOTPLUG
   (O3,
    init_clk_in,
    user_clk,
    I1,
    RX_CC);
  output O3;
  input init_clk_in;
  input user_clk;
  input I1;
  input RX_CC;

  wire \<const0> ;
  wire \<const1> ;
  wire I1;
  wire O3;
  wire RX_CC;
  wire [25:0]count_for_reset_r_reg;
  wire init_clk_in;
  wire link_reset_0;
  wire link_reset_r;
  wire \n_0_count_for_reset_r[0]_i_2__0 ;
  wire \n_0_count_for_reset_r[0]_i_3__0 ;
  wire \n_0_count_for_reset_r[0]_i_4__0 ;
  wire \n_0_count_for_reset_r[0]_i_5__0 ;
  wire \n_0_count_for_reset_r[12]_i_2__0 ;
  wire \n_0_count_for_reset_r[12]_i_3__0 ;
  wire \n_0_count_for_reset_r[12]_i_4__0 ;
  wire \n_0_count_for_reset_r[12]_i_5__0 ;
  wire \n_0_count_for_reset_r[16]_i_2__0 ;
  wire \n_0_count_for_reset_r[16]_i_3__0 ;
  wire \n_0_count_for_reset_r[16]_i_4__0 ;
  wire \n_0_count_for_reset_r[16]_i_5__0 ;
  wire \n_0_count_for_reset_r[20]_i_2__0 ;
  wire \n_0_count_for_reset_r[20]_i_3__0 ;
  wire \n_0_count_for_reset_r[20]_i_4__0 ;
  wire \n_0_count_for_reset_r[20]_i_5__0 ;
  wire \n_0_count_for_reset_r[24]_i_2__0 ;
  wire \n_0_count_for_reset_r[24]_i_3__0 ;
  wire \n_0_count_for_reset_r[4]_i_2__0 ;
  wire \n_0_count_for_reset_r[4]_i_3__0 ;
  wire \n_0_count_for_reset_r[4]_i_4__0 ;
  wire \n_0_count_for_reset_r[4]_i_5__0 ;
  wire \n_0_count_for_reset_r[8]_i_2__0 ;
  wire \n_0_count_for_reset_r[8]_i_3__0 ;
  wire \n_0_count_for_reset_r[8]_i_4__0 ;
  wire \n_0_count_for_reset_r[8]_i_5__0 ;
  wire \n_0_count_for_reset_r_reg[0]_i_1__0 ;
  wire \n_0_count_for_reset_r_reg[12]_i_1__0 ;
  wire \n_0_count_for_reset_r_reg[16]_i_1__0 ;
  wire \n_0_count_for_reset_r_reg[20]_i_1__0 ;
  wire \n_0_count_for_reset_r_reg[4]_i_1__0 ;
  wire \n_0_count_for_reset_r_reg[8]_i_1__0 ;
  wire n_0_link_reset_r_i_2__0;
  wire n_0_link_reset_r_i_3__0;
  wire n_0_link_reset_r_i_4__0;
  wire n_0_link_reset_r_i_5__0;
  wire n_0_link_reset_r_i_6__0;
  wire n_0_rx_cc_extend_r2_i_1__0;
  wire \n_0_rx_cc_extend_r_reg[0] ;
  wire \n_1_count_for_reset_r_reg[0]_i_1__0 ;
  wire \n_1_count_for_reset_r_reg[12]_i_1__0 ;
  wire \n_1_count_for_reset_r_reg[16]_i_1__0 ;
  wire \n_1_count_for_reset_r_reg[20]_i_1__0 ;
  wire \n_1_count_for_reset_r_reg[4]_i_1__0 ;
  wire \n_1_count_for_reset_r_reg[8]_i_1__0 ;
  wire \n_2_count_for_reset_r_reg[0]_i_1__0 ;
  wire \n_2_count_for_reset_r_reg[12]_i_1__0 ;
  wire \n_2_count_for_reset_r_reg[16]_i_1__0 ;
  wire \n_2_count_for_reset_r_reg[20]_i_1__0 ;
  wire \n_2_count_for_reset_r_reg[4]_i_1__0 ;
  wire \n_2_count_for_reset_r_reg[8]_i_1__0 ;
  wire \n_3_count_for_reset_r_reg[0]_i_1__0 ;
  wire \n_3_count_for_reset_r_reg[12]_i_1__0 ;
  wire \n_3_count_for_reset_r_reg[16]_i_1__0 ;
  wire \n_3_count_for_reset_r_reg[20]_i_1__0 ;
  wire \n_3_count_for_reset_r_reg[24]_i_1__0 ;
  wire \n_3_count_for_reset_r_reg[4]_i_1__0 ;
  wire \n_3_count_for_reset_r_reg[8]_i_1__0 ;
  wire \n_4_count_for_reset_r_reg[0]_i_1__0 ;
  wire \n_4_count_for_reset_r_reg[12]_i_1__0 ;
  wire \n_4_count_for_reset_r_reg[16]_i_1__0 ;
  wire \n_4_count_for_reset_r_reg[20]_i_1__0 ;
  wire \n_4_count_for_reset_r_reg[4]_i_1__0 ;
  wire \n_4_count_for_reset_r_reg[8]_i_1__0 ;
  wire \n_5_count_for_reset_r_reg[0]_i_1__0 ;
  wire \n_5_count_for_reset_r_reg[12]_i_1__0 ;
  wire \n_5_count_for_reset_r_reg[16]_i_1__0 ;
  wire \n_5_count_for_reset_r_reg[20]_i_1__0 ;
  wire \n_5_count_for_reset_r_reg[4]_i_1__0 ;
  wire \n_5_count_for_reset_r_reg[8]_i_1__0 ;
  wire \n_6_count_for_reset_r_reg[0]_i_1__0 ;
  wire \n_6_count_for_reset_r_reg[12]_i_1__0 ;
  wire \n_6_count_for_reset_r_reg[16]_i_1__0 ;
  wire \n_6_count_for_reset_r_reg[20]_i_1__0 ;
  wire \n_6_count_for_reset_r_reg[24]_i_1__0 ;
  wire \n_6_count_for_reset_r_reg[4]_i_1__0 ;
  wire \n_6_count_for_reset_r_reg[8]_i_1__0 ;
  wire \n_7_count_for_reset_r_reg[0]_i_1__0 ;
  wire \n_7_count_for_reset_r_reg[12]_i_1__0 ;
  wire \n_7_count_for_reset_r_reg[16]_i_1__0 ;
  wire \n_7_count_for_reset_r_reg[20]_i_1__0 ;
  wire \n_7_count_for_reset_r_reg[24]_i_1__0 ;
  wire \n_7_count_for_reset_r_reg[4]_i_1__0 ;
  wire \n_7_count_for_reset_r_reg[8]_i_1__0 ;
  wire [3:0]p_0_in;
  wire rx_cc_extend_r2;
  wire s_level_out_d3;
  wire user_clk;
  wire [3:1]\NLW_count_for_reset_r_reg[24]_i_1__0_CO_UNCONNECTED ;
  wire [3:2]\NLW_count_for_reset_r_reg[24]_i_1__0_O_UNCONNECTED ;

GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[0]_i_2__0 
       (.I0(count_for_reset_r_reg[3]),
        .O(\n_0_count_for_reset_r[0]_i_2__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[0]_i_3__0 
       (.I0(count_for_reset_r_reg[2]),
        .O(\n_0_count_for_reset_r[0]_i_3__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[0]_i_4__0 
       (.I0(count_for_reset_r_reg[1]),
        .O(\n_0_count_for_reset_r[0]_i_4__0 ));
LUT1 #(
    .INIT(2'h1)) 
     \count_for_reset_r[0]_i_5__0 
       (.I0(count_for_reset_r_reg[0]),
        .O(\n_0_count_for_reset_r[0]_i_5__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[12]_i_2__0 
       (.I0(count_for_reset_r_reg[15]),
        .O(\n_0_count_for_reset_r[12]_i_2__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[12]_i_3__0 
       (.I0(count_for_reset_r_reg[14]),
        .O(\n_0_count_for_reset_r[12]_i_3__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[12]_i_4__0 
       (.I0(count_for_reset_r_reg[13]),
        .O(\n_0_count_for_reset_r[12]_i_4__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[12]_i_5__0 
       (.I0(count_for_reset_r_reg[12]),
        .O(\n_0_count_for_reset_r[12]_i_5__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[16]_i_2__0 
       (.I0(count_for_reset_r_reg[19]),
        .O(\n_0_count_for_reset_r[16]_i_2__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[16]_i_3__0 
       (.I0(count_for_reset_r_reg[18]),
        .O(\n_0_count_for_reset_r[16]_i_3__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[16]_i_4__0 
       (.I0(count_for_reset_r_reg[17]),
        .O(\n_0_count_for_reset_r[16]_i_4__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[16]_i_5__0 
       (.I0(count_for_reset_r_reg[16]),
        .O(\n_0_count_for_reset_r[16]_i_5__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[20]_i_2__0 
       (.I0(count_for_reset_r_reg[23]),
        .O(\n_0_count_for_reset_r[20]_i_2__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[20]_i_3__0 
       (.I0(count_for_reset_r_reg[22]),
        .O(\n_0_count_for_reset_r[20]_i_3__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[20]_i_4__0 
       (.I0(count_for_reset_r_reg[21]),
        .O(\n_0_count_for_reset_r[20]_i_4__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[20]_i_5__0 
       (.I0(count_for_reset_r_reg[20]),
        .O(\n_0_count_for_reset_r[20]_i_5__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[24]_i_2__0 
       (.I0(count_for_reset_r_reg[25]),
        .O(\n_0_count_for_reset_r[24]_i_2__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[24]_i_3__0 
       (.I0(count_for_reset_r_reg[24]),
        .O(\n_0_count_for_reset_r[24]_i_3__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[4]_i_2__0 
       (.I0(count_for_reset_r_reg[7]),
        .O(\n_0_count_for_reset_r[4]_i_2__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[4]_i_3__0 
       (.I0(count_for_reset_r_reg[6]),
        .O(\n_0_count_for_reset_r[4]_i_3__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[4]_i_4__0 
       (.I0(count_for_reset_r_reg[5]),
        .O(\n_0_count_for_reset_r[4]_i_4__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[4]_i_5__0 
       (.I0(count_for_reset_r_reg[4]),
        .O(\n_0_count_for_reset_r[4]_i_5__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[8]_i_2__0 
       (.I0(count_for_reset_r_reg[11]),
        .O(\n_0_count_for_reset_r[8]_i_2__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[8]_i_3__0 
       (.I0(count_for_reset_r_reg[10]),
        .O(\n_0_count_for_reset_r[8]_i_3__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[8]_i_4__0 
       (.I0(count_for_reset_r_reg[9]),
        .O(\n_0_count_for_reset_r[8]_i_4__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[8]_i_5__0 
       (.I0(count_for_reset_r_reg[8]),
        .O(\n_0_count_for_reset_r[8]_i_5__0 ));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[0] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_7_count_for_reset_r_reg[0]_i_1__0 ),
        .Q(count_for_reset_r_reg[0]),
        .R(s_level_out_d3));
CARRY4 \count_for_reset_r_reg[0]_i_1__0 
       (.CI(\<const0> ),
        .CO({\n_0_count_for_reset_r_reg[0]_i_1__0 ,\n_1_count_for_reset_r_reg[0]_i_1__0 ,\n_2_count_for_reset_r_reg[0]_i_1__0 ,\n_3_count_for_reset_r_reg[0]_i_1__0 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const1> }),
        .O({\n_4_count_for_reset_r_reg[0]_i_1__0 ,\n_5_count_for_reset_r_reg[0]_i_1__0 ,\n_6_count_for_reset_r_reg[0]_i_1__0 ,\n_7_count_for_reset_r_reg[0]_i_1__0 }),
        .S({\n_0_count_for_reset_r[0]_i_2__0 ,\n_0_count_for_reset_r[0]_i_3__0 ,\n_0_count_for_reset_r[0]_i_4__0 ,\n_0_count_for_reset_r[0]_i_5__0 }));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[10] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_5_count_for_reset_r_reg[8]_i_1__0 ),
        .Q(count_for_reset_r_reg[10]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[11] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_4_count_for_reset_r_reg[8]_i_1__0 ),
        .Q(count_for_reset_r_reg[11]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[12] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_7_count_for_reset_r_reg[12]_i_1__0 ),
        .Q(count_for_reset_r_reg[12]),
        .R(s_level_out_d3));
CARRY4 \count_for_reset_r_reg[12]_i_1__0 
       (.CI(\n_0_count_for_reset_r_reg[8]_i_1__0 ),
        .CO({\n_0_count_for_reset_r_reg[12]_i_1__0 ,\n_1_count_for_reset_r_reg[12]_i_1__0 ,\n_2_count_for_reset_r_reg[12]_i_1__0 ,\n_3_count_for_reset_r_reg[12]_i_1__0 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_count_for_reset_r_reg[12]_i_1__0 ,\n_5_count_for_reset_r_reg[12]_i_1__0 ,\n_6_count_for_reset_r_reg[12]_i_1__0 ,\n_7_count_for_reset_r_reg[12]_i_1__0 }),
        .S({\n_0_count_for_reset_r[12]_i_2__0 ,\n_0_count_for_reset_r[12]_i_3__0 ,\n_0_count_for_reset_r[12]_i_4__0 ,\n_0_count_for_reset_r[12]_i_5__0 }));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[13] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_6_count_for_reset_r_reg[12]_i_1__0 ),
        .Q(count_for_reset_r_reg[13]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[14] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_5_count_for_reset_r_reg[12]_i_1__0 ),
        .Q(count_for_reset_r_reg[14]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[15] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_4_count_for_reset_r_reg[12]_i_1__0 ),
        .Q(count_for_reset_r_reg[15]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[16] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_7_count_for_reset_r_reg[16]_i_1__0 ),
        .Q(count_for_reset_r_reg[16]),
        .R(s_level_out_d3));
CARRY4 \count_for_reset_r_reg[16]_i_1__0 
       (.CI(\n_0_count_for_reset_r_reg[12]_i_1__0 ),
        .CO({\n_0_count_for_reset_r_reg[16]_i_1__0 ,\n_1_count_for_reset_r_reg[16]_i_1__0 ,\n_2_count_for_reset_r_reg[16]_i_1__0 ,\n_3_count_for_reset_r_reg[16]_i_1__0 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_count_for_reset_r_reg[16]_i_1__0 ,\n_5_count_for_reset_r_reg[16]_i_1__0 ,\n_6_count_for_reset_r_reg[16]_i_1__0 ,\n_7_count_for_reset_r_reg[16]_i_1__0 }),
        .S({\n_0_count_for_reset_r[16]_i_2__0 ,\n_0_count_for_reset_r[16]_i_3__0 ,\n_0_count_for_reset_r[16]_i_4__0 ,\n_0_count_for_reset_r[16]_i_5__0 }));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[17] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_6_count_for_reset_r_reg[16]_i_1__0 ),
        .Q(count_for_reset_r_reg[17]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[18] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_5_count_for_reset_r_reg[16]_i_1__0 ),
        .Q(count_for_reset_r_reg[18]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[19] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_4_count_for_reset_r_reg[16]_i_1__0 ),
        .Q(count_for_reset_r_reg[19]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[1] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_6_count_for_reset_r_reg[0]_i_1__0 ),
        .Q(count_for_reset_r_reg[1]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[20] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_7_count_for_reset_r_reg[20]_i_1__0 ),
        .Q(count_for_reset_r_reg[20]),
        .R(s_level_out_d3));
CARRY4 \count_for_reset_r_reg[20]_i_1__0 
       (.CI(\n_0_count_for_reset_r_reg[16]_i_1__0 ),
        .CO({\n_0_count_for_reset_r_reg[20]_i_1__0 ,\n_1_count_for_reset_r_reg[20]_i_1__0 ,\n_2_count_for_reset_r_reg[20]_i_1__0 ,\n_3_count_for_reset_r_reg[20]_i_1__0 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_count_for_reset_r_reg[20]_i_1__0 ,\n_5_count_for_reset_r_reg[20]_i_1__0 ,\n_6_count_for_reset_r_reg[20]_i_1__0 ,\n_7_count_for_reset_r_reg[20]_i_1__0 }),
        .S({\n_0_count_for_reset_r[20]_i_2__0 ,\n_0_count_for_reset_r[20]_i_3__0 ,\n_0_count_for_reset_r[20]_i_4__0 ,\n_0_count_for_reset_r[20]_i_5__0 }));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[21] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_6_count_for_reset_r_reg[20]_i_1__0 ),
        .Q(count_for_reset_r_reg[21]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[22] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_5_count_for_reset_r_reg[20]_i_1__0 ),
        .Q(count_for_reset_r_reg[22]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[23] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_4_count_for_reset_r_reg[20]_i_1__0 ),
        .Q(count_for_reset_r_reg[23]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[24] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_7_count_for_reset_r_reg[24]_i_1__0 ),
        .Q(count_for_reset_r_reg[24]),
        .R(s_level_out_d3));
CARRY4 \count_for_reset_r_reg[24]_i_1__0 
       (.CI(\n_0_count_for_reset_r_reg[20]_i_1__0 ),
        .CO({\NLW_count_for_reset_r_reg[24]_i_1__0_CO_UNCONNECTED [3:1],\n_3_count_for_reset_r_reg[24]_i_1__0 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\NLW_count_for_reset_r_reg[24]_i_1__0_O_UNCONNECTED [3:2],\n_6_count_for_reset_r_reg[24]_i_1__0 ,\n_7_count_for_reset_r_reg[24]_i_1__0 }),
        .S({\<const0> ,\<const0> ,\n_0_count_for_reset_r[24]_i_2__0 ,\n_0_count_for_reset_r[24]_i_3__0 }));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[25] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_6_count_for_reset_r_reg[24]_i_1__0 ),
        .Q(count_for_reset_r_reg[25]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[2] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_5_count_for_reset_r_reg[0]_i_1__0 ),
        .Q(count_for_reset_r_reg[2]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[3] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_4_count_for_reset_r_reg[0]_i_1__0 ),
        .Q(count_for_reset_r_reg[3]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[4] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_7_count_for_reset_r_reg[4]_i_1__0 ),
        .Q(count_for_reset_r_reg[4]),
        .R(s_level_out_d3));
CARRY4 \count_for_reset_r_reg[4]_i_1__0 
       (.CI(\n_0_count_for_reset_r_reg[0]_i_1__0 ),
        .CO({\n_0_count_for_reset_r_reg[4]_i_1__0 ,\n_1_count_for_reset_r_reg[4]_i_1__0 ,\n_2_count_for_reset_r_reg[4]_i_1__0 ,\n_3_count_for_reset_r_reg[4]_i_1__0 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_count_for_reset_r_reg[4]_i_1__0 ,\n_5_count_for_reset_r_reg[4]_i_1__0 ,\n_6_count_for_reset_r_reg[4]_i_1__0 ,\n_7_count_for_reset_r_reg[4]_i_1__0 }),
        .S({\n_0_count_for_reset_r[4]_i_2__0 ,\n_0_count_for_reset_r[4]_i_3__0 ,\n_0_count_for_reset_r[4]_i_4__0 ,\n_0_count_for_reset_r[4]_i_5__0 }));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[5] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_6_count_for_reset_r_reg[4]_i_1__0 ),
        .Q(count_for_reset_r_reg[5]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[6] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_5_count_for_reset_r_reg[4]_i_1__0 ),
        .Q(count_for_reset_r_reg[6]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[7] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_4_count_for_reset_r_reg[4]_i_1__0 ),
        .Q(count_for_reset_r_reg[7]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[8] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_7_count_for_reset_r_reg[8]_i_1__0 ),
        .Q(count_for_reset_r_reg[8]),
        .R(s_level_out_d3));
CARRY4 \count_for_reset_r_reg[8]_i_1__0 
       (.CI(\n_0_count_for_reset_r_reg[4]_i_1__0 ),
        .CO({\n_0_count_for_reset_r_reg[8]_i_1__0 ,\n_1_count_for_reset_r_reg[8]_i_1__0 ,\n_2_count_for_reset_r_reg[8]_i_1__0 ,\n_3_count_for_reset_r_reg[8]_i_1__0 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_count_for_reset_r_reg[8]_i_1__0 ,\n_5_count_for_reset_r_reg[8]_i_1__0 ,\n_6_count_for_reset_r_reg[8]_i_1__0 ,\n_7_count_for_reset_r_reg[8]_i_1__0 }),
        .S({\n_0_count_for_reset_r[8]_i_2__0 ,\n_0_count_for_reset_r[8]_i_3__0 ,\n_0_count_for_reset_r[8]_i_4__0 ,\n_0_count_for_reset_r[8]_i_5__0 }));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[9] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_6_count_for_reset_r_reg[8]_i_1__0 ),
        .Q(count_for_reset_r_reg[9]),
        .R(s_level_out_d3));
FDRE #(
    .INIT(1'b0)) 
     \hotplug_enable.LINK_RESET_OUT_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(link_reset_r),
        .Q(O3),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'h9D00000000000000)) 
     link_reset_r_i_1__0
       (.I0(n_0_link_reset_r_i_2__0),
        .I1(count_for_reset_r_reg[3]),
        .I2(count_for_reset_r_reg[0]),
        .I3(n_0_link_reset_r_i_3__0),
        .I4(n_0_link_reset_r_i_4__0),
        .I5(n_0_link_reset_r_i_5__0),
        .O(link_reset_0));
LUT2 #(
    .INIT(4'h7)) 
     link_reset_r_i_2__0
       (.I0(count_for_reset_r_reg[2]),
        .I1(count_for_reset_r_reg[1]),
        .O(n_0_link_reset_r_i_2__0));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     link_reset_r_i_3__0
       (.I0(count_for_reset_r_reg[10]),
        .I1(count_for_reset_r_reg[15]),
        .I2(count_for_reset_r_reg[17]),
        .I3(count_for_reset_r_reg[20]),
        .I4(count_for_reset_r_reg[16]),
        .I5(count_for_reset_r_reg[6]),
        .O(n_0_link_reset_r_i_3__0));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     link_reset_r_i_4__0
       (.I0(count_for_reset_r_reg[8]),
        .I1(count_for_reset_r_reg[7]),
        .I2(count_for_reset_r_reg[13]),
        .I3(count_for_reset_r_reg[21]),
        .I4(count_for_reset_r_reg[12]),
        .I5(count_for_reset_r_reg[23]),
        .O(n_0_link_reset_r_i_4__0));
LUT5 #(
    .INIT(32'h80000000)) 
     link_reset_r_i_5__0
       (.I0(count_for_reset_r_reg[4]),
        .I1(count_for_reset_r_reg[22]),
        .I2(count_for_reset_r_reg[5]),
        .I3(count_for_reset_r_reg[19]),
        .I4(n_0_link_reset_r_i_6__0),
        .O(n_0_link_reset_r_i_5__0));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     link_reset_r_i_6__0
       (.I0(count_for_reset_r_reg[11]),
        .I1(count_for_reset_r_reg[14]),
        .I2(count_for_reset_r_reg[9]),
        .I3(count_for_reset_r_reg[25]),
        .I4(count_for_reset_r_reg[24]),
        .I5(count_for_reset_r_reg[18]),
        .O(n_0_link_reset_r_i_6__0));
FDRE link_reset_r_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(link_reset_0),
        .Q(link_reset_r),
        .R(\<const0> ));
data_mgtdata_mgt_cdc_sync__parameterized0 rx_cc_cdc_sync
       (.init_clk_in(init_clk_in),
        .rx_cc_extend_r2(rx_cc_extend_r2),
        .s_level_out_d3(s_level_out_d3));
LUT5 #(
    .INIT(32'hFFFFFFFE)) 
     rx_cc_extend_r2_i_1__0
       (.I0(p_0_in[3]),
        .I1(p_0_in[1]),
        .I2(p_0_in[2]),
        .I3(\n_0_rx_cc_extend_r_reg[0] ),
        .I4(p_0_in[0]),
        .O(n_0_rx_cc_extend_r2_i_1__0));
FDRE rx_cc_extend_r2_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_rx_cc_extend_r2_i_1__0),
        .Q(rx_cc_extend_r2),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \rx_cc_extend_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_0_in[0]),
        .Q(\n_0_rx_cc_extend_r_reg[0] ),
        .R(I1));
FDRE #(
    .INIT(1'b0)) 
     \rx_cc_extend_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_0_in[1]),
        .Q(p_0_in[0]),
        .R(I1));
FDRE #(
    .INIT(1'b0)) 
     \rx_cc_extend_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_0_in[2]),
        .Q(p_0_in[1]),
        .R(I1));
FDRE #(
    .INIT(1'b0)) 
     \rx_cc_extend_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_0_in[3]),
        .Q(p_0_in[2]),
        .R(I1));
FDRE #(
    .INIT(1'b0)) 
     \rx_cc_extend_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(RX_CC),
        .Q(p_0_in[3]),
        .R(I1));
endmodule

(* ORIG_REF_NAME = "data_mgt_HOTPLUG" *) 
module data_mgtdata_mgt_HOTPLUG_6
   (LINK_RESET_OUT,
    init_clk_in,
    user_clk,
    I9,
    I1,
    RX_CC);
  output LINK_RESET_OUT;
  input init_clk_in;
  input user_clk;
  input I9;
  input I1;
  input RX_CC;

  wire \<const0> ;
  wire \<const1> ;
  wire I1;
  wire I9;
  wire LINK_RESET_OUT;
  wire LINK_RESET_OUT0_in;
  wire RX_CC;
  wire [25:0]count_for_reset_r_reg;
  wire init_clk_in;
  wire link_reset_0;
  wire link_reset_r;
  wire \n_0_count_for_reset_r[0]_i_2 ;
  wire \n_0_count_for_reset_r[0]_i_3 ;
  wire \n_0_count_for_reset_r[0]_i_4 ;
  wire \n_0_count_for_reset_r[0]_i_5 ;
  wire \n_0_count_for_reset_r[12]_i_2 ;
  wire \n_0_count_for_reset_r[12]_i_3 ;
  wire \n_0_count_for_reset_r[12]_i_4 ;
  wire \n_0_count_for_reset_r[12]_i_5 ;
  wire \n_0_count_for_reset_r[16]_i_2 ;
  wire \n_0_count_for_reset_r[16]_i_3 ;
  wire \n_0_count_for_reset_r[16]_i_4 ;
  wire \n_0_count_for_reset_r[16]_i_5 ;
  wire \n_0_count_for_reset_r[20]_i_2 ;
  wire \n_0_count_for_reset_r[20]_i_3 ;
  wire \n_0_count_for_reset_r[20]_i_4 ;
  wire \n_0_count_for_reset_r[20]_i_5 ;
  wire \n_0_count_for_reset_r[24]_i_2 ;
  wire \n_0_count_for_reset_r[24]_i_3 ;
  wire \n_0_count_for_reset_r[4]_i_2 ;
  wire \n_0_count_for_reset_r[4]_i_3 ;
  wire \n_0_count_for_reset_r[4]_i_4 ;
  wire \n_0_count_for_reset_r[4]_i_5 ;
  wire \n_0_count_for_reset_r[8]_i_2 ;
  wire \n_0_count_for_reset_r[8]_i_3 ;
  wire \n_0_count_for_reset_r[8]_i_4 ;
  wire \n_0_count_for_reset_r[8]_i_5 ;
  wire \n_0_count_for_reset_r_reg[0]_i_1 ;
  wire \n_0_count_for_reset_r_reg[12]_i_1 ;
  wire \n_0_count_for_reset_r_reg[16]_i_1 ;
  wire \n_0_count_for_reset_r_reg[20]_i_1 ;
  wire \n_0_count_for_reset_r_reg[4]_i_1 ;
  wire \n_0_count_for_reset_r_reg[8]_i_1 ;
  wire n_0_link_reset_r_i_2;
  wire n_0_link_reset_r_i_3;
  wire n_0_link_reset_r_i_4;
  wire n_0_link_reset_r_i_5;
  wire n_0_link_reset_r_i_6;
  wire n_0_rx_cc_extend_r2_i_1;
  wire \n_0_rx_cc_extend_r_reg[0] ;
  wire \n_1_count_for_reset_r_reg[0]_i_1 ;
  wire \n_1_count_for_reset_r_reg[12]_i_1 ;
  wire \n_1_count_for_reset_r_reg[16]_i_1 ;
  wire \n_1_count_for_reset_r_reg[20]_i_1 ;
  wire \n_1_count_for_reset_r_reg[4]_i_1 ;
  wire \n_1_count_for_reset_r_reg[8]_i_1 ;
  wire \n_2_count_for_reset_r_reg[0]_i_1 ;
  wire \n_2_count_for_reset_r_reg[12]_i_1 ;
  wire \n_2_count_for_reset_r_reg[16]_i_1 ;
  wire \n_2_count_for_reset_r_reg[20]_i_1 ;
  wire \n_2_count_for_reset_r_reg[4]_i_1 ;
  wire \n_2_count_for_reset_r_reg[8]_i_1 ;
  wire \n_3_count_for_reset_r_reg[0]_i_1 ;
  wire \n_3_count_for_reset_r_reg[12]_i_1 ;
  wire \n_3_count_for_reset_r_reg[16]_i_1 ;
  wire \n_3_count_for_reset_r_reg[20]_i_1 ;
  wire \n_3_count_for_reset_r_reg[24]_i_1 ;
  wire \n_3_count_for_reset_r_reg[4]_i_1 ;
  wire \n_3_count_for_reset_r_reg[8]_i_1 ;
  wire \n_4_count_for_reset_r_reg[0]_i_1 ;
  wire \n_4_count_for_reset_r_reg[12]_i_1 ;
  wire \n_4_count_for_reset_r_reg[16]_i_1 ;
  wire \n_4_count_for_reset_r_reg[20]_i_1 ;
  wire \n_4_count_for_reset_r_reg[4]_i_1 ;
  wire \n_4_count_for_reset_r_reg[8]_i_1 ;
  wire \n_5_count_for_reset_r_reg[0]_i_1 ;
  wire \n_5_count_for_reset_r_reg[12]_i_1 ;
  wire \n_5_count_for_reset_r_reg[16]_i_1 ;
  wire \n_5_count_for_reset_r_reg[20]_i_1 ;
  wire \n_5_count_for_reset_r_reg[4]_i_1 ;
  wire \n_5_count_for_reset_r_reg[8]_i_1 ;
  wire \n_6_count_for_reset_r_reg[0]_i_1 ;
  wire \n_6_count_for_reset_r_reg[12]_i_1 ;
  wire \n_6_count_for_reset_r_reg[16]_i_1 ;
  wire \n_6_count_for_reset_r_reg[20]_i_1 ;
  wire \n_6_count_for_reset_r_reg[24]_i_1 ;
  wire \n_6_count_for_reset_r_reg[4]_i_1 ;
  wire \n_6_count_for_reset_r_reg[8]_i_1 ;
  wire \n_7_count_for_reset_r_reg[0]_i_1 ;
  wire \n_7_count_for_reset_r_reg[12]_i_1 ;
  wire \n_7_count_for_reset_r_reg[16]_i_1 ;
  wire \n_7_count_for_reset_r_reg[20]_i_1 ;
  wire \n_7_count_for_reset_r_reg[24]_i_1 ;
  wire \n_7_count_for_reset_r_reg[4]_i_1 ;
  wire \n_7_count_for_reset_r_reg[8]_i_1 ;
  wire [3:0]p_0_in;
  wire rx_cc_extend_r2;
  wire s_level_out_d3;
  wire user_clk;
  wire [3:1]\NLW_count_for_reset_r_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_count_for_reset_r_reg[24]_i_1_O_UNCONNECTED ;

GND GND
       (.G(\<const0> ));
LUT2 #(
    .INIT(4'hE)) 
     LINK_RESET_OUT_INST_0
       (.I0(LINK_RESET_OUT0_in),
        .I1(I9),
        .O(LINK_RESET_OUT));
VCC VCC
       (.P(\<const1> ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[0]_i_2 
       (.I0(count_for_reset_r_reg[3]),
        .O(\n_0_count_for_reset_r[0]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[0]_i_3 
       (.I0(count_for_reset_r_reg[2]),
        .O(\n_0_count_for_reset_r[0]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[0]_i_4 
       (.I0(count_for_reset_r_reg[1]),
        .O(\n_0_count_for_reset_r[0]_i_4 ));
LUT1 #(
    .INIT(2'h1)) 
     \count_for_reset_r[0]_i_5 
       (.I0(count_for_reset_r_reg[0]),
        .O(\n_0_count_for_reset_r[0]_i_5 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[12]_i_2 
       (.I0(count_for_reset_r_reg[15]),
        .O(\n_0_count_for_reset_r[12]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[12]_i_3 
       (.I0(count_for_reset_r_reg[14]),
        .O(\n_0_count_for_reset_r[12]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[12]_i_4 
       (.I0(count_for_reset_r_reg[13]),
        .O(\n_0_count_for_reset_r[12]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[12]_i_5 
       (.I0(count_for_reset_r_reg[12]),
        .O(\n_0_count_for_reset_r[12]_i_5 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[16]_i_2 
       (.I0(count_for_reset_r_reg[19]),
        .O(\n_0_count_for_reset_r[16]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[16]_i_3 
       (.I0(count_for_reset_r_reg[18]),
        .O(\n_0_count_for_reset_r[16]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[16]_i_4 
       (.I0(count_for_reset_r_reg[17]),
        .O(\n_0_count_for_reset_r[16]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[16]_i_5 
       (.I0(count_for_reset_r_reg[16]),
        .O(\n_0_count_for_reset_r[16]_i_5 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[20]_i_2 
       (.I0(count_for_reset_r_reg[23]),
        .O(\n_0_count_for_reset_r[20]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[20]_i_3 
       (.I0(count_for_reset_r_reg[22]),
        .O(\n_0_count_for_reset_r[20]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[20]_i_4 
       (.I0(count_for_reset_r_reg[21]),
        .O(\n_0_count_for_reset_r[20]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[20]_i_5 
       (.I0(count_for_reset_r_reg[20]),
        .O(\n_0_count_for_reset_r[20]_i_5 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[24]_i_2 
       (.I0(count_for_reset_r_reg[25]),
        .O(\n_0_count_for_reset_r[24]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[24]_i_3 
       (.I0(count_for_reset_r_reg[24]),
        .O(\n_0_count_for_reset_r[24]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[4]_i_2 
       (.I0(count_for_reset_r_reg[7]),
        .O(\n_0_count_for_reset_r[4]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[4]_i_3 
       (.I0(count_for_reset_r_reg[6]),
        .O(\n_0_count_for_reset_r[4]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[4]_i_4 
       (.I0(count_for_reset_r_reg[5]),
        .O(\n_0_count_for_reset_r[4]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[4]_i_5 
       (.I0(count_for_reset_r_reg[4]),
        .O(\n_0_count_for_reset_r[4]_i_5 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[8]_i_2 
       (.I0(count_for_reset_r_reg[11]),
        .O(\n_0_count_for_reset_r[8]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[8]_i_3 
       (.I0(count_for_reset_r_reg[10]),
        .O(\n_0_count_for_reset_r[8]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[8]_i_4 
       (.I0(count_for_reset_r_reg[9]),
        .O(\n_0_count_for_reset_r[8]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \count_for_reset_r[8]_i_5 
       (.I0(count_for_reset_r_reg[8]),
        .O(\n_0_count_for_reset_r[8]_i_5 ));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[0] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_7_count_for_reset_r_reg[0]_i_1 ),
        .Q(count_for_reset_r_reg[0]),
        .R(s_level_out_d3));
CARRY4 \count_for_reset_r_reg[0]_i_1 
       (.CI(\<const0> ),
        .CO({\n_0_count_for_reset_r_reg[0]_i_1 ,\n_1_count_for_reset_r_reg[0]_i_1 ,\n_2_count_for_reset_r_reg[0]_i_1 ,\n_3_count_for_reset_r_reg[0]_i_1 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const1> }),
        .O({\n_4_count_for_reset_r_reg[0]_i_1 ,\n_5_count_for_reset_r_reg[0]_i_1 ,\n_6_count_for_reset_r_reg[0]_i_1 ,\n_7_count_for_reset_r_reg[0]_i_1 }),
        .S({\n_0_count_for_reset_r[0]_i_2 ,\n_0_count_for_reset_r[0]_i_3 ,\n_0_count_for_reset_r[0]_i_4 ,\n_0_count_for_reset_r[0]_i_5 }));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[10] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_5_count_for_reset_r_reg[8]_i_1 ),
        .Q(count_for_reset_r_reg[10]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[11] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_4_count_for_reset_r_reg[8]_i_1 ),
        .Q(count_for_reset_r_reg[11]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[12] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_7_count_for_reset_r_reg[12]_i_1 ),
        .Q(count_for_reset_r_reg[12]),
        .R(s_level_out_d3));
CARRY4 \count_for_reset_r_reg[12]_i_1 
       (.CI(\n_0_count_for_reset_r_reg[8]_i_1 ),
        .CO({\n_0_count_for_reset_r_reg[12]_i_1 ,\n_1_count_for_reset_r_reg[12]_i_1 ,\n_2_count_for_reset_r_reg[12]_i_1 ,\n_3_count_for_reset_r_reg[12]_i_1 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_count_for_reset_r_reg[12]_i_1 ,\n_5_count_for_reset_r_reg[12]_i_1 ,\n_6_count_for_reset_r_reg[12]_i_1 ,\n_7_count_for_reset_r_reg[12]_i_1 }),
        .S({\n_0_count_for_reset_r[12]_i_2 ,\n_0_count_for_reset_r[12]_i_3 ,\n_0_count_for_reset_r[12]_i_4 ,\n_0_count_for_reset_r[12]_i_5 }));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[13] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_6_count_for_reset_r_reg[12]_i_1 ),
        .Q(count_for_reset_r_reg[13]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[14] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_5_count_for_reset_r_reg[12]_i_1 ),
        .Q(count_for_reset_r_reg[14]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[15] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_4_count_for_reset_r_reg[12]_i_1 ),
        .Q(count_for_reset_r_reg[15]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[16] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_7_count_for_reset_r_reg[16]_i_1 ),
        .Q(count_for_reset_r_reg[16]),
        .R(s_level_out_d3));
CARRY4 \count_for_reset_r_reg[16]_i_1 
       (.CI(\n_0_count_for_reset_r_reg[12]_i_1 ),
        .CO({\n_0_count_for_reset_r_reg[16]_i_1 ,\n_1_count_for_reset_r_reg[16]_i_1 ,\n_2_count_for_reset_r_reg[16]_i_1 ,\n_3_count_for_reset_r_reg[16]_i_1 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_count_for_reset_r_reg[16]_i_1 ,\n_5_count_for_reset_r_reg[16]_i_1 ,\n_6_count_for_reset_r_reg[16]_i_1 ,\n_7_count_for_reset_r_reg[16]_i_1 }),
        .S({\n_0_count_for_reset_r[16]_i_2 ,\n_0_count_for_reset_r[16]_i_3 ,\n_0_count_for_reset_r[16]_i_4 ,\n_0_count_for_reset_r[16]_i_5 }));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[17] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_6_count_for_reset_r_reg[16]_i_1 ),
        .Q(count_for_reset_r_reg[17]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[18] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_5_count_for_reset_r_reg[16]_i_1 ),
        .Q(count_for_reset_r_reg[18]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[19] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_4_count_for_reset_r_reg[16]_i_1 ),
        .Q(count_for_reset_r_reg[19]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[1] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_6_count_for_reset_r_reg[0]_i_1 ),
        .Q(count_for_reset_r_reg[1]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[20] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_7_count_for_reset_r_reg[20]_i_1 ),
        .Q(count_for_reset_r_reg[20]),
        .R(s_level_out_d3));
CARRY4 \count_for_reset_r_reg[20]_i_1 
       (.CI(\n_0_count_for_reset_r_reg[16]_i_1 ),
        .CO({\n_0_count_for_reset_r_reg[20]_i_1 ,\n_1_count_for_reset_r_reg[20]_i_1 ,\n_2_count_for_reset_r_reg[20]_i_1 ,\n_3_count_for_reset_r_reg[20]_i_1 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_count_for_reset_r_reg[20]_i_1 ,\n_5_count_for_reset_r_reg[20]_i_1 ,\n_6_count_for_reset_r_reg[20]_i_1 ,\n_7_count_for_reset_r_reg[20]_i_1 }),
        .S({\n_0_count_for_reset_r[20]_i_2 ,\n_0_count_for_reset_r[20]_i_3 ,\n_0_count_for_reset_r[20]_i_4 ,\n_0_count_for_reset_r[20]_i_5 }));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[21] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_6_count_for_reset_r_reg[20]_i_1 ),
        .Q(count_for_reset_r_reg[21]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[22] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_5_count_for_reset_r_reg[20]_i_1 ),
        .Q(count_for_reset_r_reg[22]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[23] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_4_count_for_reset_r_reg[20]_i_1 ),
        .Q(count_for_reset_r_reg[23]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[24] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_7_count_for_reset_r_reg[24]_i_1 ),
        .Q(count_for_reset_r_reg[24]),
        .R(s_level_out_d3));
CARRY4 \count_for_reset_r_reg[24]_i_1 
       (.CI(\n_0_count_for_reset_r_reg[20]_i_1 ),
        .CO({\NLW_count_for_reset_r_reg[24]_i_1_CO_UNCONNECTED [3:1],\n_3_count_for_reset_r_reg[24]_i_1 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\NLW_count_for_reset_r_reg[24]_i_1_O_UNCONNECTED [3:2],\n_6_count_for_reset_r_reg[24]_i_1 ,\n_7_count_for_reset_r_reg[24]_i_1 }),
        .S({\<const0> ,\<const0> ,\n_0_count_for_reset_r[24]_i_2 ,\n_0_count_for_reset_r[24]_i_3 }));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[25] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_6_count_for_reset_r_reg[24]_i_1 ),
        .Q(count_for_reset_r_reg[25]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[2] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_5_count_for_reset_r_reg[0]_i_1 ),
        .Q(count_for_reset_r_reg[2]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[3] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_4_count_for_reset_r_reg[0]_i_1 ),
        .Q(count_for_reset_r_reg[3]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[4] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_7_count_for_reset_r_reg[4]_i_1 ),
        .Q(count_for_reset_r_reg[4]),
        .R(s_level_out_d3));
CARRY4 \count_for_reset_r_reg[4]_i_1 
       (.CI(\n_0_count_for_reset_r_reg[0]_i_1 ),
        .CO({\n_0_count_for_reset_r_reg[4]_i_1 ,\n_1_count_for_reset_r_reg[4]_i_1 ,\n_2_count_for_reset_r_reg[4]_i_1 ,\n_3_count_for_reset_r_reg[4]_i_1 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_count_for_reset_r_reg[4]_i_1 ,\n_5_count_for_reset_r_reg[4]_i_1 ,\n_6_count_for_reset_r_reg[4]_i_1 ,\n_7_count_for_reset_r_reg[4]_i_1 }),
        .S({\n_0_count_for_reset_r[4]_i_2 ,\n_0_count_for_reset_r[4]_i_3 ,\n_0_count_for_reset_r[4]_i_4 ,\n_0_count_for_reset_r[4]_i_5 }));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[5] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_6_count_for_reset_r_reg[4]_i_1 ),
        .Q(count_for_reset_r_reg[5]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[6] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_5_count_for_reset_r_reg[4]_i_1 ),
        .Q(count_for_reset_r_reg[6]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[7] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_4_count_for_reset_r_reg[4]_i_1 ),
        .Q(count_for_reset_r_reg[7]),
        .R(s_level_out_d3));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[8] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_7_count_for_reset_r_reg[8]_i_1 ),
        .Q(count_for_reset_r_reg[8]),
        .R(s_level_out_d3));
CARRY4 \count_for_reset_r_reg[8]_i_1 
       (.CI(\n_0_count_for_reset_r_reg[4]_i_1 ),
        .CO({\n_0_count_for_reset_r_reg[8]_i_1 ,\n_1_count_for_reset_r_reg[8]_i_1 ,\n_2_count_for_reset_r_reg[8]_i_1 ,\n_3_count_for_reset_r_reg[8]_i_1 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_count_for_reset_r_reg[8]_i_1 ,\n_5_count_for_reset_r_reg[8]_i_1 ,\n_6_count_for_reset_r_reg[8]_i_1 ,\n_7_count_for_reset_r_reg[8]_i_1 }),
        .S({\n_0_count_for_reset_r[8]_i_2 ,\n_0_count_for_reset_r[8]_i_3 ,\n_0_count_for_reset_r[8]_i_4 ,\n_0_count_for_reset_r[8]_i_5 }));
(* counter = "18" *) 
   FDRE #(
    .INIT(1'b0)) 
     \count_for_reset_r_reg[9] 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_6_count_for_reset_r_reg[8]_i_1 ),
        .Q(count_for_reset_r_reg[9]),
        .R(s_level_out_d3));
FDRE #(
    .INIT(1'b0)) 
     \hotplug_enable.LINK_RESET_OUT_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(link_reset_r),
        .Q(LINK_RESET_OUT0_in),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'h9D00000000000000)) 
     link_reset_r_i_1
       (.I0(n_0_link_reset_r_i_2),
        .I1(count_for_reset_r_reg[3]),
        .I2(count_for_reset_r_reg[0]),
        .I3(n_0_link_reset_r_i_3),
        .I4(n_0_link_reset_r_i_4),
        .I5(n_0_link_reset_r_i_5),
        .O(link_reset_0));
LUT2 #(
    .INIT(4'h7)) 
     link_reset_r_i_2
       (.I0(count_for_reset_r_reg[2]),
        .I1(count_for_reset_r_reg[1]),
        .O(n_0_link_reset_r_i_2));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     link_reset_r_i_3
       (.I0(count_for_reset_r_reg[10]),
        .I1(count_for_reset_r_reg[15]),
        .I2(count_for_reset_r_reg[17]),
        .I3(count_for_reset_r_reg[20]),
        .I4(count_for_reset_r_reg[16]),
        .I5(count_for_reset_r_reg[6]),
        .O(n_0_link_reset_r_i_3));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     link_reset_r_i_4
       (.I0(count_for_reset_r_reg[8]),
        .I1(count_for_reset_r_reg[7]),
        .I2(count_for_reset_r_reg[13]),
        .I3(count_for_reset_r_reg[21]),
        .I4(count_for_reset_r_reg[12]),
        .I5(count_for_reset_r_reg[23]),
        .O(n_0_link_reset_r_i_4));
LUT5 #(
    .INIT(32'h80000000)) 
     link_reset_r_i_5
       (.I0(count_for_reset_r_reg[4]),
        .I1(count_for_reset_r_reg[22]),
        .I2(count_for_reset_r_reg[5]),
        .I3(count_for_reset_r_reg[19]),
        .I4(n_0_link_reset_r_i_6),
        .O(n_0_link_reset_r_i_5));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     link_reset_r_i_6
       (.I0(count_for_reset_r_reg[11]),
        .I1(count_for_reset_r_reg[14]),
        .I2(count_for_reset_r_reg[9]),
        .I3(count_for_reset_r_reg[25]),
        .I4(count_for_reset_r_reg[24]),
        .I5(count_for_reset_r_reg[18]),
        .O(n_0_link_reset_r_i_6));
FDRE link_reset_r_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(link_reset_0),
        .Q(link_reset_r),
        .R(\<const0> ));
data_mgtdata_mgt_cdc_sync__parameterized0_8 rx_cc_cdc_sync
       (.init_clk_in(init_clk_in),
        .rx_cc_extend_r2(rx_cc_extend_r2),
        .s_level_out_d3(s_level_out_d3));
LUT5 #(
    .INIT(32'hFFFFFFFE)) 
     rx_cc_extend_r2_i_1
       (.I0(p_0_in[3]),
        .I1(p_0_in[1]),
        .I2(p_0_in[2]),
        .I3(\n_0_rx_cc_extend_r_reg[0] ),
        .I4(p_0_in[0]),
        .O(n_0_rx_cc_extend_r2_i_1));
FDRE rx_cc_extend_r2_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_rx_cc_extend_r2_i_1),
        .Q(rx_cc_extend_r2),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \rx_cc_extend_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_0_in[0]),
        .Q(\n_0_rx_cc_extend_r_reg[0] ),
        .R(I1));
FDRE #(
    .INIT(1'b0)) 
     \rx_cc_extend_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_0_in[1]),
        .Q(p_0_in[0]),
        .R(I1));
FDRE #(
    .INIT(1'b0)) 
     \rx_cc_extend_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_0_in[2]),
        .Q(p_0_in[1]),
        .R(I1));
FDRE #(
    .INIT(1'b0)) 
     \rx_cc_extend_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_0_in[3]),
        .Q(p_0_in[2]),
        .R(I1));
FDRE #(
    .INIT(1'b0)) 
     \rx_cc_extend_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(RX_CC),
        .Q(p_0_in[3]),
        .R(I1));
endmodule

module data_mgtdata_mgt_IDLE_AND_VER_GEN
   (I14,
    D,
    GEN_A,
    O3,
    I16,
    O4,
    I15,
    O5,
    txver_count_r0,
    user_clk,
    GEN_VER,
    sys_reset_out);
  output [2:0]I14;
  output [2:0]D;
  output GEN_A;
  output O3;
  output [3:0]I16;
  output [3:0]O4;
  output [3:0]I15;
  output [3:0]O5;
  output txver_count_r0;
  input user_clk;
  input GEN_VER;
  input sys_reset_out;

  wire \<const0> ;
  wire \<const1> ;
  wire [2:0]D;
  wire D0_out;
  wire D1_out;
  wire DID_VER;
  wire D_0;
  wire GEN_A;
  wire GEN_VER;
  wire GND_2;
  wire [2:0]I14;
  wire [3:0]I15;
  wire [3:0]I16;
  wire O3;
  wire [3:0]O4;
  wire [3:0]O5;
  wire Q;
  wire VCC_2;
  wire [0:2]down_count_r;
  wire \n_0_down_count_r[0]_i_1 ;
  wire \n_0_down_count_r[1]_i_1 ;
  wire \n_0_downcounter_r[0]_i_1 ;
  wire \n_0_downcounter_r[1]_i_1 ;
  wire \n_0_downcounter_r[2]_i_1 ;
  wire \n_0_downcounter_r_reg[0] ;
  wire \n_0_downcounter_r_reg[1] ;
  wire \n_0_downcounter_r_reg[2] ;
  wire n_0_gen_k_flop_0_i_i_1;
  wire n_0_gen_k_flop_2_i_i_1;
  wire n_0_gen_k_flop_3_i_i_1;
  wire n_0_gen_r_flop_0_i_i_1;
  wire \n_0_lfsr_reg[3]_i_1 ;
  wire \n_0_lfsr_reg_reg[0] ;
  wire n_0_ver_counter_i_i_1;
  wire p_0_in;
  wire p_1_in;
  wire [1:1]p_4_out;
  wire prev_cycle_gen_ver_r;
  wire sys_reset_out;
  wire txver_count_r0;
  wire user_clk;

FDRE DID_VER_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(Q),
        .Q(DID_VER),
        .R(\<const0> ));
GND GND
       (.G(\<const0> ));
GND GND_1
       (.G(GND_2));
VCC VCC
       (.P(\<const1> ));
VCC VCC_1
       (.P(VCC_2));
(* SOFT_HLUTNM = "soft_lutpair116" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \down_count_r[0]_i_1 
       (.I0(p_0_in),
        .I1(p_4_out),
        .O(\n_0_down_count_r[0]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair118" *) 
   LUT2 #(
    .INIT(4'h9)) 
     \down_count_r[1]_i_1 
       (.I0(p_0_in),
        .I1(p_4_out),
        .O(\n_0_down_count_r[1]_i_1 ));
FDRE #(
    .INIT(1'b0)) 
     \down_count_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_down_count_r[0]_i_1 ),
        .Q(down_count_r[0]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \down_count_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_down_count_r[1]_i_1 ),
        .Q(down_count_r[1]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \down_count_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_gen_k_flop_3_i_i_1),
        .Q(down_count_r[2]),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair115" *) 
   LUT4 #(
    .INIT(16'hF0C2)) 
     \downcounter_r[0]_i_1 
       (.I0(down_count_r[0]),
        .I1(\n_0_downcounter_r_reg[2] ),
        .I2(\n_0_downcounter_r_reg[0] ),
        .I3(\n_0_downcounter_r_reg[1] ),
        .O(\n_0_downcounter_r[0]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair115" *) 
   LUT4 #(
    .INIT(16'hCC32)) 
     \downcounter_r[1]_i_1 
       (.I0(down_count_r[1]),
        .I1(\n_0_downcounter_r_reg[2] ),
        .I2(\n_0_downcounter_r_reg[0] ),
        .I3(\n_0_downcounter_r_reg[1] ),
        .O(\n_0_downcounter_r[1]_i_1 ));
LUT4 #(
    .INIT(16'h5554)) 
     \downcounter_r[2]_i_1 
       (.I0(\n_0_downcounter_r_reg[2] ),
        .I1(\n_0_downcounter_r_reg[1] ),
        .I2(\n_0_downcounter_r_reg[0] ),
        .I3(down_count_r[2]),
        .O(\n_0_downcounter_r[2]_i_1 ));
FDRE #(
    .INIT(1'b0)) 
     \downcounter_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_downcounter_r[0]_i_1 ),
        .Q(\n_0_downcounter_r_reg[0] ),
        .R(sys_reset_out));
FDRE #(
    .INIT(1'b0)) 
     \downcounter_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_downcounter_r[1]_i_1 ),
        .Q(\n_0_downcounter_r_reg[1] ),
        .R(sys_reset_out));
FDRE #(
    .INIT(1'b0)) 
     \downcounter_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_downcounter_r[2]_i_1 ),
        .Q(\n_0_downcounter_r_reg[2] ),
        .R(sys_reset_out));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_a_flop_0_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(D1_out),
        .Q(GEN_A),
        .R(GND_2));
(* SOFT_HLUTNM = "soft_lutpair114" *) 
   LUT5 #(
    .INIT(32'h00010101)) 
     gen_a_flop_0_i_i_1
       (.I0(\n_0_downcounter_r_reg[1] ),
        .I1(\n_0_downcounter_r_reg[0] ),
        .I2(\n_0_downcounter_r_reg[2] ),
        .I3(GEN_VER),
        .I4(DID_VER),
        .O(D1_out));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_a_flop_1_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(D1_out),
        .Q(O3),
        .R(GND_2));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_k_flop_0_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(n_0_gen_k_flop_0_i_i_1),
        .Q(I16[3]),
        .R(GND_2));
LUT6 #(
    .INIT(64'hD5D5D5D5D5D5D5C0)) 
     gen_k_flop_0_i_i_1
       (.I0(\n_0_lfsr_reg_reg[0] ),
        .I1(DID_VER),
        .I2(GEN_VER),
        .I3(\n_0_downcounter_r_reg[2] ),
        .I4(\n_0_downcounter_r_reg[0] ),
        .I5(\n_0_downcounter_r_reg[1] ),
        .O(n_0_gen_k_flop_0_i_i_1));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_k_flop_1_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(D_0),
        .Q(I16[2]),
        .R(GND_2));
LUT1 #(
    .INIT(2'h1)) 
     gen_k_flop_1_i_i_1
       (.I0(p_1_in),
        .O(D_0));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_k_flop_2_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(n_0_gen_k_flop_2_i_i_1),
        .Q(I16[1]),
        .R(GND_2));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair118" *) 
   LUT1 #(
    .INIT(2'h1)) 
     gen_k_flop_2_i_i_1
       (.I0(p_0_in),
        .O(n_0_gen_k_flop_2_i_i_1));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_k_flop_3_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(n_0_gen_k_flop_3_i_i_1),
        .Q(I16[0]),
        .R(GND_2));
LUT1 #(
    .INIT(2'h1)) 
     gen_k_flop_3_i_i_1
       (.I0(p_4_out),
        .O(n_0_gen_k_flop_3_i_i_1));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_k_flop_4_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(n_0_gen_k_flop_0_i_i_1),
        .Q(O4[3]),
        .R(GND_2));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_k_flop_5_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(D_0),
        .Q(O4[2]),
        .R(GND_2));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_k_flop_6_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(n_0_gen_k_flop_2_i_i_1),
        .Q(O4[1]),
        .R(GND_2));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_k_flop_7_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(n_0_gen_k_flop_3_i_i_1),
        .Q(O4[0]),
        .R(GND_2));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_r_flop_0_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(n_0_gen_r_flop_0_i_i_1),
        .Q(I15[3]),
        .R(GND_2));
LUT6 #(
    .INIT(64'h0000FE00FE00FE00)) 
     gen_r_flop_0_i_i_1
       (.I0(\n_0_downcounter_r_reg[1] ),
        .I1(\n_0_downcounter_r_reg[0] ),
        .I2(\n_0_downcounter_r_reg[2] ),
        .I3(\n_0_lfsr_reg_reg[0] ),
        .I4(DID_VER),
        .I5(GEN_VER),
        .O(n_0_gen_r_flop_0_i_i_1));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_r_flop_1_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(p_1_in),
        .Q(I15[2]),
        .R(GND_2));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_r_flop_2_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(p_0_in),
        .Q(I15[1]),
        .R(GND_2));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_r_flop_3_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(p_4_out),
        .Q(I15[0]),
        .R(GND_2));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_r_flop_4_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(n_0_gen_r_flop_0_i_i_1),
        .Q(O5[3]),
        .R(GND_2));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_r_flop_5_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(p_1_in),
        .Q(O5[2]),
        .R(GND_2));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_r_flop_6_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(p_0_in),
        .Q(O5[1]),
        .R(GND_2));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_r_flop_7_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(p_4_out),
        .Q(O5[0]),
        .R(GND_2));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_v_flop_1_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(D0_out),
        .Q(I14[2]),
        .R(GND_2));
(* SOFT_HLUTNM = "soft_lutpair117" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gen_v_flop_1_i_i_1
       (.I0(DID_VER),
        .I1(GEN_VER),
        .O(D0_out));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_v_flop_2_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(D0_out),
        .Q(I14[1]),
        .R(GND_2));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_v_flop_3_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(D0_out),
        .Q(I14[0]),
        .R(GND_2));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_v_flop_5_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(D0_out),
        .Q(D[2]),
        .R(GND_2));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_v_flop_6_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(D0_out),
        .Q(D[1]),
        .R(GND_2));
(* XILINX_LEGACY_PRIM = "FD" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_v_flop_7_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(D0_out),
        .Q(D[0]),
        .R(GND_2));
(* SOFT_HLUTNM = "soft_lutpair116" *) 
   LUT4 #(
    .INIT(16'h55A9)) 
     \lfsr_reg[3]_i_1 
       (.I0(\n_0_lfsr_reg_reg[0] ),
        .I1(p_1_in),
        .I2(p_0_in),
        .I3(p_4_out),
        .O(\n_0_lfsr_reg[3]_i_1 ));
FDRE #(
    .INIT(1'b0)) 
     \lfsr_reg_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_1_in),
        .Q(\n_0_lfsr_reg_reg[0] ),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \lfsr_reg_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_0_in),
        .Q(p_1_in),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \lfsr_reg_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_4_out),
        .Q(p_0_in),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \lfsr_reg_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_lfsr_reg[3]_i_1 ),
        .Q(p_4_out),
        .R(\<const0> ));
FDRE prev_cycle_gen_ver_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GEN_VER),
        .Q(prev_cycle_gen_ver_r),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair114" *) 
   LUT2 #(
    .INIT(4'hB)) 
     \txver_count_r_reg[6]_srl7_i_1 
       (.I0(DID_VER),
        .I1(GEN_VER),
        .O(txver_count_r0));
(* BOX_TYPE = "PRIMITIVE" *) 
   (* XILINX_LEGACY_PRIM = "SRL16" *) 
   (* srl_name = "U0/\data_mgt_global_logic_i/idle_and_ver_gen_i/ver_counter_i " *) 
   SRL16E #(
    .INIT(16'h0000)) 
     ver_counter_i
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const1> ),
        .A3(\<const1> ),
        .CE(VCC_2),
        .CLK(user_clk),
        .D(n_0_ver_counter_i_i_1),
        .Q(Q));
(* SOFT_HLUTNM = "soft_lutpair117" *) 
   LUT3 #(
    .INIT(8'h8A)) 
     ver_counter_i_i_1
       (.I0(GEN_VER),
        .I1(DID_VER),
        .I2(prev_cycle_gen_ver_r),
        .O(n_0_ver_counter_i_i_1));
endmodule

module data_mgtdata_mgt_LANE_INIT_SM_4BYTE
   (LANE_UP,
    ready_r,
    O1,
    GEN_SPA,
    ENABLE_ERR_DETECT,
    RXPOLARITY_IN_LANE1,
    GEN_SP,
    good_cnt_r3,
    O10,
    O15,
    I1,
    user_clk,
    begin_r0,
    counter3_r0,
    counter4_r0,
    RXREALIGN_OUT_LANE1,
    GT1_RXDISPERR_OUT,
    I10,
    RX_NEG_Buffer,
    GT1_RXCHARISK_OUT,
    first_v_received_r,
    I11,
    D);
  output [0:0]LANE_UP;
  output ready_r;
  output O1;
  output GEN_SPA;
  output ENABLE_ERR_DETECT;
  output RXPOLARITY_IN_LANE1;
  output GEN_SP;
  output good_cnt_r3;
  output O10;
  output O15;
  input I1;
  input user_clk;
  input begin_r0;
  input counter3_r0;
  input counter4_r0;
  input RXREALIGN_OUT_LANE1;
  input [1:0]GT1_RXDISPERR_OUT;
  input I10;
  input RX_NEG_Buffer;
  input [1:0]GT1_RXCHARISK_OUT;
  input first_v_received_r;
  input [0:0]I11;
  input [3:0]D;

  wire \<const0> ;
  wire \<const1> ;
  wire [3:0]D;
  wire ENABLE_ERR_DETECT;
  wire ENABLE_ERR_DETECT_Buffer0;
  wire GEN_SP;
  wire GEN_SPA;
  wire [1:0]GT1_RXCHARISK_OUT;
  wire [1:0]GT1_RXDISPERR_OUT;
  wire I1;
  wire I10;
  wire [0:0]I11;
  wire [0:0]LANE_UP;
  wire O1;
  wire O10;
  wire O15;
  wire RXPOLARITY_IN_LANE1;
  wire RXREALIGN_OUT_LANE1;
  wire RX_NEG_Buffer;
  wire VCC_2;
  wire begin_r;
  wire begin_r0;
  wire consecutive_commas_r;
  wire consecutive_commas_r0;
  wire count_128d_done_r;
  wire count_32d_done_r;
  wire count_8d_done_r;
  wire [15:15]counter2_r;
  wire [3:3]counter3_r;
  wire counter3_r0;
  wire [15:15]counter4_r;
  wire counter4_r0;
  wire [15:15]counter5_r;
  wire counter5_r0;
  wire do_watchdog_count_r;
  wire do_watchdog_count_r0;
  wire first_v_received_r;
  wire good_cnt_r3;
  wire inc_count_c;
  wire \n_0_RX_CHAR_IS_COMMA_R_reg[0] ;
  wire \n_0_RX_CHAR_IS_COMMA_R_reg[3] ;
  wire n_0_begin_r_i_2__0;
  wire \n_0_counter1_r[0]_i_3__0 ;
  wire \n_0_counter1_r_reg[1] ;
  wire \n_0_counter1_r_reg[3] ;
  wire \n_0_counter1_r_reg[5] ;
  wire \n_0_counter1_r_reg[6] ;
  wire \n_0_counter1_r_reg[7] ;
  wire \n_0_counter2_r_reg[14]_srl15 ;
  wire \n_0_counter3_r_reg[2]_srl3 ;
  wire \n_0_counter4_r_reg[14]_srl15 ;
  wire \n_0_counter5_r_reg[14]_srl15 ;
  wire n_0_reset_count_r_i_3__0;
  wire n_0_rst_r_reg;
  wire n_0_rx_polarity_r_i_1__0;
  wire next_ack_c;
  wire next_align_c;
  wire next_begin_c;
  wire next_polarity_c;
  wire next_ready_c;
  wire next_realign_c;
  wire next_rst_c;
  wire [7:0]p_0_in;
  wire p_0_in2_in;
  wire p_1_in;
  wire polarity_r;
  wire prev_count_128d_done_r;
  wire ready_r;
  wire realign_r;
  wire reset_count_r;
  wire reset_count_r0;
  wire user_clk;

(* SOFT_HLUTNM = "soft_lutpair175" *) 
   LUT2 #(
    .INIT(4'hE)) 
     ENABLE_ERR_DETECT_Buffer_i_1__0
       (.I0(GEN_SPA),
        .I1(ready_r),
        .O(ENABLE_ERR_DETECT_Buffer0));
FDRE ENABLE_ERR_DETECT_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(ENABLE_ERR_DETECT_Buffer0),
        .Q(ENABLE_ERR_DETECT),
        .R(\<const0> ));
GND GND
       (.G(\<const0> ));
FDRE \RX_CHAR_IS_COMMA_R_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[0]),
        .Q(\n_0_RX_CHAR_IS_COMMA_R_reg[0] ),
        .R(\<const0> ));
FDRE \RX_CHAR_IS_COMMA_R_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[1]),
        .Q(p_1_in),
        .R(\<const0> ));
FDRE \RX_CHAR_IS_COMMA_R_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[2]),
        .Q(p_0_in2_in),
        .R(\<const0> ));
FDRE \RX_CHAR_IS_COMMA_R_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[3]),
        .Q(\n_0_RX_CHAR_IS_COMMA_R_reg[3] ),
        .R(\<const0> ));
VCC VCC
       (.P(\<const1> ));
VCC VCC_1
       (.P(VCC_2));
LUT6 #(
    .INIT(64'h0444FFFF04440444)) 
     ack_r_i_1__0
       (.I0(counter5_r),
        .I1(GEN_SPA),
        .I2(counter3_r),
        .I3(counter2_r),
        .I4(RX_NEG_Buffer),
        .I5(polarity_r),
        .O(next_ack_c));
FDRE ack_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_ack_c),
        .Q(GEN_SPA),
        .R(begin_r0));
LUT4 #(
    .INIT(16'hF444)) 
     align_r_i_2__0
       (.I0(count_128d_done_r),
        .I1(O1),
        .I2(count_8d_done_r),
        .I3(n_0_rst_r_reg),
        .O(next_align_c));
FDRE align_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_align_c),
        .Q(O1),
        .R(begin_r0));
LUT5 #(
    .INIT(32'hFFFFF888)) 
     begin_r_i_1__0
       (.I0(GEN_SPA),
        .I1(counter5_r),
        .I2(realign_r),
        .I3(RXREALIGN_OUT_LANE1),
        .I4(n_0_begin_r_i_2__0),
        .O(next_begin_c));
(* SOFT_HLUTNM = "soft_lutpair172" *) 
   LUT4 #(
    .INIT(16'hF888)) 
     begin_r_i_2__0
       (.I0(polarity_r),
        .I1(RX_NEG_Buffer),
        .I2(counter4_r),
        .I3(ready_r),
        .O(n_0_begin_r_i_2__0));
FDSE begin_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_begin_c),
        .Q(begin_r),
        .S(begin_r0));
LUT5 #(
    .INIT(32'hFFFFFFFD)) 
     consecutive_commas_r_i_1__0
       (.I0(O1),
        .I1(\n_0_RX_CHAR_IS_COMMA_R_reg[0] ),
        .I2(p_0_in2_in),
        .I3(p_1_in),
        .I4(\n_0_RX_CHAR_IS_COMMA_R_reg[3] ),
        .O(consecutive_commas_r0));
FDRE consecutive_commas_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(consecutive_commas_r0),
        .Q(consecutive_commas_r),
        .R(\<const0> ));
LUT5 #(
    .INIT(32'hFFFFFFFD)) 
     \counter1_r[0]_i_1__0 
       (.I0(O1),
        .I1(\n_0_RX_CHAR_IS_COMMA_R_reg[0] ),
        .I2(p_0_in2_in),
        .I3(p_1_in),
        .I4(\n_0_RX_CHAR_IS_COMMA_R_reg[3] ),
        .O(inc_count_c));
(* SOFT_HLUTNM = "soft_lutpair173" *) 
   LUT3 #(
    .INIT(8'h6A)) 
     \counter1_r[0]_i_2__0 
       (.I0(count_128d_done_r),
        .I1(\n_0_counter1_r[0]_i_3__0 ),
        .I2(\n_0_counter1_r_reg[1] ),
        .O(p_0_in[7]));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     \counter1_r[0]_i_3__0 
       (.I0(count_8d_done_r),
        .I1(\n_0_counter1_r_reg[7] ),
        .I2(\n_0_counter1_r_reg[6] ),
        .I3(\n_0_counter1_r_reg[5] ),
        .I4(\n_0_counter1_r_reg[3] ),
        .I5(count_32d_done_r),
        .O(\n_0_counter1_r[0]_i_3__0 ));
(* SOFT_HLUTNM = "soft_lutpair173" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \counter1_r[1]_i_1__0 
       (.I0(\n_0_counter1_r_reg[1] ),
        .I1(\n_0_counter1_r[0]_i_3__0 ),
        .O(p_0_in[6]));
LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
     \counter1_r[2]_i_1__0 
       (.I0(count_32d_done_r),
        .I1(count_8d_done_r),
        .I2(\n_0_counter1_r_reg[7] ),
        .I3(\n_0_counter1_r_reg[6] ),
        .I4(\n_0_counter1_r_reg[5] ),
        .I5(\n_0_counter1_r_reg[3] ),
        .O(p_0_in[5]));
(* SOFT_HLUTNM = "soft_lutpair170" *) 
   LUT5 #(
    .INIT(32'h6AAAAAAA)) 
     \counter1_r[3]_i_1__0 
       (.I0(\n_0_counter1_r_reg[3] ),
        .I1(\n_0_counter1_r_reg[5] ),
        .I2(\n_0_counter1_r_reg[6] ),
        .I3(\n_0_counter1_r_reg[7] ),
        .I4(count_8d_done_r),
        .O(p_0_in[4]));
(* SOFT_HLUTNM = "soft_lutpair170" *) 
   LUT4 #(
    .INIT(16'h6AAA)) 
     \counter1_r[4]_i_1__0 
       (.I0(count_8d_done_r),
        .I1(\n_0_counter1_r_reg[7] ),
        .I2(\n_0_counter1_r_reg[6] ),
        .I3(\n_0_counter1_r_reg[5] ),
        .O(p_0_in[3]));
(* SOFT_HLUTNM = "soft_lutpair174" *) 
   LUT3 #(
    .INIT(8'h6A)) 
     \counter1_r[5]_i_1__0 
       (.I0(\n_0_counter1_r_reg[5] ),
        .I1(\n_0_counter1_r_reg[6] ),
        .I2(\n_0_counter1_r_reg[7] ),
        .O(p_0_in[2]));
(* SOFT_HLUTNM = "soft_lutpair174" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \counter1_r[6]_i_1__0 
       (.I0(\n_0_counter1_r_reg[7] ),
        .I1(\n_0_counter1_r_reg[6] ),
        .O(p_0_in[1]));
LUT1 #(
    .INIT(2'h1)) 
     \counter1_r[7]_i_1__0 
       (.I0(\n_0_counter1_r_reg[7] ),
        .O(p_0_in[0]));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \counter1_r_reg[0] 
       (.C(user_clk),
        .CE(inc_count_c),
        .D(p_0_in[7]),
        .Q(count_128d_done_r),
        .R(reset_count_r));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \counter1_r_reg[1] 
       (.C(user_clk),
        .CE(inc_count_c),
        .D(p_0_in[6]),
        .Q(\n_0_counter1_r_reg[1] ),
        .R(reset_count_r));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \counter1_r_reg[2] 
       (.C(user_clk),
        .CE(inc_count_c),
        .D(p_0_in[5]),
        .Q(count_32d_done_r),
        .R(reset_count_r));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \counter1_r_reg[3] 
       (.C(user_clk),
        .CE(inc_count_c),
        .D(p_0_in[4]),
        .Q(\n_0_counter1_r_reg[3] ),
        .R(reset_count_r));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \counter1_r_reg[4] 
       (.C(user_clk),
        .CE(inc_count_c),
        .D(p_0_in[3]),
        .Q(count_8d_done_r),
        .R(reset_count_r));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \counter1_r_reg[5] 
       (.C(user_clk),
        .CE(inc_count_c),
        .D(p_0_in[2]),
        .Q(\n_0_counter1_r_reg[5] ),
        .R(reset_count_r));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \counter1_r_reg[6] 
       (.C(user_clk),
        .CE(inc_count_c),
        .D(p_0_in[1]),
        .Q(\n_0_counter1_r_reg[6] ),
        .R(reset_count_r));
(* counter = "16" *) 
   FDSE #(
    .INIT(1'b1)) 
     \counter1_r_reg[7] 
       (.C(user_clk),
        .CE(inc_count_c),
        .D(p_0_in[0]),
        .Q(\n_0_counter1_r_reg[7] ),
        .S(reset_count_r));
(* srl_bus_name = "U0/\data_mgt_aurora_lane_4byte_1_i/data_mgt_lane_init_sm_4byte_i/counter2_r_reg " *) 
   (* srl_name = "U0/\data_mgt_aurora_lane_4byte_1_i/data_mgt_lane_init_sm_4byte_i/counter2_r_reg[14]_srl15 " *) 
   SRL16E \counter2_r_reg[14]_srl15 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const1> ),
        .A3(\<const1> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(GEN_SPA),
        .Q(\n_0_counter2_r_reg[14]_srl15 ));
FDRE \counter2_r_reg[15] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_counter2_r_reg[14]_srl15 ),
        .Q(counter2_r),
        .R(\<const0> ));
(* srl_bus_name = "U0/\data_mgt_aurora_lane_4byte_1_i/data_mgt_lane_init_sm_4byte_i/counter3_r_reg " *) 
   (* srl_name = "U0/\data_mgt_aurora_lane_4byte_1_i/data_mgt_lane_init_sm_4byte_i/counter3_r_reg[2]_srl3 " *) 
   SRL16E \counter3_r_reg[2]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(counter3_r0),
        .CLK(user_clk),
        .D(GEN_SPA),
        .Q(\n_0_counter3_r_reg[2]_srl3 ));
FDRE \counter3_r_reg[3] 
       (.C(user_clk),
        .CE(counter3_r0),
        .D(\n_0_counter3_r_reg[2]_srl3 ),
        .Q(counter3_r),
        .R(\<const0> ));
(* srl_bus_name = "U0/\data_mgt_aurora_lane_4byte_1_i/data_mgt_lane_init_sm_4byte_i/counter4_r_reg " *) 
   (* srl_name = "U0/\data_mgt_aurora_lane_4byte_1_i/data_mgt_lane_init_sm_4byte_i/counter4_r_reg[14]_srl15 " *) 
   SRL16E \counter4_r_reg[14]_srl15 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const1> ),
        .A3(\<const1> ),
        .CE(counter4_r0),
        .CLK(user_clk),
        .D(ready_r),
        .Q(\n_0_counter4_r_reg[14]_srl15 ));
FDRE \counter4_r_reg[15] 
       (.C(user_clk),
        .CE(counter4_r0),
        .D(\n_0_counter4_r_reg[14]_srl15 ),
        .Q(counter4_r),
        .R(\<const0> ));
(* srl_bus_name = "U0/\data_mgt_aurora_lane_4byte_1_i/data_mgt_lane_init_sm_4byte_i/counter5_r_reg " *) 
   (* srl_name = "U0/\data_mgt_aurora_lane_4byte_1_i/data_mgt_lane_init_sm_4byte_i/counter5_r_reg[14]_srl15 " *) 
   SRL16E \counter5_r_reg[14]_srl15 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const1> ),
        .A3(\<const1> ),
        .CE(counter5_r0),
        .CLK(user_clk),
        .D(GEN_SPA),
        .Q(\n_0_counter5_r_reg[14]_srl15 ));
LUT2 #(
    .INIT(4'hB)) 
     \counter5_r_reg[14]_srl15_i_1__0 
       (.I0(do_watchdog_count_r),
        .I1(GEN_SPA),
        .O(counter5_r0));
FDRE \counter5_r_reg[15] 
       (.C(user_clk),
        .CE(counter5_r0),
        .D(\n_0_counter5_r_reg[14]_srl15 ),
        .Q(counter5_r),
        .R(\<const0> ));
LUT2 #(
    .INIT(4'h2)) 
     do_watchdog_count_r_i_1__0
       (.I0(count_128d_done_r),
        .I1(prev_count_128d_done_r),
        .O(do_watchdog_count_r0));
FDRE do_watchdog_count_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(do_watchdog_count_r0),
        .Q(do_watchdog_count_r),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair175" *) 
   LUT2 #(
    .INIT(4'h1)) 
     gen_sp_r_i_1__0
       (.I0(ready_r),
        .I1(GEN_SPA),
        .O(GEN_SP));
(* BOX_TYPE = "PRIMITIVE" *) 
   (* XILINX_LEGACY_PRIM = "FDR" *) 
   FDRE #(
    .INIT(1'b0)) 
     lane_up_flop_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(ready_r),
        .Q(LANE_UP),
        .R(I1));
LUT5 #(
    .INIT(32'hFFFFF111)) 
     \left_align_select_r[0]_i_2__0 
       (.I0(ready_r),
        .I1(O1),
        .I2(GT1_RXCHARISK_OUT[0]),
        .I3(GT1_RXCHARISK_OUT[1]),
        .I4(first_v_received_r),
        .O(O10));
(* SOFT_HLUTNM = "soft_lutpair169" *) 
   LUT3 #(
    .INIT(8'h08)) 
     polarity_r_i_1__0
       (.I0(count_32d_done_r),
        .I1(realign_r),
        .I2(RXREALIGN_OUT_LANE1),
        .O(next_polarity_c));
FDRE polarity_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_polarity_c),
        .Q(polarity_r),
        .R(begin_r0));
FDRE prev_count_128d_done_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(count_128d_done_r),
        .Q(prev_count_128d_done_r),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'h4000FFFF40004000)) 
     ready_r_i_1__0
       (.I0(counter5_r),
        .I1(GEN_SPA),
        .I2(counter3_r),
        .I3(counter2_r),
        .I4(counter4_r),
        .I5(ready_r),
        .O(next_ready_c));
FDRE ready_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_ready_c),
        .Q(ready_r),
        .R(begin_r0));
(* SOFT_HLUTNM = "soft_lutpair169" *) 
   LUT5 #(
    .INIT(32'hFF040404)) 
     realign_r_i_1__0
       (.I0(RXREALIGN_OUT_LANE1),
        .I1(realign_r),
        .I2(count_32d_done_r),
        .I3(count_128d_done_r),
        .I4(O1),
        .O(next_realign_c));
FDRE realign_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_realign_c),
        .Q(realign_r),
        .R(begin_r0));
LUT6 #(
    .INIT(64'hFFFFFFFF55555551)) 
     reset_count_r_i_1__0
       (.I0(n_0_rst_r_reg),
        .I1(consecutive_commas_r),
        .I2(GT1_RXDISPERR_OUT[0]),
        .I3(GT1_RXDISPERR_OUT[1]),
        .I4(I10),
        .I5(n_0_reset_count_r_i_3__0),
        .O(reset_count_r0));
(* SOFT_HLUTNM = "soft_lutpair171" *) 
   LUT4 #(
    .INIT(16'hBAEE)) 
     reset_count_r_i_3__0
       (.I0(I1),
        .I1(begin_r),
        .I2(count_8d_done_r),
        .I3(n_0_rst_r_reg),
        .O(n_0_reset_count_r_i_3__0));
FDRE reset_count_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(reset_count_r0),
        .Q(reset_count_r),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair171" *) 
   LUT3 #(
    .INIT(8'hBA)) 
     rst_r_i_1__0
       (.I0(begin_r),
        .I1(count_8d_done_r),
        .I2(n_0_rst_r_reg),
        .O(next_rst_c));
FDRE rst_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_rst_c),
        .Q(n_0_rst_r_reg),
        .R(begin_r0));
(* SOFT_HLUTNM = "soft_lutpair172" *) 
   LUT3 #(
    .INIT(8'h78)) 
     rx_polarity_r_i_1__0
       (.I0(RX_NEG_Buffer),
        .I1(polarity_r),
        .I2(RXPOLARITY_IN_LANE1),
        .O(n_0_rx_polarity_r_i_1__0));
FDRE #(
    .INIT(1'b0)) 
     rx_polarity_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_rx_polarity_r_i_1__0),
        .Q(RXPOLARITY_IN_LANE1),
        .R(\<const0> ));
LUT2 #(
    .INIT(4'h8)) 
     rxfsm_data_valid_r_i_1
       (.I0(LANE_UP),
        .I1(I11),
        .O(O15));
LUT1 #(
    .INIT(2'h1)) 
     \soft_err_r[0]_i_1__0 
       (.I0(ENABLE_ERR_DETECT),
        .O(good_cnt_r3));
endmodule

(* ORIG_REF_NAME = "data_mgt_LANE_INIT_SM_4BYTE" *) 
module data_mgtdata_mgt_LANE_INIT_SM_4BYTE_5
   (D,
    ready_r,
    O1,
    GEN_SPA,
    ENABLE_ERR_DETECT,
    RXPOLARITY_IN,
    GEN_SP,
    good_cnt_r3,
    O9,
    I1,
    user_clk,
    begin_r0,
    counter3_r0,
    counter4_r0,
    RXREALIGN_OUT,
    GT0_RXDISPERR_OUT,
    I7,
    RX_NEG_Buffer,
    GT0_RXCHARISK_OUT,
    first_v_received_r,
    I10);
  output [0:0]D;
  output ready_r;
  output O1;
  output GEN_SPA;
  output ENABLE_ERR_DETECT;
  output RXPOLARITY_IN;
  output GEN_SP;
  output good_cnt_r3;
  output O9;
  input I1;
  input user_clk;
  input begin_r0;
  input counter3_r0;
  input counter4_r0;
  input RXREALIGN_OUT;
  input [1:0]GT0_RXDISPERR_OUT;
  input I7;
  input RX_NEG_Buffer;
  input [1:0]GT0_RXCHARISK_OUT;
  input first_v_received_r;
  input [3:0]I10;

  wire \<const0> ;
  wire \<const1> ;
  wire [0:0]D;
  wire ENABLE_ERR_DETECT;
  wire ENABLE_ERR_DETECT_Buffer0;
  wire GEN_SP;
  wire GEN_SPA;
  wire [1:0]GT0_RXCHARISK_OUT;
  wire [1:0]GT0_RXDISPERR_OUT;
  wire I1;
  wire [3:0]I10;
  wire I7;
  wire O1;
  wire O9;
  wire RXPOLARITY_IN;
  wire RXREALIGN_OUT;
  wire RX_NEG_Buffer;
  wire VCC_2;
  wire begin_r;
  wire begin_r0;
  wire consecutive_commas_r;
  wire consecutive_commas_r0;
  wire count_128d_done_r;
  wire count_32d_done_r;
  wire count_8d_done_r;
  wire [15:15]counter2_r;
  wire [3:3]counter3_r;
  wire counter3_r0;
  wire [15:15]counter4_r;
  wire counter4_r0;
  wire [15:15]counter5_r;
  wire counter5_r0;
  wire do_watchdog_count_r;
  wire do_watchdog_count_r0;
  wire first_v_received_r;
  wire good_cnt_r3;
  wire inc_count_c;
  wire \n_0_RX_CHAR_IS_COMMA_R_reg[0] ;
  wire \n_0_RX_CHAR_IS_COMMA_R_reg[3] ;
  wire n_0_begin_r_i_2;
  wire \n_0_counter1_r[0]_i_3 ;
  wire \n_0_counter1_r_reg[1] ;
  wire \n_0_counter1_r_reg[3] ;
  wire \n_0_counter1_r_reg[5] ;
  wire \n_0_counter1_r_reg[6] ;
  wire \n_0_counter1_r_reg[7] ;
  wire \n_0_counter2_r_reg[14]_srl15 ;
  wire \n_0_counter3_r_reg[2]_srl3 ;
  wire \n_0_counter4_r_reg[14]_srl15 ;
  wire \n_0_counter5_r_reg[14]_srl15 ;
  wire n_0_reset_count_r_i_3;
  wire n_0_rst_r_reg;
  wire n_0_rx_polarity_r_i_1;
  wire next_ack_c;
  wire next_align_c;
  wire next_begin_c;
  wire next_polarity_c;
  wire next_ready_c;
  wire next_realign_c;
  wire next_rst_c;
  wire [7:0]p_0_in;
  wire p_0_in2_in;
  wire p_1_in;
  wire polarity_r;
  wire prev_count_128d_done_r;
  wire ready_r;
  wire realign_r;
  wire reset_count_r;
  wire reset_count_r0;
  wire user_clk;

(* SOFT_HLUTNM = "soft_lutpair106" *) 
   LUT2 #(
    .INIT(4'hE)) 
     ENABLE_ERR_DETECT_Buffer_i_1
       (.I0(GEN_SPA),
        .I1(ready_r),
        .O(ENABLE_ERR_DETECT_Buffer0));
FDRE ENABLE_ERR_DETECT_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(ENABLE_ERR_DETECT_Buffer0),
        .Q(ENABLE_ERR_DETECT),
        .R(\<const0> ));
GND GND
       (.G(\<const0> ));
FDRE \RX_CHAR_IS_COMMA_R_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I10[0]),
        .Q(\n_0_RX_CHAR_IS_COMMA_R_reg[0] ),
        .R(\<const0> ));
FDRE \RX_CHAR_IS_COMMA_R_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I10[1]),
        .Q(p_1_in),
        .R(\<const0> ));
FDRE \RX_CHAR_IS_COMMA_R_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I10[2]),
        .Q(p_0_in2_in),
        .R(\<const0> ));
FDRE \RX_CHAR_IS_COMMA_R_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I10[3]),
        .Q(\n_0_RX_CHAR_IS_COMMA_R_reg[3] ),
        .R(\<const0> ));
VCC VCC
       (.P(\<const1> ));
VCC VCC_1
       (.P(VCC_2));
LUT6 #(
    .INIT(64'h0444FFFF04440444)) 
     ack_r_i_1
       (.I0(counter5_r),
        .I1(GEN_SPA),
        .I2(counter3_r),
        .I3(counter2_r),
        .I4(RX_NEG_Buffer),
        .I5(polarity_r),
        .O(next_ack_c));
FDRE ack_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_ack_c),
        .Q(GEN_SPA),
        .R(begin_r0));
(* SOFT_HLUTNM = "soft_lutpair102" *) 
   LUT4 #(
    .INIT(16'hF444)) 
     align_r_i_2
       (.I0(count_128d_done_r),
        .I1(O1),
        .I2(count_8d_done_r),
        .I3(n_0_rst_r_reg),
        .O(next_align_c));
FDRE align_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_align_c),
        .Q(O1),
        .R(begin_r0));
LUT5 #(
    .INIT(32'hFFFFF888)) 
     begin_r_i_1
       (.I0(GEN_SPA),
        .I1(counter5_r),
        .I2(realign_r),
        .I3(RXREALIGN_OUT),
        .I4(n_0_begin_r_i_2),
        .O(next_begin_c));
(* SOFT_HLUTNM = "soft_lutpair103" *) 
   LUT4 #(
    .INIT(16'hF888)) 
     begin_r_i_2
       (.I0(polarity_r),
        .I1(RX_NEG_Buffer),
        .I2(counter4_r),
        .I3(ready_r),
        .O(n_0_begin_r_i_2));
FDSE begin_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_begin_c),
        .Q(begin_r),
        .S(begin_r0));
LUT5 #(
    .INIT(32'hFFFFFFFD)) 
     consecutive_commas_r_i_1
       (.I0(O1),
        .I1(\n_0_RX_CHAR_IS_COMMA_R_reg[0] ),
        .I2(p_0_in2_in),
        .I3(p_1_in),
        .I4(\n_0_RX_CHAR_IS_COMMA_R_reg[3] ),
        .O(consecutive_commas_r0));
FDRE consecutive_commas_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(consecutive_commas_r0),
        .Q(consecutive_commas_r),
        .R(\<const0> ));
LUT5 #(
    .INIT(32'hFFFFFFFD)) 
     \counter1_r[0]_i_1 
       (.I0(O1),
        .I1(\n_0_RX_CHAR_IS_COMMA_R_reg[0] ),
        .I2(p_0_in2_in),
        .I3(p_1_in),
        .I4(\n_0_RX_CHAR_IS_COMMA_R_reg[3] ),
        .O(inc_count_c));
(* SOFT_HLUTNM = "soft_lutpair105" *) 
   LUT3 #(
    .INIT(8'h6A)) 
     \counter1_r[0]_i_2 
       (.I0(count_128d_done_r),
        .I1(\n_0_counter1_r[0]_i_3 ),
        .I2(\n_0_counter1_r_reg[1] ),
        .O(p_0_in[7]));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     \counter1_r[0]_i_3 
       (.I0(count_8d_done_r),
        .I1(\n_0_counter1_r_reg[7] ),
        .I2(\n_0_counter1_r_reg[6] ),
        .I3(\n_0_counter1_r_reg[5] ),
        .I4(\n_0_counter1_r_reg[3] ),
        .I5(count_32d_done_r),
        .O(\n_0_counter1_r[0]_i_3 ));
(* SOFT_HLUTNM = "soft_lutpair105" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \counter1_r[1]_i_1 
       (.I0(\n_0_counter1_r_reg[1] ),
        .I1(\n_0_counter1_r[0]_i_3 ),
        .O(p_0_in[6]));
LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
     \counter1_r[2]_i_1 
       (.I0(count_32d_done_r),
        .I1(count_8d_done_r),
        .I2(\n_0_counter1_r_reg[7] ),
        .I3(\n_0_counter1_r_reg[6] ),
        .I4(\n_0_counter1_r_reg[5] ),
        .I5(\n_0_counter1_r_reg[3] ),
        .O(p_0_in[5]));
(* SOFT_HLUTNM = "soft_lutpair101" *) 
   LUT5 #(
    .INIT(32'h6AAAAAAA)) 
     \counter1_r[3]_i_1 
       (.I0(\n_0_counter1_r_reg[3] ),
        .I1(\n_0_counter1_r_reg[5] ),
        .I2(\n_0_counter1_r_reg[6] ),
        .I3(\n_0_counter1_r_reg[7] ),
        .I4(count_8d_done_r),
        .O(p_0_in[4]));
(* SOFT_HLUTNM = "soft_lutpair101" *) 
   LUT4 #(
    .INIT(16'h6AAA)) 
     \counter1_r[4]_i_1 
       (.I0(count_8d_done_r),
        .I1(\n_0_counter1_r_reg[7] ),
        .I2(\n_0_counter1_r_reg[6] ),
        .I3(\n_0_counter1_r_reg[5] ),
        .O(p_0_in[3]));
(* SOFT_HLUTNM = "soft_lutpair104" *) 
   LUT3 #(
    .INIT(8'h6A)) 
     \counter1_r[5]_i_1 
       (.I0(\n_0_counter1_r_reg[5] ),
        .I1(\n_0_counter1_r_reg[6] ),
        .I2(\n_0_counter1_r_reg[7] ),
        .O(p_0_in[2]));
(* SOFT_HLUTNM = "soft_lutpair104" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \counter1_r[6]_i_1 
       (.I0(\n_0_counter1_r_reg[7] ),
        .I1(\n_0_counter1_r_reg[6] ),
        .O(p_0_in[1]));
LUT1 #(
    .INIT(2'h1)) 
     \counter1_r[7]_i_1 
       (.I0(\n_0_counter1_r_reg[7] ),
        .O(p_0_in[0]));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \counter1_r_reg[0] 
       (.C(user_clk),
        .CE(inc_count_c),
        .D(p_0_in[7]),
        .Q(count_128d_done_r),
        .R(reset_count_r));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \counter1_r_reg[1] 
       (.C(user_clk),
        .CE(inc_count_c),
        .D(p_0_in[6]),
        .Q(\n_0_counter1_r_reg[1] ),
        .R(reset_count_r));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \counter1_r_reg[2] 
       (.C(user_clk),
        .CE(inc_count_c),
        .D(p_0_in[5]),
        .Q(count_32d_done_r),
        .R(reset_count_r));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \counter1_r_reg[3] 
       (.C(user_clk),
        .CE(inc_count_c),
        .D(p_0_in[4]),
        .Q(\n_0_counter1_r_reg[3] ),
        .R(reset_count_r));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \counter1_r_reg[4] 
       (.C(user_clk),
        .CE(inc_count_c),
        .D(p_0_in[3]),
        .Q(count_8d_done_r),
        .R(reset_count_r));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \counter1_r_reg[5] 
       (.C(user_clk),
        .CE(inc_count_c),
        .D(p_0_in[2]),
        .Q(\n_0_counter1_r_reg[5] ),
        .R(reset_count_r));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \counter1_r_reg[6] 
       (.C(user_clk),
        .CE(inc_count_c),
        .D(p_0_in[1]),
        .Q(\n_0_counter1_r_reg[6] ),
        .R(reset_count_r));
(* counter = "16" *) 
   FDSE #(
    .INIT(1'b1)) 
     \counter1_r_reg[7] 
       (.C(user_clk),
        .CE(inc_count_c),
        .D(p_0_in[0]),
        .Q(\n_0_counter1_r_reg[7] ),
        .S(reset_count_r));
(* srl_bus_name = "U0/\data_mgt_aurora_lane_4byte_0_i/data_mgt_lane_init_sm_4byte_i/counter2_r_reg " *) 
   (* srl_name = "U0/\data_mgt_aurora_lane_4byte_0_i/data_mgt_lane_init_sm_4byte_i/counter2_r_reg[14]_srl15 " *) 
   SRL16E \counter2_r_reg[14]_srl15 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const1> ),
        .A3(\<const1> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(GEN_SPA),
        .Q(\n_0_counter2_r_reg[14]_srl15 ));
FDRE \counter2_r_reg[15] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_counter2_r_reg[14]_srl15 ),
        .Q(counter2_r),
        .R(\<const0> ));
(* srl_bus_name = "U0/\data_mgt_aurora_lane_4byte_0_i/data_mgt_lane_init_sm_4byte_i/counter3_r_reg " *) 
   (* srl_name = "U0/\data_mgt_aurora_lane_4byte_0_i/data_mgt_lane_init_sm_4byte_i/counter3_r_reg[2]_srl3 " *) 
   SRL16E \counter3_r_reg[2]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(counter3_r0),
        .CLK(user_clk),
        .D(GEN_SPA),
        .Q(\n_0_counter3_r_reg[2]_srl3 ));
FDRE \counter3_r_reg[3] 
       (.C(user_clk),
        .CE(counter3_r0),
        .D(\n_0_counter3_r_reg[2]_srl3 ),
        .Q(counter3_r),
        .R(\<const0> ));
(* srl_bus_name = "U0/\data_mgt_aurora_lane_4byte_0_i/data_mgt_lane_init_sm_4byte_i/counter4_r_reg " *) 
   (* srl_name = "U0/\data_mgt_aurora_lane_4byte_0_i/data_mgt_lane_init_sm_4byte_i/counter4_r_reg[14]_srl15 " *) 
   SRL16E \counter4_r_reg[14]_srl15 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const1> ),
        .A3(\<const1> ),
        .CE(counter4_r0),
        .CLK(user_clk),
        .D(ready_r),
        .Q(\n_0_counter4_r_reg[14]_srl15 ));
FDRE \counter4_r_reg[15] 
       (.C(user_clk),
        .CE(counter4_r0),
        .D(\n_0_counter4_r_reg[14]_srl15 ),
        .Q(counter4_r),
        .R(\<const0> ));
(* srl_bus_name = "U0/\data_mgt_aurora_lane_4byte_0_i/data_mgt_lane_init_sm_4byte_i/counter5_r_reg " *) 
   (* srl_name = "U0/\data_mgt_aurora_lane_4byte_0_i/data_mgt_lane_init_sm_4byte_i/counter5_r_reg[14]_srl15 " *) 
   SRL16E \counter5_r_reg[14]_srl15 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const1> ),
        .A3(\<const1> ),
        .CE(counter5_r0),
        .CLK(user_clk),
        .D(GEN_SPA),
        .Q(\n_0_counter5_r_reg[14]_srl15 ));
LUT2 #(
    .INIT(4'hB)) 
     \counter5_r_reg[14]_srl15_i_1 
       (.I0(do_watchdog_count_r),
        .I1(GEN_SPA),
        .O(counter5_r0));
FDRE \counter5_r_reg[15] 
       (.C(user_clk),
        .CE(counter5_r0),
        .D(\n_0_counter5_r_reg[14]_srl15 ),
        .Q(counter5_r),
        .R(\<const0> ));
LUT2 #(
    .INIT(4'h2)) 
     do_watchdog_count_r_i_1
       (.I0(count_128d_done_r),
        .I1(prev_count_128d_done_r),
        .O(do_watchdog_count_r0));
FDRE do_watchdog_count_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(do_watchdog_count_r0),
        .Q(do_watchdog_count_r),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair106" *) 
   LUT2 #(
    .INIT(4'h1)) 
     gen_sp_r_i_1
       (.I0(ready_r),
        .I1(GEN_SPA),
        .O(GEN_SP));
(* BOX_TYPE = "PRIMITIVE" *) 
   (* XILINX_LEGACY_PRIM = "FDR" *) 
   FDRE #(
    .INIT(1'b0)) 
     lane_up_flop_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(ready_r),
        .Q(D),
        .R(I1));
LUT5 #(
    .INIT(32'hFFFFF111)) 
     \left_align_select_r[0]_i_2 
       (.I0(ready_r),
        .I1(O1),
        .I2(GT0_RXCHARISK_OUT[0]),
        .I3(GT0_RXCHARISK_OUT[1]),
        .I4(first_v_received_r),
        .O(O9));
(* SOFT_HLUTNM = "soft_lutpair100" *) 
   LUT3 #(
    .INIT(8'h08)) 
     polarity_r_i_1
       (.I0(count_32d_done_r),
        .I1(realign_r),
        .I2(RXREALIGN_OUT),
        .O(next_polarity_c));
FDRE polarity_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_polarity_c),
        .Q(polarity_r),
        .R(begin_r0));
FDRE prev_count_128d_done_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(count_128d_done_r),
        .Q(prev_count_128d_done_r),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'h4000FFFF40004000)) 
     ready_r_i_1
       (.I0(counter5_r),
        .I1(GEN_SPA),
        .I2(counter3_r),
        .I3(counter2_r),
        .I4(counter4_r),
        .I5(ready_r),
        .O(next_ready_c));
FDRE ready_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_ready_c),
        .Q(ready_r),
        .R(begin_r0));
(* SOFT_HLUTNM = "soft_lutpair100" *) 
   LUT5 #(
    .INIT(32'hFF040404)) 
     realign_r_i_1
       (.I0(RXREALIGN_OUT),
        .I1(realign_r),
        .I2(count_32d_done_r),
        .I3(count_128d_done_r),
        .I4(O1),
        .O(next_realign_c));
FDRE realign_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_realign_c),
        .Q(realign_r),
        .R(begin_r0));
LUT6 #(
    .INIT(64'hFFFFFFFF55555551)) 
     reset_count_r_i_1
       (.I0(n_0_rst_r_reg),
        .I1(consecutive_commas_r),
        .I2(GT0_RXDISPERR_OUT[0]),
        .I3(GT0_RXDISPERR_OUT[1]),
        .I4(I7),
        .I5(n_0_reset_count_r_i_3),
        .O(reset_count_r0));
LUT4 #(
    .INIT(16'hBAEE)) 
     reset_count_r_i_3
       (.I0(I1),
        .I1(begin_r),
        .I2(count_8d_done_r),
        .I3(n_0_rst_r_reg),
        .O(n_0_reset_count_r_i_3));
FDRE reset_count_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(reset_count_r0),
        .Q(reset_count_r),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair102" *) 
   LUT3 #(
    .INIT(8'hBA)) 
     rst_r_i_1
       (.I0(begin_r),
        .I1(count_8d_done_r),
        .I2(n_0_rst_r_reg),
        .O(next_rst_c));
FDRE rst_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(next_rst_c),
        .Q(n_0_rst_r_reg),
        .R(begin_r0));
(* SOFT_HLUTNM = "soft_lutpair103" *) 
   LUT3 #(
    .INIT(8'h78)) 
     rx_polarity_r_i_1
       (.I0(RX_NEG_Buffer),
        .I1(polarity_r),
        .I2(RXPOLARITY_IN),
        .O(n_0_rx_polarity_r_i_1));
FDRE #(
    .INIT(1'b0)) 
     rx_polarity_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_rx_polarity_r_i_1),
        .Q(RXPOLARITY_IN),
        .R(\<const0> ));
LUT1 #(
    .INIT(2'h1)) 
     \soft_err_r[0]_i_1 
       (.I0(ENABLE_ERR_DETECT),
        .O(good_cnt_r3));
endmodule

module data_mgtdata_mgt_LEFT_ALIGN_CONTROL
   (D,
    Q,
    I1,
    data2,
    p_5_in,
    data0,
    I2,
    user_clk);
  output [15:0]D;
  output [2:0]Q;
  input [15:0]I1;
  input [15:0]data2;
  input [15:0]p_5_in;
  input [15:0]data0;
  input [4:0]I2;
  input user_clk;

  wire \<const0> ;
  wire \<const1> ;
  wire [15:0]D;
  wire [15:0]I1;
  wire [4:0]I2;
  wire [2:0]Q;
  wire [15:0]data0;
  wire [15:0]data2;
  wire [15:0]p_5_in;
  wire [1:0]sel0;
  wire user_clk;

GND GND
       (.G(\<const0> ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \MUXED_DATA_Buffer[0]_i_1 
       (.I0(I1[15]),
        .I1(data2[15]),
        .I2(sel0[1]),
        .I3(p_5_in[15]),
        .I4(sel0[0]),
        .I5(data0[15]),
        .O(D[15]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \MUXED_DATA_Buffer[10]_i_1 
       (.I0(I1[5]),
        .I1(data2[5]),
        .I2(sel0[1]),
        .I3(p_5_in[5]),
        .I4(sel0[0]),
        .I5(data0[5]),
        .O(D[5]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \MUXED_DATA_Buffer[11]_i_1 
       (.I0(I1[4]),
        .I1(data2[4]),
        .I2(sel0[1]),
        .I3(p_5_in[4]),
        .I4(sel0[0]),
        .I5(data0[4]),
        .O(D[4]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \MUXED_DATA_Buffer[12]_i_1 
       (.I0(I1[3]),
        .I1(data2[3]),
        .I2(sel0[1]),
        .I3(p_5_in[3]),
        .I4(sel0[0]),
        .I5(data0[3]),
        .O(D[3]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \MUXED_DATA_Buffer[13]_i_1 
       (.I0(I1[2]),
        .I1(data2[2]),
        .I2(sel0[1]),
        .I3(p_5_in[2]),
        .I4(sel0[0]),
        .I5(data0[2]),
        .O(D[2]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \MUXED_DATA_Buffer[14]_i_1 
       (.I0(I1[1]),
        .I1(data2[1]),
        .I2(sel0[1]),
        .I3(p_5_in[1]),
        .I4(sel0[0]),
        .I5(data0[1]),
        .O(D[1]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \MUXED_DATA_Buffer[15]_i_1 
       (.I0(I1[0]),
        .I1(data2[0]),
        .I2(sel0[1]),
        .I3(p_5_in[0]),
        .I4(sel0[0]),
        .I5(data0[0]),
        .O(D[0]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \MUXED_DATA_Buffer[1]_i_1 
       (.I0(I1[14]),
        .I1(data2[14]),
        .I2(sel0[1]),
        .I3(p_5_in[14]),
        .I4(sel0[0]),
        .I5(data0[14]),
        .O(D[14]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \MUXED_DATA_Buffer[2]_i_1 
       (.I0(I1[13]),
        .I1(data2[13]),
        .I2(sel0[1]),
        .I3(p_5_in[13]),
        .I4(sel0[0]),
        .I5(data0[13]),
        .O(D[13]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \MUXED_DATA_Buffer[3]_i_1 
       (.I0(I1[12]),
        .I1(data2[12]),
        .I2(sel0[1]),
        .I3(p_5_in[12]),
        .I4(sel0[0]),
        .I5(data0[12]),
        .O(D[12]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \MUXED_DATA_Buffer[4]_i_1 
       (.I0(I1[11]),
        .I1(data2[11]),
        .I2(sel0[1]),
        .I3(p_5_in[11]),
        .I4(sel0[0]),
        .I5(data0[11]),
        .O(D[11]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \MUXED_DATA_Buffer[5]_i_1 
       (.I0(I1[10]),
        .I1(data2[10]),
        .I2(sel0[1]),
        .I3(p_5_in[10]),
        .I4(sel0[0]),
        .I5(data0[10]),
        .O(D[10]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \MUXED_DATA_Buffer[6]_i_1 
       (.I0(I1[9]),
        .I1(data2[9]),
        .I2(sel0[1]),
        .I3(p_5_in[9]),
        .I4(sel0[0]),
        .I5(data0[9]),
        .O(D[9]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \MUXED_DATA_Buffer[7]_i_1 
       (.I0(I1[8]),
        .I1(data2[8]),
        .I2(sel0[1]),
        .I3(p_5_in[8]),
        .I4(sel0[0]),
        .I5(data0[8]),
        .O(D[8]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \MUXED_DATA_Buffer[8]_i_1 
       (.I0(I1[7]),
        .I1(data2[7]),
        .I2(sel0[1]),
        .I3(p_5_in[7]),
        .I4(sel0[0]),
        .I5(data0[7]),
        .O(D[7]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \MUXED_DATA_Buffer[9]_i_1 
       (.I0(I1[6]),
        .I1(data2[6]),
        .I2(sel0[1]),
        .I3(p_5_in[6]),
        .I4(sel0[0]),
        .I5(data0[6]),
        .O(D[6]));
FDRE \MUX_SELECT_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I2[4]),
        .Q(sel0[1]),
        .R(\<const0> ));
FDRE \MUX_SELECT_Buffer_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I2[3]),
        .Q(sel0[0]),
        .R(\<const0> ));
FDRE \MUX_SELECT_Buffer_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I2[2]),
        .Q(Q[2]),
        .R(\<const0> ));
FDRE \MUX_SELECT_Buffer_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I2[1]),
        .Q(Q[1]),
        .R(\<const0> ));
FDRE \MUX_SELECT_Buffer_reg[8] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I2[0]),
        .Q(Q[0]),
        .R(\<const0> ));
VCC VCC
       (.P(\<const1> ));
endmodule

module data_mgtdata_mgt_LEFT_ALIGN_MUX
   (O1,
    O2,
    O3,
    O4,
    O5,
    O6,
    O7,
    O8,
    O9,
    O10,
    O11,
    O12,
    O13,
    O14,
    O15,
    O16,
    O17,
    O18,
    O19,
    O20,
    O21,
    O22,
    O23,
    O24,
    O25,
    O26,
    O27,
    O28,
    O29,
    O30,
    O31,
    O32,
    O33,
    O34,
    O35,
    O36,
    O37,
    O38,
    O39,
    O40,
    O41,
    O42,
    O43,
    O44,
    O45,
    O46,
    O47,
    O48,
    O49,
    O50,
    O51,
    O52,
    O53,
    O54,
    O55,
    O56,
    O57,
    O58,
    O59,
    O60,
    O61,
    O62,
    O63,
    O64,
    O65,
    O66,
    O67,
    O68,
    O69,
    O70,
    O71,
    O72,
    O73,
    O74,
    O75,
    O76,
    O77,
    O78,
    O79,
    O80,
    O81,
    O82,
    O83,
    O84,
    O85,
    O86,
    O87,
    O88,
    O89,
    O90,
    O91,
    O92,
    O93,
    O94,
    O95,
    O96,
    O97,
    O98,
    O99,
    O100,
    O101,
    O102,
    O103,
    O104,
    O105,
    O106,
    O107,
    O108,
    O109,
    O110,
    O111,
    O112,
    D,
    user_clk,
    data2,
    Q,
    p_5_in,
    OUTPUT_SELECT_Buffer,
    STORAGE_DATA,
    I1);
  output O1;
  output O2;
  output O3;
  output O4;
  output O5;
  output O6;
  output O7;
  output O8;
  output O9;
  output O10;
  output O11;
  output O12;
  output O13;
  output O14;
  output O15;
  output O16;
  output O17;
  output O18;
  output O19;
  output O20;
  output O21;
  output O22;
  output O23;
  output O24;
  output O25;
  output O26;
  output O27;
  output O28;
  output O29;
  output O30;
  output O31;
  output O32;
  output O33;
  output O34;
  output O35;
  output O36;
  output O37;
  output O38;
  output O39;
  output O40;
  output O41;
  output O42;
  output O43;
  output O44;
  output O45;
  output O46;
  output O47;
  output O48;
  output O49;
  output O50;
  output O51;
  output O52;
  output O53;
  output O54;
  output O55;
  output O56;
  output O57;
  output O58;
  output O59;
  output O60;
  output O61;
  output O62;
  output O63;
  output O64;
  output O65;
  output O66;
  output O67;
  output O68;
  output O69;
  output O70;
  output O71;
  output O72;
  output O73;
  output O74;
  output O75;
  output O76;
  output O77;
  output O78;
  output O79;
  output O80;
  output O81;
  output O82;
  output O83;
  output O84;
  output O85;
  output O86;
  output O87;
  output O88;
  output O89;
  output O90;
  output O91;
  output O92;
  output O93;
  output O94;
  output O95;
  output O96;
  output O97;
  output O98;
  output O99;
  output O100;
  output O101;
  output O102;
  output O103;
  output O104;
  output O105;
  output O106;
  output O107;
  output O108;
  output O109;
  output O110;
  output O111;
  output O112;
  input [31:0]D;
  input user_clk;
  input [15:0]data2;
  input [2:0]Q;
  input [15:0]p_5_in;
  input [4:0]OUTPUT_SELECT_Buffer;
  input [47:0]STORAGE_DATA;
  input [7:0]I1;

  wire \<const0> ;
  wire \<const1> ;
  wire [31:0]D;
  wire [7:0]I1;
  wire O1;
  wire O10;
  wire O100;
  wire O101;
  wire O102;
  wire O103;
  wire O104;
  wire O105;
  wire O106;
  wire O107;
  wire O108;
  wire O109;
  wire O11;
  wire O110;
  wire O111;
  wire O112;
  wire O12;
  wire O13;
  wire O14;
  wire O15;
  wire O16;
  wire O17;
  wire O18;
  wire O19;
  wire O2;
  wire O20;
  wire O21;
  wire O22;
  wire O23;
  wire O24;
  wire O25;
  wire O26;
  wire O27;
  wire O28;
  wire O29;
  wire O3;
  wire O30;
  wire O31;
  wire O32;
  wire O33;
  wire O34;
  wire O35;
  wire O36;
  wire O37;
  wire O38;
  wire O39;
  wire O4;
  wire O40;
  wire O41;
  wire O42;
  wire O43;
  wire O44;
  wire O45;
  wire O46;
  wire O47;
  wire O48;
  wire O49;
  wire O5;
  wire O50;
  wire O51;
  wire O52;
  wire O53;
  wire O54;
  wire O55;
  wire O56;
  wire O57;
  wire O58;
  wire O59;
  wire O6;
  wire O60;
  wire O61;
  wire O62;
  wire O63;
  wire O64;
  wire O65;
  wire O66;
  wire O67;
  wire O68;
  wire O69;
  wire O7;
  wire O70;
  wire O71;
  wire O72;
  wire O73;
  wire O74;
  wire O75;
  wire O76;
  wire O77;
  wire O78;
  wire O79;
  wire O8;
  wire O80;
  wire O81;
  wire O82;
  wire O83;
  wire O84;
  wire O85;
  wire O86;
  wire O87;
  wire O88;
  wire O89;
  wire O9;
  wire O90;
  wire O91;
  wire O92;
  wire O93;
  wire O94;
  wire O95;
  wire O96;
  wire O97;
  wire O98;
  wire O99;
  wire [4:0]OUTPUT_SELECT_Buffer;
  wire [2:0]Q;
  wire [47:0]STORAGE_DATA;
  wire [15:0]data2;
  wire [32:47]muxed_data_c;
  wire \n_0_MUXED_DATA_Buffer[16]_i_1 ;
  wire \n_0_MUXED_DATA_Buffer[17]_i_1 ;
  wire \n_0_MUXED_DATA_Buffer[18]_i_1 ;
  wire \n_0_MUXED_DATA_Buffer[19]_i_1 ;
  wire \n_0_MUXED_DATA_Buffer[20]_i_1 ;
  wire \n_0_MUXED_DATA_Buffer[21]_i_1 ;
  wire \n_0_MUXED_DATA_Buffer[22]_i_1 ;
  wire \n_0_MUXED_DATA_Buffer[23]_i_1 ;
  wire \n_0_MUXED_DATA_Buffer[24]_i_1 ;
  wire \n_0_MUXED_DATA_Buffer[25]_i_1 ;
  wire \n_0_MUXED_DATA_Buffer[26]_i_1 ;
  wire \n_0_MUXED_DATA_Buffer[27]_i_1 ;
  wire \n_0_MUXED_DATA_Buffer[28]_i_1 ;
  wire \n_0_MUXED_DATA_Buffer[29]_i_1 ;
  wire \n_0_MUXED_DATA_Buffer[30]_i_1 ;
  wire \n_0_MUXED_DATA_Buffer[31]_i_1 ;
  wire \n_0_MUXED_DATA_Buffer_reg[16] ;
  wire \n_0_MUXED_DATA_Buffer_reg[17] ;
  wire \n_0_MUXED_DATA_Buffer_reg[18] ;
  wire \n_0_MUXED_DATA_Buffer_reg[19] ;
  wire \n_0_MUXED_DATA_Buffer_reg[20] ;
  wire \n_0_MUXED_DATA_Buffer_reg[21] ;
  wire \n_0_MUXED_DATA_Buffer_reg[22] ;
  wire \n_0_MUXED_DATA_Buffer_reg[23] ;
  wire \n_0_MUXED_DATA_Buffer_reg[24] ;
  wire \n_0_MUXED_DATA_Buffer_reg[25] ;
  wire \n_0_MUXED_DATA_Buffer_reg[26] ;
  wire \n_0_MUXED_DATA_Buffer_reg[27] ;
  wire \n_0_MUXED_DATA_Buffer_reg[28] ;
  wire \n_0_MUXED_DATA_Buffer_reg[29] ;
  wire \n_0_MUXED_DATA_Buffer_reg[30] ;
  wire \n_0_MUXED_DATA_Buffer_reg[31] ;
  wire \n_0_MUXED_DATA_Buffer_reg[48] ;
  wire \n_0_MUXED_DATA_Buffer_reg[49] ;
  wire \n_0_MUXED_DATA_Buffer_reg[50] ;
  wire \n_0_MUXED_DATA_Buffer_reg[51] ;
  wire \n_0_MUXED_DATA_Buffer_reg[52] ;
  wire \n_0_MUXED_DATA_Buffer_reg[53] ;
  wire \n_0_MUXED_DATA_Buffer_reg[54] ;
  wire \n_0_MUXED_DATA_Buffer_reg[55] ;
  wire \n_0_MUXED_DATA_Buffer_reg[56] ;
  wire \n_0_MUXED_DATA_Buffer_reg[57] ;
  wire \n_0_MUXED_DATA_Buffer_reg[58] ;
  wire \n_0_MUXED_DATA_Buffer_reg[59] ;
  wire \n_0_MUXED_DATA_Buffer_reg[60] ;
  wire \n_0_MUXED_DATA_Buffer_reg[61] ;
  wire \n_0_MUXED_DATA_Buffer_reg[62] ;
  wire \n_0_MUXED_DATA_Buffer_reg[63] ;
  wire [15:0]p_1_in;
  wire [15:0]p_3_in;
  wire [15:0]p_5_in;
  wire user_clk;

GND GND
       (.G(\<const0> ));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \MUXED_DATA_Buffer[16]_i_1 
       (.I0(data2[15]),
        .I1(Q[1]),
        .I2(D[15]),
        .I3(Q[2]),
        .I4(p_5_in[15]),
        .O(\n_0_MUXED_DATA_Buffer[16]_i_1 ));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \MUXED_DATA_Buffer[17]_i_1 
       (.I0(data2[14]),
        .I1(Q[1]),
        .I2(D[14]),
        .I3(Q[2]),
        .I4(p_5_in[14]),
        .O(\n_0_MUXED_DATA_Buffer[17]_i_1 ));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \MUXED_DATA_Buffer[18]_i_1 
       (.I0(data2[13]),
        .I1(Q[1]),
        .I2(D[13]),
        .I3(Q[2]),
        .I4(p_5_in[13]),
        .O(\n_0_MUXED_DATA_Buffer[18]_i_1 ));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \MUXED_DATA_Buffer[19]_i_1 
       (.I0(data2[12]),
        .I1(Q[1]),
        .I2(D[12]),
        .I3(Q[2]),
        .I4(p_5_in[12]),
        .O(\n_0_MUXED_DATA_Buffer[19]_i_1 ));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \MUXED_DATA_Buffer[20]_i_1 
       (.I0(data2[11]),
        .I1(Q[1]),
        .I2(D[11]),
        .I3(Q[2]),
        .I4(p_5_in[11]),
        .O(\n_0_MUXED_DATA_Buffer[20]_i_1 ));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \MUXED_DATA_Buffer[21]_i_1 
       (.I0(data2[10]),
        .I1(Q[1]),
        .I2(D[10]),
        .I3(Q[2]),
        .I4(p_5_in[10]),
        .O(\n_0_MUXED_DATA_Buffer[21]_i_1 ));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \MUXED_DATA_Buffer[22]_i_1 
       (.I0(data2[9]),
        .I1(Q[1]),
        .I2(D[9]),
        .I3(Q[2]),
        .I4(p_5_in[9]),
        .O(\n_0_MUXED_DATA_Buffer[22]_i_1 ));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \MUXED_DATA_Buffer[23]_i_1 
       (.I0(data2[8]),
        .I1(Q[1]),
        .I2(D[8]),
        .I3(Q[2]),
        .I4(p_5_in[8]),
        .O(\n_0_MUXED_DATA_Buffer[23]_i_1 ));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \MUXED_DATA_Buffer[24]_i_1 
       (.I0(data2[7]),
        .I1(Q[1]),
        .I2(D[7]),
        .I3(Q[2]),
        .I4(p_5_in[7]),
        .O(\n_0_MUXED_DATA_Buffer[24]_i_1 ));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \MUXED_DATA_Buffer[25]_i_1 
       (.I0(data2[6]),
        .I1(Q[1]),
        .I2(D[6]),
        .I3(Q[2]),
        .I4(p_5_in[6]),
        .O(\n_0_MUXED_DATA_Buffer[25]_i_1 ));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \MUXED_DATA_Buffer[26]_i_1 
       (.I0(data2[5]),
        .I1(Q[1]),
        .I2(D[5]),
        .I3(Q[2]),
        .I4(p_5_in[5]),
        .O(\n_0_MUXED_DATA_Buffer[26]_i_1 ));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \MUXED_DATA_Buffer[27]_i_1 
       (.I0(data2[4]),
        .I1(Q[1]),
        .I2(D[4]),
        .I3(Q[2]),
        .I4(p_5_in[4]),
        .O(\n_0_MUXED_DATA_Buffer[27]_i_1 ));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \MUXED_DATA_Buffer[28]_i_1 
       (.I0(data2[3]),
        .I1(Q[1]),
        .I2(D[3]),
        .I3(Q[2]),
        .I4(p_5_in[3]),
        .O(\n_0_MUXED_DATA_Buffer[28]_i_1 ));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \MUXED_DATA_Buffer[29]_i_1 
       (.I0(data2[2]),
        .I1(Q[1]),
        .I2(D[2]),
        .I3(Q[2]),
        .I4(p_5_in[2]),
        .O(\n_0_MUXED_DATA_Buffer[29]_i_1 ));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \MUXED_DATA_Buffer[30]_i_1 
       (.I0(data2[1]),
        .I1(Q[1]),
        .I2(D[1]),
        .I3(Q[2]),
        .I4(p_5_in[1]),
        .O(\n_0_MUXED_DATA_Buffer[30]_i_1 ));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \MUXED_DATA_Buffer[31]_i_1 
       (.I0(data2[0]),
        .I1(Q[1]),
        .I2(D[0]),
        .I3(Q[2]),
        .I4(p_5_in[0]),
        .O(\n_0_MUXED_DATA_Buffer[31]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair9" *) 
   LUT3 #(
    .INIT(8'hAC)) 
     \MUXED_DATA_Buffer[32]_i_1 
       (.I0(D[15]),
        .I1(data2[15]),
        .I2(Q[0]),
        .O(muxed_data_c[32]));
(* SOFT_HLUTNM = "soft_lutpair10" *) 
   LUT3 #(
    .INIT(8'hAC)) 
     \MUXED_DATA_Buffer[33]_i_1 
       (.I0(D[14]),
        .I1(data2[14]),
        .I2(Q[0]),
        .O(muxed_data_c[33]));
(* SOFT_HLUTNM = "soft_lutpair11" *) 
   LUT3 #(
    .INIT(8'hAC)) 
     \MUXED_DATA_Buffer[34]_i_1 
       (.I0(D[13]),
        .I1(data2[13]),
        .I2(Q[0]),
        .O(muxed_data_c[34]));
(* SOFT_HLUTNM = "soft_lutpair12" *) 
   LUT3 #(
    .INIT(8'hAC)) 
     \MUXED_DATA_Buffer[35]_i_1 
       (.I0(D[12]),
        .I1(data2[12]),
        .I2(Q[0]),
        .O(muxed_data_c[35]));
(* SOFT_HLUTNM = "soft_lutpair13" *) 
   LUT3 #(
    .INIT(8'hAC)) 
     \MUXED_DATA_Buffer[36]_i_1 
       (.I0(D[11]),
        .I1(data2[11]),
        .I2(Q[0]),
        .O(muxed_data_c[36]));
(* SOFT_HLUTNM = "soft_lutpair14" *) 
   LUT3 #(
    .INIT(8'hAC)) 
     \MUXED_DATA_Buffer[37]_i_1 
       (.I0(D[10]),
        .I1(data2[10]),
        .I2(Q[0]),
        .O(muxed_data_c[37]));
(* SOFT_HLUTNM = "soft_lutpair15" *) 
   LUT3 #(
    .INIT(8'hAC)) 
     \MUXED_DATA_Buffer[38]_i_1 
       (.I0(D[9]),
        .I1(data2[9]),
        .I2(Q[0]),
        .O(muxed_data_c[38]));
(* SOFT_HLUTNM = "soft_lutpair15" *) 
   LUT3 #(
    .INIT(8'hAC)) 
     \MUXED_DATA_Buffer[39]_i_1 
       (.I0(D[8]),
        .I1(data2[8]),
        .I2(Q[0]),
        .O(muxed_data_c[39]));
(* SOFT_HLUTNM = "soft_lutpair14" *) 
   LUT3 #(
    .INIT(8'hAC)) 
     \MUXED_DATA_Buffer[40]_i_1 
       (.I0(D[7]),
        .I1(data2[7]),
        .I2(Q[0]),
        .O(muxed_data_c[40]));
(* SOFT_HLUTNM = "soft_lutpair13" *) 
   LUT3 #(
    .INIT(8'hAC)) 
     \MUXED_DATA_Buffer[41]_i_1 
       (.I0(D[6]),
        .I1(data2[6]),
        .I2(Q[0]),
        .O(muxed_data_c[41]));
(* SOFT_HLUTNM = "soft_lutpair12" *) 
   LUT3 #(
    .INIT(8'hAC)) 
     \MUXED_DATA_Buffer[42]_i_1 
       (.I0(D[5]),
        .I1(data2[5]),
        .I2(Q[0]),
        .O(muxed_data_c[42]));
(* SOFT_HLUTNM = "soft_lutpair11" *) 
   LUT3 #(
    .INIT(8'hAC)) 
     \MUXED_DATA_Buffer[43]_i_1 
       (.I0(D[4]),
        .I1(data2[4]),
        .I2(Q[0]),
        .O(muxed_data_c[43]));
(* SOFT_HLUTNM = "soft_lutpair10" *) 
   LUT3 #(
    .INIT(8'hAC)) 
     \MUXED_DATA_Buffer[44]_i_1 
       (.I0(D[3]),
        .I1(data2[3]),
        .I2(Q[0]),
        .O(muxed_data_c[44]));
(* SOFT_HLUTNM = "soft_lutpair9" *) 
   LUT3 #(
    .INIT(8'hAC)) 
     \MUXED_DATA_Buffer[45]_i_1 
       (.I0(D[2]),
        .I1(data2[2]),
        .I2(Q[0]),
        .O(muxed_data_c[45]));
(* SOFT_HLUTNM = "soft_lutpair8" *) 
   LUT3 #(
    .INIT(8'hAC)) 
     \MUXED_DATA_Buffer[46]_i_1 
       (.I0(D[1]),
        .I1(data2[1]),
        .I2(Q[0]),
        .O(muxed_data_c[46]));
(* SOFT_HLUTNM = "soft_lutpair8" *) 
   LUT3 #(
    .INIT(8'hAC)) 
     \MUXED_DATA_Buffer[47]_i_1 
       (.I0(D[0]),
        .I1(data2[0]),
        .I2(Q[0]),
        .O(muxed_data_c[47]));
FDRE \MUXED_DATA_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[31]),
        .Q(p_3_in[15]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[10] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[21]),
        .Q(p_3_in[5]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[11] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[20]),
        .Q(p_3_in[4]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[12] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[19]),
        .Q(p_3_in[3]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[13] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[18]),
        .Q(p_3_in[2]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[14] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[17]),
        .Q(p_3_in[1]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[15] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[16]),
        .Q(p_3_in[0]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[16] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_MUXED_DATA_Buffer[16]_i_1 ),
        .Q(\n_0_MUXED_DATA_Buffer_reg[16] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[17] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_MUXED_DATA_Buffer[17]_i_1 ),
        .Q(\n_0_MUXED_DATA_Buffer_reg[17] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[18] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_MUXED_DATA_Buffer[18]_i_1 ),
        .Q(\n_0_MUXED_DATA_Buffer_reg[18] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[19] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_MUXED_DATA_Buffer[19]_i_1 ),
        .Q(\n_0_MUXED_DATA_Buffer_reg[19] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[30]),
        .Q(p_3_in[14]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[20] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_MUXED_DATA_Buffer[20]_i_1 ),
        .Q(\n_0_MUXED_DATA_Buffer_reg[20] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[21] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_MUXED_DATA_Buffer[21]_i_1 ),
        .Q(\n_0_MUXED_DATA_Buffer_reg[21] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[22] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_MUXED_DATA_Buffer[22]_i_1 ),
        .Q(\n_0_MUXED_DATA_Buffer_reg[22] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[23] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_MUXED_DATA_Buffer[23]_i_1 ),
        .Q(\n_0_MUXED_DATA_Buffer_reg[23] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[24] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_MUXED_DATA_Buffer[24]_i_1 ),
        .Q(\n_0_MUXED_DATA_Buffer_reg[24] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[25] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_MUXED_DATA_Buffer[25]_i_1 ),
        .Q(\n_0_MUXED_DATA_Buffer_reg[25] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[26] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_MUXED_DATA_Buffer[26]_i_1 ),
        .Q(\n_0_MUXED_DATA_Buffer_reg[26] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[27] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_MUXED_DATA_Buffer[27]_i_1 ),
        .Q(\n_0_MUXED_DATA_Buffer_reg[27] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[28] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_MUXED_DATA_Buffer[28]_i_1 ),
        .Q(\n_0_MUXED_DATA_Buffer_reg[28] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[29] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_MUXED_DATA_Buffer[29]_i_1 ),
        .Q(\n_0_MUXED_DATA_Buffer_reg[29] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[29]),
        .Q(p_3_in[13]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[30] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_MUXED_DATA_Buffer[30]_i_1 ),
        .Q(\n_0_MUXED_DATA_Buffer_reg[30] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[31] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_MUXED_DATA_Buffer[31]_i_1 ),
        .Q(\n_0_MUXED_DATA_Buffer_reg[31] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[32] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(muxed_data_c[32]),
        .Q(p_1_in[15]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[33] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(muxed_data_c[33]),
        .Q(p_1_in[14]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[34] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(muxed_data_c[34]),
        .Q(p_1_in[13]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[35] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(muxed_data_c[35]),
        .Q(p_1_in[12]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[36] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(muxed_data_c[36]),
        .Q(p_1_in[11]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[37] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(muxed_data_c[37]),
        .Q(p_1_in[10]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[38] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(muxed_data_c[38]),
        .Q(p_1_in[9]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[39] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(muxed_data_c[39]),
        .Q(p_1_in[8]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[28]),
        .Q(p_3_in[12]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[40] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(muxed_data_c[40]),
        .Q(p_1_in[7]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[41] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(muxed_data_c[41]),
        .Q(p_1_in[6]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[42] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(muxed_data_c[42]),
        .Q(p_1_in[5]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[43] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(muxed_data_c[43]),
        .Q(p_1_in[4]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[44] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(muxed_data_c[44]),
        .Q(p_1_in[3]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[45] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(muxed_data_c[45]),
        .Q(p_1_in[2]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[46] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(muxed_data_c[46]),
        .Q(p_1_in[1]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[47] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(muxed_data_c[47]),
        .Q(p_1_in[0]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[48] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[15]),
        .Q(\n_0_MUXED_DATA_Buffer_reg[48] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[49] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[14]),
        .Q(\n_0_MUXED_DATA_Buffer_reg[49] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[27]),
        .Q(p_3_in[11]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[50] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[13]),
        .Q(\n_0_MUXED_DATA_Buffer_reg[50] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[51] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[12]),
        .Q(\n_0_MUXED_DATA_Buffer_reg[51] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[52] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[11]),
        .Q(\n_0_MUXED_DATA_Buffer_reg[52] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[53] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[10]),
        .Q(\n_0_MUXED_DATA_Buffer_reg[53] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[54] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[9]),
        .Q(\n_0_MUXED_DATA_Buffer_reg[54] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[55] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[8]),
        .Q(\n_0_MUXED_DATA_Buffer_reg[55] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[56] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[7]),
        .Q(\n_0_MUXED_DATA_Buffer_reg[56] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[57] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[6]),
        .Q(\n_0_MUXED_DATA_Buffer_reg[57] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[58] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[5]),
        .Q(\n_0_MUXED_DATA_Buffer_reg[58] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[59] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[4]),
        .Q(\n_0_MUXED_DATA_Buffer_reg[59] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[26]),
        .Q(p_3_in[10]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[60] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[3]),
        .Q(\n_0_MUXED_DATA_Buffer_reg[60] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[61] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[2]),
        .Q(\n_0_MUXED_DATA_Buffer_reg[61] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[62] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[1]),
        .Q(\n_0_MUXED_DATA_Buffer_reg[62] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[63] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[0]),
        .Q(\n_0_MUXED_DATA_Buffer_reg[63] ),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[25]),
        .Q(p_3_in[9]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[24]),
        .Q(p_3_in[8]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[8] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[23]),
        .Q(p_3_in[7]),
        .R(\<const0> ));
FDRE \MUXED_DATA_Buffer_reg[9] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[22]),
        .Q(p_3_in[6]),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair0" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \OUTPUT_DATA_Buffer[16]_i_1 
       (.I0(p_3_in[15]),
        .I1(OUTPUT_SELECT_Buffer[4]),
        .I2(STORAGE_DATA[47]),
        .O(O1));
(* SOFT_HLUTNM = "soft_lutpair1" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \OUTPUT_DATA_Buffer[17]_i_1 
       (.I0(p_3_in[14]),
        .I1(OUTPUT_SELECT_Buffer[4]),
        .I2(STORAGE_DATA[46]),
        .O(O2));
(* SOFT_HLUTNM = "soft_lutpair2" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \OUTPUT_DATA_Buffer[18]_i_1 
       (.I0(p_3_in[13]),
        .I1(OUTPUT_SELECT_Buffer[4]),
        .I2(STORAGE_DATA[45]),
        .O(O3));
(* SOFT_HLUTNM = "soft_lutpair3" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \OUTPUT_DATA_Buffer[19]_i_1 
       (.I0(p_3_in[12]),
        .I1(OUTPUT_SELECT_Buffer[4]),
        .I2(STORAGE_DATA[44]),
        .O(O4));
(* SOFT_HLUTNM = "soft_lutpair4" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \OUTPUT_DATA_Buffer[20]_i_1 
       (.I0(p_3_in[11]),
        .I1(OUTPUT_SELECT_Buffer[4]),
        .I2(STORAGE_DATA[43]),
        .O(O5));
(* SOFT_HLUTNM = "soft_lutpair5" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \OUTPUT_DATA_Buffer[21]_i_1 
       (.I0(p_3_in[10]),
        .I1(OUTPUT_SELECT_Buffer[4]),
        .I2(STORAGE_DATA[42]),
        .O(O6));
(* SOFT_HLUTNM = "soft_lutpair6" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \OUTPUT_DATA_Buffer[22]_i_1 
       (.I0(p_3_in[9]),
        .I1(OUTPUT_SELECT_Buffer[4]),
        .I2(STORAGE_DATA[41]),
        .O(O7));
(* SOFT_HLUTNM = "soft_lutpair7" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \OUTPUT_DATA_Buffer[23]_i_1 
       (.I0(p_3_in[8]),
        .I1(OUTPUT_SELECT_Buffer[4]),
        .I2(STORAGE_DATA[40]),
        .O(O8));
(* SOFT_HLUTNM = "soft_lutpair7" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \OUTPUT_DATA_Buffer[24]_i_1 
       (.I0(p_3_in[7]),
        .I1(OUTPUT_SELECT_Buffer[4]),
        .I2(STORAGE_DATA[39]),
        .O(O9));
(* SOFT_HLUTNM = "soft_lutpair6" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \OUTPUT_DATA_Buffer[25]_i_1 
       (.I0(p_3_in[6]),
        .I1(OUTPUT_SELECT_Buffer[4]),
        .I2(STORAGE_DATA[38]),
        .O(O10));
(* SOFT_HLUTNM = "soft_lutpair5" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \OUTPUT_DATA_Buffer[26]_i_1 
       (.I0(p_3_in[5]),
        .I1(OUTPUT_SELECT_Buffer[4]),
        .I2(STORAGE_DATA[37]),
        .O(O11));
(* SOFT_HLUTNM = "soft_lutpair4" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \OUTPUT_DATA_Buffer[27]_i_1 
       (.I0(p_3_in[4]),
        .I1(OUTPUT_SELECT_Buffer[4]),
        .I2(STORAGE_DATA[36]),
        .O(O12));
(* SOFT_HLUTNM = "soft_lutpair3" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \OUTPUT_DATA_Buffer[28]_i_1 
       (.I0(p_3_in[3]),
        .I1(OUTPUT_SELECT_Buffer[4]),
        .I2(STORAGE_DATA[35]),
        .O(O13));
(* SOFT_HLUTNM = "soft_lutpair2" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \OUTPUT_DATA_Buffer[29]_i_1 
       (.I0(p_3_in[2]),
        .I1(OUTPUT_SELECT_Buffer[4]),
        .I2(STORAGE_DATA[34]),
        .O(O14));
(* SOFT_HLUTNM = "soft_lutpair1" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \OUTPUT_DATA_Buffer[30]_i_1 
       (.I0(p_3_in[1]),
        .I1(OUTPUT_SELECT_Buffer[4]),
        .I2(STORAGE_DATA[33]),
        .O(O15));
(* SOFT_HLUTNM = "soft_lutpair0" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \OUTPUT_DATA_Buffer[31]_i_1 
       (.I0(p_3_in[0]),
        .I1(OUTPUT_SELECT_Buffer[4]),
        .I2(STORAGE_DATA[32]),
        .O(O16));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \OUTPUT_DATA_Buffer[32]_i_1 
       (.I0(p_3_in[15]),
        .I1(OUTPUT_SELECT_Buffer[2]),
        .I2(\n_0_MUXED_DATA_Buffer_reg[16] ),
        .I3(OUTPUT_SELECT_Buffer[3]),
        .I4(STORAGE_DATA[31]),
        .O(O17));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \OUTPUT_DATA_Buffer[33]_i_1 
       (.I0(p_3_in[14]),
        .I1(OUTPUT_SELECT_Buffer[2]),
        .I2(\n_0_MUXED_DATA_Buffer_reg[17] ),
        .I3(OUTPUT_SELECT_Buffer[3]),
        .I4(STORAGE_DATA[30]),
        .O(O18));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \OUTPUT_DATA_Buffer[34]_i_1 
       (.I0(p_3_in[13]),
        .I1(OUTPUT_SELECT_Buffer[2]),
        .I2(\n_0_MUXED_DATA_Buffer_reg[18] ),
        .I3(OUTPUT_SELECT_Buffer[3]),
        .I4(STORAGE_DATA[29]),
        .O(O19));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \OUTPUT_DATA_Buffer[35]_i_1 
       (.I0(p_3_in[12]),
        .I1(OUTPUT_SELECT_Buffer[2]),
        .I2(\n_0_MUXED_DATA_Buffer_reg[19] ),
        .I3(OUTPUT_SELECT_Buffer[3]),
        .I4(STORAGE_DATA[28]),
        .O(O20));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \OUTPUT_DATA_Buffer[36]_i_1 
       (.I0(p_3_in[11]),
        .I1(OUTPUT_SELECT_Buffer[2]),
        .I2(\n_0_MUXED_DATA_Buffer_reg[20] ),
        .I3(OUTPUT_SELECT_Buffer[3]),
        .I4(STORAGE_DATA[27]),
        .O(O21));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \OUTPUT_DATA_Buffer[37]_i_1 
       (.I0(p_3_in[10]),
        .I1(OUTPUT_SELECT_Buffer[2]),
        .I2(\n_0_MUXED_DATA_Buffer_reg[21] ),
        .I3(OUTPUT_SELECT_Buffer[3]),
        .I4(STORAGE_DATA[26]),
        .O(O22));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \OUTPUT_DATA_Buffer[38]_i_1 
       (.I0(p_3_in[9]),
        .I1(OUTPUT_SELECT_Buffer[2]),
        .I2(\n_0_MUXED_DATA_Buffer_reg[22] ),
        .I3(OUTPUT_SELECT_Buffer[3]),
        .I4(STORAGE_DATA[25]),
        .O(O23));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \OUTPUT_DATA_Buffer[39]_i_1 
       (.I0(p_3_in[8]),
        .I1(OUTPUT_SELECT_Buffer[2]),
        .I2(\n_0_MUXED_DATA_Buffer_reg[23] ),
        .I3(OUTPUT_SELECT_Buffer[3]),
        .I4(STORAGE_DATA[24]),
        .O(O24));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \OUTPUT_DATA_Buffer[40]_i_1 
       (.I0(p_3_in[7]),
        .I1(OUTPUT_SELECT_Buffer[2]),
        .I2(\n_0_MUXED_DATA_Buffer_reg[24] ),
        .I3(OUTPUT_SELECT_Buffer[3]),
        .I4(STORAGE_DATA[23]),
        .O(O25));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \OUTPUT_DATA_Buffer[41]_i_1 
       (.I0(p_3_in[6]),
        .I1(OUTPUT_SELECT_Buffer[2]),
        .I2(\n_0_MUXED_DATA_Buffer_reg[25] ),
        .I3(OUTPUT_SELECT_Buffer[3]),
        .I4(STORAGE_DATA[22]),
        .O(O26));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \OUTPUT_DATA_Buffer[42]_i_1 
       (.I0(p_3_in[5]),
        .I1(OUTPUT_SELECT_Buffer[2]),
        .I2(\n_0_MUXED_DATA_Buffer_reg[26] ),
        .I3(OUTPUT_SELECT_Buffer[3]),
        .I4(STORAGE_DATA[21]),
        .O(O27));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \OUTPUT_DATA_Buffer[43]_i_1 
       (.I0(p_3_in[4]),
        .I1(OUTPUT_SELECT_Buffer[2]),
        .I2(\n_0_MUXED_DATA_Buffer_reg[27] ),
        .I3(OUTPUT_SELECT_Buffer[3]),
        .I4(STORAGE_DATA[20]),
        .O(O28));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \OUTPUT_DATA_Buffer[44]_i_1 
       (.I0(p_3_in[3]),
        .I1(OUTPUT_SELECT_Buffer[2]),
        .I2(\n_0_MUXED_DATA_Buffer_reg[28] ),
        .I3(OUTPUT_SELECT_Buffer[3]),
        .I4(STORAGE_DATA[19]),
        .O(O29));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \OUTPUT_DATA_Buffer[45]_i_1 
       (.I0(p_3_in[2]),
        .I1(OUTPUT_SELECT_Buffer[2]),
        .I2(\n_0_MUXED_DATA_Buffer_reg[29] ),
        .I3(OUTPUT_SELECT_Buffer[3]),
        .I4(STORAGE_DATA[18]),
        .O(O30));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \OUTPUT_DATA_Buffer[46]_i_1 
       (.I0(p_3_in[1]),
        .I1(OUTPUT_SELECT_Buffer[2]),
        .I2(\n_0_MUXED_DATA_Buffer_reg[30] ),
        .I3(OUTPUT_SELECT_Buffer[3]),
        .I4(STORAGE_DATA[17]),
        .O(O31));
LUT5 #(
    .INIT(32'h30BB3088)) 
     \OUTPUT_DATA_Buffer[47]_i_1 
       (.I0(p_3_in[0]),
        .I1(OUTPUT_SELECT_Buffer[2]),
        .I2(\n_0_MUXED_DATA_Buffer_reg[31] ),
        .I3(OUTPUT_SELECT_Buffer[3]),
        .I4(STORAGE_DATA[16]),
        .O(O32));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \OUTPUT_DATA_Buffer[48]_i_1 
       (.I0(p_1_in[15]),
        .I1(p_3_in[15]),
        .I2(OUTPUT_SELECT_Buffer[0]),
        .I3(\n_0_MUXED_DATA_Buffer_reg[16] ),
        .I4(OUTPUT_SELECT_Buffer[1]),
        .I5(STORAGE_DATA[15]),
        .O(O33));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \OUTPUT_DATA_Buffer[49]_i_1 
       (.I0(p_1_in[14]),
        .I1(p_3_in[14]),
        .I2(OUTPUT_SELECT_Buffer[0]),
        .I3(\n_0_MUXED_DATA_Buffer_reg[17] ),
        .I4(OUTPUT_SELECT_Buffer[1]),
        .I5(STORAGE_DATA[14]),
        .O(O34));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \OUTPUT_DATA_Buffer[50]_i_1 
       (.I0(p_1_in[13]),
        .I1(p_3_in[13]),
        .I2(OUTPUT_SELECT_Buffer[0]),
        .I3(\n_0_MUXED_DATA_Buffer_reg[18] ),
        .I4(OUTPUT_SELECT_Buffer[1]),
        .I5(STORAGE_DATA[13]),
        .O(O35));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \OUTPUT_DATA_Buffer[51]_i_1 
       (.I0(p_1_in[12]),
        .I1(p_3_in[12]),
        .I2(OUTPUT_SELECT_Buffer[0]),
        .I3(\n_0_MUXED_DATA_Buffer_reg[19] ),
        .I4(OUTPUT_SELECT_Buffer[1]),
        .I5(STORAGE_DATA[12]),
        .O(O36));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \OUTPUT_DATA_Buffer[52]_i_1 
       (.I0(p_1_in[11]),
        .I1(p_3_in[11]),
        .I2(OUTPUT_SELECT_Buffer[0]),
        .I3(\n_0_MUXED_DATA_Buffer_reg[20] ),
        .I4(OUTPUT_SELECT_Buffer[1]),
        .I5(STORAGE_DATA[11]),
        .O(O37));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \OUTPUT_DATA_Buffer[53]_i_1 
       (.I0(p_1_in[10]),
        .I1(p_3_in[10]),
        .I2(OUTPUT_SELECT_Buffer[0]),
        .I3(\n_0_MUXED_DATA_Buffer_reg[21] ),
        .I4(OUTPUT_SELECT_Buffer[1]),
        .I5(STORAGE_DATA[10]),
        .O(O38));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \OUTPUT_DATA_Buffer[54]_i_1 
       (.I0(p_1_in[9]),
        .I1(p_3_in[9]),
        .I2(OUTPUT_SELECT_Buffer[0]),
        .I3(\n_0_MUXED_DATA_Buffer_reg[22] ),
        .I4(OUTPUT_SELECT_Buffer[1]),
        .I5(STORAGE_DATA[9]),
        .O(O39));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \OUTPUT_DATA_Buffer[55]_i_1 
       (.I0(p_1_in[8]),
        .I1(p_3_in[8]),
        .I2(OUTPUT_SELECT_Buffer[0]),
        .I3(\n_0_MUXED_DATA_Buffer_reg[23] ),
        .I4(OUTPUT_SELECT_Buffer[1]),
        .I5(STORAGE_DATA[8]),
        .O(O40));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \OUTPUT_DATA_Buffer[56]_i_1 
       (.I0(p_1_in[7]),
        .I1(p_3_in[7]),
        .I2(OUTPUT_SELECT_Buffer[0]),
        .I3(\n_0_MUXED_DATA_Buffer_reg[24] ),
        .I4(OUTPUT_SELECT_Buffer[1]),
        .I5(STORAGE_DATA[7]),
        .O(O41));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \OUTPUT_DATA_Buffer[57]_i_1 
       (.I0(p_1_in[6]),
        .I1(p_3_in[6]),
        .I2(OUTPUT_SELECT_Buffer[0]),
        .I3(\n_0_MUXED_DATA_Buffer_reg[25] ),
        .I4(OUTPUT_SELECT_Buffer[1]),
        .I5(STORAGE_DATA[6]),
        .O(O42));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \OUTPUT_DATA_Buffer[58]_i_1 
       (.I0(p_1_in[5]),
        .I1(p_3_in[5]),
        .I2(OUTPUT_SELECT_Buffer[0]),
        .I3(\n_0_MUXED_DATA_Buffer_reg[26] ),
        .I4(OUTPUT_SELECT_Buffer[1]),
        .I5(STORAGE_DATA[5]),
        .O(O43));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \OUTPUT_DATA_Buffer[59]_i_1 
       (.I0(p_1_in[4]),
        .I1(p_3_in[4]),
        .I2(OUTPUT_SELECT_Buffer[0]),
        .I3(\n_0_MUXED_DATA_Buffer_reg[27] ),
        .I4(OUTPUT_SELECT_Buffer[1]),
        .I5(STORAGE_DATA[4]),
        .O(O44));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \OUTPUT_DATA_Buffer[60]_i_1 
       (.I0(p_1_in[3]),
        .I1(p_3_in[3]),
        .I2(OUTPUT_SELECT_Buffer[0]),
        .I3(\n_0_MUXED_DATA_Buffer_reg[28] ),
        .I4(OUTPUT_SELECT_Buffer[1]),
        .I5(STORAGE_DATA[3]),
        .O(O45));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \OUTPUT_DATA_Buffer[61]_i_1 
       (.I0(p_1_in[2]),
        .I1(p_3_in[2]),
        .I2(OUTPUT_SELECT_Buffer[0]),
        .I3(\n_0_MUXED_DATA_Buffer_reg[29] ),
        .I4(OUTPUT_SELECT_Buffer[1]),
        .I5(STORAGE_DATA[2]),
        .O(O46));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \OUTPUT_DATA_Buffer[62]_i_1 
       (.I0(p_1_in[1]),
        .I1(p_3_in[1]),
        .I2(OUTPUT_SELECT_Buffer[0]),
        .I3(\n_0_MUXED_DATA_Buffer_reg[30] ),
        .I4(OUTPUT_SELECT_Buffer[1]),
        .I5(STORAGE_DATA[1]),
        .O(O47));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \OUTPUT_DATA_Buffer[63]_i_1 
       (.I0(p_1_in[0]),
        .I1(p_3_in[0]),
        .I2(OUTPUT_SELECT_Buffer[0]),
        .I3(\n_0_MUXED_DATA_Buffer_reg[31] ),
        .I4(OUTPUT_SELECT_Buffer[1]),
        .I5(STORAGE_DATA[0]),
        .O(O48));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[0]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[48] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[16] ),
        .I2(I1[6]),
        .I3(p_1_in[15]),
        .I4(I1[7]),
        .I5(p_3_in[15]),
        .O(O49));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[10]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[58] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[26] ),
        .I2(I1[6]),
        .I3(p_1_in[5]),
        .I4(I1[7]),
        .I5(p_3_in[5]),
        .O(O59));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[11]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[59] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[27] ),
        .I2(I1[6]),
        .I3(p_1_in[4]),
        .I4(I1[7]),
        .I5(p_3_in[4]),
        .O(O60));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[12]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[60] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[28] ),
        .I2(I1[6]),
        .I3(p_1_in[3]),
        .I4(I1[7]),
        .I5(p_3_in[3]),
        .O(O61));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[13]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[61] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[29] ),
        .I2(I1[6]),
        .I3(p_1_in[2]),
        .I4(I1[7]),
        .I5(p_3_in[2]),
        .O(O62));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[14]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[62] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[30] ),
        .I2(I1[6]),
        .I3(p_1_in[1]),
        .I4(I1[7]),
        .I5(p_3_in[1]),
        .O(O63));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[15]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[63] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[31] ),
        .I2(I1[6]),
        .I3(p_1_in[0]),
        .I4(I1[7]),
        .I5(p_3_in[0]),
        .O(O64));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[16]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[48] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[16] ),
        .I2(I1[4]),
        .I3(p_1_in[15]),
        .I4(I1[5]),
        .I5(p_3_in[15]),
        .O(O65));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[17]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[49] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[17] ),
        .I2(I1[4]),
        .I3(p_1_in[14]),
        .I4(I1[5]),
        .I5(p_3_in[14]),
        .O(O66));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[18]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[50] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[18] ),
        .I2(I1[4]),
        .I3(p_1_in[13]),
        .I4(I1[5]),
        .I5(p_3_in[13]),
        .O(O67));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[19]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[51] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[19] ),
        .I2(I1[4]),
        .I3(p_1_in[12]),
        .I4(I1[5]),
        .I5(p_3_in[12]),
        .O(O68));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[1]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[49] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[17] ),
        .I2(I1[6]),
        .I3(p_1_in[14]),
        .I4(I1[7]),
        .I5(p_3_in[14]),
        .O(O50));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[20]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[52] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[20] ),
        .I2(I1[4]),
        .I3(p_1_in[11]),
        .I4(I1[5]),
        .I5(p_3_in[11]),
        .O(O69));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[21]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[53] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[21] ),
        .I2(I1[4]),
        .I3(p_1_in[10]),
        .I4(I1[5]),
        .I5(p_3_in[10]),
        .O(O70));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[22]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[54] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[22] ),
        .I2(I1[4]),
        .I3(p_1_in[9]),
        .I4(I1[5]),
        .I5(p_3_in[9]),
        .O(O71));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[23]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[55] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[23] ),
        .I2(I1[4]),
        .I3(p_1_in[8]),
        .I4(I1[5]),
        .I5(p_3_in[8]),
        .O(O72));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[24]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[56] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[24] ),
        .I2(I1[4]),
        .I3(p_1_in[7]),
        .I4(I1[5]),
        .I5(p_3_in[7]),
        .O(O73));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[25]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[57] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[25] ),
        .I2(I1[4]),
        .I3(p_1_in[6]),
        .I4(I1[5]),
        .I5(p_3_in[6]),
        .O(O74));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[26]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[58] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[26] ),
        .I2(I1[4]),
        .I3(p_1_in[5]),
        .I4(I1[5]),
        .I5(p_3_in[5]),
        .O(O75));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[27]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[59] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[27] ),
        .I2(I1[4]),
        .I3(p_1_in[4]),
        .I4(I1[5]),
        .I5(p_3_in[4]),
        .O(O76));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[28]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[60] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[28] ),
        .I2(I1[4]),
        .I3(p_1_in[3]),
        .I4(I1[5]),
        .I5(p_3_in[3]),
        .O(O77));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[29]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[61] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[29] ),
        .I2(I1[4]),
        .I3(p_1_in[2]),
        .I4(I1[5]),
        .I5(p_3_in[2]),
        .O(O78));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[2]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[50] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[18] ),
        .I2(I1[6]),
        .I3(p_1_in[13]),
        .I4(I1[7]),
        .I5(p_3_in[13]),
        .O(O51));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[30]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[62] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[30] ),
        .I2(I1[4]),
        .I3(p_1_in[1]),
        .I4(I1[5]),
        .I5(p_3_in[1]),
        .O(O79));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[31]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[63] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[31] ),
        .I2(I1[4]),
        .I3(p_1_in[0]),
        .I4(I1[5]),
        .I5(p_3_in[0]),
        .O(O80));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[32]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[48] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[16] ),
        .I2(I1[2]),
        .I3(p_1_in[15]),
        .I4(I1[3]),
        .I5(p_3_in[15]),
        .O(O81));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[33]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[49] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[17] ),
        .I2(I1[2]),
        .I3(p_1_in[14]),
        .I4(I1[3]),
        .I5(p_3_in[14]),
        .O(O82));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[34]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[50] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[18] ),
        .I2(I1[2]),
        .I3(p_1_in[13]),
        .I4(I1[3]),
        .I5(p_3_in[13]),
        .O(O83));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[35]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[51] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[19] ),
        .I2(I1[2]),
        .I3(p_1_in[12]),
        .I4(I1[3]),
        .I5(p_3_in[12]),
        .O(O84));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[36]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[52] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[20] ),
        .I2(I1[2]),
        .I3(p_1_in[11]),
        .I4(I1[3]),
        .I5(p_3_in[11]),
        .O(O85));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[37]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[53] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[21] ),
        .I2(I1[2]),
        .I3(p_1_in[10]),
        .I4(I1[3]),
        .I5(p_3_in[10]),
        .O(O86));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[38]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[54] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[22] ),
        .I2(I1[2]),
        .I3(p_1_in[9]),
        .I4(I1[3]),
        .I5(p_3_in[9]),
        .O(O87));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[39]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[55] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[23] ),
        .I2(I1[2]),
        .I3(p_1_in[8]),
        .I4(I1[3]),
        .I5(p_3_in[8]),
        .O(O88));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[3]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[51] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[19] ),
        .I2(I1[6]),
        .I3(p_1_in[12]),
        .I4(I1[7]),
        .I5(p_3_in[12]),
        .O(O52));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[40]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[56] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[24] ),
        .I2(I1[2]),
        .I3(p_1_in[7]),
        .I4(I1[3]),
        .I5(p_3_in[7]),
        .O(O89));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[41]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[57] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[25] ),
        .I2(I1[2]),
        .I3(p_1_in[6]),
        .I4(I1[3]),
        .I5(p_3_in[6]),
        .O(O90));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[42]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[58] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[26] ),
        .I2(I1[2]),
        .I3(p_1_in[5]),
        .I4(I1[3]),
        .I5(p_3_in[5]),
        .O(O91));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[43]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[59] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[27] ),
        .I2(I1[2]),
        .I3(p_1_in[4]),
        .I4(I1[3]),
        .I5(p_3_in[4]),
        .O(O92));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[44]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[60] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[28] ),
        .I2(I1[2]),
        .I3(p_1_in[3]),
        .I4(I1[3]),
        .I5(p_3_in[3]),
        .O(O93));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[45]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[61] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[29] ),
        .I2(I1[2]),
        .I3(p_1_in[2]),
        .I4(I1[3]),
        .I5(p_3_in[2]),
        .O(O94));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[46]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[62] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[30] ),
        .I2(I1[2]),
        .I3(p_1_in[1]),
        .I4(I1[3]),
        .I5(p_3_in[1]),
        .O(O95));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[47]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[63] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[31] ),
        .I2(I1[2]),
        .I3(p_1_in[0]),
        .I4(I1[3]),
        .I5(p_3_in[0]),
        .O(O96));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[48]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[48] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[16] ),
        .I2(I1[0]),
        .I3(p_1_in[15]),
        .I4(I1[1]),
        .I5(p_3_in[15]),
        .O(O97));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[49]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[49] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[17] ),
        .I2(I1[0]),
        .I3(p_1_in[14]),
        .I4(I1[1]),
        .I5(p_3_in[14]),
        .O(O98));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[4]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[52] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[20] ),
        .I2(I1[6]),
        .I3(p_1_in[11]),
        .I4(I1[7]),
        .I5(p_3_in[11]),
        .O(O53));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[50]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[50] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[18] ),
        .I2(I1[0]),
        .I3(p_1_in[13]),
        .I4(I1[1]),
        .I5(p_3_in[13]),
        .O(O99));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[51]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[51] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[19] ),
        .I2(I1[0]),
        .I3(p_1_in[12]),
        .I4(I1[1]),
        .I5(p_3_in[12]),
        .O(O100));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[52]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[52] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[20] ),
        .I2(I1[0]),
        .I3(p_1_in[11]),
        .I4(I1[1]),
        .I5(p_3_in[11]),
        .O(O101));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[53]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[53] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[21] ),
        .I2(I1[0]),
        .I3(p_1_in[10]),
        .I4(I1[1]),
        .I5(p_3_in[10]),
        .O(O102));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[54]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[54] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[22] ),
        .I2(I1[0]),
        .I3(p_1_in[9]),
        .I4(I1[1]),
        .I5(p_3_in[9]),
        .O(O103));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[55]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[55] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[23] ),
        .I2(I1[0]),
        .I3(p_1_in[8]),
        .I4(I1[1]),
        .I5(p_3_in[8]),
        .O(O104));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[56]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[56] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[24] ),
        .I2(I1[0]),
        .I3(p_1_in[7]),
        .I4(I1[1]),
        .I5(p_3_in[7]),
        .O(O105));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[57]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[57] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[25] ),
        .I2(I1[0]),
        .I3(p_1_in[6]),
        .I4(I1[1]),
        .I5(p_3_in[6]),
        .O(O106));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[58]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[58] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[26] ),
        .I2(I1[0]),
        .I3(p_1_in[5]),
        .I4(I1[1]),
        .I5(p_3_in[5]),
        .O(O107));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[59]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[59] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[27] ),
        .I2(I1[0]),
        .I3(p_1_in[4]),
        .I4(I1[1]),
        .I5(p_3_in[4]),
        .O(O108));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[5]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[53] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[21] ),
        .I2(I1[6]),
        .I3(p_1_in[10]),
        .I4(I1[7]),
        .I5(p_3_in[10]),
        .O(O54));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[60]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[60] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[28] ),
        .I2(I1[0]),
        .I3(p_1_in[3]),
        .I4(I1[1]),
        .I5(p_3_in[3]),
        .O(O109));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[61]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[61] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[29] ),
        .I2(I1[0]),
        .I3(p_1_in[2]),
        .I4(I1[1]),
        .I5(p_3_in[2]),
        .O(O110));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[62]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[62] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[30] ),
        .I2(I1[0]),
        .I3(p_1_in[1]),
        .I4(I1[1]),
        .I5(p_3_in[1]),
        .O(O111));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[63]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[63] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[31] ),
        .I2(I1[0]),
        .I3(p_1_in[0]),
        .I4(I1[1]),
        .I5(p_3_in[0]),
        .O(O112));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[6]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[54] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[22] ),
        .I2(I1[6]),
        .I3(p_1_in[9]),
        .I4(I1[7]),
        .I5(p_3_in[9]),
        .O(O55));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[7]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[55] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[23] ),
        .I2(I1[6]),
        .I3(p_1_in[8]),
        .I4(I1[7]),
        .I5(p_3_in[8]),
        .O(O56));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[8]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[56] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[24] ),
        .I2(I1[6]),
        .I3(p_1_in[7]),
        .I4(I1[7]),
        .I5(p_3_in[7]),
        .O(O57));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \STORAGE_DATA_Buffer[9]_i_1 
       (.I0(\n_0_MUXED_DATA_Buffer_reg[57] ),
        .I1(\n_0_MUXED_DATA_Buffer_reg[25] ),
        .I2(I1[6]),
        .I3(p_1_in[6]),
        .I4(I1[7]),
        .I5(p_3_in[6]),
        .O(O58));
VCC VCC
       (.P(\<const1> ));
endmodule

module data_mgtdata_mgt_OUTPUT_MUX
   (M_AXI_RX_TDATA,
    D,
    user_clk,
    I1,
    I2,
    I3,
    I4,
    I5,
    I6,
    I7,
    I8,
    I9,
    I10,
    I11,
    I12,
    I13,
    I14,
    I15,
    I16,
    I17,
    I18,
    I19,
    I20,
    I21,
    I22,
    I23,
    I24,
    I25,
    I26,
    I27,
    I28,
    I29,
    I30,
    I31,
    I32,
    I33,
    I34,
    I35,
    I36,
    I37,
    I38,
    I39,
    I40,
    I41,
    I42,
    I43,
    I44,
    I45,
    I46,
    I47,
    I48);
  output [0:63]M_AXI_RX_TDATA;
  input [15:0]D;
  input user_clk;
  input I1;
  input I2;
  input I3;
  input I4;
  input I5;
  input I6;
  input I7;
  input I8;
  input I9;
  input I10;
  input I11;
  input I12;
  input I13;
  input I14;
  input I15;
  input I16;
  input I17;
  input I18;
  input I19;
  input I20;
  input I21;
  input I22;
  input I23;
  input I24;
  input I25;
  input I26;
  input I27;
  input I28;
  input I29;
  input I30;
  input I31;
  input I32;
  input I33;
  input I34;
  input I35;
  input I36;
  input I37;
  input I38;
  input I39;
  input I40;
  input I41;
  input I42;
  input I43;
  input I44;
  input I45;
  input I46;
  input I47;
  input I48;

  wire \<const0> ;
  wire \<const1> ;
  wire [15:0]D;
  wire I1;
  wire I10;
  wire I11;
  wire I12;
  wire I13;
  wire I14;
  wire I15;
  wire I16;
  wire I17;
  wire I18;
  wire I19;
  wire I2;
  wire I20;
  wire I21;
  wire I22;
  wire I23;
  wire I24;
  wire I25;
  wire I26;
  wire I27;
  wire I28;
  wire I29;
  wire I3;
  wire I30;
  wire I31;
  wire I32;
  wire I33;
  wire I34;
  wire I35;
  wire I36;
  wire I37;
  wire I38;
  wire I39;
  wire I4;
  wire I40;
  wire I41;
  wire I42;
  wire I43;
  wire I44;
  wire I45;
  wire I46;
  wire I47;
  wire I48;
  wire I5;
  wire I6;
  wire I7;
  wire I8;
  wire I9;
  wire [0:63]M_AXI_RX_TDATA;
  wire user_clk;

GND GND
       (.G(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[15]),
        .Q(M_AXI_RX_TDATA[0]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[10] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[5]),
        .Q(M_AXI_RX_TDATA[10]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[11] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[4]),
        .Q(M_AXI_RX_TDATA[11]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[12] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[3]),
        .Q(M_AXI_RX_TDATA[12]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[13] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[2]),
        .Q(M_AXI_RX_TDATA[13]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[14] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[1]),
        .Q(M_AXI_RX_TDATA[14]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[15] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[0]),
        .Q(M_AXI_RX_TDATA[15]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[16] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I1),
        .Q(M_AXI_RX_TDATA[16]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[17] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I2),
        .Q(M_AXI_RX_TDATA[17]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[18] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I3),
        .Q(M_AXI_RX_TDATA[18]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[19] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I4),
        .Q(M_AXI_RX_TDATA[19]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[14]),
        .Q(M_AXI_RX_TDATA[1]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[20] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I5),
        .Q(M_AXI_RX_TDATA[20]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[21] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I6),
        .Q(M_AXI_RX_TDATA[21]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[22] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I7),
        .Q(M_AXI_RX_TDATA[22]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[23] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I8),
        .Q(M_AXI_RX_TDATA[23]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[24] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I9),
        .Q(M_AXI_RX_TDATA[24]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[25] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I10),
        .Q(M_AXI_RX_TDATA[25]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[26] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I11),
        .Q(M_AXI_RX_TDATA[26]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[27] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I12),
        .Q(M_AXI_RX_TDATA[27]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[28] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I13),
        .Q(M_AXI_RX_TDATA[28]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[29] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I14),
        .Q(M_AXI_RX_TDATA[29]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[13]),
        .Q(M_AXI_RX_TDATA[2]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[30] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I15),
        .Q(M_AXI_RX_TDATA[30]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[31] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I16),
        .Q(M_AXI_RX_TDATA[31]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[32] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I17),
        .Q(M_AXI_RX_TDATA[32]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[33] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I18),
        .Q(M_AXI_RX_TDATA[33]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[34] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I19),
        .Q(M_AXI_RX_TDATA[34]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[35] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I20),
        .Q(M_AXI_RX_TDATA[35]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[36] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I21),
        .Q(M_AXI_RX_TDATA[36]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[37] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I22),
        .Q(M_AXI_RX_TDATA[37]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[38] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I23),
        .Q(M_AXI_RX_TDATA[38]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[39] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24),
        .Q(M_AXI_RX_TDATA[39]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[12]),
        .Q(M_AXI_RX_TDATA[3]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[40] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25),
        .Q(M_AXI_RX_TDATA[40]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[41] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I26),
        .Q(M_AXI_RX_TDATA[41]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[42] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I27),
        .Q(M_AXI_RX_TDATA[42]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[43] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I28),
        .Q(M_AXI_RX_TDATA[43]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[44] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I29),
        .Q(M_AXI_RX_TDATA[44]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[45] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I30),
        .Q(M_AXI_RX_TDATA[45]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[46] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I31),
        .Q(M_AXI_RX_TDATA[46]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[47] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I32),
        .Q(M_AXI_RX_TDATA[47]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[48] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I33),
        .Q(M_AXI_RX_TDATA[48]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[49] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I34),
        .Q(M_AXI_RX_TDATA[49]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[11]),
        .Q(M_AXI_RX_TDATA[4]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[50] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I35),
        .Q(M_AXI_RX_TDATA[50]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[51] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I36),
        .Q(M_AXI_RX_TDATA[51]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[52] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I37),
        .Q(M_AXI_RX_TDATA[52]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[53] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I38),
        .Q(M_AXI_RX_TDATA[53]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[54] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I39),
        .Q(M_AXI_RX_TDATA[54]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[55] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I40),
        .Q(M_AXI_RX_TDATA[55]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[56] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I41),
        .Q(M_AXI_RX_TDATA[56]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[57] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I42),
        .Q(M_AXI_RX_TDATA[57]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[58] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I43),
        .Q(M_AXI_RX_TDATA[58]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[59] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I44),
        .Q(M_AXI_RX_TDATA[59]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[10]),
        .Q(M_AXI_RX_TDATA[5]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[60] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I45),
        .Q(M_AXI_RX_TDATA[60]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[61] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I46),
        .Q(M_AXI_RX_TDATA[61]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[62] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I47),
        .Q(M_AXI_RX_TDATA[62]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[63] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I48),
        .Q(M_AXI_RX_TDATA[63]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[9]),
        .Q(M_AXI_RX_TDATA[6]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[8]),
        .Q(M_AXI_RX_TDATA[7]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[8] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[7]),
        .Q(M_AXI_RX_TDATA[8]),
        .R(\<const0> ));
FDRE \OUTPUT_DATA_Buffer_reg[9] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[6]),
        .Q(M_AXI_RX_TDATA[9]),
        .R(\<const0> ));
VCC VCC
       (.P(\<const1> ));
endmodule

module data_mgtdata_mgt_OUTPUT_SWITCH_CONTROL
   (OUTPUT_SELECT_Buffer,
    D,
    user_clk,
    overwrite_c,
    I1,
    I2,
    STORAGE_COUNT);
  output [4:0]OUTPUT_SELECT_Buffer;
  input [0:0]D;
  input user_clk;
  input overwrite_c;
  input I1;
  input I2;
  input [0:0]STORAGE_COUNT;

  wire \<const0> ;
  wire \<const1> ;
  wire [0:0]D;
  wire I1;
  wire I2;
  wire [4:0]OUTPUT_SELECT_Buffer;
  wire [0:0]STORAGE_COUNT;
  wire overwrite_c;
  wire user_clk;

GND GND
       (.G(\<const0> ));
FDRE \OUTPUT_SELECT_Buffer_reg[13] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I1),
        .Q(OUTPUT_SELECT_Buffer[3]),
        .R(overwrite_c));
FDRE \OUTPUT_SELECT_Buffer_reg[14] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I2),
        .Q(OUTPUT_SELECT_Buffer[2]),
        .R(overwrite_c));
FDRE \OUTPUT_SELECT_Buffer_reg[18] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D),
        .Q(OUTPUT_SELECT_Buffer[1]),
        .R(\<const0> ));
FDRE \OUTPUT_SELECT_Buffer_reg[19] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(STORAGE_COUNT),
        .Q(OUTPUT_SELECT_Buffer[0]),
        .R(overwrite_c));
FDRE \OUTPUT_SELECT_Buffer_reg[9] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I1),
        .Q(OUTPUT_SELECT_Buffer[4]),
        .R(overwrite_c));
VCC VCC
       (.P(\<const1> ));
endmodule

module data_mgtdata_mgt_RESET_LOGIC
   (SS,
    SR,
    sys_reset_out,
    user_clk,
    LINK_RESET_OUT,
    init_clk_in,
    TX_RESETDONE_OUT,
    RESET_CHANNEL,
    RESET,
    EN_CHAN_SYNC,
    RX_RESETDONE_OUT);
  output [0:0]SS;
  output [0:0]SR;
  output sys_reset_out;
  input user_clk;
  input LINK_RESET_OUT;
  input init_clk_in;
  input TX_RESETDONE_OUT;
  input RESET_CHANNEL;
  input RESET;
  input EN_CHAN_SYNC;
  input RX_RESETDONE_OUT;

  wire \<const0> ;
  wire \<const1> ;
  wire EN_CHAN_SYNC;
  wire LINK_RESET_OUT;
  wire RESET;
  wire RESET_CHANNEL;
  wire RX_RESETDONE_OUT;
  wire [0:0]SR;
  wire [0:0]SS;
  wire TX_RESETDONE_OUT;
  wire gt_rxresetdone_r;
  wire gt_rxresetdone_r2;
  wire gt_rxresetdone_r3;
  wire gt_txresetdone_r;
  wire gt_txresetdone_r2;
  wire gt_txresetdone_r3;
  wire init_clk_in;
  wire link_reset_comb_r;
  wire n_0_gt_rxresetdone_r2_i_1;
  wire n_0_gt_txresetdone_r2_i_1;
  wire s_level_out_d3;
  wire sys_reset_out;
  wire user_clk;

GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
LUT1 #(
    .INIT(2'h1)) 
     gt_rxresetdone_r2_i_1
       (.I0(RX_RESETDONE_OUT),
        .O(n_0_gt_rxresetdone_r2_i_1));
FDCE gt_rxresetdone_r2_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .CLR(n_0_gt_rxresetdone_r2_i_1),
        .D(gt_rxresetdone_r),
        .Q(gt_rxresetdone_r2));
FDRE gt_rxresetdone_r3_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(gt_rxresetdone_r2),
        .Q(gt_rxresetdone_r3),
        .R(\<const0> ));
FDCE gt_rxresetdone_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .CLR(n_0_gt_rxresetdone_r2_i_1),
        .D(\<const1> ),
        .Q(gt_rxresetdone_r));
LUT1 #(
    .INIT(2'h1)) 
     gt_txresetdone_r2_i_1
       (.I0(s_level_out_d3),
        .O(n_0_gt_txresetdone_r2_i_1));
FDCE gt_txresetdone_r2_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .CLR(n_0_gt_txresetdone_r2_i_1),
        .D(gt_txresetdone_r),
        .Q(gt_txresetdone_r2));
FDRE gt_txresetdone_r3_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(gt_txresetdone_r2),
        .Q(gt_txresetdone_r3),
        .R(\<const0> ));
FDCE gt_txresetdone_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .CLR(n_0_gt_txresetdone_r2_i_1),
        .D(\<const1> ),
        .Q(gt_txresetdone_r));
data_mgtdata_mgt_cdc_sync__parameterized0_2 link_reset_cdc_sync
       (.EN_CHAN_SYNC(EN_CHAN_SYNC),
        .RESET(RESET),
        .RESET_CHANNEL(RESET_CHANNEL),
        .SR(SR),
        .SS(SS),
        .gt_rxresetdone_r3(gt_rxresetdone_r3),
        .gt_txresetdone_r3(gt_txresetdone_r3),
        .link_reset_comb_r(link_reset_comb_r),
        .sys_reset_out(sys_reset_out),
        .user_clk(user_clk));
FDRE link_reset_comb_r_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(LINK_RESET_OUT),
        .Q(link_reset_comb_r),
        .R(\<const0> ));
data_mgtdata_mgt_cdc_sync__parameterized0_1 tx_resetdone_cdc_sync
       (.TX_RESETDONE_OUT(TX_RESETDONE_OUT),
        .s_level_out_d3(s_level_out_d3),
        .user_clk(user_clk));
endmodule

module data_mgtdata_mgt_RX_LL
   (CI,
    O1,
    O2,
    O,
    FRAME_ERR,
    M_AXI_RX_TKEEP,
    M_AXI_RX_TDATA,
    M_AXI_RX_TVALID,
    M_AXI_RX_TLAST,
    I1,
    D,
    I2,
    I3,
    I4,
    S,
    S1_in,
    S4_in,
    S7_in,
    RESET,
    user_clk,
    I5,
    Q,
    I6,
    I7,
    I8,
    I9,
    I10,
    I11,
    I12,
    START_RX,
    I13,
    I14);
  output CI;
  output O1;
  output O2;
  output O;
  output FRAME_ERR;
  output [6:0]M_AXI_RX_TKEEP;
  output [0:63]M_AXI_RX_TDATA;
  output M_AXI_RX_TVALID;
  output M_AXI_RX_TLAST;
  input I1;
  input [3:0]D;
  input I2;
  input I3;
  input I4;
  input S;
  input S1_in;
  input S4_in;
  input S7_in;
  input RESET;
  input user_clk;
  input I5;
  input [7:0]Q;
  input [7:0]I6;
  input [7:0]I7;
  input [7:0]I8;
  input [7:0]I9;
  input [7:0]I10;
  input [7:0]I11;
  input [7:0]I12;
  input START_RX;
  input [3:0]I13;
  input [3:0]I14;

  wire CI;
  wire [3:0]D;
  wire FRAME_ERR;
  wire I1;
  wire [7:0]I10;
  wire [7:0]I11;
  wire [7:0]I12;
  wire [3:0]I13;
  wire [3:0]I14;
  wire I2;
  wire I3;
  wire I4;
  wire I5;
  wire [7:0]I6;
  wire [7:0]I7;
  wire [7:0]I8;
  wire [7:0]I9;
  wire [0:63]M_AXI_RX_TDATA;
  wire [6:0]M_AXI_RX_TKEEP;
  wire M_AXI_RX_TLAST;
  wire M_AXI_RX_TVALID;
  wire O;
  wire O1;
  wire O2;
  wire [7:0]Q;
  wire RESET;
  wire S;
  wire S1_in;
  wire S4_in;
  wire S7_in;
  wire START_RX;
  wire user_clk;

data_mgtdata_mgt_RX_LL_PDU_DATAPATH rx_ll_pdu_datapath_i
       (.CI(CI),
        .D(D),
        .FRAME_ERR(FRAME_ERR),
        .I1(I1),
        .I10(I10),
        .I11(I11),
        .I12(I12),
        .I13(I13),
        .I14(I14),
        .I2(I2),
        .I3(I3),
        .I4(I4),
        .I5(I5),
        .I6(I6),
        .I7(I7),
        .I8(I8),
        .I9(I9),
        .M_AXI_RX_TDATA(M_AXI_RX_TDATA),
        .M_AXI_RX_TKEEP(M_AXI_RX_TKEEP),
        .M_AXI_RX_TLAST(M_AXI_RX_TLAST),
        .M_AXI_RX_TVALID(M_AXI_RX_TVALID),
        .O(O),
        .O1(O1),
        .O2(O2),
        .Q(Q),
        .RESET(RESET),
        .S(S),
        .S1_in(S1_in),
        .S4_in(S4_in),
        .S7_in(S7_in),
        .START_RX(START_RX),
        .user_clk(user_clk));
endmodule

module data_mgtdata_mgt_RX_LL_DEFRAMER
   (CI,
    O1,
    O2,
    O,
    O3,
    O4,
    O5,
    O6,
    O7,
    O8,
    I1,
    D,
    I2,
    I3,
    I4,
    S,
    S1_in,
    S4_in,
    S7_in,
    RESET,
    user_clk,
    Q,
    I5,
    START_RX,
    I13);
  output CI;
  output O1;
  output O2;
  output O;
  output [2:0]O3;
  output [4:0]O4;
  output O5;
  output O6;
  output O7;
  output O8;
  input I1;
  input [3:0]D;
  input I2;
  input I3;
  input I4;
  input S;
  input S1_in;
  input S4_in;
  input S7_in;
  input RESET;
  input user_clk;
  input [3:0]Q;
  input [3:0]I5;
  input START_RX;
  input [3:0]I13;

  wire \<const0> ;
  wire \<const1> ;
  wire [0:3]AFTER_SCP;
  wire CI;
  wire [3:0]D;
  wire I1;
  wire [3:0]I13;
  wire I2;
  wire I3;
  wire I4;
  wire [3:0]I5;
  wire [0:3]IN_FRAME;
  wire O;
  wire O1;
  wire O2;
  wire [2:0]O3;
  wire [4:0]O4;
  wire O5;
  wire O6;
  wire O7;
  wire O8;
  wire [0:3]PREVIOUS_STAGE_VALID;
  wire [3:0]Q;
  wire RESET;
  wire S;
  wire S1_in;
  wire S4_in;
  wire S7_in;
  wire START_RX;
  wire [0:3]after_scp_c;
  wire in_frame_r;
  wire lopt;
  wire lopt_1;
  wire n_0_stage_2_end_after_start_r_i_2;
  wire n_0_stage_2_end_before_start_r_i_2;
  wire n_0_stage_2_frame_err_r_i_2;
  wire n_0_stage_2_frame_err_r_i_3;
  wire n_0_stage_2_start_with_data_r_i_2;
  wire user_clk;
  wire [3:0]NLW_data_after_start_muxcy_0_CARRY4_O_UNCONNECTED;
  wire [3:0]NLW_in_frame_muxcy_0_CARRY4_O_UNCONNECTED;

FDRE \AFTER_SCP_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(after_scp_c[0]),
        .Q(AFTER_SCP[0]),
        .R(RESET));
FDRE \AFTER_SCP_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(after_scp_c[1]),
        .Q(AFTER_SCP[1]),
        .R(RESET));
FDRE \AFTER_SCP_Buffer_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(after_scp_c[2]),
        .Q(AFTER_SCP[2]),
        .R(RESET));
FDRE \AFTER_SCP_Buffer_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(after_scp_c[3]),
        .Q(AFTER_SCP[3]),
        .R(RESET));
(* SOFT_HLUTNM = "soft_lutpair16" *) 
   LUT4 #(
    .INIT(16'h8000)) 
     \COUNT_Buffer[0]_i_1 
       (.I0(PREVIOUS_STAGE_VALID[2]),
        .I1(PREVIOUS_STAGE_VALID[3]),
        .I2(PREVIOUS_STAGE_VALID[0]),
        .I3(PREVIOUS_STAGE_VALID[1]),
        .O(O3[2]));
(* SOFT_HLUTNM = "soft_lutpair16" *) 
   LUT4 #(
    .INIT(16'h7EE8)) 
     \COUNT_Buffer[1]_i_1 
       (.I0(PREVIOUS_STAGE_VALID[0]),
        .I1(PREVIOUS_STAGE_VALID[1]),
        .I2(PREVIOUS_STAGE_VALID[2]),
        .I3(PREVIOUS_STAGE_VALID[3]),
        .O(O3[1]));
(* SOFT_HLUTNM = "soft_lutpair19" *) 
   LUT4 #(
    .INIT(16'h6996)) 
     \COUNT_Buffer[2]_i_1 
       (.I0(PREVIOUS_STAGE_VALID[0]),
        .I1(PREVIOUS_STAGE_VALID[2]),
        .I2(PREVIOUS_STAGE_VALID[1]),
        .I3(PREVIOUS_STAGE_VALID[3]),
        .O(O3[0]));
FDRE \DEFRAMED_DATA_V_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I13[3]),
        .Q(PREVIOUS_STAGE_VALID[0]),
        .R(RESET));
FDRE \DEFRAMED_DATA_V_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I13[2]),
        .Q(PREVIOUS_STAGE_VALID[1]),
        .R(RESET));
FDRE \DEFRAMED_DATA_V_Buffer_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I13[1]),
        .Q(PREVIOUS_STAGE_VALID[2]),
        .R(RESET));
FDRE \DEFRAMED_DATA_V_Buffer_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I13[0]),
        .Q(PREVIOUS_STAGE_VALID[3]),
        .R(RESET));
GND GND
       (.G(\<const0> ));
FDRE \IN_FRAME_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(in_frame_r),
        .Q(IN_FRAME[0]),
        .R(RESET));
FDRE \IN_FRAME_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(CI),
        .Q(IN_FRAME[1]),
        .R(RESET));
FDRE \IN_FRAME_Buffer_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(O1),
        .Q(IN_FRAME[2]),
        .R(RESET));
FDRE \IN_FRAME_Buffer_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(O2),
        .Q(IN_FRAME[3]),
        .R(RESET));
(* SOFT_HLUTNM = "soft_lutpair18" *) 
   LUT4 #(
    .INIT(16'h1110)) 
     \MUX_SELECT_Buffer[1]_i_1 
       (.I0(PREVIOUS_STAGE_VALID[0]),
        .I1(PREVIOUS_STAGE_VALID[1]),
        .I2(PREVIOUS_STAGE_VALID[2]),
        .I3(PREVIOUS_STAGE_VALID[3]),
        .O(O4[4]));
LUT4 #(
    .INIT(16'h4544)) 
     \MUX_SELECT_Buffer[2]_i_1 
       (.I0(PREVIOUS_STAGE_VALID[0]),
        .I1(PREVIOUS_STAGE_VALID[1]),
        .I2(PREVIOUS_STAGE_VALID[2]),
        .I3(PREVIOUS_STAGE_VALID[3]),
        .O(O4[3]));
(* SOFT_HLUTNM = "soft_lutpair19" *) 
   LUT4 #(
    .INIT(16'h1600)) 
     \MUX_SELECT_Buffer[4]_i_1 
       (.I0(PREVIOUS_STAGE_VALID[0]),
        .I1(PREVIOUS_STAGE_VALID[1]),
        .I2(PREVIOUS_STAGE_VALID[2]),
        .I3(PREVIOUS_STAGE_VALID[3]),
        .O(O4[2]));
(* SOFT_HLUTNM = "soft_lutpair17" *) 
   LUT3 #(
    .INIT(8'h60)) 
     \MUX_SELECT_Buffer[5]_i_1 
       (.I0(PREVIOUS_STAGE_VALID[0]),
        .I1(PREVIOUS_STAGE_VALID[1]),
        .I2(PREVIOUS_STAGE_VALID[2]),
        .O(O4[1]));
(* SOFT_HLUTNM = "soft_lutpair18" *) 
   LUT4 #(
    .INIT(16'h6800)) 
     \MUX_SELECT_Buffer[8]_i_1 
       (.I0(PREVIOUS_STAGE_VALID[0]),
        .I1(PREVIOUS_STAGE_VALID[1]),
        .I2(PREVIOUS_STAGE_VALID[2]),
        .I3(PREVIOUS_STAGE_VALID[3]),
        .O(O4[0]));
VCC VCC
       (.P(\<const1> ));
(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   CARRY4 data_after_start_muxcy_0_CARRY4
       (.CI(lopt_1),
        .CO({after_scp_c[3],after_scp_c[2],after_scp_c[1],after_scp_c[0]}),
        .CYINIT(\<const0> ),
        .DI({\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .O(NLW_data_after_start_muxcy_0_CARRY4_O_UNCONNECTED[3:0]),
        .S({S7_in,S4_in,S1_in,S}));
GND data_after_start_muxcy_0_CARRY4_GND
       (.G(lopt_1));
(* BOX_TYPE = "PRIMITIVE" *) 
   (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   CARRY4 in_frame_muxcy_0_CARRY4
       (.CI(lopt),
        .CO({O,O2,O1,CI}),
        .CYINIT(in_frame_r),
        .DI({D[0],D[1],D[2],D[3]}),
        .O(NLW_in_frame_muxcy_0_CARRY4_O_UNCONNECTED[3:0]),
        .S({I4,I3,I2,I1}));
GND in_frame_muxcy_0_CARRY4_GND
       (.G(lopt));
FDRE in_frame_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(O),
        .Q(in_frame_r),
        .R(RESET));
LUT5 #(
    .INIT(32'hFFFFF888)) 
     stage_2_end_after_start_r_i_1
       (.I0(Q[0]),
        .I1(AFTER_SCP[3]),
        .I2(Q[2]),
        .I3(AFTER_SCP[1]),
        .I4(n_0_stage_2_end_after_start_r_i_2),
        .O(O7));
LUT4 #(
    .INIT(16'hF888)) 
     stage_2_end_after_start_r_i_2
       (.I0(AFTER_SCP[0]),
        .I1(Q[3]),
        .I2(AFTER_SCP[2]),
        .I3(Q[1]),
        .O(n_0_stage_2_end_after_start_r_i_2));
LUT5 #(
    .INIT(32'hFFFF22F2)) 
     stage_2_end_before_start_r_i_1
       (.I0(Q[0]),
        .I1(AFTER_SCP[3]),
        .I2(Q[3]),
        .I3(AFTER_SCP[0]),
        .I4(n_0_stage_2_end_before_start_r_i_2),
        .O(O6));
LUT4 #(
    .INIT(16'h4F44)) 
     stage_2_end_before_start_r_i_2
       (.I0(AFTER_SCP[1]),
        .I1(Q[2]),
        .I2(AFTER_SCP[2]),
        .I3(Q[1]),
        .O(n_0_stage_2_end_before_start_r_i_2));
LUT3 #(
    .INIT(8'hD0)) 
     stage_2_frame_err_r_i_1
       (.I0(n_0_stage_2_frame_err_r_i_2),
        .I1(n_0_stage_2_frame_err_r_i_3),
        .I2(START_RX),
        .O(O8));
LUT6 #(
    .INIT(64'h0000001D1D1D001D)) 
     stage_2_frame_err_r_i_2
       (.I0(Q[3]),
        .I1(IN_FRAME[0]),
        .I2(I5[3]),
        .I3(Q[2]),
        .I4(IN_FRAME[1]),
        .I5(I5[2]),
        .O(n_0_stage_2_frame_err_r_i_2));
LUT6 #(
    .INIT(64'hFFFFFFE2E2E2FFE2)) 
     stage_2_frame_err_r_i_3
       (.I0(Q[1]),
        .I1(IN_FRAME[2]),
        .I2(I5[1]),
        .I3(Q[0]),
        .I4(IN_FRAME[3]),
        .I5(I5[0]),
        .O(n_0_stage_2_frame_err_r_i_3));
LUT5 #(
    .INIT(32'hFFFFF888)) 
     stage_2_start_with_data_r_i_1
       (.I0(AFTER_SCP[3]),
        .I1(PREVIOUS_STAGE_VALID[3]),
        .I2(AFTER_SCP[0]),
        .I3(PREVIOUS_STAGE_VALID[0]),
        .I4(n_0_stage_2_start_with_data_r_i_2),
        .O(O5));
(* SOFT_HLUTNM = "soft_lutpair17" *) 
   LUT4 #(
    .INIT(16'hF888)) 
     stage_2_start_with_data_r_i_2
       (.I0(PREVIOUS_STAGE_VALID[1]),
        .I1(AFTER_SCP[1]),
        .I2(PREVIOUS_STAGE_VALID[2]),
        .I3(AFTER_SCP[2]),
        .O(n_0_stage_2_start_with_data_r_i_2));
endmodule

module data_mgtdata_mgt_RX_LL_PDU_DATAPATH
   (CI,
    O1,
    O2,
    O,
    FRAME_ERR,
    M_AXI_RX_TKEEP,
    M_AXI_RX_TDATA,
    M_AXI_RX_TVALID,
    M_AXI_RX_TLAST,
    I1,
    D,
    I2,
    I3,
    I4,
    S,
    S1_in,
    S4_in,
    S7_in,
    RESET,
    user_clk,
    I5,
    Q,
    I6,
    I7,
    I8,
    I9,
    I10,
    I11,
    I12,
    START_RX,
    I13,
    I14);
  output CI;
  output O1;
  output O2;
  output O;
  output FRAME_ERR;
  output [6:0]M_AXI_RX_TKEEP;
  output [0:63]M_AXI_RX_TDATA;
  output M_AXI_RX_TVALID;
  output M_AXI_RX_TLAST;
  input I1;
  input [3:0]D;
  input I2;
  input I3;
  input I4;
  input S;
  input S1_in;
  input S4_in;
  input S7_in;
  input RESET;
  input user_clk;
  input I5;
  input [7:0]Q;
  input [7:0]I6;
  input [7:0]I7;
  input [7:0]I8;
  input [7:0]I9;
  input [7:0]I10;
  input [7:0]I11;
  input [7:0]I12;
  input START_RX;
  input [3:0]I13;
  input [3:0]I14;

  wire \<const0> ;
  wire \<const1> ;
  wire CI;
  wire [3:0]D;
  wire END_STORAGE;
  wire EOF_N;
  wire FRAME_ERR;
  wire FRAME_ERR_RESULT;
  wire FRAME_ERR_RESULT_Buffer0;
  wire I1;
  wire [7:0]I10;
  wire [7:0]I11;
  wire [7:0]I12;
  wire [3:0]I13;
  wire [3:0]I14;
  wire I2;
  wire I3;
  wire I4;
  wire I5;
  wire [7:0]I6;
  wire [7:0]I7;
  wire [7:0]I8;
  wire [7:0]I9;
  wire [0:2]LEFT_ALIGNED_COUNT;
  wire [0:63]M_AXI_RX_TDATA;
  wire [6:0]M_AXI_RX_TKEEP;
  wire M_AXI_RX_TLAST;
  wire M_AXI_RX_TVALID;
  wire O;
  wire O1;
  wire O2;
  wire [10:0]OUTPUT_SELECT_Buffer;
  wire [7:0]Q;
  wire RESET;
  wire RX_EOF_N;
  wire [1:2]RX_REM;
  wire RX_SRC_RDY_N;
  wire S;
  wire S1_in;
  wire S4_in;
  wire S7_in;
  wire SRC_RDY_N;
  wire START_RX;
  wire [0:2]STORAGE_COUNT;
  wire [16:63]STORAGE_DATA;
  wire [3:19]STORAGE_SELECT_Buffer;
  wire [0:2]ce_command_c;
  wire [15:0]data0;
  wire [15:0]data2;
  wire [0:63]muxed_data_c;
  wire \n_0_stage_1_data_r_reg[0]_srl3 ;
  wire \n_0_stage_1_data_r_reg[10]_srl3 ;
  wire \n_0_stage_1_data_r_reg[11]_srl3 ;
  wire \n_0_stage_1_data_r_reg[12]_srl3 ;
  wire \n_0_stage_1_data_r_reg[13]_srl3 ;
  wire \n_0_stage_1_data_r_reg[14]_srl3 ;
  wire \n_0_stage_1_data_r_reg[15]_srl3 ;
  wire \n_0_stage_1_data_r_reg[16]_srl3 ;
  wire \n_0_stage_1_data_r_reg[17]_srl3 ;
  wire \n_0_stage_1_data_r_reg[18]_srl3 ;
  wire \n_0_stage_1_data_r_reg[19]_srl3 ;
  wire \n_0_stage_1_data_r_reg[1]_srl3 ;
  wire \n_0_stage_1_data_r_reg[20]_srl3 ;
  wire \n_0_stage_1_data_r_reg[21]_srl3 ;
  wire \n_0_stage_1_data_r_reg[22]_srl3 ;
  wire \n_0_stage_1_data_r_reg[23]_srl3 ;
  wire \n_0_stage_1_data_r_reg[24]_srl3 ;
  wire \n_0_stage_1_data_r_reg[25]_srl3 ;
  wire \n_0_stage_1_data_r_reg[26]_srl3 ;
  wire \n_0_stage_1_data_r_reg[27]_srl3 ;
  wire \n_0_stage_1_data_r_reg[28]_srl3 ;
  wire \n_0_stage_1_data_r_reg[29]_srl3 ;
  wire \n_0_stage_1_data_r_reg[2]_srl3 ;
  wire \n_0_stage_1_data_r_reg[30]_srl3 ;
  wire \n_0_stage_1_data_r_reg[31]_srl3 ;
  wire \n_0_stage_1_data_r_reg[32]_srl3 ;
  wire \n_0_stage_1_data_r_reg[33]_srl3 ;
  wire \n_0_stage_1_data_r_reg[34]_srl3 ;
  wire \n_0_stage_1_data_r_reg[35]_srl3 ;
  wire \n_0_stage_1_data_r_reg[36]_srl3 ;
  wire \n_0_stage_1_data_r_reg[37]_srl3 ;
  wire \n_0_stage_1_data_r_reg[38]_srl3 ;
  wire \n_0_stage_1_data_r_reg[39]_srl3 ;
  wire \n_0_stage_1_data_r_reg[3]_srl3 ;
  wire \n_0_stage_1_data_r_reg[40]_srl3 ;
  wire \n_0_stage_1_data_r_reg[41]_srl3 ;
  wire \n_0_stage_1_data_r_reg[42]_srl3 ;
  wire \n_0_stage_1_data_r_reg[43]_srl3 ;
  wire \n_0_stage_1_data_r_reg[44]_srl3 ;
  wire \n_0_stage_1_data_r_reg[45]_srl3 ;
  wire \n_0_stage_1_data_r_reg[46]_srl3 ;
  wire \n_0_stage_1_data_r_reg[47]_srl3 ;
  wire \n_0_stage_1_data_r_reg[48]_srl3 ;
  wire \n_0_stage_1_data_r_reg[49]_srl3 ;
  wire \n_0_stage_1_data_r_reg[4]_srl3 ;
  wire \n_0_stage_1_data_r_reg[50]_srl3 ;
  wire \n_0_stage_1_data_r_reg[51]_srl3 ;
  wire \n_0_stage_1_data_r_reg[52]_srl3 ;
  wire \n_0_stage_1_data_r_reg[53]_srl3 ;
  wire \n_0_stage_1_data_r_reg[54]_srl3 ;
  wire \n_0_stage_1_data_r_reg[55]_srl3 ;
  wire \n_0_stage_1_data_r_reg[56]_srl3 ;
  wire \n_0_stage_1_data_r_reg[57]_srl3 ;
  wire \n_0_stage_1_data_r_reg[58]_srl3 ;
  wire \n_0_stage_1_data_r_reg[59]_srl3 ;
  wire \n_0_stage_1_data_r_reg[5]_srl3 ;
  wire \n_0_stage_1_data_r_reg[60]_srl3 ;
  wire \n_0_stage_1_data_r_reg[61]_srl3 ;
  wire \n_0_stage_1_data_r_reg[62]_srl3 ;
  wire \n_0_stage_1_data_r_reg[63]_srl3 ;
  wire \n_0_stage_1_data_r_reg[6]_srl3 ;
  wire \n_0_stage_1_data_r_reg[7]_srl3 ;
  wire \n_0_stage_1_data_r_reg[8]_srl3 ;
  wire \n_0_stage_1_data_r_reg[9]_srl3 ;
  wire n_0_stage_2_frame_err_r_reg;
  wire n_0_stage_2_valid_data_counter_i;
  wire n_0_stage_3_left_align_datapath_mux_i;
  wire n_0_stage_3_storage_ce_control_i;
  wire n_100_stage_3_left_align_datapath_mux_i;
  wire n_101_stage_3_left_align_datapath_mux_i;
  wire n_102_stage_3_left_align_datapath_mux_i;
  wire n_103_stage_3_left_align_datapath_mux_i;
  wire n_104_stage_3_left_align_datapath_mux_i;
  wire n_105_stage_3_left_align_datapath_mux_i;
  wire n_106_stage_3_left_align_datapath_mux_i;
  wire n_107_stage_3_left_align_datapath_mux_i;
  wire n_108_stage_3_left_align_datapath_mux_i;
  wire n_109_stage_3_left_align_datapath_mux_i;
  wire n_10_sideband_output_i;
  wire n_10_stage_1_rx_ll_deframer_i;
  wire n_10_stage_3_left_align_datapath_mux_i;
  wire n_10_stage_3_storage_count_control_i;
  wire n_110_stage_3_left_align_datapath_mux_i;
  wire n_111_stage_3_left_align_datapath_mux_i;
  wire n_11_stage_1_rx_ll_deframer_i;
  wire n_11_stage_3_left_align_datapath_mux_i;
  wire n_11_stage_3_storage_count_control_i;
  wire n_12_stage_1_rx_ll_deframer_i;
  wire n_12_stage_3_left_align_datapath_mux_i;
  wire n_12_stage_3_storage_count_control_i;
  wire n_13_stage_1_rx_ll_deframer_i;
  wire n_13_stage_3_left_align_datapath_mux_i;
  wire n_13_stage_3_storage_count_control_i;
  wire n_14_stage_1_rx_ll_deframer_i;
  wire n_14_stage_3_left_align_datapath_mux_i;
  wire n_14_stage_3_storage_count_control_i;
  wire n_15_stage_1_rx_ll_deframer_i;
  wire n_15_stage_3_left_align_datapath_mux_i;
  wire n_16_stage_2_left_align_control_i;
  wire n_16_stage_3_left_align_datapath_mux_i;
  wire n_17_stage_2_left_align_control_i;
  wire n_17_stage_3_left_align_datapath_mux_i;
  wire n_18_stage_2_left_align_control_i;
  wire n_18_stage_3_left_align_datapath_mux_i;
  wire n_19_stage_3_left_align_datapath_mux_i;
  wire n_1_stage_2_valid_data_counter_i;
  wire n_1_stage_3_left_align_datapath_mux_i;
  wire n_1_stage_3_storage_ce_control_i;
  wire n_20_stage_3_left_align_datapath_mux_i;
  wire n_21_stage_3_left_align_datapath_mux_i;
  wire n_22_stage_3_left_align_datapath_mux_i;
  wire n_23_stage_3_left_align_datapath_mux_i;
  wire n_24_stage_3_left_align_datapath_mux_i;
  wire n_25_stage_3_left_align_datapath_mux_i;
  wire n_26_stage_3_left_align_datapath_mux_i;
  wire n_27_stage_3_left_align_datapath_mux_i;
  wire n_28_stage_3_left_align_datapath_mux_i;
  wire n_29_stage_3_left_align_datapath_mux_i;
  wire n_2_stage_3_left_align_datapath_mux_i;
  wire n_30_stage_3_left_align_datapath_mux_i;
  wire n_31_stage_3_left_align_datapath_mux_i;
  wire n_32_stage_3_left_align_datapath_mux_i;
  wire n_33_stage_3_left_align_datapath_mux_i;
  wire n_34_stage_3_left_align_datapath_mux_i;
  wire n_35_stage_3_left_align_datapath_mux_i;
  wire n_36_stage_3_left_align_datapath_mux_i;
  wire n_37_stage_3_left_align_datapath_mux_i;
  wire n_38_stage_3_left_align_datapath_mux_i;
  wire n_39_stage_3_left_align_datapath_mux_i;
  wire n_3_stage_3_left_align_datapath_mux_i;
  wire n_3_stage_3_storage_ce_control_i;
  wire n_40_stage_3_left_align_datapath_mux_i;
  wire n_41_stage_3_left_align_datapath_mux_i;
  wire n_42_stage_3_left_align_datapath_mux_i;
  wire n_43_stage_3_left_align_datapath_mux_i;
  wire n_44_stage_3_left_align_datapath_mux_i;
  wire n_45_stage_3_left_align_datapath_mux_i;
  wire n_46_stage_3_left_align_datapath_mux_i;
  wire n_47_stage_3_left_align_datapath_mux_i;
  wire n_48_stage_3_left_align_datapath_mux_i;
  wire n_49_stage_3_left_align_datapath_mux_i;
  wire n_4_stage_1_rx_ll_deframer_i;
  wire n_4_stage_3_left_align_datapath_mux_i;
  wire n_50_stage_3_left_align_datapath_mux_i;
  wire n_51_stage_3_left_align_datapath_mux_i;
  wire n_52_stage_3_left_align_datapath_mux_i;
  wire n_53_stage_3_left_align_datapath_mux_i;
  wire n_54_stage_3_left_align_datapath_mux_i;
  wire n_55_stage_3_left_align_datapath_mux_i;
  wire n_56_stage_3_left_align_datapath_mux_i;
  wire n_57_stage_3_left_align_datapath_mux_i;
  wire n_58_stage_3_left_align_datapath_mux_i;
  wire n_59_stage_3_left_align_datapath_mux_i;
  wire n_5_stage_1_rx_ll_deframer_i;
  wire n_5_stage_3_left_align_datapath_mux_i;
  wire n_60_stage_3_left_align_datapath_mux_i;
  wire n_61_stage_3_left_align_datapath_mux_i;
  wire n_62_stage_3_left_align_datapath_mux_i;
  wire n_63_stage_3_left_align_datapath_mux_i;
  wire n_64_stage_3_left_align_datapath_mux_i;
  wire n_65_stage_3_left_align_datapath_mux_i;
  wire n_66_stage_3_left_align_datapath_mux_i;
  wire n_67_stage_3_left_align_datapath_mux_i;
  wire n_68_stage_3_left_align_datapath_mux_i;
  wire n_69_stage_3_left_align_datapath_mux_i;
  wire n_6_sideband_output_i;
  wire n_6_stage_1_rx_ll_deframer_i;
  wire n_6_stage_3_left_align_datapath_mux_i;
  wire n_6_stage_3_storage_count_control_i;
  wire n_70_stage_3_left_align_datapath_mux_i;
  wire n_71_stage_3_left_align_datapath_mux_i;
  wire n_72_stage_3_left_align_datapath_mux_i;
  wire n_73_stage_3_left_align_datapath_mux_i;
  wire n_74_stage_3_left_align_datapath_mux_i;
  wire n_75_stage_3_left_align_datapath_mux_i;
  wire n_76_stage_3_left_align_datapath_mux_i;
  wire n_77_stage_3_left_align_datapath_mux_i;
  wire n_78_stage_3_left_align_datapath_mux_i;
  wire n_79_stage_3_left_align_datapath_mux_i;
  wire n_7_sideband_output_i;
  wire n_7_stage_1_rx_ll_deframer_i;
  wire n_7_stage_2_valid_data_counter_i;
  wire n_7_stage_3_left_align_datapath_mux_i;
  wire n_7_stage_3_storage_count_control_i;
  wire n_80_stage_3_left_align_datapath_mux_i;
  wire n_81_stage_3_left_align_datapath_mux_i;
  wire n_82_stage_3_left_align_datapath_mux_i;
  wire n_83_stage_3_left_align_datapath_mux_i;
  wire n_84_stage_3_left_align_datapath_mux_i;
  wire n_85_stage_3_left_align_datapath_mux_i;
  wire n_86_stage_3_left_align_datapath_mux_i;
  wire n_87_stage_3_left_align_datapath_mux_i;
  wire n_88_stage_3_left_align_datapath_mux_i;
  wire n_89_stage_3_left_align_datapath_mux_i;
  wire n_8_sideband_output_i;
  wire n_8_stage_1_rx_ll_deframer_i;
  wire n_8_stage_2_valid_data_counter_i;
  wire n_8_stage_3_left_align_datapath_mux_i;
  wire n_8_stage_3_storage_count_control_i;
  wire n_90_stage_3_left_align_datapath_mux_i;
  wire n_91_stage_3_left_align_datapath_mux_i;
  wire n_92_stage_3_left_align_datapath_mux_i;
  wire n_93_stage_3_left_align_datapath_mux_i;
  wire n_94_stage_3_left_align_datapath_mux_i;
  wire n_95_stage_3_left_align_datapath_mux_i;
  wire n_96_stage_3_left_align_datapath_mux_i;
  wire n_97_stage_3_left_align_datapath_mux_i;
  wire n_98_stage_3_left_align_datapath_mux_i;
  wire n_99_stage_3_left_align_datapath_mux_i;
  wire n_9_sideband_output_i;
  wire n_9_stage_1_rx_ll_deframer_i;
  wire n_9_stage_3_left_align_datapath_mux_i;
  wire n_9_stage_3_storage_count_control_i;
  wire [0:15]output_data_c;
  wire overwrite_c;
  wire p_0_in0;
  wire [0:0]p_0_out;
  wire [15:0]p_5_in;
  wire [0:3]stage_1_ecp_r;
  wire stage_1_pad_r;
  wire [0:3]stage_1_scp_r;
  wire stage_2_end_after_start_r;
  wire stage_2_end_before_start_r;
  wire stage_2_pad_r;
  wire stage_2_start_with_data_r;
  wire storage_count_r0;
  wire user_clk;

FDRE FRAME_ERR_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(FRAME_ERR_RESULT),
        .Q(FRAME_ERR),
        .R(RESET));
GND GND
       (.G(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair27" *) 
   LUT3 #(
    .INIT(8'hFE)) 
     \M_AXI_RX_TKEEP[1]_INST_0 
       (.I0(RX_REM[1]),
        .I1(M_AXI_RX_TKEEP[3]),
        .I2(RX_REM[2]),
        .O(M_AXI_RX_TKEEP[6]));
(* SOFT_HLUTNM = "soft_lutpair28" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \M_AXI_RX_TKEEP[2]_INST_0 
       (.I0(RX_REM[1]),
        .I1(M_AXI_RX_TKEEP[3]),
        .O(M_AXI_RX_TKEEP[5]));
(* SOFT_HLUTNM = "soft_lutpair26" *) 
   LUT3 #(
    .INIT(8'hEC)) 
     \M_AXI_RX_TKEEP[3]_INST_0 
       (.I0(RX_REM[1]),
        .I1(M_AXI_RX_TKEEP[3]),
        .I2(RX_REM[2]),
        .O(M_AXI_RX_TKEEP[4]));
(* SOFT_HLUTNM = "soft_lutpair26" *) 
   LUT3 #(
    .INIT(8'hA8)) 
     \M_AXI_RX_TKEEP[5]_INST_0 
       (.I0(M_AXI_RX_TKEEP[3]),
        .I1(RX_REM[1]),
        .I2(RX_REM[2]),
        .O(M_AXI_RX_TKEEP[2]));
(* SOFT_HLUTNM = "soft_lutpair28" *) 
   LUT2 #(
    .INIT(4'h8)) 
     \M_AXI_RX_TKEEP[6]_INST_0 
       (.I0(RX_REM[1]),
        .I1(M_AXI_RX_TKEEP[3]),
        .O(M_AXI_RX_TKEEP[1]));
(* SOFT_HLUTNM = "soft_lutpair27" *) 
   LUT3 #(
    .INIT(8'h80)) 
     \M_AXI_RX_TKEEP[7]_INST_0 
       (.I0(RX_REM[1]),
        .I1(M_AXI_RX_TKEEP[3]),
        .I2(RX_REM[2]),
        .O(M_AXI_RX_TKEEP[0]));
LUT1 #(
    .INIT(2'h1)) 
     M_AXI_RX_TLAST_INST_0
       (.I0(RX_EOF_N),
        .O(M_AXI_RX_TLAST));
LUT1 #(
    .INIT(2'h1)) 
     M_AXI_RX_TVALID_INST_0
       (.I0(RX_SRC_RDY_N),
        .O(M_AXI_RX_TVALID));
FDRE RX_EOF_N_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(EOF_N),
        .Q(RX_EOF_N),
        .R(\<const0> ));
FDRE \RX_REM_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_8_sideband_output_i),
        .Q(M_AXI_RX_TKEEP[3]),
        .R(\<const0> ));
FDRE \RX_REM_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_9_sideband_output_i),
        .Q(RX_REM[1]),
        .R(\<const0> ));
FDRE \RX_REM_Buffer_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_10_sideband_output_i),
        .Q(RX_REM[2]),
        .R(\<const0> ));
FDSE RX_SRC_RDY_N_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(SRC_RDY_N),
        .Q(RX_SRC_RDY_N),
        .S(RESET));
VCC VCC
       (.P(\<const1> ));
data_mgtdata_mgt_OUTPUT_MUX output_mux_i
       (.D({output_data_c[0],output_data_c[1],output_data_c[2],output_data_c[3],output_data_c[4],output_data_c[5],output_data_c[6],output_data_c[7],output_data_c[8],output_data_c[9],output_data_c[10],output_data_c[11],output_data_c[12],output_data_c[13],output_data_c[14],output_data_c[15]}),
        .I1(n_0_stage_3_left_align_datapath_mux_i),
        .I10(n_9_stage_3_left_align_datapath_mux_i),
        .I11(n_10_stage_3_left_align_datapath_mux_i),
        .I12(n_11_stage_3_left_align_datapath_mux_i),
        .I13(n_12_stage_3_left_align_datapath_mux_i),
        .I14(n_13_stage_3_left_align_datapath_mux_i),
        .I15(n_14_stage_3_left_align_datapath_mux_i),
        .I16(n_15_stage_3_left_align_datapath_mux_i),
        .I17(n_16_stage_3_left_align_datapath_mux_i),
        .I18(n_17_stage_3_left_align_datapath_mux_i),
        .I19(n_18_stage_3_left_align_datapath_mux_i),
        .I2(n_1_stage_3_left_align_datapath_mux_i),
        .I20(n_19_stage_3_left_align_datapath_mux_i),
        .I21(n_20_stage_3_left_align_datapath_mux_i),
        .I22(n_21_stage_3_left_align_datapath_mux_i),
        .I23(n_22_stage_3_left_align_datapath_mux_i),
        .I24(n_23_stage_3_left_align_datapath_mux_i),
        .I25(n_24_stage_3_left_align_datapath_mux_i),
        .I26(n_25_stage_3_left_align_datapath_mux_i),
        .I27(n_26_stage_3_left_align_datapath_mux_i),
        .I28(n_27_stage_3_left_align_datapath_mux_i),
        .I29(n_28_stage_3_left_align_datapath_mux_i),
        .I3(n_2_stage_3_left_align_datapath_mux_i),
        .I30(n_29_stage_3_left_align_datapath_mux_i),
        .I31(n_30_stage_3_left_align_datapath_mux_i),
        .I32(n_31_stage_3_left_align_datapath_mux_i),
        .I33(n_32_stage_3_left_align_datapath_mux_i),
        .I34(n_33_stage_3_left_align_datapath_mux_i),
        .I35(n_34_stage_3_left_align_datapath_mux_i),
        .I36(n_35_stage_3_left_align_datapath_mux_i),
        .I37(n_36_stage_3_left_align_datapath_mux_i),
        .I38(n_37_stage_3_left_align_datapath_mux_i),
        .I39(n_38_stage_3_left_align_datapath_mux_i),
        .I4(n_3_stage_3_left_align_datapath_mux_i),
        .I40(n_39_stage_3_left_align_datapath_mux_i),
        .I41(n_40_stage_3_left_align_datapath_mux_i),
        .I42(n_41_stage_3_left_align_datapath_mux_i),
        .I43(n_42_stage_3_left_align_datapath_mux_i),
        .I44(n_43_stage_3_left_align_datapath_mux_i),
        .I45(n_44_stage_3_left_align_datapath_mux_i),
        .I46(n_45_stage_3_left_align_datapath_mux_i),
        .I47(n_46_stage_3_left_align_datapath_mux_i),
        .I48(n_47_stage_3_left_align_datapath_mux_i),
        .I5(n_4_stage_3_left_align_datapath_mux_i),
        .I6(n_5_stage_3_left_align_datapath_mux_i),
        .I7(n_6_stage_3_left_align_datapath_mux_i),
        .I8(n_7_stage_3_left_align_datapath_mux_i),
        .I9(n_8_stage_3_left_align_datapath_mux_i),
        .M_AXI_RX_TDATA(M_AXI_RX_TDATA),
        .user_clk(user_clk));
data_mgtdata_mgt_SIDEBAND_OUTPUT sideband_output_i
       (.D(n_7_sideband_output_i),
        .END_STORAGE(END_STORAGE),
        .EOF_N(EOF_N),
        .FRAME_ERR_RESULT(FRAME_ERR_RESULT),
        .FRAME_ERR_RESULT_Buffer0(FRAME_ERR_RESULT_Buffer0),
        .I1(n_13_stage_3_storage_count_control_i),
        .I2(n_8_stage_2_valid_data_counter_i),
        .I3(n_7_stage_2_valid_data_counter_i),
        .I4(n_0_stage_2_frame_err_r_reg),
        .I5({n_0_stage_2_valid_data_counter_i,n_1_stage_2_valid_data_counter_i}),
        .O1(n_6_sideband_output_i),
        .Q({n_8_sideband_output_i,n_9_sideband_output_i,n_10_sideband_output_i}),
        .SRC_RDY_N(SRC_RDY_N),
        .START_RX(START_RX),
        .STORAGE_COUNT(STORAGE_COUNT[0]),
        .overwrite_c(overwrite_c),
        .p_0_out(p_0_out),
        .stage_2_end_before_start_r(stage_2_end_before_start_r),
        .stage_2_pad_r(stage_2_pad_r),
        .stage_2_start_with_data_r(stage_2_start_with_data_r),
        .storage_count_r0(storage_count_r0),
        .user_clk(user_clk));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[0]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[0]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(Q[7]),
        .Q(\n_0_stage_1_data_r_reg[0]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[10]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[10]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I6[5]),
        .Q(\n_0_stage_1_data_r_reg[10]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[11]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[11]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I6[4]),
        .Q(\n_0_stage_1_data_r_reg[11]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[12]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[12]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I6[3]),
        .Q(\n_0_stage_1_data_r_reg[12]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[13]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[13]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I6[2]),
        .Q(\n_0_stage_1_data_r_reg[13]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[14]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[14]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I6[1]),
        .Q(\n_0_stage_1_data_r_reg[14]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[15]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[15]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I6[0]),
        .Q(\n_0_stage_1_data_r_reg[15]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[16]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[16]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I7[7]),
        .Q(\n_0_stage_1_data_r_reg[16]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[17]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[17]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I7[6]),
        .Q(\n_0_stage_1_data_r_reg[17]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[18]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[18]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I7[5]),
        .Q(\n_0_stage_1_data_r_reg[18]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[19]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[19]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I7[4]),
        .Q(\n_0_stage_1_data_r_reg[19]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[1]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[1]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(Q[6]),
        .Q(\n_0_stage_1_data_r_reg[1]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[20]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[20]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I7[3]),
        .Q(\n_0_stage_1_data_r_reg[20]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[21]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[21]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I7[2]),
        .Q(\n_0_stage_1_data_r_reg[21]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[22]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[22]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I7[1]),
        .Q(\n_0_stage_1_data_r_reg[22]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[23]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[23]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I7[0]),
        .Q(\n_0_stage_1_data_r_reg[23]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[24]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[24]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I8[7]),
        .Q(\n_0_stage_1_data_r_reg[24]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[25]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[25]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I8[6]),
        .Q(\n_0_stage_1_data_r_reg[25]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[26]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[26]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I8[5]),
        .Q(\n_0_stage_1_data_r_reg[26]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[27]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[27]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I8[4]),
        .Q(\n_0_stage_1_data_r_reg[27]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[28]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[28]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I8[3]),
        .Q(\n_0_stage_1_data_r_reg[28]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[29]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[29]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I8[2]),
        .Q(\n_0_stage_1_data_r_reg[29]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[2]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[2]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(Q[5]),
        .Q(\n_0_stage_1_data_r_reg[2]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[30]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[30]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I8[1]),
        .Q(\n_0_stage_1_data_r_reg[30]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[31]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[31]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I8[0]),
        .Q(\n_0_stage_1_data_r_reg[31]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[32]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[32]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I9[7]),
        .Q(\n_0_stage_1_data_r_reg[32]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[33]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[33]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I9[6]),
        .Q(\n_0_stage_1_data_r_reg[33]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[34]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[34]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I9[5]),
        .Q(\n_0_stage_1_data_r_reg[34]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[35]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[35]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I9[4]),
        .Q(\n_0_stage_1_data_r_reg[35]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[36]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[36]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I9[3]),
        .Q(\n_0_stage_1_data_r_reg[36]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[37]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[37]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I9[2]),
        .Q(\n_0_stage_1_data_r_reg[37]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[38]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[38]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I9[1]),
        .Q(\n_0_stage_1_data_r_reg[38]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[39]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[39]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I9[0]),
        .Q(\n_0_stage_1_data_r_reg[39]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[3]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[3]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(Q[4]),
        .Q(\n_0_stage_1_data_r_reg[3]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[40]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[40]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I10[7]),
        .Q(\n_0_stage_1_data_r_reg[40]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[41]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[41]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I10[6]),
        .Q(\n_0_stage_1_data_r_reg[41]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[42]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[42]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I10[5]),
        .Q(\n_0_stage_1_data_r_reg[42]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[43]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[43]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I10[4]),
        .Q(\n_0_stage_1_data_r_reg[43]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[44]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[44]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I10[3]),
        .Q(\n_0_stage_1_data_r_reg[44]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[45]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[45]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I10[2]),
        .Q(\n_0_stage_1_data_r_reg[45]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[46]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[46]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I10[1]),
        .Q(\n_0_stage_1_data_r_reg[46]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[47]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[47]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I10[0]),
        .Q(\n_0_stage_1_data_r_reg[47]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[48]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[48]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I11[7]),
        .Q(\n_0_stage_1_data_r_reg[48]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[49]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[49]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I11[6]),
        .Q(\n_0_stage_1_data_r_reg[49]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[4]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[4]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(Q[3]),
        .Q(\n_0_stage_1_data_r_reg[4]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[50]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[50]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I11[5]),
        .Q(\n_0_stage_1_data_r_reg[50]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[51]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[51]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I11[4]),
        .Q(\n_0_stage_1_data_r_reg[51]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[52]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[52]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I11[3]),
        .Q(\n_0_stage_1_data_r_reg[52]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[53]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[53]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I11[2]),
        .Q(\n_0_stage_1_data_r_reg[53]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[54]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[54]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I11[1]),
        .Q(\n_0_stage_1_data_r_reg[54]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[55]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[55]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I11[0]),
        .Q(\n_0_stage_1_data_r_reg[55]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[56]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[56]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I12[7]),
        .Q(\n_0_stage_1_data_r_reg[56]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[57]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[57]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I12[6]),
        .Q(\n_0_stage_1_data_r_reg[57]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[58]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[58]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I12[5]),
        .Q(\n_0_stage_1_data_r_reg[58]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[59]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[59]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I12[4]),
        .Q(\n_0_stage_1_data_r_reg[59]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[5]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[5]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(Q[2]),
        .Q(\n_0_stage_1_data_r_reg[5]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[60]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[60]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I12[3]),
        .Q(\n_0_stage_1_data_r_reg[60]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[61]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[61]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I12[2]),
        .Q(\n_0_stage_1_data_r_reg[61]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[62]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[62]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I12[1]),
        .Q(\n_0_stage_1_data_r_reg[62]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[63]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[63]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I12[0]),
        .Q(\n_0_stage_1_data_r_reg[63]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[6]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[6]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(Q[1]),
        .Q(\n_0_stage_1_data_r_reg[6]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[7]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[7]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(Q[0]),
        .Q(\n_0_stage_1_data_r_reg[7]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[8]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[8]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I6[7]),
        .Q(\n_0_stage_1_data_r_reg[8]_srl3 ));
(* srl_bus_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg " *) 
   (* srl_name = "U0/\data_mgt_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[9]_srl3 " *) 
   SRL16E \stage_1_data_r_reg[9]_srl3 
       (.A0(\<const0> ),
        .A1(\<const1> ),
        .A2(\<const0> ),
        .A3(\<const0> ),
        .CE(\<const1> ),
        .CLK(user_clk),
        .D(I6[6]),
        .Q(\n_0_stage_1_data_r_reg[9]_srl3 ));
FDRE \stage_1_ecp_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I14[3]),
        .Q(stage_1_ecp_r[0]),
        .R(\<const0> ));
FDRE \stage_1_ecp_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I14[2]),
        .Q(stage_1_ecp_r[1]),
        .R(\<const0> ));
FDRE \stage_1_ecp_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I14[1]),
        .Q(stage_1_ecp_r[2]),
        .R(\<const0> ));
FDRE \stage_1_ecp_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I14[0]),
        .Q(stage_1_ecp_r[3]),
        .R(\<const0> ));
FDRE stage_1_pad_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I5),
        .Q(stage_1_pad_r),
        .R(\<const0> ));
data_mgtdata_mgt_RX_LL_DEFRAMER stage_1_rx_ll_deframer_i
       (.CI(CI),
        .D(D),
        .I1(I1),
        .I13(I13),
        .I2(I2),
        .I3(I3),
        .I4(I4),
        .I5({stage_1_scp_r[0],stage_1_scp_r[1],stage_1_scp_r[2],stage_1_scp_r[3]}),
        .O(O),
        .O1(O1),
        .O2(O2),
        .O3({n_4_stage_1_rx_ll_deframer_i,n_5_stage_1_rx_ll_deframer_i,n_6_stage_1_rx_ll_deframer_i}),
        .O4({n_7_stage_1_rx_ll_deframer_i,n_8_stage_1_rx_ll_deframer_i,n_9_stage_1_rx_ll_deframer_i,n_10_stage_1_rx_ll_deframer_i,n_11_stage_1_rx_ll_deframer_i}),
        .O5(n_12_stage_1_rx_ll_deframer_i),
        .O6(n_13_stage_1_rx_ll_deframer_i),
        .O7(n_14_stage_1_rx_ll_deframer_i),
        .O8(n_15_stage_1_rx_ll_deframer_i),
        .Q({stage_1_ecp_r[0],stage_1_ecp_r[1],stage_1_ecp_r[2],stage_1_ecp_r[3]}),
        .RESET(RESET),
        .S(S),
        .S1_in(S1_in),
        .S4_in(S4_in),
        .S7_in(S7_in),
        .START_RX(START_RX),
        .user_clk(user_clk));
FDRE \stage_1_scp_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[3]),
        .Q(stage_1_scp_r[0]),
        .R(\<const0> ));
FDRE \stage_1_scp_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[2]),
        .Q(stage_1_scp_r[1]),
        .R(\<const0> ));
FDRE \stage_1_scp_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[1]),
        .Q(stage_1_scp_r[2]),
        .R(\<const0> ));
FDRE \stage_1_scp_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[0]),
        .Q(stage_1_scp_r[3]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[0]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[0]_srl3 ),
        .Q(data0[15]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[10]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[10]_srl3 ),
        .Q(data0[5]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[11]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[11]_srl3 ),
        .Q(data0[4]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[12]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[12]_srl3 ),
        .Q(data0[3]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[13]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[13]_srl3 ),
        .Q(data0[2]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[14]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[14]_srl3 ),
        .Q(data0[1]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[15]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[15]_srl3 ),
        .Q(data0[0]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[16]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[16]_srl3 ),
        .Q(p_5_in[15]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[17]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[17]_srl3 ),
        .Q(p_5_in[14]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[18]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[18]_srl3 ),
        .Q(p_5_in[13]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[19]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[19]_srl3 ),
        .Q(p_5_in[12]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[1]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[1]_srl3 ),
        .Q(data0[14]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[20]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[20]_srl3 ),
        .Q(p_5_in[11]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[21]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[21]_srl3 ),
        .Q(p_5_in[10]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[22]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[22]_srl3 ),
        .Q(p_5_in[9]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[23]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[23]_srl3 ),
        .Q(p_5_in[8]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[24]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[24]_srl3 ),
        .Q(p_5_in[7]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[25]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[25]_srl3 ),
        .Q(p_5_in[6]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[26]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[26]_srl3 ),
        .Q(p_5_in[5]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[27]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[27]_srl3 ),
        .Q(p_5_in[4]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[28]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[28]_srl3 ),
        .Q(p_5_in[3]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[29]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[29]_srl3 ),
        .Q(p_5_in[2]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[2]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[2]_srl3 ),
        .Q(data0[13]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[30]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[30]_srl3 ),
        .Q(p_5_in[1]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[31]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[31]_srl3 ),
        .Q(p_5_in[0]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[32]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[32]_srl3 ),
        .Q(data2[15]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[33]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[33]_srl3 ),
        .Q(data2[14]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[34]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[34]_srl3 ),
        .Q(data2[13]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[35]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[35]_srl3 ),
        .Q(data2[12]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[36]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[36]_srl3 ),
        .Q(data2[11]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[37]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[37]_srl3 ),
        .Q(data2[10]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[38]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[38]_srl3 ),
        .Q(data2[9]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[39]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[39]_srl3 ),
        .Q(data2[8]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[3]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[3]_srl3 ),
        .Q(data0[12]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[40]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[40]_srl3 ),
        .Q(data2[7]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[41]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[41]_srl3 ),
        .Q(data2[6]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[42]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[42]_srl3 ),
        .Q(data2[5]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[43]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[43]_srl3 ),
        .Q(data2[4]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[44]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[44]_srl3 ),
        .Q(data2[3]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[45]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[45]_srl3 ),
        .Q(data2[2]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[46]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[46]_srl3 ),
        .Q(data2[1]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[47]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[47]_srl3 ),
        .Q(data2[0]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[48]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[48]_srl3 ),
        .Q(muxed_data_c[48]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[49]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[49]_srl3 ),
        .Q(muxed_data_c[49]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[4]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[4]_srl3 ),
        .Q(data0[11]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[50]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[50]_srl3 ),
        .Q(muxed_data_c[50]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[51]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[51]_srl3 ),
        .Q(muxed_data_c[51]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[52]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[52]_srl3 ),
        .Q(muxed_data_c[52]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[53]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[53]_srl3 ),
        .Q(muxed_data_c[53]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[54]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[54]_srl3 ),
        .Q(muxed_data_c[54]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[55]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[55]_srl3 ),
        .Q(muxed_data_c[55]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[56]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[56]_srl3 ),
        .Q(muxed_data_c[56]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[57]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[57]_srl3 ),
        .Q(muxed_data_c[57]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[58]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[58]_srl3 ),
        .Q(muxed_data_c[58]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[59]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[59]_srl3 ),
        .Q(muxed_data_c[59]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[5]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[5]_srl3 ),
        .Q(data0[10]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[60]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[60]_srl3 ),
        .Q(muxed_data_c[60]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[61]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[61]_srl3 ),
        .Q(muxed_data_c[61]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[62]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[62]_srl3 ),
        .Q(muxed_data_c[62]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[63]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[63]_srl3 ),
        .Q(muxed_data_c[63]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[6]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[6]_srl3 ),
        .Q(data0[9]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[7]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[7]_srl3 ),
        .Q(data0[8]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[8]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[8]_srl3 ),
        .Q(data0[7]),
        .R(\<const0> ));
FDRE \stage_2_data_r_reg[9]__0 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_stage_1_data_r_reg[9]_srl3 ),
        .Q(data0[6]),
        .R(\<const0> ));
FDRE stage_2_end_after_start_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_14_stage_1_rx_ll_deframer_i),
        .Q(stage_2_end_after_start_r),
        .R(RESET));
FDRE stage_2_end_before_start_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_13_stage_1_rx_ll_deframer_i),
        .Q(stage_2_end_before_start_r),
        .R(RESET));
FDRE stage_2_frame_err_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_15_stage_1_rx_ll_deframer_i),
        .Q(n_0_stage_2_frame_err_r_reg),
        .R(\<const0> ));
data_mgtdata_mgt_LEFT_ALIGN_CONTROL stage_2_left_align_control_i
       (.D({muxed_data_c[0],muxed_data_c[1],muxed_data_c[2],muxed_data_c[3],muxed_data_c[4],muxed_data_c[5],muxed_data_c[6],muxed_data_c[7],muxed_data_c[8],muxed_data_c[9],muxed_data_c[10],muxed_data_c[11],muxed_data_c[12],muxed_data_c[13],muxed_data_c[14],muxed_data_c[15]}),
        .I1({muxed_data_c[48],muxed_data_c[49],muxed_data_c[50],muxed_data_c[51],muxed_data_c[52],muxed_data_c[53],muxed_data_c[54],muxed_data_c[55],muxed_data_c[56],muxed_data_c[57],muxed_data_c[58],muxed_data_c[59],muxed_data_c[60],muxed_data_c[61],muxed_data_c[62],muxed_data_c[63]}),
        .I2({n_7_stage_1_rx_ll_deframer_i,n_8_stage_1_rx_ll_deframer_i,n_9_stage_1_rx_ll_deframer_i,n_10_stage_1_rx_ll_deframer_i,n_11_stage_1_rx_ll_deframer_i}),
        .Q({n_16_stage_2_left_align_control_i,n_17_stage_2_left_align_control_i,n_18_stage_2_left_align_control_i}),
        .data0(data0),
        .data2(data2),
        .p_5_in(p_5_in),
        .user_clk(user_clk));
FDRE stage_2_pad_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(stage_1_pad_r),
        .Q(stage_2_pad_r),
        .R(\<const0> ));
FDRE stage_2_start_with_data_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_12_stage_1_rx_ll_deframer_i),
        .Q(stage_2_start_with_data_r),
        .R(RESET));
data_mgtdata_mgt_VALID_DATA_COUNTER stage_2_valid_data_counter_i
       (.D({n_0_stage_2_valid_data_counter_i,n_1_stage_2_valid_data_counter_i}),
        .END_STORAGE(END_STORAGE),
        .FRAME_ERR_RESULT_Buffer0(FRAME_ERR_RESULT_Buffer0),
        .I1(n_0_stage_2_frame_err_r_reg),
        .I2(n_14_stage_3_storage_count_control_i),
        .I3({n_4_stage_1_rx_ll_deframer_i,n_5_stage_1_rx_ll_deframer_i,n_6_stage_1_rx_ll_deframer_i}),
        .O1(n_7_stage_2_valid_data_counter_i),
        .O2(n_8_stage_2_valid_data_counter_i),
        .Q({LEFT_ALIGNED_COUNT[0],LEFT_ALIGNED_COUNT[1],LEFT_ALIGNED_COUNT[2]}),
        .RESET(RESET),
        .START_RX(START_RX),
        .STORAGE_COUNT(STORAGE_COUNT),
        .p_0_out(p_0_out),
        .stage_2_end_after_start_r(stage_2_end_after_start_r),
        .stage_2_end_before_start_r(stage_2_end_before_start_r),
        .stage_2_start_with_data_r(stage_2_start_with_data_r),
        .user_clk(user_clk));
data_mgtdata_mgt_LEFT_ALIGN_MUX stage_3_left_align_datapath_mux_i
       (.D({muxed_data_c[0],muxed_data_c[1],muxed_data_c[2],muxed_data_c[3],muxed_data_c[4],muxed_data_c[5],muxed_data_c[6],muxed_data_c[7],muxed_data_c[8],muxed_data_c[9],muxed_data_c[10],muxed_data_c[11],muxed_data_c[12],muxed_data_c[13],muxed_data_c[14],muxed_data_c[15],muxed_data_c[48],muxed_data_c[49],muxed_data_c[50],muxed_data_c[51],muxed_data_c[52],muxed_data_c[53],muxed_data_c[54],muxed_data_c[55],muxed_data_c[56],muxed_data_c[57],muxed_data_c[58],muxed_data_c[59],muxed_data_c[60],muxed_data_c[61],muxed_data_c[62],muxed_data_c[63]}),
        .I1({STORAGE_SELECT_Buffer[3],STORAGE_SELECT_Buffer[4],STORAGE_SELECT_Buffer[8],STORAGE_SELECT_Buffer[9],STORAGE_SELECT_Buffer[13],STORAGE_SELECT_Buffer[14],STORAGE_SELECT_Buffer[18],STORAGE_SELECT_Buffer[19]}),
        .O1(n_0_stage_3_left_align_datapath_mux_i),
        .O10(n_9_stage_3_left_align_datapath_mux_i),
        .O100(n_99_stage_3_left_align_datapath_mux_i),
        .O101(n_100_stage_3_left_align_datapath_mux_i),
        .O102(n_101_stage_3_left_align_datapath_mux_i),
        .O103(n_102_stage_3_left_align_datapath_mux_i),
        .O104(n_103_stage_3_left_align_datapath_mux_i),
        .O105(n_104_stage_3_left_align_datapath_mux_i),
        .O106(n_105_stage_3_left_align_datapath_mux_i),
        .O107(n_106_stage_3_left_align_datapath_mux_i),
        .O108(n_107_stage_3_left_align_datapath_mux_i),
        .O109(n_108_stage_3_left_align_datapath_mux_i),
        .O11(n_10_stage_3_left_align_datapath_mux_i),
        .O110(n_109_stage_3_left_align_datapath_mux_i),
        .O111(n_110_stage_3_left_align_datapath_mux_i),
        .O112(n_111_stage_3_left_align_datapath_mux_i),
        .O12(n_11_stage_3_left_align_datapath_mux_i),
        .O13(n_12_stage_3_left_align_datapath_mux_i),
        .O14(n_13_stage_3_left_align_datapath_mux_i),
        .O15(n_14_stage_3_left_align_datapath_mux_i),
        .O16(n_15_stage_3_left_align_datapath_mux_i),
        .O17(n_16_stage_3_left_align_datapath_mux_i),
        .O18(n_17_stage_3_left_align_datapath_mux_i),
        .O19(n_18_stage_3_left_align_datapath_mux_i),
        .O2(n_1_stage_3_left_align_datapath_mux_i),
        .O20(n_19_stage_3_left_align_datapath_mux_i),
        .O21(n_20_stage_3_left_align_datapath_mux_i),
        .O22(n_21_stage_3_left_align_datapath_mux_i),
        .O23(n_22_stage_3_left_align_datapath_mux_i),
        .O24(n_23_stage_3_left_align_datapath_mux_i),
        .O25(n_24_stage_3_left_align_datapath_mux_i),
        .O26(n_25_stage_3_left_align_datapath_mux_i),
        .O27(n_26_stage_3_left_align_datapath_mux_i),
        .O28(n_27_stage_3_left_align_datapath_mux_i),
        .O29(n_28_stage_3_left_align_datapath_mux_i),
        .O3(n_2_stage_3_left_align_datapath_mux_i),
        .O30(n_29_stage_3_left_align_datapath_mux_i),
        .O31(n_30_stage_3_left_align_datapath_mux_i),
        .O32(n_31_stage_3_left_align_datapath_mux_i),
        .O33(n_32_stage_3_left_align_datapath_mux_i),
        .O34(n_33_stage_3_left_align_datapath_mux_i),
        .O35(n_34_stage_3_left_align_datapath_mux_i),
        .O36(n_35_stage_3_left_align_datapath_mux_i),
        .O37(n_36_stage_3_left_align_datapath_mux_i),
        .O38(n_37_stage_3_left_align_datapath_mux_i),
        .O39(n_38_stage_3_left_align_datapath_mux_i),
        .O4(n_3_stage_3_left_align_datapath_mux_i),
        .O40(n_39_stage_3_left_align_datapath_mux_i),
        .O41(n_40_stage_3_left_align_datapath_mux_i),
        .O42(n_41_stage_3_left_align_datapath_mux_i),
        .O43(n_42_stage_3_left_align_datapath_mux_i),
        .O44(n_43_stage_3_left_align_datapath_mux_i),
        .O45(n_44_stage_3_left_align_datapath_mux_i),
        .O46(n_45_stage_3_left_align_datapath_mux_i),
        .O47(n_46_stage_3_left_align_datapath_mux_i),
        .O48(n_47_stage_3_left_align_datapath_mux_i),
        .O49(n_48_stage_3_left_align_datapath_mux_i),
        .O5(n_4_stage_3_left_align_datapath_mux_i),
        .O50(n_49_stage_3_left_align_datapath_mux_i),
        .O51(n_50_stage_3_left_align_datapath_mux_i),
        .O52(n_51_stage_3_left_align_datapath_mux_i),
        .O53(n_52_stage_3_left_align_datapath_mux_i),
        .O54(n_53_stage_3_left_align_datapath_mux_i),
        .O55(n_54_stage_3_left_align_datapath_mux_i),
        .O56(n_55_stage_3_left_align_datapath_mux_i),
        .O57(n_56_stage_3_left_align_datapath_mux_i),
        .O58(n_57_stage_3_left_align_datapath_mux_i),
        .O59(n_58_stage_3_left_align_datapath_mux_i),
        .O6(n_5_stage_3_left_align_datapath_mux_i),
        .O60(n_59_stage_3_left_align_datapath_mux_i),
        .O61(n_60_stage_3_left_align_datapath_mux_i),
        .O62(n_61_stage_3_left_align_datapath_mux_i),
        .O63(n_62_stage_3_left_align_datapath_mux_i),
        .O64(n_63_stage_3_left_align_datapath_mux_i),
        .O65(n_64_stage_3_left_align_datapath_mux_i),
        .O66(n_65_stage_3_left_align_datapath_mux_i),
        .O67(n_66_stage_3_left_align_datapath_mux_i),
        .O68(n_67_stage_3_left_align_datapath_mux_i),
        .O69(n_68_stage_3_left_align_datapath_mux_i),
        .O7(n_6_stage_3_left_align_datapath_mux_i),
        .O70(n_69_stage_3_left_align_datapath_mux_i),
        .O71(n_70_stage_3_left_align_datapath_mux_i),
        .O72(n_71_stage_3_left_align_datapath_mux_i),
        .O73(n_72_stage_3_left_align_datapath_mux_i),
        .O74(n_73_stage_3_left_align_datapath_mux_i),
        .O75(n_74_stage_3_left_align_datapath_mux_i),
        .O76(n_75_stage_3_left_align_datapath_mux_i),
        .O77(n_76_stage_3_left_align_datapath_mux_i),
        .O78(n_77_stage_3_left_align_datapath_mux_i),
        .O79(n_78_stage_3_left_align_datapath_mux_i),
        .O8(n_7_stage_3_left_align_datapath_mux_i),
        .O80(n_79_stage_3_left_align_datapath_mux_i),
        .O81(n_80_stage_3_left_align_datapath_mux_i),
        .O82(n_81_stage_3_left_align_datapath_mux_i),
        .O83(n_82_stage_3_left_align_datapath_mux_i),
        .O84(n_83_stage_3_left_align_datapath_mux_i),
        .O85(n_84_stage_3_left_align_datapath_mux_i),
        .O86(n_85_stage_3_left_align_datapath_mux_i),
        .O87(n_86_stage_3_left_align_datapath_mux_i),
        .O88(n_87_stage_3_left_align_datapath_mux_i),
        .O89(n_88_stage_3_left_align_datapath_mux_i),
        .O9(n_8_stage_3_left_align_datapath_mux_i),
        .O90(n_89_stage_3_left_align_datapath_mux_i),
        .O91(n_90_stage_3_left_align_datapath_mux_i),
        .O92(n_91_stage_3_left_align_datapath_mux_i),
        .O93(n_92_stage_3_left_align_datapath_mux_i),
        .O94(n_93_stage_3_left_align_datapath_mux_i),
        .O95(n_94_stage_3_left_align_datapath_mux_i),
        .O96(n_95_stage_3_left_align_datapath_mux_i),
        .O97(n_96_stage_3_left_align_datapath_mux_i),
        .O98(n_97_stage_3_left_align_datapath_mux_i),
        .O99(n_98_stage_3_left_align_datapath_mux_i),
        .OUTPUT_SELECT_Buffer({OUTPUT_SELECT_Buffer[10],OUTPUT_SELECT_Buffer[6:5],OUTPUT_SELECT_Buffer[1:0]}),
        .Q({n_16_stage_2_left_align_control_i,n_17_stage_2_left_align_control_i,n_18_stage_2_left_align_control_i}),
        .STORAGE_DATA({STORAGE_DATA[16],STORAGE_DATA[17],STORAGE_DATA[18],STORAGE_DATA[19],STORAGE_DATA[20],STORAGE_DATA[21],STORAGE_DATA[22],STORAGE_DATA[23],STORAGE_DATA[24],STORAGE_DATA[25],STORAGE_DATA[26],STORAGE_DATA[27],STORAGE_DATA[28],STORAGE_DATA[29],STORAGE_DATA[30],STORAGE_DATA[31],STORAGE_DATA[32],STORAGE_DATA[33],STORAGE_DATA[34],STORAGE_DATA[35],STORAGE_DATA[36],STORAGE_DATA[37],STORAGE_DATA[38],STORAGE_DATA[39],STORAGE_DATA[40],STORAGE_DATA[41],STORAGE_DATA[42],STORAGE_DATA[43],STORAGE_DATA[44],STORAGE_DATA[45],STORAGE_DATA[46],STORAGE_DATA[47],STORAGE_DATA[48],STORAGE_DATA[49],STORAGE_DATA[50],STORAGE_DATA[51],STORAGE_DATA[52],STORAGE_DATA[53],STORAGE_DATA[54],STORAGE_DATA[55],STORAGE_DATA[56],STORAGE_DATA[57],STORAGE_DATA[58],STORAGE_DATA[59],STORAGE_DATA[60],STORAGE_DATA[61],STORAGE_DATA[62],STORAGE_DATA[63]}),
        .data2(data2),
        .p_5_in(p_5_in),
        .user_clk(user_clk));
data_mgtdata_mgt_OUTPUT_SWITCH_CONTROL stage_3_output_switch_control_i
       (.D(n_12_stage_3_storage_count_control_i),
        .I1(n_11_stage_3_storage_count_control_i),
        .I2(n_6_stage_3_storage_count_control_i),
        .OUTPUT_SELECT_Buffer({OUTPUT_SELECT_Buffer[10],OUTPUT_SELECT_Buffer[6:5],OUTPUT_SELECT_Buffer[1:0]}),
        .STORAGE_COUNT(STORAGE_COUNT[2]),
        .overwrite_c(overwrite_c),
        .user_clk(user_clk));
data_mgtdata_mgt_STORAGE_CE_CONTROL stage_3_storage_ce_control_i
       (.D({ce_command_c[0],ce_command_c[1],ce_command_c[2],n_7_sideband_output_i}),
        .Q({n_0_stage_3_storage_ce_control_i,n_1_stage_3_storage_ce_control_i,p_0_in0,n_3_stage_3_storage_ce_control_i}),
        .RESET(RESET),
        .user_clk(user_clk));
data_mgtdata_mgt_STORAGE_COUNT_CONTROL stage_3_storage_count_control_i
       (.D({ce_command_c[0],ce_command_c[1],ce_command_c[2]}),
        .END_STORAGE(END_STORAGE),
        .I1(n_0_stage_2_frame_err_r_reg),
        .I2(n_6_sideband_output_i),
        .O1(n_6_stage_3_storage_count_control_i),
        .O2({n_7_stage_3_storage_count_control_i,n_8_stage_3_storage_count_control_i,n_9_stage_3_storage_count_control_i,n_10_stage_3_storage_count_control_i}),
        .O3(n_11_stage_3_storage_count_control_i),
        .O4(n_12_stage_3_storage_count_control_i),
        .O5(n_13_stage_3_storage_count_control_i),
        .O6(n_14_stage_3_storage_count_control_i),
        .Q({LEFT_ALIGNED_COUNT[0],LEFT_ALIGNED_COUNT[1],LEFT_ALIGNED_COUNT[2]}),
        .START_RX(START_RX),
        .STORAGE_COUNT(STORAGE_COUNT),
        .p_0_out(p_0_out),
        .stage_2_end_before_start_r(stage_2_end_before_start_r),
        .stage_2_start_with_data_r(stage_2_start_with_data_r),
        .storage_count_r0(storage_count_r0),
        .user_clk(user_clk));
data_mgtdata_mgt_STORAGE_SWITCH_CONTROL stage_3_storage_switch_control_i
       (.D({n_7_stage_3_storage_count_control_i,STORAGE_COUNT[2],STORAGE_COUNT[1],n_8_stage_3_storage_count_control_i,n_9_stage_3_storage_count_control_i,n_10_stage_3_storage_count_control_i}),
        .Q({STORAGE_SELECT_Buffer[3],STORAGE_SELECT_Buffer[4],STORAGE_SELECT_Buffer[8],STORAGE_SELECT_Buffer[9],STORAGE_SELECT_Buffer[13],STORAGE_SELECT_Buffer[14],STORAGE_SELECT_Buffer[18],STORAGE_SELECT_Buffer[19]}),
        .overwrite_c(overwrite_c),
        .user_clk(user_clk));
data_mgtdata_mgt_STORAGE_MUX stage_4_storage_mux_i
       (.D({output_data_c[0],output_data_c[1],output_data_c[2],output_data_c[3],output_data_c[4],output_data_c[5],output_data_c[6],output_data_c[7],output_data_c[8],output_data_c[9],output_data_c[10],output_data_c[11],output_data_c[12],output_data_c[13],output_data_c[14],output_data_c[15]}),
        .I1(n_48_stage_3_left_align_datapath_mux_i),
        .I10(n_57_stage_3_left_align_datapath_mux_i),
        .I11(n_58_stage_3_left_align_datapath_mux_i),
        .I12(n_59_stage_3_left_align_datapath_mux_i),
        .I13(n_60_stage_3_left_align_datapath_mux_i),
        .I14(n_61_stage_3_left_align_datapath_mux_i),
        .I15(n_62_stage_3_left_align_datapath_mux_i),
        .I16(n_63_stage_3_left_align_datapath_mux_i),
        .I17(n_64_stage_3_left_align_datapath_mux_i),
        .I18(n_65_stage_3_left_align_datapath_mux_i),
        .I19(n_66_stage_3_left_align_datapath_mux_i),
        .I2(n_49_stage_3_left_align_datapath_mux_i),
        .I20(n_67_stage_3_left_align_datapath_mux_i),
        .I21(n_68_stage_3_left_align_datapath_mux_i),
        .I22(n_69_stage_3_left_align_datapath_mux_i),
        .I23(n_70_stage_3_left_align_datapath_mux_i),
        .I24(n_71_stage_3_left_align_datapath_mux_i),
        .I25(n_72_stage_3_left_align_datapath_mux_i),
        .I26(n_73_stage_3_left_align_datapath_mux_i),
        .I27(n_74_stage_3_left_align_datapath_mux_i),
        .I28(n_75_stage_3_left_align_datapath_mux_i),
        .I29(n_76_stage_3_left_align_datapath_mux_i),
        .I3(n_50_stage_3_left_align_datapath_mux_i),
        .I30(n_77_stage_3_left_align_datapath_mux_i),
        .I31(n_78_stage_3_left_align_datapath_mux_i),
        .I32(n_79_stage_3_left_align_datapath_mux_i),
        .I33(n_80_stage_3_left_align_datapath_mux_i),
        .I34(n_81_stage_3_left_align_datapath_mux_i),
        .I35(n_82_stage_3_left_align_datapath_mux_i),
        .I36(n_83_stage_3_left_align_datapath_mux_i),
        .I37(n_84_stage_3_left_align_datapath_mux_i),
        .I38(n_85_stage_3_left_align_datapath_mux_i),
        .I39(n_86_stage_3_left_align_datapath_mux_i),
        .I4(n_51_stage_3_left_align_datapath_mux_i),
        .I40(n_87_stage_3_left_align_datapath_mux_i),
        .I41(n_88_stage_3_left_align_datapath_mux_i),
        .I42(n_89_stage_3_left_align_datapath_mux_i),
        .I43(n_90_stage_3_left_align_datapath_mux_i),
        .I44(n_91_stage_3_left_align_datapath_mux_i),
        .I45(n_92_stage_3_left_align_datapath_mux_i),
        .I46(n_93_stage_3_left_align_datapath_mux_i),
        .I47(n_94_stage_3_left_align_datapath_mux_i),
        .I48(n_95_stage_3_left_align_datapath_mux_i),
        .I49(n_96_stage_3_left_align_datapath_mux_i),
        .I5(n_52_stage_3_left_align_datapath_mux_i),
        .I50(n_97_stage_3_left_align_datapath_mux_i),
        .I51(n_98_stage_3_left_align_datapath_mux_i),
        .I52(n_99_stage_3_left_align_datapath_mux_i),
        .I53(n_100_stage_3_left_align_datapath_mux_i),
        .I54(n_101_stage_3_left_align_datapath_mux_i),
        .I55(n_102_stage_3_left_align_datapath_mux_i),
        .I56(n_103_stage_3_left_align_datapath_mux_i),
        .I57(n_104_stage_3_left_align_datapath_mux_i),
        .I58(n_105_stage_3_left_align_datapath_mux_i),
        .I59(n_106_stage_3_left_align_datapath_mux_i),
        .I6(n_53_stage_3_left_align_datapath_mux_i),
        .I60(n_107_stage_3_left_align_datapath_mux_i),
        .I61(n_108_stage_3_left_align_datapath_mux_i),
        .I62(n_109_stage_3_left_align_datapath_mux_i),
        .I63(n_110_stage_3_left_align_datapath_mux_i),
        .I64(n_111_stage_3_left_align_datapath_mux_i),
        .I7(n_54_stage_3_left_align_datapath_mux_i),
        .I8(n_55_stage_3_left_align_datapath_mux_i),
        .I9(n_56_stage_3_left_align_datapath_mux_i),
        .Q({n_0_stage_3_storage_ce_control_i,n_1_stage_3_storage_ce_control_i,p_0_in0,n_3_stage_3_storage_ce_control_i}),
        .STORAGE_DATA({STORAGE_DATA[16],STORAGE_DATA[17],STORAGE_DATA[18],STORAGE_DATA[19],STORAGE_DATA[20],STORAGE_DATA[21],STORAGE_DATA[22],STORAGE_DATA[23],STORAGE_DATA[24],STORAGE_DATA[25],STORAGE_DATA[26],STORAGE_DATA[27],STORAGE_DATA[28],STORAGE_DATA[29],STORAGE_DATA[30],STORAGE_DATA[31],STORAGE_DATA[32],STORAGE_DATA[33],STORAGE_DATA[34],STORAGE_DATA[35],STORAGE_DATA[36],STORAGE_DATA[37],STORAGE_DATA[38],STORAGE_DATA[39],STORAGE_DATA[40],STORAGE_DATA[41],STORAGE_DATA[42],STORAGE_DATA[43],STORAGE_DATA[44],STORAGE_DATA[45],STORAGE_DATA[46],STORAGE_DATA[47],STORAGE_DATA[48],STORAGE_DATA[49],STORAGE_DATA[50],STORAGE_DATA[51],STORAGE_DATA[52],STORAGE_DATA[53],STORAGE_DATA[54],STORAGE_DATA[55],STORAGE_DATA[56],STORAGE_DATA[57],STORAGE_DATA[58],STORAGE_DATA[59],STORAGE_DATA[60],STORAGE_DATA[61],STORAGE_DATA[62],STORAGE_DATA[63]}),
        .user_clk(user_clk));
endmodule

module data_mgtdata_mgt_SIDEBAND_OUTPUT
   (EOF_N,
    FRAME_ERR_RESULT,
    END_STORAGE,
    SRC_RDY_N,
    storage_count_r0,
    overwrite_c,
    O1,
    D,
    Q,
    I1,
    user_clk,
    FRAME_ERR_RESULT_Buffer0,
    I2,
    I3,
    I4,
    START_RX,
    stage_2_start_with_data_r,
    stage_2_pad_r,
    p_0_out,
    STORAGE_COUNT,
    stage_2_end_before_start_r,
    I5);
  output EOF_N;
  output FRAME_ERR_RESULT;
  output END_STORAGE;
  output SRC_RDY_N;
  output storage_count_r0;
  output overwrite_c;
  output O1;
  output [0:0]D;
  output [2:0]Q;
  input I1;
  input user_clk;
  input FRAME_ERR_RESULT_Buffer0;
  input I2;
  input I3;
  input I4;
  input START_RX;
  input stage_2_start_with_data_r;
  input stage_2_pad_r;
  input [0:0]p_0_out;
  input [0:0]STORAGE_COUNT;
  input stage_2_end_before_start_r;
  input [1:0]I5;

  wire \<const0> ;
  wire \<const1> ;
  wire [0:0]D;
  wire END_STORAGE;
  wire EOF_N;
  wire FRAME_ERR_RESULT;
  wire FRAME_ERR_RESULT_Buffer0;
  wire I1;
  wire I2;
  wire I3;
  wire I4;
  wire [1:0]I5;
  wire O1;
  wire [2:0]Q;
  wire SRC_RDY_N;
  wire START_RX;
  wire [0:0]STORAGE_COUNT;
  wire \n_0_RX_REM_Buffer[2]_i_1 ;
  wire n_0_pad_storage_r_i_1;
  wire n_0_pad_storage_r_i_2;
  wire n_0_pad_storage_r_reg;
  wire overwrite_c;
  wire [0:0]p_0_out;
  wire stage_2_end_before_start_r;
  wire stage_2_pad_r;
  wire stage_2_start_with_data_r;
  wire storage_count_r0;
  wire user_clk;

FDRE EOF_N_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I1),
        .Q(EOF_N),
        .R(\<const0> ));
FDRE FRAME_ERR_RESULT_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(FRAME_ERR_RESULT_Buffer0),
        .Q(FRAME_ERR_RESULT),
        .R(\<const0> ));
GND GND
       (.G(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair24" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \OUTPUT_SELECT_Buffer[9]_i_1 
       (.I0(END_STORAGE),
        .I1(stage_2_start_with_data_r),
        .O(overwrite_c));
(* SOFT_HLUTNM = "soft_lutpair24" *) 
   LUT4 #(
    .INIT(16'h00EF)) 
     \RX_REM_Buffer[2]_i_1 
       (.I0(stage_2_start_with_data_r),
        .I1(END_STORAGE),
        .I2(stage_2_pad_r),
        .I3(n_0_pad_storage_r_reg),
        .O(\n_0_RX_REM_Buffer[2]_i_1 ));
FDRE \RX_REM_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I5[1]),
        .Q(Q[2]),
        .R(\<const0> ));
FDRE \RX_REM_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I5[0]),
        .Q(Q[1]),
        .R(\<const0> ));
FDRE \RX_REM_Buffer_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_RX_REM_Buffer[2]_i_1 ),
        .Q(Q[0]),
        .R(\<const0> ));
FDRE SRC_RDY_N_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I3),
        .Q(SRC_RDY_N),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair25" *) 
   LUT4 #(
    .INIT(16'hFEFF)) 
     \STORAGE_CE_Buffer[3]_i_1 
       (.I0(stage_2_start_with_data_r),
        .I1(END_STORAGE),
        .I2(p_0_out),
        .I3(STORAGE_COUNT),
        .O(D));
VCC VCC
       (.P(\<const1> ));
FDRE end_storage_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I2),
        .Q(END_STORAGE),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'h00FB00F000F000F0)) 
     pad_storage_r_i_1
       (.I0(stage_2_start_with_data_r),
        .I1(p_0_out),
        .I2(stage_2_pad_r),
        .I3(storage_count_r0),
        .I4(n_0_pad_storage_r_i_2),
        .I5(n_0_pad_storage_r_reg),
        .O(n_0_pad_storage_r_i_1));
LUT3 #(
    .INIT(8'h15)) 
     pad_storage_r_i_2
       (.I0(END_STORAGE),
        .I1(stage_2_end_before_start_r),
        .I2(stage_2_start_with_data_r),
        .O(n_0_pad_storage_r_i_2));
FDRE pad_storage_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_pad_storage_r_i_1),
        .Q(n_0_pad_storage_r_reg),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair25" *) 
   LUT2 #(
    .INIT(4'h1)) 
     \storage_count_r[1]_i_2 
       (.I0(stage_2_start_with_data_r),
        .I1(END_STORAGE),
        .O(O1));
LUT2 #(
    .INIT(4'hB)) 
     \storage_count_r[1]_i_3 
       (.I0(I4),
        .I1(START_RX),
        .O(storage_count_r0));
endmodule

module data_mgtdata_mgt_STORAGE_CE_CONTROL
   (Q,
    RESET,
    D,
    user_clk);
  output [3:0]Q;
  input RESET;
  input [3:0]D;
  input user_clk;

  wire \<const1> ;
  wire [3:0]D;
  wire [3:0]Q;
  wire RESET;
  wire user_clk;

FDRE \STORAGE_CE_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[3]),
        .Q(Q[3]),
        .R(RESET));
FDRE \STORAGE_CE_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[2]),
        .Q(Q[2]),
        .R(RESET));
FDRE \STORAGE_CE_Buffer_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[1]),
        .Q(Q[1]),
        .R(RESET));
FDRE \STORAGE_CE_Buffer_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[0]),
        .Q(Q[0]),
        .R(RESET));
VCC VCC
       (.P(\<const1> ));
endmodule

module data_mgtdata_mgt_STORAGE_COUNT_CONTROL
   (D,
    STORAGE_COUNT,
    O1,
    O2,
    O3,
    O4,
    O5,
    O6,
    stage_2_start_with_data_r,
    END_STORAGE,
    p_0_out,
    Q,
    stage_2_end_before_start_r,
    START_RX,
    I1,
    I2,
    storage_count_r0,
    user_clk);
  output [2:0]D;
  output [0:2]STORAGE_COUNT;
  output O1;
  output [3:0]O2;
  output O3;
  output [0:0]O4;
  output O5;
  output O6;
  input stage_2_start_with_data_r;
  input END_STORAGE;
  input [0:0]p_0_out;
  input [2:0]Q;
  input stage_2_end_before_start_r;
  input START_RX;
  input I1;
  input I2;
  input storage_count_r0;
  input user_clk;

  wire \<const0> ;
  wire \<const1> ;
  wire [2:0]D;
  wire END_STORAGE;
  wire I1;
  wire I2;
  wire O1;
  wire [3:0]O2;
  wire O3;
  wire [0:0]O4;
  wire O5;
  wire O6;
  wire [2:0]Q;
  wire START_RX;
  wire [0:2]STORAGE_COUNT;
  wire \n_0_storage_count_r[0]_i_1 ;
  wire \n_0_storage_count_r[0]_i_2 ;
  wire \n_0_storage_count_r[1]_i_1 ;
  wire \n_0_storage_count_r[2]_i_1 ;
  wire [0:0]p_0_out;
  wire stage_2_end_before_start_r;
  wire stage_2_start_with_data_r;
  wire storage_count_r0;
  wire user_clk;

LUT6 #(
    .INIT(64'h0001555555555555)) 
     EOF_N_Buffer_i_1
       (.I0(END_STORAGE),
        .I1(STORAGE_COUNT[1]),
        .I2(STORAGE_COUNT[2]),
        .I3(STORAGE_COUNT[0]),
        .I4(stage_2_start_with_data_r),
        .I5(stage_2_end_before_start_r),
        .O(O5));
(* SOFT_HLUTNM = "soft_lutpair21" *) 
   LUT3 #(
    .INIT(8'h01)) 
     FRAME_ERR_RESULT_Buffer_i_3
       (.I0(STORAGE_COUNT[1]),
        .I1(STORAGE_COUNT[2]),
        .I2(STORAGE_COUNT[0]),
        .O(O6));
GND GND
       (.G(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair23" *) 
   LUT2 #(
    .INIT(4'h1)) 
     \OUTPUT_SELECT_Buffer[14]_i_1 
       (.I0(STORAGE_COUNT[2]),
        .I1(STORAGE_COUNT[0]),
        .O(O1));
(* SOFT_HLUTNM = "soft_lutpair21" *) 
   LUT5 #(
    .INIT(32'h00000007)) 
     \OUTPUT_SELECT_Buffer[18]_i_1 
       (.I0(STORAGE_COUNT[1]),
        .I1(STORAGE_COUNT[2]),
        .I2(STORAGE_COUNT[0]),
        .I3(END_STORAGE),
        .I4(stage_2_start_with_data_r),
        .O(O4));
(* SOFT_HLUTNM = "soft_lutpair20" *) 
   LUT2 #(
    .INIT(4'h1)) 
     \OUTPUT_SELECT_Buffer[9]_i_2 
       (.I0(STORAGE_COUNT[0]),
        .I1(STORAGE_COUNT[1]),
        .O(O3));
LUT6 #(
    .INIT(64'hFEFEFEFEFEFEFEFF)) 
     \STORAGE_CE_Buffer[0]_i_1 
       (.I0(stage_2_start_with_data_r),
        .I1(END_STORAGE),
        .I2(p_0_out),
        .I3(STORAGE_COUNT[0]),
        .I4(STORAGE_COUNT[2]),
        .I5(STORAGE_COUNT[1]),
        .O(D[2]));
(* SOFT_HLUTNM = "soft_lutpair20" *) 
   LUT5 #(
    .INIT(32'hFEFEFEFF)) 
     \STORAGE_CE_Buffer[1]_i_1 
       (.I0(stage_2_start_with_data_r),
        .I1(END_STORAGE),
        .I2(p_0_out),
        .I3(STORAGE_COUNT[1]),
        .I4(STORAGE_COUNT[0]),
        .O(D[1]));
LUT6 #(
    .INIT(64'hFEFEFEFEFEFFFFFF)) 
     \STORAGE_CE_Buffer[2]_i_1 
       (.I0(stage_2_start_with_data_r),
        .I1(END_STORAGE),
        .I2(p_0_out),
        .I3(STORAGE_COUNT[1]),
        .I4(STORAGE_COUNT[2]),
        .I5(STORAGE_COUNT[0]),
        .O(D[0]));
(* SOFT_HLUTNM = "soft_lutpair22" *) 
   LUT2 #(
    .INIT(4'h9)) 
     \STORAGE_SELECT_Buffer[13]_i_1 
       (.I0(STORAGE_COUNT[2]),
        .I1(STORAGE_COUNT[1]),
        .O(O2[1]));
LUT1 #(
    .INIT(2'h1)) 
     \STORAGE_SELECT_Buffer[18]_i_1 
       (.I0(STORAGE_COUNT[1]),
        .O(O2[0]));
(* SOFT_HLUTNM = "soft_lutpair22" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \STORAGE_SELECT_Buffer[3]_i_1 
       (.I0(STORAGE_COUNT[1]),
        .I1(STORAGE_COUNT[2]),
        .O(O2[3]));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair23" *) 
   LUT1 #(
    .INIT(2'h1)) 
     \STORAGE_SELECT_Buffer[9]_i_1 
       (.I0(STORAGE_COUNT[2]),
        .O(O2[2]));
VCC VCC
       (.P(\<const1> ));
LUT6 #(
    .INIT(64'h00000000ABA80000)) 
     \storage_count_r[0]_i_1 
       (.I0(Q[2]),
        .I1(END_STORAGE),
        .I2(stage_2_start_with_data_r),
        .I3(\n_0_storage_count_r[0]_i_2 ),
        .I4(START_RX),
        .I5(I1),
        .O(\n_0_storage_count_r[0]_i_1 ));
LUT6 #(
    .INIT(64'h666778887888888E)) 
     \storage_count_r[0]_i_2 
       (.I0(STORAGE_COUNT[0]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(STORAGE_COUNT[2]),
        .I4(STORAGE_COUNT[1]),
        .I5(Q[1]),
        .O(\n_0_storage_count_r[0]_i_2 ));
LUT6 #(
    .INIT(64'h00000000A6666AAA)) 
     \storage_count_r[1]_i_1 
       (.I0(Q[1]),
        .I1(I2),
        .I2(STORAGE_COUNT[2]),
        .I3(Q[0]),
        .I4(STORAGE_COUNT[1]),
        .I5(storage_count_r0),
        .O(\n_0_storage_count_r[1]_i_1 ));
LUT6 #(
    .INIT(64'h00000000A9AA0000)) 
     \storage_count_r[2]_i_1 
       (.I0(Q[0]),
        .I1(END_STORAGE),
        .I2(stage_2_start_with_data_r),
        .I3(STORAGE_COUNT[2]),
        .I4(START_RX),
        .I5(I1),
        .O(\n_0_storage_count_r[2]_i_1 ));
FDRE \storage_count_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_storage_count_r[0]_i_1 ),
        .Q(STORAGE_COUNT[0]),
        .R(\<const0> ));
FDRE \storage_count_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_storage_count_r[1]_i_1 ),
        .Q(STORAGE_COUNT[1]),
        .R(\<const0> ));
FDRE \storage_count_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_storage_count_r[2]_i_1 ),
        .Q(STORAGE_COUNT[2]),
        .R(\<const0> ));
endmodule

module data_mgtdata_mgt_STORAGE_MUX
   (D,
    STORAGE_DATA,
    Q,
    I1,
    user_clk,
    I2,
    I3,
    I4,
    I5,
    I6,
    I7,
    I8,
    I9,
    I10,
    I11,
    I12,
    I13,
    I14,
    I15,
    I16,
    I17,
    I18,
    I19,
    I20,
    I21,
    I22,
    I23,
    I24,
    I25,
    I26,
    I27,
    I28,
    I29,
    I30,
    I31,
    I32,
    I33,
    I34,
    I35,
    I36,
    I37,
    I38,
    I39,
    I40,
    I41,
    I42,
    I43,
    I44,
    I45,
    I46,
    I47,
    I48,
    I49,
    I50,
    I51,
    I52,
    I53,
    I54,
    I55,
    I56,
    I57,
    I58,
    I59,
    I60,
    I61,
    I62,
    I63,
    I64);
  output [15:0]D;
  output [47:0]STORAGE_DATA;
  input [3:0]Q;
  input I1;
  input user_clk;
  input I2;
  input I3;
  input I4;
  input I5;
  input I6;
  input I7;
  input I8;
  input I9;
  input I10;
  input I11;
  input I12;
  input I13;
  input I14;
  input I15;
  input I16;
  input I17;
  input I18;
  input I19;
  input I20;
  input I21;
  input I22;
  input I23;
  input I24;
  input I25;
  input I26;
  input I27;
  input I28;
  input I29;
  input I30;
  input I31;
  input I32;
  input I33;
  input I34;
  input I35;
  input I36;
  input I37;
  input I38;
  input I39;
  input I40;
  input I41;
  input I42;
  input I43;
  input I44;
  input I45;
  input I46;
  input I47;
  input I48;
  input I49;
  input I50;
  input I51;
  input I52;
  input I53;
  input I54;
  input I55;
  input I56;
  input I57;
  input I58;
  input I59;
  input I60;
  input I61;
  input I62;
  input I63;
  input I64;

  wire \<const0> ;
  wire [15:0]D;
  wire I1;
  wire I10;
  wire I11;
  wire I12;
  wire I13;
  wire I14;
  wire I15;
  wire I16;
  wire I17;
  wire I18;
  wire I19;
  wire I2;
  wire I20;
  wire I21;
  wire I22;
  wire I23;
  wire I24;
  wire I25;
  wire I26;
  wire I27;
  wire I28;
  wire I29;
  wire I3;
  wire I30;
  wire I31;
  wire I32;
  wire I33;
  wire I34;
  wire I35;
  wire I36;
  wire I37;
  wire I38;
  wire I39;
  wire I4;
  wire I40;
  wire I41;
  wire I42;
  wire I43;
  wire I44;
  wire I45;
  wire I46;
  wire I47;
  wire I48;
  wire I49;
  wire I5;
  wire I50;
  wire I51;
  wire I52;
  wire I53;
  wire I54;
  wire I55;
  wire I56;
  wire I57;
  wire I58;
  wire I59;
  wire I6;
  wire I60;
  wire I61;
  wire I62;
  wire I63;
  wire I64;
  wire I7;
  wire I8;
  wire I9;
  wire [3:0]Q;
  wire [47:0]STORAGE_DATA;
  wire user_clk;

GND GND
       (.G(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[0] 
       (.C(user_clk),
        .CE(Q[3]),
        .D(I1),
        .Q(D[15]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[10] 
       (.C(user_clk),
        .CE(Q[3]),
        .D(I11),
        .Q(D[5]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[11] 
       (.C(user_clk),
        .CE(Q[3]),
        .D(I12),
        .Q(D[4]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[12] 
       (.C(user_clk),
        .CE(Q[3]),
        .D(I13),
        .Q(D[3]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[13] 
       (.C(user_clk),
        .CE(Q[3]),
        .D(I14),
        .Q(D[2]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[14] 
       (.C(user_clk),
        .CE(Q[3]),
        .D(I15),
        .Q(D[1]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[15] 
       (.C(user_clk),
        .CE(Q[3]),
        .D(I16),
        .Q(D[0]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[16] 
       (.C(user_clk),
        .CE(Q[2]),
        .D(I17),
        .Q(STORAGE_DATA[47]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[17] 
       (.C(user_clk),
        .CE(Q[2]),
        .D(I18),
        .Q(STORAGE_DATA[46]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[18] 
       (.C(user_clk),
        .CE(Q[2]),
        .D(I19),
        .Q(STORAGE_DATA[45]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[19] 
       (.C(user_clk),
        .CE(Q[2]),
        .D(I20),
        .Q(STORAGE_DATA[44]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[1] 
       (.C(user_clk),
        .CE(Q[3]),
        .D(I2),
        .Q(D[14]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[20] 
       (.C(user_clk),
        .CE(Q[2]),
        .D(I21),
        .Q(STORAGE_DATA[43]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[21] 
       (.C(user_clk),
        .CE(Q[2]),
        .D(I22),
        .Q(STORAGE_DATA[42]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[22] 
       (.C(user_clk),
        .CE(Q[2]),
        .D(I23),
        .Q(STORAGE_DATA[41]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[23] 
       (.C(user_clk),
        .CE(Q[2]),
        .D(I24),
        .Q(STORAGE_DATA[40]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[24] 
       (.C(user_clk),
        .CE(Q[2]),
        .D(I25),
        .Q(STORAGE_DATA[39]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[25] 
       (.C(user_clk),
        .CE(Q[2]),
        .D(I26),
        .Q(STORAGE_DATA[38]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[26] 
       (.C(user_clk),
        .CE(Q[2]),
        .D(I27),
        .Q(STORAGE_DATA[37]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[27] 
       (.C(user_clk),
        .CE(Q[2]),
        .D(I28),
        .Q(STORAGE_DATA[36]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[28] 
       (.C(user_clk),
        .CE(Q[2]),
        .D(I29),
        .Q(STORAGE_DATA[35]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[29] 
       (.C(user_clk),
        .CE(Q[2]),
        .D(I30),
        .Q(STORAGE_DATA[34]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[2] 
       (.C(user_clk),
        .CE(Q[3]),
        .D(I3),
        .Q(D[13]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[30] 
       (.C(user_clk),
        .CE(Q[2]),
        .D(I31),
        .Q(STORAGE_DATA[33]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[31] 
       (.C(user_clk),
        .CE(Q[2]),
        .D(I32),
        .Q(STORAGE_DATA[32]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[32] 
       (.C(user_clk),
        .CE(Q[1]),
        .D(I33),
        .Q(STORAGE_DATA[31]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[33] 
       (.C(user_clk),
        .CE(Q[1]),
        .D(I34),
        .Q(STORAGE_DATA[30]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[34] 
       (.C(user_clk),
        .CE(Q[1]),
        .D(I35),
        .Q(STORAGE_DATA[29]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[35] 
       (.C(user_clk),
        .CE(Q[1]),
        .D(I36),
        .Q(STORAGE_DATA[28]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[36] 
       (.C(user_clk),
        .CE(Q[1]),
        .D(I37),
        .Q(STORAGE_DATA[27]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[37] 
       (.C(user_clk),
        .CE(Q[1]),
        .D(I38),
        .Q(STORAGE_DATA[26]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[38] 
       (.C(user_clk),
        .CE(Q[1]),
        .D(I39),
        .Q(STORAGE_DATA[25]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[39] 
       (.C(user_clk),
        .CE(Q[1]),
        .D(I40),
        .Q(STORAGE_DATA[24]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[3] 
       (.C(user_clk),
        .CE(Q[3]),
        .D(I4),
        .Q(D[12]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[40] 
       (.C(user_clk),
        .CE(Q[1]),
        .D(I41),
        .Q(STORAGE_DATA[23]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[41] 
       (.C(user_clk),
        .CE(Q[1]),
        .D(I42),
        .Q(STORAGE_DATA[22]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[42] 
       (.C(user_clk),
        .CE(Q[1]),
        .D(I43),
        .Q(STORAGE_DATA[21]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[43] 
       (.C(user_clk),
        .CE(Q[1]),
        .D(I44),
        .Q(STORAGE_DATA[20]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[44] 
       (.C(user_clk),
        .CE(Q[1]),
        .D(I45),
        .Q(STORAGE_DATA[19]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[45] 
       (.C(user_clk),
        .CE(Q[1]),
        .D(I46),
        .Q(STORAGE_DATA[18]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[46] 
       (.C(user_clk),
        .CE(Q[1]),
        .D(I47),
        .Q(STORAGE_DATA[17]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[47] 
       (.C(user_clk),
        .CE(Q[1]),
        .D(I48),
        .Q(STORAGE_DATA[16]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[48] 
       (.C(user_clk),
        .CE(Q[0]),
        .D(I49),
        .Q(STORAGE_DATA[15]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[49] 
       (.C(user_clk),
        .CE(Q[0]),
        .D(I50),
        .Q(STORAGE_DATA[14]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[4] 
       (.C(user_clk),
        .CE(Q[3]),
        .D(I5),
        .Q(D[11]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[50] 
       (.C(user_clk),
        .CE(Q[0]),
        .D(I51),
        .Q(STORAGE_DATA[13]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[51] 
       (.C(user_clk),
        .CE(Q[0]),
        .D(I52),
        .Q(STORAGE_DATA[12]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[52] 
       (.C(user_clk),
        .CE(Q[0]),
        .D(I53),
        .Q(STORAGE_DATA[11]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[53] 
       (.C(user_clk),
        .CE(Q[0]),
        .D(I54),
        .Q(STORAGE_DATA[10]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[54] 
       (.C(user_clk),
        .CE(Q[0]),
        .D(I55),
        .Q(STORAGE_DATA[9]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[55] 
       (.C(user_clk),
        .CE(Q[0]),
        .D(I56),
        .Q(STORAGE_DATA[8]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[56] 
       (.C(user_clk),
        .CE(Q[0]),
        .D(I57),
        .Q(STORAGE_DATA[7]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[57] 
       (.C(user_clk),
        .CE(Q[0]),
        .D(I58),
        .Q(STORAGE_DATA[6]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[58] 
       (.C(user_clk),
        .CE(Q[0]),
        .D(I59),
        .Q(STORAGE_DATA[5]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[59] 
       (.C(user_clk),
        .CE(Q[0]),
        .D(I60),
        .Q(STORAGE_DATA[4]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[5] 
       (.C(user_clk),
        .CE(Q[3]),
        .D(I6),
        .Q(D[10]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[60] 
       (.C(user_clk),
        .CE(Q[0]),
        .D(I61),
        .Q(STORAGE_DATA[3]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[61] 
       (.C(user_clk),
        .CE(Q[0]),
        .D(I62),
        .Q(STORAGE_DATA[2]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[62] 
       (.C(user_clk),
        .CE(Q[0]),
        .D(I63),
        .Q(STORAGE_DATA[1]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[63] 
       (.C(user_clk),
        .CE(Q[0]),
        .D(I64),
        .Q(STORAGE_DATA[0]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[6] 
       (.C(user_clk),
        .CE(Q[3]),
        .D(I7),
        .Q(D[9]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[7] 
       (.C(user_clk),
        .CE(Q[3]),
        .D(I8),
        .Q(D[8]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[8] 
       (.C(user_clk),
        .CE(Q[3]),
        .D(I9),
        .Q(D[7]),
        .R(\<const0> ));
FDRE \STORAGE_DATA_Buffer_reg[9] 
       (.C(user_clk),
        .CE(Q[3]),
        .D(I10),
        .Q(D[6]),
        .R(\<const0> ));
endmodule

module data_mgtdata_mgt_STORAGE_SWITCH_CONTROL
   (Q,
    overwrite_c,
    D,
    user_clk);
  output [7:0]Q;
  input overwrite_c;
  input [5:0]D;
  input user_clk;

  wire \<const1> ;
  wire [5:0]D;
  wire [7:0]Q;
  wire overwrite_c;
  wire user_clk;

FDSE \STORAGE_SELECT_Buffer_reg[13] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[1]),
        .Q(Q[3]),
        .S(overwrite_c));
FDRE \STORAGE_SELECT_Buffer_reg[14] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[4]),
        .Q(Q[2]),
        .R(overwrite_c));
FDSE \STORAGE_SELECT_Buffer_reg[18] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[0]),
        .Q(Q[1]),
        .S(overwrite_c));
FDSE \STORAGE_SELECT_Buffer_reg[19] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[2]),
        .Q(Q[0]),
        .S(overwrite_c));
FDRE \STORAGE_SELECT_Buffer_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[5]),
        .Q(Q[7]),
        .R(overwrite_c));
FDRE \STORAGE_SELECT_Buffer_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[4]),
        .Q(Q[6]),
        .R(overwrite_c));
FDRE \STORAGE_SELECT_Buffer_reg[8] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[3]),
        .Q(Q[5]),
        .R(overwrite_c));
FDSE \STORAGE_SELECT_Buffer_reg[9] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(D[2]),
        .Q(Q[4]),
        .S(overwrite_c));
VCC VCC
       (.P(\<const1> ));
endmodule

module data_mgtdata_mgt_SYM_DEC_4BYTE
   (RX_NEG_Buffer,
    O1,
    O2,
    first_v_received_r,
    RX_CC,
    I13,
    S7_in,
    Q,
    S1_in,
    counter3_r0,
    counter4_r0,
    O5,
    O6,
    O7,
    O9,
    O11,
    O12,
    O13,
    O14,
    O3,
    O4,
    O10,
    O15,
    O20,
    user_clk,
    I5,
    I6,
    I7,
    I8,
    I9,
    O,
    GEN_SPA,
    ready_r,
    GT1_RXCHARISK_OUT,
    GT1_RXDATA_OUT,
    O8,
    GOT_V,
    LANE_UP,
    I18,
    I19,
    I20);
  output RX_NEG_Buffer;
  output O1;
  output O2;
  output first_v_received_r;
  output RX_CC;
  output [1:0]I13;
  output S7_in;
  output [1:0]Q;
  output S1_in;
  output counter3_r0;
  output counter4_r0;
  output [0:0]O5;
  output [7:0]O6;
  output O7;
  output [3:0]O9;
  output O11;
  output O12;
  output [1:0]O13;
  output O14;
  output [7:0]O3;
  output [7:0]O4;
  output [7:0]O10;
  output [7:0]O15;
  output [1:0]O20;
  input user_clk;
  input I5;
  input I6;
  input I7;
  input I8;
  input I9;
  input O;
  input GEN_SPA;
  input ready_r;
  input [3:0]GT1_RXCHARISK_OUT;
  input [31:0]GT1_RXDATA_OUT;
  input [3:0]O8;
  input GOT_V;
  input [0:0]LANE_UP;
  input [7:0]I18;
  input [7:0]I19;
  input [7:0]I20;

  wire \<const0> ;
  wire \<const1> ;
  wire GEN_SPA;
  wire GOT_V;
  wire [3:0]GT1_RXCHARISK_OUT;
  wire [31:0]GT1_RXDATA_OUT;
  wire [1:0]I13;
  wire [7:0]I18;
  wire [7:0]I19;
  wire [7:0]I20;
  wire I5;
  wire I6;
  wire I7;
  wire I8;
  wire I9;
  wire [0:0]LANE_UP;
  wire O;
  wire O1;
  wire [7:0]O10;
  wire O11;
  wire O12;
  wire [1:0]O13;
  wire O14;
  wire [7:0]O15;
  wire O2;
  wire [1:0]O20;
  wire [7:0]O3;
  wire [7:0]O4;
  wire [0:0]O5;
  wire [7:0]O6;
  wire O7;
  wire [3:0]O8;
  wire [3:0]O9;
  wire [1:0]Q;
  wire RX_CC;
  wire RX_NEG_Buffer;
  wire RX_NEG_Buffer0;
  wire RX_SP;
  wire RX_SPA;
  wire S1_in;
  wire S7_in;
  wire counter3_r0;
  wire counter4_r0;
  wire [7:0]data1;
  wire [7:0]data2;
  wire first_v_received_r;
  wire [0:7]got_a_d_r;
  wire n_0_GOT_V_Buffer_reg;
  wire n_0_RX_CC_Buffer_i_1__0;
  wire n_0_RX_CC_Buffer_i_2__0;
  wire n_0_RX_CC_Buffer_i_3__0;
  wire \n_0_RX_PE_DATA_V_Buffer[0]_i_1__0 ;
  wire \n_0_RX_PE_DATA_V_Buffer[1]_i_1__0 ;
  wire \n_0_RX_PE_DATA_V_Buffer_reg[0] ;
  wire \n_0_RX_PE_DATA_V_Buffer_reg[1] ;
  wire n_0_RX_SPA_Buffer_i_2__0;
  wire n_0_RX_SP_Buffer_i_2__0;
  wire n_0_bad_as_r_i_2;
  wire n_0_first_v_received_r_i_1__0;
  wire n_0_first_v_received_r_i_2__0;
  wire n_0_first_v_received_r_i_3__0;
  wire \n_0_rx_cc_r[1]_i_1__0 ;
  wire \n_0_rx_cc_r[3]_i_1__0 ;
  wire \n_0_rx_cc_r[5]_i_1__0 ;
  wire \n_0_rx_cc_r[7]_i_1__0 ;
  wire \n_0_rx_ecp_d_r[0]_i_1__0 ;
  wire \n_0_rx_ecp_d_r[1]_i_1__0 ;
  wire \n_0_rx_ecp_d_r[3]_i_1__0 ;
  wire \n_0_rx_ecp_d_r[4]_i_1__0 ;
  wire \n_0_rx_ecp_d_r[5]_i_1__0 ;
  wire \n_0_rx_ecp_d_r[7]_i_1__0 ;
  wire \n_0_rx_ecp_d_r_reg[3] ;
  wire \n_0_rx_ecp_d_r_reg[5] ;
  wire \n_0_rx_ecp_d_r_reg[7] ;
  wire \n_0_rx_pad_d_r[0]_i_1__0 ;
  wire \n_0_rx_pad_d_r[1]_i_1__0 ;
  wire \n_0_rx_pad_d_r[2]_i_1__0 ;
  wire \n_0_rx_pad_d_r[3]_i_1__0 ;
  wire \n_0_rx_pe_control_r_reg[2] ;
  wire \n_0_rx_pe_control_r_reg[3] ;
  wire \n_0_rx_scp_d_r[0]_i_1__0 ;
  wire \n_0_rx_scp_d_r[2]_i_1__0 ;
  wire \n_0_rx_scp_d_r[3]_i_1__0 ;
  wire \n_0_rx_scp_d_r[4]_i_1__0 ;
  wire \n_0_rx_scp_d_r[5]_i_1__0 ;
  wire \n_0_rx_scp_d_r[6]_i_1__0 ;
  wire \n_0_rx_scp_d_r[7]_i_1__0 ;
  wire \n_0_rx_scp_d_r_reg[3] ;
  wire \n_0_rx_scp_d_r_reg[7] ;
  wire \n_0_rx_sp_r[2]_i_1 ;
  wire \n_0_rx_sp_r[3]_i_1 ;
  wire \n_0_rx_sp_r[4]_i_1 ;
  wire \n_0_rx_sp_r[5]_i_1 ;
  wire \n_0_rx_sp_r[6]_i_1 ;
  wire \n_0_rx_sp_r[7]_i_1 ;
  wire \n_0_rx_spa_neg_d_r[0]_i_1__0 ;
  wire \n_0_rx_spa_neg_d_r[1]_i_1__0 ;
  wire \n_0_rx_spa_r[2]_i_1__0 ;
  wire \n_0_rx_spa_r[4]_i_1__0 ;
  wire \n_0_rx_spa_r[6]_i_1__0 ;
  wire \n_0_rx_v_d_r[0]_i_1__0 ;
  wire \n_0_rx_v_d_r[1]_i_1__0 ;
  wire \n_0_rx_v_d_r[2]_i_1__0 ;
  wire \n_0_rx_v_d_r[3]_i_1__0 ;
  wire \n_0_rx_v_d_r[4]_i_1__0 ;
  wire \n_0_rx_v_d_r[5]_i_1__0 ;
  wire \n_0_rx_v_d_r[6]_i_1__0 ;
  wire \n_0_rx_v_d_r[7]_i_1__0 ;
  wire \n_0_word_aligned_control_bits_r[0]_i_1__0 ;
  wire \n_0_word_aligned_control_bits_r[1]_i_1__0 ;
  wire \n_0_word_aligned_data_r[0]_i_1__0 ;
  wire \n_0_word_aligned_data_r[10]_i_1__0 ;
  wire \n_0_word_aligned_data_r[11]_i_1__0 ;
  wire \n_0_word_aligned_data_r[12]_i_1__0 ;
  wire \n_0_word_aligned_data_r[13]_i_1__0 ;
  wire \n_0_word_aligned_data_r[14]_i_1__0 ;
  wire \n_0_word_aligned_data_r[15]_i_1__0 ;
  wire \n_0_word_aligned_data_r[1]_i_1__0 ;
  wire \n_0_word_aligned_data_r[2]_i_1__0 ;
  wire \n_0_word_aligned_data_r[3]_i_1__0 ;
  wire \n_0_word_aligned_data_r[4]_i_1__0 ;
  wire \n_0_word_aligned_data_r[5]_i_1__0 ;
  wire \n_0_word_aligned_data_r[6]_i_1__0 ;
  wire \n_0_word_aligned_data_r[7]_i_1__0 ;
  wire \n_0_word_aligned_data_r[8]_i_1__0 ;
  wire \n_0_word_aligned_data_r[9]_i_1__0 ;
  wire p_0_in14_in;
  wire p_0_in21_in;
  wire p_0_in24_in;
  wire p_16_in;
  wire p_1_in22_in;
  wire p_1_in25_in;
  wire p_28_in;
  wire p_2_in26_in;
  wire [1:0]p_2_out;
  wire p_3_in;
  wire p_5_in29_in;
  wire p_6_in17_in;
  wire p_6_in30_in;
  wire p_7_in;
  wire [3:0]p_7_out;
  wire [1:0]p_8_out;
  wire [1:0]p_9_out;
  wire [2:1]previous_cycle_control_r;
  wire ready_r;
  wire [0:7]rx_cc_r;
  wire [0:3]rx_pad_d_r;
  wire [0:1]rx_sp_neg_d_r;
  wire [0:7]rx_sp_r;
  wire [0:1]rx_spa_neg_d_r;
  wire [0:7]rx_spa_r;
  wire [0:7]rx_v_d_r;
  wire std_bool11_out;
  wire std_bool13_in;
  wire std_bool13_out;
  wire std_bool16_in;
  wire std_bool1_out;
  wire user_clk;
  wire [0:3]word_aligned_control_bits_r;

LUT2 #(
    .INIT(4'h8)) 
     \DEFRAMED_DATA_V_Buffer[1]_i_1 
       (.I0(\n_0_RX_PE_DATA_V_Buffer_reg[0] ),
        .I1(I9),
        .O(I13[1]));
LUT2 #(
    .INIT(4'h8)) 
     \DEFRAMED_DATA_V_Buffer[3]_i_1 
       (.I0(\n_0_RX_PE_DATA_V_Buffer_reg[1] ),
        .I1(O),
        .O(I13[0]));
GND GND
       (.G(\<const0> ));
LUT3 #(
    .INIT(8'h80)) 
     \GOT_A_Buffer[0]_i_1__0 
       (.I0(got_a_d_r[0]),
        .I1(got_a_d_r[1]),
        .I2(GT1_RXCHARISK_OUT[0]),
        .O(p_7_out[3]));
LUT3 #(
    .INIT(8'h80)) 
     \GOT_A_Buffer[1]_i_1__0 
       (.I0(got_a_d_r[2]),
        .I1(got_a_d_r[3]),
        .I2(GT1_RXCHARISK_OUT[1]),
        .O(p_7_out[2]));
LUT3 #(
    .INIT(8'h80)) 
     \GOT_A_Buffer[2]_i_1__0 
       (.I0(got_a_d_r[4]),
        .I1(got_a_d_r[5]),
        .I2(GT1_RXCHARISK_OUT[2]),
        .O(p_7_out[1]));
LUT3 #(
    .INIT(8'h80)) 
     \GOT_A_Buffer[3]_i_1__0 
       (.I0(got_a_d_r[6]),
        .I1(got_a_d_r[7]),
        .I2(GT1_RXCHARISK_OUT[3]),
        .O(p_7_out[0]));
FDRE \GOT_A_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_7_out[3]),
        .Q(O9[3]),
        .R(\<const0> ));
FDRE \GOT_A_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_7_out[2]),
        .Q(O9[2]),
        .R(\<const0> ));
FDRE \GOT_A_Buffer_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_7_out[1]),
        .Q(O9[1]),
        .R(\<const0> ));
FDRE \GOT_A_Buffer_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_7_out[0]),
        .Q(O9[0]),
        .R(\<const0> ));
LUT4 #(
    .INIT(16'h8000)) 
     GOT_V_Buffer_i_1__0
       (.I0(n_0_first_v_received_r_i_2__0),
        .I1(n_0_first_v_received_r_i_3__0),
        .I2(rx_v_d_r[7]),
        .I3(rx_v_d_r[1]),
        .O(std_bool1_out));
FDRE GOT_V_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(std_bool1_out),
        .Q(n_0_GOT_V_Buffer_reg),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     RX_CC_Buffer_i_1__0
       (.I0(n_0_RX_CC_Buffer_i_2__0),
        .I1(\n_0_rx_pe_control_r_reg[3] ),
        .I2(\n_0_rx_pe_control_r_reg[2] ),
        .I3(n_0_RX_CC_Buffer_i_3__0),
        .I4(rx_cc_r[1]),
        .I5(rx_cc_r[6]),
        .O(n_0_RX_CC_Buffer_i_1__0));
(* SOFT_HLUTNM = "soft_lutpair139" *) 
   LUT2 #(
    .INIT(4'h8)) 
     RX_CC_Buffer_i_2__0
       (.I0(p_0_in21_in),
        .I1(p_1_in22_in),
        .O(n_0_RX_CC_Buffer_i_2__0));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     RX_CC_Buffer_i_3__0
       (.I0(rx_cc_r[0]),
        .I1(rx_cc_r[4]),
        .I2(rx_cc_r[2]),
        .I3(rx_cc_r[7]),
        .I4(rx_cc_r[5]),
        .I5(rx_cc_r[3]),
        .O(n_0_RX_CC_Buffer_i_3__0));
FDRE RX_CC_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_RX_CC_Buffer_i_1__0),
        .Q(RX_CC),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     \RX_ECP_Buffer[0]_i_1__0 
       (.I0(p_1_in22_in),
        .I1(p_0_in21_in),
        .I2(\n_0_rx_ecp_d_r_reg[3] ),
        .I3(p_6_in17_in),
        .I4(p_7_in),
        .I5(p_16_in),
        .O(p_9_out[1]));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     \RX_ECP_Buffer[1]_i_1__0 
       (.I0(\n_0_rx_pe_control_r_reg[2] ),
        .I1(\n_0_rx_pe_control_r_reg[3] ),
        .I2(\n_0_rx_ecp_d_r_reg[7] ),
        .I3(\n_0_rx_ecp_d_r_reg[5] ),
        .I4(p_3_in),
        .I5(p_0_in14_in),
        .O(p_9_out[0]));
FDRE \RX_ECP_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_9_out[1]),
        .Q(O13[1]),
        .R(\<const0> ));
FDRE \RX_ECP_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_9_out[0]),
        .Q(O13[0]),
        .R(\<const0> ));
LUT5 #(
    .INIT(32'h0000F888)) 
     RX_NEG_Buffer_i_1__0
       (.I0(rx_spa_neg_d_r[0]),
        .I1(rx_spa_neg_d_r[1]),
        .I2(rx_sp_neg_d_r[0]),
        .I3(rx_sp_neg_d_r[1]),
        .I4(p_0_in21_in),
        .O(RX_NEG_Buffer0));
FDRE RX_NEG_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(RX_NEG_Buffer0),
        .Q(RX_NEG_Buffer),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair140" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \RX_PAD_Buffer[0]_i_1__0 
       (.I0(p_1_in22_in),
        .I1(p_0_in21_in),
        .I2(rx_pad_d_r[0]),
        .I3(rx_pad_d_r[1]),
        .O(p_2_out[1]));
(* SOFT_HLUTNM = "soft_lutpair141" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \RX_PAD_Buffer[1]_i_1__0 
       (.I0(\n_0_rx_pe_control_r_reg[2] ),
        .I1(\n_0_rx_pe_control_r_reg[3] ),
        .I2(rx_pad_d_r[2]),
        .I3(rx_pad_d_r[3]),
        .O(p_2_out[0]));
FDRE \RX_PAD_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_2_out[1]),
        .Q(O20[1]),
        .R(\<const0> ));
FDRE \RX_PAD_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_2_out[0]),
        .Q(O20[0]),
        .R(\<const0> ));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair140" *) 
   LUT1 #(
    .INIT(2'h1)) 
     \RX_PE_DATA_V_Buffer[0]_i_1__0 
       (.I0(p_1_in22_in),
        .O(\n_0_RX_PE_DATA_V_Buffer[0]_i_1__0 ));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair141" *) 
   LUT1 #(
    .INIT(2'h1)) 
     \RX_PE_DATA_V_Buffer[1]_i_1__0 
       (.I0(\n_0_rx_pe_control_r_reg[2] ),
        .O(\n_0_RX_PE_DATA_V_Buffer[1]_i_1__0 ));
FDRE \RX_PE_DATA_V_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_RX_PE_DATA_V_Buffer[0]_i_1__0 ),
        .Q(\n_0_RX_PE_DATA_V_Buffer_reg[0] ),
        .R(\<const0> ));
FDRE \RX_PE_DATA_V_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_RX_PE_DATA_V_Buffer[1]_i_1__0 ),
        .Q(\n_0_RX_PE_DATA_V_Buffer_reg[1] ),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     \RX_SCP_Buffer[0]_i_1__0 
       (.I0(p_1_in22_in),
        .I1(p_0_in21_in),
        .I2(\n_0_rx_scp_d_r_reg[3] ),
        .I3(p_5_in29_in),
        .I4(p_6_in30_in),
        .I5(p_28_in),
        .O(p_8_out[1]));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     \RX_SCP_Buffer[1]_i_1__0 
       (.I0(\n_0_rx_pe_control_r_reg[2] ),
        .I1(\n_0_rx_pe_control_r_reg[3] ),
        .I2(\n_0_rx_scp_d_r_reg[7] ),
        .I3(p_1_in25_in),
        .I4(p_2_in26_in),
        .I5(p_0_in24_in),
        .O(p_8_out[0]));
FDRE \RX_SCP_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_8_out[1]),
        .Q(Q[1]),
        .R(\<const0> ));
FDRE \RX_SCP_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_8_out[0]),
        .Q(Q[0]),
        .R(\<const0> ));
LUT4 #(
    .INIT(16'h8000)) 
     RX_SPA_Buffer_i_1__0
       (.I0(n_0_first_v_received_r_i_2__0),
        .I1(n_0_RX_SPA_Buffer_i_2__0),
        .I2(rx_spa_r[7]),
        .I3(rx_spa_r[6]),
        .O(std_bool11_out));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     RX_SPA_Buffer_i_2__0
       (.I0(rx_spa_r[0]),
        .I1(rx_spa_r[1]),
        .I2(rx_spa_r[2]),
        .I3(rx_spa_r[5]),
        .I4(rx_spa_r[4]),
        .I5(rx_spa_r[3]),
        .O(n_0_RX_SPA_Buffer_i_2__0));
FDRE RX_SPA_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(std_bool11_out),
        .Q(RX_SPA),
        .R(\<const0> ));
LUT4 #(
    .INIT(16'h8000)) 
     RX_SP_Buffer_i_1__0
       (.I0(n_0_first_v_received_r_i_2__0),
        .I1(n_0_RX_SP_Buffer_i_2__0),
        .I2(rx_sp_r[7]),
        .I3(rx_sp_r[6]),
        .O(std_bool13_out));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     RX_SP_Buffer_i_2__0
       (.I0(rx_sp_r[0]),
        .I1(rx_sp_r[1]),
        .I2(rx_sp_r[2]),
        .I3(rx_sp_r[5]),
        .I4(rx_sp_r[4]),
        .I5(rx_sp_r[3]),
        .O(n_0_RX_SP_Buffer_i_2__0));
FDRE RX_SP_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(std_bool13_out),
        .Q(RX_SP),
        .R(\<const0> ));
VCC VCC
       (.P(\<const1> ));
LUT2 #(
    .INIT(4'h8)) 
     all_lanes_v_r_i_1
       (.I0(n_0_GOT_V_Buffer_reg),
        .I1(GOT_V),
        .O(O11));
LUT3 #(
    .INIT(8'hF6)) 
     bad_as_r_i_1
       (.I0(O8[0]),
        .I1(O9[0]),
        .I2(n_0_bad_as_r_i_2),
        .O(O7));
LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
     bad_as_r_i_2
       (.I0(O9[1]),
        .I1(O8[1]),
        .I2(O9[3]),
        .I3(O8[3]),
        .I4(O9[2]),
        .I5(O8[2]),
        .O(n_0_bad_as_r_i_2));
LUT2 #(
    .INIT(4'hB)) 
     \counter3_r_reg[2]_srl3_i_1__0 
       (.I0(RX_SPA),
        .I1(GEN_SPA),
        .O(counter3_r0));
LUT2 #(
    .INIT(4'hB)) 
     \counter4_r_reg[14]_srl15_i_1__0 
       (.I0(RX_SP),
        .I1(ready_r),
        .O(counter4_r0));
LUT1 #(
    .INIT(2'h1)) 
     data_after_start_muxcy_1_i_1
       (.I0(Q[1]),
        .O(S1_in));
LUT1 #(
    .INIT(2'h1)) 
     data_after_start_muxcy_3_i_1
       (.I0(Q[0]),
        .O(S7_in));
LUT6 #(
    .INIT(64'hFFFF000080000000)) 
     first_v_received_r_i_1__0
       (.I0(n_0_first_v_received_r_i_2__0),
        .I1(n_0_first_v_received_r_i_3__0),
        .I2(rx_v_d_r[7]),
        .I3(rx_v_d_r[1]),
        .I4(LANE_UP),
        .I5(first_v_received_r),
        .O(n_0_first_v_received_r_i_1__0));
(* SOFT_HLUTNM = "soft_lutpair139" *) 
   LUT4 #(
    .INIT(16'h0004)) 
     first_v_received_r_i_2__0
       (.I0(p_0_in21_in),
        .I1(p_1_in22_in),
        .I2(\n_0_rx_pe_control_r_reg[2] ),
        .I3(\n_0_rx_pe_control_r_reg[3] ),
        .O(n_0_first_v_received_r_i_2__0));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     first_v_received_r_i_3__0
       (.I0(rx_v_d_r[0]),
        .I1(rx_v_d_r[6]),
        .I2(rx_v_d_r[3]),
        .I3(rx_v_d_r[2]),
        .I4(rx_v_d_r[5]),
        .I5(rx_v_d_r[4]),
        .O(n_0_first_v_received_r_i_3__0));
FDRE #(
    .INIT(1'b0)) 
     first_v_received_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_first_v_received_r_i_1__0),
        .Q(first_v_received_r),
        .R(\<const0> ));
FDRE \got_a_d_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I20[7]),
        .Q(got_a_d_r[0]),
        .R(\<const0> ));
FDRE \got_a_d_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I20[6]),
        .Q(got_a_d_r[1]),
        .R(\<const0> ));
FDRE \got_a_d_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I20[5]),
        .Q(got_a_d_r[2]),
        .R(\<const0> ));
FDRE \got_a_d_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I20[4]),
        .Q(got_a_d_r[3]),
        .R(\<const0> ));
FDRE \got_a_d_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I20[3]),
        .Q(got_a_d_r[4]),
        .R(\<const0> ));
FDRE \got_a_d_r_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I20[2]),
        .Q(got_a_d_r[5]),
        .R(\<const0> ));
FDRE \got_a_d_r_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I20[1]),
        .Q(got_a_d_r[6]),
        .R(\<const0> ));
FDRE \got_a_d_r_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I20[0]),
        .Q(got_a_d_r[7]),
        .R(\<const0> ));
LUT2 #(
    .INIT(4'h1)) 
     in_frame_muxcy_1_i_1
       (.I0(O13[1]),
        .I1(Q[1]),
        .O(O14));
LUT2 #(
    .INIT(4'h1)) 
     in_frame_muxcy_3_i_1
       (.I0(O13[0]),
        .I1(Q[0]),
        .O(O12));
FDRE \left_align_select_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I5),
        .Q(O1),
        .R(\<const0> ));
FDRE \left_align_select_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I6),
        .Q(O2),
        .R(\<const0> ));
FDRE \previous_cycle_control_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXCHARISK_OUT[3]),
        .Q(O5),
        .R(\<const0> ));
FDRE \previous_cycle_control_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXCHARISK_OUT[2]),
        .Q(previous_cycle_control_r[1]),
        .R(\<const0> ));
FDRE \previous_cycle_control_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXCHARISK_OUT[1]),
        .Q(previous_cycle_control_r[2]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[24]),
        .Q(O6[0]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[10] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[18]),
        .Q(data2[2]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[11] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[19]),
        .Q(data2[3]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[12] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[20]),
        .Q(data2[4]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[13] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[21]),
        .Q(data2[5]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[14] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[22]),
        .Q(data2[6]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[15] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[23]),
        .Q(data2[7]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[16] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[8]),
        .Q(data1[0]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[17] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[9]),
        .Q(data1[1]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[18] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[10]),
        .Q(data1[2]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[19] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[11]),
        .Q(data1[3]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[25]),
        .Q(O6[1]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[20] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[12]),
        .Q(data1[4]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[21] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[13]),
        .Q(data1[5]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[22] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[14]),
        .Q(data1[6]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[23] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[15]),
        .Q(data1[7]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[26]),
        .Q(O6[2]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[27]),
        .Q(O6[3]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[28]),
        .Q(O6[4]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[29]),
        .Q(O6[5]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[30]),
        .Q(O6[6]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[31]),
        .Q(O6[7]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[8] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[16]),
        .Q(data2[0]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[9] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT1_RXDATA_OUT[17]),
        .Q(data2[1]),
        .R(\<const0> ));
LUT4 #(
    .INIT(16'h4000)) 
     \rx_cc_r[1]_i_1__0 
       (.I0(O15[3]),
        .I1(O15[2]),
        .I2(O15[1]),
        .I3(O15[0]),
        .O(\n_0_rx_cc_r[1]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair142" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_cc_r[3]_i_1__0 
       (.I0(O10[3]),
        .I1(O10[2]),
        .I2(O10[1]),
        .I3(O10[0]),
        .O(\n_0_rx_cc_r[3]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair144" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_cc_r[5]_i_1__0 
       (.I0(O4[3]),
        .I1(O4[2]),
        .I2(O4[1]),
        .I3(O4[0]),
        .O(\n_0_rx_cc_r[5]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair134" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_cc_r[7]_i_1__0 
       (.I0(O3[3]),
        .I1(O3[2]),
        .I2(O3[1]),
        .I3(O3[0]),
        .O(\n_0_rx_cc_r[7]_i_1__0 ));
FDRE \rx_cc_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_ecp_d_r[0]_i_1__0 ),
        .Q(rx_cc_r[0]),
        .R(\<const0> ));
FDRE \rx_cc_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_cc_r[1]_i_1__0 ),
        .Q(rx_cc_r[1]),
        .R(\<const0> ));
FDRE \rx_cc_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[2]_i_1__0 ),
        .Q(rx_cc_r[2]),
        .R(\<const0> ));
FDRE \rx_cc_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_cc_r[3]_i_1__0 ),
        .Q(rx_cc_r[3]),
        .R(\<const0> ));
FDRE \rx_cc_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_ecp_d_r[4]_i_1__0 ),
        .Q(rx_cc_r[4]),
        .R(\<const0> ));
FDRE \rx_cc_r_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_cc_r[5]_i_1__0 ),
        .Q(rx_cc_r[5]),
        .R(\<const0> ));
FDRE \rx_cc_r_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[6]_i_1__0 ),
        .Q(rx_cc_r[6]),
        .R(\<const0> ));
FDRE \rx_cc_r_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_cc_r[7]_i_1__0 ),
        .Q(rx_cc_r[7]),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair146" *) 
   LUT4 #(
    .INIT(16'h8000)) 
     \rx_ecp_d_r[0]_i_1__0 
       (.I0(O15[5]),
        .I1(O15[4]),
        .I2(O15[6]),
        .I3(O15[7]),
        .O(\n_0_rx_ecp_d_r[0]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair135" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_ecp_d_r[1]_i_1__0 
       (.I0(O15[1]),
        .I1(O15[0]),
        .I2(O15[2]),
        .I3(O15[3]),
        .O(\n_0_rx_ecp_d_r[1]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair143" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_ecp_d_r[3]_i_1__0 
       (.I0(O10[0]),
        .I1(O10[1]),
        .I2(O10[2]),
        .I3(O10[3]),
        .O(\n_0_rx_ecp_d_r[3]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair152" *) 
   LUT4 #(
    .INIT(16'h8000)) 
     \rx_ecp_d_r[4]_i_1__0 
       (.I0(O4[5]),
        .I1(O4[4]),
        .I2(O4[6]),
        .I3(O4[7]),
        .O(\n_0_rx_ecp_d_r[4]_i_1__0 ));
LUT4 #(
    .INIT(16'h4000)) 
     \rx_ecp_d_r[5]_i_1__0 
       (.I0(O4[1]),
        .I1(O4[0]),
        .I2(O4[2]),
        .I3(O4[3]),
        .O(\n_0_rx_ecp_d_r[5]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair154" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_ecp_d_r[7]_i_1__0 
       (.I0(O3[0]),
        .I1(O3[1]),
        .I2(O3[2]),
        .I3(O3[3]),
        .O(\n_0_rx_ecp_d_r[7]_i_1__0 ));
FDRE \rx_ecp_d_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_ecp_d_r[0]_i_1__0 ),
        .Q(p_16_in),
        .R(\<const0> ));
FDRE \rx_ecp_d_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_ecp_d_r[1]_i_1__0 ),
        .Q(p_6_in17_in),
        .R(\<const0> ));
FDRE \rx_ecp_d_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[2]_i_1__0 ),
        .Q(p_7_in),
        .R(\<const0> ));
FDRE \rx_ecp_d_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_ecp_d_r[3]_i_1__0 ),
        .Q(\n_0_rx_ecp_d_r_reg[3] ),
        .R(\<const0> ));
FDRE \rx_ecp_d_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_ecp_d_r[4]_i_1__0 ),
        .Q(p_0_in14_in),
        .R(\<const0> ));
FDRE \rx_ecp_d_r_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_ecp_d_r[5]_i_1__0 ),
        .Q(\n_0_rx_ecp_d_r_reg[5] ),
        .R(\<const0> ));
FDRE \rx_ecp_d_r_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[6]_i_1__0 ),
        .Q(p_3_in),
        .R(\<const0> ));
FDRE \rx_ecp_d_r_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_ecp_d_r[7]_i_1__0 ),
        .Q(\n_0_rx_ecp_d_r_reg[7] ),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair153" *) 
   LUT4 #(
    .INIT(16'h0040)) 
     \rx_pad_d_r[0]_i_1__0 
       (.I0(O10[6]),
        .I1(O10[7]),
        .I2(O10[4]),
        .I3(O10[5]),
        .O(\n_0_rx_pad_d_r[0]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair138" *) 
   LUT4 #(
    .INIT(16'h1000)) 
     \rx_pad_d_r[1]_i_1__0 
       (.I0(O10[1]),
        .I1(O10[0]),
        .I2(O10[2]),
        .I3(O10[3]),
        .O(\n_0_rx_pad_d_r[1]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair151" *) 
   LUT4 #(
    .INIT(16'h0040)) 
     \rx_pad_d_r[2]_i_1__0 
       (.I0(O3[6]),
        .I1(O3[7]),
        .I2(O3[4]),
        .I3(O3[5]),
        .O(\n_0_rx_pad_d_r[2]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair149" *) 
   LUT4 #(
    .INIT(16'h1000)) 
     \rx_pad_d_r[3]_i_1__0 
       (.I0(O3[1]),
        .I1(O3[0]),
        .I2(O3[2]),
        .I3(O3[3]),
        .O(\n_0_rx_pad_d_r[3]_i_1__0 ));
FDRE \rx_pad_d_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_pad_d_r[0]_i_1__0 ),
        .Q(rx_pad_d_r[0]),
        .R(\<const0> ));
FDRE \rx_pad_d_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_pad_d_r[1]_i_1__0 ),
        .Q(rx_pad_d_r[1]),
        .R(\<const0> ));
FDRE \rx_pad_d_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_pad_d_r[2]_i_1__0 ),
        .Q(rx_pad_d_r[2]),
        .R(\<const0> ));
FDRE \rx_pad_d_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_pad_d_r[3]_i_1__0 ),
        .Q(rx_pad_d_r[3]),
        .R(\<const0> ));
FDRE \rx_pe_control_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(word_aligned_control_bits_r[0]),
        .Q(p_1_in22_in),
        .R(\<const0> ));
FDRE \rx_pe_control_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(word_aligned_control_bits_r[1]),
        .Q(p_0_in21_in),
        .R(\<const0> ));
FDRE \rx_pe_control_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(word_aligned_control_bits_r[2]),
        .Q(\n_0_rx_pe_control_r_reg[2] ),
        .R(\<const0> ));
FDRE \rx_pe_control_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(word_aligned_control_bits_r[3]),
        .Q(\n_0_rx_pe_control_r_reg[3] ),
        .R(\<const0> ));
LUT4 #(
    .INIT(16'h0040)) 
     \rx_scp_d_r[0]_i_1__0 
       (.I0(O15[7]),
        .I1(O15[6]),
        .I2(O15[4]),
        .I3(O15[5]),
        .O(\n_0_rx_scp_d_r[0]_i_1__0 ));
LUT4 #(
    .INIT(16'h8000)) 
     \rx_scp_d_r[2]_i_1__0 
       (.I0(O10[5]),
        .I1(O10[4]),
        .I2(O10[6]),
        .I3(O10[7]),
        .O(\n_0_rx_scp_d_r[2]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair145" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_scp_d_r[3]_i_1__0 
       (.I0(O10[2]),
        .I1(O10[3]),
        .I2(O10[1]),
        .I3(O10[0]),
        .O(\n_0_rx_scp_d_r[3]_i_1__0 ));
LUT4 #(
    .INIT(16'h0040)) 
     \rx_scp_d_r[4]_i_1__0 
       (.I0(O4[7]),
        .I1(O4[6]),
        .I2(O4[4]),
        .I3(O4[5]),
        .O(\n_0_rx_scp_d_r[4]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair150" *) 
   LUT4 #(
    .INIT(16'h1000)) 
     \rx_scp_d_r[5]_i_1__0 
       (.I0(O4[1]),
        .I1(O4[0]),
        .I2(O4[2]),
        .I3(O4[3]),
        .O(\n_0_rx_scp_d_r[5]_i_1__0 ));
LUT4 #(
    .INIT(16'h8000)) 
     \rx_scp_d_r[6]_i_1__0 
       (.I0(O3[5]),
        .I1(O3[4]),
        .I2(O3[6]),
        .I3(O3[7]),
        .O(\n_0_rx_scp_d_r[6]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair154" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_scp_d_r[7]_i_1__0 
       (.I0(O3[2]),
        .I1(O3[3]),
        .I2(O3[1]),
        .I3(O3[0]),
        .O(\n_0_rx_scp_d_r[7]_i_1__0 ));
FDRE \rx_scp_d_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[0]_i_1__0 ),
        .Q(p_28_in),
        .R(\<const0> ));
FDRE \rx_scp_d_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[1]_i_1__0 ),
        .Q(p_5_in29_in),
        .R(\<const0> ));
FDRE \rx_scp_d_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[2]_i_1__0 ),
        .Q(p_6_in30_in),
        .R(\<const0> ));
FDRE \rx_scp_d_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[3]_i_1__0 ),
        .Q(\n_0_rx_scp_d_r_reg[3] ),
        .R(\<const0> ));
FDRE \rx_scp_d_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[4]_i_1__0 ),
        .Q(p_0_in24_in),
        .R(\<const0> ));
FDRE \rx_scp_d_r_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[5]_i_1__0 ),
        .Q(p_1_in25_in),
        .R(\<const0> ));
FDRE \rx_scp_d_r_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[6]_i_1__0 ),
        .Q(p_2_in26_in),
        .R(\<const0> ));
FDRE \rx_scp_d_r_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[7]_i_1__0 ),
        .Q(\n_0_rx_scp_d_r_reg[7] ),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair137" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_sp_neg_d_r[0]_i_1__0 
       (.I0(O10[6]),
        .I1(O10[7]),
        .I2(O10[5]),
        .I3(O10[4]),
        .O(std_bool16_in));
(* SOFT_HLUTNM = "soft_lutpair142" *) 
   LUT4 #(
    .INIT(16'h0040)) 
     \rx_sp_neg_d_r[1]_i_1__0 
       (.I0(O10[3]),
        .I1(O10[2]),
        .I2(O10[0]),
        .I3(O10[1]),
        .O(std_bool13_in));
FDRE \rx_sp_neg_d_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(std_bool16_in),
        .Q(rx_sp_neg_d_r[0]),
        .R(\<const0> ));
FDRE \rx_sp_neg_d_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(std_bool13_in),
        .Q(rx_sp_neg_d_r[1]),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair136" *) 
   LUT4 #(
    .INIT(16'h2004)) 
     \rx_sp_r[2]_i_1 
       (.I0(O10[5]),
        .I1(O10[6]),
        .I2(O10[4]),
        .I3(O10[7]),
        .O(\n_0_rx_sp_r[2]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair138" *) 
   LUT4 #(
    .INIT(16'h1008)) 
     \rx_sp_r[3]_i_1 
       (.I0(O10[3]),
        .I1(O10[1]),
        .I2(O10[2]),
        .I3(O10[0]),
        .O(\n_0_rx_sp_r[3]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair148" *) 
   LUT4 #(
    .INIT(16'h0810)) 
     \rx_sp_r[4]_i_1 
       (.I0(O4[7]),
        .I1(O4[5]),
        .I2(O4[6]),
        .I3(O4[4]),
        .O(\n_0_rx_sp_r[4]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair144" *) 
   LUT4 #(
    .INIT(16'h0420)) 
     \rx_sp_r[5]_i_1 
       (.I0(O4[3]),
        .I1(O4[2]),
        .I2(O4[1]),
        .I3(O4[0]),
        .O(\n_0_rx_sp_r[5]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair147" *) 
   LUT4 #(
    .INIT(16'h0810)) 
     \rx_sp_r[6]_i_1 
       (.I0(O3[7]),
        .I1(O3[5]),
        .I2(O3[6]),
        .I3(O3[4]),
        .O(\n_0_rx_sp_r[6]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair134" *) 
   LUT4 #(
    .INIT(16'h0420)) 
     \rx_sp_r[7]_i_1 
       (.I0(O3[3]),
        .I1(O3[2]),
        .I2(O3[1]),
        .I3(O3[0]),
        .O(\n_0_rx_sp_r[7]_i_1 ));
FDRE \rx_sp_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[0]_i_1__0 ),
        .Q(rx_sp_r[0]),
        .R(\<const0> ));
FDRE \rx_sp_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[1]_i_1__0 ),
        .Q(rx_sp_r[1]),
        .R(\<const0> ));
FDRE \rx_sp_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_sp_r[2]_i_1 ),
        .Q(rx_sp_r[2]),
        .R(\<const0> ));
FDRE \rx_sp_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_sp_r[3]_i_1 ),
        .Q(rx_sp_r[3]),
        .R(\<const0> ));
FDRE \rx_sp_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_sp_r[4]_i_1 ),
        .Q(rx_sp_r[4]),
        .R(\<const0> ));
FDRE \rx_sp_r_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_sp_r[5]_i_1 ),
        .Q(rx_sp_r[5]),
        .R(\<const0> ));
FDRE \rx_sp_r_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_sp_r[6]_i_1 ),
        .Q(rx_sp_r[6]),
        .R(\<const0> ));
FDRE \rx_sp_r_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_sp_r[7]_i_1 ),
        .Q(rx_sp_r[7]),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair137" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_spa_neg_d_r[0]_i_1__0 
       (.I0(O10[5]),
        .I1(O10[4]),
        .I2(O10[6]),
        .I3(O10[7]),
        .O(\n_0_rx_spa_neg_d_r[0]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair145" *) 
   LUT4 #(
    .INIT(16'h1000)) 
     \rx_spa_neg_d_r[1]_i_1__0 
       (.I0(O10[2]),
        .I1(O10[3]),
        .I2(O10[1]),
        .I3(O10[0]),
        .O(\n_0_rx_spa_neg_d_r[1]_i_1__0 ));
FDRE \rx_spa_neg_d_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_spa_neg_d_r[0]_i_1__0 ),
        .Q(rx_spa_neg_d_r[0]),
        .R(\<const0> ));
FDRE \rx_spa_neg_d_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_spa_neg_d_r[1]_i_1__0 ),
        .Q(rx_spa_neg_d_r[1]),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair136" *) 
   LUT4 #(
    .INIT(16'h0010)) 
     \rx_spa_r[2]_i_1__0 
       (.I0(O10[6]),
        .I1(O10[7]),
        .I2(O10[5]),
        .I3(O10[4]),
        .O(\n_0_rx_spa_r[2]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair148" *) 
   LUT4 #(
    .INIT(16'h0010)) 
     \rx_spa_r[4]_i_1__0 
       (.I0(O4[6]),
        .I1(O4[7]),
        .I2(O4[5]),
        .I3(O4[4]),
        .O(\n_0_rx_spa_r[4]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair147" *) 
   LUT4 #(
    .INIT(16'h0010)) 
     \rx_spa_r[6]_i_1__0 
       (.I0(O3[6]),
        .I1(O3[7]),
        .I2(O3[5]),
        .I3(O3[4]),
        .O(\n_0_rx_spa_r[6]_i_1__0 ));
FDRE \rx_spa_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[0]_i_1__0 ),
        .Q(rx_spa_r[0]),
        .R(\<const0> ));
FDRE \rx_spa_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[1]_i_1__0 ),
        .Q(rx_spa_r[1]),
        .R(\<const0> ));
FDRE \rx_spa_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_spa_r[2]_i_1__0 ),
        .Q(rx_spa_r[2]),
        .R(\<const0> ));
FDRE \rx_spa_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_pad_d_r[1]_i_1__0 ),
        .Q(rx_spa_r[3]),
        .R(\<const0> ));
FDRE \rx_spa_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_spa_r[4]_i_1__0 ),
        .Q(rx_spa_r[4]),
        .R(\<const0> ));
FDRE \rx_spa_r_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[5]_i_1__0 ),
        .Q(rx_spa_r[5]),
        .R(\<const0> ));
FDRE \rx_spa_r_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_spa_r[6]_i_1__0 ),
        .Q(rx_spa_r[6]),
        .R(\<const0> ));
FDRE \rx_spa_r_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_pad_d_r[3]_i_1__0 ),
        .Q(rx_spa_r[7]),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair146" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_v_d_r[0]_i_1__0 
       (.I0(O15[6]),
        .I1(O15[7]),
        .I2(O15[5]),
        .I3(O15[4]),
        .O(\n_0_rx_v_d_r[0]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair135" *) 
   LUT4 #(
    .INIT(16'h1000)) 
     \rx_v_d_r[1]_i_1__0 
       (.I0(O15[1]),
        .I1(O15[0]),
        .I2(O15[2]),
        .I3(O15[3]),
        .O(\n_0_rx_v_d_r[1]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair153" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_v_d_r[2]_i_1__0 
       (.I0(O10[4]),
        .I1(O10[5]),
        .I2(O10[6]),
        .I3(O10[7]),
        .O(\n_0_rx_v_d_r[2]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair143" *) 
   LUT4 #(
    .INIT(16'h0004)) 
     \rx_v_d_r[3]_i_1__0 
       (.I0(O10[2]),
        .I1(O10[3]),
        .I2(O10[1]),
        .I3(O10[0]),
        .O(\n_0_rx_v_d_r[3]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair152" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_v_d_r[4]_i_1__0 
       (.I0(O4[4]),
        .I1(O4[5]),
        .I2(O4[6]),
        .I3(O4[7]),
        .O(\n_0_rx_v_d_r[4]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair150" *) 
   LUT4 #(
    .INIT(16'h0004)) 
     \rx_v_d_r[5]_i_1__0 
       (.I0(O4[2]),
        .I1(O4[3]),
        .I2(O4[1]),
        .I3(O4[0]),
        .O(\n_0_rx_v_d_r[5]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair151" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_v_d_r[6]_i_1__0 
       (.I0(O3[4]),
        .I1(O3[5]),
        .I2(O3[6]),
        .I3(O3[7]),
        .O(\n_0_rx_v_d_r[6]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair149" *) 
   LUT4 #(
    .INIT(16'h0004)) 
     \rx_v_d_r[7]_i_1__0 
       (.I0(O3[2]),
        .I1(O3[3]),
        .I2(O3[1]),
        .I3(O3[0]),
        .O(\n_0_rx_v_d_r[7]_i_1__0 ));
FDRE \rx_v_d_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[0]_i_1__0 ),
        .Q(rx_v_d_r[0]),
        .R(\<const0> ));
FDRE \rx_v_d_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[1]_i_1__0 ),
        .Q(rx_v_d_r[1]),
        .R(\<const0> ));
FDRE \rx_v_d_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[2]_i_1__0 ),
        .Q(rx_v_d_r[2]),
        .R(\<const0> ));
FDRE \rx_v_d_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[3]_i_1__0 ),
        .Q(rx_v_d_r[3]),
        .R(\<const0> ));
FDRE \rx_v_d_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[4]_i_1__0 ),
        .Q(rx_v_d_r[4]),
        .R(\<const0> ));
FDRE \rx_v_d_r_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[5]_i_1__0 ),
        .Q(rx_v_d_r[5]),
        .R(\<const0> ));
FDRE \rx_v_d_r_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[6]_i_1__0 ),
        .Q(rx_v_d_r[6]),
        .R(\<const0> ));
FDRE \rx_v_d_r_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[7]_i_1__0 ),
        .Q(rx_v_d_r[7]),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_control_bits_r[0]_i_1__0 
       (.I0(O5),
        .I1(previous_cycle_control_r[2]),
        .I2(O2),
        .I3(previous_cycle_control_r[1]),
        .I4(O1),
        .I5(GT1_RXCHARISK_OUT[0]),
        .O(\n_0_word_aligned_control_bits_r[0]_i_1__0 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_control_bits_r[1]_i_1__0 
       (.I0(GT1_RXCHARISK_OUT[0]),
        .I1(previous_cycle_control_r[1]),
        .I2(O2),
        .I3(O5),
        .I4(O1),
        .I5(GT1_RXCHARISK_OUT[1]),
        .O(\n_0_word_aligned_control_bits_r[1]_i_1__0 ));
FDRE \word_aligned_control_bits_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_control_bits_r[0]_i_1__0 ),
        .Q(word_aligned_control_bits_r[0]),
        .R(\<const0> ));
FDRE \word_aligned_control_bits_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_control_bits_r[1]_i_1__0 ),
        .Q(word_aligned_control_bits_r[1]),
        .R(\<const0> ));
FDRE \word_aligned_control_bits_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I8),
        .Q(word_aligned_control_bits_r[2]),
        .R(\<const0> ));
FDRE \word_aligned_control_bits_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I7),
        .Q(word_aligned_control_bits_r[3]),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[0]_i_1__0 
       (.I0(O6[7]),
        .I1(data2[7]),
        .I2(O1),
        .I3(data1[7]),
        .I4(O2),
        .I5(GT1_RXDATA_OUT[7]),
        .O(\n_0_word_aligned_data_r[0]_i_1__0 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[10]_i_1__0 
       (.I0(GT1_RXDATA_OUT[5]),
        .I1(O6[5]),
        .I2(O1),
        .I3(data2[5]),
        .I4(O2),
        .I5(GT1_RXDATA_OUT[13]),
        .O(\n_0_word_aligned_data_r[10]_i_1__0 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[11]_i_1__0 
       (.I0(GT1_RXDATA_OUT[4]),
        .I1(O6[4]),
        .I2(O1),
        .I3(data2[4]),
        .I4(O2),
        .I5(GT1_RXDATA_OUT[12]),
        .O(\n_0_word_aligned_data_r[11]_i_1__0 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[12]_i_1__0 
       (.I0(GT1_RXDATA_OUT[3]),
        .I1(O6[3]),
        .I2(O1),
        .I3(data2[3]),
        .I4(O2),
        .I5(GT1_RXDATA_OUT[11]),
        .O(\n_0_word_aligned_data_r[12]_i_1__0 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[13]_i_1__0 
       (.I0(GT1_RXDATA_OUT[2]),
        .I1(O6[2]),
        .I2(O1),
        .I3(data2[2]),
        .I4(O2),
        .I5(GT1_RXDATA_OUT[10]),
        .O(\n_0_word_aligned_data_r[13]_i_1__0 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[14]_i_1__0 
       (.I0(GT1_RXDATA_OUT[1]),
        .I1(O6[1]),
        .I2(O1),
        .I3(data2[1]),
        .I4(O2),
        .I5(GT1_RXDATA_OUT[9]),
        .O(\n_0_word_aligned_data_r[14]_i_1__0 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[15]_i_1__0 
       (.I0(GT1_RXDATA_OUT[0]),
        .I1(O6[0]),
        .I2(O1),
        .I3(data2[0]),
        .I4(O2),
        .I5(GT1_RXDATA_OUT[8]),
        .O(\n_0_word_aligned_data_r[15]_i_1__0 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[1]_i_1__0 
       (.I0(O6[6]),
        .I1(data2[6]),
        .I2(O1),
        .I3(data1[6]),
        .I4(O2),
        .I5(GT1_RXDATA_OUT[6]),
        .O(\n_0_word_aligned_data_r[1]_i_1__0 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[2]_i_1__0 
       (.I0(O6[5]),
        .I1(data2[5]),
        .I2(O1),
        .I3(data1[5]),
        .I4(O2),
        .I5(GT1_RXDATA_OUT[5]),
        .O(\n_0_word_aligned_data_r[2]_i_1__0 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[3]_i_1__0 
       (.I0(O6[4]),
        .I1(data2[4]),
        .I2(O1),
        .I3(data1[4]),
        .I4(O2),
        .I5(GT1_RXDATA_OUT[4]),
        .O(\n_0_word_aligned_data_r[3]_i_1__0 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[4]_i_1__0 
       (.I0(O6[3]),
        .I1(data2[3]),
        .I2(O1),
        .I3(data1[3]),
        .I4(O2),
        .I5(GT1_RXDATA_OUT[3]),
        .O(\n_0_word_aligned_data_r[4]_i_1__0 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[5]_i_1__0 
       (.I0(O6[2]),
        .I1(data2[2]),
        .I2(O1),
        .I3(data1[2]),
        .I4(O2),
        .I5(GT1_RXDATA_OUT[2]),
        .O(\n_0_word_aligned_data_r[5]_i_1__0 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[6]_i_1__0 
       (.I0(O6[1]),
        .I1(data2[1]),
        .I2(O1),
        .I3(data1[1]),
        .I4(O2),
        .I5(GT1_RXDATA_OUT[1]),
        .O(\n_0_word_aligned_data_r[6]_i_1__0 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[7]_i_1__0 
       (.I0(O6[0]),
        .I1(data2[0]),
        .I2(O1),
        .I3(data1[0]),
        .I4(O2),
        .I5(GT1_RXDATA_OUT[0]),
        .O(\n_0_word_aligned_data_r[7]_i_1__0 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[8]_i_1__0 
       (.I0(GT1_RXDATA_OUT[7]),
        .I1(O6[7]),
        .I2(O1),
        .I3(data2[7]),
        .I4(O2),
        .I5(GT1_RXDATA_OUT[15]),
        .O(\n_0_word_aligned_data_r[8]_i_1__0 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[9]_i_1__0 
       (.I0(GT1_RXDATA_OUT[6]),
        .I1(O6[6]),
        .I2(O1),
        .I3(data2[6]),
        .I4(O2),
        .I5(GT1_RXDATA_OUT[14]),
        .O(\n_0_word_aligned_data_r[9]_i_1__0 ));
FDRE \word_aligned_data_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[0]_i_1__0 ),
        .Q(O15[7]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[10] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[10]_i_1__0 ),
        .Q(O10[5]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[11] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[11]_i_1__0 ),
        .Q(O10[4]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[12] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[12]_i_1__0 ),
        .Q(O10[3]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[13] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[13]_i_1__0 ),
        .Q(O10[2]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[14] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[14]_i_1__0 ),
        .Q(O10[1]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[15] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[15]_i_1__0 ),
        .Q(O10[0]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[16] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I19[7]),
        .Q(O4[7]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[17] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I19[6]),
        .Q(O4[6]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[18] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I19[5]),
        .Q(O4[5]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[19] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I19[4]),
        .Q(O4[4]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[1]_i_1__0 ),
        .Q(O15[6]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[20] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I19[3]),
        .Q(O4[3]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[21] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I19[2]),
        .Q(O4[2]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[22] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I19[1]),
        .Q(O4[1]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[23] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I19[0]),
        .Q(O4[0]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[24] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I18[7]),
        .Q(O3[7]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[25] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I18[6]),
        .Q(O3[6]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[26] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I18[5]),
        .Q(O3[5]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[27] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I18[4]),
        .Q(O3[4]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[28] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I18[3]),
        .Q(O3[3]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[29] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I18[2]),
        .Q(O3[2]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[2]_i_1__0 ),
        .Q(O15[5]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[30] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I18[1]),
        .Q(O3[1]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[31] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I18[0]),
        .Q(O3[0]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[3]_i_1__0 ),
        .Q(O15[4]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[4]_i_1__0 ),
        .Q(O15[3]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[5]_i_1__0 ),
        .Q(O15[2]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[6]_i_1__0 ),
        .Q(O15[1]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[7]_i_1__0 ),
        .Q(O15[0]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[8] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[8]_i_1__0 ),
        .Q(O10[7]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[9] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[9]_i_1__0 ),
        .Q(O10[6]),
        .R(\<const0> ));
endmodule

(* ORIG_REF_NAME = "data_mgt_SYM_DEC_4BYTE" *) 
module data_mgtdata_mgt_SYM_DEC_4BYTE_3
   (RX_NEG_Buffer,
    O1,
    O2,
    first_v_received_r,
    GOT_V,
    RX_CC,
    O3,
    I13,
    S4_in,
    O4,
    S,
    counter3_r0,
    counter4_r0,
    O6,
    O7,
    good_as_r0,
    O8,
    O10,
    O11,
    O12,
    O5,
    O9,
    O13,
    O14,
    user_clk,
    I2,
    I3,
    I4,
    I5,
    Q,
    CI,
    I6,
    GEN_SPA,
    ready_r,
    GT0_RXCHARISK_OUT,
    GT0_RXDATA_OUT,
    I8,
    D,
    I17,
    I18,
    I19);
  output RX_NEG_Buffer;
  output O1;
  output O2;
  output first_v_received_r;
  output GOT_V;
  output RX_CC;
  output O3;
  output [1:0]I13;
  output S4_in;
  output [1:0]O4;
  output S;
  output counter3_r0;
  output counter4_r0;
  output [0:0]O6;
  output [7:0]O7;
  output good_as_r0;
  output [3:0]O8;
  output O10;
  output [1:0]O11;
  output O12;
  output [7:0]O5;
  output [7:0]O9;
  output [7:0]O13;
  output [7:0]O14;
  input user_clk;
  input I2;
  input I3;
  input I4;
  input I5;
  input [1:0]Q;
  input CI;
  input I6;
  input GEN_SPA;
  input ready_r;
  input [3:0]GT0_RXCHARISK_OUT;
  input [31:0]GT0_RXDATA_OUT;
  input [3:0]I8;
  input [0:0]D;
  input [7:0]I17;
  input [7:0]I18;
  input [7:0]I19;

  wire \<const0> ;
  wire \<const1> ;
  wire CI;
  wire [0:0]D;
  wire GEN_SPA;
  wire GOT_V;
  wire [3:0]GT0_RXCHARISK_OUT;
  wire [31:0]GT0_RXDATA_OUT;
  wire [1:0]I13;
  wire [7:0]I17;
  wire [7:0]I18;
  wire [7:0]I19;
  wire I2;
  wire I3;
  wire I4;
  wire I5;
  wire I6;
  wire [3:0]I8;
  wire O1;
  wire O10;
  wire [1:0]O11;
  wire O12;
  wire [7:0]O13;
  wire [7:0]O14;
  wire O2;
  wire O3;
  wire [1:0]O4;
  wire [7:0]O5;
  wire [0:0]O6;
  wire [7:0]O7;
  wire [3:0]O8;
  wire [7:0]O9;
  wire [1:0]Q;
  wire RX_CC;
  wire RX_NEG_Buffer;
  wire RX_NEG_Buffer0;
  wire [0:1]RX_PAD;
  wire [0:1]RX_PE_DATA_V;
  wire RX_SP;
  wire RX_SPA;
  wire S;
  wire S4_in;
  wire counter3_r0;
  wire counter4_r0;
  wire [7:0]data1;
  wire [7:0]data2;
  wire first_v_received_r;
  wire good_as_r0;
  wire [0:7]got_a_d_r;
  wire n_0_RX_CC_Buffer_i_1;
  wire n_0_RX_CC_Buffer_i_2;
  wire n_0_RX_CC_Buffer_i_3;
  wire \n_0_RX_PE_DATA_V_Buffer[0]_i_1 ;
  wire \n_0_RX_PE_DATA_V_Buffer[1]_i_1 ;
  wire n_0_RX_SPA_Buffer_i_2;
  wire n_0_RX_SP_Buffer_i_2;
  wire n_0_first_v_received_r_i_1;
  wire n_0_first_v_received_r_i_2;
  wire n_0_first_v_received_r_i_3;
  wire n_0_good_as_r_i_2;
  wire \n_0_rx_cc_r[1]_i_1 ;
  wire \n_0_rx_cc_r[3]_i_1 ;
  wire \n_0_rx_cc_r[5]_i_1 ;
  wire \n_0_rx_cc_r[7]_i_1 ;
  wire \n_0_rx_ecp_d_r[0]_i_1 ;
  wire \n_0_rx_ecp_d_r[1]_i_1 ;
  wire \n_0_rx_ecp_d_r[3]_i_1 ;
  wire \n_0_rx_ecp_d_r[4]_i_1 ;
  wire \n_0_rx_ecp_d_r[5]_i_1 ;
  wire \n_0_rx_ecp_d_r[7]_i_1 ;
  wire \n_0_rx_ecp_d_r_reg[3] ;
  wire \n_0_rx_ecp_d_r_reg[5] ;
  wire \n_0_rx_ecp_d_r_reg[7] ;
  wire \n_0_rx_pad_d_r[0]_i_1 ;
  wire \n_0_rx_pad_d_r[1]_i_1 ;
  wire \n_0_rx_pad_d_r[2]_i_1 ;
  wire \n_0_rx_pad_d_r[3]_i_1 ;
  wire \n_0_rx_pe_control_r_reg[2] ;
  wire \n_0_rx_pe_control_r_reg[3] ;
  wire \n_0_rx_scp_d_r[0]_i_1 ;
  wire \n_0_rx_scp_d_r[2]_i_1 ;
  wire \n_0_rx_scp_d_r[3]_i_1 ;
  wire \n_0_rx_scp_d_r[4]_i_1 ;
  wire \n_0_rx_scp_d_r[5]_i_1 ;
  wire \n_0_rx_scp_d_r[6]_i_1 ;
  wire \n_0_rx_scp_d_r[7]_i_1 ;
  wire \n_0_rx_scp_d_r_reg[3] ;
  wire \n_0_rx_scp_d_r_reg[7] ;
  wire \n_0_rx_sp_r[2]_i_1 ;
  wire \n_0_rx_sp_r[3]_i_1 ;
  wire \n_0_rx_sp_r[4]_i_1 ;
  wire \n_0_rx_sp_r[5]_i_1 ;
  wire \n_0_rx_sp_r[6]_i_1 ;
  wire \n_0_rx_sp_r[7]_i_1 ;
  wire \n_0_rx_spa_neg_d_r[0]_i_1 ;
  wire \n_0_rx_spa_neg_d_r[1]_i_1 ;
  wire \n_0_rx_spa_r[2]_i_1 ;
  wire \n_0_rx_spa_r[4]_i_1 ;
  wire \n_0_rx_spa_r[6]_i_1 ;
  wire \n_0_rx_v_d_r[0]_i_1 ;
  wire \n_0_rx_v_d_r[1]_i_1 ;
  wire \n_0_rx_v_d_r[2]_i_1 ;
  wire \n_0_rx_v_d_r[3]_i_1 ;
  wire \n_0_rx_v_d_r[4]_i_1 ;
  wire \n_0_rx_v_d_r[5]_i_1 ;
  wire \n_0_rx_v_d_r[6]_i_1 ;
  wire \n_0_rx_v_d_r[7]_i_1 ;
  wire \n_0_word_aligned_control_bits_r[0]_i_1 ;
  wire \n_0_word_aligned_control_bits_r[1]_i_1 ;
  wire \n_0_word_aligned_data_r[0]_i_1 ;
  wire \n_0_word_aligned_data_r[10]_i_1 ;
  wire \n_0_word_aligned_data_r[11]_i_1 ;
  wire \n_0_word_aligned_data_r[12]_i_1 ;
  wire \n_0_word_aligned_data_r[13]_i_1 ;
  wire \n_0_word_aligned_data_r[14]_i_1 ;
  wire \n_0_word_aligned_data_r[15]_i_1 ;
  wire \n_0_word_aligned_data_r[1]_i_1 ;
  wire \n_0_word_aligned_data_r[2]_i_1 ;
  wire \n_0_word_aligned_data_r[3]_i_1 ;
  wire \n_0_word_aligned_data_r[4]_i_1 ;
  wire \n_0_word_aligned_data_r[5]_i_1 ;
  wire \n_0_word_aligned_data_r[6]_i_1 ;
  wire \n_0_word_aligned_data_r[7]_i_1 ;
  wire \n_0_word_aligned_data_r[8]_i_1 ;
  wire \n_0_word_aligned_data_r[9]_i_1 ;
  wire p_0_in14_in;
  wire p_0_in21_in;
  wire p_0_in24_in;
  wire p_16_in;
  wire p_1_in22_in;
  wire p_1_in25_in;
  wire p_28_in;
  wire p_2_in26_in;
  wire [1:0]p_2_out;
  wire p_3_in;
  wire p_5_in29_in;
  wire p_6_in17_in;
  wire p_6_in30_in;
  wire p_7_in;
  wire [3:0]p_7_out;
  wire [1:0]p_8_out;
  wire [1:0]p_9_out;
  wire [2:1]previous_cycle_control_r;
  wire ready_r;
  wire [0:7]rx_cc_r;
  wire [0:3]rx_pad_d_r;
  wire [0:1]rx_sp_neg_d_r;
  wire [0:7]rx_sp_r;
  wire [0:1]rx_spa_neg_d_r;
  wire [0:7]rx_spa_r;
  wire [0:7]rx_v_d_r;
  wire std_bool11_out;
  wire std_bool13_in;
  wire std_bool13_out;
  wire std_bool16_in;
  wire std_bool1_out;
  wire user_clk;
  wire [0:3]word_aligned_control_bits_r;

LUT2 #(
    .INIT(4'h8)) 
     \DEFRAMED_DATA_V_Buffer[0]_i_1 
       (.I0(RX_PE_DATA_V[0]),
        .I1(CI),
        .O(I13[1]));
LUT2 #(
    .INIT(4'h8)) 
     \DEFRAMED_DATA_V_Buffer[2]_i_1 
       (.I0(RX_PE_DATA_V[1]),
        .I1(I6),
        .O(I13[0]));
GND GND
       (.G(\<const0> ));
LUT3 #(
    .INIT(8'h80)) 
     \GOT_A_Buffer[0]_i_1 
       (.I0(got_a_d_r[0]),
        .I1(got_a_d_r[1]),
        .I2(GT0_RXCHARISK_OUT[0]),
        .O(p_7_out[3]));
LUT3 #(
    .INIT(8'h80)) 
     \GOT_A_Buffer[1]_i_1 
       (.I0(got_a_d_r[2]),
        .I1(got_a_d_r[3]),
        .I2(GT0_RXCHARISK_OUT[1]),
        .O(p_7_out[2]));
LUT3 #(
    .INIT(8'h80)) 
     \GOT_A_Buffer[2]_i_1 
       (.I0(got_a_d_r[4]),
        .I1(got_a_d_r[5]),
        .I2(GT0_RXCHARISK_OUT[2]),
        .O(p_7_out[1]));
LUT3 #(
    .INIT(8'h80)) 
     \GOT_A_Buffer[3]_i_1 
       (.I0(got_a_d_r[6]),
        .I1(got_a_d_r[7]),
        .I2(GT0_RXCHARISK_OUT[3]),
        .O(p_7_out[0]));
FDRE \GOT_A_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_7_out[3]),
        .Q(O8[3]),
        .R(\<const0> ));
FDRE \GOT_A_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_7_out[2]),
        .Q(O8[2]),
        .R(\<const0> ));
FDRE \GOT_A_Buffer_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_7_out[1]),
        .Q(O8[1]),
        .R(\<const0> ));
FDRE \GOT_A_Buffer_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_7_out[0]),
        .Q(O8[0]),
        .R(\<const0> ));
LUT4 #(
    .INIT(16'h8000)) 
     GOT_V_Buffer_i_1
       (.I0(n_0_first_v_received_r_i_2),
        .I1(n_0_first_v_received_r_i_3),
        .I2(rx_v_d_r[7]),
        .I3(rx_v_d_r[1]),
        .O(std_bool1_out));
FDRE GOT_V_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(std_bool1_out),
        .Q(GOT_V),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     RX_CC_Buffer_i_1
       (.I0(n_0_RX_CC_Buffer_i_2),
        .I1(\n_0_rx_pe_control_r_reg[3] ),
        .I2(\n_0_rx_pe_control_r_reg[2] ),
        .I3(n_0_RX_CC_Buffer_i_3),
        .I4(rx_cc_r[1]),
        .I5(rx_cc_r[6]),
        .O(n_0_RX_CC_Buffer_i_1));
(* SOFT_HLUTNM = "soft_lutpair69" *) 
   LUT2 #(
    .INIT(4'h8)) 
     RX_CC_Buffer_i_2
       (.I0(p_0_in21_in),
        .I1(p_1_in22_in),
        .O(n_0_RX_CC_Buffer_i_2));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     RX_CC_Buffer_i_3
       (.I0(rx_cc_r[0]),
        .I1(rx_cc_r[4]),
        .I2(rx_cc_r[2]),
        .I3(rx_cc_r[7]),
        .I4(rx_cc_r[5]),
        .I5(rx_cc_r[3]),
        .O(n_0_RX_CC_Buffer_i_3));
FDRE RX_CC_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_RX_CC_Buffer_i_1),
        .Q(RX_CC),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     \RX_ECP_Buffer[0]_i_1 
       (.I0(p_1_in22_in),
        .I1(p_0_in21_in),
        .I2(\n_0_rx_ecp_d_r_reg[3] ),
        .I3(p_6_in17_in),
        .I4(p_7_in),
        .I5(p_16_in),
        .O(p_9_out[1]));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     \RX_ECP_Buffer[1]_i_1 
       (.I0(\n_0_rx_pe_control_r_reg[2] ),
        .I1(\n_0_rx_pe_control_r_reg[3] ),
        .I2(\n_0_rx_ecp_d_r_reg[7] ),
        .I3(\n_0_rx_ecp_d_r_reg[5] ),
        .I4(p_3_in),
        .I5(p_0_in14_in),
        .O(p_9_out[0]));
FDRE \RX_ECP_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_9_out[1]),
        .Q(O11[1]),
        .R(\<const0> ));
FDRE \RX_ECP_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_9_out[0]),
        .Q(O11[0]),
        .R(\<const0> ));
LUT5 #(
    .INIT(32'h0000F888)) 
     RX_NEG_Buffer_i_1
       (.I0(rx_spa_neg_d_r[0]),
        .I1(rx_spa_neg_d_r[1]),
        .I2(rx_sp_neg_d_r[0]),
        .I3(rx_sp_neg_d_r[1]),
        .I4(p_0_in21_in),
        .O(RX_NEG_Buffer0));
FDRE RX_NEG_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(RX_NEG_Buffer0),
        .Q(RX_NEG_Buffer),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair70" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \RX_PAD_Buffer[0]_i_1 
       (.I0(p_1_in22_in),
        .I1(p_0_in21_in),
        .I2(rx_pad_d_r[0]),
        .I3(rx_pad_d_r[1]),
        .O(p_2_out[1]));
(* SOFT_HLUTNM = "soft_lutpair71" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \RX_PAD_Buffer[1]_i_1 
       (.I0(\n_0_rx_pe_control_r_reg[2] ),
        .I1(\n_0_rx_pe_control_r_reg[3] ),
        .I2(rx_pad_d_r[2]),
        .I3(rx_pad_d_r[3]),
        .O(p_2_out[0]));
FDRE \RX_PAD_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_2_out[1]),
        .Q(RX_PAD[0]),
        .R(\<const0> ));
FDRE \RX_PAD_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_2_out[0]),
        .Q(RX_PAD[1]),
        .R(\<const0> ));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair70" *) 
   LUT1 #(
    .INIT(2'h1)) 
     \RX_PE_DATA_V_Buffer[0]_i_1 
       (.I0(p_1_in22_in),
        .O(\n_0_RX_PE_DATA_V_Buffer[0]_i_1 ));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair71" *) 
   LUT1 #(
    .INIT(2'h1)) 
     \RX_PE_DATA_V_Buffer[1]_i_1 
       (.I0(\n_0_rx_pe_control_r_reg[2] ),
        .O(\n_0_RX_PE_DATA_V_Buffer[1]_i_1 ));
FDRE \RX_PE_DATA_V_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_RX_PE_DATA_V_Buffer[0]_i_1 ),
        .Q(RX_PE_DATA_V[0]),
        .R(\<const0> ));
FDRE \RX_PE_DATA_V_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_RX_PE_DATA_V_Buffer[1]_i_1 ),
        .Q(RX_PE_DATA_V[1]),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     \RX_SCP_Buffer[0]_i_1 
       (.I0(p_1_in22_in),
        .I1(p_0_in21_in),
        .I2(\n_0_rx_scp_d_r_reg[3] ),
        .I3(p_5_in29_in),
        .I4(p_6_in30_in),
        .I5(p_28_in),
        .O(p_8_out[1]));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     \RX_SCP_Buffer[1]_i_1 
       (.I0(\n_0_rx_pe_control_r_reg[2] ),
        .I1(\n_0_rx_pe_control_r_reg[3] ),
        .I2(\n_0_rx_scp_d_r_reg[7] ),
        .I3(p_1_in25_in),
        .I4(p_2_in26_in),
        .I5(p_0_in24_in),
        .O(p_8_out[0]));
FDRE \RX_SCP_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_8_out[1]),
        .Q(O4[1]),
        .R(\<const0> ));
FDRE \RX_SCP_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_8_out[0]),
        .Q(O4[0]),
        .R(\<const0> ));
LUT4 #(
    .INIT(16'h8000)) 
     RX_SPA_Buffer_i_1
       (.I0(n_0_first_v_received_r_i_2),
        .I1(n_0_RX_SPA_Buffer_i_2),
        .I2(rx_spa_r[7]),
        .I3(rx_spa_r[6]),
        .O(std_bool11_out));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     RX_SPA_Buffer_i_2
       (.I0(rx_spa_r[0]),
        .I1(rx_spa_r[1]),
        .I2(rx_spa_r[2]),
        .I3(rx_spa_r[5]),
        .I4(rx_spa_r[4]),
        .I5(rx_spa_r[3]),
        .O(n_0_RX_SPA_Buffer_i_2));
FDRE RX_SPA_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(std_bool11_out),
        .Q(RX_SPA),
        .R(\<const0> ));
LUT4 #(
    .INIT(16'h8000)) 
     RX_SP_Buffer_i_1
       (.I0(n_0_first_v_received_r_i_2),
        .I1(n_0_RX_SP_Buffer_i_2),
        .I2(rx_sp_r[7]),
        .I3(rx_sp_r[6]),
        .O(std_bool13_out));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     RX_SP_Buffer_i_2
       (.I0(rx_sp_r[0]),
        .I1(rx_sp_r[1]),
        .I2(rx_sp_r[2]),
        .I3(rx_sp_r[5]),
        .I4(rx_sp_r[4]),
        .I5(rx_sp_r[3]),
        .O(n_0_RX_SP_Buffer_i_2));
FDRE RX_SP_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(std_bool13_out),
        .Q(RX_SP),
        .R(\<const0> ));
VCC VCC
       (.P(\<const1> ));
LUT2 #(
    .INIT(4'hB)) 
     \counter3_r_reg[2]_srl3_i_1 
       (.I0(RX_SPA),
        .I1(GEN_SPA),
        .O(counter3_r0));
LUT2 #(
    .INIT(4'hB)) 
     \counter4_r_reg[14]_srl15_i_1 
       (.I0(RX_SP),
        .I1(ready_r),
        .O(counter4_r0));
LUT1 #(
    .INIT(2'h1)) 
     data_after_start_muxcy_0_i_1
       (.I0(O4[1]),
        .O(S));
LUT1 #(
    .INIT(2'h1)) 
     data_after_start_muxcy_2_i_1
       (.I0(O4[0]),
        .O(S4_in));
LUT6 #(
    .INIT(64'hFFFF000080000000)) 
     first_v_received_r_i_1
       (.I0(n_0_first_v_received_r_i_2),
        .I1(n_0_first_v_received_r_i_3),
        .I2(rx_v_d_r[7]),
        .I3(rx_v_d_r[1]),
        .I4(D),
        .I5(first_v_received_r),
        .O(n_0_first_v_received_r_i_1));
(* SOFT_HLUTNM = "soft_lutpair69" *) 
   LUT4 #(
    .INIT(16'h0004)) 
     first_v_received_r_i_2
       (.I0(p_0_in21_in),
        .I1(p_1_in22_in),
        .I2(\n_0_rx_pe_control_r_reg[2] ),
        .I3(\n_0_rx_pe_control_r_reg[3] ),
        .O(n_0_first_v_received_r_i_2));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     first_v_received_r_i_3
       (.I0(rx_v_d_r[0]),
        .I1(rx_v_d_r[6]),
        .I2(rx_v_d_r[3]),
        .I3(rx_v_d_r[2]),
        .I4(rx_v_d_r[5]),
        .I5(rx_v_d_r[4]),
        .O(n_0_first_v_received_r_i_3));
FDRE #(
    .INIT(1'b0)) 
     first_v_received_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_first_v_received_r_i_1),
        .Q(first_v_received_r),
        .R(\<const0> ));
LUT3 #(
    .INIT(8'hF8)) 
     good_as_r_i_1
       (.I0(I8[1]),
        .I1(O8[1]),
        .I2(n_0_good_as_r_i_2),
        .O(good_as_r0));
LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
     good_as_r_i_2
       (.I0(O8[2]),
        .I1(I8[2]),
        .I2(O8[0]),
        .I3(I8[0]),
        .I4(O8[3]),
        .I5(I8[3]),
        .O(n_0_good_as_r_i_2));
FDRE \got_a_d_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I19[7]),
        .Q(got_a_d_r[0]),
        .R(\<const0> ));
FDRE \got_a_d_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I19[6]),
        .Q(got_a_d_r[1]),
        .R(\<const0> ));
FDRE \got_a_d_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I19[5]),
        .Q(got_a_d_r[2]),
        .R(\<const0> ));
FDRE \got_a_d_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I19[4]),
        .Q(got_a_d_r[3]),
        .R(\<const0> ));
FDRE \got_a_d_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I19[3]),
        .Q(got_a_d_r[4]),
        .R(\<const0> ));
FDRE \got_a_d_r_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I19[2]),
        .Q(got_a_d_r[5]),
        .R(\<const0> ));
FDRE \got_a_d_r_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I19[1]),
        .Q(got_a_d_r[6]),
        .R(\<const0> ));
FDRE \got_a_d_r_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I19[0]),
        .Q(got_a_d_r[7]),
        .R(\<const0> ));
LUT2 #(
    .INIT(4'h1)) 
     in_frame_muxcy_0_i_1
       (.I0(O11[1]),
        .I1(O4[1]),
        .O(O12));
LUT2 #(
    .INIT(4'h1)) 
     in_frame_muxcy_2_i_1
       (.I0(O11[0]),
        .I1(O4[0]),
        .O(O10));
FDRE \left_align_select_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I2),
        .Q(O1),
        .R(\<const0> ));
FDRE \left_align_select_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I3),
        .Q(O2),
        .R(\<const0> ));
FDRE \previous_cycle_control_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXCHARISK_OUT[3]),
        .Q(O6),
        .R(\<const0> ));
FDRE \previous_cycle_control_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXCHARISK_OUT[2]),
        .Q(previous_cycle_control_r[1]),
        .R(\<const0> ));
FDRE \previous_cycle_control_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXCHARISK_OUT[1]),
        .Q(previous_cycle_control_r[2]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[24]),
        .Q(O7[0]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[10] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[18]),
        .Q(data2[2]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[11] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[19]),
        .Q(data2[3]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[12] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[20]),
        .Q(data2[4]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[13] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[21]),
        .Q(data2[5]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[14] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[22]),
        .Q(data2[6]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[15] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[23]),
        .Q(data2[7]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[16] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[8]),
        .Q(data1[0]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[17] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[9]),
        .Q(data1[1]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[18] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[10]),
        .Q(data1[2]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[19] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[11]),
        .Q(data1[3]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[25]),
        .Q(O7[1]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[20] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[12]),
        .Q(data1[4]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[21] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[13]),
        .Q(data1[5]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[22] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[14]),
        .Q(data1[6]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[23] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[15]),
        .Q(data1[7]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[26]),
        .Q(O7[2]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[27]),
        .Q(O7[3]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[28]),
        .Q(O7[4]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[29]),
        .Q(O7[5]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[30]),
        .Q(O7[6]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[31]),
        .Q(O7[7]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[8] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[16]),
        .Q(data2[0]),
        .R(\<const0> ));
FDRE \previous_cycle_data_r_reg[9] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GT0_RXDATA_OUT[17]),
        .Q(data2[1]),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair72" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_cc_r[1]_i_1 
       (.I0(O14[3]),
        .I1(O14[2]),
        .I2(O14[1]),
        .I3(O14[0]),
        .O(\n_0_rx_cc_r[1]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair73" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_cc_r[3]_i_1 
       (.I0(O13[3]),
        .I1(O13[2]),
        .I2(O13[1]),
        .I3(O13[0]),
        .O(\n_0_rx_cc_r[3]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair74" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_cc_r[5]_i_1 
       (.I0(O9[3]),
        .I1(O9[2]),
        .I2(O9[1]),
        .I3(O9[0]),
        .O(\n_0_rx_cc_r[5]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair75" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_cc_r[7]_i_1 
       (.I0(O5[3]),
        .I1(O5[2]),
        .I2(O5[1]),
        .I3(O5[0]),
        .O(\n_0_rx_cc_r[7]_i_1 ));
FDRE \rx_cc_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_ecp_d_r[0]_i_1 ),
        .Q(rx_cc_r[0]),
        .R(\<const0> ));
FDRE \rx_cc_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_cc_r[1]_i_1 ),
        .Q(rx_cc_r[1]),
        .R(\<const0> ));
FDRE \rx_cc_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[2]_i_1 ),
        .Q(rx_cc_r[2]),
        .R(\<const0> ));
FDRE \rx_cc_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_cc_r[3]_i_1 ),
        .Q(rx_cc_r[3]),
        .R(\<const0> ));
FDRE \rx_cc_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_ecp_d_r[4]_i_1 ),
        .Q(rx_cc_r[4]),
        .R(\<const0> ));
FDRE \rx_cc_r_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_cc_r[5]_i_1 ),
        .Q(rx_cc_r[5]),
        .R(\<const0> ));
FDRE \rx_cc_r_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[6]_i_1 ),
        .Q(rx_cc_r[6]),
        .R(\<const0> ));
FDRE \rx_cc_r_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_cc_r[7]_i_1 ),
        .Q(rx_cc_r[7]),
        .R(\<const0> ));
LUT4 #(
    .INIT(16'h8000)) 
     \rx_ecp_d_r[0]_i_1 
       (.I0(O14[5]),
        .I1(O14[4]),
        .I2(O14[6]),
        .I3(O14[7]),
        .O(\n_0_rx_ecp_d_r[0]_i_1 ));
LUT4 #(
    .INIT(16'h4000)) 
     \rx_ecp_d_r[1]_i_1 
       (.I0(O14[1]),
        .I1(O14[0]),
        .I2(O14[2]),
        .I3(O14[3]),
        .O(\n_0_rx_ecp_d_r[1]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair77" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_ecp_d_r[3]_i_1 
       (.I0(O13[0]),
        .I1(O13[1]),
        .I2(O13[2]),
        .I3(O13[3]),
        .O(\n_0_rx_ecp_d_r[3]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair84" *) 
   LUT4 #(
    .INIT(16'h8000)) 
     \rx_ecp_d_r[4]_i_1 
       (.I0(O9[5]),
        .I1(O9[4]),
        .I2(O9[6]),
        .I3(O9[7]),
        .O(\n_0_rx_ecp_d_r[4]_i_1 ));
LUT4 #(
    .INIT(16'h4000)) 
     \rx_ecp_d_r[5]_i_1 
       (.I0(O9[1]),
        .I1(O9[0]),
        .I2(O9[2]),
        .I3(O9[3]),
        .O(\n_0_rx_ecp_d_r[5]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair85" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_ecp_d_r[7]_i_1 
       (.I0(O5[0]),
        .I1(O5[1]),
        .I2(O5[2]),
        .I3(O5[3]),
        .O(\n_0_rx_ecp_d_r[7]_i_1 ));
FDRE \rx_ecp_d_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_ecp_d_r[0]_i_1 ),
        .Q(p_16_in),
        .R(\<const0> ));
FDRE \rx_ecp_d_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_ecp_d_r[1]_i_1 ),
        .Q(p_6_in17_in),
        .R(\<const0> ));
FDRE \rx_ecp_d_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[2]_i_1 ),
        .Q(p_7_in),
        .R(\<const0> ));
FDRE \rx_ecp_d_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_ecp_d_r[3]_i_1 ),
        .Q(\n_0_rx_ecp_d_r_reg[3] ),
        .R(\<const0> ));
FDRE \rx_ecp_d_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_ecp_d_r[4]_i_1 ),
        .Q(p_0_in14_in),
        .R(\<const0> ));
FDRE \rx_ecp_d_r_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_ecp_d_r[5]_i_1 ),
        .Q(\n_0_rx_ecp_d_r_reg[5] ),
        .R(\<const0> ));
FDRE \rx_ecp_d_r_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[6]_i_1 ),
        .Q(p_3_in),
        .R(\<const0> ));
FDRE \rx_ecp_d_r_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_ecp_d_r[7]_i_1 ),
        .Q(\n_0_rx_ecp_d_r_reg[7] ),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair83" *) 
   LUT4 #(
    .INIT(16'h0040)) 
     \rx_pad_d_r[0]_i_1 
       (.I0(O13[6]),
        .I1(O13[7]),
        .I2(O13[4]),
        .I3(O13[5]),
        .O(\n_0_rx_pad_d_r[0]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair67" *) 
   LUT4 #(
    .INIT(16'h1000)) 
     \rx_pad_d_r[1]_i_1 
       (.I0(O13[1]),
        .I1(O13[0]),
        .I2(O13[2]),
        .I3(O13[3]),
        .O(\n_0_rx_pad_d_r[1]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair82" *) 
   LUT4 #(
    .INIT(16'h0040)) 
     \rx_pad_d_r[2]_i_1 
       (.I0(O5[6]),
        .I1(O5[7]),
        .I2(O5[4]),
        .I3(O5[5]),
        .O(\n_0_rx_pad_d_r[2]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair80" *) 
   LUT4 #(
    .INIT(16'h1000)) 
     \rx_pad_d_r[3]_i_1 
       (.I0(O5[1]),
        .I1(O5[0]),
        .I2(O5[2]),
        .I3(O5[3]),
        .O(\n_0_rx_pad_d_r[3]_i_1 ));
FDRE \rx_pad_d_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_pad_d_r[0]_i_1 ),
        .Q(rx_pad_d_r[0]),
        .R(\<const0> ));
FDRE \rx_pad_d_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_pad_d_r[1]_i_1 ),
        .Q(rx_pad_d_r[1]),
        .R(\<const0> ));
FDRE \rx_pad_d_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_pad_d_r[2]_i_1 ),
        .Q(rx_pad_d_r[2]),
        .R(\<const0> ));
FDRE \rx_pad_d_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_pad_d_r[3]_i_1 ),
        .Q(rx_pad_d_r[3]),
        .R(\<const0> ));
FDRE \rx_pe_control_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(word_aligned_control_bits_r[0]),
        .Q(p_1_in22_in),
        .R(\<const0> ));
FDRE \rx_pe_control_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(word_aligned_control_bits_r[1]),
        .Q(p_0_in21_in),
        .R(\<const0> ));
FDRE \rx_pe_control_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(word_aligned_control_bits_r[2]),
        .Q(\n_0_rx_pe_control_r_reg[2] ),
        .R(\<const0> ));
FDRE \rx_pe_control_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(word_aligned_control_bits_r[3]),
        .Q(\n_0_rx_pe_control_r_reg[3] ),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair65" *) 
   LUT4 #(
    .INIT(16'h0040)) 
     \rx_scp_d_r[0]_i_1 
       (.I0(O14[7]),
        .I1(O14[6]),
        .I2(O14[4]),
        .I3(O14[5]),
        .O(\n_0_rx_scp_d_r[0]_i_1 ));
LUT4 #(
    .INIT(16'h8000)) 
     \rx_scp_d_r[2]_i_1 
       (.I0(O13[5]),
        .I1(O13[4]),
        .I2(O13[6]),
        .I3(O13[7]),
        .O(\n_0_rx_scp_d_r[2]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair73" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_scp_d_r[3]_i_1 
       (.I0(O13[2]),
        .I1(O13[3]),
        .I2(O13[1]),
        .I3(O13[0]),
        .O(\n_0_rx_scp_d_r[3]_i_1 ));
LUT4 #(
    .INIT(16'h0040)) 
     \rx_scp_d_r[4]_i_1 
       (.I0(O9[7]),
        .I1(O9[6]),
        .I2(O9[4]),
        .I3(O9[5]),
        .O(\n_0_rx_scp_d_r[4]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair81" *) 
   LUT4 #(
    .INIT(16'h1000)) 
     \rx_scp_d_r[5]_i_1 
       (.I0(O9[1]),
        .I1(O9[0]),
        .I2(O9[2]),
        .I3(O9[3]),
        .O(\n_0_rx_scp_d_r[5]_i_1 ));
LUT4 #(
    .INIT(16'h8000)) 
     \rx_scp_d_r[6]_i_1 
       (.I0(O5[5]),
        .I1(O5[4]),
        .I2(O5[6]),
        .I3(O5[7]),
        .O(\n_0_rx_scp_d_r[6]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair85" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_scp_d_r[7]_i_1 
       (.I0(O5[2]),
        .I1(O5[3]),
        .I2(O5[1]),
        .I3(O5[0]),
        .O(\n_0_rx_scp_d_r[7]_i_1 ));
FDRE \rx_scp_d_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[0]_i_1 ),
        .Q(p_28_in),
        .R(\<const0> ));
FDRE \rx_scp_d_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[1]_i_1 ),
        .Q(p_5_in29_in),
        .R(\<const0> ));
FDRE \rx_scp_d_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[2]_i_1 ),
        .Q(p_6_in30_in),
        .R(\<const0> ));
FDRE \rx_scp_d_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[3]_i_1 ),
        .Q(\n_0_rx_scp_d_r_reg[3] ),
        .R(\<const0> ));
FDRE \rx_scp_d_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[4]_i_1 ),
        .Q(p_0_in24_in),
        .R(\<const0> ));
FDRE \rx_scp_d_r_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[5]_i_1 ),
        .Q(p_1_in25_in),
        .R(\<const0> ));
FDRE \rx_scp_d_r_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[6]_i_1 ),
        .Q(p_2_in26_in),
        .R(\<const0> ));
FDRE \rx_scp_d_r_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[7]_i_1 ),
        .Q(\n_0_rx_scp_d_r_reg[7] ),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair76" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_sp_neg_d_r[0]_i_1 
       (.I0(O13[6]),
        .I1(O13[7]),
        .I2(O13[5]),
        .I3(O13[4]),
        .O(std_bool16_in));
(* SOFT_HLUTNM = "soft_lutpair66" *) 
   LUT4 #(
    .INIT(16'h0040)) 
     \rx_sp_neg_d_r[1]_i_1 
       (.I0(O13[3]),
        .I1(O13[2]),
        .I2(O13[0]),
        .I3(O13[1]),
        .O(std_bool13_in));
FDRE \rx_sp_neg_d_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(std_bool16_in),
        .Q(rx_sp_neg_d_r[0]),
        .R(\<const0> ));
FDRE \rx_sp_neg_d_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(std_bool13_in),
        .Q(rx_sp_neg_d_r[1]),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair68" *) 
   LUT4 #(
    .INIT(16'h2004)) 
     \rx_sp_r[2]_i_1 
       (.I0(O13[5]),
        .I1(O13[6]),
        .I2(O13[4]),
        .I3(O13[7]),
        .O(\n_0_rx_sp_r[2]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair66" *) 
   LUT4 #(
    .INIT(16'h1008)) 
     \rx_sp_r[3]_i_1 
       (.I0(O13[3]),
        .I1(O13[1]),
        .I2(O13[2]),
        .I3(O13[0]),
        .O(\n_0_rx_sp_r[3]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair79" *) 
   LUT4 #(
    .INIT(16'h0810)) 
     \rx_sp_r[4]_i_1 
       (.I0(O9[7]),
        .I1(O9[5]),
        .I2(O9[6]),
        .I3(O9[4]),
        .O(\n_0_rx_sp_r[4]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair74" *) 
   LUT4 #(
    .INIT(16'h0420)) 
     \rx_sp_r[5]_i_1 
       (.I0(O9[3]),
        .I1(O9[2]),
        .I2(O9[1]),
        .I3(O9[0]),
        .O(\n_0_rx_sp_r[5]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair78" *) 
   LUT4 #(
    .INIT(16'h0810)) 
     \rx_sp_r[6]_i_1 
       (.I0(O5[7]),
        .I1(O5[5]),
        .I2(O5[6]),
        .I3(O5[4]),
        .O(\n_0_rx_sp_r[6]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair75" *) 
   LUT4 #(
    .INIT(16'h0420)) 
     \rx_sp_r[7]_i_1 
       (.I0(O5[3]),
        .I1(O5[2]),
        .I2(O5[1]),
        .I3(O5[0]),
        .O(\n_0_rx_sp_r[7]_i_1 ));
FDRE \rx_sp_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[0]_i_1 ),
        .Q(rx_sp_r[0]),
        .R(\<const0> ));
FDRE \rx_sp_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[1]_i_1 ),
        .Q(rx_sp_r[1]),
        .R(\<const0> ));
FDRE \rx_sp_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_sp_r[2]_i_1 ),
        .Q(rx_sp_r[2]),
        .R(\<const0> ));
FDRE \rx_sp_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_sp_r[3]_i_1 ),
        .Q(rx_sp_r[3]),
        .R(\<const0> ));
FDRE \rx_sp_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_sp_r[4]_i_1 ),
        .Q(rx_sp_r[4]),
        .R(\<const0> ));
FDRE \rx_sp_r_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_sp_r[5]_i_1 ),
        .Q(rx_sp_r[5]),
        .R(\<const0> ));
FDRE \rx_sp_r_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_sp_r[6]_i_1 ),
        .Q(rx_sp_r[6]),
        .R(\<const0> ));
FDRE \rx_sp_r_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_sp_r[7]_i_1 ),
        .Q(rx_sp_r[7]),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair76" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_spa_neg_d_r[0]_i_1 
       (.I0(O13[5]),
        .I1(O13[4]),
        .I2(O13[6]),
        .I3(O13[7]),
        .O(\n_0_rx_spa_neg_d_r[0]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair77" *) 
   LUT4 #(
    .INIT(16'h1000)) 
     \rx_spa_neg_d_r[1]_i_1 
       (.I0(O13[2]),
        .I1(O13[3]),
        .I2(O13[1]),
        .I3(O13[0]),
        .O(\n_0_rx_spa_neg_d_r[1]_i_1 ));
FDRE \rx_spa_neg_d_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_spa_neg_d_r[0]_i_1 ),
        .Q(rx_spa_neg_d_r[0]),
        .R(\<const0> ));
FDRE \rx_spa_neg_d_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_spa_neg_d_r[1]_i_1 ),
        .Q(rx_spa_neg_d_r[1]),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair68" *) 
   LUT4 #(
    .INIT(16'h0010)) 
     \rx_spa_r[2]_i_1 
       (.I0(O13[6]),
        .I1(O13[7]),
        .I2(O13[5]),
        .I3(O13[4]),
        .O(\n_0_rx_spa_r[2]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair79" *) 
   LUT4 #(
    .INIT(16'h0010)) 
     \rx_spa_r[4]_i_1 
       (.I0(O9[6]),
        .I1(O9[7]),
        .I2(O9[5]),
        .I3(O9[4]),
        .O(\n_0_rx_spa_r[4]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair78" *) 
   LUT4 #(
    .INIT(16'h0010)) 
     \rx_spa_r[6]_i_1 
       (.I0(O5[6]),
        .I1(O5[7]),
        .I2(O5[5]),
        .I3(O5[4]),
        .O(\n_0_rx_spa_r[6]_i_1 ));
FDRE \rx_spa_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[0]_i_1 ),
        .Q(rx_spa_r[0]),
        .R(\<const0> ));
FDRE \rx_spa_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[1]_i_1 ),
        .Q(rx_spa_r[1]),
        .R(\<const0> ));
FDRE \rx_spa_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_spa_r[2]_i_1 ),
        .Q(rx_spa_r[2]),
        .R(\<const0> ));
FDRE \rx_spa_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_pad_d_r[1]_i_1 ),
        .Q(rx_spa_r[3]),
        .R(\<const0> ));
FDRE \rx_spa_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_spa_r[4]_i_1 ),
        .Q(rx_spa_r[4]),
        .R(\<const0> ));
FDRE \rx_spa_r_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_scp_d_r[5]_i_1 ),
        .Q(rx_spa_r[5]),
        .R(\<const0> ));
FDRE \rx_spa_r_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_spa_r[6]_i_1 ),
        .Q(rx_spa_r[6]),
        .R(\<const0> ));
FDRE \rx_spa_r_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_pad_d_r[3]_i_1 ),
        .Q(rx_spa_r[7]),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair65" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_v_d_r[0]_i_1 
       (.I0(O14[6]),
        .I1(O14[7]),
        .I2(O14[5]),
        .I3(O14[4]),
        .O(\n_0_rx_v_d_r[0]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair72" *) 
   LUT4 #(
    .INIT(16'h1000)) 
     \rx_v_d_r[1]_i_1 
       (.I0(O14[1]),
        .I1(O14[0]),
        .I2(O14[2]),
        .I3(O14[3]),
        .O(\n_0_rx_v_d_r[1]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair83" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_v_d_r[2]_i_1 
       (.I0(O13[4]),
        .I1(O13[5]),
        .I2(O13[6]),
        .I3(O13[7]),
        .O(\n_0_rx_v_d_r[2]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair67" *) 
   LUT4 #(
    .INIT(16'h0004)) 
     \rx_v_d_r[3]_i_1 
       (.I0(O13[2]),
        .I1(O13[3]),
        .I2(O13[1]),
        .I3(O13[0]),
        .O(\n_0_rx_v_d_r[3]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair84" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_v_d_r[4]_i_1 
       (.I0(O9[4]),
        .I1(O9[5]),
        .I2(O9[6]),
        .I3(O9[7]),
        .O(\n_0_rx_v_d_r[4]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair81" *) 
   LUT4 #(
    .INIT(16'h0004)) 
     \rx_v_d_r[5]_i_1 
       (.I0(O9[2]),
        .I1(O9[3]),
        .I2(O9[1]),
        .I3(O9[0]),
        .O(\n_0_rx_v_d_r[5]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair82" *) 
   LUT4 #(
    .INIT(16'h4000)) 
     \rx_v_d_r[6]_i_1 
       (.I0(O5[4]),
        .I1(O5[5]),
        .I2(O5[6]),
        .I3(O5[7]),
        .O(\n_0_rx_v_d_r[6]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair80" *) 
   LUT4 #(
    .INIT(16'h0004)) 
     \rx_v_d_r[7]_i_1 
       (.I0(O5[2]),
        .I1(O5[3]),
        .I2(O5[1]),
        .I3(O5[0]),
        .O(\n_0_rx_v_d_r[7]_i_1 ));
FDRE \rx_v_d_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[0]_i_1 ),
        .Q(rx_v_d_r[0]),
        .R(\<const0> ));
FDRE \rx_v_d_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[1]_i_1 ),
        .Q(rx_v_d_r[1]),
        .R(\<const0> ));
FDRE \rx_v_d_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[2]_i_1 ),
        .Q(rx_v_d_r[2]),
        .R(\<const0> ));
FDRE \rx_v_d_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[3]_i_1 ),
        .Q(rx_v_d_r[3]),
        .R(\<const0> ));
FDRE \rx_v_d_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[4]_i_1 ),
        .Q(rx_v_d_r[4]),
        .R(\<const0> ));
FDRE \rx_v_d_r_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[5]_i_1 ),
        .Q(rx_v_d_r[5]),
        .R(\<const0> ));
FDRE \rx_v_d_r_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[6]_i_1 ),
        .Q(rx_v_d_r[6]),
        .R(\<const0> ));
FDRE \rx_v_d_r_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_rx_v_d_r[7]_i_1 ),
        .Q(rx_v_d_r[7]),
        .R(\<const0> ));
LUT4 #(
    .INIT(16'hFFFE)) 
     stage_1_pad_r_i_1
       (.I0(RX_PAD[1]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(RX_PAD[0]),
        .O(O3));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_control_bits_r[0]_i_1 
       (.I0(O6),
        .I1(previous_cycle_control_r[2]),
        .I2(O2),
        .I3(previous_cycle_control_r[1]),
        .I4(O1),
        .I5(GT0_RXCHARISK_OUT[0]),
        .O(\n_0_word_aligned_control_bits_r[0]_i_1 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_control_bits_r[1]_i_1 
       (.I0(GT0_RXCHARISK_OUT[0]),
        .I1(previous_cycle_control_r[1]),
        .I2(O2),
        .I3(O6),
        .I4(O1),
        .I5(GT0_RXCHARISK_OUT[1]),
        .O(\n_0_word_aligned_control_bits_r[1]_i_1 ));
FDRE \word_aligned_control_bits_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_control_bits_r[0]_i_1 ),
        .Q(word_aligned_control_bits_r[0]),
        .R(\<const0> ));
FDRE \word_aligned_control_bits_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_control_bits_r[1]_i_1 ),
        .Q(word_aligned_control_bits_r[1]),
        .R(\<const0> ));
FDRE \word_aligned_control_bits_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I5),
        .Q(word_aligned_control_bits_r[2]),
        .R(\<const0> ));
FDRE \word_aligned_control_bits_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I4),
        .Q(word_aligned_control_bits_r[3]),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[0]_i_1 
       (.I0(O7[7]),
        .I1(data2[7]),
        .I2(O1),
        .I3(data1[7]),
        .I4(O2),
        .I5(GT0_RXDATA_OUT[7]),
        .O(\n_0_word_aligned_data_r[0]_i_1 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[10]_i_1 
       (.I0(GT0_RXDATA_OUT[5]),
        .I1(O7[5]),
        .I2(O1),
        .I3(data2[5]),
        .I4(O2),
        .I5(GT0_RXDATA_OUT[13]),
        .O(\n_0_word_aligned_data_r[10]_i_1 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[11]_i_1 
       (.I0(GT0_RXDATA_OUT[4]),
        .I1(O7[4]),
        .I2(O1),
        .I3(data2[4]),
        .I4(O2),
        .I5(GT0_RXDATA_OUT[12]),
        .O(\n_0_word_aligned_data_r[11]_i_1 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[12]_i_1 
       (.I0(GT0_RXDATA_OUT[3]),
        .I1(O7[3]),
        .I2(O1),
        .I3(data2[3]),
        .I4(O2),
        .I5(GT0_RXDATA_OUT[11]),
        .O(\n_0_word_aligned_data_r[12]_i_1 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[13]_i_1 
       (.I0(GT0_RXDATA_OUT[2]),
        .I1(O7[2]),
        .I2(O1),
        .I3(data2[2]),
        .I4(O2),
        .I5(GT0_RXDATA_OUT[10]),
        .O(\n_0_word_aligned_data_r[13]_i_1 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[14]_i_1 
       (.I0(GT0_RXDATA_OUT[1]),
        .I1(O7[1]),
        .I2(O1),
        .I3(data2[1]),
        .I4(O2),
        .I5(GT0_RXDATA_OUT[9]),
        .O(\n_0_word_aligned_data_r[14]_i_1 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[15]_i_1 
       (.I0(GT0_RXDATA_OUT[0]),
        .I1(O7[0]),
        .I2(O1),
        .I3(data2[0]),
        .I4(O2),
        .I5(GT0_RXDATA_OUT[8]),
        .O(\n_0_word_aligned_data_r[15]_i_1 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[1]_i_1 
       (.I0(O7[6]),
        .I1(data2[6]),
        .I2(O1),
        .I3(data1[6]),
        .I4(O2),
        .I5(GT0_RXDATA_OUT[6]),
        .O(\n_0_word_aligned_data_r[1]_i_1 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[2]_i_1 
       (.I0(O7[5]),
        .I1(data2[5]),
        .I2(O1),
        .I3(data1[5]),
        .I4(O2),
        .I5(GT0_RXDATA_OUT[5]),
        .O(\n_0_word_aligned_data_r[2]_i_1 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[3]_i_1 
       (.I0(O7[4]),
        .I1(data2[4]),
        .I2(O1),
        .I3(data1[4]),
        .I4(O2),
        .I5(GT0_RXDATA_OUT[4]),
        .O(\n_0_word_aligned_data_r[3]_i_1 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[4]_i_1 
       (.I0(O7[3]),
        .I1(data2[3]),
        .I2(O1),
        .I3(data1[3]),
        .I4(O2),
        .I5(GT0_RXDATA_OUT[3]),
        .O(\n_0_word_aligned_data_r[4]_i_1 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[5]_i_1 
       (.I0(O7[2]),
        .I1(data2[2]),
        .I2(O1),
        .I3(data1[2]),
        .I4(O2),
        .I5(GT0_RXDATA_OUT[2]),
        .O(\n_0_word_aligned_data_r[5]_i_1 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[6]_i_1 
       (.I0(O7[1]),
        .I1(data2[1]),
        .I2(O1),
        .I3(data1[1]),
        .I4(O2),
        .I5(GT0_RXDATA_OUT[1]),
        .O(\n_0_word_aligned_data_r[6]_i_1 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[7]_i_1 
       (.I0(O7[0]),
        .I1(data2[0]),
        .I2(O1),
        .I3(data1[0]),
        .I4(O2),
        .I5(GT0_RXDATA_OUT[0]),
        .O(\n_0_word_aligned_data_r[7]_i_1 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[8]_i_1 
       (.I0(GT0_RXDATA_OUT[7]),
        .I1(O7[7]),
        .I2(O1),
        .I3(data2[7]),
        .I4(O2),
        .I5(GT0_RXDATA_OUT[15]),
        .O(\n_0_word_aligned_data_r[8]_i_1 ));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[9]_i_1 
       (.I0(GT0_RXDATA_OUT[6]),
        .I1(O7[6]),
        .I2(O1),
        .I3(data2[6]),
        .I4(O2),
        .I5(GT0_RXDATA_OUT[14]),
        .O(\n_0_word_aligned_data_r[9]_i_1 ));
FDRE \word_aligned_data_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[0]_i_1 ),
        .Q(O14[7]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[10] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[10]_i_1 ),
        .Q(O13[5]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[11] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[11]_i_1 ),
        .Q(O13[4]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[12] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[12]_i_1 ),
        .Q(O13[3]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[13] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[13]_i_1 ),
        .Q(O13[2]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[14] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[14]_i_1 ),
        .Q(O13[1]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[15] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[15]_i_1 ),
        .Q(O13[0]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[16] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I18[7]),
        .Q(O9[7]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[17] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I18[6]),
        .Q(O9[6]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[18] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I18[5]),
        .Q(O9[5]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[19] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I18[4]),
        .Q(O9[4]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[1]_i_1 ),
        .Q(O14[6]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[20] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I18[3]),
        .Q(O9[3]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[21] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I18[2]),
        .Q(O9[2]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[22] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I18[1]),
        .Q(O9[1]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[23] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I18[0]),
        .Q(O9[0]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[24] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I17[7]),
        .Q(O5[7]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[25] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I17[6]),
        .Q(O5[6]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[26] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I17[5]),
        .Q(O5[5]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[27] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I17[4]),
        .Q(O5[4]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[28] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I17[3]),
        .Q(O5[3]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[29] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I17[2]),
        .Q(O5[2]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[2]_i_1 ),
        .Q(O14[5]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[30] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I17[1]),
        .Q(O5[1]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[31] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I17[0]),
        .Q(O5[0]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[3]_i_1 ),
        .Q(O14[4]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[4]_i_1 ),
        .Q(O14[3]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[5]_i_1 ),
        .Q(O14[2]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[6]_i_1 ),
        .Q(O14[1]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[7]_i_1 ),
        .Q(O14[0]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[8] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[8]_i_1 ),
        .Q(O13[7]),
        .R(\<const0> ));
FDRE \word_aligned_data_r_reg[9] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_word_aligned_data_r[9]_i_1 ),
        .Q(O13[6]),
        .R(\<const0> ));
endmodule

module data_mgtdata_mgt_SYM_GEN_4BYTE
   (GT1_TXCHARISK_IN,
    GT1_TXDATA_IN,
    GEN_SPA,
    user_clk,
    GEN_SP,
    I2,
    I3,
    I4,
    I12,
    I14,
    I15,
    I16,
    I17,
    I25);
  output [3:0]GT1_TXCHARISK_IN;
  output [31:0]GT1_TXDATA_IN;
  input GEN_SPA;
  input user_clk;
  input GEN_SP;
  input I2;
  input I3;
  input I4;
  input [1:0]I12;
  input [1:0]I14;
  input [2:0]I15;
  input [3:0]I16;
  input [3:0]I17;
  input [31:0]I25;

  wire \<const0> ;
  wire \<const1> ;
  wire GEN_SP;
  wire GEN_SPA;
  wire [3:0]GT1_TXCHARISK_IN;
  wire [31:0]GT1_TXDATA_IN;
  wire [1:0]I12;
  wire [1:0]I14;
  wire [2:0]I15;
  wire [3:0]I16;
  wire [3:0]I17;
  wire I2;
  wire [31:0]I25;
  wire I3;
  wire I4;
  wire TX_DATA_Buffer1;
  wire TX_DATA_Buffer10_out;
  wire TX_DATA_Buffer119_out;
  wire TX_DATA_Buffer121_out;
  wire TX_DATA_Buffer122_out;
  wire TX_DATA_Buffer12_out;
  wire TX_DATA_Buffer15_out;
  wire TX_DATA_Buffer17_out;
  wire gen_a_r;
  wire gen_cc_r;
  wire gen_sp_r;
  wire gen_spa_r;
  wire \n_0_TX_CHAR_IS_K_Buffer[0]_i_1__0 ;
  wire \n_0_TX_CHAR_IS_K_Buffer[1]_i_1__0 ;
  wire \n_0_TX_CHAR_IS_K_Buffer[2]_i_1__0 ;
  wire \n_0_TX_CHAR_IS_K_Buffer[3]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[0]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[10]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[11]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[12]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[13]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[13]_i_2 ;
  wire \n_0_TX_DATA_Buffer[14]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[14]_i_2 ;
  wire \n_0_TX_DATA_Buffer[15]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[15]_i_2__0 ;
  wire \n_0_TX_DATA_Buffer[15]_i_5__0 ;
  wire \n_0_TX_DATA_Buffer[15]_i_6 ;
  wire \n_0_TX_DATA_Buffer[16]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[17]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[18]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[18]_i_2__0 ;
  wire \n_0_TX_DATA_Buffer[19]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[1]_i_2 ;
  wire \n_0_TX_DATA_Buffer[20]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[21]_i_1 ;
  wire \n_0_TX_DATA_Buffer[21]_i_2__0 ;
  wire \n_0_TX_DATA_Buffer[22]_i_1 ;
  wire \n_0_TX_DATA_Buffer[22]_i_2__0 ;
  wire \n_0_TX_DATA_Buffer[23]_i_1 ;
  wire \n_0_TX_DATA_Buffer[23]_i_2__0 ;
  wire \n_0_TX_DATA_Buffer[23]_i_3__0 ;
  wire \n_0_TX_DATA_Buffer[23]_i_4 ;
  wire \n_0_TX_DATA_Buffer[24]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[25]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[26]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[27]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[28]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[28]_i_2__0 ;
  wire \n_0_TX_DATA_Buffer[29]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[30]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[30]_i_2__0 ;
  wire \n_0_TX_DATA_Buffer[31]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[31]_i_2__0 ;
  wire \n_0_TX_DATA_Buffer[31]_i_3__0 ;
  wire \n_0_TX_DATA_Buffer[31]_i_4__0 ;
  wire \n_0_TX_DATA_Buffer[5]_i_2__0 ;
  wire \n_0_TX_DATA_Buffer[6]_i_2__0 ;
  wire \n_0_TX_DATA_Buffer[6]_i_3 ;
  wire \n_0_TX_DATA_Buffer[7]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[7]_i_6 ;
  wire \n_0_TX_DATA_Buffer[8]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[9]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[9]_i_2 ;
  wire \n_0_TX_DATA_Buffer[9]_i_3 ;
  wire \n_0_gen_ecp_r_reg[1] ;
  wire \n_0_gen_k_r_reg[3] ;
  wire \n_0_gen_pad_r_reg[1] ;
  wire \n_0_gen_r_r_reg[3] ;
  wire \n_0_tx_pe_data_v_r_reg[1] ;
  wire p_0_in;
  wire p_0_in11_in;
  wire p_0_in15_in;
  wire p_0_in17_in;
  wire p_0_in20_in;
  wire p_0_in6_in;
  wire p_0_in8_in;
  wire p_15_in;
  wire [7:1]p_1_in;
  wire p_1_in10_in;
  wire p_1_in1_in;
  wire p_1_in5_in;
  wire p_1_in_0;
  wire [0:31]tx_pe_data_r;
  wire user_clk;

GND GND
       (.G(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair156" *) 
   LUT5 #(
    .INIT(32'h00000051)) 
     \TX_CHAR_IS_K_Buffer[0]_i_1__0 
       (.I0(p_1_in_0),
        .I1(\n_0_tx_pe_data_v_r_reg[1] ),
        .I2(\n_0_gen_pad_r_reg[1] ),
        .I3(gen_spa_r),
        .I4(gen_sp_r),
        .O(\n_0_TX_CHAR_IS_K_Buffer[0]_i_1__0 ));
LUT4 #(
    .INIT(16'h0001)) 
     \TX_CHAR_IS_K_Buffer[1]_i_1__0 
       (.I0(p_1_in1_in),
        .I1(\n_0_tx_pe_data_v_r_reg[1] ),
        .I2(gen_spa_r),
        .I3(gen_sp_r),
        .O(\n_0_TX_CHAR_IS_K_Buffer[1]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair159" *) 
   LUT5 #(
    .INIT(32'h00000051)) 
     \TX_CHAR_IS_K_Buffer[2]_i_1__0 
       (.I0(p_1_in5_in),
        .I1(p_1_in10_in),
        .I2(p_0_in15_in),
        .I3(gen_spa_r),
        .I4(gen_sp_r),
        .O(\n_0_TX_CHAR_IS_K_Buffer[2]_i_1__0 ));
LUT1 #(
    .INIT(2'h1)) 
     \TX_CHAR_IS_K_Buffer[3]_i_1__0 
       (.I0(p_1_in10_in),
        .O(\n_0_TX_CHAR_IS_K_Buffer[3]_i_1__0 ));
FDRE #(
    .INIT(1'b0)) 
     \TX_CHAR_IS_K_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_TX_CHAR_IS_K_Buffer[0]_i_1__0 ),
        .Q(GT1_TXCHARISK_IN[3]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \TX_CHAR_IS_K_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_TX_CHAR_IS_K_Buffer[1]_i_1__0 ),
        .Q(GT1_TXCHARISK_IN[2]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \TX_CHAR_IS_K_Buffer_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_TX_CHAR_IS_K_Buffer[2]_i_1__0 ),
        .Q(GT1_TXCHARISK_IN[1]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \TX_CHAR_IS_K_Buffer_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_TX_CHAR_IS_K_Buffer[3]_i_1__0 ),
        .Q(GT1_TXCHARISK_IN[0]),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair155" *) 
   LUT5 #(
    .INIT(32'h00730040)) 
     \TX_DATA_Buffer[0]_i_1__0 
       (.I0(\n_0_gen_pad_r_reg[1] ),
        .I1(\n_0_tx_pe_data_v_r_reg[1] ),
        .I2(tx_pe_data_r[31]),
        .I3(\n_0_gen_ecp_r_reg[1] ),
        .I4(gen_cc_r),
        .O(\n_0_TX_DATA_Buffer[0]_i_1__0 ));
LUT6 #(
    .INIT(64'hEFEFEFEFEFEFEFEA)) 
     \TX_DATA_Buffer[10]_i_1__0 
       (.I0(\n_0_gen_ecp_r_reg[1] ),
        .I1(tx_pe_data_r[21]),
        .I2(\n_0_tx_pe_data_v_r_reg[1] ),
        .I3(\n_0_TX_DATA_Buffer[18]_i_2__0 ),
        .I4(TX_DATA_Buffer17_out),
        .I5(TX_DATA_Buffer15_out),
        .O(\n_0_TX_DATA_Buffer[10]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair162" *) 
   LUT4 #(
    .INIT(16'hFBAB)) 
     \TX_DATA_Buffer[11]_i_1__0 
       (.I0(\n_0_gen_ecp_r_reg[1] ),
        .I1(gen_cc_r),
        .I2(\n_0_tx_pe_data_v_r_reg[1] ),
        .I3(tx_pe_data_r[20]),
        .O(\n_0_TX_DATA_Buffer[11]_i_1__0 ));
LUT6 #(
    .INIT(64'hEFEFEFEFEFEFEFEA)) 
     \TX_DATA_Buffer[12]_i_1__0 
       (.I0(\n_0_gen_ecp_r_reg[1] ),
        .I1(tx_pe_data_r[19]),
        .I2(\n_0_tx_pe_data_v_r_reg[1] ),
        .I3(TX_DATA_Buffer17_out),
        .I4(TX_DATA_Buffer15_out),
        .I5(gen_cc_r),
        .O(\n_0_TX_DATA_Buffer[12]_i_1__0 ));
LUT6 #(
    .INIT(64'hEFEAEFEAEFEAEFEF)) 
     \TX_DATA_Buffer[13]_i_1__0 
       (.I0(\n_0_gen_ecp_r_reg[1] ),
        .I1(tx_pe_data_r[18]),
        .I2(\n_0_tx_pe_data_v_r_reg[1] ),
        .I3(\n_0_TX_DATA_Buffer[13]_i_2 ),
        .I4(gen_sp_r),
        .I5(TX_DATA_Buffer15_out),
        .O(\n_0_TX_DATA_Buffer[13]_i_1__0 ));
LUT6 #(
    .INIT(64'hF0F0F0F0F0F1F0F0)) 
     \TX_DATA_Buffer[13]_i_2 
       (.I0(\n_0_TX_DATA_Buffer[31]_i_3__0 ),
        .I1(\n_0_gen_ecp_r_reg[1] ),
        .I2(gen_cc_r),
        .I3(p_1_in1_in),
        .I4(p_0_in6_in),
        .I5(\n_0_tx_pe_data_v_r_reg[1] ),
        .O(\n_0_TX_DATA_Buffer[13]_i_2 ));
LUT6 #(
    .INIT(64'hFFFFFFFF00001011)) 
     \TX_DATA_Buffer[14]_i_1__0 
       (.I0(TX_DATA_Buffer17_out),
        .I1(TX_DATA_Buffer15_out),
        .I2(gen_sp_r),
        .I3(gen_spa_r),
        .I4(\n_0_tx_pe_data_v_r_reg[1] ),
        .I5(\n_0_TX_DATA_Buffer[14]_i_2 ),
        .O(\n_0_TX_DATA_Buffer[14]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair162" *) 
   LUT4 #(
    .INIT(16'hEEFC)) 
     \TX_DATA_Buffer[14]_i_2 
       (.I0(tx_pe_data_r[17]),
        .I1(\n_0_gen_ecp_r_reg[1] ),
        .I2(gen_cc_r),
        .I3(\n_0_tx_pe_data_v_r_reg[1] ),
        .O(\n_0_TX_DATA_Buffer[14]_i_2 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
     \TX_DATA_Buffer[15]_i_1__0 
       (.I0(\n_0_gen_ecp_r_reg[1] ),
        .I1(p_1_in1_in),
        .I2(TX_DATA_Buffer17_out),
        .I3(TX_DATA_Buffer15_out),
        .I4(\n_0_tx_pe_data_v_r_reg[1] ),
        .I5(\n_0_TX_DATA_Buffer[15]_i_5__0 ),
        .O(\n_0_TX_DATA_Buffer[15]_i_1__0 ));
LUT6 #(
    .INIT(64'hEFEFEFEFEFEFEFEA)) 
     \TX_DATA_Buffer[15]_i_2__0 
       (.I0(\n_0_gen_ecp_r_reg[1] ),
        .I1(tx_pe_data_r[16]),
        .I2(\n_0_tx_pe_data_v_r_reg[1] ),
        .I3(TX_DATA_Buffer17_out),
        .I4(gen_cc_r),
        .I5(\n_0_TX_DATA_Buffer[15]_i_6 ),
        .O(\n_0_TX_DATA_Buffer[15]_i_2__0 ));
LUT6 #(
    .INIT(64'h0000000000000004)) 
     \TX_DATA_Buffer[15]_i_3__0 
       (.I0(\n_0_tx_pe_data_v_r_reg[1] ),
        .I1(p_0_in6_in),
        .I2(p_1_in1_in),
        .I3(gen_cc_r),
        .I4(\n_0_gen_ecp_r_reg[1] ),
        .I5(\n_0_TX_DATA_Buffer[31]_i_3__0 ),
        .O(TX_DATA_Buffer17_out));
LUT6 #(
    .INIT(64'h0000000000000004)) 
     \TX_DATA_Buffer[15]_i_4__0 
       (.I0(\n_0_tx_pe_data_v_r_reg[1] ),
        .I1(p_0_in),
        .I2(p_1_in1_in),
        .I3(gen_cc_r),
        .I4(\n_0_gen_ecp_r_reg[1] ),
        .I5(\n_0_TX_DATA_Buffer[31]_i_3__0 ),
        .O(TX_DATA_Buffer15_out));
(* SOFT_HLUTNM = "soft_lutpair160" *) 
   LUT3 #(
    .INIT(8'hFE)) 
     \TX_DATA_Buffer[15]_i_5__0 
       (.I0(gen_spa_r),
        .I1(gen_sp_r),
        .I2(gen_cc_r),
        .O(\n_0_TX_DATA_Buffer[15]_i_5__0 ));
LUT6 #(
    .INIT(64'h00000000FFFFFEFF)) 
     \TX_DATA_Buffer[15]_i_6 
       (.I0(\n_0_gen_ecp_r_reg[1] ),
        .I1(gen_cc_r),
        .I2(p_1_in1_in),
        .I3(p_0_in),
        .I4(\n_0_tx_pe_data_v_r_reg[1] ),
        .I5(\n_0_TX_DATA_Buffer[31]_i_3__0 ),
        .O(\n_0_TX_DATA_Buffer[15]_i_6 ));
(* SOFT_HLUTNM = "soft_lutpair163" *) 
   LUT4 #(
    .INIT(16'h7340)) 
     \TX_DATA_Buffer[16]_i_1__0 
       (.I0(p_0_in15_in),
        .I1(p_1_in10_in),
        .I2(tx_pe_data_r[15]),
        .I3(gen_cc_r),
        .O(\n_0_TX_DATA_Buffer[16]_i_1__0 ));
LUT6 #(
    .INIT(64'h2F2F2F2F202F2020)) 
     \TX_DATA_Buffer[17]_i_1__0 
       (.I0(tx_pe_data_r[14]),
        .I1(p_0_in15_in),
        .I2(p_1_in10_in),
        .I3(\n_0_TX_DATA_Buffer[23]_i_3__0 ),
        .I4(gen_sp_r),
        .I5(gen_cc_r),
        .O(\n_0_TX_DATA_Buffer[17]_i_1__0 ));
LUT5 #(
    .INIT(32'hFEFEFE0E)) 
     \TX_DATA_Buffer[18]_i_1__0 
       (.I0(\n_0_TX_DATA_Buffer[18]_i_2__0 ),
        .I1(\n_0_TX_DATA_Buffer[23]_i_3__0 ),
        .I2(p_1_in10_in),
        .I3(p_0_in15_in),
        .I4(tx_pe_data_r[13]),
        .O(\n_0_TX_DATA_Buffer[18]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair161" *) 
   LUT3 #(
    .INIT(8'hF4)) 
     \TX_DATA_Buffer[18]_i_2__0 
       (.I0(gen_sp_r),
        .I1(gen_spa_r),
        .I2(gen_cc_r),
        .O(\n_0_TX_DATA_Buffer[18]_i_2__0 ));
(* SOFT_HLUTNM = "soft_lutpair163" *) 
   LUT4 #(
    .INIT(16'hC8FB)) 
     \TX_DATA_Buffer[19]_i_1__0 
       (.I0(tx_pe_data_r[12]),
        .I1(p_1_in10_in),
        .I2(p_0_in15_in),
        .I3(gen_cc_r),
        .O(\n_0_TX_DATA_Buffer[19]_i_1__0 ));
LUT5 #(
    .INIT(32'hBBBBABAA)) 
     \TX_DATA_Buffer[1]_i_1__0 
       (.I0(\n_0_TX_DATA_Buffer[1]_i_2 ),
        .I1(\n_0_tx_pe_data_v_r_reg[1] ),
        .I2(\n_0_TX_DATA_Buffer[6]_i_3 ),
        .I3(gen_sp_r),
        .I4(gen_cc_r),
        .O(p_1_in[1]));
(* SOFT_HLUTNM = "soft_lutpair164" *) 
   LUT4 #(
    .INIT(16'hFF20)) 
     \TX_DATA_Buffer[1]_i_2 
       (.I0(\n_0_tx_pe_data_v_r_reg[1] ),
        .I1(\n_0_gen_pad_r_reg[1] ),
        .I2(tx_pe_data_r[30]),
        .I3(\n_0_gen_ecp_r_reg[1] ),
        .O(\n_0_TX_DATA_Buffer[1]_i_2 ));
LUT5 #(
    .INIT(32'hFEFEFE0E)) 
     \TX_DATA_Buffer[20]_i_1__0 
       (.I0(\n_0_TX_DATA_Buffer[23]_i_3__0 ),
        .I1(gen_cc_r),
        .I2(p_1_in10_in),
        .I3(p_0_in15_in),
        .I4(tx_pe_data_r[11]),
        .O(\n_0_TX_DATA_Buffer[20]_i_1__0 ));
LUT4 #(
    .INIT(16'h2F20)) 
     \TX_DATA_Buffer[21]_i_1 
       (.I0(tx_pe_data_r[10]),
        .I1(p_0_in15_in),
        .I2(p_1_in10_in),
        .I3(\n_0_TX_DATA_Buffer[21]_i_2__0 ),
        .O(\n_0_TX_DATA_Buffer[21]_i_1 ));
LUT6 #(
    .INIT(64'hCFCFCFCFCFEECFEF)) 
     \TX_DATA_Buffer[21]_i_2__0 
       (.I0(p_0_in11_in),
        .I1(gen_cc_r),
        .I2(gen_sp_r),
        .I3(p_1_in5_in),
        .I4(p_0_in8_in),
        .I5(p_15_in),
        .O(\n_0_TX_DATA_Buffer[21]_i_2__0 ));
(* SOFT_HLUTNM = "soft_lutpair157" *) 
   LUT4 #(
    .INIT(16'hFFFE)) 
     \TX_DATA_Buffer[21]_i_3 
       (.I0(gen_spa_r),
        .I1(gen_sp_r),
        .I2(p_1_in10_in),
        .I3(gen_cc_r),
        .O(p_15_in));
LUT6 #(
    .INIT(64'h2F2F2F2F202F2020)) 
     \TX_DATA_Buffer[22]_i_1 
       (.I0(tx_pe_data_r[9]),
        .I1(p_0_in15_in),
        .I2(p_1_in10_in),
        .I3(\n_0_TX_DATA_Buffer[23]_i_3__0 ),
        .I4(\n_0_TX_DATA_Buffer[22]_i_2__0 ),
        .I5(gen_cc_r),
        .O(\n_0_TX_DATA_Buffer[22]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair159" *) 
   LUT2 #(
    .INIT(4'hB)) 
     \TX_DATA_Buffer[22]_i_2__0 
       (.I0(gen_sp_r),
        .I1(gen_spa_r),
        .O(\n_0_TX_DATA_Buffer[22]_i_2__0 ));
LUT5 #(
    .INIT(32'hFFFFFFFE)) 
     \TX_DATA_Buffer[23]_i_1 
       (.I0(p_1_in10_in),
        .I1(p_1_in5_in),
        .I2(\n_0_TX_DATA_Buffer[23]_i_3__0 ),
        .I3(\n_0_TX_DATA_Buffer[31]_i_3__0 ),
        .I4(gen_cc_r),
        .O(\n_0_TX_DATA_Buffer[23]_i_1 ));
LUT4 #(
    .INIT(16'hEEE2)) 
     \TX_DATA_Buffer[23]_i_2__0 
       (.I0(\n_0_TX_DATA_Buffer[23]_i_4 ),
        .I1(p_1_in10_in),
        .I2(p_0_in15_in),
        .I3(tx_pe_data_r[8]),
        .O(\n_0_TX_DATA_Buffer[23]_i_2__0 ));
LUT6 #(
    .INIT(64'h0000000000000032)) 
     \TX_DATA_Buffer[23]_i_3__0 
       (.I0(p_0_in11_in),
        .I1(p_1_in5_in),
        .I2(p_0_in8_in),
        .I3(\n_0_TX_DATA_Buffer[31]_i_3__0 ),
        .I4(gen_cc_r),
        .I5(p_1_in10_in),
        .O(\n_0_TX_DATA_Buffer[23]_i_3__0 ));
LUT6 #(
    .INIT(64'hFFFF3333FFFF3233)) 
     \TX_DATA_Buffer[23]_i_4 
       (.I0(p_0_in11_in),
        .I1(\n_0_TX_DATA_Buffer[31]_i_3__0 ),
        .I2(p_1_in5_in),
        .I3(p_0_in8_in),
        .I4(gen_cc_r),
        .I5(p_1_in10_in),
        .O(\n_0_TX_DATA_Buffer[23]_i_4 ));
(* SOFT_HLUTNM = "soft_lutpair167" *) 
   LUT3 #(
    .INIT(8'hE2)) 
     \TX_DATA_Buffer[24]_i_1__0 
       (.I0(gen_cc_r),
        .I1(p_1_in10_in),
        .I2(tx_pe_data_r[7]),
        .O(\n_0_TX_DATA_Buffer[24]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair168" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \TX_DATA_Buffer[25]_i_1__0 
       (.I0(tx_pe_data_r[6]),
        .I1(p_1_in10_in),
        .I2(gen_cc_r),
        .O(\n_0_TX_DATA_Buffer[25]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair166" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \TX_DATA_Buffer[26]_i_1__0 
       (.I0(tx_pe_data_r[5]),
        .I1(p_1_in10_in),
        .I2(\n_0_TX_DATA_Buffer[28]_i_2__0 ),
        .O(\n_0_TX_DATA_Buffer[26]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair167" *) 
   LUT3 #(
    .INIT(8'hD1)) 
     \TX_DATA_Buffer[27]_i_1__0 
       (.I0(gen_cc_r),
        .I1(p_1_in10_in),
        .I2(tx_pe_data_r[4]),
        .O(\n_0_TX_DATA_Buffer[27]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair166" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \TX_DATA_Buffer[28]_i_1__0 
       (.I0(tx_pe_data_r[3]),
        .I1(p_1_in10_in),
        .I2(\n_0_TX_DATA_Buffer[28]_i_2__0 ),
        .O(\n_0_TX_DATA_Buffer[28]_i_1__0 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFF5554)) 
     \TX_DATA_Buffer[28]_i_2__0 
       (.I0(p_1_in10_in),
        .I1(p_0_in20_in),
        .I2(gen_a_r),
        .I3(p_0_in17_in),
        .I4(gen_cc_r),
        .I5(\n_0_TX_DATA_Buffer[31]_i_3__0 ),
        .O(\n_0_TX_DATA_Buffer[28]_i_2__0 ));
LUT6 #(
    .INIT(64'hBBBBBBBBBBBBBB8B)) 
     \TX_DATA_Buffer[29]_i_1__0 
       (.I0(tx_pe_data_r[2]),
        .I1(p_1_in10_in),
        .I2(TX_DATA_Buffer119_out),
        .I3(TX_DATA_Buffer121_out),
        .I4(TX_DATA_Buffer122_out),
        .I5(gen_cc_r),
        .O(\n_0_TX_DATA_Buffer[29]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair157" *) 
   LUT5 #(
    .INIT(32'h00010000)) 
     \TX_DATA_Buffer[29]_i_2__0 
       (.I0(gen_spa_r),
        .I1(gen_sp_r),
        .I2(p_1_in10_in),
        .I3(gen_cc_r),
        .I4(p_0_in17_in),
        .O(TX_DATA_Buffer119_out));
(* SOFT_HLUTNM = "soft_lutpair161" *) 
   LUT5 #(
    .INIT(32'h00010000)) 
     \TX_DATA_Buffer[29]_i_3 
       (.I0(gen_spa_r),
        .I1(gen_sp_r),
        .I2(p_1_in10_in),
        .I3(gen_cc_r),
        .I4(p_0_in20_in),
        .O(TX_DATA_Buffer121_out));
(* SOFT_HLUTNM = "soft_lutpair160" *) 
   LUT5 #(
    .INIT(32'h00010000)) 
     \TX_DATA_Buffer[29]_i_4 
       (.I0(gen_spa_r),
        .I1(gen_sp_r),
        .I2(p_1_in10_in),
        .I3(gen_cc_r),
        .I4(gen_a_r),
        .O(TX_DATA_Buffer122_out));
LUT6 #(
    .INIT(64'hFFFFFEFEFFF0FEFE)) 
     \TX_DATA_Buffer[2]_i_1__0 
       (.I0(\n_0_TX_DATA_Buffer[18]_i_2__0 ),
        .I1(\n_0_TX_DATA_Buffer[6]_i_3 ),
        .I2(\n_0_gen_ecp_r_reg[1] ),
        .I3(\n_0_gen_pad_r_reg[1] ),
        .I4(\n_0_tx_pe_data_v_r_reg[1] ),
        .I5(tx_pe_data_r[29]),
        .O(p_1_in[2]));
LUT6 #(
    .INIT(64'hBBBBBBBBBB8BBB88)) 
     \TX_DATA_Buffer[30]_i_1__0 
       (.I0(tx_pe_data_r[1]),
        .I1(p_1_in10_in),
        .I2(\n_0_TX_DATA_Buffer[31]_i_3__0 ),
        .I3(gen_cc_r),
        .I4(gen_a_r),
        .I5(\n_0_TX_DATA_Buffer[30]_i_2__0 ),
        .O(\n_0_TX_DATA_Buffer[30]_i_1__0 ));
LUT6 #(
    .INIT(64'h000000000000FFF1)) 
     \TX_DATA_Buffer[30]_i_2__0 
       (.I0(p_0_in20_in),
        .I1(p_0_in17_in),
        .I2(gen_cc_r),
        .I3(p_1_in10_in),
        .I4(gen_sp_r),
        .I5(gen_spa_r),
        .O(\n_0_TX_DATA_Buffer[30]_i_2__0 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
     \TX_DATA_Buffer[31]_i_1__0 
       (.I0(p_0_in17_in),
        .I1(gen_a_r),
        .I2(p_0_in20_in),
        .I3(gen_cc_r),
        .I4(\n_0_TX_DATA_Buffer[31]_i_3__0 ),
        .I5(p_1_in10_in),
        .O(\n_0_TX_DATA_Buffer[31]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair168" *) 
   LUT3 #(
    .INIT(8'hF8)) 
     \TX_DATA_Buffer[31]_i_2__0 
       (.I0(p_1_in10_in),
        .I1(tx_pe_data_r[0]),
        .I2(\n_0_TX_DATA_Buffer[31]_i_4__0 ),
        .O(\n_0_TX_DATA_Buffer[31]_i_2__0 ));
(* SOFT_HLUTNM = "soft_lutpair156" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \TX_DATA_Buffer[31]_i_3__0 
       (.I0(gen_sp_r),
        .I1(gen_spa_r),
        .O(\n_0_TX_DATA_Buffer[31]_i_3__0 ));
LUT6 #(
    .INIT(64'h00000000FFF2FFF3)) 
     \TX_DATA_Buffer[31]_i_4__0 
       (.I0(p_0_in20_in),
        .I1(gen_a_r),
        .I2(gen_cc_r),
        .I3(\n_0_TX_DATA_Buffer[31]_i_3__0 ),
        .I4(p_0_in17_in),
        .I5(p_1_in10_in),
        .O(\n_0_TX_DATA_Buffer[31]_i_4__0 ));
(* SOFT_HLUTNM = "soft_lutpair158" *) 
   LUT5 #(
    .INIT(32'hFAEAFFEF)) 
     \TX_DATA_Buffer[3]_i_1__0 
       (.I0(\n_0_gen_ecp_r_reg[1] ),
        .I1(tx_pe_data_r[28]),
        .I2(\n_0_tx_pe_data_v_r_reg[1] ),
        .I3(\n_0_gen_pad_r_reg[1] ),
        .I4(gen_cc_r),
        .O(p_1_in[3]));
LUT6 #(
    .INIT(64'hFFFFFFEEFFFFF0EE)) 
     \TX_DATA_Buffer[4]_i_1__0 
       (.I0(\n_0_TX_DATA_Buffer[6]_i_3 ),
        .I1(gen_cc_r),
        .I2(\n_0_gen_pad_r_reg[1] ),
        .I3(\n_0_tx_pe_data_v_r_reg[1] ),
        .I4(\n_0_gen_ecp_r_reg[1] ),
        .I5(tx_pe_data_r[27]),
        .O(p_1_in[4]));
LUT6 #(
    .INIT(64'hDDDCDDDCDDDCDDDD)) 
     \TX_DATA_Buffer[5]_i_1__0 
       (.I0(\n_0_tx_pe_data_v_r_reg[1] ),
        .I1(\n_0_TX_DATA_Buffer[5]_i_2__0 ),
        .I2(TX_DATA_Buffer10_out),
        .I3(gen_cc_r),
        .I4(gen_sp_r),
        .I5(TX_DATA_Buffer1),
        .O(p_1_in[5]));
(* SOFT_HLUTNM = "soft_lutpair165" *) 
   LUT4 #(
    .INIT(16'hFF20)) 
     \TX_DATA_Buffer[5]_i_2__0 
       (.I0(\n_0_tx_pe_data_v_r_reg[1] ),
        .I1(\n_0_gen_pad_r_reg[1] ),
        .I2(tx_pe_data_r[26]),
        .I3(\n_0_gen_ecp_r_reg[1] ),
        .O(\n_0_TX_DATA_Buffer[5]_i_2__0 ));
LUT6 #(
    .INIT(64'hDDDDDDDDCDCCCDCD)) 
     \TX_DATA_Buffer[6]_i_1__0 
       (.I0(\n_0_tx_pe_data_v_r_reg[1] ),
        .I1(\n_0_TX_DATA_Buffer[6]_i_2__0 ),
        .I2(\n_0_TX_DATA_Buffer[6]_i_3 ),
        .I3(gen_sp_r),
        .I4(gen_spa_r),
        .I5(gen_cc_r),
        .O(p_1_in[6]));
(* SOFT_HLUTNM = "soft_lutpair165" *) 
   LUT4 #(
    .INIT(16'hFF20)) 
     \TX_DATA_Buffer[6]_i_2__0 
       (.I0(\n_0_tx_pe_data_v_r_reg[1] ),
        .I1(\n_0_gen_pad_r_reg[1] ),
        .I2(tx_pe_data_r[25]),
        .I3(\n_0_gen_ecp_r_reg[1] ),
        .O(\n_0_TX_DATA_Buffer[6]_i_2__0 ));
LUT6 #(
    .INIT(64'h0000000000030002)) 
     \TX_DATA_Buffer[6]_i_3 
       (.I0(\n_0_gen_k_r_reg[3] ),
        .I1(\n_0_TX_DATA_Buffer[31]_i_3__0 ),
        .I2(\n_0_TX_DATA_Buffer[9]_i_3 ),
        .I3(p_1_in_0),
        .I4(\n_0_gen_r_r_reg[3] ),
        .I5(\n_0_tx_pe_data_v_r_reg[1] ),
        .O(\n_0_TX_DATA_Buffer[6]_i_3 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
     \TX_DATA_Buffer[7]_i_1__0 
       (.I0(\n_0_tx_pe_data_v_r_reg[1] ),
        .I1(p_1_in_0),
        .I2(\n_0_gen_ecp_r_reg[1] ),
        .I3(\n_0_TX_DATA_Buffer[15]_i_5__0 ),
        .I4(TX_DATA_Buffer10_out),
        .I5(TX_DATA_Buffer1),
        .O(\n_0_TX_DATA_Buffer[7]_i_1__0 ));
LUT6 #(
    .INIT(64'hFFFFFFFF54545455)) 
     \TX_DATA_Buffer[7]_i_2__0 
       (.I0(TX_DATA_Buffer12_out),
        .I1(TX_DATA_Buffer10_out),
        .I2(gen_cc_r),
        .I3(\n_0_TX_DATA_Buffer[31]_i_3__0 ),
        .I4(TX_DATA_Buffer1),
        .I5(\n_0_TX_DATA_Buffer[7]_i_6 ),
        .O(p_1_in[7]));
LUT6 #(
    .INIT(64'h0000000000000004)) 
     \TX_DATA_Buffer[7]_i_3__0 
       (.I0(\n_0_tx_pe_data_v_r_reg[1] ),
        .I1(\n_0_gen_k_r_reg[3] ),
        .I2(p_1_in_0),
        .I3(gen_cc_r),
        .I4(\n_0_gen_ecp_r_reg[1] ),
        .I5(\n_0_TX_DATA_Buffer[31]_i_3__0 ),
        .O(TX_DATA_Buffer10_out));
LUT6 #(
    .INIT(64'h0000000000000004)) 
     \TX_DATA_Buffer[7]_i_4__0 
       (.I0(\n_0_tx_pe_data_v_r_reg[1] ),
        .I1(\n_0_gen_r_r_reg[3] ),
        .I2(p_1_in_0),
        .I3(gen_cc_r),
        .I4(\n_0_gen_ecp_r_reg[1] ),
        .I5(\n_0_TX_DATA_Buffer[31]_i_3__0 ),
        .O(TX_DATA_Buffer1));
(* SOFT_HLUTNM = "soft_lutpair155" *) 
   LUT2 #(
    .INIT(4'h2)) 
     \TX_DATA_Buffer[7]_i_5 
       (.I0(\n_0_tx_pe_data_v_r_reg[1] ),
        .I1(\n_0_gen_pad_r_reg[1] ),
        .O(TX_DATA_Buffer12_out));
(* SOFT_HLUTNM = "soft_lutpair164" *) 
   LUT4 #(
    .INIT(16'hFCEC)) 
     \TX_DATA_Buffer[7]_i_6 
       (.I0(tx_pe_data_r[24]),
        .I1(\n_0_gen_ecp_r_reg[1] ),
        .I2(\n_0_tx_pe_data_v_r_reg[1] ),
        .I3(\n_0_gen_pad_r_reg[1] ),
        .O(\n_0_TX_DATA_Buffer[7]_i_6 ));
LUT4 #(
    .INIT(16'hFEAE)) 
     \TX_DATA_Buffer[8]_i_1__0 
       (.I0(\n_0_gen_ecp_r_reg[1] ),
        .I1(gen_cc_r),
        .I2(\n_0_tx_pe_data_v_r_reg[1] ),
        .I3(tx_pe_data_r[23]),
        .O(\n_0_TX_DATA_Buffer[8]_i_1__0 ));
LUT6 #(
    .INIT(64'h00000000FF55AE04)) 
     \TX_DATA_Buffer[9]_i_1__0 
       (.I0(\n_0_tx_pe_data_v_r_reg[1] ),
        .I1(gen_sp_r),
        .I2(\n_0_TX_DATA_Buffer[9]_i_2 ),
        .I3(tx_pe_data_r[22]),
        .I4(gen_cc_r),
        .I5(\n_0_gen_ecp_r_reg[1] ),
        .O(\n_0_TX_DATA_Buffer[9]_i_1__0 ));
LUT6 #(
    .INIT(64'h0000000000030002)) 
     \TX_DATA_Buffer[9]_i_2 
       (.I0(p_0_in),
        .I1(\n_0_TX_DATA_Buffer[31]_i_3__0 ),
        .I2(\n_0_TX_DATA_Buffer[9]_i_3 ),
        .I3(p_1_in1_in),
        .I4(p_0_in6_in),
        .I5(\n_0_tx_pe_data_v_r_reg[1] ),
        .O(\n_0_TX_DATA_Buffer[9]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair158" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \TX_DATA_Buffer[9]_i_3 
       (.I0(gen_cc_r),
        .I1(\n_0_gen_ecp_r_reg[1] ),
        .O(\n_0_TX_DATA_Buffer[9]_i_3 ));
FDRE \TX_DATA_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[7]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[0]_i_1__0 ),
        .Q(GT1_TXDATA_IN[24]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[10] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[15]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[10]_i_1__0 ),
        .Q(GT1_TXDATA_IN[18]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[11] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[15]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[11]_i_1__0 ),
        .Q(GT1_TXDATA_IN[19]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[12] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[15]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[12]_i_1__0 ),
        .Q(GT1_TXDATA_IN[20]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[13] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[15]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[13]_i_1__0 ),
        .Q(GT1_TXDATA_IN[21]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[14] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[15]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[14]_i_1__0 ),
        .Q(GT1_TXDATA_IN[22]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[15] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[15]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[15]_i_2__0 ),
        .Q(GT1_TXDATA_IN[23]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[16] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[23]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[16]_i_1__0 ),
        .Q(GT1_TXDATA_IN[8]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[17] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[23]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[17]_i_1__0 ),
        .Q(GT1_TXDATA_IN[9]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[18] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[23]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[18]_i_1__0 ),
        .Q(GT1_TXDATA_IN[10]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[19] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[23]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[19]_i_1__0 ),
        .Q(GT1_TXDATA_IN[11]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[7]_i_1__0 ),
        .D(p_1_in[1]),
        .Q(GT1_TXDATA_IN[25]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[20] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[23]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[20]_i_1__0 ),
        .Q(GT1_TXDATA_IN[12]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[21] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[23]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[21]_i_1 ),
        .Q(GT1_TXDATA_IN[13]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[22] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[23]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[22]_i_1 ),
        .Q(GT1_TXDATA_IN[14]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[23] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[23]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[23]_i_2__0 ),
        .Q(GT1_TXDATA_IN[15]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[24] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[31]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[24]_i_1__0 ),
        .Q(GT1_TXDATA_IN[0]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[25] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[31]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[25]_i_1__0 ),
        .Q(GT1_TXDATA_IN[1]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[26] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[31]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[26]_i_1__0 ),
        .Q(GT1_TXDATA_IN[2]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[27] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[31]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[27]_i_1__0 ),
        .Q(GT1_TXDATA_IN[3]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[28] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[31]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[28]_i_1__0 ),
        .Q(GT1_TXDATA_IN[4]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[29] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[31]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[29]_i_1__0 ),
        .Q(GT1_TXDATA_IN[5]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[2] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[7]_i_1__0 ),
        .D(p_1_in[2]),
        .Q(GT1_TXDATA_IN[26]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[30] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[31]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[30]_i_1__0 ),
        .Q(GT1_TXDATA_IN[6]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[31] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[31]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[31]_i_2__0 ),
        .Q(GT1_TXDATA_IN[7]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[3] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[7]_i_1__0 ),
        .D(p_1_in[3]),
        .Q(GT1_TXDATA_IN[27]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[4] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[7]_i_1__0 ),
        .D(p_1_in[4]),
        .Q(GT1_TXDATA_IN[28]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[5] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[7]_i_1__0 ),
        .D(p_1_in[5]),
        .Q(GT1_TXDATA_IN[29]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[6] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[7]_i_1__0 ),
        .D(p_1_in[6]),
        .Q(GT1_TXDATA_IN[30]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[7] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[7]_i_1__0 ),
        .D(p_1_in[7]),
        .Q(GT1_TXDATA_IN[31]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[8] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[15]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[8]_i_1__0 ),
        .Q(GT1_TXDATA_IN[16]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[9] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[15]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[9]_i_1__0 ),
        .Q(GT1_TXDATA_IN[17]),
        .R(\<const0> ));
VCC VCC
       (.P(\<const1> ));
FDRE gen_a_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I4),
        .Q(gen_a_r),
        .R(\<const0> ));
FDRE gen_cc_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I2),
        .Q(gen_cc_r),
        .R(\<const0> ));
FDRE \gen_ecp_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I3),
        .Q(\n_0_gen_ecp_r_reg[1] ),
        .R(\<const0> ));
FDRE \gen_k_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I17[3]),
        .Q(p_0_in20_in),
        .R(\<const0> ));
FDRE \gen_k_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I17[2]),
        .Q(p_0_in11_in),
        .R(\<const0> ));
FDRE \gen_k_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I17[1]),
        .Q(p_0_in6_in),
        .R(\<const0> ));
FDRE \gen_k_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I17[0]),
        .Q(\n_0_gen_k_r_reg[3] ),
        .R(\<const0> ));
FDRE \gen_pad_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I12[1]),
        .Q(p_0_in15_in),
        .R(\<const0> ));
FDRE \gen_pad_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I12[0]),
        .Q(\n_0_gen_pad_r_reg[1] ),
        .R(\<const0> ));
FDRE \gen_r_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I16[3]),
        .Q(p_0_in17_in),
        .R(\<const0> ));
FDRE \gen_r_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I16[2]),
        .Q(p_0_in8_in),
        .R(\<const0> ));
FDRE \gen_r_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I16[1]),
        .Q(p_0_in),
        .R(\<const0> ));
FDRE \gen_r_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I16[0]),
        .Q(\n_0_gen_r_r_reg[3] ),
        .R(\<const0> ));
FDRE gen_sp_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GEN_SP),
        .Q(gen_sp_r),
        .R(\<const0> ));
FDRE gen_spa_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GEN_SPA),
        .Q(gen_spa_r),
        .R(\<const0> ));
FDRE \gen_v_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I15[2]),
        .Q(p_1_in5_in),
        .R(\<const0> ));
FDRE \gen_v_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I15[1]),
        .Q(p_1_in1_in),
        .R(\<const0> ));
FDRE \gen_v_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I15[0]),
        .Q(p_1_in_0),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[31]),
        .Q(tx_pe_data_r[0]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[10] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[21]),
        .Q(tx_pe_data_r[10]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[11] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[20]),
        .Q(tx_pe_data_r[11]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[12] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[19]),
        .Q(tx_pe_data_r[12]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[13] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[18]),
        .Q(tx_pe_data_r[13]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[14] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[17]),
        .Q(tx_pe_data_r[14]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[15] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[16]),
        .Q(tx_pe_data_r[15]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[16] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[15]),
        .Q(tx_pe_data_r[16]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[17] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[14]),
        .Q(tx_pe_data_r[17]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[18] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[13]),
        .Q(tx_pe_data_r[18]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[19] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[12]),
        .Q(tx_pe_data_r[19]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[30]),
        .Q(tx_pe_data_r[1]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[20] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[11]),
        .Q(tx_pe_data_r[20]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[21] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[10]),
        .Q(tx_pe_data_r[21]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[22] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[9]),
        .Q(tx_pe_data_r[22]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[23] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[8]),
        .Q(tx_pe_data_r[23]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[24] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[7]),
        .Q(tx_pe_data_r[24]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[25] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[6]),
        .Q(tx_pe_data_r[25]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[26] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[5]),
        .Q(tx_pe_data_r[26]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[27] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[4]),
        .Q(tx_pe_data_r[27]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[28] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[3]),
        .Q(tx_pe_data_r[28]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[29] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[2]),
        .Q(tx_pe_data_r[29]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[29]),
        .Q(tx_pe_data_r[2]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[30] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[1]),
        .Q(tx_pe_data_r[30]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[31] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[0]),
        .Q(tx_pe_data_r[31]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[28]),
        .Q(tx_pe_data_r[3]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[27]),
        .Q(tx_pe_data_r[4]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[26]),
        .Q(tx_pe_data_r[5]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[25]),
        .Q(tx_pe_data_r[6]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[24]),
        .Q(tx_pe_data_r[7]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[8] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[23]),
        .Q(tx_pe_data_r[8]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[9] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I25[22]),
        .Q(tx_pe_data_r[9]),
        .R(\<const0> ));
FDRE \tx_pe_data_v_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I14[1]),
        .Q(p_1_in10_in),
        .R(\<const0> ));
FDRE \tx_pe_data_v_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I14[0]),
        .Q(\n_0_tx_pe_data_v_r_reg[1] ),
        .R(\<const0> ));
endmodule

(* ORIG_REF_NAME = "data_mgt_SYM_GEN_4BYTE" *) 
module data_mgtdata_mgt_SYM_GEN_4BYTE_4
   (GT0_TXCHARISK_IN,
    GT0_TXDATA_IN,
    GEN_SPA,
    user_clk,
    GEN_SP,
    GEN_CC,
    GEN_SCP,
    GEN_A,
    I11,
    I12,
    I14,
    I15,
    I16,
    I24);
  output [3:0]GT0_TXCHARISK_IN;
  output [31:0]GT0_TXDATA_IN;
  input GEN_SPA;
  input user_clk;
  input GEN_SP;
  input GEN_CC;
  input GEN_SCP;
  input GEN_A;
  input [1:0]I11;
  input [1:0]I12;
  input [2:0]I14;
  input [3:0]I15;
  input [3:0]I16;
  input [31:0]I24;

  wire \<const0> ;
  wire \<const1> ;
  wire GEN_A;
  wire GEN_CC;
  wire GEN_SCP;
  wire GEN_SP;
  wire GEN_SPA;
  wire [3:0]GT0_TXCHARISK_IN;
  wire [31:0]GT0_TXDATA_IN;
  wire [1:0]I11;
  wire [1:0]I12;
  wire [2:0]I14;
  wire [3:0]I15;
  wire [3:0]I16;
  wire [31:0]I24;
  wire TX_DATA_Buffer110_out;
  wire TX_DATA_Buffer112_out;
  wire TX_DATA_Buffer114_out;
  wire TX_DATA_Buffer15_out;
  wire TX_DATA_Buffer17_out;
  wire gen_a_r;
  wire gen_cc_r;
  wire gen_sp_r;
  wire gen_spa_r;
  wire \n_0_TX_CHAR_IS_K_Buffer[0]_i_1 ;
  wire \n_0_TX_CHAR_IS_K_Buffer[1]_i_1 ;
  wire \n_0_TX_CHAR_IS_K_Buffer[2]_i_1 ;
  wire \n_0_TX_CHAR_IS_K_Buffer[3]_i_1 ;
  wire \n_0_TX_DATA_Buffer[0]_i_1 ;
  wire \n_0_TX_DATA_Buffer[10]_i_1 ;
  wire \n_0_TX_DATA_Buffer[11]_i_1 ;
  wire \n_0_TX_DATA_Buffer[12]_i_1 ;
  wire \n_0_TX_DATA_Buffer[13]_i_1 ;
  wire \n_0_TX_DATA_Buffer[14]_i_1 ;
  wire \n_0_TX_DATA_Buffer[15]_i_1 ;
  wire \n_0_TX_DATA_Buffer[15]_i_2 ;
  wire \n_0_TX_DATA_Buffer[15]_i_3 ;
  wire \n_0_TX_DATA_Buffer[15]_i_6__0 ;
  wire \n_0_TX_DATA_Buffer[16]_i_1 ;
  wire \n_0_TX_DATA_Buffer[17]_i_1 ;
  wire \n_0_TX_DATA_Buffer[17]_i_2 ;
  wire \n_0_TX_DATA_Buffer[18]_i_1 ;
  wire \n_0_TX_DATA_Buffer[18]_i_2 ;
  wire \n_0_TX_DATA_Buffer[19]_i_1 ;
  wire \n_0_TX_DATA_Buffer[20]_i_1 ;
  wire \n_0_TX_DATA_Buffer[21]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[21]_i_2 ;
  wire \n_0_TX_DATA_Buffer[22]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[22]_i_2 ;
  wire \n_0_TX_DATA_Buffer[22]_i_3 ;
  wire \n_0_TX_DATA_Buffer[22]_i_4 ;
  wire \n_0_TX_DATA_Buffer[23]_i_1__0 ;
  wire \n_0_TX_DATA_Buffer[23]_i_2 ;
  wire \n_0_TX_DATA_Buffer[23]_i_3 ;
  wire \n_0_TX_DATA_Buffer[23]_i_7 ;
  wire \n_0_TX_DATA_Buffer[24]_i_1 ;
  wire \n_0_TX_DATA_Buffer[25]_i_1 ;
  wire \n_0_TX_DATA_Buffer[26]_i_1 ;
  wire \n_0_TX_DATA_Buffer[27]_i_1 ;
  wire \n_0_TX_DATA_Buffer[28]_i_1 ;
  wire \n_0_TX_DATA_Buffer[28]_i_2 ;
  wire \n_0_TX_DATA_Buffer[29]_i_1 ;
  wire \n_0_TX_DATA_Buffer[29]_i_2 ;
  wire \n_0_TX_DATA_Buffer[30]_i_1 ;
  wire \n_0_TX_DATA_Buffer[30]_i_2 ;
  wire \n_0_TX_DATA_Buffer[31]_i_1 ;
  wire \n_0_TX_DATA_Buffer[31]_i_2 ;
  wire \n_0_TX_DATA_Buffer[31]_i_3 ;
  wire \n_0_TX_DATA_Buffer[31]_i_4 ;
  wire \n_0_TX_DATA_Buffer[31]_i_5 ;
  wire \n_0_TX_DATA_Buffer[31]_i_6 ;
  wire \n_0_TX_DATA_Buffer[5]_i_2 ;
  wire \n_0_TX_DATA_Buffer[6]_i_2 ;
  wire \n_0_TX_DATA_Buffer[7]_i_1 ;
  wire \n_0_TX_DATA_Buffer[7]_i_3 ;
  wire \n_0_TX_DATA_Buffer[7]_i_4 ;
  wire \n_0_TX_DATA_Buffer[8]_i_1 ;
  wire \n_0_TX_DATA_Buffer[9]_i_1 ;
  wire \n_0_gen_k_r_reg[3] ;
  wire \n_0_gen_pad_r_reg[1] ;
  wire \n_0_gen_r_r_reg[3] ;
  wire \n_0_tx_pe_data_v_r_reg[1] ;
  wire p_0_in;
  wire p_0_in11_in;
  wire p_0_in15_in;
  wire p_0_in17_in;
  wire p_0_in20_in;
  wire p_0_in6_in;
  wire p_0_in8_in;
  wire [7:1]p_1_in;
  wire p_1_in10_in;
  wire p_1_in13_in;
  wire p_1_in1_in;
  wire p_1_in5_in;
  wire p_1_in_0;
  wire p_3_in;
  wire [0:31]tx_pe_data_r;
  wire user_clk;

GND GND
       (.G(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair88" *) 
   LUT5 #(
    .INIT(32'h00000051)) 
     \TX_CHAR_IS_K_Buffer[0]_i_1 
       (.I0(p_1_in_0),
        .I1(\n_0_tx_pe_data_v_r_reg[1] ),
        .I2(\n_0_gen_pad_r_reg[1] ),
        .I3(gen_spa_r),
        .I4(gen_sp_r),
        .O(\n_0_TX_CHAR_IS_K_Buffer[0]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair96" *) 
   LUT4 #(
    .INIT(16'h0001)) 
     \TX_CHAR_IS_K_Buffer[1]_i_1 
       (.I0(p_1_in1_in),
        .I1(\n_0_tx_pe_data_v_r_reg[1] ),
        .I2(gen_spa_r),
        .I3(gen_sp_r),
        .O(\n_0_TX_CHAR_IS_K_Buffer[1]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair91" *) 
   LUT5 #(
    .INIT(32'h00000051)) 
     \TX_CHAR_IS_K_Buffer[2]_i_1 
       (.I0(p_1_in5_in),
        .I1(p_1_in10_in),
        .I2(p_0_in15_in),
        .I3(gen_spa_r),
        .I4(gen_sp_r),
        .O(\n_0_TX_CHAR_IS_K_Buffer[2]_i_1 ));
LUT1 #(
    .INIT(2'h1)) 
     \TX_CHAR_IS_K_Buffer[3]_i_1 
       (.I0(p_1_in10_in),
        .O(\n_0_TX_CHAR_IS_K_Buffer[3]_i_1 ));
FDRE #(
    .INIT(1'b0)) 
     \TX_CHAR_IS_K_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_TX_CHAR_IS_K_Buffer[0]_i_1 ),
        .Q(GT0_TXCHARISK_IN[3]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \TX_CHAR_IS_K_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_TX_CHAR_IS_K_Buffer[1]_i_1 ),
        .Q(GT0_TXCHARISK_IN[2]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \TX_CHAR_IS_K_Buffer_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_TX_CHAR_IS_K_Buffer[2]_i_1 ),
        .Q(GT0_TXCHARISK_IN[1]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \TX_CHAR_IS_K_Buffer_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_TX_CHAR_IS_K_Buffer[3]_i_1 ),
        .Q(GT0_TXCHARISK_IN[0]),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair93" *) 
   LUT4 #(
    .INIT(16'h7340)) 
     \TX_DATA_Buffer[0]_i_1 
       (.I0(\n_0_gen_pad_r_reg[1] ),
        .I1(\n_0_tx_pe_data_v_r_reg[1] ),
        .I2(tx_pe_data_r[31]),
        .I3(gen_cc_r),
        .O(\n_0_TX_DATA_Buffer[0]_i_1 ));
LUT6 #(
    .INIT(64'hBBBBBBBBB8B8BBB8)) 
     \TX_DATA_Buffer[10]_i_1 
       (.I0(tx_pe_data_r[21]),
        .I1(\n_0_tx_pe_data_v_r_reg[1] ),
        .I2(gen_cc_r),
        .I3(gen_spa_r),
        .I4(gen_sp_r),
        .I5(\n_0_TX_DATA_Buffer[15]_i_3 ),
        .O(\n_0_TX_DATA_Buffer[10]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair98" *) 
   LUT3 #(
    .INIT(8'hD1)) 
     \TX_DATA_Buffer[11]_i_1 
       (.I0(gen_cc_r),
        .I1(\n_0_tx_pe_data_v_r_reg[1] ),
        .I2(tx_pe_data_r[20]),
        .O(\n_0_TX_DATA_Buffer[11]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair98" *) 
   LUT4 #(
    .INIT(16'hBBB8)) 
     \TX_DATA_Buffer[12]_i_1 
       (.I0(tx_pe_data_r[19]),
        .I1(\n_0_tx_pe_data_v_r_reg[1] ),
        .I2(\n_0_TX_DATA_Buffer[15]_i_3 ),
        .I3(gen_cc_r),
        .O(\n_0_TX_DATA_Buffer[12]_i_1 ));
LUT6 #(
    .INIT(64'hBBB8BBB8BBB8BBBB)) 
     \TX_DATA_Buffer[13]_i_1 
       (.I0(tx_pe_data_r[18]),
        .I1(\n_0_tx_pe_data_v_r_reg[1] ),
        .I2(TX_DATA_Buffer17_out),
        .I3(gen_cc_r),
        .I4(gen_sp_r),
        .I5(TX_DATA_Buffer15_out),
        .O(\n_0_TX_DATA_Buffer[13]_i_1 ));
LUT6 #(
    .INIT(64'hFFFFFF510000FF51)) 
     \TX_DATA_Buffer[14]_i_1 
       (.I0(\n_0_TX_DATA_Buffer[15]_i_3 ),
        .I1(gen_spa_r),
        .I2(gen_sp_r),
        .I3(gen_cc_r),
        .I4(\n_0_tx_pe_data_v_r_reg[1] ),
        .I5(tx_pe_data_r[17]),
        .O(\n_0_TX_DATA_Buffer[14]_i_1 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
     \TX_DATA_Buffer[15]_i_1 
       (.I0(\n_0_TX_DATA_Buffer[15]_i_3 ),
        .I1(\n_0_tx_pe_data_v_r_reg[1] ),
        .I2(gen_spa_r),
        .I3(gen_sp_r),
        .I4(gen_cc_r),
        .I5(p_1_in1_in),
        .O(\n_0_TX_DATA_Buffer[15]_i_1 ));
LUT6 #(
    .INIT(64'hBBB8BBB8BBB8BBBB)) 
     \TX_DATA_Buffer[15]_i_2 
       (.I0(tx_pe_data_r[16]),
        .I1(\n_0_tx_pe_data_v_r_reg[1] ),
        .I2(TX_DATA_Buffer17_out),
        .I3(gen_cc_r),
        .I4(\n_0_TX_DATA_Buffer[31]_i_4 ),
        .I5(TX_DATA_Buffer15_out),
        .O(\n_0_TX_DATA_Buffer[15]_i_2 ));
LUT6 #(
    .INIT(64'h0000000000000032)) 
     \TX_DATA_Buffer[15]_i_3 
       (.I0(p_0_in),
        .I1(p_1_in1_in),
        .I2(p_0_in6_in),
        .I3(\n_0_TX_DATA_Buffer[15]_i_6__0 ),
        .I4(gen_spa_r),
        .I5(gen_sp_r),
        .O(\n_0_TX_DATA_Buffer[15]_i_3 ));
LUT6 #(
    .INIT(64'h0000000000000004)) 
     \TX_DATA_Buffer[15]_i_4 
       (.I0(p_1_in1_in),
        .I1(p_0_in6_in),
        .I2(gen_spa_r),
        .I3(gen_sp_r),
        .I4(\n_0_tx_pe_data_v_r_reg[1] ),
        .I5(gen_cc_r),
        .O(TX_DATA_Buffer17_out));
LUT6 #(
    .INIT(64'h0000000000000004)) 
     \TX_DATA_Buffer[15]_i_5 
       (.I0(p_1_in1_in),
        .I1(p_0_in),
        .I2(gen_spa_r),
        .I3(gen_sp_r),
        .I4(\n_0_tx_pe_data_v_r_reg[1] ),
        .I5(gen_cc_r),
        .O(TX_DATA_Buffer15_out));
(* SOFT_HLUTNM = "soft_lutpair86" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \TX_DATA_Buffer[15]_i_6__0 
       (.I0(\n_0_tx_pe_data_v_r_reg[1] ),
        .I1(gen_cc_r),
        .O(\n_0_TX_DATA_Buffer[15]_i_6__0 ));
(* SOFT_HLUTNM = "soft_lutpair89" *) 
   LUT5 #(
    .INIT(32'hBFAFBAAA)) 
     \TX_DATA_Buffer[16]_i_1 
       (.I0(p_1_in13_in),
        .I1(p_0_in15_in),
        .I2(p_1_in10_in),
        .I3(tx_pe_data_r[15]),
        .I4(gen_cc_r),
        .O(\n_0_TX_DATA_Buffer[16]_i_1 ));
LUT5 #(
    .INIT(32'hBBBBABAA)) 
     \TX_DATA_Buffer[17]_i_1 
       (.I0(\n_0_TX_DATA_Buffer[17]_i_2 ),
        .I1(p_1_in10_in),
        .I2(\n_0_TX_DATA_Buffer[22]_i_3 ),
        .I3(gen_sp_r),
        .I4(gen_cc_r),
        .O(\n_0_TX_DATA_Buffer[17]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair95" *) 
   LUT4 #(
    .INIT(16'hFF20)) 
     \TX_DATA_Buffer[17]_i_2 
       (.I0(p_1_in10_in),
        .I1(p_0_in15_in),
        .I2(tx_pe_data_r[14]),
        .I3(p_1_in13_in),
        .O(\n_0_TX_DATA_Buffer[17]_i_2 ));
LUT6 #(
    .INIT(64'h00000000EFEFEFE0)) 
     \TX_DATA_Buffer[18]_i_1 
       (.I0(tx_pe_data_r[13]),
        .I1(p_0_in15_in),
        .I2(p_1_in10_in),
        .I3(\n_0_TX_DATA_Buffer[22]_i_3 ),
        .I4(\n_0_TX_DATA_Buffer[18]_i_2 ),
        .I5(p_1_in13_in),
        .O(\n_0_TX_DATA_Buffer[18]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair99" *) 
   LUT3 #(
    .INIT(8'hF4)) 
     \TX_DATA_Buffer[18]_i_2 
       (.I0(gen_sp_r),
        .I1(gen_spa_r),
        .I2(gen_cc_r),
        .O(\n_0_TX_DATA_Buffer[18]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair90" *) 
   LUT5 #(
    .INIT(32'hFAEAFFEF)) 
     \TX_DATA_Buffer[19]_i_1 
       (.I0(p_1_in13_in),
        .I1(tx_pe_data_r[12]),
        .I2(p_1_in10_in),
        .I3(p_0_in15_in),
        .I4(gen_cc_r),
        .O(\n_0_TX_DATA_Buffer[19]_i_1 ));
LUT6 #(
    .INIT(64'h2F2F2F2F202F2020)) 
     \TX_DATA_Buffer[1]_i_1 
       (.I0(tx_pe_data_r[30]),
        .I1(\n_0_gen_pad_r_reg[1] ),
        .I2(\n_0_tx_pe_data_v_r_reg[1] ),
        .I3(\n_0_TX_DATA_Buffer[7]_i_3 ),
        .I4(gen_sp_r),
        .I5(gen_cc_r),
        .O(p_1_in[1]));
LUT6 #(
    .INIT(64'hFFFFFFEEFFFFF0EE)) 
     \TX_DATA_Buffer[20]_i_1 
       (.I0(\n_0_TX_DATA_Buffer[22]_i_3 ),
        .I1(gen_cc_r),
        .I2(p_0_in15_in),
        .I3(p_1_in10_in),
        .I4(p_1_in13_in),
        .I5(tx_pe_data_r[11]),
        .O(\n_0_TX_DATA_Buffer[20]_i_1 ));
LUT6 #(
    .INIT(64'hDDDCDDDCDDDCDDDD)) 
     \TX_DATA_Buffer[21]_i_1__0 
       (.I0(p_1_in10_in),
        .I1(\n_0_TX_DATA_Buffer[21]_i_2 ),
        .I2(TX_DATA_Buffer112_out),
        .I3(gen_cc_r),
        .I4(gen_sp_r),
        .I5(TX_DATA_Buffer110_out),
        .O(\n_0_TX_DATA_Buffer[21]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair95" *) 
   LUT4 #(
    .INIT(16'hFF20)) 
     \TX_DATA_Buffer[21]_i_2 
       (.I0(p_1_in10_in),
        .I1(p_0_in15_in),
        .I2(tx_pe_data_r[10]),
        .I3(p_1_in13_in),
        .O(\n_0_TX_DATA_Buffer[21]_i_2 ));
LUT6 #(
    .INIT(64'hDDDDDDDDCDCCCDCD)) 
     \TX_DATA_Buffer[22]_i_1__0 
       (.I0(p_1_in10_in),
        .I1(\n_0_TX_DATA_Buffer[22]_i_2 ),
        .I2(\n_0_TX_DATA_Buffer[22]_i_3 ),
        .I3(gen_sp_r),
        .I4(gen_spa_r),
        .I5(gen_cc_r),
        .O(\n_0_TX_DATA_Buffer[22]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair94" *) 
   LUT4 #(
    .INIT(16'hFF20)) 
     \TX_DATA_Buffer[22]_i_2 
       (.I0(p_1_in10_in),
        .I1(p_0_in15_in),
        .I2(tx_pe_data_r[9]),
        .I3(p_1_in13_in),
        .O(\n_0_TX_DATA_Buffer[22]_i_2 ));
LUT6 #(
    .INIT(64'h0000000000030002)) 
     \TX_DATA_Buffer[22]_i_3 
       (.I0(p_0_in11_in),
        .I1(\n_0_TX_DATA_Buffer[31]_i_4 ),
        .I2(\n_0_TX_DATA_Buffer[22]_i_4 ),
        .I3(p_1_in5_in),
        .I4(p_0_in8_in),
        .I5(p_1_in13_in),
        .O(\n_0_TX_DATA_Buffer[22]_i_3 ));
(* SOFT_HLUTNM = "soft_lutpair90" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \TX_DATA_Buffer[22]_i_4 
       (.I0(gen_cc_r),
        .I1(p_1_in10_in),
        .O(\n_0_TX_DATA_Buffer[22]_i_4 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
     \TX_DATA_Buffer[23]_i_1__0 
       (.I0(p_1_in10_in),
        .I1(p_1_in5_in),
        .I2(p_1_in13_in),
        .I3(\n_0_TX_DATA_Buffer[23]_i_3 ),
        .I4(TX_DATA_Buffer112_out),
        .I5(TX_DATA_Buffer110_out),
        .O(\n_0_TX_DATA_Buffer[23]_i_1__0 ));
LUT6 #(
    .INIT(64'hFFFFFFFF54545455)) 
     \TX_DATA_Buffer[23]_i_2 
       (.I0(TX_DATA_Buffer114_out),
        .I1(TX_DATA_Buffer112_out),
        .I2(gen_cc_r),
        .I3(\n_0_TX_DATA_Buffer[31]_i_4 ),
        .I4(TX_DATA_Buffer110_out),
        .I5(\n_0_TX_DATA_Buffer[23]_i_7 ),
        .O(\n_0_TX_DATA_Buffer[23]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair87" *) 
   LUT3 #(
    .INIT(8'hFE)) 
     \TX_DATA_Buffer[23]_i_3 
       (.I0(gen_spa_r),
        .I1(gen_sp_r),
        .I2(gen_cc_r),
        .O(\n_0_TX_DATA_Buffer[23]_i_3 ));
LUT6 #(
    .INIT(64'h0000000000000004)) 
     \TX_DATA_Buffer[23]_i_4__0 
       (.I0(p_1_in13_in),
        .I1(p_0_in11_in),
        .I2(p_1_in5_in),
        .I3(gen_cc_r),
        .I4(p_1_in10_in),
        .I5(\n_0_TX_DATA_Buffer[31]_i_4 ),
        .O(TX_DATA_Buffer112_out));
LUT6 #(
    .INIT(64'h0000000000000004)) 
     \TX_DATA_Buffer[23]_i_5 
       (.I0(p_1_in13_in),
        .I1(p_0_in8_in),
        .I2(p_1_in5_in),
        .I3(gen_cc_r),
        .I4(p_1_in10_in),
        .I5(\n_0_TX_DATA_Buffer[31]_i_4 ),
        .O(TX_DATA_Buffer110_out));
(* SOFT_HLUTNM = "soft_lutpair89" *) 
   LUT2 #(
    .INIT(4'h2)) 
     \TX_DATA_Buffer[23]_i_6 
       (.I0(p_1_in10_in),
        .I1(p_0_in15_in),
        .O(TX_DATA_Buffer114_out));
(* SOFT_HLUTNM = "soft_lutpair94" *) 
   LUT4 #(
    .INIT(16'hFCEC)) 
     \TX_DATA_Buffer[23]_i_7 
       (.I0(tx_pe_data_r[8]),
        .I1(p_1_in13_in),
        .I2(p_1_in10_in),
        .I3(p_0_in15_in),
        .O(\n_0_TX_DATA_Buffer[23]_i_7 ));
(* SOFT_HLUTNM = "soft_lutpair97" *) 
   LUT4 #(
    .INIT(16'h00B8)) 
     \TX_DATA_Buffer[24]_i_1 
       (.I0(tx_pe_data_r[7]),
        .I1(p_1_in10_in),
        .I2(gen_cc_r),
        .I3(p_1_in13_in),
        .O(\n_0_TX_DATA_Buffer[24]_i_1 ));
LUT4 #(
    .INIT(16'h00E2)) 
     \TX_DATA_Buffer[25]_i_1 
       (.I0(gen_cc_r),
        .I1(p_1_in10_in),
        .I2(tx_pe_data_r[6]),
        .I3(p_1_in13_in),
        .O(\n_0_TX_DATA_Buffer[25]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair92" *) 
   LUT4 #(
    .INIT(16'hEFEA)) 
     \TX_DATA_Buffer[26]_i_1 
       (.I0(p_1_in13_in),
        .I1(tx_pe_data_r[5]),
        .I2(p_1_in10_in),
        .I3(\n_0_TX_DATA_Buffer[28]_i_2 ),
        .O(\n_0_TX_DATA_Buffer[26]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair97" *) 
   LUT4 #(
    .INIT(16'hFBAB)) 
     \TX_DATA_Buffer[27]_i_1 
       (.I0(p_1_in13_in),
        .I1(gen_cc_r),
        .I2(p_1_in10_in),
        .I3(tx_pe_data_r[4]),
        .O(\n_0_TX_DATA_Buffer[27]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair92" *) 
   LUT4 #(
    .INIT(16'hEFEA)) 
     \TX_DATA_Buffer[28]_i_1 
       (.I0(p_1_in13_in),
        .I1(tx_pe_data_r[3]),
        .I2(p_1_in10_in),
        .I3(\n_0_TX_DATA_Buffer[28]_i_2 ),
        .O(\n_0_TX_DATA_Buffer[28]_i_1 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFAAA8)) 
     \TX_DATA_Buffer[28]_i_2 
       (.I0(\n_0_TX_DATA_Buffer[31]_i_6 ),
        .I1(p_0_in20_in),
        .I2(gen_a_r),
        .I3(p_0_in17_in),
        .I4(gen_cc_r),
        .I5(\n_0_TX_DATA_Buffer[31]_i_4 ),
        .O(\n_0_TX_DATA_Buffer[28]_i_2 ));
LUT4 #(
    .INIT(16'h00EA)) 
     \TX_DATA_Buffer[29]_i_1 
       (.I0(\n_0_TX_DATA_Buffer[29]_i_2 ),
        .I1(tx_pe_data_r[2]),
        .I2(p_1_in10_in),
        .I3(p_1_in13_in),
        .O(\n_0_TX_DATA_Buffer[29]_i_1 ));
LUT6 #(
    .INIT(64'h00000000FFEFFFFF)) 
     \TX_DATA_Buffer[29]_i_2 
       (.I0(gen_cc_r),
        .I1(gen_a_r),
        .I2(\n_0_TX_DATA_Buffer[31]_i_6 ),
        .I3(p_0_in20_in),
        .I4(p_0_in17_in),
        .I5(p_1_in10_in),
        .O(\n_0_TX_DATA_Buffer[29]_i_2 ));
LUT5 #(
    .INIT(32'hFEFEFE0E)) 
     \TX_DATA_Buffer[2]_i_1 
       (.I0(\n_0_TX_DATA_Buffer[18]_i_2 ),
        .I1(\n_0_TX_DATA_Buffer[7]_i_3 ),
        .I2(\n_0_tx_pe_data_v_r_reg[1] ),
        .I3(\n_0_gen_pad_r_reg[1] ),
        .I4(tx_pe_data_r[29]),
        .O(p_1_in[2]));
LUT4 #(
    .INIT(16'hEFEA)) 
     \TX_DATA_Buffer[30]_i_1 
       (.I0(p_1_in13_in),
        .I1(tx_pe_data_r[1]),
        .I2(p_1_in10_in),
        .I3(\n_0_TX_DATA_Buffer[30]_i_2 ),
        .O(\n_0_TX_DATA_Buffer[30]_i_1 ));
LUT6 #(
    .INIT(64'hECECECECEFEFEFFF)) 
     \TX_DATA_Buffer[30]_i_2 
       (.I0(gen_a_r),
        .I1(gen_cc_r),
        .I2(\n_0_TX_DATA_Buffer[31]_i_6 ),
        .I3(p_0_in17_in),
        .I4(p_0_in20_in),
        .I5(\n_0_TX_DATA_Buffer[31]_i_4 ),
        .O(\n_0_TX_DATA_Buffer[30]_i_2 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
     \TX_DATA_Buffer[31]_i_1 
       (.I0(\n_0_TX_DATA_Buffer[31]_i_3 ),
        .I1(\n_0_TX_DATA_Buffer[31]_i_4 ),
        .I2(gen_cc_r),
        .I3(p_0_in20_in),
        .I4(p_1_in10_in),
        .I5(p_1_in13_in),
        .O(\n_0_TX_DATA_Buffer[31]_i_1 ));
LUT4 #(
    .INIT(16'h00EA)) 
     \TX_DATA_Buffer[31]_i_2 
       (.I0(\n_0_TX_DATA_Buffer[31]_i_5 ),
        .I1(tx_pe_data_r[0]),
        .I2(p_1_in10_in),
        .I3(p_1_in13_in),
        .O(\n_0_TX_DATA_Buffer[31]_i_2 ));
LUT6 #(
    .INIT(64'h000000000000000E)) 
     \TX_DATA_Buffer[31]_i_3 
       (.I0(gen_a_r),
        .I1(p_0_in17_in),
        .I2(gen_cc_r),
        .I3(p_1_in10_in),
        .I4(p_1_in13_in),
        .I5(\n_0_TX_DATA_Buffer[31]_i_4 ),
        .O(\n_0_TX_DATA_Buffer[31]_i_3 ));
(* SOFT_HLUTNM = "soft_lutpair88" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \TX_DATA_Buffer[31]_i_4 
       (.I0(gen_sp_r),
        .I1(gen_spa_r),
        .O(\n_0_TX_DATA_Buffer[31]_i_4 ));
LUT6 #(
    .INIT(64'h00000000FFFF2F3F)) 
     \TX_DATA_Buffer[31]_i_5 
       (.I0(p_0_in20_in),
        .I1(gen_a_r),
        .I2(\n_0_TX_DATA_Buffer[31]_i_6 ),
        .I3(p_0_in17_in),
        .I4(gen_cc_r),
        .I5(p_1_in10_in),
        .O(\n_0_TX_DATA_Buffer[31]_i_5 ));
(* SOFT_HLUTNM = "soft_lutpair87" *) 
   LUT5 #(
    .INIT(32'h00000001)) 
     \TX_DATA_Buffer[31]_i_6 
       (.I0(gen_cc_r),
        .I1(p_1_in10_in),
        .I2(p_1_in13_in),
        .I3(gen_spa_r),
        .I4(gen_sp_r),
        .O(\n_0_TX_DATA_Buffer[31]_i_6 ));
(* SOFT_HLUTNM = "soft_lutpair93" *) 
   LUT4 #(
    .INIT(16'hC8FB)) 
     \TX_DATA_Buffer[3]_i_1 
       (.I0(tx_pe_data_r[28]),
        .I1(\n_0_tx_pe_data_v_r_reg[1] ),
        .I2(\n_0_gen_pad_r_reg[1] ),
        .I3(gen_cc_r),
        .O(p_1_in[3]));
(* SOFT_HLUTNM = "soft_lutpair86" *) 
   LUT5 #(
    .INIT(32'hFEFEFE0E)) 
     \TX_DATA_Buffer[4]_i_1 
       (.I0(\n_0_TX_DATA_Buffer[7]_i_3 ),
        .I1(gen_cc_r),
        .I2(\n_0_tx_pe_data_v_r_reg[1] ),
        .I3(\n_0_gen_pad_r_reg[1] ),
        .I4(tx_pe_data_r[27]),
        .O(p_1_in[4]));
LUT4 #(
    .INIT(16'h2F20)) 
     \TX_DATA_Buffer[5]_i_1 
       (.I0(tx_pe_data_r[26]),
        .I1(\n_0_gen_pad_r_reg[1] ),
        .I2(\n_0_tx_pe_data_v_r_reg[1] ),
        .I3(\n_0_TX_DATA_Buffer[5]_i_2 ),
        .O(p_1_in[5]));
LUT6 #(
    .INIT(64'hCFCFCFCFCFEECFEF)) 
     \TX_DATA_Buffer[5]_i_2 
       (.I0(\n_0_gen_k_r_reg[3] ),
        .I1(gen_cc_r),
        .I2(gen_sp_r),
        .I3(p_1_in_0),
        .I4(\n_0_gen_r_r_reg[3] ),
        .I5(p_3_in),
        .O(\n_0_TX_DATA_Buffer[5]_i_2 ));
LUT6 #(
    .INIT(64'h2F2F2F2F202F2020)) 
     \TX_DATA_Buffer[6]_i_1 
       (.I0(tx_pe_data_r[25]),
        .I1(\n_0_gen_pad_r_reg[1] ),
        .I2(\n_0_tx_pe_data_v_r_reg[1] ),
        .I3(\n_0_TX_DATA_Buffer[7]_i_3 ),
        .I4(\n_0_TX_DATA_Buffer[6]_i_2 ),
        .I5(gen_cc_r),
        .O(p_1_in[6]));
(* SOFT_HLUTNM = "soft_lutpair91" *) 
   LUT2 #(
    .INIT(4'hB)) 
     \TX_DATA_Buffer[6]_i_2 
       (.I0(gen_sp_r),
        .I1(gen_spa_r),
        .O(\n_0_TX_DATA_Buffer[6]_i_2 ));
LUT5 #(
    .INIT(32'hFFFFFFFE)) 
     \TX_DATA_Buffer[7]_i_1 
       (.I0(\n_0_tx_pe_data_v_r_reg[1] ),
        .I1(p_1_in_0),
        .I2(\n_0_TX_DATA_Buffer[7]_i_3 ),
        .I3(\n_0_TX_DATA_Buffer[31]_i_4 ),
        .I4(gen_cc_r),
        .O(\n_0_TX_DATA_Buffer[7]_i_1 ));
LUT4 #(
    .INIT(16'hEEE2)) 
     \TX_DATA_Buffer[7]_i_2 
       (.I0(\n_0_TX_DATA_Buffer[7]_i_4 ),
        .I1(\n_0_tx_pe_data_v_r_reg[1] ),
        .I2(\n_0_gen_pad_r_reg[1] ),
        .I3(tx_pe_data_r[24]),
        .O(p_1_in[7]));
LUT6 #(
    .INIT(64'h0000000000000032)) 
     \TX_DATA_Buffer[7]_i_3 
       (.I0(\n_0_gen_k_r_reg[3] ),
        .I1(p_1_in_0),
        .I2(\n_0_gen_r_r_reg[3] ),
        .I3(\n_0_TX_DATA_Buffer[15]_i_6__0 ),
        .I4(gen_spa_r),
        .I5(gen_sp_r),
        .O(\n_0_TX_DATA_Buffer[7]_i_3 ));
LUT6 #(
    .INIT(64'hCFCFCFCFCFEECFEF)) 
     \TX_DATA_Buffer[7]_i_4 
       (.I0(\n_0_gen_k_r_reg[3] ),
        .I1(gen_cc_r),
        .I2(\n_0_TX_DATA_Buffer[31]_i_4 ),
        .I3(p_1_in_0),
        .I4(\n_0_gen_r_r_reg[3] ),
        .I5(p_3_in),
        .O(\n_0_TX_DATA_Buffer[7]_i_4 ));
(* SOFT_HLUTNM = "soft_lutpair96" *) 
   LUT4 #(
    .INIT(16'hFFFE)) 
     \TX_DATA_Buffer[7]_i_5__0 
       (.I0(gen_cc_r),
        .I1(\n_0_tx_pe_data_v_r_reg[1] ),
        .I2(gen_sp_r),
        .I3(gen_spa_r),
        .O(p_3_in));
(* SOFT_HLUTNM = "soft_lutpair99" *) 
   LUT3 #(
    .INIT(8'hE2)) 
     \TX_DATA_Buffer[8]_i_1 
       (.I0(gen_cc_r),
        .I1(\n_0_tx_pe_data_v_r_reg[1] ),
        .I2(tx_pe_data_r[23]),
        .O(\n_0_TX_DATA_Buffer[8]_i_1 ));
LUT5 #(
    .INIT(32'hCCAFCCAA)) 
     \TX_DATA_Buffer[9]_i_1 
       (.I0(gen_cc_r),
        .I1(tx_pe_data_r[22]),
        .I2(\n_0_TX_DATA_Buffer[15]_i_3 ),
        .I3(\n_0_tx_pe_data_v_r_reg[1] ),
        .I4(gen_sp_r),
        .O(\n_0_TX_DATA_Buffer[9]_i_1 ));
FDRE \TX_DATA_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[7]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[0]_i_1 ),
        .Q(GT0_TXDATA_IN[24]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[10] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[15]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[10]_i_1 ),
        .Q(GT0_TXDATA_IN[18]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[11] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[15]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[11]_i_1 ),
        .Q(GT0_TXDATA_IN[19]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[12] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[15]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[12]_i_1 ),
        .Q(GT0_TXDATA_IN[20]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[13] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[15]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[13]_i_1 ),
        .Q(GT0_TXDATA_IN[21]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[14] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[15]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[14]_i_1 ),
        .Q(GT0_TXDATA_IN[22]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[15] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[15]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[15]_i_2 ),
        .Q(GT0_TXDATA_IN[23]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[16] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[23]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[16]_i_1 ),
        .Q(GT0_TXDATA_IN[8]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[17] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[23]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[17]_i_1 ),
        .Q(GT0_TXDATA_IN[9]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[18] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[23]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[18]_i_1 ),
        .Q(GT0_TXDATA_IN[10]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[19] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[23]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[19]_i_1 ),
        .Q(GT0_TXDATA_IN[11]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[7]_i_1 ),
        .D(p_1_in[1]),
        .Q(GT0_TXDATA_IN[25]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[20] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[23]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[20]_i_1 ),
        .Q(GT0_TXDATA_IN[12]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[21] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[23]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[21]_i_1__0 ),
        .Q(GT0_TXDATA_IN[13]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[22] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[23]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[22]_i_1__0 ),
        .Q(GT0_TXDATA_IN[14]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[23] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[23]_i_1__0 ),
        .D(\n_0_TX_DATA_Buffer[23]_i_2 ),
        .Q(GT0_TXDATA_IN[15]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[24] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[31]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[24]_i_1 ),
        .Q(GT0_TXDATA_IN[0]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[25] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[31]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[25]_i_1 ),
        .Q(GT0_TXDATA_IN[1]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[26] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[31]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[26]_i_1 ),
        .Q(GT0_TXDATA_IN[2]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[27] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[31]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[27]_i_1 ),
        .Q(GT0_TXDATA_IN[3]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[28] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[31]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[28]_i_1 ),
        .Q(GT0_TXDATA_IN[4]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[29] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[31]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[29]_i_1 ),
        .Q(GT0_TXDATA_IN[5]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[2] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[7]_i_1 ),
        .D(p_1_in[2]),
        .Q(GT0_TXDATA_IN[26]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[30] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[31]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[30]_i_1 ),
        .Q(GT0_TXDATA_IN[6]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[31] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[31]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[31]_i_2 ),
        .Q(GT0_TXDATA_IN[7]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[3] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[7]_i_1 ),
        .D(p_1_in[3]),
        .Q(GT0_TXDATA_IN[27]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[4] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[7]_i_1 ),
        .D(p_1_in[4]),
        .Q(GT0_TXDATA_IN[28]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[5] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[7]_i_1 ),
        .D(p_1_in[5]),
        .Q(GT0_TXDATA_IN[29]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[6] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[7]_i_1 ),
        .D(p_1_in[6]),
        .Q(GT0_TXDATA_IN[30]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[7] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[7]_i_1 ),
        .D(p_1_in[7]),
        .Q(GT0_TXDATA_IN[31]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[8] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[15]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[8]_i_1 ),
        .Q(GT0_TXDATA_IN[16]),
        .R(\<const0> ));
FDRE \TX_DATA_Buffer_reg[9] 
       (.C(user_clk),
        .CE(\n_0_TX_DATA_Buffer[15]_i_1 ),
        .D(\n_0_TX_DATA_Buffer[9]_i_1 ),
        .Q(GT0_TXDATA_IN[17]),
        .R(\<const0> ));
VCC VCC
       (.P(\<const1> ));
FDRE gen_a_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GEN_A),
        .Q(gen_a_r),
        .R(\<const0> ));
FDRE gen_cc_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GEN_CC),
        .Q(gen_cc_r),
        .R(\<const0> ));
FDRE \gen_k_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I16[3]),
        .Q(p_0_in20_in),
        .R(\<const0> ));
FDRE \gen_k_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I16[2]),
        .Q(p_0_in11_in),
        .R(\<const0> ));
FDRE \gen_k_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I16[1]),
        .Q(p_0_in6_in),
        .R(\<const0> ));
FDRE \gen_k_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I16[0]),
        .Q(\n_0_gen_k_r_reg[3] ),
        .R(\<const0> ));
FDRE \gen_pad_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I11[1]),
        .Q(p_0_in15_in),
        .R(\<const0> ));
FDRE \gen_pad_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I11[0]),
        .Q(\n_0_gen_pad_r_reg[1] ),
        .R(\<const0> ));
FDRE \gen_r_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I15[3]),
        .Q(p_0_in17_in),
        .R(\<const0> ));
FDRE \gen_r_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I15[2]),
        .Q(p_0_in8_in),
        .R(\<const0> ));
FDRE \gen_r_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I15[1]),
        .Q(p_0_in),
        .R(\<const0> ));
FDRE \gen_r_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I15[0]),
        .Q(\n_0_gen_r_r_reg[3] ),
        .R(\<const0> ));
FDRE \gen_scp_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GEN_SCP),
        .Q(p_1_in13_in),
        .R(\<const0> ));
FDRE gen_sp_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GEN_SP),
        .Q(gen_sp_r),
        .R(\<const0> ));
FDRE gen_spa_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(GEN_SPA),
        .Q(gen_spa_r),
        .R(\<const0> ));
FDRE \gen_v_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I14[2]),
        .Q(p_1_in5_in),
        .R(\<const0> ));
FDRE \gen_v_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I14[1]),
        .Q(p_1_in1_in),
        .R(\<const0> ));
FDRE \gen_v_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I14[0]),
        .Q(p_1_in_0),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[31]),
        .Q(tx_pe_data_r[0]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[10] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[21]),
        .Q(tx_pe_data_r[10]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[11] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[20]),
        .Q(tx_pe_data_r[11]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[12] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[19]),
        .Q(tx_pe_data_r[12]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[13] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[18]),
        .Q(tx_pe_data_r[13]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[14] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[17]),
        .Q(tx_pe_data_r[14]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[15] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[16]),
        .Q(tx_pe_data_r[15]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[16] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[15]),
        .Q(tx_pe_data_r[16]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[17] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[14]),
        .Q(tx_pe_data_r[17]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[18] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[13]),
        .Q(tx_pe_data_r[18]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[19] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[12]),
        .Q(tx_pe_data_r[19]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[30]),
        .Q(tx_pe_data_r[1]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[20] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[11]),
        .Q(tx_pe_data_r[20]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[21] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[10]),
        .Q(tx_pe_data_r[21]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[22] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[9]),
        .Q(tx_pe_data_r[22]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[23] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[8]),
        .Q(tx_pe_data_r[23]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[24] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[7]),
        .Q(tx_pe_data_r[24]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[25] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[6]),
        .Q(tx_pe_data_r[25]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[26] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[5]),
        .Q(tx_pe_data_r[26]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[27] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[4]),
        .Q(tx_pe_data_r[27]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[28] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[3]),
        .Q(tx_pe_data_r[28]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[29] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[2]),
        .Q(tx_pe_data_r[29]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[29]),
        .Q(tx_pe_data_r[2]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[30] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[1]),
        .Q(tx_pe_data_r[30]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[31] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[0]),
        .Q(tx_pe_data_r[31]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[28]),
        .Q(tx_pe_data_r[3]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[27]),
        .Q(tx_pe_data_r[4]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[26]),
        .Q(tx_pe_data_r[5]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[25]),
        .Q(tx_pe_data_r[6]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[24]),
        .Q(tx_pe_data_r[7]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[8] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[23]),
        .Q(tx_pe_data_r[8]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[9] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I24[22]),
        .Q(tx_pe_data_r[9]),
        .R(\<const0> ));
FDRE \tx_pe_data_v_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I12[1]),
        .Q(p_1_in10_in),
        .R(\<const0> ));
FDRE \tx_pe_data_v_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I12[0]),
        .Q(\n_0_tx_pe_data_v_r_reg[1] ),
        .R(\<const0> ));
endmodule

module data_mgtdata_mgt_TX_LL
   (GEN_CC,
    O1,
    TX_DST_RDY_N,
    GEN_SCP,
    O2,
    S_AXI_TX_TREADY,
    TX_PE_DATA_V,
    GEN_PAD,
    Q,
    R,
    user_clk,
    TX_SOF_N,
    DO_CC,
    S_AXI_TX_TLAST,
    S_AXI_TX_TVALID,
    S_AXI_TX_TKEEP,
    CHANNEL_UP,
    I1,
    S_AXI_TX_TDATA);
  output GEN_CC;
  output O1;
  output TX_DST_RDY_N;
  output GEN_SCP;
  output O2;
  output S_AXI_TX_TREADY;
  output [0:3]TX_PE_DATA_V;
  output [0:3]GEN_PAD;
  output [63:0]Q;
  input R;
  input user_clk;
  input TX_SOF_N;
  input DO_CC;
  input S_AXI_TX_TLAST;
  input S_AXI_TX_TVALID;
  input [0:7]S_AXI_TX_TKEEP;
  input CHANNEL_UP;
  input I1;
  input [0:63]S_AXI_TX_TDATA;

  wire CHANNEL_UP;
  wire DO_CC;
  wire GEN_CC;
  wire [0:3]GEN_PAD;
  wire GEN_SCP;
  wire I1;
  wire O1;
  wire O2;
  wire [63:0]Q;
  wire R;
  wire [0:63]S_AXI_TX_TDATA;
  wire [0:7]S_AXI_TX_TKEEP;
  wire S_AXI_TX_TLAST;
  wire S_AXI_TX_TREADY;
  wire S_AXI_TX_TVALID;
  wire TX_DST_RDY_N;
  wire [0:3]TX_PE_DATA_V;
  wire [0:0]TX_REM;
  wire TX_SOF_N;
  wire do_cc_r;
  wire n_0_tx_ll_datapath_i;
  wire n_8_tx_ll_control_i;
  wire user_clk;

data_mgtdata_mgt_TX_LL_CONTROL tx_ll_control_i
       (.DO_CC(DO_CC),
        .GEN_CC(GEN_CC),
        .GEN_SCP(GEN_SCP),
        .I1(n_0_tx_ll_datapath_i),
        .I2(TX_REM),
        .I3(I1),
        .O1(O1),
        .O2(TX_DST_RDY_N),
        .O3(O2),
        .O4(n_8_tx_ll_control_i),
        .R(R),
        .S_AXI_TX_TKEEP(S_AXI_TX_TKEEP),
        .S_AXI_TX_TLAST(S_AXI_TX_TLAST),
        .S_AXI_TX_TREADY(S_AXI_TX_TREADY),
        .S_AXI_TX_TVALID(S_AXI_TX_TVALID),
        .TX_SOF_N(TX_SOF_N),
        .do_cc_r(do_cc_r),
        .user_clk(user_clk));
data_mgtdata_mgt_TX_LL_DATAPATH tx_ll_datapath_i
       (.CHANNEL_UP(CHANNEL_UP),
        .GEN_PAD(GEN_PAD),
        .I1(TX_DST_RDY_N),
        .I2(TX_REM),
        .I3(n_8_tx_ll_control_i),
        .O1(n_0_tx_ll_datapath_i),
        .Q(Q),
        .R(R),
        .S_AXI_TX_TDATA(S_AXI_TX_TDATA),
        .S_AXI_TX_TKEEP(S_AXI_TX_TKEEP),
        .S_AXI_TX_TLAST(S_AXI_TX_TLAST),
        .S_AXI_TX_TVALID(S_AXI_TX_TVALID),
        .TX_PE_DATA_V(TX_PE_DATA_V),
        .TX_SOF_N(TX_SOF_N),
        .do_cc_r(do_cc_r),
        .user_clk(user_clk));
endmodule

module data_mgtdata_mgt_TX_LL_CONTROL
   (GEN_CC,
    O1,
    O2,
    do_cc_r,
    GEN_SCP,
    O3,
    S_AXI_TX_TREADY,
    I2,
    O4,
    R,
    user_clk,
    DO_CC,
    S_AXI_TX_TVALID,
    S_AXI_TX_TLAST,
    TX_SOF_N,
    S_AXI_TX_TKEEP,
    I1,
    I3);
  output GEN_CC;
  output O1;
  output O2;
  output do_cc_r;
  output GEN_SCP;
  output O3;
  output S_AXI_TX_TREADY;
  output [0:0]I2;
  output O4;
  input R;
  input user_clk;
  input DO_CC;
  input S_AXI_TX_TVALID;
  input S_AXI_TX_TLAST;
  input TX_SOF_N;
  input [0:7]S_AXI_TX_TKEEP;
  input I1;
  input I3;

  wire \<const0> ;
  wire \<const1> ;
  wire DO_CC;
  wire GEN_CC;
  wire GEN_SCP;
  wire I1;
  wire [0:0]I2;
  wire I3;
  wire O1;
  wire O2;
  wire O3;
  wire O4;
  wire R;
  wire [0:7]S_AXI_TX_TKEEP;
  wire S_AXI_TX_TLAST;
  wire S_AXI_TX_TREADY;
  wire S_AXI_TX_TVALID;
  wire TX_SOF_N;
  wire VCC_2;
  wire data_r;
  wire data_to_eof_1_r;
  wire data_to_eof_2_r;
  wire do_cc_r;
  wire eof_r;
  wire gen_cc_pipeline_r;
  wire gen_ecp_pipeline_r;
  wire gen_ecp_pipeline_r0;
  wire gen_scp_pipeline_r;
  wire idle_r;
  wire n_0_TX_DST_RDY_N_Buffer_i_2;
  wire n_0_TX_DST_RDY_N_Buffer_i_3;
  wire n_0_TX_DST_RDY_N_Buffer_i_4;
  wire n_0_TX_DST_RDY_N_Buffer_i_5;
  wire n_0_TX_DST_RDY_N_Buffer_i_6;
  wire n_0_gen_scp_pipeline_r_i_1;
  wire n_0_sof_to_data_r_i_1;
  wire n_0_sof_to_data_r_i_2;
  wire \n_0_tx_rem_pipeline_r[0]_i_3 ;
  wire next_data_c;
  wire next_data_to_eof_1_c;
  wire next_eof_c;
  wire next_idle_c;
  wire next_sof_and_eof_c;
  wire next_sof_to_eof_1_c;
  wire pdu_ok_c;
  wire sof_and_eof_r;
  wire sof_to_data_r;
  wire sof_to_eof_1_r;
  wire sof_to_eof_2_r;
  wire tx_dst_rdy_n_c;
  wire user_clk;

FDRE GEN_ECP_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(gen_ecp_pipeline_r),
        .Q(O3),
        .R(R));
FDRE GEN_SCP_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(gen_scp_pipeline_r),
        .Q(GEN_SCP),
        .R(R));
GND GND
       (.G(\<const0> ));
LUT1 #(
    .INIT(2'h1)) 
     S_AXI_TX_TREADY_INST_0
       (.I0(O2),
        .O(S_AXI_TX_TREADY));
LUT6 #(
    .INIT(64'hFFFFFFFF00151500)) 
     TX_DST_RDY_N_Buffer_i_1
       (.I0(do_cc_r),
        .I1(n_0_TX_DST_RDY_N_Buffer_i_2),
        .I2(n_0_TX_DST_RDY_N_Buffer_i_3),
        .I3(n_0_TX_DST_RDY_N_Buffer_i_4),
        .I4(n_0_TX_DST_RDY_N_Buffer_i_5),
        .I5(n_0_TX_DST_RDY_N_Buffer_i_6),
        .O(tx_dst_rdy_n_c));
(* SOFT_HLUTNM = "soft_lutpair130" *) 
   LUT5 #(
    .INIT(32'hFFFF1FFF)) 
     TX_DST_RDY_N_Buffer_i_2
       (.I0(data_r),
        .I1(sof_to_data_r),
        .I2(S_AXI_TX_TLAST),
        .I3(S_AXI_TX_TVALID),
        .I4(O2),
        .O(n_0_TX_DST_RDY_N_Buffer_i_2));
(* SOFT_HLUTNM = "soft_lutpair131" *) 
   LUT5 #(
    .INIT(32'hFEFFFFFF)) 
     TX_DST_RDY_N_Buffer_i_3
       (.I0(n_0_sof_to_data_r_i_2),
        .I1(I3),
        .I2(O2),
        .I3(S_AXI_TX_TVALID),
        .I4(S_AXI_TX_TLAST),
        .O(n_0_TX_DST_RDY_N_Buffer_i_3));
LUT6 #(
    .INIT(64'hFFFFFFE8FFE8E8E8)) 
     TX_DST_RDY_N_Buffer_i_4
       (.I0(S_AXI_TX_TKEEP[6]),
        .I1(S_AXI_TX_TKEEP[0]),
        .I2(S_AXI_TX_TKEEP[7]),
        .I3(S_AXI_TX_TKEEP[3]),
        .I4(S_AXI_TX_TKEEP[5]),
        .I5(S_AXI_TX_TKEEP[4]),
        .O(n_0_TX_DST_RDY_N_Buffer_i_4));
LUT5 #(
    .INIT(32'h7F170100)) 
     TX_DST_RDY_N_Buffer_i_5
       (.I0(I1),
        .I1(S_AXI_TX_TKEEP[2]),
        .I2(S_AXI_TX_TKEEP[1]),
        .I3(\n_0_tx_rem_pipeline_r[0]_i_3 ),
        .I4(O4),
        .O(n_0_TX_DST_RDY_N_Buffer_i_5));
LUT4 #(
    .INIT(16'hFEAA)) 
     TX_DST_RDY_N_Buffer_i_6
       (.I0(DO_CC),
        .I1(sof_to_eof_1_r),
        .I2(data_to_eof_1_r),
        .I3(do_cc_r),
        .O(n_0_TX_DST_RDY_N_Buffer_i_6));
FDSE TX_DST_RDY_N_Buffer_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_dst_rdy_n_c),
        .Q(O2),
        .S(R));
VCC VCC
       (.P(\<const1> ));
VCC VCC_1
       (.P(VCC_2));
(* SOFT_HLUTNM = "soft_lutpair130" *) 
   LUT5 #(
    .INIT(32'hF7F7F700)) 
     data_r_i_1
       (.I0(S_AXI_TX_TLAST),
        .I1(S_AXI_TX_TVALID),
        .I2(O2),
        .I3(data_r),
        .I4(sof_to_data_r),
        .O(next_data_c));
FDRE data_r_reg
       (.C(user_clk),
        .CE(pdu_ok_c),
        .D(next_data_c),
        .Q(data_r),
        .R(R));
LUT6 #(
    .INIT(64'h2000200020000000)) 
     data_to_eof_1_r_i_1
       (.I0(I2),
        .I1(O2),
        .I2(S_AXI_TX_TVALID),
        .I3(S_AXI_TX_TLAST),
        .I4(sof_to_data_r),
        .I5(data_r),
        .O(next_data_to_eof_1_c));
FDRE data_to_eof_1_r_reg
       (.C(user_clk),
        .CE(pdu_ok_c),
        .D(next_data_to_eof_1_c),
        .Q(data_to_eof_1_r),
        .R(R));
FDRE data_to_eof_2_r_reg
       (.C(user_clk),
        .CE(pdu_ok_c),
        .D(data_to_eof_1_r),
        .Q(data_to_eof_2_r),
        .R(R));
FDRE do_cc_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(DO_CC),
        .Q(do_cc_r),
        .R(\<const0> ));
LUT1 #(
    .INIT(2'h1)) 
     eof_r_i_1
       (.I0(do_cc_r),
        .O(pdu_ok_c));
LUT6 #(
    .INIT(64'h1000100010000000)) 
     eof_r_i_2
       (.I0(I2),
        .I1(O2),
        .I2(S_AXI_TX_TVALID),
        .I3(S_AXI_TX_TLAST),
        .I4(sof_to_data_r),
        .I5(data_r),
        .O(next_eof_c));
FDRE eof_r_reg
       (.C(user_clk),
        .CE(pdu_ok_c),
        .D(next_eof_c),
        .Q(eof_r),
        .R(R));
(* BOX_TYPE = "PRIMITIVE" *) 
   (* XILINX_LEGACY_PRIM = "FDR" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_cc_flop_0_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(gen_cc_pipeline_r),
        .Q(GEN_CC),
        .R(R));
(* BOX_TYPE = "PRIMITIVE" *) 
   (* XILINX_LEGACY_PRIM = "FDR" *) 
   FDRE #(
    .INIT(1'b0)) 
     gen_cc_flop_1_i
       (.C(user_clk),
        .CE(VCC_2),
        .D(gen_cc_pipeline_r),
        .Q(O1),
        .R(R));
FDRE gen_cc_pipeline_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(do_cc_r),
        .Q(gen_cc_pipeline_r),
        .R(R));
LUT5 #(
    .INIT(32'h0000FFFE)) 
     gen_ecp_pipeline_r_i_1
       (.I0(sof_and_eof_r),
        .I1(data_to_eof_2_r),
        .I2(eof_r),
        .I3(sof_to_eof_2_r),
        .I4(do_cc_r),
        .O(gen_ecp_pipeline_r0));
FDRE gen_ecp_pipeline_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(gen_ecp_pipeline_r0),
        .Q(gen_ecp_pipeline_r),
        .R(R));
LUT4 #(
    .INIT(16'h5554)) 
     gen_scp_pipeline_r_i_1
       (.I0(do_cc_r),
        .I1(sof_and_eof_r),
        .I2(sof_to_data_r),
        .I3(sof_to_eof_1_r),
        .O(n_0_gen_scp_pipeline_r_i_1));
FDRE gen_scp_pipeline_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_gen_scp_pipeline_r_i_1),
        .Q(gen_scp_pipeline_r),
        .R(R));
LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
     idle_r_i_1
       (.I0(TX_SOF_N),
        .I1(sof_to_eof_2_r),
        .I2(eof_r),
        .I3(data_to_eof_2_r),
        .I4(sof_and_eof_r),
        .I5(idle_r),
        .O(next_idle_c));
FDSE idle_r_reg
       (.C(user_clk),
        .CE(pdu_ok_c),
        .D(next_idle_c),
        .Q(idle_r),
        .S(R));
(* SOFT_HLUTNM = "soft_lutpair132" *) 
   LUT2 #(
    .INIT(4'h1)) 
     sof_and_eof_r_i_1
       (.I0(I2),
        .I1(n_0_TX_DST_RDY_N_Buffer_i_3),
        .O(next_sof_and_eof_c));
FDRE sof_and_eof_r_reg
       (.C(user_clk),
        .CE(pdu_ok_c),
        .D(next_sof_and_eof_c),
        .Q(sof_and_eof_r),
        .R(R));
(* SOFT_HLUTNM = "soft_lutpair131" *) 
   LUT5 #(
    .INIT(32'h00010000)) 
     sof_to_data_r_i_1
       (.I0(S_AXI_TX_TLAST),
        .I1(n_0_sof_to_data_r_i_2),
        .I2(I3),
        .I3(O2),
        .I4(S_AXI_TX_TVALID),
        .O(n_0_sof_to_data_r_i_1));
LUT5 #(
    .INIT(32'h00000001)) 
     sof_to_data_r_i_2
       (.I0(idle_r),
        .I1(sof_and_eof_r),
        .I2(data_to_eof_2_r),
        .I3(eof_r),
        .I4(sof_to_eof_2_r),
        .O(n_0_sof_to_data_r_i_2));
FDRE sof_to_data_r_reg
       (.C(user_clk),
        .CE(pdu_ok_c),
        .D(n_0_sof_to_data_r_i_1),
        .Q(sof_to_data_r),
        .R(R));
(* SOFT_HLUTNM = "soft_lutpair132" *) 
   LUT2 #(
    .INIT(4'h2)) 
     sof_to_eof_1_r_i_1
       (.I0(I2),
        .I1(n_0_TX_DST_RDY_N_Buffer_i_3),
        .O(next_sof_to_eof_1_c));
FDRE sof_to_eof_1_r_reg
       (.C(user_clk),
        .CE(pdu_ok_c),
        .D(next_sof_to_eof_1_c),
        .Q(sof_to_eof_1_r),
        .R(R));
FDRE sof_to_eof_2_r_reg
       (.C(user_clk),
        .CE(pdu_ok_c),
        .D(sof_to_eof_1_r),
        .Q(sof_to_eof_2_r),
        .R(R));
LUT6 #(
    .INIT(64'hAA6A6A666A666656)) 
     \tx_rem_pipeline_r[0]_i_1 
       (.I0(n_0_TX_DST_RDY_N_Buffer_i_4),
        .I1(O4),
        .I2(\n_0_tx_rem_pipeline_r[0]_i_3 ),
        .I3(S_AXI_TX_TKEEP[1]),
        .I4(S_AXI_TX_TKEEP[2]),
        .I5(I1),
        .O(I2));
LUT6 #(
    .INIT(64'h171717E817E8E8E8)) 
     \tx_rem_pipeline_r[0]_i_2 
       (.I0(S_AXI_TX_TKEEP[6]),
        .I1(S_AXI_TX_TKEEP[0]),
        .I2(S_AXI_TX_TKEEP[7]),
        .I3(S_AXI_TX_TKEEP[3]),
        .I4(S_AXI_TX_TKEEP[5]),
        .I5(S_AXI_TX_TKEEP[4]),
        .O(O4));
LUT3 #(
    .INIT(8'h69)) 
     \tx_rem_pipeline_r[0]_i_3 
       (.I0(S_AXI_TX_TKEEP[7]),
        .I1(S_AXI_TX_TKEEP[6]),
        .I2(S_AXI_TX_TKEEP[0]),
        .O(\n_0_tx_rem_pipeline_r[0]_i_3 ));
endmodule

module data_mgtdata_mgt_TX_LL_DATAPATH
   (O1,
    TX_PE_DATA_V,
    GEN_PAD,
    Q,
    R,
    do_cc_r,
    user_clk,
    TX_SOF_N,
    I1,
    S_AXI_TX_TLAST,
    S_AXI_TX_TVALID,
    I2,
    S_AXI_TX_TKEEP,
    I3,
    CHANNEL_UP,
    S_AXI_TX_TDATA);
  output O1;
  output [0:3]TX_PE_DATA_V;
  output [0:3]GEN_PAD;
  output [63:0]Q;
  input R;
  input do_cc_r;
  input user_clk;
  input TX_SOF_N;
  input I1;
  input S_AXI_TX_TLAST;
  input S_AXI_TX_TVALID;
  input [0:0]I2;
  input [0:7]S_AXI_TX_TKEEP;
  input I3;
  input CHANNEL_UP;
  input [0:63]S_AXI_TX_TDATA;

  wire \<const0> ;
  wire \<const1> ;
  wire CHANNEL_UP;
  wire [0:3]GEN_PAD;
  wire I1;
  wire [0:0]I2;
  wire I3;
  wire O1;
  wire [63:0]Q;
  wire R;
  wire [0:63]S_AXI_TX_TDATA;
  wire [0:7]S_AXI_TX_TKEEP;
  wire S_AXI_TX_TLAST;
  wire S_AXI_TX_TVALID;
  wire TX_EOF_N;
  wire [0:3]TX_PE_DATA_V;
  wire TX_PE_DATA_V_Buffer1;
  wire [1:2]TX_REM;
  wire TX_SOF_N;
  wire TX_SRC_RDY_N;
  wire do_cc_r;
  wire halt_c_pipeline_r;
  wire \n_0_gen_pad_r[1]_i_1 ;
  wire \n_0_gen_pad_r[1]_i_2 ;
  wire \n_0_gen_pad_r[2]_i_1 ;
  wire \n_0_gen_pad_r[3]_i_1 ;
  wire \n_0_gen_pad_r_reg[0] ;
  wire \n_0_gen_pad_r_reg[3] ;
  wire n_0_in_frame_r_i_1;
  wire n_0_in_frame_r_reg;
  wire n_0_storage_pad_r_i_1;
  wire n_0_storage_v_r_i_1;
  wire \n_0_tx_pe_data_v_r[1]_i_1 ;
  wire \n_0_tx_pe_data_v_r[2]_i_1 ;
  wire \n_0_tx_pe_data_v_r[3]_i_1 ;
  wire \n_0_tx_pe_data_v_r_reg[0] ;
  wire \n_0_tx_pe_data_v_r_reg[3] ;
  wire \n_0_tx_rem_pipeline_r[1]_i_2 ;
  wire p_1_in;
  wire p_2_in;
  wire p_2_in9_in;
  wire [3:3]p_2_out;
  wire p_3_in;
  wire storage_pad_r;
  wire [0:15]storage_r;
  wire [0:63]tx_d_pipeline_r;
  wire tx_dst_rdy_n_pipeline_r;
  wire tx_eof_n_pipeline_r;
  wire [0:63]tx_pe_data_r;
  wire [0:2]tx_rem_pipeline_r;
  wire tx_sof_n_pipeline_r;
  wire tx_src_rdy_n_pipeline_r;
  wire user_clk;

FDRE \GEN_PAD_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_gen_pad_r_reg[0] ),
        .Q(GEN_PAD[0]),
        .R(halt_c_pipeline_r));
FDRE \GEN_PAD_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_3_in),
        .Q(GEN_PAD[1]),
        .R(halt_c_pipeline_r));
FDRE \GEN_PAD_Buffer_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_2_in),
        .Q(GEN_PAD[2]),
        .R(halt_c_pipeline_r));
FDRE \GEN_PAD_Buffer_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_gen_pad_r_reg[3] ),
        .Q(GEN_PAD[3]),
        .R(halt_c_pipeline_r));
GND GND
       (.G(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[0]),
        .Q(Q[63]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[10] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[10]),
        .Q(Q[53]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[11] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[11]),
        .Q(Q[52]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[12] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[12]),
        .Q(Q[51]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[13] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[13]),
        .Q(Q[50]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[14] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[14]),
        .Q(Q[49]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[15] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[15]),
        .Q(Q[48]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[16] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[16]),
        .Q(Q[47]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[17] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[17]),
        .Q(Q[46]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[18] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[18]),
        .Q(Q[45]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[19] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[19]),
        .Q(Q[44]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[1]),
        .Q(Q[62]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[20] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[20]),
        .Q(Q[43]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[21] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[21]),
        .Q(Q[42]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[22] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[22]),
        .Q(Q[41]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[23] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[23]),
        .Q(Q[40]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[24] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[24]),
        .Q(Q[39]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[25] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[25]),
        .Q(Q[38]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[26] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[26]),
        .Q(Q[37]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[27] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[27]),
        .Q(Q[36]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[28] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[28]),
        .Q(Q[35]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[29] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[29]),
        .Q(Q[34]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[2]),
        .Q(Q[61]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[30] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[30]),
        .Q(Q[33]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[31] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[31]),
        .Q(Q[32]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[32] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[32]),
        .Q(Q[31]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[33] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[33]),
        .Q(Q[30]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[34] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[34]),
        .Q(Q[29]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[35] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[35]),
        .Q(Q[28]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[36] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[36]),
        .Q(Q[27]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[37] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[37]),
        .Q(Q[26]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[38] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[38]),
        .Q(Q[25]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[39] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[39]),
        .Q(Q[24]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[3]),
        .Q(Q[60]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[40] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[40]),
        .Q(Q[23]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[41] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[41]),
        .Q(Q[22]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[42] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[42]),
        .Q(Q[21]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[43] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[43]),
        .Q(Q[20]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[44] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[44]),
        .Q(Q[19]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[45] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[45]),
        .Q(Q[18]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[46] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[46]),
        .Q(Q[17]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[47] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[47]),
        .Q(Q[16]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[48] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[48]),
        .Q(Q[15]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[49] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[49]),
        .Q(Q[14]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[4]),
        .Q(Q[59]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[50] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[50]),
        .Q(Q[13]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[51] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[51]),
        .Q(Q[12]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[52] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[52]),
        .Q(Q[11]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[53] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[53]),
        .Q(Q[10]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[54] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[54]),
        .Q(Q[9]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[55] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[55]),
        .Q(Q[8]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[56] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[56]),
        .Q(Q[7]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[57] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[57]),
        .Q(Q[6]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[58] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[58]),
        .Q(Q[5]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[59] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[59]),
        .Q(Q[4]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[5]),
        .Q(Q[58]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[60] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[60]),
        .Q(Q[3]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[61] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[61]),
        .Q(Q[2]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[62] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[62]),
        .Q(Q[1]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[63] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[63]),
        .Q(Q[0]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[6]),
        .Q(Q[57]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[7]),
        .Q(Q[56]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[8] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[8]),
        .Q(Q[55]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_Buffer_reg[9] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(tx_pe_data_r[9]),
        .Q(Q[54]),
        .R(\<const0> ));
FDRE \TX_PE_DATA_V_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_tx_pe_data_v_r_reg[0] ),
        .Q(TX_PE_DATA_V[0]),
        .R(halt_c_pipeline_r));
FDRE \TX_PE_DATA_V_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_2_in9_in),
        .Q(TX_PE_DATA_V[1]),
        .R(halt_c_pipeline_r));
FDRE \TX_PE_DATA_V_Buffer_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(p_1_in),
        .Q(TX_PE_DATA_V[2]),
        .R(halt_c_pipeline_r));
FDRE \TX_PE_DATA_V_Buffer_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_tx_pe_data_v_r_reg[3] ),
        .Q(TX_PE_DATA_V[3]),
        .R(halt_c_pipeline_r));
VCC VCC
       (.P(\<const1> ));
LUT6 #(
    .INIT(64'h00000000FFFFEFEE)) 
     \gen_pad_r[1]_i_1 
       (.I0(tx_src_rdy_n_pipeline_r),
        .I1(tx_dst_rdy_n_pipeline_r),
        .I2(n_0_in_frame_r_reg),
        .I3(tx_sof_n_pipeline_r),
        .I4(tx_eof_n_pipeline_r),
        .I5(halt_c_pipeline_r),
        .O(\n_0_gen_pad_r[1]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair129" *) 
   LUT3 #(
    .INIT(8'h01)) 
     \gen_pad_r[1]_i_2 
       (.I0(tx_rem_pipeline_r[2]),
        .I1(tx_rem_pipeline_r[1]),
        .I2(tx_rem_pipeline_r[0]),
        .O(\n_0_gen_pad_r[1]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair129" *) 
   LUT3 #(
    .INIT(8'h04)) 
     \gen_pad_r[2]_i_1 
       (.I0(tx_rem_pipeline_r[2]),
        .I1(tx_rem_pipeline_r[1]),
        .I2(tx_rem_pipeline_r[0]),
        .O(\n_0_gen_pad_r[2]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair127" *) 
   LUT3 #(
    .INIT(8'h02)) 
     \gen_pad_r[3]_i_1 
       (.I0(tx_rem_pipeline_r[0]),
        .I1(tx_rem_pipeline_r[2]),
        .I2(tx_rem_pipeline_r[1]),
        .O(\n_0_gen_pad_r[3]_i_1 ));
FDRE \gen_pad_r_reg[0] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(storage_pad_r),
        .Q(\n_0_gen_pad_r_reg[0] ),
        .R(\<const0> ));
FDRE \gen_pad_r_reg[1] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(\n_0_gen_pad_r[1]_i_2 ),
        .Q(p_3_in),
        .R(\n_0_gen_pad_r[1]_i_1 ));
FDRE \gen_pad_r_reg[2] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(\n_0_gen_pad_r[2]_i_1 ),
        .Q(p_2_in),
        .R(\n_0_gen_pad_r[1]_i_1 ));
FDRE \gen_pad_r_reg[3] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(\n_0_gen_pad_r[3]_i_1 ),
        .Q(\n_0_gen_pad_r_reg[3] ),
        .R(\n_0_gen_pad_r[1]_i_1 ));
FDRE halt_c_pipeline_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(do_cc_r),
        .Q(halt_c_pipeline_r),
        .R(R));
LUT6 #(
    .INIT(64'hFFFA000000020000)) 
     in_frame_r_i_1
       (.I0(tx_eof_n_pipeline_r),
        .I1(tx_sof_n_pipeline_r),
        .I2(tx_dst_rdy_n_pipeline_r),
        .I3(tx_src_rdy_n_pipeline_r),
        .I4(CHANNEL_UP),
        .I5(n_0_in_frame_r_reg),
        .O(n_0_in_frame_r_i_1));
FDRE in_frame_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_in_frame_r_i_1),
        .Q(n_0_in_frame_r_reg),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair127" *) 
   LUT3 #(
    .INIT(8'h20)) 
     storage_pad_r_i_1
       (.I0(tx_rem_pipeline_r[0]),
        .I1(tx_rem_pipeline_r[2]),
        .I2(tx_rem_pipeline_r[1]),
        .O(n_0_storage_pad_r_i_1));
FDRE storage_pad_r_reg
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(n_0_storage_pad_r_i_1),
        .Q(storage_pad_r),
        .R(\n_0_gen_pad_r[1]_i_1 ));
FDRE \storage_r_reg[0] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[48]),
        .Q(storage_r[0]),
        .R(\<const0> ));
FDRE \storage_r_reg[10] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[58]),
        .Q(storage_r[10]),
        .R(\<const0> ));
FDRE \storage_r_reg[11] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[59]),
        .Q(storage_r[11]),
        .R(\<const0> ));
FDRE \storage_r_reg[12] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[60]),
        .Q(storage_r[12]),
        .R(\<const0> ));
FDRE \storage_r_reg[13] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[61]),
        .Q(storage_r[13]),
        .R(\<const0> ));
FDRE \storage_r_reg[14] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[62]),
        .Q(storage_r[14]),
        .R(\<const0> ));
FDRE \storage_r_reg[15] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[63]),
        .Q(storage_r[15]),
        .R(\<const0> ));
FDRE \storage_r_reg[1] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[49]),
        .Q(storage_r[1]),
        .R(\<const0> ));
FDRE \storage_r_reg[2] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[50]),
        .Q(storage_r[2]),
        .R(\<const0> ));
FDRE \storage_r_reg[3] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[51]),
        .Q(storage_r[3]),
        .R(\<const0> ));
FDRE \storage_r_reg[4] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[52]),
        .Q(storage_r[4]),
        .R(\<const0> ));
FDRE \storage_r_reg[5] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[53]),
        .Q(storage_r[5]),
        .R(\<const0> ));
FDRE \storage_r_reg[6] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[54]),
        .Q(storage_r[6]),
        .R(\<const0> ));
FDRE \storage_r_reg[7] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[55]),
        .Q(storage_r[7]),
        .R(\<const0> ));
FDRE \storage_r_reg[8] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[56]),
        .Q(storage_r[8]),
        .R(\<const0> ));
FDRE \storage_r_reg[9] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[57]),
        .Q(storage_r[9]),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair128" *) 
   LUT3 #(
    .INIT(8'hEA)) 
     storage_v_r_i_1
       (.I0(tx_eof_n_pipeline_r),
        .I1(tx_rem_pipeline_r[1]),
        .I2(tx_rem_pipeline_r[0]),
        .O(n_0_storage_v_r_i_1));
FDRE storage_v_r_reg
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(n_0_storage_v_r_i_1),
        .Q(p_2_out),
        .R(\n_0_tx_pe_data_v_r[1]_i_1 ));
FDRE \tx_d_pipeline_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[0]),
        .Q(tx_d_pipeline_r[0]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[10] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[10]),
        .Q(tx_d_pipeline_r[10]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[11] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[11]),
        .Q(tx_d_pipeline_r[11]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[12] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[12]),
        .Q(tx_d_pipeline_r[12]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[13] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[13]),
        .Q(tx_d_pipeline_r[13]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[14] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[14]),
        .Q(tx_d_pipeline_r[14]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[15] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[15]),
        .Q(tx_d_pipeline_r[15]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[16] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[16]),
        .Q(tx_d_pipeline_r[16]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[17] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[17]),
        .Q(tx_d_pipeline_r[17]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[18] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[18]),
        .Q(tx_d_pipeline_r[18]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[19] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[19]),
        .Q(tx_d_pipeline_r[19]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[1]),
        .Q(tx_d_pipeline_r[1]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[20] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[20]),
        .Q(tx_d_pipeline_r[20]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[21] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[21]),
        .Q(tx_d_pipeline_r[21]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[22] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[22]),
        .Q(tx_d_pipeline_r[22]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[23] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[23]),
        .Q(tx_d_pipeline_r[23]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[24] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[24]),
        .Q(tx_d_pipeline_r[24]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[25] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[25]),
        .Q(tx_d_pipeline_r[25]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[26] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[26]),
        .Q(tx_d_pipeline_r[26]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[27] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[27]),
        .Q(tx_d_pipeline_r[27]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[28] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[28]),
        .Q(tx_d_pipeline_r[28]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[29] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[29]),
        .Q(tx_d_pipeline_r[29]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[2]),
        .Q(tx_d_pipeline_r[2]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[30] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[30]),
        .Q(tx_d_pipeline_r[30]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[31] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[31]),
        .Q(tx_d_pipeline_r[31]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[32] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[32]),
        .Q(tx_d_pipeline_r[32]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[33] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[33]),
        .Q(tx_d_pipeline_r[33]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[34] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[34]),
        .Q(tx_d_pipeline_r[34]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[35] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[35]),
        .Q(tx_d_pipeline_r[35]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[36] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[36]),
        .Q(tx_d_pipeline_r[36]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[37] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[37]),
        .Q(tx_d_pipeline_r[37]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[38] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[38]),
        .Q(tx_d_pipeline_r[38]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[39] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[39]),
        .Q(tx_d_pipeline_r[39]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[3] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[3]),
        .Q(tx_d_pipeline_r[3]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[40] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[40]),
        .Q(tx_d_pipeline_r[40]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[41] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[41]),
        .Q(tx_d_pipeline_r[41]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[42] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[42]),
        .Q(tx_d_pipeline_r[42]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[43] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[43]),
        .Q(tx_d_pipeline_r[43]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[44] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[44]),
        .Q(tx_d_pipeline_r[44]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[45] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[45]),
        .Q(tx_d_pipeline_r[45]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[46] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[46]),
        .Q(tx_d_pipeline_r[46]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[47] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[47]),
        .Q(tx_d_pipeline_r[47]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[48] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[48]),
        .Q(tx_d_pipeline_r[48]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[49] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[49]),
        .Q(tx_d_pipeline_r[49]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[4] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[4]),
        .Q(tx_d_pipeline_r[4]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[50] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[50]),
        .Q(tx_d_pipeline_r[50]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[51] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[51]),
        .Q(tx_d_pipeline_r[51]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[52] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[52]),
        .Q(tx_d_pipeline_r[52]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[53] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[53]),
        .Q(tx_d_pipeline_r[53]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[54] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[54]),
        .Q(tx_d_pipeline_r[54]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[55] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[55]),
        .Q(tx_d_pipeline_r[55]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[56] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[56]),
        .Q(tx_d_pipeline_r[56]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[57] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[57]),
        .Q(tx_d_pipeline_r[57]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[58] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[58]),
        .Q(tx_d_pipeline_r[58]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[59] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[59]),
        .Q(tx_d_pipeline_r[59]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[5] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[5]),
        .Q(tx_d_pipeline_r[5]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[60] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[60]),
        .Q(tx_d_pipeline_r[60]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[61] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[61]),
        .Q(tx_d_pipeline_r[61]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[62] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[62]),
        .Q(tx_d_pipeline_r[62]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[63] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[63]),
        .Q(tx_d_pipeline_r[63]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[6] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[6]),
        .Q(tx_d_pipeline_r[6]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[7] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[7]),
        .Q(tx_d_pipeline_r[7]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[8] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[8]),
        .Q(tx_d_pipeline_r[8]),
        .R(\<const0> ));
FDRE \tx_d_pipeline_r_reg[9] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(S_AXI_TX_TDATA[9]),
        .Q(tx_d_pipeline_r[9]),
        .R(\<const0> ));
FDSE tx_dst_rdy_n_pipeline_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I1),
        .Q(tx_dst_rdy_n_pipeline_r),
        .S(R));
LUT1 #(
    .INIT(2'h1)) 
     tx_eof_n_pipeline_r_i_1
       (.I0(S_AXI_TX_TLAST),
        .O(TX_EOF_N));
FDSE tx_eof_n_pipeline_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(TX_EOF_N),
        .Q(tx_eof_n_pipeline_r),
        .S(R));
FDRE \tx_pe_data_r_reg[0] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(storage_r[0]),
        .Q(tx_pe_data_r[0]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[10] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(storage_r[10]),
        .Q(tx_pe_data_r[10]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[11] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(storage_r[11]),
        .Q(tx_pe_data_r[11]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[12] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(storage_r[12]),
        .Q(tx_pe_data_r[12]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[13] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(storage_r[13]),
        .Q(tx_pe_data_r[13]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[14] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(storage_r[14]),
        .Q(tx_pe_data_r[14]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[15] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(storage_r[15]),
        .Q(tx_pe_data_r[15]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[16] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[0]),
        .Q(tx_pe_data_r[16]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[17] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[1]),
        .Q(tx_pe_data_r[17]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[18] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[2]),
        .Q(tx_pe_data_r[18]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[19] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[3]),
        .Q(tx_pe_data_r[19]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[1] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(storage_r[1]),
        .Q(tx_pe_data_r[1]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[20] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[4]),
        .Q(tx_pe_data_r[20]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[21] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[5]),
        .Q(tx_pe_data_r[21]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[22] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[6]),
        .Q(tx_pe_data_r[22]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[23] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[7]),
        .Q(tx_pe_data_r[23]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[24] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[8]),
        .Q(tx_pe_data_r[24]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[25] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[9]),
        .Q(tx_pe_data_r[25]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[26] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[10]),
        .Q(tx_pe_data_r[26]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[27] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[11]),
        .Q(tx_pe_data_r[27]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[28] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[12]),
        .Q(tx_pe_data_r[28]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[29] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[13]),
        .Q(tx_pe_data_r[29]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[2] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(storage_r[2]),
        .Q(tx_pe_data_r[2]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[30] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[14]),
        .Q(tx_pe_data_r[30]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[31] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[15]),
        .Q(tx_pe_data_r[31]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[32] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[16]),
        .Q(tx_pe_data_r[32]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[33] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[17]),
        .Q(tx_pe_data_r[33]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[34] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[18]),
        .Q(tx_pe_data_r[34]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[35] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[19]),
        .Q(tx_pe_data_r[35]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[36] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[20]),
        .Q(tx_pe_data_r[36]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[37] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[21]),
        .Q(tx_pe_data_r[37]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[38] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[22]),
        .Q(tx_pe_data_r[38]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[39] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[23]),
        .Q(tx_pe_data_r[39]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[3] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(storage_r[3]),
        .Q(tx_pe_data_r[3]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[40] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[24]),
        .Q(tx_pe_data_r[40]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[41] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[25]),
        .Q(tx_pe_data_r[41]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[42] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[26]),
        .Q(tx_pe_data_r[42]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[43] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[27]),
        .Q(tx_pe_data_r[43]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[44] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[28]),
        .Q(tx_pe_data_r[44]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[45] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[29]),
        .Q(tx_pe_data_r[45]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[46] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[30]),
        .Q(tx_pe_data_r[46]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[47] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[31]),
        .Q(tx_pe_data_r[47]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[48] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[32]),
        .Q(tx_pe_data_r[48]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[49] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[33]),
        .Q(tx_pe_data_r[49]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[4] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(storage_r[4]),
        .Q(tx_pe_data_r[4]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[50] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[34]),
        .Q(tx_pe_data_r[50]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[51] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[35]),
        .Q(tx_pe_data_r[51]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[52] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[36]),
        .Q(tx_pe_data_r[52]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[53] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[37]),
        .Q(tx_pe_data_r[53]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[54] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[38]),
        .Q(tx_pe_data_r[54]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[55] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[39]),
        .Q(tx_pe_data_r[55]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[56] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[40]),
        .Q(tx_pe_data_r[56]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[57] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[41]),
        .Q(tx_pe_data_r[57]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[58] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[42]),
        .Q(tx_pe_data_r[58]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[59] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[43]),
        .Q(tx_pe_data_r[59]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[5] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(storage_r[5]),
        .Q(tx_pe_data_r[5]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[60] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[44]),
        .Q(tx_pe_data_r[60]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[61] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[45]),
        .Q(tx_pe_data_r[61]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[62] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[46]),
        .Q(tx_pe_data_r[62]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[63] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(tx_d_pipeline_r[47]),
        .Q(tx_pe_data_r[63]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[6] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(storage_r[6]),
        .Q(tx_pe_data_r[6]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[7] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(storage_r[7]),
        .Q(tx_pe_data_r[7]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[8] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(storage_r[8]),
        .Q(tx_pe_data_r[8]),
        .R(\<const0> ));
FDRE \tx_pe_data_r_reg[9] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(storage_r[9]),
        .Q(tx_pe_data_r[9]),
        .R(\<const0> ));
LUT1 #(
    .INIT(2'h1)) 
     \tx_pe_data_v_r[0]_i_1 
       (.I0(halt_c_pipeline_r),
        .O(TX_PE_DATA_V_Buffer1));
LUT5 #(
    .INIT(32'h0000FFF2)) 
     \tx_pe_data_v_r[1]_i_1 
       (.I0(tx_sof_n_pipeline_r),
        .I1(n_0_in_frame_r_reg),
        .I2(tx_dst_rdy_n_pipeline_r),
        .I3(tx_src_rdy_n_pipeline_r),
        .I4(halt_c_pipeline_r),
        .O(\n_0_tx_pe_data_v_r[1]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair128" *) 
   LUT3 #(
    .INIT(8'hFE)) 
     \tx_pe_data_v_r[2]_i_1 
       (.I0(tx_eof_n_pipeline_r),
        .I1(tx_rem_pipeline_r[1]),
        .I2(tx_rem_pipeline_r[0]),
        .O(\n_0_tx_pe_data_v_r[2]_i_1 ));
LUT2 #(
    .INIT(4'hE)) 
     \tx_pe_data_v_r[3]_i_1 
       (.I0(tx_eof_n_pipeline_r),
        .I1(tx_rem_pipeline_r[0]),
        .O(\n_0_tx_pe_data_v_r[3]_i_1 ));
FDRE \tx_pe_data_v_r_reg[0] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(p_2_out),
        .Q(\n_0_tx_pe_data_v_r_reg[0] ),
        .R(\<const0> ));
FDRE \tx_pe_data_v_r_reg[1] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(\<const1> ),
        .Q(p_2_in9_in),
        .R(\n_0_tx_pe_data_v_r[1]_i_1 ));
FDRE \tx_pe_data_v_r_reg[2] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(\n_0_tx_pe_data_v_r[2]_i_1 ),
        .Q(p_1_in),
        .R(\n_0_tx_pe_data_v_r[1]_i_1 ));
FDRE \tx_pe_data_v_r_reg[3] 
       (.C(user_clk),
        .CE(TX_PE_DATA_V_Buffer1),
        .D(\n_0_tx_pe_data_v_r[3]_i_1 ),
        .Q(\n_0_tx_pe_data_v_r_reg[3] ),
        .R(\n_0_tx_pe_data_v_r[1]_i_1 ));
LUT3 #(
    .INIT(8'h96)) 
     \tx_rem_pipeline_r[0]_i_4 
       (.I0(S_AXI_TX_TKEEP[4]),
        .I1(S_AXI_TX_TKEEP[5]),
        .I2(S_AXI_TX_TKEEP[3]),
        .O(O1));
LUT4 #(
    .INIT(16'hA956)) 
     \tx_rem_pipeline_r[1]_i_1 
       (.I0(\n_0_tx_rem_pipeline_r[1]_i_2 ),
        .I1(S_AXI_TX_TKEEP[1]),
        .I2(S_AXI_TX_TKEEP[2]),
        .I3(I3),
        .O(TX_REM[1]));
LUT6 #(
    .INIT(64'h0069690069FFFF69)) 
     \tx_rem_pipeline_r[1]_i_2 
       (.I0(S_AXI_TX_TKEEP[7]),
        .I1(S_AXI_TX_TKEEP[6]),
        .I2(S_AXI_TX_TKEEP[0]),
        .I3(S_AXI_TX_TKEEP[1]),
        .I4(S_AXI_TX_TKEEP[2]),
        .I5(O1),
        .O(\n_0_tx_rem_pipeline_r[1]_i_2 ));
LUT6 #(
    .INIT(64'h9669699669969669)) 
     \tx_rem_pipeline_r[2]_i_1 
       (.I0(S_AXI_TX_TKEEP[0]),
        .I1(S_AXI_TX_TKEEP[6]),
        .I2(S_AXI_TX_TKEEP[7]),
        .I3(S_AXI_TX_TKEEP[1]),
        .I4(S_AXI_TX_TKEEP[2]),
        .I5(O1),
        .O(TX_REM[2]));
FDRE \tx_rem_pipeline_r_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I2),
        .Q(tx_rem_pipeline_r[0]),
        .R(\<const0> ));
FDRE \tx_rem_pipeline_r_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(TX_REM[1]),
        .Q(tx_rem_pipeline_r[1]),
        .R(\<const0> ));
FDRE \tx_rem_pipeline_r_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(TX_REM[2]),
        .Q(tx_rem_pipeline_r[2]),
        .R(\<const0> ));
FDSE tx_sof_n_pipeline_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(TX_SOF_N),
        .Q(tx_sof_n_pipeline_r),
        .S(R));
LUT1 #(
    .INIT(2'h1)) 
     tx_src_rdy_n_pipeline_r_i_1
       (.I0(S_AXI_TX_TVALID),
        .O(TX_SRC_RDY_N));
FDSE tx_src_rdy_n_pipeline_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(TX_SRC_RDY_N),
        .Q(tx_src_rdy_n_pipeline_r),
        .S(R));
endmodule

module data_mgtdata_mgt_VALID_DATA_COUNTER
   (D,
    Q,
    p_0_out,
    FRAME_ERR_RESULT_Buffer0,
    O1,
    O2,
    stage_2_start_with_data_r,
    END_STORAGE,
    STORAGE_COUNT,
    I1,
    stage_2_end_after_start_r,
    stage_2_end_before_start_r,
    I2,
    START_RX,
    RESET,
    I3,
    user_clk);
  output [1:0]D;
  output [2:0]Q;
  output [0:0]p_0_out;
  output FRAME_ERR_RESULT_Buffer0;
  output O1;
  output O2;
  input stage_2_start_with_data_r;
  input END_STORAGE;
  input [0:2]STORAGE_COUNT;
  input I1;
  input stage_2_end_after_start_r;
  input stage_2_end_before_start_r;
  input I2;
  input START_RX;
  input RESET;
  input [2:0]I3;
  input user_clk;

  wire \<const1> ;
  wire [1:0]D;
  wire END_STORAGE;
  wire FRAME_ERR_RESULT_Buffer0;
  wire I1;
  wire I2;
  wire [2:0]I3;
  wire O1;
  wire O2;
  wire [2:0]Q;
  wire RESET;
  wire START_RX;
  wire [0:2]STORAGE_COUNT;
  wire n_0_FRAME_ERR_RESULT_Buffer_i_2;
  wire [0:0]p_0_out;
  wire stage_2_end_after_start_r;
  wire stage_2_end_before_start_r;
  wire stage_2_start_with_data_r;
  wire user_clk;

FDRE \COUNT_Buffer_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I3[2]),
        .Q(Q[2]),
        .R(RESET));
FDRE \COUNT_Buffer_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I3[1]),
        .Q(Q[1]),
        .R(RESET));
FDRE \COUNT_Buffer_reg[2] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I3[0]),
        .Q(Q[0]),
        .R(RESET));
LUT6 #(
    .INIT(64'hFFFECFCCCFCECFCC)) 
     FRAME_ERR_RESULT_Buffer_i_1
       (.I0(n_0_FRAME_ERR_RESULT_Buffer_i_2),
        .I1(I1),
        .I2(stage_2_start_with_data_r),
        .I3(stage_2_end_after_start_r),
        .I4(stage_2_end_before_start_r),
        .I5(I2),
        .O(FRAME_ERR_RESULT_Buffer0));
LUT6 #(
    .INIT(64'h0000000000000001)) 
     FRAME_ERR_RESULT_Buffer_i_2
       (.I0(Q[0]),
        .I1(STORAGE_COUNT[2]),
        .I2(Q[1]),
        .I3(STORAGE_COUNT[0]),
        .I4(Q[2]),
        .I5(STORAGE_COUNT[1]),
        .O(n_0_FRAME_ERR_RESULT_Buffer_i_2));
LUT6 #(
    .INIT(64'hFFF50006000AFFF9)) 
     \RX_REM_Buffer[0]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(stage_2_start_with_data_r),
        .I3(END_STORAGE),
        .I4(STORAGE_COUNT[2]),
        .I5(STORAGE_COUNT[1]),
        .O(D[1]));
LUT4 #(
    .INIT(16'h02FD)) 
     \RX_REM_Buffer[1]_i_1 
       (.I0(Q[0]),
        .I1(stage_2_start_with_data_r),
        .I2(END_STORAGE),
        .I3(STORAGE_COUNT[2]),
        .O(D[0]));
LUT6 #(
    .INIT(64'hFFFFFFFF010DFFFF)) 
     SRC_RDY_N_Buffer_i_1
       (.I0(p_0_out),
        .I1(stage_2_start_with_data_r),
        .I2(END_STORAGE),
        .I3(stage_2_end_before_start_r),
        .I4(START_RX),
        .I5(I1),
        .O(O1));
LUT6 #(
    .INIT(64'hFFFFFFFEFFFE8880)) 
     \STORAGE_CE_Buffer[0]_i_2 
       (.I0(Q[1]),
        .I1(STORAGE_COUNT[1]),
        .I2(STORAGE_COUNT[2]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(STORAGE_COUNT[0]),
        .O(p_0_out));
VCC VCC
       (.P(\<const1> ));
LUT6 #(
    .INIT(64'h000000008D880000)) 
     end_storage_r_i_1
       (.I0(stage_2_start_with_data_r),
        .I1(stage_2_end_after_start_r),
        .I2(n_0_FRAME_ERR_RESULT_Buffer_i_2),
        .I3(stage_2_end_before_start_r),
        .I4(START_RX),
        .I5(I1),
        .O(O2));
endmodule

(* ORIG_REF_NAME = "data_mgt_cdc_sync" *) 
module data_mgtdata_mgt_cdc_sync__parameterized0
   (s_level_out_d3,
    init_clk_in,
    rx_cc_extend_r2);
  output s_level_out_d3;
  input init_clk_in;
  input rx_cc_extend_r2;

  wire \<const0> ;
  wire \<const1> ;
  wire init_clk_in;
  wire rx_cc_extend_r2;
  wire s_level_out_d1_cdc_to;
  wire s_level_out_d2;
  wire s_level_out_d3;

(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(rx_cc_extend_r2),
        .Q(s_level_out_d1_cdc_to),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(s_level_out_d1_cdc_to),
        .Q(s_level_out_d2),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(\<const0> ));
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
endmodule

(* ORIG_REF_NAME = "data_mgt_cdc_sync" *) 
module data_mgtdata_mgt_cdc_sync__parameterized0_1
   (s_level_out_d3,
    user_clk,
    TX_RESETDONE_OUT);
  output s_level_out_d3;
  input user_clk;
  input TX_RESETDONE_OUT;

  wire \<const0> ;
  wire \<const1> ;
  wire TX_RESETDONE_OUT;
  wire s_level_out_d1_cdc_to;
  wire s_level_out_d2;
  wire s_level_out_d3;
  wire user_clk;

(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(TX_RESETDONE_OUT),
        .Q(s_level_out_d1_cdc_to),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(s_level_out_d1_cdc_to),
        .Q(s_level_out_d2),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3_reg 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(\<const0> ));
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
endmodule

(* ORIG_REF_NAME = "data_mgt_cdc_sync" *) 
module data_mgtdata_mgt_cdc_sync__parameterized0_10
   (O1,
    user_clk,
    I1);
  output O1;
  input user_clk;
  input I1;

  wire \<const0> ;
  wire \<const1> ;
  wire I1;
  wire O1;
  wire \n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ;
  wire \n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ;
  wire user_clk;

(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(I1),
        .Q(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ),
        .Q(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3_reg 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ),
        .Q(O1),
        .R(\<const0> ));
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
endmodule

(* ORIG_REF_NAME = "data_mgt_cdc_sync" *) 
module data_mgtdata_mgt_cdc_sync__parameterized0_11
   (O1,
    user_clk,
    rx_fsm_reset_done_int);
  output O1;
  input user_clk;
  input rx_fsm_reset_done_int;

  wire \<const0> ;
  wire \<const1> ;
  wire O1;
  wire \n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ;
  wire \n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ;
  wire rx_fsm_reset_done_int;
  wire user_clk;

(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(rx_fsm_reset_done_int),
        .Q(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ),
        .Q(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3_reg 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ),
        .Q(O1),
        .R(\<const0> ));
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
endmodule

(* ORIG_REF_NAME = "data_mgt_cdc_sync" *) 
module data_mgtdata_mgt_cdc_sync__parameterized0_12
   (O1,
    init_clk_in,
    I1);
  output O1;
  input init_clk_in;
  input I1;

  wire \<const0> ;
  wire \<const1> ;
  wire I1;
  wire O1;
  wire init_clk_in;
  wire \n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ;
  wire \n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ;

(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(I1),
        .Q(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ),
        .Q(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ),
        .Q(O1),
        .R(\<const0> ));
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
endmodule

(* ORIG_REF_NAME = "data_mgt_cdc_sync" *) 
module data_mgtdata_mgt_cdc_sync__parameterized0_13
   (E,
    D,
    O1,
    O2,
    init_clk_in,
    rxfsm_data_valid_r,
    Q,
    I1,
    I2,
    I3,
    I4,
    I5,
    I6,
    time_out_1us,
    I7,
    I8,
    time_out_100us,
    I9,
    I10,
    rx_cdrlocked,
    rxresetdone_s3,
    I11,
    time_out_wait_bypass_s3,
    I12,
    I13,
    I14,
    I15,
    rx_fsm_reset_done_int,
    I16);
  output [0:0]E;
  output [1:0]D;
  output O1;
  output O2;
  input init_clk_in;
  input rxfsm_data_valid_r;
  input [5:0]Q;
  input I1;
  input I2;
  input I3;
  input I4;
  input I5;
  input I6;
  input time_out_1us;
  input I7;
  input I8;
  input time_out_100us;
  input I9;
  input I10;
  input rx_cdrlocked;
  input rxresetdone_s3;
  input I11;
  input time_out_wait_bypass_s3;
  input I12;
  input I13;
  input I14;
  input I15;
  input rx_fsm_reset_done_int;
  input I16;

  wire \<const0> ;
  wire \<const1> ;
  wire [1:0]D;
  wire [0:0]E;
  wire I1;
  wire I10;
  wire I11;
  wire I12;
  wire I13;
  wire I14;
  wire I15;
  wire I16;
  wire I2;
  wire I3;
  wire I4;
  wire I5;
  wire I6;
  wire I7;
  wire I8;
  wire I9;
  wire O1;
  wire O2;
  wire [5:0]Q;
  wire data_valid_sync;
  wire init_clk_in;
  wire \n_0_FSM_onehot_rx_state[1]_i_3 ;
  wire \n_0_FSM_onehot_rx_state[8]_i_12 ;
  wire \n_0_FSM_onehot_rx_state[8]_i_13 ;
  wire \n_0_FSM_onehot_rx_state_reg[8]_i_6 ;
  wire \n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ;
  wire \n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ;
  wire n_0_reset_time_out_i_4__0;
  wire n_0_reset_time_out_i_5;
  wire n_0_reset_time_out_reg_i_3;
  wire n_0_rx_fsm_reset_done_int_i_2;
  wire n_0_rx_fsm_reset_done_int_i_4;
  wire rx_cdrlocked;
  wire rx_fsm_reset_done_int;
  wire rxfsm_data_valid_r;
  wire rxresetdone_s3;
  wire time_out_100us;
  wire time_out_1us;
  wire time_out_wait_bypass_s3;

LUT6 #(
    .INIT(64'h000000000000AAFE)) 
     \FSM_onehot_rx_state[1]_i_1 
       (.I0(I9),
        .I1(\n_0_FSM_onehot_rx_state[1]_i_3 ),
        .I2(Q[1]),
        .I3(I10),
        .I4(Q[5]),
        .I5(Q[0]),
        .O(D[0]));
LUT6 #(
    .INIT(64'h0033000030883088)) 
     \FSM_onehot_rx_state[1]_i_3 
       (.I0(I11),
        .I1(Q[2]),
        .I2(\n_0_FSM_onehot_rx_state[8]_i_12 ),
        .I3(Q[4]),
        .I4(time_out_wait_bypass_s3),
        .I5(Q[3]),
        .O(\n_0_FSM_onehot_rx_state[1]_i_3 ));
LUT3 #(
    .INIT(8'h04)) 
     \FSM_onehot_rx_state[8]_i_12 
       (.I0(I8),
        .I1(time_out_100us),
        .I2(data_valid_sync),
        .O(\n_0_FSM_onehot_rx_state[8]_i_12 ));
LUT5 #(
    .INIT(32'h47444747)) 
     \FSM_onehot_rx_state[8]_i_13 
       (.I0(rx_cdrlocked),
        .I1(I7),
        .I2(data_valid_sync),
        .I3(I8),
        .I4(time_out_100us),
        .O(\n_0_FSM_onehot_rx_state[8]_i_13 ));
LUT6 #(
    .INIT(64'h0CCCDDDDFFFFDDDD)) 
     \FSM_onehot_rx_state[8]_i_2 
       (.I0(\n_0_FSM_onehot_rx_state_reg[8]_i_6 ),
        .I1(Q[5]),
        .I2(I1),
        .I3(data_valid_sync),
        .I4(I2),
        .I5(I3),
        .O(E));
LUT6 #(
    .INIT(64'h0000000002000000)) 
     \FSM_onehot_rx_state[8]_i_3 
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[5]),
        .I3(I12),
        .I4(I13),
        .I5(\n_0_FSM_onehot_rx_state[8]_i_12 ),
        .O(D[1]));
MUXF7 \FSM_onehot_rx_state_reg[8]_i_6 
       (.I0(\n_0_FSM_onehot_rx_state[8]_i_13 ),
        .I1(I5),
        .O(\n_0_FSM_onehot_rx_state_reg[8]_i_6 ),
        .S(I4));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(rxfsm_data_valid_r),
        .Q(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ),
        .Q(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ),
        .Q(data_valid_sync),
        .R(\<const0> ));
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
LUT6 #(
    .INIT(64'hFFFFFFFFE2E2EEE2)) 
     reset_time_out_i_1__0
       (.I0(I8),
        .I1(I14),
        .I2(n_0_reset_time_out_reg_i_3),
        .I3(I1),
        .I4(n_0_reset_time_out_i_4__0),
        .I5(I15),
        .O(O1));
(* SOFT_HLUTNM = "soft_lutpair45" *) 
   LUT2 #(
    .INIT(4'h8)) 
     reset_time_out_i_4__0
       (.I0(Q[5]),
        .I1(data_valid_sync),
        .O(n_0_reset_time_out_i_4__0));
LUT5 #(
    .INIT(32'hB8BBB888)) 
     reset_time_out_i_5
       (.I0(rx_cdrlocked),
        .I1(I7),
        .I2(rxresetdone_s3),
        .I3(I4),
        .I4(data_valid_sync),
        .O(n_0_reset_time_out_i_5));
MUXF7 reset_time_out_reg_i_3
       (.I0(n_0_reset_time_out_i_5),
        .I1(I6),
        .O(n_0_reset_time_out_reg_i_3),
        .S(I2));
LUT5 #(
    .INIT(32'h0000BA8A)) 
     rx_fsm_reset_done_int_i_1
       (.I0(rx_fsm_reset_done_int),
        .I1(n_0_rx_fsm_reset_done_int_i_2),
        .I2(I16),
        .I3(n_0_rx_fsm_reset_done_int_i_4),
        .I4(I15),
        .O(O2));
LUT6 #(
    .INIT(64'hFC7CFC7C3F3C3F3F)) 
     rx_fsm_reset_done_int_i_2
       (.I0(time_out_1us),
        .I1(I7),
        .I2(Q[5]),
        .I3(I8),
        .I4(time_out_100us),
        .I5(data_valid_sync),
        .O(n_0_rx_fsm_reset_done_int_i_2));
(* SOFT_HLUTNM = "soft_lutpair45" *) 
   LUT4 #(
    .INIT(16'h0800)) 
     rx_fsm_reset_done_int_i_4
       (.I0(data_valid_sync),
        .I1(Q[5]),
        .I2(I8),
        .I3(time_out_1us),
        .O(n_0_rx_fsm_reset_done_int_i_4));
endmodule

(* ORIG_REF_NAME = "data_mgt_cdc_sync" *) 
module data_mgtdata_mgt_cdc_sync__parameterized0_15
   (O1,
    init_clk_in,
    txfsm_txresetdone_r);
  output O1;
  input init_clk_in;
  input txfsm_txresetdone_r;

  wire \<const0> ;
  wire \<const1> ;
  wire O1;
  wire init_clk_in;
  wire \n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ;
  wire \n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ;
  wire txfsm_txresetdone_r;

(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(txfsm_txresetdone_r),
        .Q(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ),
        .Q(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ),
        .Q(O1),
        .R(\<const0> ));
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
endmodule

(* ORIG_REF_NAME = "data_mgt_cdc_sync" *) 
module data_mgtdata_mgt_cdc_sync__parameterized0_16
   (O1,
    E,
    O2,
    init_clk_in,
    CPLLLOCK,
    init_wait_done,
    I1,
    Q,
    txresetdone_s3,
    mmcm_lock_reclocked,
    I2,
    I3,
    I4,
    I5,
    time_out_2ms,
    reset_time_out,
    I6);
  output O1;
  output [0:0]E;
  output O2;
  input init_clk_in;
  input CPLLLOCK;
  input init_wait_done;
  input I1;
  input [4:0]Q;
  input txresetdone_s3;
  input mmcm_lock_reclocked;
  input I2;
  input I3;
  input I4;
  input I5;
  input time_out_2ms;
  input reset_time_out;
  input I6;

  wire \<const0> ;
  wire \<const1> ;
  wire CPLLLOCK;
  wire [0:0]E;
  wire I1;
  wire I2;
  wire I3;
  wire I4;
  wire I5;
  wire I6;
  wire O1;
  wire O2;
  wire [4:0]Q;
  wire init_clk_in;
  wire init_wait_done;
  wire mmcm_lock_reclocked;
  wire \n_0_FSM_onehot_tx_state[7]_i_5 ;
  wire \n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ;
  wire \n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ;
  wire n_0_reset_time_out_i_2;
  wire n_0_reset_time_out_i_3;
  wire n_0_reset_time_out_i_4;
  wire reset_time_out;
  wire time_out_2ms;
  wire txresetdone_s3;

LUT6 #(
    .INIT(64'hAFC0AFC0AFC0A0C0)) 
     \FSM_onehot_tx_state[7]_i_5 
       (.I0(init_wait_done),
        .I1(I5),
        .I2(I1),
        .I3(I3),
        .I4(time_out_2ms),
        .I5(O1),
        .O(\n_0_FSM_onehot_tx_state[7]_i_5 ));
MUXF7 \FSM_onehot_tx_state_reg[7]_i_2 
       (.I0(I4),
        .I1(\n_0_FSM_onehot_tx_state[7]_i_5 ),
        .O(E),
        .S(I2));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(CPLLLOCK),
        .Q(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ),
        .Q(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ),
        .Q(O1),
        .R(\<const0> ));
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
LUT6 #(
    .INIT(64'h00000000BFFB8008)) 
     reset_time_out_i_1
       (.I0(reset_time_out),
        .I1(n_0_reset_time_out_i_2),
        .I2(I2),
        .I3(I3),
        .I4(n_0_reset_time_out_i_3),
        .I5(I6),
        .O(O2));
LUT6 #(
    .INIT(64'h3333333333333347)) 
     reset_time_out_i_2
       (.I0(init_wait_done),
        .I1(I1),
        .I2(O1),
        .I3(Q[3]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(n_0_reset_time_out_i_2));
LUT6 #(
    .INIT(64'hAAAA0F00CFCF0F0F)) 
     reset_time_out_i_3
       (.I0(n_0_reset_time_out_i_4),
        .I1(txresetdone_s3),
        .I2(I1),
        .I3(mmcm_lock_reclocked),
        .I4(I2),
        .I5(I3),
        .O(n_0_reset_time_out_i_3));
LUT5 #(
    .INIT(32'hFFFE0002)) 
     reset_time_out_i_4
       (.I0(init_wait_done),
        .I1(Q[4]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(O1),
        .O(n_0_reset_time_out_i_4));
endmodule

(* ORIG_REF_NAME = "data_mgt_cdc_sync" *) 
module data_mgtdata_mgt_cdc_sync__parameterized0_17
   (O1,
    init_clk_in,
    time_out_wait_bypass);
  output O1;
  input init_clk_in;
  input time_out_wait_bypass;

  wire \<const0> ;
  wire \<const1> ;
  wire O1;
  wire init_clk_in;
  wire \n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ;
  wire \n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ;
  wire time_out_wait_bypass;

(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(time_out_wait_bypass),
        .Q(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ),
        .Q(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ),
        .Q(O1),
        .R(\<const0> ));
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
endmodule

(* ORIG_REF_NAME = "data_mgt_cdc_sync" *) 
module data_mgtdata_mgt_cdc_sync__parameterized0_18
   (s_level_out_d3,
    user_clk,
    run_phase_alignment_int);
  output s_level_out_d3;
  input user_clk;
  input run_phase_alignment_int;

  wire \<const0> ;
  wire \<const1> ;
  wire run_phase_alignment_int;
  wire s_level_out_d1_cdc_to;
  wire s_level_out_d2;
  wire s_level_out_d3;
  wire user_clk;

(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(run_phase_alignment_int),
        .Q(s_level_out_d1_cdc_to),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(s_level_out_d1_cdc_to),
        .Q(s_level_out_d2),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3_reg 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(\<const0> ));
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
endmodule

(* ORIG_REF_NAME = "data_mgt_cdc_sync" *) 
module data_mgtdata_mgt_cdc_sync__parameterized0_19
   (O1,
    SR,
    O2,
    init_clk_in,
    E,
    mmcm_lock_reclocked);
  output O1;
  output [0:0]SR;
  output O2;
  input init_clk_in;
  input [0:0]E;
  input mmcm_lock_reclocked;

  wire \<const0> ;
  wire \<const1> ;
  wire [0:0]E;
  wire O1;
  wire O2;
  wire [0:0]SR;
  wire init_clk_in;
  wire mmcm_lock_reclocked;
  wire \n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ;
  wire \n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ;

(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\<const1> ),
        .Q(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ),
        .Q(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ),
        .Q(O1),
        .R(\<const0> ));
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair29" *) 
   LUT1 #(
    .INIT(2'h1)) 
     \mmcm_lock_count[9]_i_1 
       (.I0(O1),
        .O(SR));
(* SOFT_HLUTNM = "soft_lutpair29" *) 
   LUT3 #(
    .INIT(8'hA2)) 
     mmcm_lock_reclocked_i_1
       (.I0(O1),
        .I1(E),
        .I2(mmcm_lock_reclocked),
        .O(O2));
endmodule

(* ORIG_REF_NAME = "data_mgt_cdc_sync" *) 
module data_mgtdata_mgt_cdc_sync__parameterized0_2
   (SS,
    SR,
    sys_reset_out,
    user_clk,
    link_reset_comb_r,
    RESET_CHANNEL,
    RESET,
    gt_txresetdone_r3,
    gt_rxresetdone_r3,
    EN_CHAN_SYNC);
  output [0:0]SS;
  output [0:0]SR;
  output sys_reset_out;
  input user_clk;
  input link_reset_comb_r;
  input RESET_CHANNEL;
  input RESET;
  input gt_txresetdone_r3;
  input gt_rxresetdone_r3;
  input EN_CHAN_SYNC;

  wire \<const0> ;
  wire \<const1> ;
  wire EN_CHAN_SYNC;
  wire RESET;
  wire RESET_CHANNEL;
  wire [0:0]SR;
  wire [0:0]SS;
  wire gt_rxresetdone_r3;
  wire gt_txresetdone_r3;
  wire link_reset_comb_r;
  wire \n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ;
  wire \n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ;
  wire \n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3_reg ;
  wire sys_reset_out;
  wire user_clk;

(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(link_reset_comb_r),
        .Q(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ),
        .Q(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3_reg 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ),
        .Q(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3_reg ),
        .R(\<const0> ));
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
LUT5 #(
    .INIT(32'hEFFFFFFF)) 
     \ch_bond_done_dly_i[0]_i_1 
       (.I0(RESET),
        .I1(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3_reg ),
        .I2(gt_txresetdone_r3),
        .I3(gt_rxresetdone_r3),
        .I4(EN_CHAN_SYNC),
        .O(SR));
(* SOFT_HLUTNM = "soft_lutpair133" *) 
   LUT4 #(
    .INIT(16'hFFF7)) 
     sys_reset_out_INST_0
       (.I0(gt_rxresetdone_r3),
        .I1(gt_txresetdone_r3),
        .I2(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3_reg ),
        .I3(RESET),
        .O(sys_reset_out));
(* SOFT_HLUTNM = "soft_lutpair133" *) 
   LUT5 #(
    .INIT(32'hFEFFFFFF)) 
     verify_r_i_1
       (.I0(RESET_CHANNEL),
        .I1(RESET),
        .I2(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3_reg ),
        .I3(gt_txresetdone_r3),
        .I4(gt_rxresetdone_r3),
        .O(SS));
endmodule

(* ORIG_REF_NAME = "data_mgt_cdc_sync" *) 
module data_mgtdata_mgt_cdc_sync__parameterized0_20
   (O1,
    user_clk,
    TX_RESETDONE_OUT);
  output O1;
  input user_clk;
  input TX_RESETDONE_OUT;

  wire \<const0> ;
  wire \<const1> ;
  wire O1;
  wire TX_RESETDONE_OUT;
  wire \n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ;
  wire \n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ;
  wire user_clk;

(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(TX_RESETDONE_OUT),
        .Q(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ),
        .Q(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3_reg 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ),
        .Q(O1),
        .R(\<const0> ));
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
endmodule

(* ORIG_REF_NAME = "data_mgt_cdc_sync" *) 
module data_mgtdata_mgt_cdc_sync__parameterized0_8
   (s_level_out_d3,
    init_clk_in,
    rx_cc_extend_r2);
  output s_level_out_d3;
  input init_clk_in;
  input rx_cc_extend_r2;

  wire \<const0> ;
  wire \<const1> ;
  wire init_clk_in;
  wire rx_cc_extend_r2;
  wire s_level_out_d1_cdc_to;
  wire s_level_out_d2;
  wire s_level_out_d3;

(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(rx_cc_extend_r2),
        .Q(s_level_out_d1_cdc_to),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(s_level_out_d1_cdc_to),
        .Q(s_level_out_d2),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(s_level_out_d2),
        .Q(s_level_out_d3),
        .R(\<const0> ));
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
endmodule

(* ORIG_REF_NAME = "data_mgt_cdc_sync" *) 
module data_mgtdata_mgt_cdc_sync__parameterized0_9
   (O1,
    init_clk_in,
    rxfsm_rxresetdone_r);
  output O1;
  input init_clk_in;
  input rxfsm_rxresetdone_r;

  wire \<const0> ;
  wire \<const1> ;
  wire O1;
  wire init_clk_in;
  wire \n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ;
  wire \n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ;
  wire rxfsm_rxresetdone_r;

(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(rxfsm_rxresetdone_r),
        .Q(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_reg ),
        .Q(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* shift_extract = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_0_GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2_reg ),
        .Q(O1),
        .R(\<const0> ));
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
endmodule

(* SIM_GTRESET_SPEEDUP = "FALSE" *) (* core_generation_info = "data_mgt,aurora_8b10b_v10_1,{user_interface=AXI_4_Streaming,backchannel_mode=Sidebands,c_aurora_lanes=2,c_column_used=left,c_gt_clock_1=GTXQ0,c_gt_clock_2=None,c_gt_loc_1=1,c_gt_loc_10=X,c_gt_loc_11=X,c_gt_loc_12=X,c_gt_loc_13=X,c_gt_loc_14=X,c_gt_loc_15=X,c_gt_loc_16=X,c_gt_loc_17=X,c_gt_loc_18=X,c_gt_loc_19=X,c_gt_loc_2=2,c_gt_loc_20=X,c_gt_loc_21=X,c_gt_loc_22=X,c_gt_loc_23=X,c_gt_loc_24=X,c_gt_loc_25=X,c_gt_loc_26=X,c_gt_loc_27=X,c_gt_loc_28=X,c_gt_loc_29=X,c_gt_loc_3=X,c_gt_loc_30=X,c_gt_loc_31=X,c_gt_loc_32=X,c_gt_loc_33=X,c_gt_loc_34=X,c_gt_loc_35=X,c_gt_loc_36=X,c_gt_loc_37=X,c_gt_loc_38=X,c_gt_loc_39=X,c_gt_loc_4=X,c_gt_loc_40=X,c_gt_loc_41=X,c_gt_loc_42=X,c_gt_loc_43=X,c_gt_loc_44=X,c_gt_loc_45=X,c_gt_loc_46=X,c_gt_loc_47=X,c_gt_loc_48=X,c_gt_loc_5=X,c_gt_loc_6=X,c_gt_loc_7=X,c_gt_loc_8=X,c_gt_loc_9=X,c_lane_width=4,c_line_rate=40000,c_nfc=false,c_nfc_mode=IMM,c_refclk_frequency=125000,c_simplex=false,c_simplex_mode=TX,c_stream=false,c_ufc=false,flow_mode=None,interface_mode=Framing,dataflow_config=Duplex}" *) 
module data_mgtdata_mgt_core
   (S_AXI_TX_TDATA,
    S_AXI_TX_TVALID,
    S_AXI_TX_TREADY,
    S_AXI_TX_TKEEP,
    S_AXI_TX_TLAST,
    M_AXI_RX_TDATA,
    M_AXI_RX_TVALID,
    M_AXI_RX_TKEEP,
    M_AXI_RX_TLAST,
    RXP,
    RXN,
    TXP,
    TXN,
    GT_REFCLK1,
    HARD_ERR,
    SOFT_ERR,
    FRAME_ERR,
    CHANNEL_UP,
    LANE_UP,
    WARN_CC,
    DO_CC,
    user_clk,
    SYNC_CLK,
    RESET,
    POWER_DOWN,
    LOOPBACK,
    GT_RESET,
    init_clk_in,
    PLL_NOT_LOCKED,
    TX_RESETDONE_OUT,
    RX_RESETDONE_OUT,
    LINK_RESET_OUT,
    drpclk_in,
    DRPADDR_IN,
    DRPDI_IN,
    DRPDO_OUT,
    DRPEN_IN,
    DRPRDY_OUT,
    DRPWE_IN,
    DRPADDR_IN_LANE1,
    DRPDI_IN_LANE1,
    DRPDO_OUT_LANE1,
    DRPEN_IN_LANE1,
    DRPRDY_OUT_LANE1,
    DRPWE_IN_LANE1,
    TX_OUT_CLK,
    gt0_qplllock_in,
    gt0_qpllrefclklost_in,
    gt0_qpllreset_out,
    gt_qpllclk_quad1_in,
    gt_qpllrefclk_quad1_in,
    sys_reset_out,
    tx_lock);
  input [0:63]S_AXI_TX_TDATA;
  input S_AXI_TX_TVALID;
  output S_AXI_TX_TREADY;
  input [0:7]S_AXI_TX_TKEEP;
  input S_AXI_TX_TLAST;
  output [0:63]M_AXI_RX_TDATA;
  output M_AXI_RX_TVALID;
  output [0:7]M_AXI_RX_TKEEP;
  output M_AXI_RX_TLAST;
  input [0:1]RXP;
  input [0:1]RXN;
  output [0:1]TXP;
  output [0:1]TXN;
  input GT_REFCLK1;
  output HARD_ERR;
  output SOFT_ERR;
  output FRAME_ERR;
  output CHANNEL_UP;
  output [0:1]LANE_UP;
  input WARN_CC;
  input DO_CC;
  input user_clk;
  input SYNC_CLK;
  input RESET;
  input POWER_DOWN;
  input [2:0]LOOPBACK;
  input GT_RESET;
  input init_clk_in;
  input PLL_NOT_LOCKED;
  output TX_RESETDONE_OUT;
  output RX_RESETDONE_OUT;
  output LINK_RESET_OUT;
  input drpclk_in;
  input [8:0]DRPADDR_IN;
  input [15:0]DRPDI_IN;
  output [15:0]DRPDO_OUT;
  input DRPEN_IN;
  output DRPRDY_OUT;
  input DRPWE_IN;
  input [8:0]DRPADDR_IN_LANE1;
  input [15:0]DRPDI_IN_LANE1;
  output [15:0]DRPDO_OUT_LANE1;
  input DRPEN_IN_LANE1;
  output DRPRDY_OUT_LANE1;
  input DRPWE_IN_LANE1;
  output TX_OUT_CLK;
  input gt0_qplllock_in;
  input gt0_qpllrefclklost_in;
  output gt0_qpllreset_out;
  input gt_qpllclk_quad1_in;
  input gt_qpllrefclk_quad1_in;
  output sys_reset_out;
  output tx_lock;

  wire \<const0> ;
  wire \<const1> ;
  wire CHANNEL_UP;
  wire CHBONDDONE_OUT;
  wire CHBONDDONE_OUT_LANE1;
  wire DO_CC;
  wire [8:0]DRPADDR_IN;
  wire [8:0]DRPADDR_IN_LANE1;
  wire [15:0]DRPDI_IN;
  wire [15:0]DRPDI_IN_LANE1;
  wire [15:0]DRPDO_OUT;
  wire [15:0]DRPDO_OUT_LANE1;
  wire DRPEN_IN;
  wire DRPEN_IN_LANE1;
  wire DRPRDY_OUT;
  wire DRPRDY_OUT_LANE1;
  wire DRPWE_IN;
  wire DRPWE_IN_LANE1;
  wire ENMCOMMAALIGN_IN;
  wire ENMCOMMAALIGN_IN_LANE1;
  wire EN_CHAN_SYNC;
  wire FRAME_ERR;
  wire GEN_A;
  wire GEN_CC;
  wire [0:3]GEN_K;
  wire [0:3]GEN_PAD;
  wire [0:3]GEN_R;
  wire GEN_SCP;
  wire [1:3]GEN_V;
  wire [0:3]GOT_A;
  wire GOT_V;
  wire GT_REFCLK1;
  wire GT_RESET;
  wire HARD_ERR;
  wire [0:1]LANE_UP;
  wire LINK_RESET_OUT;
  wire [2:0]LOOPBACK;
  wire [0:63]M_AXI_RX_TDATA;
  wire [1:7]\^M_AXI_RX_TKEEP ;
  wire M_AXI_RX_TLAST;
  wire M_AXI_RX_TVALID;
  wire PLL_NOT_LOCKED;
  wire POWER_DOWN;
  wire RESET;
  wire RESET_1;
  wire RESET_CHANNEL;
  wire [3:0]RXCHARISCOMMA_OUT;
  wire [3:0]RXCHARISCOMMA_OUT_LANE1;
  wire [3:0]RXCHARISK_OUT;
  wire [3:0]RXCHARISK_OUT_LANE1;
  wire [31:0]RXDATA_OUT;
  wire [31:0]RXDATA_OUT_LANE1;
  wire [1:0]RXDISPERR_OUT;
  wire [1:0]RXDISPERR_OUT_LANE1;
  wire [0:1]RXN;
  wire [0:1]RXP;
  wire RXPOLARITY_IN;
  wire RXPOLARITY_IN_LANE1;
  wire RXREALIGN_OUT;
  wire RXREALIGN_OUT_LANE1;
  wire [0:1]RX_ECP;
  wire RX_RESETDONE_OUT;
  wire [0:1]RX_SCP;
  wire SOFT_ERR;
  wire START_RX;
  wire SYNC_CLK;
  wire [0:63]S_AXI_TX_TDATA;
  wire [0:7]S_AXI_TX_TKEEP;
  wire S_AXI_TX_TLAST;
  wire S_AXI_TX_TREADY;
  wire S_AXI_TX_TVALID;
  wire [3:0]TXCHARISK_IN;
  wire [3:0]TXCHARISK_IN_LANE1;
  wire [31:0]TXDATA_IN;
  wire [31:0]TXDATA_IN_LANE1;
  wire [0:1]TXN;
  wire [0:1]TXP;
  wire TX_DST_RDY_N;
  wire TX_OUT_CLK;
  wire [0:63]TX_PE_DATA;
  wire [0:3]TX_PE_DATA_V;
  wire TX_RESETDONE_OUT;
  wire TX_SOF_N;
  wire WARN_CC;
  wire [0:1]ch_bond_done_dly_i;
  wire [1:0]ch_bond_done_r1;
  wire [1:0]ch_bond_done_r2;
  wire \channel_init_sm_i/good_as_r0 ;
  wire \channel_init_sm_i/wait_for_lane_up_r0 ;
  wire \data_mgt_err_detect_4byte_i/hard_err_gt0 ;
  wire \data_mgt_err_detect_4byte_i/hard_err_gt0_0 ;
  wire [0:0]\data_mgt_sym_dec_4byte_i/previous_cycle_control_r ;
  wire [0:0]\data_mgt_sym_dec_4byte_i/previous_cycle_control_r_2 ;
  wire drpclk_in;
  wire gt0_qplllock_in;
  wire gt0_qpllrefclklost_in;
  wire gt_qpllclk_quad1_in;
  wire gt_qpllrefclk_quad1_in;
  wire [0:1]hard_err_i;
  wire init_clk_in;
  wire n_0_axi_to_ll_pdu_i;
  wire \n_0_ch_bond_load_pulse_i[0]_i_1 ;
  wire \n_0_ch_bond_load_pulse_i[1]_i_1 ;
  wire \n_0_ch_bond_load_pulse_i_reg[0] ;
  wire \n_0_ch_bond_load_pulse_i_reg[1] ;
  wire n_0_data_mgt_global_logic_i;
  wire n_100_data_mgt_aurora_lane_4byte_0_i;
  wire n_100_data_mgt_aurora_lane_4byte_1_i;
  wire n_101_data_mgt_aurora_lane_4byte_0_i;
  wire n_101_data_mgt_aurora_lane_4byte_1_i;
  wire n_102_data_mgt_aurora_lane_4byte_1_i;
  wire n_103_data_mgt_aurora_lane_4byte_1_i;
  wire n_10_data_mgt_aurora_lane_4byte_0_i;
  wire n_10_data_mgt_aurora_lane_4byte_1_i;
  wire n_10_data_mgt_global_logic_i;
  wire n_10_gt_wrapper_i;
  wire n_114_gt_wrapper_i;
  wire n_115_gt_wrapper_i;
  wire n_116_gt_wrapper_i;
  wire n_117_gt_wrapper_i;
  wire n_118_gt_wrapper_i;
  wire n_119_gt_wrapper_i;
  wire n_11_data_mgt_aurora_lane_4byte_0_i;
  wire n_11_data_mgt_aurora_lane_4byte_1_i;
  wire n_11_gt_wrapper_i;
  wire n_120_gt_wrapper_i;
  wire n_121_gt_wrapper_i;
  wire n_122_gt_wrapper_i;
  wire n_123_gt_wrapper_i;
  wire n_124_gt_wrapper_i;
  wire n_125_gt_wrapper_i;
  wire n_126_gt_wrapper_i;
  wire n_127_gt_wrapper_i;
  wire n_128_gt_wrapper_i;
  wire n_129_gt_wrapper_i;
  wire n_12_data_mgt_aurora_lane_4byte_0_i;
  wire n_12_gt_wrapper_i;
  wire n_130_gt_wrapper_i;
  wire n_133_gt_wrapper_i;
  wire n_134_gt_wrapper_i;
  wire n_135_gt_wrapper_i;
  wire n_136_gt_wrapper_i;
  wire n_139_gt_wrapper_i;
  wire n_13_data_mgt_aurora_lane_4byte_1_i;
  wire n_13_gt_wrapper_i;
  wire n_140_gt_wrapper_i;
  wire n_141_gt_wrapper_i;
  wire n_143_gt_wrapper_i;
  wire n_144_gt_wrapper_i;
  wire n_145_gt_wrapper_i;
  wire n_146_gt_wrapper_i;
  wire n_147_gt_wrapper_i;
  wire n_148_gt_wrapper_i;
  wire n_14_data_mgt_aurora_lane_4byte_1_i;
  wire n_14_gt_wrapper_i;
  wire n_15_data_mgt_global_logic_i;
  wire n_15_gt_wrapper_i;
  wire n_16_data_mgt_global_logic_i;
  wire n_16_gt_wrapper_i;
  wire n_17_data_mgt_global_logic_i;
  wire n_17_gt_wrapper_i;
  wire n_18_data_mgt_aurora_lane_4byte_1_i;
  wire n_18_data_mgt_global_logic_i;
  wire n_19_data_mgt_aurora_lane_4byte_0_i;
  wire n_19_data_mgt_aurora_lane_4byte_1_i;
  wire n_1_core_reset_logic_i;
  wire n_1_data_mgt_global_logic_i;
  wire n_1_data_mgt_rx_ll_i;
  wire n_1_data_mgt_tx_ll_i;
  wire n_20_data_mgt_aurora_lane_4byte_0_i;
  wire n_20_data_mgt_aurora_lane_4byte_1_i;
  wire n_21_data_mgt_aurora_lane_4byte_0_i;
  wire n_21_data_mgt_aurora_lane_4byte_1_i;
  wire n_22_data_mgt_aurora_lane_4byte_0_i;
  wire n_22_data_mgt_aurora_lane_4byte_1_i;
  wire n_23_data_mgt_aurora_lane_4byte_0_i;
  wire n_23_data_mgt_aurora_lane_4byte_1_i;
  wire n_23_data_mgt_global_logic_i;
  wire n_24_data_mgt_aurora_lane_4byte_0_i;
  wire n_24_data_mgt_aurora_lane_4byte_1_i;
  wire n_24_data_mgt_global_logic_i;
  wire n_25_data_mgt_aurora_lane_4byte_0_i;
  wire n_25_data_mgt_aurora_lane_4byte_1_i;
  wire n_25_data_mgt_global_logic_i;
  wire n_26_data_mgt_aurora_lane_4byte_0_i;
  wire n_26_data_mgt_aurora_lane_4byte_1_i;
  wire n_26_data_mgt_global_logic_i;
  wire n_27_data_mgt_aurora_lane_4byte_1_i;
  wire n_28_data_mgt_aurora_lane_4byte_1_i;
  wire n_29_data_mgt_aurora_lane_4byte_1_i;
  wire n_2_data_mgt_rx_ll_i;
  wire n_2_gt_wrapper_i;
  wire n_30_data_mgt_aurora_lane_4byte_1_i;
  wire n_31_data_mgt_aurora_lane_4byte_1_i;
  wire n_32_data_mgt_aurora_lane_4byte_1_i;
  wire n_33_data_mgt_aurora_lane_4byte_0_i;
  wire n_33_data_mgt_aurora_lane_4byte_1_i;
  wire n_34_data_mgt_aurora_lane_4byte_0_i;
  wire n_34_data_mgt_aurora_lane_4byte_1_i;
  wire n_35_data_mgt_aurora_lane_4byte_1_i;
  wire n_36_data_mgt_aurora_lane_4byte_1_i;
  wire n_37_data_mgt_aurora_lane_4byte_0_i;
  wire n_37_data_mgt_aurora_lane_4byte_1_i;
  wire n_4_data_mgt_tx_ll_i;
  wire n_50_gt_wrapper_i;
  wire n_51_gt_wrapper_i;
  wire n_52_gt_wrapper_i;
  wire n_53_gt_wrapper_i;
  wire n_54_gt_wrapper_i;
  wire n_55_gt_wrapper_i;
  wire n_56_gt_wrapper_i;
  wire n_57_gt_wrapper_i;
  wire n_58_gt_wrapper_i;
  wire n_59_gt_wrapper_i;
  wire n_60_gt_wrapper_i;
  wire n_61_gt_wrapper_i;
  wire n_62_gt_wrapper_i;
  wire n_63_gt_wrapper_i;
  wire n_64_gt_wrapper_i;
  wire n_65_gt_wrapper_i;
  wire n_66_gt_wrapper_i;
  wire n_6_data_mgt_aurora_lane_4byte_0_i;
  wire n_6_data_mgt_aurora_lane_4byte_1_i;
  wire n_6_data_mgt_global_logic_i;
  wire n_70_data_mgt_aurora_lane_4byte_0_i;
  wire n_70_data_mgt_aurora_lane_4byte_1_i;
  wire n_71_data_mgt_aurora_lane_4byte_0_i;
  wire n_71_data_mgt_aurora_lane_4byte_1_i;
  wire n_71_gt_wrapper_i;
  wire n_72_data_mgt_aurora_lane_4byte_0_i;
  wire n_72_data_mgt_aurora_lane_4byte_1_i;
  wire n_73_data_mgt_aurora_lane_4byte_0_i;
  wire n_73_data_mgt_aurora_lane_4byte_1_i;
  wire n_74_data_mgt_aurora_lane_4byte_0_i;
  wire n_74_data_mgt_aurora_lane_4byte_1_i;
  wire n_74_gt_wrapper_i;
  wire n_75_data_mgt_aurora_lane_4byte_0_i;
  wire n_75_data_mgt_aurora_lane_4byte_1_i;
  wire n_75_gt_wrapper_i;
  wire n_76_data_mgt_aurora_lane_4byte_0_i;
  wire n_76_data_mgt_aurora_lane_4byte_1_i;
  wire n_76_gt_wrapper_i;
  wire n_77_data_mgt_aurora_lane_4byte_0_i;
  wire n_77_data_mgt_aurora_lane_4byte_1_i;
  wire n_77_gt_wrapper_i;
  wire n_78_data_mgt_aurora_lane_4byte_0_i;
  wire n_78_data_mgt_aurora_lane_4byte_1_i;
  wire n_78_gt_wrapper_i;
  wire n_79_data_mgt_aurora_lane_4byte_0_i;
  wire n_79_data_mgt_aurora_lane_4byte_1_i;
  wire n_79_gt_wrapper_i;
  wire n_7_data_mgt_aurora_lane_4byte_0_i;
  wire n_7_data_mgt_aurora_lane_4byte_1_i;
  wire n_7_data_mgt_global_logic_i;
  wire n_7_gt_wrapper_i;
  wire n_80_data_mgt_aurora_lane_4byte_0_i;
  wire n_80_data_mgt_aurora_lane_4byte_1_i;
  wire n_80_gt_wrapper_i;
  wire n_81_data_mgt_aurora_lane_4byte_0_i;
  wire n_81_data_mgt_aurora_lane_4byte_1_i;
  wire n_81_gt_wrapper_i;
  wire n_82_data_mgt_aurora_lane_4byte_0_i;
  wire n_82_data_mgt_aurora_lane_4byte_1_i;
  wire n_83_data_mgt_aurora_lane_4byte_0_i;
  wire n_83_data_mgt_aurora_lane_4byte_1_i;
  wire n_84_data_mgt_aurora_lane_4byte_0_i;
  wire n_84_data_mgt_aurora_lane_4byte_1_i;
  wire n_85_data_mgt_aurora_lane_4byte_0_i;
  wire n_85_data_mgt_aurora_lane_4byte_1_i;
  wire n_86_data_mgt_aurora_lane_4byte_0_i;
  wire n_86_data_mgt_aurora_lane_4byte_1_i;
  wire n_87_data_mgt_aurora_lane_4byte_0_i;
  wire n_87_data_mgt_aurora_lane_4byte_1_i;
  wire n_88_data_mgt_aurora_lane_4byte_0_i;
  wire n_88_data_mgt_aurora_lane_4byte_1_i;
  wire n_89_data_mgt_aurora_lane_4byte_0_i;
  wire n_89_data_mgt_aurora_lane_4byte_1_i;
  wire n_8_data_mgt_aurora_lane_4byte_1_i;
  wire n_8_data_mgt_global_logic_i;
  wire n_90_data_mgt_aurora_lane_4byte_0_i;
  wire n_90_data_mgt_aurora_lane_4byte_1_i;
  wire n_91_data_mgt_aurora_lane_4byte_0_i;
  wire n_91_data_mgt_aurora_lane_4byte_1_i;
  wire n_92_data_mgt_aurora_lane_4byte_0_i;
  wire n_92_data_mgt_aurora_lane_4byte_1_i;
  wire n_93_data_mgt_aurora_lane_4byte_0_i;
  wire n_93_data_mgt_aurora_lane_4byte_1_i;
  wire n_94_data_mgt_aurora_lane_4byte_0_i;
  wire n_94_data_mgt_aurora_lane_4byte_1_i;
  wire n_95_data_mgt_aurora_lane_4byte_0_i;
  wire n_95_data_mgt_aurora_lane_4byte_1_i;
  wire n_96_data_mgt_aurora_lane_4byte_0_i;
  wire n_96_data_mgt_aurora_lane_4byte_1_i;
  wire n_97_data_mgt_aurora_lane_4byte_0_i;
  wire n_97_data_mgt_aurora_lane_4byte_1_i;
  wire n_98_data_mgt_aurora_lane_4byte_0_i;
  wire n_98_data_mgt_aurora_lane_4byte_1_i;
  wire n_99_data_mgt_aurora_lane_4byte_0_i;
  wire n_99_data_mgt_aurora_lane_4byte_1_i;
  wire new_pkt_r;
  wire \rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/CI ;
  wire \rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/O ;
  wire \rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/S ;
  wire \rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/S1_in ;
  wire \rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/S4_in ;
  wire \rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/S7_in ;
  wire rxfsm_data_valid_r;
  wire [0:3]soft_err_i;
  wire sys_reset_out;
  wire \tx_ll_control_i/R ;
  wire tx_lock;
  wire user_clk;

  assign M_AXI_RX_TKEEP[0] = \<const1> ;
  assign M_AXI_RX_TKEEP[1:7] = \^M_AXI_RX_TKEEP [1:7];
  assign gt0_qpllreset_out = \<const0> ;
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
data_mgtdata_mgt_AXI_TO_LL__parameterized0 axi_to_ll_pdu_i
       (.O1(n_0_axi_to_ll_pdu_i),
        .S_AXI_TX_TVALID(S_AXI_TX_TVALID),
        .TX_DST_RDY_N(TX_DST_RDY_N),
        .TX_SOF_N(TX_SOF_N),
        .new_pkt_r(new_pkt_r),
        .user_clk(user_clk));
FDRE \ch_bond_done_dly_i_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(ch_bond_done_r2[1]),
        .Q(ch_bond_done_dly_i[0]),
        .R(n_1_core_reset_logic_i));
FDRE \ch_bond_done_dly_i_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(ch_bond_done_r2[0]),
        .Q(ch_bond_done_dly_i[1]),
        .R(n_1_core_reset_logic_i));
FDRE \ch_bond_done_r1_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(CHBONDDONE_OUT),
        .Q(ch_bond_done_r1[0]),
        .R(\<const0> ));
FDRE \ch_bond_done_r1_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(CHBONDDONE_OUT_LANE1),
        .Q(ch_bond_done_r1[1]),
        .R(\<const0> ));
FDRE \ch_bond_done_r2_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(ch_bond_done_r1[0]),
        .Q(ch_bond_done_r2[0]),
        .R(\<const0> ));
FDRE \ch_bond_done_r2_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(ch_bond_done_r1[1]),
        .Q(ch_bond_done_r2[1]),
        .R(\<const0> ));
LUT2 #(
    .INIT(4'h2)) 
     \ch_bond_load_pulse_i[0]_i_1 
       (.I0(ch_bond_done_r2[1]),
        .I1(ch_bond_done_dly_i[0]),
        .O(\n_0_ch_bond_load_pulse_i[0]_i_1 ));
LUT2 #(
    .INIT(4'h2)) 
     \ch_bond_load_pulse_i[1]_i_1 
       (.I0(ch_bond_done_r2[0]),
        .I1(ch_bond_done_dly_i[1]),
        .O(\n_0_ch_bond_load_pulse_i[1]_i_1 ));
FDRE \ch_bond_load_pulse_i_reg[0] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_ch_bond_load_pulse_i[0]_i_1 ),
        .Q(\n_0_ch_bond_load_pulse_i_reg[0] ),
        .R(n_1_core_reset_logic_i));
FDRE \ch_bond_load_pulse_i_reg[1] 
       (.C(user_clk),
        .CE(\<const1> ),
        .D(\n_0_ch_bond_load_pulse_i[1]_i_1 ),
        .Q(\n_0_ch_bond_load_pulse_i_reg[1] ),
        .R(n_1_core_reset_logic_i));
data_mgtdata_mgt_RESET_LOGIC core_reset_logic_i
       (.EN_CHAN_SYNC(EN_CHAN_SYNC),
        .LINK_RESET_OUT(LINK_RESET_OUT),
        .RESET(RESET),
        .RESET_CHANNEL(RESET_CHANNEL),
        .RX_RESETDONE_OUT(RX_RESETDONE_OUT),
        .SR(n_1_core_reset_logic_i),
        .SS(\channel_init_sm_i/wait_for_lane_up_r0 ),
        .TX_RESETDONE_OUT(TX_RESETDONE_OUT),
        .init_clk_in(init_clk_in),
        .sys_reset_out(sys_reset_out),
        .user_clk(user_clk));
data_mgtdata_mgt_AURORA_LANE_4BYTE data_mgt_aurora_lane_4byte_0_i
       (.CI(\rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/CI ),
        .D(LANE_UP[0]),
        .ENMCOMMAALIGN_IN(ENMCOMMAALIGN_IN),
        .GEN_A(GEN_A),
        .GEN_CC(GEN_CC),
        .GEN_SCP(GEN_SCP),
        .GOT_V(GOT_V),
        .GT0_RXCHARISK_OUT(RXCHARISK_OUT),
        .GT0_RXDATA_OUT(RXDATA_OUT),
        .GT0_RXDISPERR_OUT(RXDISPERR_OUT),
        .GT0_TXCHARISK_IN(TXCHARISK_IN),
        .GT0_TXDATA_IN(TXDATA_IN),
        .I1(n_0_data_mgt_global_logic_i),
        .I10(RXCHARISCOMMA_OUT),
        .I11({GEN_PAD[0],GEN_PAD[2]}),
        .I12({TX_PE_DATA_V[0],TX_PE_DATA_V[2]}),
        .I13({n_11_data_mgt_aurora_lane_4byte_0_i,n_12_data_mgt_aurora_lane_4byte_0_i}),
        .I14({GEN_V[1],GEN_V[2],GEN_V[3]}),
        .I15({GEN_R[0],GEN_R[1],GEN_R[2],GEN_R[3]}),
        .I16({GEN_K[0],GEN_K[1],GEN_K[2],GEN_K[3]}),
        .I17({n_50_gt_wrapper_i,n_51_gt_wrapper_i,n_52_gt_wrapper_i,n_53_gt_wrapper_i,n_54_gt_wrapper_i,n_55_gt_wrapper_i,n_56_gt_wrapper_i,n_57_gt_wrapper_i}),
        .I18({n_10_gt_wrapper_i,n_11_gt_wrapper_i,n_12_gt_wrapper_i,n_13_gt_wrapper_i,n_14_gt_wrapper_i,n_15_gt_wrapper_i,n_16_gt_wrapper_i,n_17_gt_wrapper_i}),
        .I19({n_58_gt_wrapper_i,n_59_gt_wrapper_i,n_60_gt_wrapper_i,n_61_gt_wrapper_i,n_62_gt_wrapper_i,n_63_gt_wrapper_i,n_64_gt_wrapper_i,n_65_gt_wrapper_i}),
        .I2(n_145_gt_wrapper_i),
        .I20(n_130_gt_wrapper_i),
        .I21(n_133_gt_wrapper_i),
        .I22(n_134_gt_wrapper_i),
        .I23(n_135_gt_wrapper_i),
        .I24({TX_PE_DATA[0],TX_PE_DATA[1],TX_PE_DATA[2],TX_PE_DATA[3],TX_PE_DATA[4],TX_PE_DATA[5],TX_PE_DATA[6],TX_PE_DATA[7],TX_PE_DATA[8],TX_PE_DATA[9],TX_PE_DATA[10],TX_PE_DATA[11],TX_PE_DATA[12],TX_PE_DATA[13],TX_PE_DATA[14],TX_PE_DATA[15],TX_PE_DATA[32],TX_PE_DATA[33],TX_PE_DATA[34],TX_PE_DATA[35],TX_PE_DATA[36],TX_PE_DATA[37],TX_PE_DATA[38],TX_PE_DATA[39],TX_PE_DATA[40],TX_PE_DATA[41],TX_PE_DATA[42],TX_PE_DATA[43],TX_PE_DATA[44],TX_PE_DATA[45],TX_PE_DATA[46],TX_PE_DATA[47]}),
        .I3(n_146_gt_wrapper_i),
        .I4(n_2_gt_wrapper_i),
        .I5(n_7_gt_wrapper_i),
        .I6(n_2_data_mgt_rx_ll_i),
        .I7(n_143_gt_wrapper_i),
        .I8({n_27_data_mgt_aurora_lane_4byte_1_i,n_28_data_mgt_aurora_lane_4byte_1_i,n_29_data_mgt_aurora_lane_4byte_1_i,n_30_data_mgt_aurora_lane_4byte_1_i}),
        .I9(n_8_data_mgt_aurora_lane_4byte_1_i),
        .LINK_RESET_OUT(LINK_RESET_OUT),
        .O1(n_6_data_mgt_aurora_lane_4byte_0_i),
        .O10(n_34_data_mgt_aurora_lane_4byte_0_i),
        .O11({RX_ECP[0],RX_ECP[1]}),
        .O12(n_37_data_mgt_aurora_lane_4byte_0_i),
        .O13({n_70_data_mgt_aurora_lane_4byte_0_i,n_71_data_mgt_aurora_lane_4byte_0_i,n_72_data_mgt_aurora_lane_4byte_0_i,n_73_data_mgt_aurora_lane_4byte_0_i,n_74_data_mgt_aurora_lane_4byte_0_i,n_75_data_mgt_aurora_lane_4byte_0_i,n_76_data_mgt_aurora_lane_4byte_0_i,n_77_data_mgt_aurora_lane_4byte_0_i}),
        .O14({n_78_data_mgt_aurora_lane_4byte_0_i,n_79_data_mgt_aurora_lane_4byte_0_i,n_80_data_mgt_aurora_lane_4byte_0_i,n_81_data_mgt_aurora_lane_4byte_0_i,n_82_data_mgt_aurora_lane_4byte_0_i,n_83_data_mgt_aurora_lane_4byte_0_i,n_84_data_mgt_aurora_lane_4byte_0_i,n_85_data_mgt_aurora_lane_4byte_0_i}),
        .O15({n_86_data_mgt_aurora_lane_4byte_0_i,n_87_data_mgt_aurora_lane_4byte_0_i,n_88_data_mgt_aurora_lane_4byte_0_i,n_89_data_mgt_aurora_lane_4byte_0_i,n_90_data_mgt_aurora_lane_4byte_0_i,n_91_data_mgt_aurora_lane_4byte_0_i,n_92_data_mgt_aurora_lane_4byte_0_i,n_93_data_mgt_aurora_lane_4byte_0_i}),
        .O16({n_94_data_mgt_aurora_lane_4byte_0_i,n_95_data_mgt_aurora_lane_4byte_0_i,n_96_data_mgt_aurora_lane_4byte_0_i,n_97_data_mgt_aurora_lane_4byte_0_i,n_98_data_mgt_aurora_lane_4byte_0_i,n_99_data_mgt_aurora_lane_4byte_0_i,n_100_data_mgt_aurora_lane_4byte_0_i,n_101_data_mgt_aurora_lane_4byte_0_i}),
        .O17({soft_err_i[0],soft_err_i[1]}),
        .O2(n_7_data_mgt_aurora_lane_4byte_0_i),
        .O3(n_10_data_mgt_aurora_lane_4byte_0_i),
        .O4({RX_SCP[0],RX_SCP[1]}),
        .O5(hard_err_i[0]),
        .O6(\data_mgt_sym_dec_4byte_i/previous_cycle_control_r ),
        .O7({n_19_data_mgt_aurora_lane_4byte_0_i,n_20_data_mgt_aurora_lane_4byte_0_i,n_21_data_mgt_aurora_lane_4byte_0_i,n_22_data_mgt_aurora_lane_4byte_0_i,n_23_data_mgt_aurora_lane_4byte_0_i,n_24_data_mgt_aurora_lane_4byte_0_i,n_25_data_mgt_aurora_lane_4byte_0_i,n_26_data_mgt_aurora_lane_4byte_0_i}),
        .O8({GOT_A[0],GOT_A[1],GOT_A[2],GOT_A[3]}),
        .O9(n_33_data_mgt_aurora_lane_4byte_0_i),
        .Q({n_102_data_mgt_aurora_lane_4byte_1_i,n_103_data_mgt_aurora_lane_4byte_1_i}),
        .RXPOLARITY_IN(RXPOLARITY_IN),
        .RXREALIGN_OUT(RXREALIGN_OUT),
        .S(\rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/S ),
        .S4_in(\rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/S4_in ),
        .good_as_r0(\channel_init_sm_i/good_as_r0 ),
        .hard_err_gt0(\data_mgt_err_detect_4byte_i/hard_err_gt0_0 ),
        .init_clk_in(init_clk_in),
        .user_clk(user_clk));
data_mgtdata_mgt_AURORA_LANE_4BYTE_0 data_mgt_aurora_lane_4byte_1_i
       (.D(RXCHARISCOMMA_OUT_LANE1),
        .ENMCOMMAALIGN_IN_LANE1(ENMCOMMAALIGN_IN_LANE1),
        .GOT_V(GOT_V),
        .GT1_RXCHARISK_OUT(RXCHARISK_OUT_LANE1),
        .GT1_RXDATA_OUT(RXDATA_OUT_LANE1),
        .GT1_RXDISPERR_OUT(RXDISPERR_OUT_LANE1),
        .GT1_TXCHARISK_IN(TXCHARISK_IN_LANE1),
        .GT1_TXDATA_IN(TXDATA_IN_LANE1),
        .I1(n_1_data_mgt_global_logic_i),
        .I10(n_144_gt_wrapper_i),
        .I11(LANE_UP[0]),
        .I12({GEN_PAD[1],GEN_PAD[3]}),
        .I13({n_10_data_mgt_aurora_lane_4byte_1_i,n_11_data_mgt_aurora_lane_4byte_1_i}),
        .I14({TX_PE_DATA_V[1],TX_PE_DATA_V[3]}),
        .I15({n_6_data_mgt_global_logic_i,n_7_data_mgt_global_logic_i,n_8_data_mgt_global_logic_i}),
        .I16({n_23_data_mgt_global_logic_i,n_24_data_mgt_global_logic_i,n_25_data_mgt_global_logic_i,n_26_data_mgt_global_logic_i}),
        .I17({n_15_data_mgt_global_logic_i,n_16_data_mgt_global_logic_i,n_17_data_mgt_global_logic_i,n_18_data_mgt_global_logic_i}),
        .I18({n_114_gt_wrapper_i,n_115_gt_wrapper_i,n_116_gt_wrapper_i,n_117_gt_wrapper_i,n_118_gt_wrapper_i,n_119_gt_wrapper_i,n_120_gt_wrapper_i,n_121_gt_wrapper_i}),
        .I19({n_74_gt_wrapper_i,n_75_gt_wrapper_i,n_76_gt_wrapper_i,n_77_gt_wrapper_i,n_78_gt_wrapper_i,n_79_gt_wrapper_i,n_80_gt_wrapper_i,n_81_gt_wrapper_i}),
        .I2(n_1_data_mgt_tx_ll_i),
        .I20({n_122_gt_wrapper_i,n_123_gt_wrapper_i,n_124_gt_wrapper_i,n_125_gt_wrapper_i,n_126_gt_wrapper_i,n_127_gt_wrapper_i,n_128_gt_wrapper_i,n_129_gt_wrapper_i}),
        .I21(n_136_gt_wrapper_i),
        .I22(n_139_gt_wrapper_i),
        .I23(n_140_gt_wrapper_i),
        .I24(n_141_gt_wrapper_i),
        .I25({TX_PE_DATA[16],TX_PE_DATA[17],TX_PE_DATA[18],TX_PE_DATA[19],TX_PE_DATA[20],TX_PE_DATA[21],TX_PE_DATA[22],TX_PE_DATA[23],TX_PE_DATA[24],TX_PE_DATA[25],TX_PE_DATA[26],TX_PE_DATA[27],TX_PE_DATA[28],TX_PE_DATA[29],TX_PE_DATA[30],TX_PE_DATA[31],TX_PE_DATA[48],TX_PE_DATA[49],TX_PE_DATA[50],TX_PE_DATA[51],TX_PE_DATA[52],TX_PE_DATA[53],TX_PE_DATA[54],TX_PE_DATA[55],TX_PE_DATA[56],TX_PE_DATA[57],TX_PE_DATA[58],TX_PE_DATA[59],TX_PE_DATA[60],TX_PE_DATA[61],TX_PE_DATA[62],TX_PE_DATA[63]}),
        .I3(n_4_data_mgt_tx_ll_i),
        .I4(n_10_data_mgt_global_logic_i),
        .I5(n_147_gt_wrapper_i),
        .I6(n_148_gt_wrapper_i),
        .I7(n_66_gt_wrapper_i),
        .I8(n_71_gt_wrapper_i),
        .I9(n_1_data_mgt_rx_ll_i),
        .LANE_UP(LANE_UP[1]),
        .O(\rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/O ),
        .O1(n_6_data_mgt_aurora_lane_4byte_1_i),
        .O10(n_31_data_mgt_aurora_lane_4byte_1_i),
        .O11(n_32_data_mgt_aurora_lane_4byte_1_i),
        .O12(n_33_data_mgt_aurora_lane_4byte_1_i),
        .O13({n_34_data_mgt_aurora_lane_4byte_1_i,n_35_data_mgt_aurora_lane_4byte_1_i}),
        .O14(n_36_data_mgt_aurora_lane_4byte_1_i),
        .O15(n_37_data_mgt_aurora_lane_4byte_1_i),
        .O16({n_70_data_mgt_aurora_lane_4byte_1_i,n_71_data_mgt_aurora_lane_4byte_1_i,n_72_data_mgt_aurora_lane_4byte_1_i,n_73_data_mgt_aurora_lane_4byte_1_i,n_74_data_mgt_aurora_lane_4byte_1_i,n_75_data_mgt_aurora_lane_4byte_1_i,n_76_data_mgt_aurora_lane_4byte_1_i,n_77_data_mgt_aurora_lane_4byte_1_i}),
        .O17({n_78_data_mgt_aurora_lane_4byte_1_i,n_79_data_mgt_aurora_lane_4byte_1_i,n_80_data_mgt_aurora_lane_4byte_1_i,n_81_data_mgt_aurora_lane_4byte_1_i,n_82_data_mgt_aurora_lane_4byte_1_i,n_83_data_mgt_aurora_lane_4byte_1_i,n_84_data_mgt_aurora_lane_4byte_1_i,n_85_data_mgt_aurora_lane_4byte_1_i}),
        .O18({n_86_data_mgt_aurora_lane_4byte_1_i,n_87_data_mgt_aurora_lane_4byte_1_i,n_88_data_mgt_aurora_lane_4byte_1_i,n_89_data_mgt_aurora_lane_4byte_1_i,n_90_data_mgt_aurora_lane_4byte_1_i,n_91_data_mgt_aurora_lane_4byte_1_i,n_92_data_mgt_aurora_lane_4byte_1_i,n_93_data_mgt_aurora_lane_4byte_1_i}),
        .O19({n_94_data_mgt_aurora_lane_4byte_1_i,n_95_data_mgt_aurora_lane_4byte_1_i,n_96_data_mgt_aurora_lane_4byte_1_i,n_97_data_mgt_aurora_lane_4byte_1_i,n_98_data_mgt_aurora_lane_4byte_1_i,n_99_data_mgt_aurora_lane_4byte_1_i,n_100_data_mgt_aurora_lane_4byte_1_i,n_101_data_mgt_aurora_lane_4byte_1_i}),
        .O2(n_7_data_mgt_aurora_lane_4byte_1_i),
        .O20({n_102_data_mgt_aurora_lane_4byte_1_i,n_103_data_mgt_aurora_lane_4byte_1_i}),
        .O21({soft_err_i[2],soft_err_i[3]}),
        .O3(n_8_data_mgt_aurora_lane_4byte_1_i),
        .O4(hard_err_i[1]),
        .O5(\data_mgt_sym_dec_4byte_i/previous_cycle_control_r_2 ),
        .O6({n_18_data_mgt_aurora_lane_4byte_1_i,n_19_data_mgt_aurora_lane_4byte_1_i,n_20_data_mgt_aurora_lane_4byte_1_i,n_21_data_mgt_aurora_lane_4byte_1_i,n_22_data_mgt_aurora_lane_4byte_1_i,n_23_data_mgt_aurora_lane_4byte_1_i,n_24_data_mgt_aurora_lane_4byte_1_i,n_25_data_mgt_aurora_lane_4byte_1_i}),
        .O7(n_26_data_mgt_aurora_lane_4byte_1_i),
        .O8({GOT_A[0],GOT_A[1],GOT_A[2],GOT_A[3]}),
        .O9({n_27_data_mgt_aurora_lane_4byte_1_i,n_28_data_mgt_aurora_lane_4byte_1_i,n_29_data_mgt_aurora_lane_4byte_1_i,n_30_data_mgt_aurora_lane_4byte_1_i}),
        .Q({n_13_data_mgt_aurora_lane_4byte_1_i,n_14_data_mgt_aurora_lane_4byte_1_i}),
        .RXPOLARITY_IN_LANE1(RXPOLARITY_IN_LANE1),
        .RXREALIGN_OUT_LANE1(RXREALIGN_OUT_LANE1),
        .S1_in(\rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/S1_in ),
        .S7_in(\rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/S7_in ),
        .hard_err_gt0(\data_mgt_err_detect_4byte_i/hard_err_gt0 ),
        .init_clk_in(init_clk_in),
        .user_clk(user_clk));
data_mgtdata_mgt_GLOBAL_LOGIC data_mgt_global_logic_i
       (.D({n_6_data_mgt_global_logic_i,n_7_data_mgt_global_logic_i,n_8_data_mgt_global_logic_i}),
        .EN_CHAN_SYNC(EN_CHAN_SYNC),
        .GEN_A(GEN_A),
        .HARD_ERR(HARD_ERR),
        .I1(n_32_data_mgt_aurora_lane_4byte_1_i),
        .I14({GEN_V[1],GEN_V[2],GEN_V[3]}),
        .I15({GEN_R[0],GEN_R[1],GEN_R[2],GEN_R[3]}),
        .I16({GEN_K[0],GEN_K[1],GEN_K[2],GEN_K[3]}),
        .I2(n_26_data_mgt_aurora_lane_4byte_1_i),
        .I3(n_0_axi_to_ll_pdu_i),
        .I4({soft_err_i[0],soft_err_i[1],soft_err_i[2],soft_err_i[3]}),
        .I5({hard_err_i[0],hard_err_i[1]}),
        .I6({CHBONDDONE_OUT_LANE1,CHBONDDONE_OUT}),
        .LANE_UP(LANE_UP),
        .O1(n_0_data_mgt_global_logic_i),
        .O2(n_1_data_mgt_global_logic_i),
        .O3(n_10_data_mgt_global_logic_i),
        .O4({n_15_data_mgt_global_logic_i,n_16_data_mgt_global_logic_i,n_17_data_mgt_global_logic_i,n_18_data_mgt_global_logic_i}),
        .O5({n_23_data_mgt_global_logic_i,n_24_data_mgt_global_logic_i,n_25_data_mgt_global_logic_i,n_26_data_mgt_global_logic_i}),
        .O6(CHANNEL_UP),
        .POWER_DOWN(POWER_DOWN),
        .Q({\n_0_ch_bond_load_pulse_i_reg[0] ,\n_0_ch_bond_load_pulse_i_reg[1] }),
        .R(\tx_ll_control_i/R ),
        .RESET(RESET_1),
        .RESET_CHANNEL(RESET_CHANNEL),
        .SOFT_ERR(SOFT_ERR),
        .SS(\channel_init_sm_i/wait_for_lane_up_r0 ),
        .START_RX(START_RX),
        .S_AXI_TX_TLAST(S_AXI_TX_TLAST),
        .S_AXI_TX_TVALID(S_AXI_TX_TVALID),
        .TX_DST_RDY_N(TX_DST_RDY_N),
        .good_as_r0(\channel_init_sm_i/good_as_r0 ),
        .new_pkt_r(new_pkt_r),
        .sys_reset_out(sys_reset_out),
        .user_clk(user_clk));
data_mgtdata_mgt_RX_LL data_mgt_rx_ll_i
       (.CI(\rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/CI ),
        .D({RX_SCP[0],n_13_data_mgt_aurora_lane_4byte_1_i,RX_SCP[1],n_14_data_mgt_aurora_lane_4byte_1_i}),
        .FRAME_ERR(FRAME_ERR),
        .I1(n_37_data_mgt_aurora_lane_4byte_0_i),
        .I10({n_70_data_mgt_aurora_lane_4byte_0_i,n_71_data_mgt_aurora_lane_4byte_0_i,n_72_data_mgt_aurora_lane_4byte_0_i,n_73_data_mgt_aurora_lane_4byte_0_i,n_74_data_mgt_aurora_lane_4byte_0_i,n_75_data_mgt_aurora_lane_4byte_0_i,n_76_data_mgt_aurora_lane_4byte_0_i,n_77_data_mgt_aurora_lane_4byte_0_i}),
        .I11({n_78_data_mgt_aurora_lane_4byte_1_i,n_79_data_mgt_aurora_lane_4byte_1_i,n_80_data_mgt_aurora_lane_4byte_1_i,n_81_data_mgt_aurora_lane_4byte_1_i,n_82_data_mgt_aurora_lane_4byte_1_i,n_83_data_mgt_aurora_lane_4byte_1_i,n_84_data_mgt_aurora_lane_4byte_1_i,n_85_data_mgt_aurora_lane_4byte_1_i}),
        .I12({n_70_data_mgt_aurora_lane_4byte_1_i,n_71_data_mgt_aurora_lane_4byte_1_i,n_72_data_mgt_aurora_lane_4byte_1_i,n_73_data_mgt_aurora_lane_4byte_1_i,n_74_data_mgt_aurora_lane_4byte_1_i,n_75_data_mgt_aurora_lane_4byte_1_i,n_76_data_mgt_aurora_lane_4byte_1_i,n_77_data_mgt_aurora_lane_4byte_1_i}),
        .I13({n_11_data_mgt_aurora_lane_4byte_0_i,n_10_data_mgt_aurora_lane_4byte_1_i,n_12_data_mgt_aurora_lane_4byte_0_i,n_11_data_mgt_aurora_lane_4byte_1_i}),
        .I14({RX_ECP[0],n_34_data_mgt_aurora_lane_4byte_1_i,RX_ECP[1],n_35_data_mgt_aurora_lane_4byte_1_i}),
        .I2(n_36_data_mgt_aurora_lane_4byte_1_i),
        .I3(n_34_data_mgt_aurora_lane_4byte_0_i),
        .I4(n_33_data_mgt_aurora_lane_4byte_1_i),
        .I5(n_10_data_mgt_aurora_lane_4byte_0_i),
        .I6({n_86_data_mgt_aurora_lane_4byte_0_i,n_87_data_mgt_aurora_lane_4byte_0_i,n_88_data_mgt_aurora_lane_4byte_0_i,n_89_data_mgt_aurora_lane_4byte_0_i,n_90_data_mgt_aurora_lane_4byte_0_i,n_91_data_mgt_aurora_lane_4byte_0_i,n_92_data_mgt_aurora_lane_4byte_0_i,n_93_data_mgt_aurora_lane_4byte_0_i}),
        .I7({n_94_data_mgt_aurora_lane_4byte_1_i,n_95_data_mgt_aurora_lane_4byte_1_i,n_96_data_mgt_aurora_lane_4byte_1_i,n_97_data_mgt_aurora_lane_4byte_1_i,n_98_data_mgt_aurora_lane_4byte_1_i,n_99_data_mgt_aurora_lane_4byte_1_i,n_100_data_mgt_aurora_lane_4byte_1_i,n_101_data_mgt_aurora_lane_4byte_1_i}),
        .I8({n_86_data_mgt_aurora_lane_4byte_1_i,n_87_data_mgt_aurora_lane_4byte_1_i,n_88_data_mgt_aurora_lane_4byte_1_i,n_89_data_mgt_aurora_lane_4byte_1_i,n_90_data_mgt_aurora_lane_4byte_1_i,n_91_data_mgt_aurora_lane_4byte_1_i,n_92_data_mgt_aurora_lane_4byte_1_i,n_93_data_mgt_aurora_lane_4byte_1_i}),
        .I9({n_78_data_mgt_aurora_lane_4byte_0_i,n_79_data_mgt_aurora_lane_4byte_0_i,n_80_data_mgt_aurora_lane_4byte_0_i,n_81_data_mgt_aurora_lane_4byte_0_i,n_82_data_mgt_aurora_lane_4byte_0_i,n_83_data_mgt_aurora_lane_4byte_0_i,n_84_data_mgt_aurora_lane_4byte_0_i,n_85_data_mgt_aurora_lane_4byte_0_i}),
        .M_AXI_RX_TDATA(M_AXI_RX_TDATA),
        .M_AXI_RX_TKEEP({\^M_AXI_RX_TKEEP [1],\^M_AXI_RX_TKEEP [2],\^M_AXI_RX_TKEEP [3],\^M_AXI_RX_TKEEP [4],\^M_AXI_RX_TKEEP [5],\^M_AXI_RX_TKEEP [6],\^M_AXI_RX_TKEEP [7]}),
        .M_AXI_RX_TLAST(M_AXI_RX_TLAST),
        .M_AXI_RX_TVALID(M_AXI_RX_TVALID),
        .O(\rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/O ),
        .O1(n_1_data_mgt_rx_ll_i),
        .O2(n_2_data_mgt_rx_ll_i),
        .Q({n_94_data_mgt_aurora_lane_4byte_0_i,n_95_data_mgt_aurora_lane_4byte_0_i,n_96_data_mgt_aurora_lane_4byte_0_i,n_97_data_mgt_aurora_lane_4byte_0_i,n_98_data_mgt_aurora_lane_4byte_0_i,n_99_data_mgt_aurora_lane_4byte_0_i,n_100_data_mgt_aurora_lane_4byte_0_i,n_101_data_mgt_aurora_lane_4byte_0_i}),
        .RESET(RESET_1),
        .S(\rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/S ),
        .S1_in(\rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/S1_in ),
        .S4_in(\rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/S4_in ),
        .S7_in(\rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/S7_in ),
        .START_RX(START_RX),
        .user_clk(user_clk));
data_mgtdata_mgt_TX_LL data_mgt_tx_ll_i
       (.CHANNEL_UP(CHANNEL_UP),
        .DO_CC(DO_CC),
        .GEN_CC(GEN_CC),
        .GEN_PAD(GEN_PAD),
        .GEN_SCP(GEN_SCP),
        .I1(n_0_axi_to_ll_pdu_i),
        .O1(n_1_data_mgt_tx_ll_i),
        .O2(n_4_data_mgt_tx_ll_i),
        .Q({TX_PE_DATA[0],TX_PE_DATA[1],TX_PE_DATA[2],TX_PE_DATA[3],TX_PE_DATA[4],TX_PE_DATA[5],TX_PE_DATA[6],TX_PE_DATA[7],TX_PE_DATA[8],TX_PE_DATA[9],TX_PE_DATA[10],TX_PE_DATA[11],TX_PE_DATA[12],TX_PE_DATA[13],TX_PE_DATA[14],TX_PE_DATA[15],TX_PE_DATA[16],TX_PE_DATA[17],TX_PE_DATA[18],TX_PE_DATA[19],TX_PE_DATA[20],TX_PE_DATA[21],TX_PE_DATA[22],TX_PE_DATA[23],TX_PE_DATA[24],TX_PE_DATA[25],TX_PE_DATA[26],TX_PE_DATA[27],TX_PE_DATA[28],TX_PE_DATA[29],TX_PE_DATA[30],TX_PE_DATA[31],TX_PE_DATA[32],TX_PE_DATA[33],TX_PE_DATA[34],TX_PE_DATA[35],TX_PE_DATA[36],TX_PE_DATA[37],TX_PE_DATA[38],TX_PE_DATA[39],TX_PE_DATA[40],TX_PE_DATA[41],TX_PE_DATA[42],TX_PE_DATA[43],TX_PE_DATA[44],TX_PE_DATA[45],TX_PE_DATA[46],TX_PE_DATA[47],TX_PE_DATA[48],TX_PE_DATA[49],TX_PE_DATA[50],TX_PE_DATA[51],TX_PE_DATA[52],TX_PE_DATA[53],TX_PE_DATA[54],TX_PE_DATA[55],TX_PE_DATA[56],TX_PE_DATA[57],TX_PE_DATA[58],TX_PE_DATA[59],TX_PE_DATA[60],TX_PE_DATA[61],TX_PE_DATA[62],TX_PE_DATA[63]}),
        .R(\tx_ll_control_i/R ),
        .S_AXI_TX_TDATA(S_AXI_TX_TDATA),
        .S_AXI_TX_TKEEP(S_AXI_TX_TKEEP),
        .S_AXI_TX_TLAST(S_AXI_TX_TLAST),
        .S_AXI_TX_TREADY(S_AXI_TX_TREADY),
        .S_AXI_TX_TVALID(S_AXI_TX_TVALID),
        .TX_DST_RDY_N(TX_DST_RDY_N),
        .TX_PE_DATA_V(TX_PE_DATA_V),
        .TX_SOF_N(TX_SOF_N),
        .user_clk(user_clk));
data_mgtdata_mgt_GT_WRAPPER__parameterized0 gt_wrapper_i
       (.D({n_10_gt_wrapper_i,n_11_gt_wrapper_i,n_12_gt_wrapper_i,n_13_gt_wrapper_i,n_14_gt_wrapper_i,n_15_gt_wrapper_i,n_16_gt_wrapper_i,n_17_gt_wrapper_i}),
        .DRPADDR_IN(DRPADDR_IN),
        .DRPADDR_IN_LANE1(DRPADDR_IN_LANE1),
        .DRPDI_IN(DRPDI_IN),
        .DRPDI_IN_LANE1(DRPDI_IN_LANE1),
        .DRPDO_OUT(DRPDO_OUT),
        .DRPDO_OUT_LANE1(DRPDO_OUT_LANE1),
        .DRPEN_IN(DRPEN_IN),
        .DRPEN_IN_LANE1(DRPEN_IN_LANE1),
        .DRPRDY_OUT(DRPRDY_OUT),
        .DRPRDY_OUT_LANE1(DRPRDY_OUT_LANE1),
        .DRPWE_IN(DRPWE_IN),
        .DRPWE_IN_LANE1(DRPWE_IN_LANE1),
        .ENMCOMMAALIGN_IN(ENMCOMMAALIGN_IN),
        .ENMCOMMAALIGN_IN_LANE1(ENMCOMMAALIGN_IN_LANE1),
        .GT0_RXBYTEREALIGN_OUT(RXREALIGN_OUT),
        .GT0_RXCHARISCOMMA_OUT(RXCHARISCOMMA_OUT),
        .GT0_RXCHARISK_OUT(RXCHARISK_OUT),
        .GT0_RXCHBONDEN_IN(EN_CHAN_SYNC),
        .GT0_RXDATA_OUT(RXDATA_OUT),
        .GT0_RXDISPERR_OUT(RXDISPERR_OUT),
        .GT0_RXPOLARITY_IN(RXPOLARITY_IN),
        .GT0_TXCHARISK_IN(TXCHARISK_IN),
        .GT0_TXDATA_IN(TXDATA_IN),
        .GT1_RXBYTEREALIGN_OUT(RXREALIGN_OUT_LANE1),
        .GT1_RXCHARISCOMMA_OUT(RXCHARISCOMMA_OUT_LANE1),
        .GT1_RXCHARISK_OUT(RXCHARISK_OUT_LANE1),
        .GT1_RXDATA_OUT(RXDATA_OUT_LANE1),
        .GT1_RXDISPERR_OUT(RXDISPERR_OUT_LANE1),
        .GT1_RXPOLARITY_IN(RXPOLARITY_IN_LANE1),
        .GT1_TXCHARISK_IN(TXCHARISK_IN_LANE1),
        .GT1_TXDATA_IN(TXDATA_IN_LANE1),
        .GT_REFCLK1(GT_REFCLK1),
        .GT_RESET(GT_RESET),
        .I1(n_7_data_mgt_aurora_lane_4byte_0_i),
        .I2(n_6_data_mgt_aurora_lane_4byte_0_i),
        .I3({n_19_data_mgt_aurora_lane_4byte_0_i,n_20_data_mgt_aurora_lane_4byte_0_i,n_21_data_mgt_aurora_lane_4byte_0_i,n_22_data_mgt_aurora_lane_4byte_0_i,n_23_data_mgt_aurora_lane_4byte_0_i,n_24_data_mgt_aurora_lane_4byte_0_i,n_25_data_mgt_aurora_lane_4byte_0_i,n_26_data_mgt_aurora_lane_4byte_0_i}),
        .I4(n_7_data_mgt_aurora_lane_4byte_1_i),
        .I5(n_6_data_mgt_aurora_lane_4byte_1_i),
        .I6(\data_mgt_sym_dec_4byte_i/previous_cycle_control_r_2 ),
        .I7({n_18_data_mgt_aurora_lane_4byte_1_i,n_19_data_mgt_aurora_lane_4byte_1_i,n_20_data_mgt_aurora_lane_4byte_1_i,n_21_data_mgt_aurora_lane_4byte_1_i,n_22_data_mgt_aurora_lane_4byte_1_i,n_23_data_mgt_aurora_lane_4byte_1_i,n_24_data_mgt_aurora_lane_4byte_1_i,n_25_data_mgt_aurora_lane_4byte_1_i}),
        .I8(n_33_data_mgt_aurora_lane_4byte_0_i),
        .I9(n_31_data_mgt_aurora_lane_4byte_1_i),
        .LINK_RESET_OUT(LINK_RESET_OUT),
        .LOOPBACK(LOOPBACK),
        .O1(n_2_gt_wrapper_i),
        .O10(n_130_gt_wrapper_i),
        .O11(n_133_gt_wrapper_i),
        .O12(n_134_gt_wrapper_i),
        .O13(n_135_gt_wrapper_i),
        .O14(n_136_gt_wrapper_i),
        .O15(n_139_gt_wrapper_i),
        .O16(n_140_gt_wrapper_i),
        .O17(n_141_gt_wrapper_i),
        .O18(n_143_gt_wrapper_i),
        .O19(n_144_gt_wrapper_i),
        .O2(n_7_gt_wrapper_i),
        .O20(n_145_gt_wrapper_i),
        .O21(n_146_gt_wrapper_i),
        .O22(n_147_gt_wrapper_i),
        .O23(n_148_gt_wrapper_i),
        .O24({CHBONDDONE_OUT_LANE1,CHBONDDONE_OUT}),
        .O3({n_50_gt_wrapper_i,n_51_gt_wrapper_i,n_52_gt_wrapper_i,n_53_gt_wrapper_i,n_54_gt_wrapper_i,n_55_gt_wrapper_i,n_56_gt_wrapper_i,n_57_gt_wrapper_i}),
        .O4({n_58_gt_wrapper_i,n_59_gt_wrapper_i,n_60_gt_wrapper_i,n_61_gt_wrapper_i,n_62_gt_wrapper_i,n_63_gt_wrapper_i,n_64_gt_wrapper_i,n_65_gt_wrapper_i}),
        .O5(n_66_gt_wrapper_i),
        .O6(n_71_gt_wrapper_i),
        .O7({n_74_gt_wrapper_i,n_75_gt_wrapper_i,n_76_gt_wrapper_i,n_77_gt_wrapper_i,n_78_gt_wrapper_i,n_79_gt_wrapper_i,n_80_gt_wrapper_i,n_81_gt_wrapper_i}),
        .O8({n_114_gt_wrapper_i,n_115_gt_wrapper_i,n_116_gt_wrapper_i,n_117_gt_wrapper_i,n_118_gt_wrapper_i,n_119_gt_wrapper_i,n_120_gt_wrapper_i,n_121_gt_wrapper_i}),
        .O9({n_122_gt_wrapper_i,n_123_gt_wrapper_i,n_124_gt_wrapper_i,n_125_gt_wrapper_i,n_126_gt_wrapper_i,n_127_gt_wrapper_i,n_128_gt_wrapper_i,n_129_gt_wrapper_i}),
        .POWER_DOWN(POWER_DOWN),
        .Q(\data_mgt_sym_dec_4byte_i/previous_cycle_control_r ),
        .RXN(RXN),
        .RXP(RXP),
        .RX_RESETDONE_OUT(RX_RESETDONE_OUT),
        .SYNC_CLK(SYNC_CLK),
        .TXN(TXN),
        .TXP(TXP),
        .TX_OUT_CLK(TX_OUT_CLK),
        .TX_RESETDONE_OUT(TX_RESETDONE_OUT),
        .drpclk_in(drpclk_in),
        .gt_qpllclk_quad1_in(gt_qpllclk_quad1_in),
        .gt_qpllrefclk_quad1_in(gt_qpllrefclk_quad1_in),
        .hard_err_gt0(\data_mgt_err_detect_4byte_i/hard_err_gt0_0 ),
        .hard_err_gt0_0(\data_mgt_err_detect_4byte_i/hard_err_gt0 ),
        .init_clk_in(init_clk_in),
        .rxfsm_data_valid_r(rxfsm_data_valid_r),
        .tx_lock(tx_lock),
        .user_clk(user_clk));
FDRE rxfsm_data_valid_r_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_37_data_mgt_aurora_lane_4byte_1_i),
        .Q(rxfsm_data_valid_r),
        .R(\<const0> ));
endmodule

(* ORIG_REF_NAME = "data_mgt_gt" *) 
module data_mgtdata_mgt_gt__parameterized0
   (PLLLKDET_OUT_LANE1,
    GT1_CPLLREFCLKLOST_OUT,
    DRPRDY_OUT_LANE1,
    TXN,
    TXP,
    GT1_RXBYTEREALIGN_OUT,
    O26,
    GT1_RXRESETDONE_OUT,
    GT1_TXRESETDONE_OUT,
    DRPDO_OUT_LANE1,
    GT1_RXDATA_OUT,
    GT1_RXCHARISCOMMA_OUT,
    RXCHARISK,
    GT1_RXDISPERR_OUT,
    O5,
    O6,
    hard_err_gt0_0,
    O7,
    O8,
    O9,
    O11,
    O16,
    O17,
    O18,
    O19,
    tx_lock,
    O21,
    O24,
    O25,
    init_clk_in,
    GT1_CPLLRESET_IN,
    drpclk_in,
    DRPEN_IN_LANE1,
    DRPWE_IN_LANE1,
    GT_REFCLK1,
    SR,
    GT1_GTTXRESET_IN,
    RXN,
    RXP,
    gt_qpllclk_quad1_in,
    gt_qpllrefclk_quad1_in,
    GT0_RXDFEAGCHOLD_IN,
    ENMCOMMAALIGN_IN_LANE1,
    GT1_RXPOLARITY_IN,
    GT1_RXUSERRDY_IN,
    SYNC_CLK,
    user_clk,
    POWER_DOWN,
    GT1_TXUSERRDY_IN,
    DRPDI_IN_LANE1,
    LOOPBACK,
    RXCHBONDO,
    GT1_TXDATA_IN,
    GT1_TXCHARISK_IN,
    DRPADDR_IN_LANE1,
    I4,
    I5,
    I6,
    I7,
    GT0_CPLLREFCLKLOST_OUT,
    PLLLKDET_OUT,
    I10);
  output PLLLKDET_OUT_LANE1;
  output GT1_CPLLREFCLKLOST_OUT;
  output DRPRDY_OUT_LANE1;
  output [0:0]TXN;
  output [0:0]TXP;
  output GT1_RXBYTEREALIGN_OUT;
  output [0:0]O26;
  output GT1_RXRESETDONE_OUT;
  output GT1_TXRESETDONE_OUT;
  output [15:0]DRPDO_OUT_LANE1;
  output [31:0]GT1_RXDATA_OUT;
  output [3:0]GT1_RXCHARISCOMMA_OUT;
  output [3:0]RXCHARISK;
  output [1:0]GT1_RXDISPERR_OUT;
  output O5;
  output O6;
  output hard_err_gt0_0;
  output [7:0]O7;
  output [7:0]O8;
  output [7:0]O9;
  output O11;
  output O16;
  output O17;
  output O18;
  output O19;
  output tx_lock;
  output O21;
  output O24;
  output O25;
  input init_clk_in;
  input GT1_CPLLRESET_IN;
  input drpclk_in;
  input DRPEN_IN_LANE1;
  input DRPWE_IN_LANE1;
  input GT_REFCLK1;
  input [0:0]SR;
  input GT1_GTTXRESET_IN;
  input [0:0]RXN;
  input [0:0]RXP;
  input gt_qpllclk_quad1_in;
  input gt_qpllrefclk_quad1_in;
  input GT0_RXDFEAGCHOLD_IN;
  input ENMCOMMAALIGN_IN_LANE1;
  input GT1_RXPOLARITY_IN;
  input GT1_RXUSERRDY_IN;
  input SYNC_CLK;
  input user_clk;
  input POWER_DOWN;
  input GT1_TXUSERRDY_IN;
  input [15:0]DRPDI_IN_LANE1;
  input [2:0]LOOPBACK;
  input [4:0]RXCHBONDO;
  input [31:0]GT1_TXDATA_IN;
  input [3:0]GT1_TXCHARISK_IN;
  input [8:0]DRPADDR_IN_LANE1;
  input I4;
  input I5;
  input [0:0]I6;
  input [7:0]I7;
  input GT0_CPLLREFCLKLOST_OUT;
  input PLLLKDET_OUT;
  input I10;

  wire \<const0> ;
  wire \<const1> ;
  wire [8:0]DRPADDR_IN_LANE1;
  wire [15:0]DRPDI_IN_LANE1;
  wire [15:0]DRPDO_OUT_LANE1;
  wire DRPEN_IN_LANE1;
  wire DRPRDY_OUT_LANE1;
  wire DRPWE_IN_LANE1;
  wire ENMCOMMAALIGN_IN_LANE1;
  wire GT0_CPLLREFCLKLOST_OUT;
  wire GT0_RXDFEAGCHOLD_IN;
  wire GT1_CPLLREFCLKLOST_OUT;
  wire GT1_CPLLRESET_IN;
  wire GT1_GTTXRESET_IN;
  wire GT1_RXBYTEREALIGN_OUT;
  wire [3:0]GT1_RXCHARISCOMMA_OUT;
  wire [31:0]GT1_RXDATA_OUT;
  wire [1:0]GT1_RXDISPERR_OUT;
  wire GT1_RXPOLARITY_IN;
  wire GT1_RXRESETDONE_OUT;
  wire GT1_RXUSERRDY_IN;
  wire [3:0]GT1_TXCHARISK_IN;
  wire [31:0]GT1_TXDATA_IN;
  wire GT1_TXRESETDONE_OUT;
  wire GT1_TXUSERRDY_IN;
  wire GT_REFCLK1;
  wire I10;
  wire I4;
  wire I5;
  wire [0:0]I6;
  wire [7:0]I7;
  wire [2:0]LOOPBACK;
  wire O11;
  wire O16;
  wire O17;
  wire O18;
  wire O19;
  wire O21;
  wire O24;
  wire O25;
  wire [0:0]O26;
  wire O5;
  wire O6;
  wire [7:0]O7;
  wire [7:0]O8;
  wire [7:0]O9;
  wire PLLLKDET_OUT;
  wire PLLLKDET_OUT_LANE1;
  wire POWER_DOWN;
  wire RXBUFERR_OUT_LANE1;
  wire [3:0]RXCHARISK;
  wire [4:0]RXCHBONDO;
  wire [3:2]RXDISPERR_OUT_LANE1;
  wire [0:0]RXN;
  wire [3:0]RXNOTINTABLE_OUT_LANE1;
  wire [0:0]RXP;
  wire [0:0]SR;
  wire SYNC_CLK;
  wire TXBUFERR_OUT_LANE1;
  wire [0:0]TXN;
  wire [0:0]TXP;
  wire drpclk_in;
  wire gt_qpllclk_quad1_in;
  wire gt_qpllrefclk_quad1_in;
  wire hard_err_gt0_0;
  wire init_clk_in;
  wire n_0_gtxe2_i;
  wire n_11_gtxe2_i;
  wire n_12_gtxe2_i;
  wire n_14_gtxe2_i;
  wire n_16_gtxe2_i;
  wire n_170_gtxe2_i;
  wire n_171_gtxe2_i;
  wire n_172_gtxe2_i;
  wire n_173_gtxe2_i;
  wire n_174_gtxe2_i;
  wire n_175_gtxe2_i;
  wire n_176_gtxe2_i;
  wire n_177_gtxe2_i;
  wire n_178_gtxe2_i;
  wire n_179_gtxe2_i;
  wire n_180_gtxe2_i;
  wire n_181_gtxe2_i;
  wire n_182_gtxe2_i;
  wire n_183_gtxe2_i;
  wire n_184_gtxe2_i;
  wire n_23_gtxe2_i;
  wire n_27_gtxe2_i;
  wire n_37_gtxe2_i;
  wire n_38_gtxe2_i;
  wire n_39_gtxe2_i;
  wire n_4_gtxe2_i;
  wire n_78_gtxe2_i;
  wire n_79_gtxe2_i;
  wire n_81_gtxe2_i;
  wire n_83_gtxe2_i;
  wire n_84_gtxe2_i;
  wire n_91_gtxe2_i;
  wire n_92_gtxe2_i;
  wire n_93_gtxe2_i;
  wire n_94_gtxe2_i;
  wire n_95_gtxe2_i;
  wire n_9_gtxe2_i;
  wire tx_lock;
  wire user_clk;
  wire NLW_gtxe2_i_GTREFCLKMONITOR_UNCONNECTED;
  wire NLW_gtxe2_i_PHYSTATUS_UNCONNECTED;
  wire NLW_gtxe2_i_RXCOMINITDET_UNCONNECTED;
  wire NLW_gtxe2_i_RXCOMSASDET_UNCONNECTED;
  wire NLW_gtxe2_i_RXCOMWAKEDET_UNCONNECTED;
  wire NLW_gtxe2_i_RXDATAVALID_UNCONNECTED;
  wire NLW_gtxe2_i_RXDLYSRESETDONE_UNCONNECTED;
  wire NLW_gtxe2_i_RXELECIDLE_UNCONNECTED;
  wire NLW_gtxe2_i_RXHEADERVALID_UNCONNECTED;
  wire NLW_gtxe2_i_RXOUTCLKFABRIC_UNCONNECTED;
  wire NLW_gtxe2_i_RXOUTCLKPCS_UNCONNECTED;
  wire NLW_gtxe2_i_RXPHALIGNDONE_UNCONNECTED;
  wire NLW_gtxe2_i_RXQPISENN_UNCONNECTED;
  wire NLW_gtxe2_i_RXQPISENP_UNCONNECTED;
  wire NLW_gtxe2_i_RXRATEDONE_UNCONNECTED;
  wire NLW_gtxe2_i_RXSTARTOFSEQ_UNCONNECTED;
  wire NLW_gtxe2_i_RXVALID_UNCONNECTED;
  wire NLW_gtxe2_i_TXCOMFINISH_UNCONNECTED;
  wire NLW_gtxe2_i_TXDLYSRESETDONE_UNCONNECTED;
  wire NLW_gtxe2_i_TXGEARBOXREADY_UNCONNECTED;
  wire NLW_gtxe2_i_TXPHALIGNDONE_UNCONNECTED;
  wire NLW_gtxe2_i_TXPHINITDONE_UNCONNECTED;
  wire NLW_gtxe2_i_TXQPISENN_UNCONNECTED;
  wire NLW_gtxe2_i_TXQPISENP_UNCONNECTED;
  wire NLW_gtxe2_i_TXRATEDONE_UNCONNECTED;
  wire [15:0]NLW_gtxe2_i_PCSRSVDOUT_UNCONNECTED;
  wire [7:4]NLW_gtxe2_i_RXCHARISCOMMA_UNCONNECTED;
  wire [7:4]NLW_gtxe2_i_RXCHARISK_UNCONNECTED;
  wire [63:32]NLW_gtxe2_i_RXDATA_UNCONNECTED;
  wire [7:4]NLW_gtxe2_i_RXDISPERR_UNCONNECTED;
  wire [2:0]NLW_gtxe2_i_RXHEADER_UNCONNECTED;
  wire [7:4]NLW_gtxe2_i_RXNOTINTABLE_UNCONNECTED;
  wire [4:0]NLW_gtxe2_i_RXPHMONITOR_UNCONNECTED;
  wire [4:0]NLW_gtxe2_i_RXPHSLIPMONITOR_UNCONNECTED;
  wire [2:0]NLW_gtxe2_i_RXSTATUS_UNCONNECTED;
  wire [9:0]NLW_gtxe2_i_TSTOUT_UNCONNECTED;

LUT2 #(
    .INIT(4'h8)) 
     \FSM_onehot_tx_state[7]_i_9 
       (.I0(GT1_CPLLREFCLKLOST_OUT),
        .I1(GT0_CPLLREFCLKLOST_OUT),
        .O(O11));
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
LUT6 #(
    .INIT(64'hFFFFFAFB10114010)) 
     \data_mgt_sym_dec_4byte_i/left_align_select_r[0]_i_1__0 
       (.I0(I10),
        .I1(RXCHARISK[0]),
        .I2(RXCHARISK[2]),
        .I3(RXCHARISK[1]),
        .I4(RXCHARISK[3]),
        .I5(I5),
        .O(O24));
LUT6 #(
    .INIT(64'hFFFFBFEB10110500)) 
     \data_mgt_sym_dec_4byte_i/left_align_select_r[1]_i_1__0 
       (.I0(I10),
        .I1(RXCHARISK[0]),
        .I2(RXCHARISK[2]),
        .I3(RXCHARISK[1]),
        .I4(RXCHARISK[3]),
        .I5(I4),
        .O(O25));
LUT4 #(
    .INIT(16'h0080)) 
     \got_a_d_r[0]_i_1__0 
       (.I0(GT1_RXDATA_OUT[5]),
        .I1(GT1_RXDATA_OUT[4]),
        .I2(GT1_RXDATA_OUT[6]),
        .I3(GT1_RXDATA_OUT[7]),
        .O(O9[7]));
LUT4 #(
    .INIT(16'h0008)) 
     \got_a_d_r[1]_i_1__0 
       (.I0(GT1_RXDATA_OUT[3]),
        .I1(GT1_RXDATA_OUT[2]),
        .I2(GT1_RXDATA_OUT[1]),
        .I3(GT1_RXDATA_OUT[0]),
        .O(O9[6]));
LUT4 #(
    .INIT(16'h0080)) 
     \got_a_d_r[2]_i_1__0 
       (.I0(GT1_RXDATA_OUT[13]),
        .I1(GT1_RXDATA_OUT[12]),
        .I2(GT1_RXDATA_OUT[14]),
        .I3(GT1_RXDATA_OUT[15]),
        .O(O9[5]));
LUT4 #(
    .INIT(16'h0008)) 
     \got_a_d_r[3]_i_1__0 
       (.I0(GT1_RXDATA_OUT[11]),
        .I1(GT1_RXDATA_OUT[10]),
        .I2(GT1_RXDATA_OUT[9]),
        .I3(GT1_RXDATA_OUT[8]),
        .O(O9[4]));
LUT4 #(
    .INIT(16'h0080)) 
     \got_a_d_r[4]_i_1__0 
       (.I0(GT1_RXDATA_OUT[21]),
        .I1(GT1_RXDATA_OUT[20]),
        .I2(GT1_RXDATA_OUT[22]),
        .I3(GT1_RXDATA_OUT[23]),
        .O(O9[3]));
LUT4 #(
    .INIT(16'h0008)) 
     \got_a_d_r[5]_i_1__0 
       (.I0(GT1_RXDATA_OUT[19]),
        .I1(GT1_RXDATA_OUT[18]),
        .I2(GT1_RXDATA_OUT[17]),
        .I3(GT1_RXDATA_OUT[16]),
        .O(O9[2]));
LUT4 #(
    .INIT(16'h0080)) 
     \got_a_d_r[6]_i_1__0 
       (.I0(GT1_RXDATA_OUT[29]),
        .I1(GT1_RXDATA_OUT[28]),
        .I2(GT1_RXDATA_OUT[30]),
        .I3(GT1_RXDATA_OUT[31]),
        .O(O9[1]));
LUT4 #(
    .INIT(16'h0008)) 
     \got_a_d_r[7]_i_1__0 
       (.I0(GT1_RXDATA_OUT[27]),
        .I1(GT1_RXDATA_OUT[26]),
        .I2(GT1_RXDATA_OUT[25]),
        .I3(GT1_RXDATA_OUT[24]),
        .O(O9[0]));
(* BOX_TYPE = "PRIMITIVE" *) 
   GTXE2_CHANNEL #(
    .ALIGN_COMMA_DOUBLE("FALSE"),
    .ALIGN_COMMA_ENABLE(10'b1111111111),
    .ALIGN_COMMA_WORD(2),
    .ALIGN_MCOMMA_DET("TRUE"),
    .ALIGN_MCOMMA_VALUE(10'b1010000011),
    .ALIGN_PCOMMA_DET("TRUE"),
    .ALIGN_PCOMMA_VALUE(10'b0101111100),
    .CBCC_DATA_SOURCE_SEL("DECODED"),
    .CHAN_BOND_KEEP_ALIGN("FALSE"),
    .CHAN_BOND_MAX_SKEW(7),
    .CHAN_BOND_SEQ_1_1(10'b0101111100),
    .CHAN_BOND_SEQ_1_2(10'b0000000000),
    .CHAN_BOND_SEQ_1_3(10'b0000000000),
    .CHAN_BOND_SEQ_1_4(10'b0000000000),
    .CHAN_BOND_SEQ_1_ENABLE(4'b0001),
    .CHAN_BOND_SEQ_2_1(10'b0000000000),
    .CHAN_BOND_SEQ_2_2(10'b0000000000),
    .CHAN_BOND_SEQ_2_3(10'b0000000000),
    .CHAN_BOND_SEQ_2_4(10'b0000000000),
    .CHAN_BOND_SEQ_2_ENABLE(4'b0000),
    .CHAN_BOND_SEQ_2_USE("FALSE"),
    .CHAN_BOND_SEQ_LEN(1),
    .CLK_CORRECT_USE("TRUE"),
    .CLK_COR_KEEP_IDLE("FALSE"),
    .CLK_COR_MAX_LAT(35),
    .CLK_COR_MIN_LAT(28),
    .CLK_COR_PRECEDENCE("TRUE"),
    .CLK_COR_REPEAT_WAIT(0),
    .CLK_COR_SEQ_1_1(10'b0111110111),
    .CLK_COR_SEQ_1_2(10'b0111110111),
    .CLK_COR_SEQ_1_3(10'b0111110111),
    .CLK_COR_SEQ_1_4(10'b0111110111),
    .CLK_COR_SEQ_1_ENABLE(4'b1111),
    .CLK_COR_SEQ_2_1(10'b0100000000),
    .CLK_COR_SEQ_2_2(10'b0100000000),
    .CLK_COR_SEQ_2_3(10'b0100000000),
    .CLK_COR_SEQ_2_4(10'b0100000000),
    .CLK_COR_SEQ_2_ENABLE(4'b1111),
    .CLK_COR_SEQ_2_USE("FALSE"),
    .CLK_COR_SEQ_LEN(4),
    .CPLL_CFG(24'hBC07DC),
    .CPLL_FBDIV(4),
    .CPLL_FBDIV_45(4),
    .CPLL_INIT_CFG(24'h00001E),
    .CPLL_LOCK_CFG(16'h01E8),
    .CPLL_REFCLK_DIV(1),
    .DEC_MCOMMA_DETECT("TRUE"),
    .DEC_PCOMMA_DETECT("TRUE"),
    .DEC_VALID_COMMA_ONLY("FALSE"),
    .DMONITOR_CFG(24'h000A00),
    .ES_CONTROL(6'b000000),
    .ES_ERRDET_EN("FALSE"),
    .ES_EYE_SCAN_EN("TRUE"),
    .ES_HORZ_OFFSET(12'h000),
    .ES_PMA_CFG(10'b0000000000),
    .ES_PRESCALE(5'b00000),
    .ES_QUALIFIER(80'h00000000000000000000),
    .ES_QUAL_MASK(80'h00000000000000000000),
    .ES_SDATA_MASK(80'h00000000000000000000),
    .ES_VERT_OFFSET(9'b000000000),
    .FTS_DESKEW_SEQ_ENABLE(4'b1111),
    .FTS_LANE_DESKEW_CFG(4'b1111),
    .FTS_LANE_DESKEW_EN("FALSE"),
    .GEARBOX_MODE(3'b000),
    .IS_CPLLLOCKDETCLK_INVERTED(1'b0),
    .IS_DRPCLK_INVERTED(1'b0),
    .IS_GTGREFCLK_INVERTED(1'b0),
    .IS_RXUSRCLK2_INVERTED(1'b0),
    .IS_RXUSRCLK_INVERTED(1'b0),
    .IS_TXPHDLYTSTCLK_INVERTED(1'b0),
    .IS_TXUSRCLK2_INVERTED(1'b0),
    .IS_TXUSRCLK_INVERTED(1'b0),
    .OUTREFCLK_SEL_INV(2'b11),
    .PCS_PCIE_EN("FALSE"),
    .PCS_RSVD_ATTR(48'h000000000000),
    .PD_TRANS_TIME_FROM_P2(12'h03C),
    .PD_TRANS_TIME_NONE_P2(8'h19),
    .PD_TRANS_TIME_TO_P2(8'h64),
    .PMA_RSV(32'h00018480),
    .PMA_RSV2(16'h2050),
    .PMA_RSV3(2'b00),
    .PMA_RSV4(32'h00000000),
    .RXBUFRESET_TIME(5'b00001),
    .RXBUF_ADDR_MODE("FULL"),
    .RXBUF_EIDLE_HI_CNT(4'b1000),
    .RXBUF_EIDLE_LO_CNT(4'b0000),
    .RXBUF_EN("TRUE"),
    .RXBUF_RESET_ON_CB_CHANGE("TRUE"),
    .RXBUF_RESET_ON_COMMAALIGN("FALSE"),
    .RXBUF_RESET_ON_EIDLE("FALSE"),
    .RXBUF_RESET_ON_RATE_CHANGE("TRUE"),
    .RXBUF_THRESH_OVFLW(61),
    .RXBUF_THRESH_OVRD("FALSE"),
    .RXBUF_THRESH_UNDFLW(4),
    .RXCDRFREQRESET_TIME(5'b00001),
    .RXCDRPHRESET_TIME(5'b00001),
    .RXCDR_CFG(72'h03000023FF20400020),
    .RXCDR_FR_RESET_ON_EIDLE(1'b0),
    .RXCDR_HOLD_DURING_EIDLE(1'b0),
    .RXCDR_LOCK_CFG(6'b010101),
    .RXCDR_PH_RESET_ON_EIDLE(1'b0),
    .RXDFELPMRESET_TIME(7'b0001111),
    .RXDLY_CFG(16'h001F),
    .RXDLY_LCFG(9'h030),
    .RXDLY_TAP_CFG(16'h0000),
    .RXGEARBOX_EN("FALSE"),
    .RXISCANRESET_TIME(5'b00001),
    .RXLPM_HF_CFG(14'b00000011110000),
    .RXLPM_LF_CFG(14'b00000011110000),
    .RXOOB_CFG(7'b0000110),
    .RXOUT_DIV(1),
    .RXPCSRESET_TIME(5'b00001),
    .RXPHDLY_CFG(24'h084020),
    .RXPH_CFG(24'h000000),
    .RXPH_MONITOR_SEL(5'b00000),
    .RXPMARESET_TIME(5'b00011),
    .RXPRBS_ERR_LOOPBACK(1'b0),
    .RXSLIDE_AUTO_WAIT(7),
    .RXSLIDE_MODE("OFF"),
    .RX_BIAS_CFG(12'b000000000100),
    .RX_BUFFER_CFG(6'b000000),
    .RX_CLK25_DIV(5),
    .RX_CLKMUX_PD(1'b1),
    .RX_CM_SEL(2'b11),
    .RX_CM_TRIM(3'b010),
    .RX_DATA_WIDTH(40),
    .RX_DDI_SEL(6'b000000),
    .RX_DEBUG_CFG(12'b000000000000),
    .RX_DEFER_RESET_BUF_EN("TRUE"),
    .RX_DFE_GAIN_CFG(23'h020FEA),
    .RX_DFE_H2_CFG(12'b000000000000),
    .RX_DFE_H3_CFG(12'b000001000000),
    .RX_DFE_H4_CFG(11'b00011110000),
    .RX_DFE_H5_CFG(11'b00011100000),
    .RX_DFE_KL_CFG(13'b0000011111110),
    .RX_DFE_KL_CFG2(32'h3010D90C),
    .RX_DFE_LPM_CFG(16'h0954),
    .RX_DFE_LPM_HOLD_DURING_EIDLE(1'b0),
    .RX_DFE_UT_CFG(17'b10001111000000000),
    .RX_DFE_VP_CFG(17'b00011111100000011),
    .RX_DFE_XYD_CFG(13'b0000000000000),
    .RX_DISPERR_SEQ_MATCH("TRUE"),
    .RX_INT_DATAWIDTH(1),
    .RX_OS_CFG(13'b0000010000000),
    .RX_SIG_VALID_DLY(10),
    .RX_XCLK_SEL("RXREC"),
    .SAS_MAX_COM(64),
    .SAS_MIN_COM(36),
    .SATA_BURST_SEQ_LEN(4'b1111),
    .SATA_BURST_VAL(3'b100),
    .SATA_CPLL_CFG("VCO_3000MHZ"),
    .SATA_EIDLE_VAL(3'b100),
    .SATA_MAX_BURST(8),
    .SATA_MAX_INIT(21),
    .SATA_MAX_WAKE(7),
    .SATA_MIN_BURST(4),
    .SATA_MIN_INIT(12),
    .SATA_MIN_WAKE(4),
    .SHOW_REALIGN_COMMA("TRUE"),
    .SIM_CPLLREFCLK_SEL(3'b001),
    .SIM_RECEIVER_DETECT_PASS("TRUE"),
    .SIM_RESET_SPEEDUP("FALSE"),
    .SIM_TX_EIDLE_DRIVE_LEVEL("X"),
    .SIM_VERSION("4.0"),
    .TERM_RCAL_CFG(5'b10000),
    .TERM_RCAL_OVRD(1'b0),
    .TRANS_TIME_RATE(8'h0E),
    .TST_RSV(32'h00000000),
    .TXBUF_EN("TRUE"),
    .TXBUF_RESET_ON_RATE_CHANGE("TRUE"),
    .TXDLY_CFG(16'h001F),
    .TXDLY_LCFG(9'h030),
    .TXDLY_TAP_CFG(16'h0000),
    .TXGEARBOX_EN("FALSE"),
    .TXOUT_DIV(1),
    .TXPCSRESET_TIME(5'b00001),
    .TXPHDLY_CFG(24'h084020),
    .TXPH_CFG(16'h0780),
    .TXPH_MONITOR_SEL(5'b00000),
    .TXPMARESET_TIME(5'b00001),
    .TX_CLK25_DIV(5),
    .TX_CLKMUX_PD(1'b1),
    .TX_DATA_WIDTH(40),
    .TX_DEEMPH0(5'b00000),
    .TX_DEEMPH1(5'b00000),
    .TX_DRIVE_MODE("DIRECT"),
    .TX_EIDLE_ASSERT_DELAY(3'b110),
    .TX_EIDLE_DEASSERT_DELAY(3'b100),
    .TX_INT_DATAWIDTH(1),
    .TX_LOOPBACK_DRIVE_HIZ("FALSE"),
    .TX_MAINCURSOR_SEL(1'b0),
    .TX_MARGIN_FULL_0(7'b1001110),
    .TX_MARGIN_FULL_1(7'b1001001),
    .TX_MARGIN_FULL_2(7'b1000101),
    .TX_MARGIN_FULL_3(7'b1000010),
    .TX_MARGIN_FULL_4(7'b1000000),
    .TX_MARGIN_LOW_0(7'b1000110),
    .TX_MARGIN_LOW_1(7'b1000100),
    .TX_MARGIN_LOW_2(7'b1000010),
    .TX_MARGIN_LOW_3(7'b1000000),
    .TX_MARGIN_LOW_4(7'b1000000),
    .TX_PREDRIVER_MODE(1'b0),
    .TX_QPI_STATUS_EN(1'b0),
    .TX_RXDETECT_CFG(14'h1832),
    .TX_RXDETECT_REF(3'b100),
    .TX_XCLK_SEL("TXOUT"),
    .UCODEER_CLR(1'b0)) 
     gtxe2_i
       (.CFGRESET(\<const0> ),
        .CLKRSVD({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .CPLLFBCLKLOST(n_0_gtxe2_i),
        .CPLLLOCK(PLLLKDET_OUT_LANE1),
        .CPLLLOCKDETCLK(init_clk_in),
        .CPLLLOCKEN(\<const1> ),
        .CPLLPD(\<const0> ),
        .CPLLREFCLKLOST(GT1_CPLLREFCLKLOST_OUT),
        .CPLLREFCLKSEL({\<const0> ,\<const0> ,\<const1> }),
        .CPLLRESET(GT1_CPLLRESET_IN),
        .DMONITOROUT({n_177_gtxe2_i,n_178_gtxe2_i,n_179_gtxe2_i,n_180_gtxe2_i,n_181_gtxe2_i,n_182_gtxe2_i,n_183_gtxe2_i,n_184_gtxe2_i}),
        .DRPADDR(DRPADDR_IN_LANE1),
        .DRPCLK(drpclk_in),
        .DRPDI(DRPDI_IN_LANE1),
        .DRPDO(DRPDO_OUT_LANE1),
        .DRPEN(DRPEN_IN_LANE1),
        .DRPRDY(DRPRDY_OUT_LANE1),
        .DRPWE(DRPWE_IN_LANE1),
        .EYESCANDATAERROR(n_4_gtxe2_i),
        .EYESCANMODE(\<const0> ),
        .EYESCANRESET(\<const0> ),
        .EYESCANTRIGGER(\<const0> ),
        .GTGREFCLK(\<const0> ),
        .GTNORTHREFCLK0(\<const0> ),
        .GTNORTHREFCLK1(\<const0> ),
        .GTREFCLK0(GT_REFCLK1),
        .GTREFCLK1(\<const0> ),
        .GTREFCLKMONITOR(NLW_gtxe2_i_GTREFCLKMONITOR_UNCONNECTED),
        .GTRESETSEL(\<const0> ),
        .GTRSVD({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .GTRXRESET(SR),
        .GTSOUTHREFCLK0(\<const0> ),
        .GTSOUTHREFCLK1(\<const0> ),
        .GTTXRESET(GT1_GTTXRESET_IN),
        .GTXRXN(RXN),
        .GTXRXP(RXP),
        .GTXTXN(TXN),
        .GTXTXP(TXP),
        .LOOPBACK(LOOPBACK),
        .PCSRSVDIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .PCSRSVDIN2({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .PCSRSVDOUT(NLW_gtxe2_i_PCSRSVDOUT_UNCONNECTED[15:0]),
        .PHYSTATUS(NLW_gtxe2_i_PHYSTATUS_UNCONNECTED),
        .PMARSVDIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .PMARSVDIN2({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .QPLLCLK(gt_qpllclk_quad1_in),
        .QPLLREFCLK(gt_qpllrefclk_quad1_in),
        .RESETOVRD(\<const0> ),
        .RX8B10BEN(\<const1> ),
        .RXBUFRESET(\<const0> ),
        .RXBUFSTATUS({RXBUFERR_OUT_LANE1,n_83_gtxe2_i,n_84_gtxe2_i}),
        .RXBYTEISALIGNED(n_9_gtxe2_i),
        .RXBYTEREALIGN(GT1_RXBYTEREALIGN_OUT),
        .RXCDRFREQRESET(\<const0> ),
        .RXCDRHOLD(\<const0> ),
        .RXCDRLOCK(n_11_gtxe2_i),
        .RXCDROVRDEN(\<const0> ),
        .RXCDRRESET(\<const0> ),
        .RXCDRRESETRSV(\<const0> ),
        .RXCHANBONDSEQ(n_12_gtxe2_i),
        .RXCHANISALIGNED(O26),
        .RXCHANREALIGN(n_14_gtxe2_i),
        .RXCHARISCOMMA({NLW_gtxe2_i_RXCHARISCOMMA_UNCONNECTED[7:4],GT1_RXCHARISCOMMA_OUT}),
        .RXCHARISK({NLW_gtxe2_i_RXCHARISK_UNCONNECTED[7:4],RXCHARISK}),
        .RXCHBONDEN(\<const1> ),
        .RXCHBONDI(RXCHBONDO),
        .RXCHBONDLEVEL({\<const0> ,\<const0> ,\<const0> }),
        .RXCHBONDMASTER(\<const0> ),
        .RXCHBONDO({n_91_gtxe2_i,n_92_gtxe2_i,n_93_gtxe2_i,n_94_gtxe2_i,n_95_gtxe2_i}),
        .RXCHBONDSLAVE(\<const1> ),
        .RXCLKCORCNT({n_78_gtxe2_i,n_79_gtxe2_i}),
        .RXCOMINITDET(NLW_gtxe2_i_RXCOMINITDET_UNCONNECTED),
        .RXCOMMADET(n_16_gtxe2_i),
        .RXCOMMADETEN(\<const1> ),
        .RXCOMSASDET(NLW_gtxe2_i_RXCOMSASDET_UNCONNECTED),
        .RXCOMWAKEDET(NLW_gtxe2_i_RXCOMWAKEDET_UNCONNECTED),
        .RXDATA({NLW_gtxe2_i_RXDATA_UNCONNECTED[63:32],GT1_RXDATA_OUT}),
        .RXDATAVALID(NLW_gtxe2_i_RXDATAVALID_UNCONNECTED),
        .RXDDIEN(\<const0> ),
        .RXDFEAGCHOLD(GT0_RXDFEAGCHOLD_IN),
        .RXDFEAGCOVRDEN(\<const0> ),
        .RXDFECM1EN(\<const0> ),
        .RXDFELFHOLD(GT0_RXDFEAGCHOLD_IN),
        .RXDFELFOVRDEN(\<const1> ),
        .RXDFELPMRESET(\<const0> ),
        .RXDFETAP2HOLD(\<const0> ),
        .RXDFETAP2OVRDEN(\<const0> ),
        .RXDFETAP3HOLD(\<const0> ),
        .RXDFETAP3OVRDEN(\<const0> ),
        .RXDFETAP4HOLD(\<const0> ),
        .RXDFETAP4OVRDEN(\<const0> ),
        .RXDFETAP5HOLD(\<const0> ),
        .RXDFETAP5OVRDEN(\<const0> ),
        .RXDFEUTHOLD(\<const0> ),
        .RXDFEUTOVRDEN(\<const0> ),
        .RXDFEVPHOLD(\<const0> ),
        .RXDFEVPOVRDEN(\<const0> ),
        .RXDFEVSEN(\<const0> ),
        .RXDFEXYDEN(\<const1> ),
        .RXDFEXYDHOLD(\<const0> ),
        .RXDFEXYDOVRDEN(\<const0> ),
        .RXDISPERR({NLW_gtxe2_i_RXDISPERR_UNCONNECTED[7:4],RXDISPERR_OUT_LANE1,GT1_RXDISPERR_OUT}),
        .RXDLYBYPASS(\<const1> ),
        .RXDLYEN(\<const0> ),
        .RXDLYOVRDEN(\<const0> ),
        .RXDLYSRESET(\<const0> ),
        .RXDLYSRESETDONE(NLW_gtxe2_i_RXDLYSRESETDONE_UNCONNECTED),
        .RXELECIDLE(NLW_gtxe2_i_RXELECIDLE_UNCONNECTED),
        .RXELECIDLEMODE({\<const1> ,\<const1> }),
        .RXGEARBOXSLIP(\<const0> ),
        .RXHEADER(NLW_gtxe2_i_RXHEADER_UNCONNECTED[2:0]),
        .RXHEADERVALID(NLW_gtxe2_i_RXHEADERVALID_UNCONNECTED),
        .RXLPMEN(\<const0> ),
        .RXLPMHFHOLD(\<const0> ),
        .RXLPMHFOVRDEN(\<const0> ),
        .RXLPMLFHOLD(\<const0> ),
        .RXLPMLFKLOVRDEN(\<const0> ),
        .RXMCOMMAALIGNEN(ENMCOMMAALIGN_IN_LANE1),
        .RXMONITOROUT({n_170_gtxe2_i,n_171_gtxe2_i,n_172_gtxe2_i,n_173_gtxe2_i,n_174_gtxe2_i,n_175_gtxe2_i,n_176_gtxe2_i}),
        .RXMONITORSEL({\<const0> ,\<const0> }),
        .RXNOTINTABLE({NLW_gtxe2_i_RXNOTINTABLE_UNCONNECTED[7:4],RXNOTINTABLE_OUT_LANE1}),
        .RXOOBRESET(\<const0> ),
        .RXOSHOLD(\<const0> ),
        .RXOSOVRDEN(\<const0> ),
        .RXOUTCLK(n_23_gtxe2_i),
        .RXOUTCLKFABRIC(NLW_gtxe2_i_RXOUTCLKFABRIC_UNCONNECTED),
        .RXOUTCLKPCS(NLW_gtxe2_i_RXOUTCLKPCS_UNCONNECTED),
        .RXOUTCLKSEL({\<const0> ,\<const1> ,\<const0> }),
        .RXPCOMMAALIGNEN(ENMCOMMAALIGN_IN_LANE1),
        .RXPCSRESET(\<const0> ),
        .RXPD({POWER_DOWN,POWER_DOWN}),
        .RXPHALIGN(\<const0> ),
        .RXPHALIGNDONE(NLW_gtxe2_i_RXPHALIGNDONE_UNCONNECTED),
        .RXPHALIGNEN(\<const0> ),
        .RXPHDLYPD(\<const0> ),
        .RXPHDLYRESET(\<const0> ),
        .RXPHMONITOR(NLW_gtxe2_i_RXPHMONITOR_UNCONNECTED[4:0]),
        .RXPHOVRDEN(\<const0> ),
        .RXPHSLIPMONITOR(NLW_gtxe2_i_RXPHSLIPMONITOR_UNCONNECTED[4:0]),
        .RXPMARESET(\<const0> ),
        .RXPOLARITY(GT1_RXPOLARITY_IN),
        .RXPRBSCNTRESET(\<const0> ),
        .RXPRBSERR(n_27_gtxe2_i),
        .RXPRBSSEL({\<const0> ,\<const0> ,\<const0> }),
        .RXQPIEN(\<const0> ),
        .RXQPISENN(NLW_gtxe2_i_RXQPISENN_UNCONNECTED),
        .RXQPISENP(NLW_gtxe2_i_RXQPISENP_UNCONNECTED),
        .RXRATE({\<const0> ,\<const0> ,\<const0> }),
        .RXRATEDONE(NLW_gtxe2_i_RXRATEDONE_UNCONNECTED),
        .RXRESETDONE(GT1_RXRESETDONE_OUT),
        .RXSLIDE(\<const0> ),
        .RXSTARTOFSEQ(NLW_gtxe2_i_RXSTARTOFSEQ_UNCONNECTED),
        .RXSTATUS(NLW_gtxe2_i_RXSTATUS_UNCONNECTED[2:0]),
        .RXSYSCLKSEL({\<const0> ,\<const0> }),
        .RXUSERRDY(GT1_RXUSERRDY_IN),
        .RXUSRCLK(SYNC_CLK),
        .RXUSRCLK2(user_clk),
        .RXVALID(NLW_gtxe2_i_RXVALID_UNCONNECTED),
        .SETERRSTATUS(\<const0> ),
        .TSTIN({\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .TSTOUT(NLW_gtxe2_i_TSTOUT_UNCONNECTED[9:0]),
        .TX8B10BBYPASS({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .TX8B10BEN(\<const1> ),
        .TXBUFDIFFCTRL({\<const1> ,\<const0> ,\<const0> }),
        .TXBUFSTATUS({TXBUFERR_OUT_LANE1,n_81_gtxe2_i}),
        .TXCHARDISPMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .TXCHARDISPVAL({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .TXCHARISK({\<const0> ,\<const0> ,\<const0> ,\<const0> ,GT1_TXCHARISK_IN}),
        .TXCOMFINISH(NLW_gtxe2_i_TXCOMFINISH_UNCONNECTED),
        .TXCOMINIT(\<const0> ),
        .TXCOMSAS(\<const0> ),
        .TXCOMWAKE(\<const0> ),
        .TXDATA({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,GT1_TXDATA_IN}),
        .TXDEEMPH(\<const0> ),
        .TXDETECTRX(\<const0> ),
        .TXDIFFCTRL({\<const1> ,\<const0> ,\<const0> ,\<const0> }),
        .TXDIFFPD(\<const0> ),
        .TXDLYBYPASS(\<const1> ),
        .TXDLYEN(\<const0> ),
        .TXDLYHOLD(\<const0> ),
        .TXDLYOVRDEN(\<const0> ),
        .TXDLYSRESET(\<const0> ),
        .TXDLYSRESETDONE(NLW_gtxe2_i_TXDLYSRESETDONE_UNCONNECTED),
        .TXDLYUPDOWN(\<const0> ),
        .TXELECIDLE(POWER_DOWN),
        .TXGEARBOXREADY(NLW_gtxe2_i_TXGEARBOXREADY_UNCONNECTED),
        .TXHEADER({\<const0> ,\<const0> ,\<const0> }),
        .TXINHIBIT(\<const0> ),
        .TXMAINCURSOR({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .TXMARGIN({\<const0> ,\<const0> ,\<const0> }),
        .TXOUTCLK(n_37_gtxe2_i),
        .TXOUTCLKFABRIC(n_38_gtxe2_i),
        .TXOUTCLKPCS(n_39_gtxe2_i),
        .TXOUTCLKSEL({\<const0> ,\<const1> ,\<const0> }),
        .TXPCSRESET(\<const0> ),
        .TXPD({POWER_DOWN,POWER_DOWN}),
        .TXPDELECIDLEMODE(\<const0> ),
        .TXPHALIGN(\<const0> ),
        .TXPHALIGNDONE(NLW_gtxe2_i_TXPHALIGNDONE_UNCONNECTED),
        .TXPHALIGNEN(\<const0> ),
        .TXPHDLYPD(\<const0> ),
        .TXPHDLYRESET(\<const0> ),
        .TXPHDLYTSTCLK(\<const0> ),
        .TXPHINIT(\<const0> ),
        .TXPHINITDONE(NLW_gtxe2_i_TXPHINITDONE_UNCONNECTED),
        .TXPHOVRDEN(\<const0> ),
        .TXPISOPD(\<const0> ),
        .TXPMARESET(\<const0> ),
        .TXPOLARITY(\<const0> ),
        .TXPOSTCURSOR({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .TXPOSTCURSORINV(\<const0> ),
        .TXPRBSFORCEERR(\<const0> ),
        .TXPRBSSEL({\<const0> ,\<const0> ,\<const0> }),
        .TXPRECURSOR({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .TXPRECURSORINV(\<const0> ),
        .TXQPIBIASEN(\<const0> ),
        .TXQPISENN(NLW_gtxe2_i_TXQPISENN_UNCONNECTED),
        .TXQPISENP(NLW_gtxe2_i_TXQPISENP_UNCONNECTED),
        .TXQPISTRONGPDOWN(\<const0> ),
        .TXQPIWEAKPUP(\<const0> ),
        .TXRATE({\<const0> ,\<const0> ,\<const0> }),
        .TXRATEDONE(NLW_gtxe2_i_TXRATEDONE_UNCONNECTED),
        .TXRESETDONE(GT1_TXRESETDONE_OUT),
        .TXSEQUENCE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .TXSTARTSEQ(\<const0> ),
        .TXSWING(\<const0> ),
        .TXSYSCLKSEL({\<const0> ,\<const0> }),
        .TXUSERRDY(GT1_TXUSERRDY_IN),
        .TXUSRCLK(SYNC_CLK),
        .TXUSRCLK2(user_clk));
LUT3 #(
    .INIT(8'hFE)) 
     hard_err_gt_i_1__0
       (.I0(RXBUFERR_OUT_LANE1),
        .I1(TXBUFERR_OUT_LANE1),
        .I2(GT1_RXBYTEREALIGN_OUT),
        .O(hard_err_gt0_0));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
     reset_count_r_i_2__0
       (.I0(RXDISPERR_OUT_LANE1[2]),
        .I1(RXNOTINTABLE_OUT_LANE1[3]),
        .I2(RXNOTINTABLE_OUT_LANE1[1]),
        .I3(RXNOTINTABLE_OUT_LANE1[2]),
        .I4(RXDISPERR_OUT_LANE1[3]),
        .I5(RXNOTINTABLE_OUT_LANE1[0]),
        .O(O21));
LUT2 #(
    .INIT(4'hE)) 
     \soft_err_r[0]_i_2__0 
       (.I0(GT1_RXDISPERR_OUT[0]),
        .I1(RXNOTINTABLE_OUT_LANE1[0]),
        .O(O16));
LUT2 #(
    .INIT(4'hE)) 
     \soft_err_r[1]_i_1__0 
       (.I0(GT1_RXDISPERR_OUT[1]),
        .I1(RXNOTINTABLE_OUT_LANE1[1]),
        .O(O17));
LUT2 #(
    .INIT(4'hE)) 
     \soft_err_r[2]_i_1__0 
       (.I0(RXDISPERR_OUT_LANE1[2]),
        .I1(RXNOTINTABLE_OUT_LANE1[2]),
        .O(O18));
LUT2 #(
    .INIT(4'hE)) 
     \soft_err_r[3]_i_1__0 
       (.I0(RXNOTINTABLE_OUT_LANE1[3]),
        .I1(RXDISPERR_OUT_LANE1[3]),
        .O(O19));
LUT2 #(
    .INIT(4'h8)) 
     tx_lock_INST_0
       (.I0(PLLLKDET_OUT_LANE1),
        .I1(PLLLKDET_OUT),
        .O(tx_lock));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_control_bits_r[2]_i_1__0 
       (.I0(RXCHARISK[1]),
        .I1(I6),
        .I2(I4),
        .I3(RXCHARISK[0]),
        .I4(I5),
        .I5(RXCHARISK[2]),
        .O(O6));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_control_bits_r[3]_i_1__0 
       (.I0(RXCHARISK[2]),
        .I1(RXCHARISK[0]),
        .I2(I4),
        .I3(RXCHARISK[1]),
        .I4(I5),
        .I5(RXCHARISK[3]),
        .O(O5));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[16]_i_1__0 
       (.I0(GT1_RXDATA_OUT[15]),
        .I1(GT1_RXDATA_OUT[7]),
        .I2(I5),
        .I3(I7[7]),
        .I4(I4),
        .I5(GT1_RXDATA_OUT[23]),
        .O(O7[7]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[17]_i_1__0 
       (.I0(GT1_RXDATA_OUT[14]),
        .I1(GT1_RXDATA_OUT[6]),
        .I2(I5),
        .I3(I7[6]),
        .I4(I4),
        .I5(GT1_RXDATA_OUT[22]),
        .O(O7[6]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[18]_i_1__0 
       (.I0(GT1_RXDATA_OUT[13]),
        .I1(GT1_RXDATA_OUT[5]),
        .I2(I5),
        .I3(I7[5]),
        .I4(I4),
        .I5(GT1_RXDATA_OUT[21]),
        .O(O7[5]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[19]_i_1__0 
       (.I0(GT1_RXDATA_OUT[12]),
        .I1(GT1_RXDATA_OUT[4]),
        .I2(I5),
        .I3(I7[4]),
        .I4(I4),
        .I5(GT1_RXDATA_OUT[20]),
        .O(O7[4]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[20]_i_1__0 
       (.I0(GT1_RXDATA_OUT[11]),
        .I1(GT1_RXDATA_OUT[3]),
        .I2(I5),
        .I3(I7[3]),
        .I4(I4),
        .I5(GT1_RXDATA_OUT[19]),
        .O(O7[3]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[21]_i_1__0 
       (.I0(GT1_RXDATA_OUT[10]),
        .I1(GT1_RXDATA_OUT[2]),
        .I2(I5),
        .I3(I7[2]),
        .I4(I4),
        .I5(GT1_RXDATA_OUT[18]),
        .O(O7[2]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[22]_i_1__0 
       (.I0(GT1_RXDATA_OUT[9]),
        .I1(GT1_RXDATA_OUT[1]),
        .I2(I5),
        .I3(I7[1]),
        .I4(I4),
        .I5(GT1_RXDATA_OUT[17]),
        .O(O7[1]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[23]_i_1__0 
       (.I0(GT1_RXDATA_OUT[8]),
        .I1(GT1_RXDATA_OUT[0]),
        .I2(I5),
        .I3(I7[0]),
        .I4(I4),
        .I5(GT1_RXDATA_OUT[16]),
        .O(O7[0]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[24]_i_1__0 
       (.I0(GT1_RXDATA_OUT[23]),
        .I1(GT1_RXDATA_OUT[15]),
        .I2(I5),
        .I3(GT1_RXDATA_OUT[7]),
        .I4(I4),
        .I5(GT1_RXDATA_OUT[31]),
        .O(O8[7]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[25]_i_1__0 
       (.I0(GT1_RXDATA_OUT[22]),
        .I1(GT1_RXDATA_OUT[14]),
        .I2(I5),
        .I3(GT1_RXDATA_OUT[6]),
        .I4(I4),
        .I5(GT1_RXDATA_OUT[30]),
        .O(O8[6]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[26]_i_1__0 
       (.I0(GT1_RXDATA_OUT[21]),
        .I1(GT1_RXDATA_OUT[13]),
        .I2(I5),
        .I3(GT1_RXDATA_OUT[5]),
        .I4(I4),
        .I5(GT1_RXDATA_OUT[29]),
        .O(O8[5]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[27]_i_1__0 
       (.I0(GT1_RXDATA_OUT[20]),
        .I1(GT1_RXDATA_OUT[12]),
        .I2(I5),
        .I3(GT1_RXDATA_OUT[4]),
        .I4(I4),
        .I5(GT1_RXDATA_OUT[28]),
        .O(O8[4]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[28]_i_1__0 
       (.I0(GT1_RXDATA_OUT[19]),
        .I1(GT1_RXDATA_OUT[11]),
        .I2(I5),
        .I3(GT1_RXDATA_OUT[3]),
        .I4(I4),
        .I5(GT1_RXDATA_OUT[27]),
        .O(O8[3]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[29]_i_1__0 
       (.I0(GT1_RXDATA_OUT[18]),
        .I1(GT1_RXDATA_OUT[10]),
        .I2(I5),
        .I3(GT1_RXDATA_OUT[2]),
        .I4(I4),
        .I5(GT1_RXDATA_OUT[26]),
        .O(O8[2]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[30]_i_1__0 
       (.I0(GT1_RXDATA_OUT[17]),
        .I1(GT1_RXDATA_OUT[9]),
        .I2(I5),
        .I3(GT1_RXDATA_OUT[1]),
        .I4(I4),
        .I5(GT1_RXDATA_OUT[25]),
        .O(O8[1]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[31]_i_1__0 
       (.I0(GT1_RXDATA_OUT[16]),
        .I1(GT1_RXDATA_OUT[8]),
        .I2(I5),
        .I3(GT1_RXDATA_OUT[0]),
        .I4(I4),
        .I5(GT1_RXDATA_OUT[24]),
        .O(O8[0]));
endmodule

(* ORIG_REF_NAME = "data_mgt_gt" *) 
module data_mgtdata_mgt_gt__parameterized0_14
   (PLLLKDET_OUT,
    GT0_CPLLREFCLKLOST_OUT,
    DRPRDY_OUT,
    TXN,
    TXP,
    GT0_RXBYTEREALIGN_OUT,
    O26,
    GT0_RXRESETDONE_OUT,
    TX_OUT_CLK,
    GT0_TXRESETDONE_OUT,
    DRPDO_OUT,
    RXCHBONDO,
    GT0_RXDATA_OUT,
    GT0_RXCHARISCOMMA_OUT,
    RXCHARISK,
    GT0_RXDISPERR_OUT,
    O1,
    O2,
    hard_err_gt0,
    D,
    O3,
    O4,
    O10,
    CPLLLOCK,
    O12,
    O13,
    O14,
    O15,
    O20,
    O22,
    O23,
    init_clk_in,
    GT1_CPLLRESET_IN,
    drpclk_in,
    DRPEN_IN,
    DRPWE_IN,
    GT_REFCLK1,
    SR,
    GT1_GTTXRESET_IN,
    RXN,
    RXP,
    gt_qpllclk_quad1_in,
    gt_qpllrefclk_quad1_in,
    GT0_RXCHBONDEN_IN,
    GT0_RXDFEAGCHOLD_IN,
    ENMCOMMAALIGN_IN,
    GT0_RXPOLARITY_IN,
    GT1_RXUSERRDY_IN,
    SYNC_CLK,
    user_clk,
    POWER_DOWN,
    GT1_TXUSERRDY_IN,
    DRPDI_IN,
    LOOPBACK,
    GT0_TXDATA_IN,
    GT0_TXCHARISK_IN,
    DRPADDR_IN,
    I1,
    I2,
    Q,
    I3,
    GT1_CPLLREFCLKLOST_OUT,
    adapt_count_reset,
    rx_cdrlocked,
    I8,
    PLLLKDET_OUT_LANE1,
    I9);
  output PLLLKDET_OUT;
  output GT0_CPLLREFCLKLOST_OUT;
  output DRPRDY_OUT;
  output [0:0]TXN;
  output [0:0]TXP;
  output GT0_RXBYTEREALIGN_OUT;
  output [0:0]O26;
  output GT0_RXRESETDONE_OUT;
  output TX_OUT_CLK;
  output GT0_TXRESETDONE_OUT;
  output [15:0]DRPDO_OUT;
  output [4:0]RXCHBONDO;
  output [31:0]GT0_RXDATA_OUT;
  output [3:0]GT0_RXCHARISCOMMA_OUT;
  output [3:0]RXCHARISK;
  output [1:0]GT0_RXDISPERR_OUT;
  output O1;
  output O2;
  output hard_err_gt0;
  output [7:0]D;
  output [7:0]O3;
  output [7:0]O4;
  output O10;
  output CPLLLOCK;
  output O12;
  output O13;
  output O14;
  output O15;
  output O20;
  output O22;
  output O23;
  input init_clk_in;
  input GT1_CPLLRESET_IN;
  input drpclk_in;
  input DRPEN_IN;
  input DRPWE_IN;
  input GT_REFCLK1;
  input [0:0]SR;
  input GT1_GTTXRESET_IN;
  input [0:0]RXN;
  input [0:0]RXP;
  input gt_qpllclk_quad1_in;
  input gt_qpllrefclk_quad1_in;
  input GT0_RXCHBONDEN_IN;
  input GT0_RXDFEAGCHOLD_IN;
  input ENMCOMMAALIGN_IN;
  input GT0_RXPOLARITY_IN;
  input GT1_RXUSERRDY_IN;
  input SYNC_CLK;
  input user_clk;
  input POWER_DOWN;
  input GT1_TXUSERRDY_IN;
  input [15:0]DRPDI_IN;
  input [2:0]LOOPBACK;
  input [31:0]GT0_TXDATA_IN;
  input [3:0]GT0_TXCHARISK_IN;
  input [8:0]DRPADDR_IN;
  input I1;
  input I2;
  input [0:0]Q;
  input [7:0]I3;
  input GT1_CPLLREFCLKLOST_OUT;
  input adapt_count_reset;
  input rx_cdrlocked;
  input I8;
  input PLLLKDET_OUT_LANE1;
  input I9;

  wire \<const0> ;
  wire \<const1> ;
  wire CPLLLOCK;
  wire [7:0]D;
  wire [8:0]DRPADDR_IN;
  wire [15:0]DRPDI_IN;
  wire [15:0]DRPDO_OUT;
  wire DRPEN_IN;
  wire DRPRDY_OUT;
  wire DRPWE_IN;
  wire ENMCOMMAALIGN_IN;
  wire GT0_CPLLREFCLKLOST_OUT;
  wire GT0_RXBYTEREALIGN_OUT;
  wire [3:0]GT0_RXCHARISCOMMA_OUT;
  wire GT0_RXCHBONDEN_IN;
  wire [31:0]GT0_RXDATA_OUT;
  wire GT0_RXDFEAGCHOLD_IN;
  wire [1:0]GT0_RXDISPERR_OUT;
  wire GT0_RXPOLARITY_IN;
  wire GT0_RXRESETDONE_OUT;
  wire [3:0]GT0_TXCHARISK_IN;
  wire [31:0]GT0_TXDATA_IN;
  wire GT0_TXRESETDONE_OUT;
  wire GT1_CPLLREFCLKLOST_OUT;
  wire GT1_CPLLRESET_IN;
  wire GT1_GTTXRESET_IN;
  wire GT1_RXUSERRDY_IN;
  wire GT1_TXUSERRDY_IN;
  wire GT_REFCLK1;
  wire I1;
  wire I2;
  wire [7:0]I3;
  wire I8;
  wire I9;
  wire [2:0]LOOPBACK;
  wire O1;
  wire O10;
  wire O12;
  wire O13;
  wire O14;
  wire O15;
  wire O2;
  wire O20;
  wire O22;
  wire O23;
  wire [0:0]O26;
  wire [7:0]O3;
  wire [7:0]O4;
  wire PLLLKDET_OUT;
  wire PLLLKDET_OUT_LANE1;
  wire POWER_DOWN;
  wire [0:0]Q;
  wire RXBUFERR_OUT;
  wire [3:0]RXCHARISK;
  wire [4:0]RXCHBONDO;
  wire [3:2]RXDISPERR_OUT;
  wire [0:0]RXN;
  wire [3:0]RXNOTINTABLE_OUT;
  wire [0:0]RXP;
  wire [0:0]SR;
  wire SYNC_CLK;
  wire TXBUFERR_OUT;
  wire [0:0]TXN;
  wire [0:0]TXP;
  wire TX_OUT_CLK;
  wire adapt_count_reset;
  wire drpclk_in;
  wire gt_qpllclk_quad1_in;
  wire gt_qpllrefclk_quad1_in;
  wire hard_err_gt0;
  wire init_clk_in;
  wire n_0_gtxe2_i;
  wire n_11_gtxe2_i;
  wire n_12_gtxe2_i;
  wire n_14_gtxe2_i;
  wire n_16_gtxe2_i;
  wire n_170_gtxe2_i;
  wire n_171_gtxe2_i;
  wire n_172_gtxe2_i;
  wire n_173_gtxe2_i;
  wire n_174_gtxe2_i;
  wire n_175_gtxe2_i;
  wire n_176_gtxe2_i;
  wire n_177_gtxe2_i;
  wire n_178_gtxe2_i;
  wire n_179_gtxe2_i;
  wire n_180_gtxe2_i;
  wire n_181_gtxe2_i;
  wire n_182_gtxe2_i;
  wire n_183_gtxe2_i;
  wire n_184_gtxe2_i;
  wire n_23_gtxe2_i;
  wire n_27_gtxe2_i;
  wire n_38_gtxe2_i;
  wire n_39_gtxe2_i;
  wire n_4_gtxe2_i;
  wire n_78_gtxe2_i;
  wire n_79_gtxe2_i;
  wire n_81_gtxe2_i;
  wire n_83_gtxe2_i;
  wire n_84_gtxe2_i;
  wire n_9_gtxe2_i;
  wire rx_cdrlocked;
  wire user_clk;
  wire NLW_gtxe2_i_GTREFCLKMONITOR_UNCONNECTED;
  wire NLW_gtxe2_i_PHYSTATUS_UNCONNECTED;
  wire NLW_gtxe2_i_RXCOMINITDET_UNCONNECTED;
  wire NLW_gtxe2_i_RXCOMSASDET_UNCONNECTED;
  wire NLW_gtxe2_i_RXCOMWAKEDET_UNCONNECTED;
  wire NLW_gtxe2_i_RXDATAVALID_UNCONNECTED;
  wire NLW_gtxe2_i_RXDLYSRESETDONE_UNCONNECTED;
  wire NLW_gtxe2_i_RXELECIDLE_UNCONNECTED;
  wire NLW_gtxe2_i_RXHEADERVALID_UNCONNECTED;
  wire NLW_gtxe2_i_RXOUTCLKFABRIC_UNCONNECTED;
  wire NLW_gtxe2_i_RXOUTCLKPCS_UNCONNECTED;
  wire NLW_gtxe2_i_RXPHALIGNDONE_UNCONNECTED;
  wire NLW_gtxe2_i_RXQPISENN_UNCONNECTED;
  wire NLW_gtxe2_i_RXQPISENP_UNCONNECTED;
  wire NLW_gtxe2_i_RXRATEDONE_UNCONNECTED;
  wire NLW_gtxe2_i_RXSTARTOFSEQ_UNCONNECTED;
  wire NLW_gtxe2_i_RXVALID_UNCONNECTED;
  wire NLW_gtxe2_i_TXCOMFINISH_UNCONNECTED;
  wire NLW_gtxe2_i_TXDLYSRESETDONE_UNCONNECTED;
  wire NLW_gtxe2_i_TXGEARBOXREADY_UNCONNECTED;
  wire NLW_gtxe2_i_TXPHALIGNDONE_UNCONNECTED;
  wire NLW_gtxe2_i_TXPHINITDONE_UNCONNECTED;
  wire NLW_gtxe2_i_TXQPISENN_UNCONNECTED;
  wire NLW_gtxe2_i_TXQPISENP_UNCONNECTED;
  wire NLW_gtxe2_i_TXRATEDONE_UNCONNECTED;
  wire [15:0]NLW_gtxe2_i_PCSRSVDOUT_UNCONNECTED;
  wire [7:4]NLW_gtxe2_i_RXCHARISCOMMA_UNCONNECTED;
  wire [7:4]NLW_gtxe2_i_RXCHARISK_UNCONNECTED;
  wire [63:32]NLW_gtxe2_i_RXDATA_UNCONNECTED;
  wire [7:4]NLW_gtxe2_i_RXDISPERR_UNCONNECTED;
  wire [2:0]NLW_gtxe2_i_RXHEADER_UNCONNECTED;
  wire [7:4]NLW_gtxe2_i_RXNOTINTABLE_UNCONNECTED;
  wire [4:0]NLW_gtxe2_i_RXPHMONITOR_UNCONNECTED;
  wire [4:0]NLW_gtxe2_i_RXPHSLIPMONITOR_UNCONNECTED;
  wire [2:0]NLW_gtxe2_i_RXSTATUS_UNCONNECTED;
  wire [9:0]NLW_gtxe2_i_TSTOUT_UNCONNECTED;

LUT2 #(
    .INIT(4'h8)) 
     \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d1_cdc_to_i_1 
       (.I0(PLLLKDET_OUT),
        .I1(PLLLKDET_OUT_LANE1),
        .O(CPLLLOCK));
GND GND
       (.G(\<const0> ));
LUT5 #(
    .INIT(32'h0F0F7F70)) 
     RXDFEAGCHOLD_i_2
       (.I0(GT0_CPLLREFCLKLOST_OUT),
        .I1(GT1_CPLLREFCLKLOST_OUT),
        .I2(adapt_count_reset),
        .I3(rx_cdrlocked),
        .I4(I8),
        .O(O10));
VCC VCC
       (.P(\<const1> ));
LUT6 #(
    .INIT(64'hFFFFFAFB10114010)) 
     \data_mgt_sym_dec_4byte_i/left_align_select_r[0]_i_1 
       (.I0(I9),
        .I1(RXCHARISK[0]),
        .I2(RXCHARISK[2]),
        .I3(RXCHARISK[1]),
        .I4(RXCHARISK[3]),
        .I5(I2),
        .O(O22));
LUT6 #(
    .INIT(64'hFFFFBFEB10110500)) 
     \data_mgt_sym_dec_4byte_i/left_align_select_r[1]_i_1 
       (.I0(I9),
        .I1(RXCHARISK[0]),
        .I2(RXCHARISK[2]),
        .I3(RXCHARISK[1]),
        .I4(RXCHARISK[3]),
        .I5(I1),
        .O(O23));
LUT4 #(
    .INIT(16'h0080)) 
     \got_a_d_r[0]_i_1 
       (.I0(GT0_RXDATA_OUT[5]),
        .I1(GT0_RXDATA_OUT[4]),
        .I2(GT0_RXDATA_OUT[6]),
        .I3(GT0_RXDATA_OUT[7]),
        .O(O4[7]));
LUT4 #(
    .INIT(16'h0008)) 
     \got_a_d_r[1]_i_1 
       (.I0(GT0_RXDATA_OUT[3]),
        .I1(GT0_RXDATA_OUT[2]),
        .I2(GT0_RXDATA_OUT[1]),
        .I3(GT0_RXDATA_OUT[0]),
        .O(O4[6]));
LUT4 #(
    .INIT(16'h0080)) 
     \got_a_d_r[2]_i_1 
       (.I0(GT0_RXDATA_OUT[13]),
        .I1(GT0_RXDATA_OUT[12]),
        .I2(GT0_RXDATA_OUT[14]),
        .I3(GT0_RXDATA_OUT[15]),
        .O(O4[5]));
LUT4 #(
    .INIT(16'h0008)) 
     \got_a_d_r[3]_i_1 
       (.I0(GT0_RXDATA_OUT[11]),
        .I1(GT0_RXDATA_OUT[10]),
        .I2(GT0_RXDATA_OUT[9]),
        .I3(GT0_RXDATA_OUT[8]),
        .O(O4[4]));
LUT4 #(
    .INIT(16'h0080)) 
     \got_a_d_r[4]_i_1 
       (.I0(GT0_RXDATA_OUT[21]),
        .I1(GT0_RXDATA_OUT[20]),
        .I2(GT0_RXDATA_OUT[22]),
        .I3(GT0_RXDATA_OUT[23]),
        .O(O4[3]));
LUT4 #(
    .INIT(16'h0008)) 
     \got_a_d_r[5]_i_1 
       (.I0(GT0_RXDATA_OUT[19]),
        .I1(GT0_RXDATA_OUT[18]),
        .I2(GT0_RXDATA_OUT[17]),
        .I3(GT0_RXDATA_OUT[16]),
        .O(O4[2]));
LUT4 #(
    .INIT(16'h0080)) 
     \got_a_d_r[6]_i_1 
       (.I0(GT0_RXDATA_OUT[29]),
        .I1(GT0_RXDATA_OUT[28]),
        .I2(GT0_RXDATA_OUT[30]),
        .I3(GT0_RXDATA_OUT[31]),
        .O(O4[1]));
LUT4 #(
    .INIT(16'h0008)) 
     \got_a_d_r[7]_i_1 
       (.I0(GT0_RXDATA_OUT[27]),
        .I1(GT0_RXDATA_OUT[26]),
        .I2(GT0_RXDATA_OUT[25]),
        .I3(GT0_RXDATA_OUT[24]),
        .O(O4[0]));
(* BOX_TYPE = "PRIMITIVE" *) 
   GTXE2_CHANNEL #(
    .ALIGN_COMMA_DOUBLE("FALSE"),
    .ALIGN_COMMA_ENABLE(10'b1111111111),
    .ALIGN_COMMA_WORD(2),
    .ALIGN_MCOMMA_DET("TRUE"),
    .ALIGN_MCOMMA_VALUE(10'b1010000011),
    .ALIGN_PCOMMA_DET("TRUE"),
    .ALIGN_PCOMMA_VALUE(10'b0101111100),
    .CBCC_DATA_SOURCE_SEL("DECODED"),
    .CHAN_BOND_KEEP_ALIGN("FALSE"),
    .CHAN_BOND_MAX_SKEW(7),
    .CHAN_BOND_SEQ_1_1(10'b0101111100),
    .CHAN_BOND_SEQ_1_2(10'b0000000000),
    .CHAN_BOND_SEQ_1_3(10'b0000000000),
    .CHAN_BOND_SEQ_1_4(10'b0000000000),
    .CHAN_BOND_SEQ_1_ENABLE(4'b0001),
    .CHAN_BOND_SEQ_2_1(10'b0000000000),
    .CHAN_BOND_SEQ_2_2(10'b0000000000),
    .CHAN_BOND_SEQ_2_3(10'b0000000000),
    .CHAN_BOND_SEQ_2_4(10'b0000000000),
    .CHAN_BOND_SEQ_2_ENABLE(4'b0000),
    .CHAN_BOND_SEQ_2_USE("FALSE"),
    .CHAN_BOND_SEQ_LEN(1),
    .CLK_CORRECT_USE("TRUE"),
    .CLK_COR_KEEP_IDLE("FALSE"),
    .CLK_COR_MAX_LAT(35),
    .CLK_COR_MIN_LAT(28),
    .CLK_COR_PRECEDENCE("TRUE"),
    .CLK_COR_REPEAT_WAIT(0),
    .CLK_COR_SEQ_1_1(10'b0111110111),
    .CLK_COR_SEQ_1_2(10'b0111110111),
    .CLK_COR_SEQ_1_3(10'b0111110111),
    .CLK_COR_SEQ_1_4(10'b0111110111),
    .CLK_COR_SEQ_1_ENABLE(4'b1111),
    .CLK_COR_SEQ_2_1(10'b0100000000),
    .CLK_COR_SEQ_2_2(10'b0100000000),
    .CLK_COR_SEQ_2_3(10'b0100000000),
    .CLK_COR_SEQ_2_4(10'b0100000000),
    .CLK_COR_SEQ_2_ENABLE(4'b1111),
    .CLK_COR_SEQ_2_USE("FALSE"),
    .CLK_COR_SEQ_LEN(4),
    .CPLL_CFG(24'hBC07DC),
    .CPLL_FBDIV(4),
    .CPLL_FBDIV_45(4),
    .CPLL_INIT_CFG(24'h00001E),
    .CPLL_LOCK_CFG(16'h01E8),
    .CPLL_REFCLK_DIV(1),
    .DEC_MCOMMA_DETECT("TRUE"),
    .DEC_PCOMMA_DETECT("TRUE"),
    .DEC_VALID_COMMA_ONLY("FALSE"),
    .DMONITOR_CFG(24'h000A00),
    .ES_CONTROL(6'b000000),
    .ES_ERRDET_EN("FALSE"),
    .ES_EYE_SCAN_EN("TRUE"),
    .ES_HORZ_OFFSET(12'h000),
    .ES_PMA_CFG(10'b0000000000),
    .ES_PRESCALE(5'b00000),
    .ES_QUALIFIER(80'h00000000000000000000),
    .ES_QUAL_MASK(80'h00000000000000000000),
    .ES_SDATA_MASK(80'h00000000000000000000),
    .ES_VERT_OFFSET(9'b000000000),
    .FTS_DESKEW_SEQ_ENABLE(4'b1111),
    .FTS_LANE_DESKEW_CFG(4'b1111),
    .FTS_LANE_DESKEW_EN("FALSE"),
    .GEARBOX_MODE(3'b000),
    .IS_CPLLLOCKDETCLK_INVERTED(1'b0),
    .IS_DRPCLK_INVERTED(1'b0),
    .IS_GTGREFCLK_INVERTED(1'b0),
    .IS_RXUSRCLK2_INVERTED(1'b0),
    .IS_RXUSRCLK_INVERTED(1'b0),
    .IS_TXPHDLYTSTCLK_INVERTED(1'b0),
    .IS_TXUSRCLK2_INVERTED(1'b0),
    .IS_TXUSRCLK_INVERTED(1'b0),
    .OUTREFCLK_SEL_INV(2'b11),
    .PCS_PCIE_EN("FALSE"),
    .PCS_RSVD_ATTR(48'h000000000000),
    .PD_TRANS_TIME_FROM_P2(12'h03C),
    .PD_TRANS_TIME_NONE_P2(8'h19),
    .PD_TRANS_TIME_TO_P2(8'h64),
    .PMA_RSV(32'h00018480),
    .PMA_RSV2(16'h2050),
    .PMA_RSV3(2'b00),
    .PMA_RSV4(32'h00000000),
    .RXBUFRESET_TIME(5'b00001),
    .RXBUF_ADDR_MODE("FULL"),
    .RXBUF_EIDLE_HI_CNT(4'b1000),
    .RXBUF_EIDLE_LO_CNT(4'b0000),
    .RXBUF_EN("TRUE"),
    .RXBUF_RESET_ON_CB_CHANGE("TRUE"),
    .RXBUF_RESET_ON_COMMAALIGN("FALSE"),
    .RXBUF_RESET_ON_EIDLE("FALSE"),
    .RXBUF_RESET_ON_RATE_CHANGE("TRUE"),
    .RXBUF_THRESH_OVFLW(61),
    .RXBUF_THRESH_OVRD("FALSE"),
    .RXBUF_THRESH_UNDFLW(4),
    .RXCDRFREQRESET_TIME(5'b00001),
    .RXCDRPHRESET_TIME(5'b00001),
    .RXCDR_CFG(72'h03000023FF20400020),
    .RXCDR_FR_RESET_ON_EIDLE(1'b0),
    .RXCDR_HOLD_DURING_EIDLE(1'b0),
    .RXCDR_LOCK_CFG(6'b010101),
    .RXCDR_PH_RESET_ON_EIDLE(1'b0),
    .RXDFELPMRESET_TIME(7'b0001111),
    .RXDLY_CFG(16'h001F),
    .RXDLY_LCFG(9'h030),
    .RXDLY_TAP_CFG(16'h0000),
    .RXGEARBOX_EN("FALSE"),
    .RXISCANRESET_TIME(5'b00001),
    .RXLPM_HF_CFG(14'b00000011110000),
    .RXLPM_LF_CFG(14'b00000011110000),
    .RXOOB_CFG(7'b0000110),
    .RXOUT_DIV(1),
    .RXPCSRESET_TIME(5'b00001),
    .RXPHDLY_CFG(24'h084020),
    .RXPH_CFG(24'h000000),
    .RXPH_MONITOR_SEL(5'b00000),
    .RXPMARESET_TIME(5'b00011),
    .RXPRBS_ERR_LOOPBACK(1'b0),
    .RXSLIDE_AUTO_WAIT(7),
    .RXSLIDE_MODE("OFF"),
    .RX_BIAS_CFG(12'b000000000100),
    .RX_BUFFER_CFG(6'b000000),
    .RX_CLK25_DIV(5),
    .RX_CLKMUX_PD(1'b1),
    .RX_CM_SEL(2'b11),
    .RX_CM_TRIM(3'b010),
    .RX_DATA_WIDTH(40),
    .RX_DDI_SEL(6'b000000),
    .RX_DEBUG_CFG(12'b000000000000),
    .RX_DEFER_RESET_BUF_EN("TRUE"),
    .RX_DFE_GAIN_CFG(23'h020FEA),
    .RX_DFE_H2_CFG(12'b000000000000),
    .RX_DFE_H3_CFG(12'b000001000000),
    .RX_DFE_H4_CFG(11'b00011110000),
    .RX_DFE_H5_CFG(11'b00011100000),
    .RX_DFE_KL_CFG(13'b0000011111110),
    .RX_DFE_KL_CFG2(32'h3010D90C),
    .RX_DFE_LPM_CFG(16'h0954),
    .RX_DFE_LPM_HOLD_DURING_EIDLE(1'b0),
    .RX_DFE_UT_CFG(17'b10001111000000000),
    .RX_DFE_VP_CFG(17'b00011111100000011),
    .RX_DFE_XYD_CFG(13'b0000000000000),
    .RX_DISPERR_SEQ_MATCH("TRUE"),
    .RX_INT_DATAWIDTH(1),
    .RX_OS_CFG(13'b0000010000000),
    .RX_SIG_VALID_DLY(10),
    .RX_XCLK_SEL("RXREC"),
    .SAS_MAX_COM(64),
    .SAS_MIN_COM(36),
    .SATA_BURST_SEQ_LEN(4'b1111),
    .SATA_BURST_VAL(3'b100),
    .SATA_CPLL_CFG("VCO_3000MHZ"),
    .SATA_EIDLE_VAL(3'b100),
    .SATA_MAX_BURST(8),
    .SATA_MAX_INIT(21),
    .SATA_MAX_WAKE(7),
    .SATA_MIN_BURST(4),
    .SATA_MIN_INIT(12),
    .SATA_MIN_WAKE(4),
    .SHOW_REALIGN_COMMA("TRUE"),
    .SIM_CPLLREFCLK_SEL(3'b001),
    .SIM_RECEIVER_DETECT_PASS("TRUE"),
    .SIM_RESET_SPEEDUP("FALSE"),
    .SIM_TX_EIDLE_DRIVE_LEVEL("X"),
    .SIM_VERSION("4.0"),
    .TERM_RCAL_CFG(5'b10000),
    .TERM_RCAL_OVRD(1'b0),
    .TRANS_TIME_RATE(8'h0E),
    .TST_RSV(32'h00000000),
    .TXBUF_EN("TRUE"),
    .TXBUF_RESET_ON_RATE_CHANGE("TRUE"),
    .TXDLY_CFG(16'h001F),
    .TXDLY_LCFG(9'h030),
    .TXDLY_TAP_CFG(16'h0000),
    .TXGEARBOX_EN("FALSE"),
    .TXOUT_DIV(1),
    .TXPCSRESET_TIME(5'b00001),
    .TXPHDLY_CFG(24'h084020),
    .TXPH_CFG(16'h0780),
    .TXPH_MONITOR_SEL(5'b00000),
    .TXPMARESET_TIME(5'b00001),
    .TX_CLK25_DIV(5),
    .TX_CLKMUX_PD(1'b1),
    .TX_DATA_WIDTH(40),
    .TX_DEEMPH0(5'b00000),
    .TX_DEEMPH1(5'b00000),
    .TX_DRIVE_MODE("DIRECT"),
    .TX_EIDLE_ASSERT_DELAY(3'b110),
    .TX_EIDLE_DEASSERT_DELAY(3'b100),
    .TX_INT_DATAWIDTH(1),
    .TX_LOOPBACK_DRIVE_HIZ("FALSE"),
    .TX_MAINCURSOR_SEL(1'b0),
    .TX_MARGIN_FULL_0(7'b1001110),
    .TX_MARGIN_FULL_1(7'b1001001),
    .TX_MARGIN_FULL_2(7'b1000101),
    .TX_MARGIN_FULL_3(7'b1000010),
    .TX_MARGIN_FULL_4(7'b1000000),
    .TX_MARGIN_LOW_0(7'b1000110),
    .TX_MARGIN_LOW_1(7'b1000100),
    .TX_MARGIN_LOW_2(7'b1000010),
    .TX_MARGIN_LOW_3(7'b1000000),
    .TX_MARGIN_LOW_4(7'b1000000),
    .TX_PREDRIVER_MODE(1'b0),
    .TX_QPI_STATUS_EN(1'b0),
    .TX_RXDETECT_CFG(14'h1832),
    .TX_RXDETECT_REF(3'b100),
    .TX_XCLK_SEL("TXOUT"),
    .UCODEER_CLR(1'b0)) 
     gtxe2_i
       (.CFGRESET(\<const0> ),
        .CLKRSVD({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .CPLLFBCLKLOST(n_0_gtxe2_i),
        .CPLLLOCK(PLLLKDET_OUT),
        .CPLLLOCKDETCLK(init_clk_in),
        .CPLLLOCKEN(\<const1> ),
        .CPLLPD(\<const0> ),
        .CPLLREFCLKLOST(GT0_CPLLREFCLKLOST_OUT),
        .CPLLREFCLKSEL({\<const0> ,\<const0> ,\<const1> }),
        .CPLLRESET(GT1_CPLLRESET_IN),
        .DMONITOROUT({n_177_gtxe2_i,n_178_gtxe2_i,n_179_gtxe2_i,n_180_gtxe2_i,n_181_gtxe2_i,n_182_gtxe2_i,n_183_gtxe2_i,n_184_gtxe2_i}),
        .DRPADDR(DRPADDR_IN),
        .DRPCLK(drpclk_in),
        .DRPDI(DRPDI_IN),
        .DRPDO(DRPDO_OUT),
        .DRPEN(DRPEN_IN),
        .DRPRDY(DRPRDY_OUT),
        .DRPWE(DRPWE_IN),
        .EYESCANDATAERROR(n_4_gtxe2_i),
        .EYESCANMODE(\<const0> ),
        .EYESCANRESET(\<const0> ),
        .EYESCANTRIGGER(\<const0> ),
        .GTGREFCLK(\<const0> ),
        .GTNORTHREFCLK0(\<const0> ),
        .GTNORTHREFCLK1(\<const0> ),
        .GTREFCLK0(GT_REFCLK1),
        .GTREFCLK1(\<const0> ),
        .GTREFCLKMONITOR(NLW_gtxe2_i_GTREFCLKMONITOR_UNCONNECTED),
        .GTRESETSEL(\<const0> ),
        .GTRSVD({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .GTRXRESET(SR),
        .GTSOUTHREFCLK0(\<const0> ),
        .GTSOUTHREFCLK1(\<const0> ),
        .GTTXRESET(GT1_GTTXRESET_IN),
        .GTXRXN(RXN),
        .GTXRXP(RXP),
        .GTXTXN(TXN),
        .GTXTXP(TXP),
        .LOOPBACK(LOOPBACK),
        .PCSRSVDIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .PCSRSVDIN2({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .PCSRSVDOUT(NLW_gtxe2_i_PCSRSVDOUT_UNCONNECTED[15:0]),
        .PHYSTATUS(NLW_gtxe2_i_PHYSTATUS_UNCONNECTED),
        .PMARSVDIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .PMARSVDIN2({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .QPLLCLK(gt_qpllclk_quad1_in),
        .QPLLREFCLK(gt_qpllrefclk_quad1_in),
        .RESETOVRD(\<const0> ),
        .RX8B10BEN(\<const1> ),
        .RXBUFRESET(\<const0> ),
        .RXBUFSTATUS({RXBUFERR_OUT,n_83_gtxe2_i,n_84_gtxe2_i}),
        .RXBYTEISALIGNED(n_9_gtxe2_i),
        .RXBYTEREALIGN(GT0_RXBYTEREALIGN_OUT),
        .RXCDRFREQRESET(\<const0> ),
        .RXCDRHOLD(\<const0> ),
        .RXCDRLOCK(n_11_gtxe2_i),
        .RXCDROVRDEN(\<const0> ),
        .RXCDRRESET(\<const0> ),
        .RXCDRRESETRSV(\<const0> ),
        .RXCHANBONDSEQ(n_12_gtxe2_i),
        .RXCHANISALIGNED(O26),
        .RXCHANREALIGN(n_14_gtxe2_i),
        .RXCHARISCOMMA({NLW_gtxe2_i_RXCHARISCOMMA_UNCONNECTED[7:4],GT0_RXCHARISCOMMA_OUT}),
        .RXCHARISK({NLW_gtxe2_i_RXCHARISK_UNCONNECTED[7:4],RXCHARISK}),
        .RXCHBONDEN(GT0_RXCHBONDEN_IN),
        .RXCHBONDI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .RXCHBONDLEVEL({\<const0> ,\<const0> ,\<const1> }),
        .RXCHBONDMASTER(\<const1> ),
        .RXCHBONDO(RXCHBONDO),
        .RXCHBONDSLAVE(\<const0> ),
        .RXCLKCORCNT({n_78_gtxe2_i,n_79_gtxe2_i}),
        .RXCOMINITDET(NLW_gtxe2_i_RXCOMINITDET_UNCONNECTED),
        .RXCOMMADET(n_16_gtxe2_i),
        .RXCOMMADETEN(\<const1> ),
        .RXCOMSASDET(NLW_gtxe2_i_RXCOMSASDET_UNCONNECTED),
        .RXCOMWAKEDET(NLW_gtxe2_i_RXCOMWAKEDET_UNCONNECTED),
        .RXDATA({NLW_gtxe2_i_RXDATA_UNCONNECTED[63:32],GT0_RXDATA_OUT}),
        .RXDATAVALID(NLW_gtxe2_i_RXDATAVALID_UNCONNECTED),
        .RXDDIEN(\<const0> ),
        .RXDFEAGCHOLD(GT0_RXDFEAGCHOLD_IN),
        .RXDFEAGCOVRDEN(\<const0> ),
        .RXDFECM1EN(\<const0> ),
        .RXDFELFHOLD(GT0_RXDFEAGCHOLD_IN),
        .RXDFELFOVRDEN(\<const1> ),
        .RXDFELPMRESET(\<const0> ),
        .RXDFETAP2HOLD(\<const0> ),
        .RXDFETAP2OVRDEN(\<const0> ),
        .RXDFETAP3HOLD(\<const0> ),
        .RXDFETAP3OVRDEN(\<const0> ),
        .RXDFETAP4HOLD(\<const0> ),
        .RXDFETAP4OVRDEN(\<const0> ),
        .RXDFETAP5HOLD(\<const0> ),
        .RXDFETAP5OVRDEN(\<const0> ),
        .RXDFEUTHOLD(\<const0> ),
        .RXDFEUTOVRDEN(\<const0> ),
        .RXDFEVPHOLD(\<const0> ),
        .RXDFEVPOVRDEN(\<const0> ),
        .RXDFEVSEN(\<const0> ),
        .RXDFEXYDEN(\<const1> ),
        .RXDFEXYDHOLD(\<const0> ),
        .RXDFEXYDOVRDEN(\<const0> ),
        .RXDISPERR({NLW_gtxe2_i_RXDISPERR_UNCONNECTED[7:4],RXDISPERR_OUT,GT0_RXDISPERR_OUT}),
        .RXDLYBYPASS(\<const1> ),
        .RXDLYEN(\<const0> ),
        .RXDLYOVRDEN(\<const0> ),
        .RXDLYSRESET(\<const0> ),
        .RXDLYSRESETDONE(NLW_gtxe2_i_RXDLYSRESETDONE_UNCONNECTED),
        .RXELECIDLE(NLW_gtxe2_i_RXELECIDLE_UNCONNECTED),
        .RXELECIDLEMODE({\<const1> ,\<const1> }),
        .RXGEARBOXSLIP(\<const0> ),
        .RXHEADER(NLW_gtxe2_i_RXHEADER_UNCONNECTED[2:0]),
        .RXHEADERVALID(NLW_gtxe2_i_RXHEADERVALID_UNCONNECTED),
        .RXLPMEN(\<const0> ),
        .RXLPMHFHOLD(\<const0> ),
        .RXLPMHFOVRDEN(\<const0> ),
        .RXLPMLFHOLD(\<const0> ),
        .RXLPMLFKLOVRDEN(\<const0> ),
        .RXMCOMMAALIGNEN(ENMCOMMAALIGN_IN),
        .RXMONITOROUT({n_170_gtxe2_i,n_171_gtxe2_i,n_172_gtxe2_i,n_173_gtxe2_i,n_174_gtxe2_i,n_175_gtxe2_i,n_176_gtxe2_i}),
        .RXMONITORSEL({\<const0> ,\<const0> }),
        .RXNOTINTABLE({NLW_gtxe2_i_RXNOTINTABLE_UNCONNECTED[7:4],RXNOTINTABLE_OUT}),
        .RXOOBRESET(\<const0> ),
        .RXOSHOLD(\<const0> ),
        .RXOSOVRDEN(\<const0> ),
        .RXOUTCLK(n_23_gtxe2_i),
        .RXOUTCLKFABRIC(NLW_gtxe2_i_RXOUTCLKFABRIC_UNCONNECTED),
        .RXOUTCLKPCS(NLW_gtxe2_i_RXOUTCLKPCS_UNCONNECTED),
        .RXOUTCLKSEL({\<const0> ,\<const1> ,\<const0> }),
        .RXPCOMMAALIGNEN(ENMCOMMAALIGN_IN),
        .RXPCSRESET(\<const0> ),
        .RXPD({POWER_DOWN,POWER_DOWN}),
        .RXPHALIGN(\<const0> ),
        .RXPHALIGNDONE(NLW_gtxe2_i_RXPHALIGNDONE_UNCONNECTED),
        .RXPHALIGNEN(\<const0> ),
        .RXPHDLYPD(\<const0> ),
        .RXPHDLYRESET(\<const0> ),
        .RXPHMONITOR(NLW_gtxe2_i_RXPHMONITOR_UNCONNECTED[4:0]),
        .RXPHOVRDEN(\<const0> ),
        .RXPHSLIPMONITOR(NLW_gtxe2_i_RXPHSLIPMONITOR_UNCONNECTED[4:0]),
        .RXPMARESET(\<const0> ),
        .RXPOLARITY(GT0_RXPOLARITY_IN),
        .RXPRBSCNTRESET(\<const0> ),
        .RXPRBSERR(n_27_gtxe2_i),
        .RXPRBSSEL({\<const0> ,\<const0> ,\<const0> }),
        .RXQPIEN(\<const0> ),
        .RXQPISENN(NLW_gtxe2_i_RXQPISENN_UNCONNECTED),
        .RXQPISENP(NLW_gtxe2_i_RXQPISENP_UNCONNECTED),
        .RXRATE({\<const0> ,\<const0> ,\<const0> }),
        .RXRATEDONE(NLW_gtxe2_i_RXRATEDONE_UNCONNECTED),
        .RXRESETDONE(GT0_RXRESETDONE_OUT),
        .RXSLIDE(\<const0> ),
        .RXSTARTOFSEQ(NLW_gtxe2_i_RXSTARTOFSEQ_UNCONNECTED),
        .RXSTATUS(NLW_gtxe2_i_RXSTATUS_UNCONNECTED[2:0]),
        .RXSYSCLKSEL({\<const0> ,\<const0> }),
        .RXUSERRDY(GT1_RXUSERRDY_IN),
        .RXUSRCLK(SYNC_CLK),
        .RXUSRCLK2(user_clk),
        .RXVALID(NLW_gtxe2_i_RXVALID_UNCONNECTED),
        .SETERRSTATUS(\<const0> ),
        .TSTIN({\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .TSTOUT(NLW_gtxe2_i_TSTOUT_UNCONNECTED[9:0]),
        .TX8B10BBYPASS({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .TX8B10BEN(\<const1> ),
        .TXBUFDIFFCTRL({\<const1> ,\<const0> ,\<const0> }),
        .TXBUFSTATUS({TXBUFERR_OUT,n_81_gtxe2_i}),
        .TXCHARDISPMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .TXCHARDISPVAL({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .TXCHARISK({\<const0> ,\<const0> ,\<const0> ,\<const0> ,GT0_TXCHARISK_IN}),
        .TXCOMFINISH(NLW_gtxe2_i_TXCOMFINISH_UNCONNECTED),
        .TXCOMINIT(\<const0> ),
        .TXCOMSAS(\<const0> ),
        .TXCOMWAKE(\<const0> ),
        .TXDATA({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,GT0_TXDATA_IN}),
        .TXDEEMPH(\<const0> ),
        .TXDETECTRX(\<const0> ),
        .TXDIFFCTRL({\<const1> ,\<const0> ,\<const0> ,\<const0> }),
        .TXDIFFPD(\<const0> ),
        .TXDLYBYPASS(\<const1> ),
        .TXDLYEN(\<const0> ),
        .TXDLYHOLD(\<const0> ),
        .TXDLYOVRDEN(\<const0> ),
        .TXDLYSRESET(\<const0> ),
        .TXDLYSRESETDONE(NLW_gtxe2_i_TXDLYSRESETDONE_UNCONNECTED),
        .TXDLYUPDOWN(\<const0> ),
        .TXELECIDLE(POWER_DOWN),
        .TXGEARBOXREADY(NLW_gtxe2_i_TXGEARBOXREADY_UNCONNECTED),
        .TXHEADER({\<const0> ,\<const0> ,\<const0> }),
        .TXINHIBIT(\<const0> ),
        .TXMAINCURSOR({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .TXMARGIN({\<const0> ,\<const0> ,\<const0> }),
        .TXOUTCLK(TX_OUT_CLK),
        .TXOUTCLKFABRIC(n_38_gtxe2_i),
        .TXOUTCLKPCS(n_39_gtxe2_i),
        .TXOUTCLKSEL({\<const0> ,\<const1> ,\<const0> }),
        .TXPCSRESET(\<const0> ),
        .TXPD({POWER_DOWN,POWER_DOWN}),
        .TXPDELECIDLEMODE(\<const0> ),
        .TXPHALIGN(\<const0> ),
        .TXPHALIGNDONE(NLW_gtxe2_i_TXPHALIGNDONE_UNCONNECTED),
        .TXPHALIGNEN(\<const0> ),
        .TXPHDLYPD(\<const0> ),
        .TXPHDLYRESET(\<const0> ),
        .TXPHDLYTSTCLK(\<const0> ),
        .TXPHINIT(\<const0> ),
        .TXPHINITDONE(NLW_gtxe2_i_TXPHINITDONE_UNCONNECTED),
        .TXPHOVRDEN(\<const0> ),
        .TXPISOPD(\<const0> ),
        .TXPMARESET(\<const0> ),
        .TXPOLARITY(\<const0> ),
        .TXPOSTCURSOR({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .TXPOSTCURSORINV(\<const0> ),
        .TXPRBSFORCEERR(\<const0> ),
        .TXPRBSSEL({\<const0> ,\<const0> ,\<const0> }),
        .TXPRECURSOR({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .TXPRECURSORINV(\<const0> ),
        .TXQPIBIASEN(\<const0> ),
        .TXQPISENN(NLW_gtxe2_i_TXQPISENN_UNCONNECTED),
        .TXQPISENP(NLW_gtxe2_i_TXQPISENP_UNCONNECTED),
        .TXQPISTRONGPDOWN(\<const0> ),
        .TXQPIWEAKPUP(\<const0> ),
        .TXRATE({\<const0> ,\<const0> ,\<const0> }),
        .TXRATEDONE(NLW_gtxe2_i_TXRATEDONE_UNCONNECTED),
        .TXRESETDONE(GT0_TXRESETDONE_OUT),
        .TXSEQUENCE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .TXSTARTSEQ(\<const0> ),
        .TXSWING(\<const0> ),
        .TXSYSCLKSEL({\<const0> ,\<const0> }),
        .TXUSERRDY(GT1_TXUSERRDY_IN),
        .TXUSRCLK(SYNC_CLK),
        .TXUSRCLK2(user_clk));
LUT3 #(
    .INIT(8'hFE)) 
     hard_err_gt_i_1
       (.I0(RXBUFERR_OUT),
        .I1(TXBUFERR_OUT),
        .I2(GT0_RXBYTEREALIGN_OUT),
        .O(hard_err_gt0));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
     reset_count_r_i_2
       (.I0(RXDISPERR_OUT[2]),
        .I1(RXNOTINTABLE_OUT[3]),
        .I2(RXNOTINTABLE_OUT[1]),
        .I3(RXNOTINTABLE_OUT[2]),
        .I4(RXDISPERR_OUT[3]),
        .I5(RXNOTINTABLE_OUT[0]),
        .O(O20));
LUT2 #(
    .INIT(4'hE)) 
     \soft_err_r[0]_i_2 
       (.I0(GT0_RXDISPERR_OUT[0]),
        .I1(RXNOTINTABLE_OUT[0]),
        .O(O12));
LUT2 #(
    .INIT(4'hE)) 
     \soft_err_r[1]_i_1 
       (.I0(GT0_RXDISPERR_OUT[1]),
        .I1(RXNOTINTABLE_OUT[1]),
        .O(O13));
LUT2 #(
    .INIT(4'hE)) 
     \soft_err_r[2]_i_1 
       (.I0(RXDISPERR_OUT[2]),
        .I1(RXNOTINTABLE_OUT[2]),
        .O(O14));
LUT2 #(
    .INIT(4'hE)) 
     \soft_err_r[3]_i_1 
       (.I0(RXNOTINTABLE_OUT[3]),
        .I1(RXDISPERR_OUT[3]),
        .O(O15));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_control_bits_r[2]_i_1 
       (.I0(RXCHARISK[1]),
        .I1(Q),
        .I2(I1),
        .I3(RXCHARISK[0]),
        .I4(I2),
        .I5(RXCHARISK[2]),
        .O(O2));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_control_bits_r[3]_i_1 
       (.I0(RXCHARISK[2]),
        .I1(RXCHARISK[0]),
        .I2(I1),
        .I3(RXCHARISK[1]),
        .I4(I2),
        .I5(RXCHARISK[3]),
        .O(O1));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[16]_i_1 
       (.I0(GT0_RXDATA_OUT[15]),
        .I1(GT0_RXDATA_OUT[7]),
        .I2(I2),
        .I3(I3[7]),
        .I4(I1),
        .I5(GT0_RXDATA_OUT[23]),
        .O(D[7]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[17]_i_1 
       (.I0(GT0_RXDATA_OUT[14]),
        .I1(GT0_RXDATA_OUT[6]),
        .I2(I2),
        .I3(I3[6]),
        .I4(I1),
        .I5(GT0_RXDATA_OUT[22]),
        .O(D[6]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[18]_i_1 
       (.I0(GT0_RXDATA_OUT[13]),
        .I1(GT0_RXDATA_OUT[5]),
        .I2(I2),
        .I3(I3[5]),
        .I4(I1),
        .I5(GT0_RXDATA_OUT[21]),
        .O(D[5]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[19]_i_1 
       (.I0(GT0_RXDATA_OUT[12]),
        .I1(GT0_RXDATA_OUT[4]),
        .I2(I2),
        .I3(I3[4]),
        .I4(I1),
        .I5(GT0_RXDATA_OUT[20]),
        .O(D[4]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[20]_i_1 
       (.I0(GT0_RXDATA_OUT[11]),
        .I1(GT0_RXDATA_OUT[3]),
        .I2(I2),
        .I3(I3[3]),
        .I4(I1),
        .I5(GT0_RXDATA_OUT[19]),
        .O(D[3]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[21]_i_1 
       (.I0(GT0_RXDATA_OUT[10]),
        .I1(GT0_RXDATA_OUT[2]),
        .I2(I2),
        .I3(I3[2]),
        .I4(I1),
        .I5(GT0_RXDATA_OUT[18]),
        .O(D[2]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[22]_i_1 
       (.I0(GT0_RXDATA_OUT[9]),
        .I1(GT0_RXDATA_OUT[1]),
        .I2(I2),
        .I3(I3[1]),
        .I4(I1),
        .I5(GT0_RXDATA_OUT[17]),
        .O(D[1]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[23]_i_1 
       (.I0(GT0_RXDATA_OUT[8]),
        .I1(GT0_RXDATA_OUT[0]),
        .I2(I2),
        .I3(I3[0]),
        .I4(I1),
        .I5(GT0_RXDATA_OUT[16]),
        .O(D[0]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[24]_i_1 
       (.I0(GT0_RXDATA_OUT[23]),
        .I1(GT0_RXDATA_OUT[15]),
        .I2(I2),
        .I3(GT0_RXDATA_OUT[7]),
        .I4(I1),
        .I5(GT0_RXDATA_OUT[31]),
        .O(O3[7]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[25]_i_1 
       (.I0(GT0_RXDATA_OUT[22]),
        .I1(GT0_RXDATA_OUT[14]),
        .I2(I2),
        .I3(GT0_RXDATA_OUT[6]),
        .I4(I1),
        .I5(GT0_RXDATA_OUT[30]),
        .O(O3[6]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[26]_i_1 
       (.I0(GT0_RXDATA_OUT[21]),
        .I1(GT0_RXDATA_OUT[13]),
        .I2(I2),
        .I3(GT0_RXDATA_OUT[5]),
        .I4(I1),
        .I5(GT0_RXDATA_OUT[29]),
        .O(O3[5]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[27]_i_1 
       (.I0(GT0_RXDATA_OUT[20]),
        .I1(GT0_RXDATA_OUT[12]),
        .I2(I2),
        .I3(GT0_RXDATA_OUT[4]),
        .I4(I1),
        .I5(GT0_RXDATA_OUT[28]),
        .O(O3[4]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[28]_i_1 
       (.I0(GT0_RXDATA_OUT[19]),
        .I1(GT0_RXDATA_OUT[11]),
        .I2(I2),
        .I3(GT0_RXDATA_OUT[3]),
        .I4(I1),
        .I5(GT0_RXDATA_OUT[27]),
        .O(O3[3]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[29]_i_1 
       (.I0(GT0_RXDATA_OUT[18]),
        .I1(GT0_RXDATA_OUT[10]),
        .I2(I2),
        .I3(GT0_RXDATA_OUT[2]),
        .I4(I1),
        .I5(GT0_RXDATA_OUT[26]),
        .O(O3[2]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[30]_i_1 
       (.I0(GT0_RXDATA_OUT[17]),
        .I1(GT0_RXDATA_OUT[9]),
        .I2(I2),
        .I3(GT0_RXDATA_OUT[1]),
        .I4(I1),
        .I5(GT0_RXDATA_OUT[25]),
        .O(O3[1]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \word_aligned_data_r[31]_i_1 
       (.I0(GT0_RXDATA_OUT[16]),
        .I1(GT0_RXDATA_OUT[8]),
        .I2(I2),
        .I3(GT0_RXDATA_OUT[0]),
        .I4(I1),
        .I5(GT0_RXDATA_OUT[24]),
        .O(O3[0]));
endmodule

(* ORIG_REF_NAME = "data_mgt_multi_gt" *) 
module data_mgtdata_mgt_multi_gt__parameterized0
   (O1,
    GT0_RXCHARISK_OUT,
    O2,
    hard_err_gt0,
    GT0_RXBYTEREALIGN_OUT,
    D,
    GT0_RXDATA_OUT,
    O3,
    O4,
    O5,
    GT1_RXCHARISK_OUT,
    O6,
    hard_err_gt0_0,
    GT1_RXBYTEREALIGN_OUT,
    O7,
    GT1_RXDATA_OUT,
    O8,
    O9,
    O10,
    GT0_CPLLREFCLKLOST_OUT,
    GT1_CPLLREFCLKLOST_OUT,
    O11,
    CPLLLOCK,
    O12,
    GT0_RXDISPERR_OUT,
    O13,
    O14,
    O15,
    O16,
    GT1_RXDISPERR_OUT,
    O17,
    O18,
    O19,
    tx_lock,
    O20,
    O21,
    O22,
    O23,
    O24,
    O25,
    DRPRDY_OUT,
    TXN,
    TXP,
    O26,
    GT0_RXRESETDONE_OUT,
    TX_OUT_CLK,
    GT0_TXRESETDONE_OUT,
    DRPDO_OUT,
    GT0_RXCHARISCOMMA_OUT,
    DRPRDY_OUT_LANE1,
    GT1_RXRESETDONE_OUT,
    GT1_TXRESETDONE_OUT,
    DRPDO_OUT_LANE1,
    GT1_RXCHARISCOMMA_OUT,
    I1,
    I2,
    Q,
    I3,
    I4,
    I5,
    I6,
    I7,
    adapt_count_reset,
    rx_cdrlocked,
    I8,
    I9,
    I10,
    init_clk_in,
    GT1_CPLLRESET_IN,
    drpclk_in,
    DRPEN_IN,
    DRPWE_IN,
    GT_REFCLK1,
    SR,
    GT1_GTTXRESET_IN,
    RXN,
    RXP,
    gt_qpllclk_quad1_in,
    gt_qpllrefclk_quad1_in,
    GT0_RXCHBONDEN_IN,
    GT0_RXDFEAGCHOLD_IN,
    ENMCOMMAALIGN_IN,
    GT0_RXPOLARITY_IN,
    GT1_RXUSERRDY_IN,
    SYNC_CLK,
    user_clk,
    POWER_DOWN,
    GT1_TXUSERRDY_IN,
    DRPDI_IN,
    LOOPBACK,
    GT0_TXDATA_IN,
    GT0_TXCHARISK_IN,
    DRPADDR_IN,
    DRPEN_IN_LANE1,
    DRPWE_IN_LANE1,
    ENMCOMMAALIGN_IN_LANE1,
    GT1_RXPOLARITY_IN,
    DRPDI_IN_LANE1,
    GT1_TXDATA_IN,
    GT1_TXCHARISK_IN,
    DRPADDR_IN_LANE1);
  output O1;
  output [3:0]GT0_RXCHARISK_OUT;
  output O2;
  output hard_err_gt0;
  output GT0_RXBYTEREALIGN_OUT;
  output [7:0]D;
  output [31:0]GT0_RXDATA_OUT;
  output [7:0]O3;
  output [7:0]O4;
  output O5;
  output [3:0]GT1_RXCHARISK_OUT;
  output O6;
  output hard_err_gt0_0;
  output GT1_RXBYTEREALIGN_OUT;
  output [7:0]O7;
  output [31:0]GT1_RXDATA_OUT;
  output [7:0]O8;
  output [7:0]O9;
  output O10;
  output GT0_CPLLREFCLKLOST_OUT;
  output GT1_CPLLREFCLKLOST_OUT;
  output O11;
  output CPLLLOCK;
  output O12;
  output [1:0]GT0_RXDISPERR_OUT;
  output O13;
  output O14;
  output O15;
  output O16;
  output [1:0]GT1_RXDISPERR_OUT;
  output O17;
  output O18;
  output O19;
  output tx_lock;
  output O20;
  output O21;
  output O22;
  output O23;
  output O24;
  output O25;
  output DRPRDY_OUT;
  output [0:1]TXN;
  output [0:1]TXP;
  output [1:0]O26;
  output GT0_RXRESETDONE_OUT;
  output TX_OUT_CLK;
  output GT0_TXRESETDONE_OUT;
  output [15:0]DRPDO_OUT;
  output [3:0]GT0_RXCHARISCOMMA_OUT;
  output DRPRDY_OUT_LANE1;
  output GT1_RXRESETDONE_OUT;
  output GT1_TXRESETDONE_OUT;
  output [15:0]DRPDO_OUT_LANE1;
  output [3:0]GT1_RXCHARISCOMMA_OUT;
  input I1;
  input I2;
  input [0:0]Q;
  input [7:0]I3;
  input I4;
  input I5;
  input [0:0]I6;
  input [7:0]I7;
  input adapt_count_reset;
  input rx_cdrlocked;
  input I8;
  input I9;
  input I10;
  input init_clk_in;
  input GT1_CPLLRESET_IN;
  input drpclk_in;
  input DRPEN_IN;
  input DRPWE_IN;
  input GT_REFCLK1;
  input [0:0]SR;
  input GT1_GTTXRESET_IN;
  input [0:1]RXN;
  input [0:1]RXP;
  input gt_qpllclk_quad1_in;
  input gt_qpllrefclk_quad1_in;
  input GT0_RXCHBONDEN_IN;
  input GT0_RXDFEAGCHOLD_IN;
  input ENMCOMMAALIGN_IN;
  input GT0_RXPOLARITY_IN;
  input GT1_RXUSERRDY_IN;
  input SYNC_CLK;
  input user_clk;
  input POWER_DOWN;
  input GT1_TXUSERRDY_IN;
  input [15:0]DRPDI_IN;
  input [2:0]LOOPBACK;
  input [31:0]GT0_TXDATA_IN;
  input [3:0]GT0_TXCHARISK_IN;
  input [8:0]DRPADDR_IN;
  input DRPEN_IN_LANE1;
  input DRPWE_IN_LANE1;
  input ENMCOMMAALIGN_IN_LANE1;
  input GT1_RXPOLARITY_IN;
  input [15:0]DRPDI_IN_LANE1;
  input [31:0]GT1_TXDATA_IN;
  input [3:0]GT1_TXCHARISK_IN;
  input [8:0]DRPADDR_IN_LANE1;

  wire CPLLLOCK;
  wire [7:0]D;
  wire [8:0]DRPADDR_IN;
  wire [8:0]DRPADDR_IN_LANE1;
  wire [15:0]DRPDI_IN;
  wire [15:0]DRPDI_IN_LANE1;
  wire [15:0]DRPDO_OUT;
  wire [15:0]DRPDO_OUT_LANE1;
  wire DRPEN_IN;
  wire DRPEN_IN_LANE1;
  wire DRPRDY_OUT;
  wire DRPRDY_OUT_LANE1;
  wire DRPWE_IN;
  wire DRPWE_IN_LANE1;
  wire ENMCOMMAALIGN_IN;
  wire ENMCOMMAALIGN_IN_LANE1;
  wire GT0_CPLLREFCLKLOST_OUT;
  wire GT0_RXBYTEREALIGN_OUT;
  wire [3:0]GT0_RXCHARISCOMMA_OUT;
  wire [3:0]GT0_RXCHARISK_OUT;
  wire GT0_RXCHBONDEN_IN;
  wire [31:0]GT0_RXDATA_OUT;
  wire GT0_RXDFEAGCHOLD_IN;
  wire [1:0]GT0_RXDISPERR_OUT;
  wire GT0_RXPOLARITY_IN;
  wire GT0_RXRESETDONE_OUT;
  wire [3:0]GT0_TXCHARISK_IN;
  wire [31:0]GT0_TXDATA_IN;
  wire GT0_TXRESETDONE_OUT;
  wire GT1_CPLLREFCLKLOST_OUT;
  wire GT1_CPLLRESET_IN;
  wire GT1_GTTXRESET_IN;
  wire GT1_RXBYTEREALIGN_OUT;
  wire [3:0]GT1_RXCHARISCOMMA_OUT;
  wire [3:0]GT1_RXCHARISK_OUT;
  wire [4:0]GT1_RXCHBONDI_IN;
  wire [31:0]GT1_RXDATA_OUT;
  wire [1:0]GT1_RXDISPERR_OUT;
  wire GT1_RXPOLARITY_IN;
  wire GT1_RXRESETDONE_OUT;
  wire GT1_RXUSERRDY_IN;
  wire [3:0]GT1_TXCHARISK_IN;
  wire [31:0]GT1_TXDATA_IN;
  wire GT1_TXRESETDONE_OUT;
  wire GT1_TXUSERRDY_IN;
  wire GT_REFCLK1;
  wire I1;
  wire I10;
  wire I2;
  wire [7:0]I3;
  wire I4;
  wire I5;
  wire [0:0]I6;
  wire [7:0]I7;
  wire I8;
  wire I9;
  wire [2:0]LOOPBACK;
  wire O1;
  wire O10;
  wire O11;
  wire O12;
  wire O13;
  wire O14;
  wire O15;
  wire O16;
  wire O17;
  wire O18;
  wire O19;
  wire O2;
  wire O20;
  wire O21;
  wire O22;
  wire O23;
  wire O24;
  wire O25;
  wire [1:0]O26;
  wire [7:0]O3;
  wire [7:0]O4;
  wire O5;
  wire O6;
  wire [7:0]O7;
  wire [7:0]O8;
  wire [7:0]O9;
  wire PLLLKDET_OUT;
  wire PLLLKDET_OUT_LANE1;
  wire POWER_DOWN;
  wire [0:0]Q;
  wire [0:1]RXN;
  wire [0:1]RXP;
  wire [0:0]SR;
  wire SYNC_CLK;
  wire [0:1]TXN;
  wire [0:1]TXP;
  wire TX_OUT_CLK;
  wire adapt_count_reset;
  wire drpclk_in;
  wire gt_qpllclk_quad1_in;
  wire gt_qpllrefclk_quad1_in;
  wire hard_err_gt0;
  wire hard_err_gt0_0;
  wire init_clk_in;
  wire rx_cdrlocked;
  wire tx_lock;
  wire user_clk;

data_mgtdata_mgt_gt__parameterized0_14 gt0_data_mgt_i
       (.CPLLLOCK(CPLLLOCK),
        .D(D),
        .DRPADDR_IN(DRPADDR_IN),
        .DRPDI_IN(DRPDI_IN),
        .DRPDO_OUT(DRPDO_OUT),
        .DRPEN_IN(DRPEN_IN),
        .DRPRDY_OUT(DRPRDY_OUT),
        .DRPWE_IN(DRPWE_IN),
        .ENMCOMMAALIGN_IN(ENMCOMMAALIGN_IN),
        .GT0_CPLLREFCLKLOST_OUT(GT0_CPLLREFCLKLOST_OUT),
        .GT0_RXBYTEREALIGN_OUT(GT0_RXBYTEREALIGN_OUT),
        .GT0_RXCHARISCOMMA_OUT(GT0_RXCHARISCOMMA_OUT),
        .GT0_RXCHBONDEN_IN(GT0_RXCHBONDEN_IN),
        .GT0_RXDATA_OUT(GT0_RXDATA_OUT),
        .GT0_RXDFEAGCHOLD_IN(GT0_RXDFEAGCHOLD_IN),
        .GT0_RXDISPERR_OUT(GT0_RXDISPERR_OUT),
        .GT0_RXPOLARITY_IN(GT0_RXPOLARITY_IN),
        .GT0_RXRESETDONE_OUT(GT0_RXRESETDONE_OUT),
        .GT0_TXCHARISK_IN(GT0_TXCHARISK_IN),
        .GT0_TXDATA_IN(GT0_TXDATA_IN),
        .GT0_TXRESETDONE_OUT(GT0_TXRESETDONE_OUT),
        .GT1_CPLLREFCLKLOST_OUT(GT1_CPLLREFCLKLOST_OUT),
        .GT1_CPLLRESET_IN(GT1_CPLLRESET_IN),
        .GT1_GTTXRESET_IN(GT1_GTTXRESET_IN),
        .GT1_RXUSERRDY_IN(GT1_RXUSERRDY_IN),
        .GT1_TXUSERRDY_IN(GT1_TXUSERRDY_IN),
        .GT_REFCLK1(GT_REFCLK1),
        .I1(I1),
        .I2(I2),
        .I3(I3),
        .I8(I8),
        .I9(I9),
        .LOOPBACK(LOOPBACK),
        .O1(O1),
        .O10(O10),
        .O12(O12),
        .O13(O13),
        .O14(O14),
        .O15(O15),
        .O2(O2),
        .O20(O20),
        .O22(O22),
        .O23(O23),
        .O26(O26[0]),
        .O3(O3),
        .O4(O4),
        .PLLLKDET_OUT(PLLLKDET_OUT),
        .PLLLKDET_OUT_LANE1(PLLLKDET_OUT_LANE1),
        .POWER_DOWN(POWER_DOWN),
        .Q(Q),
        .RXCHARISK(GT0_RXCHARISK_OUT),
        .RXCHBONDO(GT1_RXCHBONDI_IN),
        .RXN(RXN[0]),
        .RXP(RXP[0]),
        .SR(SR),
        .SYNC_CLK(SYNC_CLK),
        .TXN(TXN[0]),
        .TXP(TXP[0]),
        .TX_OUT_CLK(TX_OUT_CLK),
        .adapt_count_reset(adapt_count_reset),
        .drpclk_in(drpclk_in),
        .gt_qpllclk_quad1_in(gt_qpllclk_quad1_in),
        .gt_qpllrefclk_quad1_in(gt_qpllrefclk_quad1_in),
        .hard_err_gt0(hard_err_gt0),
        .init_clk_in(init_clk_in),
        .rx_cdrlocked(rx_cdrlocked),
        .user_clk(user_clk));
data_mgtdata_mgt_gt__parameterized0 gt1_data_mgt_i
       (.DRPADDR_IN_LANE1(DRPADDR_IN_LANE1),
        .DRPDI_IN_LANE1(DRPDI_IN_LANE1),
        .DRPDO_OUT_LANE1(DRPDO_OUT_LANE1),
        .DRPEN_IN_LANE1(DRPEN_IN_LANE1),
        .DRPRDY_OUT_LANE1(DRPRDY_OUT_LANE1),
        .DRPWE_IN_LANE1(DRPWE_IN_LANE1),
        .ENMCOMMAALIGN_IN_LANE1(ENMCOMMAALIGN_IN_LANE1),
        .GT0_CPLLREFCLKLOST_OUT(GT0_CPLLREFCLKLOST_OUT),
        .GT0_RXDFEAGCHOLD_IN(GT0_RXDFEAGCHOLD_IN),
        .GT1_CPLLREFCLKLOST_OUT(GT1_CPLLREFCLKLOST_OUT),
        .GT1_CPLLRESET_IN(GT1_CPLLRESET_IN),
        .GT1_GTTXRESET_IN(GT1_GTTXRESET_IN),
        .GT1_RXBYTEREALIGN_OUT(GT1_RXBYTEREALIGN_OUT),
        .GT1_RXCHARISCOMMA_OUT(GT1_RXCHARISCOMMA_OUT),
        .GT1_RXDATA_OUT(GT1_RXDATA_OUT),
        .GT1_RXDISPERR_OUT(GT1_RXDISPERR_OUT),
        .GT1_RXPOLARITY_IN(GT1_RXPOLARITY_IN),
        .GT1_RXRESETDONE_OUT(GT1_RXRESETDONE_OUT),
        .GT1_RXUSERRDY_IN(GT1_RXUSERRDY_IN),
        .GT1_TXCHARISK_IN(GT1_TXCHARISK_IN),
        .GT1_TXDATA_IN(GT1_TXDATA_IN),
        .GT1_TXRESETDONE_OUT(GT1_TXRESETDONE_OUT),
        .GT1_TXUSERRDY_IN(GT1_TXUSERRDY_IN),
        .GT_REFCLK1(GT_REFCLK1),
        .I10(I10),
        .I4(I4),
        .I5(I5),
        .I6(I6),
        .I7(I7),
        .LOOPBACK(LOOPBACK),
        .O11(O11),
        .O16(O16),
        .O17(O17),
        .O18(O18),
        .O19(O19),
        .O21(O21),
        .O24(O24),
        .O25(O25),
        .O26(O26[1]),
        .O5(O5),
        .O6(O6),
        .O7(O7),
        .O8(O8),
        .O9(O9),
        .PLLLKDET_OUT(PLLLKDET_OUT),
        .PLLLKDET_OUT_LANE1(PLLLKDET_OUT_LANE1),
        .POWER_DOWN(POWER_DOWN),
        .RXCHARISK(GT1_RXCHARISK_OUT),
        .RXCHBONDO(GT1_RXCHBONDI_IN),
        .RXN(RXN[1]),
        .RXP(RXP[1]),
        .SR(SR),
        .SYNC_CLK(SYNC_CLK),
        .TXN(TXN[1]),
        .TXP(TXP[1]),
        .drpclk_in(drpclk_in),
        .gt_qpllclk_quad1_in(gt_qpllclk_quad1_in),
        .gt_qpllrefclk_quad1_in(gt_qpllrefclk_quad1_in),
        .hard_err_gt0_0(hard_err_gt0_0),
        .init_clk_in(init_clk_in),
        .tx_lock(tx_lock),
        .user_clk(user_clk));
endmodule

(* ORIG_REF_NAME = "data_mgt_rx_startup_fsm" *) 
module data_mgtdata_mgt_rx_startup_fsm__parameterized0
   (RXUSERRDY,
    GTRXRESET,
    O1,
    O2,
    adapt_count_reset,
    init_clk_in,
    user_clk,
    rxfsm_data_valid_r,
    rxfsm_rxresetdone_r,
    cplllock_sync,
    rx_cdrlocked,
    I1,
    GT1_CPLLREFCLKLOST_OUT,
    GT0_CPLLREFCLKLOST_OUT,
    rxfsm_soft_reset_r,
    I2,
    TXUSERRDY,
    I3,
    SR);
  output RXUSERRDY;
  output GTRXRESET;
  output O1;
  output O2;
  output adapt_count_reset;
  input init_clk_in;
  input user_clk;
  input rxfsm_data_valid_r;
  input rxfsm_rxresetdone_r;
  input cplllock_sync;
  input rx_cdrlocked;
  input I1;
  input GT1_CPLLREFCLKLOST_OUT;
  input GT0_CPLLREFCLKLOST_OUT;
  input rxfsm_soft_reset_r;
  input I2;
  input TXUSERRDY;
  input I3;
  input [0:0]SR;

  wire \<const0> ;
  wire \<const1> ;
  wire GT0_CPLLREFCLKLOST_OUT;
  wire GT0_RXDFELFHOLD_IN;
  wire GT1_CPLLREFCLKLOST_OUT;
  wire GTRXRESET;
  wire I1;
  wire I2;
  wire I3;
  wire O1;
  wire O2;
  wire RXUSERRDY;
  wire [0:0]SR;
  wire TXUSERRDY;
  wire adapt_count_reset;
  wire [18:0]\adapt_wait_hw.adapt_count_reg ;
  wire cplllock_sync;
  wire init_clk_in;
  wire [5:0]init_wait_count_reg__0;
  wire init_wait_done;
  wire [9:0]mmcm_lock_count_reg__0;
  wire mmcm_lock_reclocked;
  wire \n_0_FSM_onehot_rx_state[1]_i_2 ;
  wire \n_0_FSM_onehot_rx_state[1]_i_4 ;
  wire \n_0_FSM_onehot_rx_state[1]_i_5 ;
  wire \n_0_FSM_onehot_rx_state[1]_i_6 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_1 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_2 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_3 ;
  wire \n_0_FSM_onehot_rx_state[3]_i_1 ;
  wire \n_0_FSM_onehot_rx_state[3]_i_2 ;
  wire \n_0_FSM_onehot_rx_state[4]_i_1 ;
  wire \n_0_FSM_onehot_rx_state[5]_i_1 ;
  wire \n_0_FSM_onehot_rx_state[6]_i_1 ;
  wire \n_0_FSM_onehot_rx_state[6]_i_2 ;
  wire \n_0_FSM_onehot_rx_state[7]_i_1 ;
  wire \n_0_FSM_onehot_rx_state[7]_i_2 ;
  wire \n_0_FSM_onehot_rx_state[7]_i_3 ;
  wire \n_0_FSM_onehot_rx_state[8]_i_1 ;
  wire \n_0_FSM_onehot_rx_state[8]_i_10 ;
  wire \n_0_FSM_onehot_rx_state[8]_i_11 ;
  wire \n_0_FSM_onehot_rx_state[8]_i_14 ;
  wire \n_0_FSM_onehot_rx_state[8]_i_15 ;
  wire \n_0_FSM_onehot_rx_state[8]_i_16 ;
  wire \n_0_FSM_onehot_rx_state[8]_i_5 ;
  wire \n_0_FSM_onehot_rx_state[8]_i_7 ;
  wire \n_0_FSM_onehot_rx_state[8]_i_9 ;
  wire \n_0_FSM_onehot_rx_state_reg[0] ;
  wire \n_0_FSM_onehot_rx_state_reg[1] ;
  wire \n_0_FSM_onehot_rx_state_reg[2] ;
  wire \n_0_FSM_onehot_rx_state_reg[3] ;
  wire \n_0_FSM_onehot_rx_state_reg[4] ;
  wire \n_0_FSM_onehot_rx_state_reg[5] ;
  wire \n_0_FSM_onehot_rx_state_reg[6] ;
  wire \n_0_FSM_onehot_rx_state_reg[7] ;
  wire \n_0_FSM_onehot_rx_state_reg[8] ;
  wire n_0_GTRXRESET_i_1;
  wire n_0_GTRXRESET_i_2;
  wire n_0_RXDFEAGCHOLD_i_1;
  wire n_0_RXDFEAGCHOLD_i_3;
  wire n_0_RXDFEAGCHOLD_rep_i_1;
  wire n_0_RXUSERRDY_i_1;
  wire n_0_RXUSERRDY_i_2;
  wire n_0_adapt_count_reset_i_1;
  wire n_0_adapt_count_reset_i_2;
  wire \n_0_adapt_wait_hw.adapt_count[0]_i_1 ;
  wire \n_0_adapt_wait_hw.adapt_count[0]_i_3 ;
  wire \n_0_adapt_wait_hw.adapt_count[0]_i_4 ;
  wire \n_0_adapt_wait_hw.adapt_count[0]_i_5 ;
  wire \n_0_adapt_wait_hw.adapt_count[0]_i_6 ;
  wire \n_0_adapt_wait_hw.adapt_count[12]_i_2 ;
  wire \n_0_adapt_wait_hw.adapt_count[12]_i_3 ;
  wire \n_0_adapt_wait_hw.adapt_count[12]_i_4 ;
  wire \n_0_adapt_wait_hw.adapt_count[12]_i_5 ;
  wire \n_0_adapt_wait_hw.adapt_count[16]_i_2 ;
  wire \n_0_adapt_wait_hw.adapt_count[16]_i_3 ;
  wire \n_0_adapt_wait_hw.adapt_count[16]_i_4 ;
  wire \n_0_adapt_wait_hw.adapt_count[4]_i_2 ;
  wire \n_0_adapt_wait_hw.adapt_count[4]_i_3 ;
  wire \n_0_adapt_wait_hw.adapt_count[4]_i_4 ;
  wire \n_0_adapt_wait_hw.adapt_count[4]_i_5 ;
  wire \n_0_adapt_wait_hw.adapt_count[8]_i_2 ;
  wire \n_0_adapt_wait_hw.adapt_count[8]_i_3 ;
  wire \n_0_adapt_wait_hw.adapt_count[8]_i_4 ;
  wire \n_0_adapt_wait_hw.adapt_count[8]_i_5 ;
  wire \n_0_adapt_wait_hw.adapt_count_reg[0]_i_2 ;
  wire \n_0_adapt_wait_hw.adapt_count_reg[12]_i_1 ;
  wire \n_0_adapt_wait_hw.adapt_count_reg[4]_i_1 ;
  wire \n_0_adapt_wait_hw.adapt_count_reg[8]_i_1 ;
  wire \n_0_adapt_wait_hw.time_out_adapt_i_1 ;
  wire \n_0_adapt_wait_hw.time_out_adapt_i_2 ;
  wire \n_0_adapt_wait_hw.time_out_adapt_i_3 ;
  wire \n_0_adapt_wait_hw.time_out_adapt_i_4 ;
  wire n_0_check_tlock_max_i_1;
  wire n_0_check_tlock_max_reg;
  wire n_0_data_valid_cdc_sync;
  wire \n_0_init_wait_count[5]_i_1__0 ;
  wire n_0_init_wait_done_i_1__0;
  wire n_0_init_wait_done_i_2__0;
  wire \n_0_mmcm_lock_count[9]_i_1__0 ;
  wire \n_0_mmcm_lock_count[9]_i_3__0 ;
  wire \n_0_mmcm_lock_count[9]_i_4 ;
  wire n_0_mmcm_lock_reclocked_i_1__0;
  wire n_0_reset_time_out_i_2__0;
  wire n_0_reset_time_out_i_6;
  wire n_0_reset_time_out_reg;
  wire n_0_run_phase_alignment_int_cdc_sync;
  wire n_0_run_phase_alignment_int_i_1__0;
  wire n_0_run_phase_alignment_int_reg;
  wire n_0_run_phase_alignment_int_s3_reg;
  wire n_0_rx_fsm_reset_done_int_cdc_sync;
  wire n_0_rx_fsm_reset_done_int_i_3;
  wire n_0_rxresetdone_cdc_sync;
  wire n_0_time_out_100us_i_1;
  wire n_0_time_out_100us_i_2;
  wire n_0_time_out_100us_i_3;
  wire n_0_time_out_100us_i_4;
  wire n_0_time_out_100us_i_5;
  wire n_0_time_out_1us_i_1;
  wire n_0_time_out_1us_i_2;
  wire n_0_time_out_1us_i_3;
  wire n_0_time_out_1us_i_4;
  wire n_0_time_out_1us_i_5;
  wire n_0_time_out_2ms_i_1;
  wire n_0_time_out_2ms_i_2__0;
  wire n_0_time_out_2ms_i_3;
  wire n_0_time_out_2ms_i_4;
  wire n_0_time_out_2ms_i_5;
  wire \n_0_time_out_counter[0]_i_1__0 ;
  wire \n_0_time_out_counter[0]_i_3__0 ;
  wire \n_0_time_out_counter[0]_i_4__0 ;
  wire \n_0_time_out_counter[0]_i_5__0 ;
  wire \n_0_time_out_counter[0]_i_6__0 ;
  wire \n_0_time_out_counter[0]_i_7 ;
  wire \n_0_time_out_counter[0]_i_8 ;
  wire \n_0_time_out_counter[12]_i_2__0 ;
  wire \n_0_time_out_counter[12]_i_3__0 ;
  wire \n_0_time_out_counter[12]_i_4__0 ;
  wire \n_0_time_out_counter[12]_i_5__0 ;
  wire \n_0_time_out_counter[16]_i_2__0 ;
  wire \n_0_time_out_counter[16]_i_3 ;
  wire \n_0_time_out_counter[4]_i_2__0 ;
  wire \n_0_time_out_counter[4]_i_3__0 ;
  wire \n_0_time_out_counter[4]_i_4__0 ;
  wire \n_0_time_out_counter[4]_i_5__0 ;
  wire \n_0_time_out_counter[8]_i_2__0 ;
  wire \n_0_time_out_counter[8]_i_3__0 ;
  wire \n_0_time_out_counter[8]_i_4__0 ;
  wire \n_0_time_out_counter[8]_i_5__0 ;
  wire \n_0_time_out_counter_reg[0]_i_2__0 ;
  wire \n_0_time_out_counter_reg[12]_i_1__0 ;
  wire \n_0_time_out_counter_reg[4]_i_1__0 ;
  wire \n_0_time_out_counter_reg[8]_i_1__0 ;
  wire n_0_time_out_wait_bypass_cdc_sync;
  wire n_0_time_out_wait_bypass_i_1__0;
  wire n_0_time_out_wait_bypass_reg;
  wire n_0_time_tlock_max_i_1;
  wire n_0_time_tlock_max_i_10;
  wire n_0_time_tlock_max_i_3;
  wire n_0_time_tlock_max_i_4;
  wire n_0_time_tlock_max_i_5;
  wire n_0_time_tlock_max_i_6;
  wire n_0_time_tlock_max_i_7;
  wire n_0_time_tlock_max_i_8;
  wire n_0_time_tlock_max_i_9;
  wire \n_0_wait_bypass_count[0]_i_1__0 ;
  wire \n_0_wait_bypass_count[0]_i_2__0 ;
  wire \n_0_wait_bypass_count[0]_i_4 ;
  wire \n_0_wait_bypass_count[0]_i_5 ;
  wire \n_0_wait_bypass_count[0]_i_6__0 ;
  wire \n_0_wait_bypass_count[0]_i_7__0 ;
  wire \n_0_wait_bypass_count[0]_i_8 ;
  wire \n_0_wait_bypass_count[0]_i_9 ;
  wire \n_0_wait_bypass_count[12]_i_2__0 ;
  wire \n_0_wait_bypass_count[4]_i_2__0 ;
  wire \n_0_wait_bypass_count[4]_i_3__0 ;
  wire \n_0_wait_bypass_count[4]_i_4__0 ;
  wire \n_0_wait_bypass_count[4]_i_5__0 ;
  wire \n_0_wait_bypass_count[8]_i_2__0 ;
  wire \n_0_wait_bypass_count[8]_i_3__0 ;
  wire \n_0_wait_bypass_count[8]_i_4__0 ;
  wire \n_0_wait_bypass_count[8]_i_5__0 ;
  wire \n_0_wait_bypass_count_reg[0]_i_3__0 ;
  wire \n_0_wait_bypass_count_reg[4]_i_1__0 ;
  wire \n_0_wait_bypass_count_reg[8]_i_1__0 ;
  wire \n_1_adapt_wait_hw.adapt_count_reg[0]_i_2 ;
  wire \n_1_adapt_wait_hw.adapt_count_reg[12]_i_1 ;
  wire \n_1_adapt_wait_hw.adapt_count_reg[4]_i_1 ;
  wire \n_1_adapt_wait_hw.adapt_count_reg[8]_i_1 ;
  wire n_1_data_valid_cdc_sync;
  wire \n_1_time_out_counter_reg[0]_i_2__0 ;
  wire \n_1_time_out_counter_reg[12]_i_1__0 ;
  wire \n_1_time_out_counter_reg[4]_i_1__0 ;
  wire \n_1_time_out_counter_reg[8]_i_1__0 ;
  wire n_1_time_tlock_max_reg_i_2;
  wire \n_1_wait_bypass_count_reg[0]_i_3__0 ;
  wire \n_1_wait_bypass_count_reg[4]_i_1__0 ;
  wire \n_1_wait_bypass_count_reg[8]_i_1__0 ;
  wire \n_2_adapt_wait_hw.adapt_count_reg[0]_i_2 ;
  wire \n_2_adapt_wait_hw.adapt_count_reg[12]_i_1 ;
  wire \n_2_adapt_wait_hw.adapt_count_reg[16]_i_1 ;
  wire \n_2_adapt_wait_hw.adapt_count_reg[4]_i_1 ;
  wire \n_2_adapt_wait_hw.adapt_count_reg[8]_i_1 ;
  wire n_2_data_valid_cdc_sync;
  wire \n_2_time_out_counter_reg[0]_i_2__0 ;
  wire \n_2_time_out_counter_reg[12]_i_1__0 ;
  wire \n_2_time_out_counter_reg[4]_i_1__0 ;
  wire \n_2_time_out_counter_reg[8]_i_1__0 ;
  wire n_2_time_tlock_max_reg_i_2;
  wire \n_2_wait_bypass_count_reg[0]_i_3__0 ;
  wire \n_2_wait_bypass_count_reg[4]_i_1__0 ;
  wire \n_2_wait_bypass_count_reg[8]_i_1__0 ;
  wire \n_3_adapt_wait_hw.adapt_count_reg[0]_i_2 ;
  wire \n_3_adapt_wait_hw.adapt_count_reg[12]_i_1 ;
  wire \n_3_adapt_wait_hw.adapt_count_reg[16]_i_1 ;
  wire \n_3_adapt_wait_hw.adapt_count_reg[4]_i_1 ;
  wire \n_3_adapt_wait_hw.adapt_count_reg[8]_i_1 ;
  wire n_3_data_valid_cdc_sync;
  wire \n_3_time_out_counter_reg[0]_i_2__0 ;
  wire \n_3_time_out_counter_reg[12]_i_1__0 ;
  wire \n_3_time_out_counter_reg[16]_i_1__0 ;
  wire \n_3_time_out_counter_reg[4]_i_1__0 ;
  wire \n_3_time_out_counter_reg[8]_i_1__0 ;
  wire n_3_time_tlock_max_reg_i_2;
  wire \n_3_wait_bypass_count_reg[0]_i_3__0 ;
  wire \n_3_wait_bypass_count_reg[4]_i_1__0 ;
  wire \n_3_wait_bypass_count_reg[8]_i_1__0 ;
  wire \n_4_adapt_wait_hw.adapt_count_reg[0]_i_2 ;
  wire \n_4_adapt_wait_hw.adapt_count_reg[12]_i_1 ;
  wire \n_4_adapt_wait_hw.adapt_count_reg[4]_i_1 ;
  wire \n_4_adapt_wait_hw.adapt_count_reg[8]_i_1 ;
  wire n_4_data_valid_cdc_sync;
  wire \n_4_time_out_counter_reg[0]_i_2__0 ;
  wire \n_4_time_out_counter_reg[12]_i_1__0 ;
  wire \n_4_time_out_counter_reg[4]_i_1__0 ;
  wire \n_4_time_out_counter_reg[8]_i_1__0 ;
  wire \n_4_wait_bypass_count_reg[0]_i_3__0 ;
  wire \n_4_wait_bypass_count_reg[4]_i_1__0 ;
  wire \n_4_wait_bypass_count_reg[8]_i_1__0 ;
  wire \n_5_adapt_wait_hw.adapt_count_reg[0]_i_2 ;
  wire \n_5_adapt_wait_hw.adapt_count_reg[12]_i_1 ;
  wire \n_5_adapt_wait_hw.adapt_count_reg[16]_i_1 ;
  wire \n_5_adapt_wait_hw.adapt_count_reg[4]_i_1 ;
  wire \n_5_adapt_wait_hw.adapt_count_reg[8]_i_1 ;
  wire \n_5_time_out_counter_reg[0]_i_2__0 ;
  wire \n_5_time_out_counter_reg[12]_i_1__0 ;
  wire \n_5_time_out_counter_reg[4]_i_1__0 ;
  wire \n_5_time_out_counter_reg[8]_i_1__0 ;
  wire \n_5_wait_bypass_count_reg[0]_i_3__0 ;
  wire \n_5_wait_bypass_count_reg[4]_i_1__0 ;
  wire \n_5_wait_bypass_count_reg[8]_i_1__0 ;
  wire \n_6_adapt_wait_hw.adapt_count_reg[0]_i_2 ;
  wire \n_6_adapt_wait_hw.adapt_count_reg[12]_i_1 ;
  wire \n_6_adapt_wait_hw.adapt_count_reg[16]_i_1 ;
  wire \n_6_adapt_wait_hw.adapt_count_reg[4]_i_1 ;
  wire \n_6_adapt_wait_hw.adapt_count_reg[8]_i_1 ;
  wire \n_6_time_out_counter_reg[0]_i_2__0 ;
  wire \n_6_time_out_counter_reg[12]_i_1__0 ;
  wire \n_6_time_out_counter_reg[16]_i_1__0 ;
  wire \n_6_time_out_counter_reg[4]_i_1__0 ;
  wire \n_6_time_out_counter_reg[8]_i_1__0 ;
  wire \n_6_wait_bypass_count_reg[0]_i_3__0 ;
  wire \n_6_wait_bypass_count_reg[4]_i_1__0 ;
  wire \n_6_wait_bypass_count_reg[8]_i_1__0 ;
  wire \n_7_adapt_wait_hw.adapt_count_reg[0]_i_2 ;
  wire \n_7_adapt_wait_hw.adapt_count_reg[12]_i_1 ;
  wire \n_7_adapt_wait_hw.adapt_count_reg[16]_i_1 ;
  wire \n_7_adapt_wait_hw.adapt_count_reg[4]_i_1 ;
  wire \n_7_adapt_wait_hw.adapt_count_reg[8]_i_1 ;
  wire \n_7_time_out_counter_reg[0]_i_2__0 ;
  wire \n_7_time_out_counter_reg[12]_i_1__0 ;
  wire \n_7_time_out_counter_reg[16]_i_1__0 ;
  wire \n_7_time_out_counter_reg[4]_i_1__0 ;
  wire \n_7_time_out_counter_reg[8]_i_1__0 ;
  wire \n_7_wait_bypass_count_reg[0]_i_3__0 ;
  wire \n_7_wait_bypass_count_reg[12]_i_1__0 ;
  wire \n_7_wait_bypass_count_reg[4]_i_1__0 ;
  wire \n_7_wait_bypass_count_reg[8]_i_1__0 ;
  wire [5:0]p_0_in__0;
  wire [9:0]p_0_in__3;
  wire recclk_mon_count_reset;
  wire rx_cdrlocked;
  wire rx_fsm_reset_done_int;
  wire rx_fsm_reset_done_int_s3;
  wire rxfsm_data_valid_r;
  wire rxfsm_rxresetdone_r;
  wire rxfsm_soft_reset_r;
  wire rxresetdone_s3;
  wire time_out_100us;
  wire time_out_1us;
  wire time_out_2ms;
  wire time_out_adapt;
  wire [17:0]time_out_counter_reg;
  wire time_out_wait_bypass1_out;
  wire time_out_wait_bypass_s3;
  wire time_tlock_max;
  wire time_tlock_max1;
  wire user_clk;
  wire [12:0]wait_bypass_count_reg;
  wire [3:2]\NLW_adapt_wait_hw.adapt_count_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_adapt_wait_hw.adapt_count_reg[16]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_time_out_counter_reg[16]_i_1__0_CO_UNCONNECTED ;
  wire [3:2]\NLW_time_out_counter_reg[16]_i_1__0_O_UNCONNECTED ;
  wire [3:0]NLW_time_tlock_max_reg_i_2_O_UNCONNECTED;
  wire [3:0]\NLW_wait_bypass_count_reg[12]_i_1__0_CO_UNCONNECTED ;
  wire [3:1]\NLW_wait_bypass_count_reg[12]_i_1__0_O_UNCONNECTED ;

LUT6 #(
    .INIT(64'hAAC0AA00AA00AA00)) 
     \FSM_onehot_rx_state[1]_i_2 
       (.I0(\n_0_FSM_onehot_rx_state[8]_i_7 ),
        .I1(\n_0_FSM_onehot_rx_state[2]_i_2 ),
        .I2(time_out_2ms),
        .I3(\n_0_FSM_onehot_rx_state_reg[0] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I5(\n_0_FSM_onehot_rx_state[8]_i_11 ),
        .O(\n_0_FSM_onehot_rx_state[1]_i_2 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFBF00)) 
     \FSM_onehot_rx_state[1]_i_4 
       (.I0(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I1(\n_0_FSM_onehot_rx_state[2]_i_2 ),
        .I2(\n_0_FSM_onehot_rx_state[1]_i_6 ),
        .I3(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I5(\n_0_FSM_onehot_rx_state[7]_i_3 ),
        .O(\n_0_FSM_onehot_rx_state[1]_i_4 ));
LUT2 #(
    .INIT(4'h2)) 
     \FSM_onehot_rx_state[1]_i_5 
       (.I0(time_out_2ms),
        .I1(n_0_reset_time_out_reg),
        .O(\n_0_FSM_onehot_rx_state[1]_i_5 ));
(* SOFT_HLUTNM = "soft_lutpair59" *) 
   LUT2 #(
    .INIT(4'h2)) 
     \FSM_onehot_rx_state[1]_i_6 
       (.I0(time_tlock_max),
        .I1(n_0_reset_time_out_reg),
        .O(\n_0_FSM_onehot_rx_state[1]_i_6 ));
LUT6 #(
    .INIT(64'h0000000400000000)) 
     \FSM_onehot_rx_state[2]_i_1 
       (.I0(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I1(\n_0_FSM_onehot_rx_state[2]_i_2 ),
        .I2(\n_0_FSM_onehot_rx_state[7]_i_3 ),
        .I3(\n_0_FSM_onehot_rx_state[2]_i_3 ),
        .I4(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I5(\n_0_FSM_onehot_rx_state_reg[1] ),
        .O(\n_0_FSM_onehot_rx_state[2]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair56" *) 
   LUT2 #(
    .INIT(4'h1)) 
     \FSM_onehot_rx_state[2]_i_2 
       (.I0(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[6] ),
        .O(\n_0_FSM_onehot_rx_state[2]_i_2 ));
LUT2 #(
    .INIT(4'hE)) 
     \FSM_onehot_rx_state[2]_i_3 
       (.I0(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[4] ),
        .O(\n_0_FSM_onehot_rx_state[2]_i_3 ));
LUT6 #(
    .INIT(64'h0004000000000000)) 
     \FSM_onehot_rx_state[3]_i_1 
       (.I0(time_out_2ms),
        .I1(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[0] ),
        .I4(\n_0_FSM_onehot_rx_state[8]_i_11 ),
        .I5(\n_0_FSM_onehot_rx_state[3]_i_2 ),
        .O(\n_0_FSM_onehot_rx_state[3]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair56" *) 
   LUT3 #(
    .INIT(8'h01)) 
     \FSM_onehot_rx_state[3]_i_2 
       (.I0(\n_0_FSM_onehot_rx_state_reg[6] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[8] ),
        .O(\n_0_FSM_onehot_rx_state[3]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair52" *) 
   LUT4 #(
    .INIT(16'h0008)) 
     \FSM_onehot_rx_state[4]_i_1 
       (.I0(\n_0_FSM_onehot_rx_state[6]_i_2 ),
        .I1(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[4] ),
        .O(\n_0_FSM_onehot_rx_state[4]_i_1 ));
LUT6 #(
    .INIT(64'h0000000000008A00)) 
     \FSM_onehot_rx_state[5]_i_1 
       (.I0(\n_0_FSM_onehot_rx_state[6]_i_2 ),
        .I1(n_0_reset_time_out_reg),
        .I2(time_tlock_max),
        .I3(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I5(\n_0_FSM_onehot_rx_state_reg[5] ),
        .O(\n_0_FSM_onehot_rx_state[5]_i_1 ));
LUT6 #(
    .INIT(64'h0000000000008A00)) 
     \FSM_onehot_rx_state[6]_i_1 
       (.I0(\n_0_FSM_onehot_rx_state[6]_i_2 ),
        .I1(n_0_reset_time_out_reg),
        .I2(time_out_2ms),
        .I3(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I5(\n_0_FSM_onehot_rx_state_reg[4] ),
        .O(\n_0_FSM_onehot_rx_state[6]_i_1 ));
LUT6 #(
    .INIT(64'h0000000000000001)) 
     \FSM_onehot_rx_state[6]_i_2 
       (.I0(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[6] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[0] ),
        .I5(\n_0_FSM_onehot_rx_state_reg[1] ),
        .O(\n_0_FSM_onehot_rx_state[6]_i_2 ));
LUT6 #(
    .INIT(64'h0001101000000000)) 
     \FSM_onehot_rx_state[7]_i_1 
       (.I0(\n_0_FSM_onehot_rx_state[7]_i_2 ),
        .I1(\n_0_FSM_onehot_rx_state[7]_i_3 ),
        .I2(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I3(time_out_wait_bypass_s3),
        .I4(\n_0_FSM_onehot_rx_state_reg[6] ),
        .I5(\n_0_FSM_onehot_rx_state[8]_i_11 ),
        .O(\n_0_FSM_onehot_rx_state[7]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair51" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \FSM_onehot_rx_state[7]_i_2 
       (.I0(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[7] ),
        .O(\n_0_FSM_onehot_rx_state[7]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair57" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \FSM_onehot_rx_state[7]_i_3 
       (.I0(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[0] ),
        .O(\n_0_FSM_onehot_rx_state[7]_i_3 ));
LUT6 #(
    .INIT(64'hFFBFAAAAAAAAAAAA)) 
     \FSM_onehot_rx_state[8]_i_1 
       (.I0(rxfsm_soft_reset_r),
        .I1(adapt_count_reset),
        .I2(\n_0_FSM_onehot_rx_state[8]_i_5 ),
        .I3(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I4(GT1_CPLLREFCLKLOST_OUT),
        .I5(GT0_CPLLREFCLKLOST_OUT),
        .O(\n_0_FSM_onehot_rx_state[8]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair57" *) 
   LUT3 #(
    .INIT(8'h01)) 
     \FSM_onehot_rx_state[8]_i_10 
       (.I0(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[0] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[2] ),
        .O(\n_0_FSM_onehot_rx_state[8]_i_10 ));
(* SOFT_HLUTNM = "soft_lutpair52" *) 
   LUT3 #(
    .INIT(8'h01)) 
     \FSM_onehot_rx_state[8]_i_11 
       (.I0(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[3] ),
        .O(\n_0_FSM_onehot_rx_state[8]_i_11 ));
LUT6 #(
    .INIT(64'h808F8080808F808F)) 
     \FSM_onehot_rx_state[8]_i_14 
       (.I0(GT1_CPLLREFCLKLOST_OUT),
        .I1(GT0_CPLLREFCLKLOST_OUT),
        .I2(\n_0_FSM_onehot_rx_state[8]_i_5 ),
        .I3(rxresetdone_s3),
        .I4(n_0_reset_time_out_reg),
        .I5(time_out_2ms),
        .O(\n_0_FSM_onehot_rx_state[8]_i_14 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
     \FSM_onehot_rx_state[8]_i_15 
       (.I0(time_out_2ms),
        .I1(cplllock_sync),
        .I2(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I5(\n_0_FSM_onehot_rx_state_reg[6] ),
        .O(\n_0_FSM_onehot_rx_state[8]_i_15 ));
(* SOFT_HLUTNM = "soft_lutpair53" *) 
   LUT3 #(
    .INIT(8'hBA)) 
     \FSM_onehot_rx_state[8]_i_16 
       (.I0(mmcm_lock_reclocked),
        .I1(n_0_reset_time_out_reg),
        .I2(time_tlock_max),
        .O(\n_0_FSM_onehot_rx_state[8]_i_16 ));
LUT4 #(
    .INIT(16'h0001)) 
     \FSM_onehot_rx_state[8]_i_4 
       (.I0(\n_0_FSM_onehot_rx_state_reg[6] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[3] ),
        .O(adapt_count_reset));
(* SOFT_HLUTNM = "soft_lutpair49" *) 
   LUT4 #(
    .INIT(16'h0001)) 
     \FSM_onehot_rx_state[8]_i_5 
       (.I0(\n_0_FSM_onehot_rx_state_reg[6] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[5] ),
        .O(\n_0_FSM_onehot_rx_state[8]_i_5 ));
LUT6 #(
    .INIT(64'h0000000000000001)) 
     \FSM_onehot_rx_state[8]_i_7 
       (.I0(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I5(\n_0_FSM_onehot_rx_state_reg[6] ),
        .O(\n_0_FSM_onehot_rx_state[8]_i_7 ));
LUT4 #(
    .INIT(16'h0001)) 
     \FSM_onehot_rx_state[8]_i_8 
       (.I0(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[1] ),
        .O(O2));
LUT6 #(
    .INIT(64'hFFFF5555303F5555)) 
     \FSM_onehot_rx_state[8]_i_9 
       (.I0(\n_0_FSM_onehot_rx_state[8]_i_15 ),
        .I1(init_wait_done),
        .I2(\n_0_FSM_onehot_rx_state[8]_i_5 ),
        .I3(\n_0_FSM_onehot_rx_state[8]_i_16 ),
        .I4(adapt_count_reset),
        .I5(\n_0_FSM_onehot_rx_state_reg[8] ),
        .O(\n_0_FSM_onehot_rx_state[8]_i_9 ));
FDSE #(
    .INIT(1'b1)) 
     \FSM_onehot_rx_state_reg[0] 
       (.C(init_clk_in),
        .CE(n_0_data_valid_cdc_sync),
        .D(\<const0> ),
        .Q(\n_0_FSM_onehot_rx_state_reg[0] ),
        .S(\n_0_FSM_onehot_rx_state[8]_i_1 ));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[1] 
       (.C(init_clk_in),
        .CE(n_0_data_valid_cdc_sync),
        .D(n_2_data_valid_cdc_sync),
        .Q(\n_0_FSM_onehot_rx_state_reg[1] ),
        .R(\n_0_FSM_onehot_rx_state[8]_i_1 ));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[2] 
       (.C(init_clk_in),
        .CE(n_0_data_valid_cdc_sync),
        .D(\n_0_FSM_onehot_rx_state[2]_i_1 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[2] ),
        .R(\n_0_FSM_onehot_rx_state[8]_i_1 ));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[3] 
       (.C(init_clk_in),
        .CE(n_0_data_valid_cdc_sync),
        .D(\n_0_FSM_onehot_rx_state[3]_i_1 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[3] ),
        .R(\n_0_FSM_onehot_rx_state[8]_i_1 ));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[4] 
       (.C(init_clk_in),
        .CE(n_0_data_valid_cdc_sync),
        .D(\n_0_FSM_onehot_rx_state[4]_i_1 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[4] ),
        .R(\n_0_FSM_onehot_rx_state[8]_i_1 ));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[5] 
       (.C(init_clk_in),
        .CE(n_0_data_valid_cdc_sync),
        .D(\n_0_FSM_onehot_rx_state[5]_i_1 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[5] ),
        .R(\n_0_FSM_onehot_rx_state[8]_i_1 ));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[6] 
       (.C(init_clk_in),
        .CE(n_0_data_valid_cdc_sync),
        .D(\n_0_FSM_onehot_rx_state[6]_i_1 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[6] ),
        .R(\n_0_FSM_onehot_rx_state[8]_i_1 ));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[7] 
       (.C(init_clk_in),
        .CE(n_0_data_valid_cdc_sync),
        .D(\n_0_FSM_onehot_rx_state[7]_i_1 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[7] ),
        .R(\n_0_FSM_onehot_rx_state[8]_i_1 ));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[8] 
       (.C(init_clk_in),
        .CE(n_0_data_valid_cdc_sync),
        .D(n_1_data_valid_cdc_sync),
        .Q(\n_0_FSM_onehot_rx_state_reg[8] ),
        .R(\n_0_FSM_onehot_rx_state[8]_i_1 ));
GND GND
       (.G(\<const0> ));
LUT6 #(
    .INIT(64'h00000000AABAAA8A)) 
     GTRXRESET_i_1
       (.I0(GTRXRESET),
        .I1(O2),
        .I2(\n_0_FSM_onehot_rx_state[8]_i_5 ),
        .I3(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I4(n_0_GTRXRESET_i_2),
        .I5(\n_0_FSM_onehot_rx_state[8]_i_1 ),
        .O(n_0_GTRXRESET_i_1));
(* SOFT_HLUTNM = "soft_lutpair46" *) 
   LUT4 #(
    .INIT(16'h0001)) 
     GTRXRESET_i_2
       (.I0(\n_0_FSM_onehot_rx_state_reg[6] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[3] ),
        .O(n_0_GTRXRESET_i_2));
FDRE #(
    .INIT(1'b0)) 
     GTRXRESET_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_GTRXRESET_i_1),
        .Q(GTRXRESET),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'h00000000BAAAAAAA)) 
     RXDFEAGCHOLD_i_1
       (.I0(GT0_RXDFELFHOLD_IN),
        .I1(I3),
        .I2(n_0_RXDFEAGCHOLD_i_3),
        .I3(\n_0_FSM_onehot_rx_state[8]_i_5 ),
        .I4(time_out_adapt),
        .I5(\n_0_FSM_onehot_rx_state[8]_i_1 ),
        .O(n_0_RXDFEAGCHOLD_i_1));
(* SOFT_HLUTNM = "soft_lutpair51" *) 
   LUT5 #(
    .INIT(32'h00010000)) 
     RXDFEAGCHOLD_i_3
       (.I0(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[8] ),
        .O(n_0_RXDFEAGCHOLD_i_3));
FDRE RXDFEAGCHOLD_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_RXDFEAGCHOLD_i_1),
        .Q(GT0_RXDFELFHOLD_IN),
        .R(\<const0> ));
FDRE RXDFEAGCHOLD_reg_rep
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_RXDFEAGCHOLD_rep_i_1),
        .Q(O1),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'h00000000BAAAAAAA)) 
     RXDFEAGCHOLD_rep_i_1
       (.I0(GT0_RXDFELFHOLD_IN),
        .I1(I3),
        .I2(n_0_RXDFEAGCHOLD_i_3),
        .I3(\n_0_FSM_onehot_rx_state[8]_i_5 ),
        .I4(time_out_adapt),
        .I5(\n_0_FSM_onehot_rx_state[8]_i_1 ),
        .O(n_0_RXDFEAGCHOLD_rep_i_1));
LUT6 #(
    .INIT(64'h000000008A8ABAAA)) 
     RXUSERRDY_i_1
       (.I0(RXUSERRDY),
        .I1(O2),
        .I2(n_0_RXUSERRDY_i_2),
        .I3(TXUSERRDY),
        .I4(\n_0_FSM_onehot_rx_state[8]_i_5 ),
        .I5(\n_0_FSM_onehot_rx_state[8]_i_1 ),
        .O(n_0_RXUSERRDY_i_1));
(* SOFT_HLUTNM = "soft_lutpair46" *) 
   LUT5 #(
    .INIT(32'h00000001)) 
     RXUSERRDY_i_2
       (.I0(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[6] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[8] ),
        .O(n_0_RXUSERRDY_i_2));
FDRE #(
    .INIT(1'b0)) 
     RXUSERRDY_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_RXUSERRDY_i_1),
        .Q(RXUSERRDY),
        .R(\<const0> ));
VCC VCC
       (.P(\<const1> ));
LUT6 #(
    .INIT(64'hFFFFFFFFAF2AAAAA)) 
     adapt_count_reset_i_1
       (.I0(recclk_mon_count_reset),
        .I1(cplllock_sync),
        .I2(O2),
        .I3(adapt_count_reset),
        .I4(n_0_adapt_count_reset_i_2),
        .I5(\n_0_FSM_onehot_rx_state[8]_i_1 ),
        .O(n_0_adapt_count_reset_i_1));
(* SOFT_HLUTNM = "soft_lutpair49" *) 
   LUT5 #(
    .INIT(32'h00000001)) 
     adapt_count_reset_i_2
       (.I0(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[6] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[8] ),
        .O(n_0_adapt_count_reset_i_2));
FDRE #(
    .INIT(1'b0)) 
     adapt_count_reset_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_adapt_count_reset_i_1),
        .Q(recclk_mon_count_reset),
        .R(\<const0> ));
LUT4 #(
    .INIT(16'hFFFD)) 
     \adapt_wait_hw.adapt_count[0]_i_1 
       (.I0(\n_0_adapt_wait_hw.time_out_adapt_i_2 ),
        .I1(\adapt_wait_hw.adapt_count_reg [2]),
        .I2(\adapt_wait_hw.adapt_count_reg [3]),
        .I3(\adapt_wait_hw.adapt_count_reg [8]),
        .O(\n_0_adapt_wait_hw.adapt_count[0]_i_1 ));
LUT1 #(
    .INIT(2'h2)) 
     \adapt_wait_hw.adapt_count[0]_i_3 
       (.I0(\adapt_wait_hw.adapt_count_reg [3]),
        .O(\n_0_adapt_wait_hw.adapt_count[0]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \adapt_wait_hw.adapt_count[0]_i_4 
       (.I0(\adapt_wait_hw.adapt_count_reg [2]),
        .O(\n_0_adapt_wait_hw.adapt_count[0]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \adapt_wait_hw.adapt_count[0]_i_5 
       (.I0(\adapt_wait_hw.adapt_count_reg [1]),
        .O(\n_0_adapt_wait_hw.adapt_count[0]_i_5 ));
LUT1 #(
    .INIT(2'h1)) 
     \adapt_wait_hw.adapt_count[0]_i_6 
       (.I0(\adapt_wait_hw.adapt_count_reg [0]),
        .O(\n_0_adapt_wait_hw.adapt_count[0]_i_6 ));
LUT1 #(
    .INIT(2'h2)) 
     \adapt_wait_hw.adapt_count[12]_i_2 
       (.I0(\adapt_wait_hw.adapt_count_reg [15]),
        .O(\n_0_adapt_wait_hw.adapt_count[12]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \adapt_wait_hw.adapt_count[12]_i_3 
       (.I0(\adapt_wait_hw.adapt_count_reg [14]),
        .O(\n_0_adapt_wait_hw.adapt_count[12]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \adapt_wait_hw.adapt_count[12]_i_4 
       (.I0(\adapt_wait_hw.adapt_count_reg [13]),
        .O(\n_0_adapt_wait_hw.adapt_count[12]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \adapt_wait_hw.adapt_count[12]_i_5 
       (.I0(\adapt_wait_hw.adapt_count_reg [12]),
        .O(\n_0_adapt_wait_hw.adapt_count[12]_i_5 ));
LUT1 #(
    .INIT(2'h2)) 
     \adapt_wait_hw.adapt_count[16]_i_2 
       (.I0(\adapt_wait_hw.adapt_count_reg [18]),
        .O(\n_0_adapt_wait_hw.adapt_count[16]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \adapt_wait_hw.adapt_count[16]_i_3 
       (.I0(\adapt_wait_hw.adapt_count_reg [17]),
        .O(\n_0_adapt_wait_hw.adapt_count[16]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \adapt_wait_hw.adapt_count[16]_i_4 
       (.I0(\adapt_wait_hw.adapt_count_reg [16]),
        .O(\n_0_adapt_wait_hw.adapt_count[16]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \adapt_wait_hw.adapt_count[4]_i_2 
       (.I0(\adapt_wait_hw.adapt_count_reg [7]),
        .O(\n_0_adapt_wait_hw.adapt_count[4]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \adapt_wait_hw.adapt_count[4]_i_3 
       (.I0(\adapt_wait_hw.adapt_count_reg [6]),
        .O(\n_0_adapt_wait_hw.adapt_count[4]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \adapt_wait_hw.adapt_count[4]_i_4 
       (.I0(\adapt_wait_hw.adapt_count_reg [5]),
        .O(\n_0_adapt_wait_hw.adapt_count[4]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \adapt_wait_hw.adapt_count[4]_i_5 
       (.I0(\adapt_wait_hw.adapt_count_reg [4]),
        .O(\n_0_adapt_wait_hw.adapt_count[4]_i_5 ));
LUT1 #(
    .INIT(2'h2)) 
     \adapt_wait_hw.adapt_count[8]_i_2 
       (.I0(\adapt_wait_hw.adapt_count_reg [11]),
        .O(\n_0_adapt_wait_hw.adapt_count[8]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \adapt_wait_hw.adapt_count[8]_i_3 
       (.I0(\adapt_wait_hw.adapt_count_reg [10]),
        .O(\n_0_adapt_wait_hw.adapt_count[8]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \adapt_wait_hw.adapt_count[8]_i_4 
       (.I0(\adapt_wait_hw.adapt_count_reg [9]),
        .O(\n_0_adapt_wait_hw.adapt_count[8]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \adapt_wait_hw.adapt_count[8]_i_5 
       (.I0(\adapt_wait_hw.adapt_count_reg [8]),
        .O(\n_0_adapt_wait_hw.adapt_count[8]_i_5 ));
(* counter = "24" *) 
   FDRE \adapt_wait_hw.adapt_count_reg[0] 
       (.C(init_clk_in),
        .CE(\n_0_adapt_wait_hw.adapt_count[0]_i_1 ),
        .D(\n_7_adapt_wait_hw.adapt_count_reg[0]_i_2 ),
        .Q(\adapt_wait_hw.adapt_count_reg [0]),
        .R(recclk_mon_count_reset));
CARRY4 \adapt_wait_hw.adapt_count_reg[0]_i_2 
       (.CI(\<const0> ),
        .CO({\n_0_adapt_wait_hw.adapt_count_reg[0]_i_2 ,\n_1_adapt_wait_hw.adapt_count_reg[0]_i_2 ,\n_2_adapt_wait_hw.adapt_count_reg[0]_i_2 ,\n_3_adapt_wait_hw.adapt_count_reg[0]_i_2 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const1> }),
        .O({\n_4_adapt_wait_hw.adapt_count_reg[0]_i_2 ,\n_5_adapt_wait_hw.adapt_count_reg[0]_i_2 ,\n_6_adapt_wait_hw.adapt_count_reg[0]_i_2 ,\n_7_adapt_wait_hw.adapt_count_reg[0]_i_2 }),
        .S({\n_0_adapt_wait_hw.adapt_count[0]_i_3 ,\n_0_adapt_wait_hw.adapt_count[0]_i_4 ,\n_0_adapt_wait_hw.adapt_count[0]_i_5 ,\n_0_adapt_wait_hw.adapt_count[0]_i_6 }));
(* counter = "24" *) 
   FDRE \adapt_wait_hw.adapt_count_reg[10] 
       (.C(init_clk_in),
        .CE(\n_0_adapt_wait_hw.adapt_count[0]_i_1 ),
        .D(\n_5_adapt_wait_hw.adapt_count_reg[8]_i_1 ),
        .Q(\adapt_wait_hw.adapt_count_reg [10]),
        .R(recclk_mon_count_reset));
(* counter = "24" *) 
   FDRE \adapt_wait_hw.adapt_count_reg[11] 
       (.C(init_clk_in),
        .CE(\n_0_adapt_wait_hw.adapt_count[0]_i_1 ),
        .D(\n_4_adapt_wait_hw.adapt_count_reg[8]_i_1 ),
        .Q(\adapt_wait_hw.adapt_count_reg [11]),
        .R(recclk_mon_count_reset));
(* counter = "24" *) 
   FDRE \adapt_wait_hw.adapt_count_reg[12] 
       (.C(init_clk_in),
        .CE(\n_0_adapt_wait_hw.adapt_count[0]_i_1 ),
        .D(\n_7_adapt_wait_hw.adapt_count_reg[12]_i_1 ),
        .Q(\adapt_wait_hw.adapt_count_reg [12]),
        .R(recclk_mon_count_reset));
CARRY4 \adapt_wait_hw.adapt_count_reg[12]_i_1 
       (.CI(\n_0_adapt_wait_hw.adapt_count_reg[8]_i_1 ),
        .CO({\n_0_adapt_wait_hw.adapt_count_reg[12]_i_1 ,\n_1_adapt_wait_hw.adapt_count_reg[12]_i_1 ,\n_2_adapt_wait_hw.adapt_count_reg[12]_i_1 ,\n_3_adapt_wait_hw.adapt_count_reg[12]_i_1 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_adapt_wait_hw.adapt_count_reg[12]_i_1 ,\n_5_adapt_wait_hw.adapt_count_reg[12]_i_1 ,\n_6_adapt_wait_hw.adapt_count_reg[12]_i_1 ,\n_7_adapt_wait_hw.adapt_count_reg[12]_i_1 }),
        .S({\n_0_adapt_wait_hw.adapt_count[12]_i_2 ,\n_0_adapt_wait_hw.adapt_count[12]_i_3 ,\n_0_adapt_wait_hw.adapt_count[12]_i_4 ,\n_0_adapt_wait_hw.adapt_count[12]_i_5 }));
(* counter = "24" *) 
   FDRE \adapt_wait_hw.adapt_count_reg[13] 
       (.C(init_clk_in),
        .CE(\n_0_adapt_wait_hw.adapt_count[0]_i_1 ),
        .D(\n_6_adapt_wait_hw.adapt_count_reg[12]_i_1 ),
        .Q(\adapt_wait_hw.adapt_count_reg [13]),
        .R(recclk_mon_count_reset));
(* counter = "24" *) 
   FDRE \adapt_wait_hw.adapt_count_reg[14] 
       (.C(init_clk_in),
        .CE(\n_0_adapt_wait_hw.adapt_count[0]_i_1 ),
        .D(\n_5_adapt_wait_hw.adapt_count_reg[12]_i_1 ),
        .Q(\adapt_wait_hw.adapt_count_reg [14]),
        .R(recclk_mon_count_reset));
(* counter = "24" *) 
   FDRE \adapt_wait_hw.adapt_count_reg[15] 
       (.C(init_clk_in),
        .CE(\n_0_adapt_wait_hw.adapt_count[0]_i_1 ),
        .D(\n_4_adapt_wait_hw.adapt_count_reg[12]_i_1 ),
        .Q(\adapt_wait_hw.adapt_count_reg [15]),
        .R(recclk_mon_count_reset));
(* counter = "24" *) 
   FDRE \adapt_wait_hw.adapt_count_reg[16] 
       (.C(init_clk_in),
        .CE(\n_0_adapt_wait_hw.adapt_count[0]_i_1 ),
        .D(\n_7_adapt_wait_hw.adapt_count_reg[16]_i_1 ),
        .Q(\adapt_wait_hw.adapt_count_reg [16]),
        .R(recclk_mon_count_reset));
CARRY4 \adapt_wait_hw.adapt_count_reg[16]_i_1 
       (.CI(\n_0_adapt_wait_hw.adapt_count_reg[12]_i_1 ),
        .CO({\NLW_adapt_wait_hw.adapt_count_reg[16]_i_1_CO_UNCONNECTED [3:2],\n_2_adapt_wait_hw.adapt_count_reg[16]_i_1 ,\n_3_adapt_wait_hw.adapt_count_reg[16]_i_1 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\NLW_adapt_wait_hw.adapt_count_reg[16]_i_1_O_UNCONNECTED [3],\n_5_adapt_wait_hw.adapt_count_reg[16]_i_1 ,\n_6_adapt_wait_hw.adapt_count_reg[16]_i_1 ,\n_7_adapt_wait_hw.adapt_count_reg[16]_i_1 }),
        .S({\<const0> ,\n_0_adapt_wait_hw.adapt_count[16]_i_2 ,\n_0_adapt_wait_hw.adapt_count[16]_i_3 ,\n_0_adapt_wait_hw.adapt_count[16]_i_4 }));
(* counter = "24" *) 
   FDRE \adapt_wait_hw.adapt_count_reg[17] 
       (.C(init_clk_in),
        .CE(\n_0_adapt_wait_hw.adapt_count[0]_i_1 ),
        .D(\n_6_adapt_wait_hw.adapt_count_reg[16]_i_1 ),
        .Q(\adapt_wait_hw.adapt_count_reg [17]),
        .R(recclk_mon_count_reset));
(* counter = "24" *) 
   FDRE \adapt_wait_hw.adapt_count_reg[18] 
       (.C(init_clk_in),
        .CE(\n_0_adapt_wait_hw.adapt_count[0]_i_1 ),
        .D(\n_5_adapt_wait_hw.adapt_count_reg[16]_i_1 ),
        .Q(\adapt_wait_hw.adapt_count_reg [18]),
        .R(recclk_mon_count_reset));
(* counter = "24" *) 
   FDRE \adapt_wait_hw.adapt_count_reg[1] 
       (.C(init_clk_in),
        .CE(\n_0_adapt_wait_hw.adapt_count[0]_i_1 ),
        .D(\n_6_adapt_wait_hw.adapt_count_reg[0]_i_2 ),
        .Q(\adapt_wait_hw.adapt_count_reg [1]),
        .R(recclk_mon_count_reset));
(* counter = "24" *) 
   FDRE \adapt_wait_hw.adapt_count_reg[2] 
       (.C(init_clk_in),
        .CE(\n_0_adapt_wait_hw.adapt_count[0]_i_1 ),
        .D(\n_5_adapt_wait_hw.adapt_count_reg[0]_i_2 ),
        .Q(\adapt_wait_hw.adapt_count_reg [2]),
        .R(recclk_mon_count_reset));
(* counter = "24" *) 
   FDRE \adapt_wait_hw.adapt_count_reg[3] 
       (.C(init_clk_in),
        .CE(\n_0_adapt_wait_hw.adapt_count[0]_i_1 ),
        .D(\n_4_adapt_wait_hw.adapt_count_reg[0]_i_2 ),
        .Q(\adapt_wait_hw.adapt_count_reg [3]),
        .R(recclk_mon_count_reset));
(* counter = "24" *) 
   FDRE \adapt_wait_hw.adapt_count_reg[4] 
       (.C(init_clk_in),
        .CE(\n_0_adapt_wait_hw.adapt_count[0]_i_1 ),
        .D(\n_7_adapt_wait_hw.adapt_count_reg[4]_i_1 ),
        .Q(\adapt_wait_hw.adapt_count_reg [4]),
        .R(recclk_mon_count_reset));
CARRY4 \adapt_wait_hw.adapt_count_reg[4]_i_1 
       (.CI(\n_0_adapt_wait_hw.adapt_count_reg[0]_i_2 ),
        .CO({\n_0_adapt_wait_hw.adapt_count_reg[4]_i_1 ,\n_1_adapt_wait_hw.adapt_count_reg[4]_i_1 ,\n_2_adapt_wait_hw.adapt_count_reg[4]_i_1 ,\n_3_adapt_wait_hw.adapt_count_reg[4]_i_1 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_adapt_wait_hw.adapt_count_reg[4]_i_1 ,\n_5_adapt_wait_hw.adapt_count_reg[4]_i_1 ,\n_6_adapt_wait_hw.adapt_count_reg[4]_i_1 ,\n_7_adapt_wait_hw.adapt_count_reg[4]_i_1 }),
        .S({\n_0_adapt_wait_hw.adapt_count[4]_i_2 ,\n_0_adapt_wait_hw.adapt_count[4]_i_3 ,\n_0_adapt_wait_hw.adapt_count[4]_i_4 ,\n_0_adapt_wait_hw.adapt_count[4]_i_5 }));
(* counter = "24" *) 
   FDRE \adapt_wait_hw.adapt_count_reg[5] 
       (.C(init_clk_in),
        .CE(\n_0_adapt_wait_hw.adapt_count[0]_i_1 ),
        .D(\n_6_adapt_wait_hw.adapt_count_reg[4]_i_1 ),
        .Q(\adapt_wait_hw.adapt_count_reg [5]),
        .R(recclk_mon_count_reset));
(* counter = "24" *) 
   FDRE \adapt_wait_hw.adapt_count_reg[6] 
       (.C(init_clk_in),
        .CE(\n_0_adapt_wait_hw.adapt_count[0]_i_1 ),
        .D(\n_5_adapt_wait_hw.adapt_count_reg[4]_i_1 ),
        .Q(\adapt_wait_hw.adapt_count_reg [6]),
        .R(recclk_mon_count_reset));
(* counter = "24" *) 
   FDRE \adapt_wait_hw.adapt_count_reg[7] 
       (.C(init_clk_in),
        .CE(\n_0_adapt_wait_hw.adapt_count[0]_i_1 ),
        .D(\n_4_adapt_wait_hw.adapt_count_reg[4]_i_1 ),
        .Q(\adapt_wait_hw.adapt_count_reg [7]),
        .R(recclk_mon_count_reset));
(* counter = "24" *) 
   FDRE \adapt_wait_hw.adapt_count_reg[8] 
       (.C(init_clk_in),
        .CE(\n_0_adapt_wait_hw.adapt_count[0]_i_1 ),
        .D(\n_7_adapt_wait_hw.adapt_count_reg[8]_i_1 ),
        .Q(\adapt_wait_hw.adapt_count_reg [8]),
        .R(recclk_mon_count_reset));
CARRY4 \adapt_wait_hw.adapt_count_reg[8]_i_1 
       (.CI(\n_0_adapt_wait_hw.adapt_count_reg[4]_i_1 ),
        .CO({\n_0_adapt_wait_hw.adapt_count_reg[8]_i_1 ,\n_1_adapt_wait_hw.adapt_count_reg[8]_i_1 ,\n_2_adapt_wait_hw.adapt_count_reg[8]_i_1 ,\n_3_adapt_wait_hw.adapt_count_reg[8]_i_1 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_adapt_wait_hw.adapt_count_reg[8]_i_1 ,\n_5_adapt_wait_hw.adapt_count_reg[8]_i_1 ,\n_6_adapt_wait_hw.adapt_count_reg[8]_i_1 ,\n_7_adapt_wait_hw.adapt_count_reg[8]_i_1 }),
        .S({\n_0_adapt_wait_hw.adapt_count[8]_i_2 ,\n_0_adapt_wait_hw.adapt_count[8]_i_3 ,\n_0_adapt_wait_hw.adapt_count[8]_i_4 ,\n_0_adapt_wait_hw.adapt_count[8]_i_5 }));
(* counter = "24" *) 
   FDRE \adapt_wait_hw.adapt_count_reg[9] 
       (.C(init_clk_in),
        .CE(\n_0_adapt_wait_hw.adapt_count[0]_i_1 ),
        .D(\n_6_adapt_wait_hw.adapt_count_reg[8]_i_1 ),
        .Q(\adapt_wait_hw.adapt_count_reg [9]),
        .R(recclk_mon_count_reset));
LUT6 #(
    .INIT(64'h00000000AAABAAAA)) 
     \adapt_wait_hw.time_out_adapt_i_1 
       (.I0(time_out_adapt),
        .I1(\adapt_wait_hw.adapt_count_reg [8]),
        .I2(\adapt_wait_hw.adapt_count_reg [3]),
        .I3(\adapt_wait_hw.adapt_count_reg [2]),
        .I4(\n_0_adapt_wait_hw.time_out_adapt_i_2 ),
        .I5(recclk_mon_count_reset),
        .O(\n_0_adapt_wait_hw.time_out_adapt_i_1 ));
LUT6 #(
    .INIT(64'h0008000000000000)) 
     \adapt_wait_hw.time_out_adapt_i_2 
       (.I0(\adapt_wait_hw.adapt_count_reg [5]),
        .I1(\adapt_wait_hw.adapt_count_reg [7]),
        .I2(\adapt_wait_hw.adapt_count_reg [15]),
        .I3(\adapt_wait_hw.adapt_count_reg [14]),
        .I4(\n_0_adapt_wait_hw.time_out_adapt_i_3 ),
        .I5(\n_0_adapt_wait_hw.time_out_adapt_i_4 ),
        .O(\n_0_adapt_wait_hw.time_out_adapt_i_2 ));
LUT6 #(
    .INIT(64'h4000000000000000)) 
     \adapt_wait_hw.time_out_adapt_i_3 
       (.I0(\adapt_wait_hw.adapt_count_reg [13]),
        .I1(\adapt_wait_hw.adapt_count_reg [0]),
        .I2(\adapt_wait_hw.adapt_count_reg [11]),
        .I3(\adapt_wait_hw.adapt_count_reg [10]),
        .I4(\adapt_wait_hw.adapt_count_reg [18]),
        .I5(\adapt_wait_hw.adapt_count_reg [16]),
        .O(\n_0_adapt_wait_hw.time_out_adapt_i_3 ));
LUT6 #(
    .INIT(64'h0000000000400000)) 
     \adapt_wait_hw.time_out_adapt_i_4 
       (.I0(\adapt_wait_hw.adapt_count_reg [6]),
        .I1(\adapt_wait_hw.adapt_count_reg [9]),
        .I2(\adapt_wait_hw.adapt_count_reg [1]),
        .I3(\adapt_wait_hw.adapt_count_reg [12]),
        .I4(\adapt_wait_hw.adapt_count_reg [17]),
        .I5(\adapt_wait_hw.adapt_count_reg [4]),
        .O(\n_0_adapt_wait_hw.time_out_adapt_i_4 ));
FDRE #(
    .INIT(1'b0)) 
     \adapt_wait_hw.time_out_adapt_reg 
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(\n_0_adapt_wait_hw.time_out_adapt_i_1 ),
        .Q(time_out_adapt),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'h00000000AAAAB2AA)) 
     check_tlock_max_i_1
       (.I0(n_0_check_tlock_max_reg),
        .I1(\n_0_FSM_onehot_rx_state[8]_i_5 ),
        .I2(O2),
        .I3(adapt_count_reset),
        .I4(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I5(\n_0_FSM_onehot_rx_state[8]_i_1 ),
        .O(n_0_check_tlock_max_i_1));
FDRE #(
    .INIT(1'b0)) 
     check_tlock_max_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_check_tlock_max_i_1),
        .Q(n_0_check_tlock_max_reg),
        .R(\<const0> ));
data_mgtdata_mgt_cdc_sync__parameterized0_13 data_valid_cdc_sync
       (.D({n_1_data_valid_cdc_sync,n_2_data_valid_cdc_sync}),
        .E(n_0_data_valid_cdc_sync),
        .I1(\n_0_FSM_onehot_rx_state[8]_i_7 ),
        .I10(\n_0_FSM_onehot_rx_state[1]_i_4 ),
        .I11(\n_0_FSM_onehot_rx_state[1]_i_5 ),
        .I12(\n_0_FSM_onehot_rx_state[8]_i_10 ),
        .I13(\n_0_FSM_onehot_rx_state[8]_i_11 ),
        .I14(n_0_reset_time_out_i_2__0),
        .I15(\n_0_FSM_onehot_rx_state[8]_i_1 ),
        .I16(n_0_rx_fsm_reset_done_int_i_3),
        .I2(O2),
        .I3(\n_0_FSM_onehot_rx_state[8]_i_9 ),
        .I4(adapt_count_reset),
        .I5(\n_0_FSM_onehot_rx_state[8]_i_14 ),
        .I6(n_0_reset_time_out_i_6),
        .I7(\n_0_FSM_onehot_rx_state[8]_i_5 ),
        .I8(n_0_reset_time_out_reg),
        .I9(\n_0_FSM_onehot_rx_state[1]_i_2 ),
        .O1(n_3_data_valid_cdc_sync),
        .O2(n_4_data_valid_cdc_sync),
        .Q({\n_0_FSM_onehot_rx_state_reg[8] ,\n_0_FSM_onehot_rx_state_reg[7] ,\n_0_FSM_onehot_rx_state_reg[6] ,\n_0_FSM_onehot_rx_state_reg[5] ,\n_0_FSM_onehot_rx_state_reg[4] ,\n_0_FSM_onehot_rx_state_reg[1] }),
        .init_clk_in(init_clk_in),
        .rx_cdrlocked(rx_cdrlocked),
        .rx_fsm_reset_done_int(rx_fsm_reset_done_int),
        .rxfsm_data_valid_r(rxfsm_data_valid_r),
        .rxresetdone_s3(rxresetdone_s3),
        .time_out_100us(time_out_100us),
        .time_out_1us(time_out_1us),
        .time_out_wait_bypass_s3(time_out_wait_bypass_s3));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair60" *) 
   LUT1 #(
    .INIT(2'h1)) 
     \init_wait_count[0]_i_1__0 
       (.I0(init_wait_count_reg__0[0]),
        .O(p_0_in__0[0]));
(* SOFT_HLUTNM = "soft_lutpair60" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \init_wait_count[1]_i_1__0 
       (.I0(init_wait_count_reg__0[1]),
        .I1(init_wait_count_reg__0[0]),
        .O(p_0_in__0[1]));
(* SOFT_HLUTNM = "soft_lutpair58" *) 
   LUT3 #(
    .INIT(8'h6A)) 
     \init_wait_count[2]_i_1__0 
       (.I0(init_wait_count_reg__0[2]),
        .I1(init_wait_count_reg__0[0]),
        .I2(init_wait_count_reg__0[1]),
        .O(p_0_in__0[2]));
(* SOFT_HLUTNM = "soft_lutpair48" *) 
   LUT4 #(
    .INIT(16'h6AAA)) 
     \init_wait_count[3]_i_1__0 
       (.I0(init_wait_count_reg__0[3]),
        .I1(init_wait_count_reg__0[1]),
        .I2(init_wait_count_reg__0[0]),
        .I3(init_wait_count_reg__0[2]),
        .O(p_0_in__0[3]));
(* SOFT_HLUTNM = "soft_lutpair48" *) 
   LUT5 #(
    .INIT(32'h6AAAAAAA)) 
     \init_wait_count[4]_i_1__0 
       (.I0(init_wait_count_reg__0[4]),
        .I1(init_wait_count_reg__0[2]),
        .I2(init_wait_count_reg__0[0]),
        .I3(init_wait_count_reg__0[1]),
        .I4(init_wait_count_reg__0[3]),
        .O(p_0_in__0[4]));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFF7F)) 
     \init_wait_count[5]_i_1__0 
       (.I0(init_wait_count_reg__0[1]),
        .I1(init_wait_count_reg__0[0]),
        .I2(init_wait_count_reg__0[5]),
        .I3(init_wait_count_reg__0[4]),
        .I4(init_wait_count_reg__0[3]),
        .I5(init_wait_count_reg__0[2]),
        .O(\n_0_init_wait_count[5]_i_1__0 ));
LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
     \init_wait_count[5]_i_2__0 
       (.I0(init_wait_count_reg__0[5]),
        .I1(init_wait_count_reg__0[3]),
        .I2(init_wait_count_reg__0[1]),
        .I3(init_wait_count_reg__0[0]),
        .I4(init_wait_count_reg__0[2]),
        .I5(init_wait_count_reg__0[4]),
        .O(p_0_in__0[5]));
(* counter = "23" *) 
   FDRE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[0] 
       (.C(init_clk_in),
        .CE(\n_0_init_wait_count[5]_i_1__0 ),
        .D(p_0_in__0[0]),
        .Q(init_wait_count_reg__0[0]),
        .R(\<const0> ));
(* counter = "23" *) 
   FDRE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[1] 
       (.C(init_clk_in),
        .CE(\n_0_init_wait_count[5]_i_1__0 ),
        .D(p_0_in__0[1]),
        .Q(init_wait_count_reg__0[1]),
        .R(\<const0> ));
(* counter = "23" *) 
   FDRE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[2] 
       (.C(init_clk_in),
        .CE(\n_0_init_wait_count[5]_i_1__0 ),
        .D(p_0_in__0[2]),
        .Q(init_wait_count_reg__0[2]),
        .R(\<const0> ));
(* counter = "23" *) 
   FDRE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[3] 
       (.C(init_clk_in),
        .CE(\n_0_init_wait_count[5]_i_1__0 ),
        .D(p_0_in__0[3]),
        .Q(init_wait_count_reg__0[3]),
        .R(\<const0> ));
(* counter = "23" *) 
   FDRE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[4] 
       (.C(init_clk_in),
        .CE(\n_0_init_wait_count[5]_i_1__0 ),
        .D(p_0_in__0[4]),
        .Q(init_wait_count_reg__0[4]),
        .R(\<const0> ));
(* counter = "23" *) 
   FDRE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[5] 
       (.C(init_clk_in),
        .CE(\n_0_init_wait_count[5]_i_1__0 ),
        .D(p_0_in__0[5]),
        .Q(init_wait_count_reg__0[5]),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
     init_wait_done_i_1__0
       (.I0(init_wait_done),
        .I1(init_wait_count_reg__0[2]),
        .I2(init_wait_count_reg__0[3]),
        .I3(init_wait_count_reg__0[4]),
        .I4(init_wait_count_reg__0[5]),
        .I5(n_0_init_wait_done_i_2__0),
        .O(n_0_init_wait_done_i_1__0));
(* SOFT_HLUTNM = "soft_lutpair58" *) 
   LUT2 #(
    .INIT(4'h8)) 
     init_wait_done_i_2__0
       (.I0(init_wait_count_reg__0[1]),
        .I1(init_wait_count_reg__0[0]),
        .O(n_0_init_wait_done_i_2__0));
FDRE #(
    .INIT(1'b0)) 
     init_wait_done_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_init_wait_done_i_1__0),
        .Q(init_wait_done),
        .R(\<const0> ));
LUT1 #(
    .INIT(2'h1)) 
     \mmcm_lock_count[0]_i_1__0 
       (.I0(mmcm_lock_count_reg__0[0]),
        .O(p_0_in__3[0]));
(* SOFT_HLUTNM = "soft_lutpair55" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \mmcm_lock_count[1]_i_1__0 
       (.I0(mmcm_lock_count_reg__0[0]),
        .I1(mmcm_lock_count_reg__0[1]),
        .O(p_0_in__3[1]));
(* SOFT_HLUTNM = "soft_lutpair55" *) 
   LUT3 #(
    .INIT(8'h6A)) 
     \mmcm_lock_count[2]_i_1__0 
       (.I0(mmcm_lock_count_reg__0[2]),
        .I1(mmcm_lock_count_reg__0[1]),
        .I2(mmcm_lock_count_reg__0[0]),
        .O(p_0_in__3[2]));
(* SOFT_HLUTNM = "soft_lutpair47" *) 
   LUT4 #(
    .INIT(16'h6AAA)) 
     \mmcm_lock_count[3]_i_1__0 
       (.I0(mmcm_lock_count_reg__0[3]),
        .I1(mmcm_lock_count_reg__0[2]),
        .I2(mmcm_lock_count_reg__0[0]),
        .I3(mmcm_lock_count_reg__0[1]),
        .O(p_0_in__3[3]));
(* SOFT_HLUTNM = "soft_lutpair47" *) 
   LUT5 #(
    .INIT(32'h6AAAAAAA)) 
     \mmcm_lock_count[4]_i_1__0 
       (.I0(mmcm_lock_count_reg__0[4]),
        .I1(mmcm_lock_count_reg__0[3]),
        .I2(mmcm_lock_count_reg__0[1]),
        .I3(mmcm_lock_count_reg__0[0]),
        .I4(mmcm_lock_count_reg__0[2]),
        .O(p_0_in__3[4]));
LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
     \mmcm_lock_count[5]_i_1__0 
       (.I0(mmcm_lock_count_reg__0[5]),
        .I1(mmcm_lock_count_reg__0[4]),
        .I2(mmcm_lock_count_reg__0[2]),
        .I3(mmcm_lock_count_reg__0[0]),
        .I4(mmcm_lock_count_reg__0[1]),
        .I5(mmcm_lock_count_reg__0[3]),
        .O(p_0_in__3[5]));
(* SOFT_HLUTNM = "soft_lutpair54" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \mmcm_lock_count[6]_i_1__0 
       (.I0(mmcm_lock_count_reg__0[6]),
        .I1(\n_0_mmcm_lock_count[9]_i_4 ),
        .O(p_0_in__3[6]));
(* SOFT_HLUTNM = "soft_lutpair54" *) 
   LUT3 #(
    .INIT(8'h6A)) 
     \mmcm_lock_count[7]_i_1__0 
       (.I0(mmcm_lock_count_reg__0[7]),
        .I1(mmcm_lock_count_reg__0[6]),
        .I2(\n_0_mmcm_lock_count[9]_i_4 ),
        .O(p_0_in__3[7]));
(* SOFT_HLUTNM = "soft_lutpair50" *) 
   LUT4 #(
    .INIT(16'h6AAA)) 
     \mmcm_lock_count[8]_i_1__0 
       (.I0(mmcm_lock_count_reg__0[8]),
        .I1(mmcm_lock_count_reg__0[7]),
        .I2(\n_0_mmcm_lock_count[9]_i_4 ),
        .I3(mmcm_lock_count_reg__0[6]),
        .O(p_0_in__3[8]));
LUT5 #(
    .INIT(32'hBFFFFFFF)) 
     \mmcm_lock_count[9]_i_1__0 
       (.I0(\n_0_mmcm_lock_count[9]_i_3__0 ),
        .I1(mmcm_lock_count_reg__0[3]),
        .I2(mmcm_lock_count_reg__0[2]),
        .I3(mmcm_lock_count_reg__0[1]),
        .I4(mmcm_lock_count_reg__0[0]),
        .O(\n_0_mmcm_lock_count[9]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair50" *) 
   LUT5 #(
    .INIT(32'h6AAAAAAA)) 
     \mmcm_lock_count[9]_i_2 
       (.I0(mmcm_lock_count_reg__0[9]),
        .I1(mmcm_lock_count_reg__0[8]),
        .I2(mmcm_lock_count_reg__0[6]),
        .I3(\n_0_mmcm_lock_count[9]_i_4 ),
        .I4(mmcm_lock_count_reg__0[7]),
        .O(p_0_in__3[9]));
LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
     \mmcm_lock_count[9]_i_3__0 
       (.I0(mmcm_lock_count_reg__0[9]),
        .I1(mmcm_lock_count_reg__0[4]),
        .I2(mmcm_lock_count_reg__0[6]),
        .I3(mmcm_lock_count_reg__0[5]),
        .I4(mmcm_lock_count_reg__0[7]),
        .I5(mmcm_lock_count_reg__0[8]),
        .O(\n_0_mmcm_lock_count[9]_i_3__0 ));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     \mmcm_lock_count[9]_i_4 
       (.I0(mmcm_lock_count_reg__0[4]),
        .I1(mmcm_lock_count_reg__0[2]),
        .I2(mmcm_lock_count_reg__0[0]),
        .I3(mmcm_lock_count_reg__0[1]),
        .I4(mmcm_lock_count_reg__0[3]),
        .I5(mmcm_lock_count_reg__0[5]),
        .O(\n_0_mmcm_lock_count[9]_i_4 ));
(* counter = "28" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[0] 
       (.C(init_clk_in),
        .CE(\n_0_mmcm_lock_count[9]_i_1__0 ),
        .D(p_0_in__3[0]),
        .Q(mmcm_lock_count_reg__0[0]),
        .R(SR));
(* counter = "28" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[1] 
       (.C(init_clk_in),
        .CE(\n_0_mmcm_lock_count[9]_i_1__0 ),
        .D(p_0_in__3[1]),
        .Q(mmcm_lock_count_reg__0[1]),
        .R(SR));
(* counter = "28" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[2] 
       (.C(init_clk_in),
        .CE(\n_0_mmcm_lock_count[9]_i_1__0 ),
        .D(p_0_in__3[2]),
        .Q(mmcm_lock_count_reg__0[2]),
        .R(SR));
(* counter = "28" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[3] 
       (.C(init_clk_in),
        .CE(\n_0_mmcm_lock_count[9]_i_1__0 ),
        .D(p_0_in__3[3]),
        .Q(mmcm_lock_count_reg__0[3]),
        .R(SR));
(* counter = "28" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[4] 
       (.C(init_clk_in),
        .CE(\n_0_mmcm_lock_count[9]_i_1__0 ),
        .D(p_0_in__3[4]),
        .Q(mmcm_lock_count_reg__0[4]),
        .R(SR));
(* counter = "28" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[5] 
       (.C(init_clk_in),
        .CE(\n_0_mmcm_lock_count[9]_i_1__0 ),
        .D(p_0_in__3[5]),
        .Q(mmcm_lock_count_reg__0[5]),
        .R(SR));
(* counter = "28" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[6] 
       (.C(init_clk_in),
        .CE(\n_0_mmcm_lock_count[9]_i_1__0 ),
        .D(p_0_in__3[6]),
        .Q(mmcm_lock_count_reg__0[6]),
        .R(SR));
(* counter = "28" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[7] 
       (.C(init_clk_in),
        .CE(\n_0_mmcm_lock_count[9]_i_1__0 ),
        .D(p_0_in__3[7]),
        .Q(mmcm_lock_count_reg__0[7]),
        .R(SR));
(* counter = "28" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[8] 
       (.C(init_clk_in),
        .CE(\n_0_mmcm_lock_count[9]_i_1__0 ),
        .D(p_0_in__3[8]),
        .Q(mmcm_lock_count_reg__0[8]),
        .R(SR));
(* counter = "28" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[9] 
       (.C(init_clk_in),
        .CE(\n_0_mmcm_lock_count[9]_i_1__0 ),
        .D(p_0_in__3[9]),
        .Q(mmcm_lock_count_reg__0[9]),
        .R(SR));
LUT3 #(
    .INIT(8'hA2)) 
     mmcm_lock_reclocked_i_1__0
       (.I0(I2),
        .I1(\n_0_mmcm_lock_count[9]_i_1__0 ),
        .I2(mmcm_lock_reclocked),
        .O(n_0_mmcm_lock_reclocked_i_1__0));
FDRE #(
    .INIT(1'b0)) 
     mmcm_lock_reclocked_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_mmcm_lock_reclocked_i_1__0),
        .Q(mmcm_lock_reclocked),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'hA0A000000E5EFFFF)) 
     reset_time_out_i_2__0
       (.I0(O2),
        .I1(rx_cdrlocked),
        .I2(adapt_count_reset),
        .I3(I1),
        .I4(\n_0_FSM_onehot_rx_state[8]_i_5 ),
        .I5(\n_0_FSM_onehot_rx_state_reg[8] ),
        .O(n_0_reset_time_out_i_2__0));
LUT4 #(
    .INIT(16'h30BB)) 
     reset_time_out_i_6
       (.I0(mmcm_lock_reclocked),
        .I1(adapt_count_reset),
        .I2(cplllock_sync),
        .I3(\n_0_FSM_onehot_rx_state[8]_i_5 ),
        .O(n_0_reset_time_out_i_6));
FDRE #(
    .INIT(1'b0)) 
     reset_time_out_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_3_data_valid_cdc_sync),
        .Q(n_0_reset_time_out_reg),
        .R(\<const0> ));
data_mgtdata_mgt_cdc_sync__parameterized0_10 run_phase_alignment_int_cdc_sync
       (.I1(n_0_run_phase_alignment_int_reg),
        .O1(n_0_run_phase_alignment_int_cdc_sync),
        .user_clk(user_clk));
LUT6 #(
    .INIT(64'h00000000A8AAAABA)) 
     run_phase_alignment_int_i_1__0
       (.I0(n_0_run_phase_alignment_int_reg),
        .I1(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I2(O2),
        .I3(\n_0_FSM_onehot_rx_state[8]_i_5 ),
        .I4(adapt_count_reset),
        .I5(\n_0_FSM_onehot_rx_state[8]_i_1 ),
        .O(n_0_run_phase_alignment_int_i_1__0));
FDRE #(
    .INIT(1'b0)) 
     run_phase_alignment_int_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_run_phase_alignment_int_i_1__0),
        .Q(n_0_run_phase_alignment_int_reg),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     run_phase_alignment_int_s3_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_run_phase_alignment_int_cdc_sync),
        .Q(n_0_run_phase_alignment_int_s3_reg),
        .R(\<const0> ));
data_mgtdata_mgt_cdc_sync__parameterized0_11 rx_fsm_reset_done_int_cdc_sync
       (.O1(n_0_rx_fsm_reset_done_int_cdc_sync),
        .rx_fsm_reset_done_int(rx_fsm_reset_done_int),
        .user_clk(user_clk));
LUT6 #(
    .INIT(64'h1111111111111118)) 
     rx_fsm_reset_done_int_i_3
       (.I0(O2),
        .I1(\n_0_FSM_onehot_rx_state[8]_i_5 ),
        .I2(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I5(\n_0_FSM_onehot_rx_state_reg[6] ),
        .O(n_0_rx_fsm_reset_done_int_i_3));
FDRE #(
    .INIT(1'b0)) 
     rx_fsm_reset_done_int_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_4_data_valid_cdc_sync),
        .Q(rx_fsm_reset_done_int),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     rx_fsm_reset_done_int_s3_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_rx_fsm_reset_done_int_cdc_sync),
        .Q(rx_fsm_reset_done_int_s3),
        .R(\<const0> ));
data_mgtdata_mgt_cdc_sync__parameterized0_9 rxresetdone_cdc_sync
       (.O1(n_0_rxresetdone_cdc_sync),
        .init_clk_in(init_clk_in),
        .rxfsm_rxresetdone_r(rxfsm_rxresetdone_r));
FDRE #(
    .INIT(1'b0)) 
     rxresetdone_s3_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_rxresetdone_cdc_sync),
        .Q(rxresetdone_s3),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'h00000000AAAAAAAE)) 
     time_out_100us_i_1
       (.I0(time_out_100us),
        .I1(n_0_time_out_100us_i_2),
        .I2(time_out_counter_reg[6]),
        .I3(time_out_counter_reg[2]),
        .I4(n_0_time_out_100us_i_3),
        .I5(n_0_reset_time_out_reg),
        .O(n_0_time_out_100us_i_1));
LUT6 #(
    .INIT(64'h0000000001000000)) 
     time_out_100us_i_2
       (.I0(n_0_time_out_100us_i_4),
        .I1(time_out_counter_reg[16]),
        .I2(time_out_counter_reg[17]),
        .I3(n_0_time_out_100us_i_5),
        .I4(time_out_counter_reg[3]),
        .I5(time_out_counter_reg[0]),
        .O(n_0_time_out_100us_i_2));
LUT2 #(
    .INIT(4'h7)) 
     time_out_100us_i_3
       (.I0(time_out_counter_reg[8]),
        .I1(time_out_counter_reg[7]),
        .O(n_0_time_out_100us_i_3));
LUT4 #(
    .INIT(16'hFFFE)) 
     time_out_100us_i_4
       (.I0(time_out_counter_reg[14]),
        .I1(time_out_counter_reg[15]),
        .I2(time_out_counter_reg[11]),
        .I3(time_out_counter_reg[10]),
        .O(n_0_time_out_100us_i_4));
LUT6 #(
    .INIT(64'h0000000000040000)) 
     time_out_100us_i_5
       (.I0(time_out_counter_reg[13]),
        .I1(time_out_counter_reg[9]),
        .I2(time_out_counter_reg[5]),
        .I3(time_out_counter_reg[4]),
        .I4(time_out_counter_reg[12]),
        .I5(time_out_counter_reg[1]),
        .O(n_0_time_out_100us_i_5));
FDRE #(
    .INIT(1'b0)) 
     time_out_100us_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_time_out_100us_i_1),
        .Q(time_out_100us),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair59" *) 
   LUT3 #(
    .INIT(8'h0E)) 
     time_out_1us_i_1
       (.I0(time_out_1us),
        .I1(n_0_time_out_1us_i_2),
        .I2(n_0_reset_time_out_reg),
        .O(n_0_time_out_1us_i_1));
LUT6 #(
    .INIT(64'h0000000000000080)) 
     time_out_1us_i_2
       (.I0(n_0_time_out_1us_i_3),
        .I1(n_0_time_out_1us_i_4),
        .I2(n_0_time_out_2ms_i_5),
        .I3(time_out_counter_reg[9]),
        .I4(time_out_counter_reg[0]),
        .I5(n_0_time_out_1us_i_5),
        .O(n_0_time_out_1us_i_2));
LUT6 #(
    .INIT(64'h0000000000000001)) 
     time_out_1us_i_3
       (.I0(time_out_counter_reg[6]),
        .I1(time_out_counter_reg[2]),
        .I2(time_out_counter_reg[10]),
        .I3(time_out_counter_reg[11]),
        .I4(time_out_counter_reg[15]),
        .I5(time_out_counter_reg[14]),
        .O(n_0_time_out_1us_i_3));
LUT6 #(
    .INIT(64'h0000000000000002)) 
     time_out_1us_i_4
       (.I0(time_out_counter_reg[1]),
        .I1(time_out_counter_reg[8]),
        .I2(time_out_counter_reg[7]),
        .I3(time_out_counter_reg[3]),
        .I4(time_out_counter_reg[17]),
        .I5(time_out_counter_reg[16]),
        .O(n_0_time_out_1us_i_4));
LUT2 #(
    .INIT(4'h7)) 
     time_out_1us_i_5
       (.I0(time_out_counter_reg[4]),
        .I1(time_out_counter_reg[5]),
        .O(n_0_time_out_1us_i_5));
FDRE #(
    .INIT(1'b0)) 
     time_out_1us_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_time_out_1us_i_1),
        .Q(time_out_1us),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'h00000000AEAAAAAA)) 
     time_out_2ms_i_1
       (.I0(time_out_2ms),
        .I1(time_out_counter_reg[6]),
        .I2(time_out_counter_reg[2]),
        .I3(n_0_time_out_2ms_i_2__0),
        .I4(n_0_time_out_2ms_i_3),
        .I5(n_0_reset_time_out_reg),
        .O(n_0_time_out_2ms_i_1));
LUT6 #(
    .INIT(64'h0000000000000008)) 
     time_out_2ms_i_2__0
       (.I0(time_out_counter_reg[5]),
        .I1(time_out_counter_reg[4]),
        .I2(time_out_counter_reg[1]),
        .I3(time_out_counter_reg[10]),
        .I4(time_out_counter_reg[0]),
        .I5(time_out_counter_reg[9]),
        .O(n_0_time_out_2ms_i_2__0));
LUT6 #(
    .INIT(64'h0000000040000000)) 
     time_out_2ms_i_3
       (.I0(n_0_time_out_2ms_i_4),
        .I1(n_0_time_out_2ms_i_5),
        .I2(time_out_counter_reg[8]),
        .I3(time_out_counter_reg[7]),
        .I4(time_out_counter_reg[11]),
        .I5(time_out_counter_reg[3]),
        .O(n_0_time_out_2ms_i_3));
LUT4 #(
    .INIT(16'hEFFF)) 
     time_out_2ms_i_4
       (.I0(time_out_counter_reg[15]),
        .I1(time_out_counter_reg[16]),
        .I2(time_out_counter_reg[14]),
        .I3(time_out_counter_reg[17]),
        .O(n_0_time_out_2ms_i_4));
LUT2 #(
    .INIT(4'h1)) 
     time_out_2ms_i_5
       (.I0(time_out_counter_reg[13]),
        .I1(time_out_counter_reg[12]),
        .O(n_0_time_out_2ms_i_5));
FDRE #(
    .INIT(1'b0)) 
     time_out_2ms_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_time_out_2ms_i_1),
        .Q(time_out_2ms),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
     \time_out_counter[0]_i_1__0 
       (.I0(\n_0_time_out_counter[0]_i_3__0 ),
        .I1(time_out_counter_reg[5]),
        .I2(time_out_counter_reg[4]),
        .I3(time_out_counter_reg[2]),
        .I4(time_out_counter_reg[6]),
        .I5(time_out_counter_reg[11]),
        .O(\n_0_time_out_counter[0]_i_1__0 ));
LUT6 #(
    .INIT(64'hFFFFEFFFFFFFFFFF)) 
     \time_out_counter[0]_i_3__0 
       (.I0(n_0_time_out_2ms_i_4),
        .I1(\n_0_time_out_counter[0]_i_8 ),
        .I2(n_0_time_out_2ms_i_5),
        .I3(time_out_counter_reg[7]),
        .I4(time_out_counter_reg[3]),
        .I5(time_out_counter_reg[8]),
        .O(\n_0_time_out_counter[0]_i_3__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[0]_i_4__0 
       (.I0(time_out_counter_reg[3]),
        .O(\n_0_time_out_counter[0]_i_4__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[0]_i_5__0 
       (.I0(time_out_counter_reg[2]),
        .O(\n_0_time_out_counter[0]_i_5__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[0]_i_6__0 
       (.I0(time_out_counter_reg[1]),
        .O(\n_0_time_out_counter[0]_i_6__0 ));
LUT1 #(
    .INIT(2'h1)) 
     \time_out_counter[0]_i_7 
       (.I0(time_out_counter_reg[0]),
        .O(\n_0_time_out_counter[0]_i_7 ));
LUT4 #(
    .INIT(16'hFFFE)) 
     \time_out_counter[0]_i_8 
       (.I0(time_out_counter_reg[9]),
        .I1(time_out_counter_reg[0]),
        .I2(time_out_counter_reg[10]),
        .I3(time_out_counter_reg[1]),
        .O(\n_0_time_out_counter[0]_i_8 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_2__0 
       (.I0(time_out_counter_reg[15]),
        .O(\n_0_time_out_counter[12]_i_2__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_3__0 
       (.I0(time_out_counter_reg[14]),
        .O(\n_0_time_out_counter[12]_i_3__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_4__0 
       (.I0(time_out_counter_reg[13]),
        .O(\n_0_time_out_counter[12]_i_4__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_5__0 
       (.I0(time_out_counter_reg[12]),
        .O(\n_0_time_out_counter[12]_i_5__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[16]_i_2__0 
       (.I0(time_out_counter_reg[17]),
        .O(\n_0_time_out_counter[16]_i_2__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[16]_i_3 
       (.I0(time_out_counter_reg[16]),
        .O(\n_0_time_out_counter[16]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_2__0 
       (.I0(time_out_counter_reg[7]),
        .O(\n_0_time_out_counter[4]_i_2__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_3__0 
       (.I0(time_out_counter_reg[6]),
        .O(\n_0_time_out_counter[4]_i_3__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_4__0 
       (.I0(time_out_counter_reg[5]),
        .O(\n_0_time_out_counter[4]_i_4__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_5__0 
       (.I0(time_out_counter_reg[4]),
        .O(\n_0_time_out_counter[4]_i_5__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_2__0 
       (.I0(time_out_counter_reg[11]),
        .O(\n_0_time_out_counter[8]_i_2__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_3__0 
       (.I0(time_out_counter_reg[10]),
        .O(\n_0_time_out_counter[8]_i_3__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_4__0 
       (.I0(time_out_counter_reg[9]),
        .O(\n_0_time_out_counter[8]_i_4__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_5__0 
       (.I0(time_out_counter_reg[8]),
        .O(\n_0_time_out_counter[8]_i_5__0 ));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[0] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_7_time_out_counter_reg[0]_i_2__0 ),
        .Q(time_out_counter_reg[0]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[0]_i_2__0 
       (.CI(\<const0> ),
        .CO({\n_0_time_out_counter_reg[0]_i_2__0 ,\n_1_time_out_counter_reg[0]_i_2__0 ,\n_2_time_out_counter_reg[0]_i_2__0 ,\n_3_time_out_counter_reg[0]_i_2__0 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const1> }),
        .O({\n_4_time_out_counter_reg[0]_i_2__0 ,\n_5_time_out_counter_reg[0]_i_2__0 ,\n_6_time_out_counter_reg[0]_i_2__0 ,\n_7_time_out_counter_reg[0]_i_2__0 }),
        .S({\n_0_time_out_counter[0]_i_4__0 ,\n_0_time_out_counter[0]_i_5__0 ,\n_0_time_out_counter[0]_i_6__0 ,\n_0_time_out_counter[0]_i_7 }));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[10] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_5_time_out_counter_reg[8]_i_1__0 ),
        .Q(time_out_counter_reg[10]),
        .R(n_0_reset_time_out_reg));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[11] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_4_time_out_counter_reg[8]_i_1__0 ),
        .Q(time_out_counter_reg[11]),
        .R(n_0_reset_time_out_reg));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[12] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_7_time_out_counter_reg[12]_i_1__0 ),
        .Q(time_out_counter_reg[12]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[12]_i_1__0 
       (.CI(\n_0_time_out_counter_reg[8]_i_1__0 ),
        .CO({\n_0_time_out_counter_reg[12]_i_1__0 ,\n_1_time_out_counter_reg[12]_i_1__0 ,\n_2_time_out_counter_reg[12]_i_1__0 ,\n_3_time_out_counter_reg[12]_i_1__0 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_time_out_counter_reg[12]_i_1__0 ,\n_5_time_out_counter_reg[12]_i_1__0 ,\n_6_time_out_counter_reg[12]_i_1__0 ,\n_7_time_out_counter_reg[12]_i_1__0 }),
        .S({\n_0_time_out_counter[12]_i_2__0 ,\n_0_time_out_counter[12]_i_3__0 ,\n_0_time_out_counter[12]_i_4__0 ,\n_0_time_out_counter[12]_i_5__0 }));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[13] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_6_time_out_counter_reg[12]_i_1__0 ),
        .Q(time_out_counter_reg[13]),
        .R(n_0_reset_time_out_reg));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[14] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_5_time_out_counter_reg[12]_i_1__0 ),
        .Q(time_out_counter_reg[14]),
        .R(n_0_reset_time_out_reg));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[15] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_4_time_out_counter_reg[12]_i_1__0 ),
        .Q(time_out_counter_reg[15]),
        .R(n_0_reset_time_out_reg));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[16] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_7_time_out_counter_reg[16]_i_1__0 ),
        .Q(time_out_counter_reg[16]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[16]_i_1__0 
       (.CI(\n_0_time_out_counter_reg[12]_i_1__0 ),
        .CO({\NLW_time_out_counter_reg[16]_i_1__0_CO_UNCONNECTED [3:1],\n_3_time_out_counter_reg[16]_i_1__0 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\NLW_time_out_counter_reg[16]_i_1__0_O_UNCONNECTED [3:2],\n_6_time_out_counter_reg[16]_i_1__0 ,\n_7_time_out_counter_reg[16]_i_1__0 }),
        .S({\<const0> ,\<const0> ,\n_0_time_out_counter[16]_i_2__0 ,\n_0_time_out_counter[16]_i_3 }));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[17] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_6_time_out_counter_reg[16]_i_1__0 ),
        .Q(time_out_counter_reg[17]),
        .R(n_0_reset_time_out_reg));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[1] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_6_time_out_counter_reg[0]_i_2__0 ),
        .Q(time_out_counter_reg[1]),
        .R(n_0_reset_time_out_reg));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[2] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_5_time_out_counter_reg[0]_i_2__0 ),
        .Q(time_out_counter_reg[2]),
        .R(n_0_reset_time_out_reg));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[3] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_4_time_out_counter_reg[0]_i_2__0 ),
        .Q(time_out_counter_reg[3]),
        .R(n_0_reset_time_out_reg));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[4] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_7_time_out_counter_reg[4]_i_1__0 ),
        .Q(time_out_counter_reg[4]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[4]_i_1__0 
       (.CI(\n_0_time_out_counter_reg[0]_i_2__0 ),
        .CO({\n_0_time_out_counter_reg[4]_i_1__0 ,\n_1_time_out_counter_reg[4]_i_1__0 ,\n_2_time_out_counter_reg[4]_i_1__0 ,\n_3_time_out_counter_reg[4]_i_1__0 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_time_out_counter_reg[4]_i_1__0 ,\n_5_time_out_counter_reg[4]_i_1__0 ,\n_6_time_out_counter_reg[4]_i_1__0 ,\n_7_time_out_counter_reg[4]_i_1__0 }),
        .S({\n_0_time_out_counter[4]_i_2__0 ,\n_0_time_out_counter[4]_i_3__0 ,\n_0_time_out_counter[4]_i_4__0 ,\n_0_time_out_counter[4]_i_5__0 }));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[5] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_6_time_out_counter_reg[4]_i_1__0 ),
        .Q(time_out_counter_reg[5]),
        .R(n_0_reset_time_out_reg));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[6] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_5_time_out_counter_reg[4]_i_1__0 ),
        .Q(time_out_counter_reg[6]),
        .R(n_0_reset_time_out_reg));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[7] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_4_time_out_counter_reg[4]_i_1__0 ),
        .Q(time_out_counter_reg[7]),
        .R(n_0_reset_time_out_reg));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[8] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_7_time_out_counter_reg[8]_i_1__0 ),
        .Q(time_out_counter_reg[8]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[8]_i_1__0 
       (.CI(\n_0_time_out_counter_reg[4]_i_1__0 ),
        .CO({\n_0_time_out_counter_reg[8]_i_1__0 ,\n_1_time_out_counter_reg[8]_i_1__0 ,\n_2_time_out_counter_reg[8]_i_1__0 ,\n_3_time_out_counter_reg[8]_i_1__0 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_time_out_counter_reg[8]_i_1__0 ,\n_5_time_out_counter_reg[8]_i_1__0 ,\n_6_time_out_counter_reg[8]_i_1__0 ,\n_7_time_out_counter_reg[8]_i_1__0 }),
        .S({\n_0_time_out_counter[8]_i_2__0 ,\n_0_time_out_counter[8]_i_3__0 ,\n_0_time_out_counter[8]_i_4__0 ,\n_0_time_out_counter[8]_i_5__0 }));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[9] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_6_time_out_counter_reg[8]_i_1__0 ),
        .Q(time_out_counter_reg[9]),
        .R(n_0_reset_time_out_reg));
data_mgtdata_mgt_cdc_sync__parameterized0_12 time_out_wait_bypass_cdc_sync
       (.I1(n_0_time_out_wait_bypass_reg),
        .O1(n_0_time_out_wait_bypass_cdc_sync),
        .init_clk_in(init_clk_in));
LUT3 #(
    .INIT(8'hA8)) 
     time_out_wait_bypass_i_1__0
       (.I0(n_0_run_phase_alignment_int_s3_reg),
        .I1(n_0_time_out_wait_bypass_reg),
        .I2(time_out_wait_bypass1_out),
        .O(n_0_time_out_wait_bypass_i_1__0));
LUT6 #(
    .INIT(64'h0000000000000200)) 
     time_out_wait_bypass_i_2__0
       (.I0(\n_0_wait_bypass_count[0]_i_4 ),
        .I1(rx_fsm_reset_done_int_s3),
        .I2(wait_bypass_count_reg[5]),
        .I3(wait_bypass_count_reg[7]),
        .I4(wait_bypass_count_reg[4]),
        .I5(\n_0_wait_bypass_count[0]_i_5 ),
        .O(time_out_wait_bypass1_out));
FDRE #(
    .INIT(1'b0)) 
     time_out_wait_bypass_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_time_out_wait_bypass_i_1__0),
        .Q(n_0_time_out_wait_bypass_reg),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     time_out_wait_bypass_s3_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_time_out_wait_bypass_cdc_sync),
        .Q(time_out_wait_bypass_s3),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair53" *) 
   LUT4 #(
    .INIT(16'h00EA)) 
     time_tlock_max_i_1
       (.I0(time_tlock_max),
        .I1(time_tlock_max1),
        .I2(n_0_check_tlock_max_reg),
        .I3(n_0_reset_time_out_reg),
        .O(n_0_time_tlock_max_i_1));
LUT5 #(
    .INIT(32'h00000010)) 
     time_tlock_max_i_10
       (.I0(time_out_counter_reg[4]),
        .I1(time_out_counter_reg[2]),
        .I2(time_out_counter_reg[3]),
        .I3(time_out_counter_reg[0]),
        .I4(time_out_counter_reg[1]),
        .O(n_0_time_tlock_max_i_10));
LUT3 #(
    .INIT(8'hFE)) 
     time_tlock_max_i_3
       (.I0(time_out_counter_reg[17]),
        .I1(time_out_counter_reg[15]),
        .I2(time_out_counter_reg[16]),
        .O(n_0_time_tlock_max_i_3));
LUT5 #(
    .INIT(32'hFFFFFFA8)) 
     time_tlock_max_i_4
       (.I0(time_out_counter_reg[12]),
        .I1(time_out_counter_reg[10]),
        .I2(time_out_counter_reg[11]),
        .I3(time_out_counter_reg[14]),
        .I4(time_out_counter_reg[13]),
        .O(n_0_time_tlock_max_i_4));
LUT5 #(
    .INIT(32'hE0000000)) 
     time_tlock_max_i_5
       (.I0(time_out_counter_reg[6]),
        .I1(time_out_counter_reg[5]),
        .I2(time_out_counter_reg[9]),
        .I3(time_out_counter_reg[7]),
        .I4(time_out_counter_reg[8]),
        .O(n_0_time_tlock_max_i_5));
LUT5 #(
    .INIT(32'hEEEEEEEA)) 
     time_tlock_max_i_6
       (.I0(time_out_counter_reg[4]),
        .I1(time_out_counter_reg[3]),
        .I2(time_out_counter_reg[2]),
        .I3(time_out_counter_reg[0]),
        .I4(time_out_counter_reg[1]),
        .O(n_0_time_tlock_max_i_6));
LUT3 #(
    .INIT(8'h01)) 
     time_tlock_max_i_7
       (.I0(time_out_counter_reg[15]),
        .I1(time_out_counter_reg[16]),
        .I2(time_out_counter_reg[17]),
        .O(n_0_time_tlock_max_i_7));
LUT5 #(
    .INIT(32'h00000004)) 
     time_tlock_max_i_8
       (.I0(time_out_counter_reg[14]),
        .I1(time_out_counter_reg[12]),
        .I2(time_out_counter_reg[10]),
        .I3(time_out_counter_reg[13]),
        .I4(time_out_counter_reg[11]),
        .O(n_0_time_tlock_max_i_8));
LUT5 #(
    .INIT(32'h00000080)) 
     time_tlock_max_i_9
       (.I0(time_out_counter_reg[9]),
        .I1(time_out_counter_reg[7]),
        .I2(time_out_counter_reg[8]),
        .I3(time_out_counter_reg[5]),
        .I4(time_out_counter_reg[6]),
        .O(n_0_time_tlock_max_i_9));
FDRE #(
    .INIT(1'b0)) 
     time_tlock_max_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_time_tlock_max_i_1),
        .Q(time_tlock_max),
        .R(\<const0> ));
CARRY4 time_tlock_max_reg_i_2
       (.CI(\<const0> ),
        .CO({time_tlock_max1,n_1_time_tlock_max_reg_i_2,n_2_time_tlock_max_reg_i_2,n_3_time_tlock_max_reg_i_2}),
        .CYINIT(\<const0> ),
        .DI({n_0_time_tlock_max_i_3,n_0_time_tlock_max_i_4,n_0_time_tlock_max_i_5,n_0_time_tlock_max_i_6}),
        .O(NLW_time_tlock_max_reg_i_2_O_UNCONNECTED[3:0]),
        .S({n_0_time_tlock_max_i_7,n_0_time_tlock_max_i_8,n_0_time_tlock_max_i_9,n_0_time_tlock_max_i_10}));
LUT1 #(
    .INIT(2'h1)) 
     \wait_bypass_count[0]_i_1__0 
       (.I0(n_0_run_phase_alignment_int_s3_reg),
        .O(\n_0_wait_bypass_count[0]_i_1__0 ));
LUT6 #(
    .INIT(64'h00000000FFFFFFDF)) 
     \wait_bypass_count[0]_i_2__0 
       (.I0(\n_0_wait_bypass_count[0]_i_4 ),
        .I1(\n_0_wait_bypass_count[0]_i_5 ),
        .I2(wait_bypass_count_reg[7]),
        .I3(wait_bypass_count_reg[4]),
        .I4(wait_bypass_count_reg[5]),
        .I5(rx_fsm_reset_done_int_s3),
        .O(\n_0_wait_bypass_count[0]_i_2__0 ));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     \wait_bypass_count[0]_i_4 
       (.I0(wait_bypass_count_reg[2]),
        .I1(wait_bypass_count_reg[12]),
        .I2(wait_bypass_count_reg[0]),
        .I3(wait_bypass_count_reg[1]),
        .I4(wait_bypass_count_reg[9]),
        .I5(wait_bypass_count_reg[8]),
        .O(\n_0_wait_bypass_count[0]_i_4 ));
LUT4 #(
    .INIT(16'hFFFE)) 
     \wait_bypass_count[0]_i_5 
       (.I0(wait_bypass_count_reg[3]),
        .I1(wait_bypass_count_reg[11]),
        .I2(wait_bypass_count_reg[6]),
        .I3(wait_bypass_count_reg[10]),
        .O(\n_0_wait_bypass_count[0]_i_5 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[0]_i_6__0 
       (.I0(wait_bypass_count_reg[3]),
        .O(\n_0_wait_bypass_count[0]_i_6__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[0]_i_7__0 
       (.I0(wait_bypass_count_reg[2]),
        .O(\n_0_wait_bypass_count[0]_i_7__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[0]_i_8 
       (.I0(wait_bypass_count_reg[1]),
        .O(\n_0_wait_bypass_count[0]_i_8 ));
LUT1 #(
    .INIT(2'h1)) 
     \wait_bypass_count[0]_i_9 
       (.I0(wait_bypass_count_reg[0]),
        .O(\n_0_wait_bypass_count[0]_i_9 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[12]_i_2__0 
       (.I0(wait_bypass_count_reg[12]),
        .O(\n_0_wait_bypass_count[12]_i_2__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_2__0 
       (.I0(wait_bypass_count_reg[7]),
        .O(\n_0_wait_bypass_count[4]_i_2__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_3__0 
       (.I0(wait_bypass_count_reg[6]),
        .O(\n_0_wait_bypass_count[4]_i_3__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_4__0 
       (.I0(wait_bypass_count_reg[5]),
        .O(\n_0_wait_bypass_count[4]_i_4__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_5__0 
       (.I0(wait_bypass_count_reg[4]),
        .O(\n_0_wait_bypass_count[4]_i_5__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_2__0 
       (.I0(wait_bypass_count_reg[11]),
        .O(\n_0_wait_bypass_count[8]_i_2__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_3__0 
       (.I0(wait_bypass_count_reg[10]),
        .O(\n_0_wait_bypass_count[8]_i_3__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_4__0 
       (.I0(wait_bypass_count_reg[9]),
        .O(\n_0_wait_bypass_count[8]_i_4__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_5__0 
       (.I0(wait_bypass_count_reg[8]),
        .O(\n_0_wait_bypass_count[8]_i_5__0 ));
(* counter = "25" *) 
   FDRE \wait_bypass_count_reg[0] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_7_wait_bypass_count_reg[0]_i_3__0 ),
        .Q(wait_bypass_count_reg[0]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
CARRY4 \wait_bypass_count_reg[0]_i_3__0 
       (.CI(\<const0> ),
        .CO({\n_0_wait_bypass_count_reg[0]_i_3__0 ,\n_1_wait_bypass_count_reg[0]_i_3__0 ,\n_2_wait_bypass_count_reg[0]_i_3__0 ,\n_3_wait_bypass_count_reg[0]_i_3__0 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const1> }),
        .O({\n_4_wait_bypass_count_reg[0]_i_3__0 ,\n_5_wait_bypass_count_reg[0]_i_3__0 ,\n_6_wait_bypass_count_reg[0]_i_3__0 ,\n_7_wait_bypass_count_reg[0]_i_3__0 }),
        .S({\n_0_wait_bypass_count[0]_i_6__0 ,\n_0_wait_bypass_count[0]_i_7__0 ,\n_0_wait_bypass_count[0]_i_8 ,\n_0_wait_bypass_count[0]_i_9 }));
(* counter = "25" *) 
   FDRE \wait_bypass_count_reg[10] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_5_wait_bypass_count_reg[8]_i_1__0 ),
        .Q(wait_bypass_count_reg[10]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
(* counter = "25" *) 
   FDRE \wait_bypass_count_reg[11] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_4_wait_bypass_count_reg[8]_i_1__0 ),
        .Q(wait_bypass_count_reg[11]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
(* counter = "25" *) 
   FDRE \wait_bypass_count_reg[12] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_7_wait_bypass_count_reg[12]_i_1__0 ),
        .Q(wait_bypass_count_reg[12]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
CARRY4 \wait_bypass_count_reg[12]_i_1__0 
       (.CI(\n_0_wait_bypass_count_reg[8]_i_1__0 ),
        .CO(\NLW_wait_bypass_count_reg[12]_i_1__0_CO_UNCONNECTED [3:0]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\NLW_wait_bypass_count_reg[12]_i_1__0_O_UNCONNECTED [3:1],\n_7_wait_bypass_count_reg[12]_i_1__0 }),
        .S({\<const0> ,\<const0> ,\<const0> ,\n_0_wait_bypass_count[12]_i_2__0 }));
(* counter = "25" *) 
   FDRE \wait_bypass_count_reg[1] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_6_wait_bypass_count_reg[0]_i_3__0 ),
        .Q(wait_bypass_count_reg[1]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
(* counter = "25" *) 
   FDRE \wait_bypass_count_reg[2] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_5_wait_bypass_count_reg[0]_i_3__0 ),
        .Q(wait_bypass_count_reg[2]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
(* counter = "25" *) 
   FDRE \wait_bypass_count_reg[3] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_4_wait_bypass_count_reg[0]_i_3__0 ),
        .Q(wait_bypass_count_reg[3]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
(* counter = "25" *) 
   FDRE \wait_bypass_count_reg[4] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_7_wait_bypass_count_reg[4]_i_1__0 ),
        .Q(wait_bypass_count_reg[4]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
CARRY4 \wait_bypass_count_reg[4]_i_1__0 
       (.CI(\n_0_wait_bypass_count_reg[0]_i_3__0 ),
        .CO({\n_0_wait_bypass_count_reg[4]_i_1__0 ,\n_1_wait_bypass_count_reg[4]_i_1__0 ,\n_2_wait_bypass_count_reg[4]_i_1__0 ,\n_3_wait_bypass_count_reg[4]_i_1__0 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_wait_bypass_count_reg[4]_i_1__0 ,\n_5_wait_bypass_count_reg[4]_i_1__0 ,\n_6_wait_bypass_count_reg[4]_i_1__0 ,\n_7_wait_bypass_count_reg[4]_i_1__0 }),
        .S({\n_0_wait_bypass_count[4]_i_2__0 ,\n_0_wait_bypass_count[4]_i_3__0 ,\n_0_wait_bypass_count[4]_i_4__0 ,\n_0_wait_bypass_count[4]_i_5__0 }));
(* counter = "25" *) 
   FDRE \wait_bypass_count_reg[5] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_6_wait_bypass_count_reg[4]_i_1__0 ),
        .Q(wait_bypass_count_reg[5]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
(* counter = "25" *) 
   FDRE \wait_bypass_count_reg[6] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_5_wait_bypass_count_reg[4]_i_1__0 ),
        .Q(wait_bypass_count_reg[6]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
(* counter = "25" *) 
   FDRE \wait_bypass_count_reg[7] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_4_wait_bypass_count_reg[4]_i_1__0 ),
        .Q(wait_bypass_count_reg[7]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
(* counter = "25" *) 
   FDRE \wait_bypass_count_reg[8] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_7_wait_bypass_count_reg[8]_i_1__0 ),
        .Q(wait_bypass_count_reg[8]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
CARRY4 \wait_bypass_count_reg[8]_i_1__0 
       (.CI(\n_0_wait_bypass_count_reg[4]_i_1__0 ),
        .CO({\n_0_wait_bypass_count_reg[8]_i_1__0 ,\n_1_wait_bypass_count_reg[8]_i_1__0 ,\n_2_wait_bypass_count_reg[8]_i_1__0 ,\n_3_wait_bypass_count_reg[8]_i_1__0 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_wait_bypass_count_reg[8]_i_1__0 ,\n_5_wait_bypass_count_reg[8]_i_1__0 ,\n_6_wait_bypass_count_reg[8]_i_1__0 ,\n_7_wait_bypass_count_reg[8]_i_1__0 }),
        .S({\n_0_wait_bypass_count[8]_i_2__0 ,\n_0_wait_bypass_count[8]_i_3__0 ,\n_0_wait_bypass_count[8]_i_4__0 ,\n_0_wait_bypass_count[8]_i_5__0 }));
(* counter = "25" *) 
   FDRE \wait_bypass_count_reg[9] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_6_wait_bypass_count_reg[8]_i_1__0 ),
        .Q(wait_bypass_count_reg[9]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
endmodule

(* ORIG_REF_NAME = "data_mgt_tx_startup_fsm" *) 
module data_mgtdata_mgt_tx_startup_fsm__parameterized0
   (cplllock_sync,
    O1,
    TX_RESETDONE_OUT,
    GT1_GTTXRESET_IN,
    GT1_CPLLRESET_IN,
    GT1_TXUSERRDY_IN,
    SR,
    init_clk_in,
    user_clk,
    CPLLLOCK,
    txfsm_txresetdone_r,
    GT_RESET,
    GT1_CPLLREFCLKLOST_OUT,
    GT0_CPLLREFCLKLOST_OUT,
    I1);
  output cplllock_sync;
  output O1;
  output TX_RESETDONE_OUT;
  output GT1_GTTXRESET_IN;
  output GT1_CPLLRESET_IN;
  output GT1_TXUSERRDY_IN;
  output [0:0]SR;
  input init_clk_in;
  input user_clk;
  input CPLLLOCK;
  input txfsm_txresetdone_r;
  input GT_RESET;
  input GT1_CPLLREFCLKLOST_OUT;
  input GT0_CPLLREFCLKLOST_OUT;
  input I1;

  wire \<const0> ;
  wire \<const1> ;
  wire CPLLLOCK;
  wire GT0_CPLLREFCLKLOST_OUT;
  wire GT1_CPLLREFCLKLOST_OUT;
  wire GT1_CPLLRESET_IN;
  wire GT1_GTTXRESET_IN;
  wire GT1_TXUSERRDY_IN;
  wire GT_RESET;
  wire I1;
  wire O1;
  wire [0:0]SR;
  wire TX_RESETDONE_OUT;
  wire clear;
  wire cplllock_sync;
  wire init_clk_in;
  wire [5:0]init_wait_count_reg__0;
  wire init_wait_done;
  wire [9:0]mmcm_lock_count_reg__0;
  wire mmcm_lock_reclocked;
  wire n_0_CPLL_RESET_i_1;
  wire n_0_CPLL_RESET_i_2;
  wire \n_0_FSM_onehot_tx_state[1]_i_1 ;
  wire \n_0_FSM_onehot_tx_state[1]_i_2 ;
  wire \n_0_FSM_onehot_tx_state[1]_i_3 ;
  wire \n_0_FSM_onehot_tx_state[1]_i_4 ;
  wire \n_0_FSM_onehot_tx_state[1]_i_5 ;
  wire \n_0_FSM_onehot_tx_state[2]_i_1 ;
  wire \n_0_FSM_onehot_tx_state[3]_i_1 ;
  wire \n_0_FSM_onehot_tx_state[4]_i_1 ;
  wire \n_0_FSM_onehot_tx_state[5]_i_1 ;
  wire \n_0_FSM_onehot_tx_state[6]_i_1 ;
  wire \n_0_FSM_onehot_tx_state[6]_i_2 ;
  wire \n_0_FSM_onehot_tx_state[7]_i_1 ;
  wire \n_0_FSM_onehot_tx_state[7]_i_10 ;
  wire \n_0_FSM_onehot_tx_state[7]_i_11 ;
  wire \n_0_FSM_onehot_tx_state[7]_i_12 ;
  wire \n_0_FSM_onehot_tx_state[7]_i_3 ;
  wire \n_0_FSM_onehot_tx_state[7]_i_4 ;
  wire \n_0_FSM_onehot_tx_state[7]_i_6 ;
  wire \n_0_FSM_onehot_tx_state[7]_i_7 ;
  wire \n_0_FSM_onehot_tx_state[7]_i_8 ;
  wire \n_0_FSM_onehot_tx_state_reg[0] ;
  wire \n_0_FSM_onehot_tx_state_reg[1] ;
  wire \n_0_FSM_onehot_tx_state_reg[2] ;
  wire \n_0_FSM_onehot_tx_state_reg[3] ;
  wire \n_0_FSM_onehot_tx_state_reg[4] ;
  wire \n_0_FSM_onehot_tx_state_reg[5] ;
  wire \n_0_FSM_onehot_tx_state_reg[6] ;
  wire \n_0_FSM_onehot_tx_state_reg[7] ;
  wire n_0_GTTXRESET_i_1;
  wire n_0_GTTXRESET_i_2;
  wire n_0_TXUSERRDY_i_1;
  wire n_0_TXUSERRDY_i_2;
  wire n_0_TXUSERRDY_i_3;
  wire \n_0_init_wait_count[5]_i_1 ;
  wire n_0_init_wait_done_i_1;
  wire n_0_init_wait_done_i_2;
  wire \n_0_mmcm_lock_count[9]_i_2__0 ;
  wire \n_0_mmcm_lock_count[9]_i_4__0 ;
  wire \n_0_mmcm_lock_count[9]_i_5 ;
  wire n_0_pll_reset_asserted_i_1;
  wire n_0_pll_reset_asserted_i_2;
  wire n_0_run_phase_alignment_int_i_1;
  wire n_0_time_out_2ms_i_1;
  wire n_0_time_out_2ms_i_2;
  wire n_0_time_out_500us_i_1;
  wire n_0_time_out_500us_i_2;
  wire n_0_time_out_500us_i_3;
  wire n_0_time_out_500us_i_4;
  wire n_0_time_out_500us_i_5;
  wire \n_0_time_out_counter[0]_i_1 ;
  wire \n_0_time_out_counter[0]_i_3 ;
  wire \n_0_time_out_counter[0]_i_4 ;
  wire \n_0_time_out_counter[0]_i_5 ;
  wire \n_0_time_out_counter[0]_i_6 ;
  wire \n_0_time_out_counter[0]_i_7__0 ;
  wire \n_0_time_out_counter[0]_i_8__0 ;
  wire \n_0_time_out_counter[0]_i_9 ;
  wire \n_0_time_out_counter[12]_i_2 ;
  wire \n_0_time_out_counter[12]_i_3 ;
  wire \n_0_time_out_counter[12]_i_4 ;
  wire \n_0_time_out_counter[12]_i_5 ;
  wire \n_0_time_out_counter[16]_i_2 ;
  wire \n_0_time_out_counter[4]_i_2 ;
  wire \n_0_time_out_counter[4]_i_3 ;
  wire \n_0_time_out_counter[4]_i_4 ;
  wire \n_0_time_out_counter[4]_i_5 ;
  wire \n_0_time_out_counter[8]_i_2 ;
  wire \n_0_time_out_counter[8]_i_3 ;
  wire \n_0_time_out_counter[8]_i_4 ;
  wire \n_0_time_out_counter[8]_i_5 ;
  wire \n_0_time_out_counter_reg[0]_i_2 ;
  wire \n_0_time_out_counter_reg[12]_i_1 ;
  wire \n_0_time_out_counter_reg[4]_i_1 ;
  wire \n_0_time_out_counter_reg[8]_i_1 ;
  wire n_0_time_out_wait_bypass_cdc_sync;
  wire n_0_time_out_wait_bypass_i_1;
  wire n_0_time_out_wait_bypass_i_2;
  wire n_0_time_out_wait_bypass_i_3;
  wire n_0_time_out_wait_bypass_i_4;
  wire n_0_time_out_wait_bypass_i_5;
  wire n_0_time_tlock_max_i_1;
  wire n_0_time_tlock_max_i_2;
  wire n_0_time_tlock_max_i_3__0;
  wire n_0_tx_fsm_reset_done_int_cdc_sync;
  wire n_0_tx_fsm_reset_done_int_i_1;
  wire n_0_tx_fsm_reset_done_int_i_2;
  wire n_0_tx_fsm_reset_done_int_i_3;
  wire n_0_tx_fsm_reset_done_int_i_4;
  wire n_0_txresetdone_cdc_sync;
  wire \n_0_wait_bypass_count[0]_i_2 ;
  wire \n_0_wait_bypass_count[0]_i_4__0 ;
  wire \n_0_wait_bypass_count[0]_i_5__0 ;
  wire \n_0_wait_bypass_count[0]_i_6 ;
  wire \n_0_wait_bypass_count[0]_i_7 ;
  wire \n_0_wait_bypass_count[12]_i_2 ;
  wire \n_0_wait_bypass_count[12]_i_3 ;
  wire \n_0_wait_bypass_count[12]_i_4 ;
  wire \n_0_wait_bypass_count[12]_i_5 ;
  wire \n_0_wait_bypass_count[16]_i_2 ;
  wire \n_0_wait_bypass_count[4]_i_2 ;
  wire \n_0_wait_bypass_count[4]_i_3 ;
  wire \n_0_wait_bypass_count[4]_i_4 ;
  wire \n_0_wait_bypass_count[4]_i_5 ;
  wire \n_0_wait_bypass_count[8]_i_2 ;
  wire \n_0_wait_bypass_count[8]_i_3 ;
  wire \n_0_wait_bypass_count[8]_i_4 ;
  wire \n_0_wait_bypass_count[8]_i_5 ;
  wire \n_0_wait_bypass_count_reg[0]_i_3 ;
  wire \n_0_wait_bypass_count_reg[12]_i_1 ;
  wire \n_0_wait_bypass_count_reg[4]_i_1 ;
  wire \n_0_wait_bypass_count_reg[8]_i_1 ;
  wire n_1_cplllock_cdc_sync;
  wire \n_1_time_out_counter_reg[0]_i_2 ;
  wire \n_1_time_out_counter_reg[12]_i_1 ;
  wire \n_1_time_out_counter_reg[4]_i_1 ;
  wire \n_1_time_out_counter_reg[8]_i_1 ;
  wire \n_1_wait_bypass_count_reg[0]_i_3 ;
  wire \n_1_wait_bypass_count_reg[12]_i_1 ;
  wire \n_1_wait_bypass_count_reg[4]_i_1 ;
  wire \n_1_wait_bypass_count_reg[8]_i_1 ;
  wire n_2_cplllock_cdc_sync;
  wire n_2_mmcm_lock_reclocked_cdc_sync;
  wire \n_2_time_out_counter_reg[0]_i_2 ;
  wire \n_2_time_out_counter_reg[12]_i_1 ;
  wire \n_2_time_out_counter_reg[4]_i_1 ;
  wire \n_2_time_out_counter_reg[8]_i_1 ;
  wire \n_2_wait_bypass_count_reg[0]_i_3 ;
  wire \n_2_wait_bypass_count_reg[12]_i_1 ;
  wire \n_2_wait_bypass_count_reg[4]_i_1 ;
  wire \n_2_wait_bypass_count_reg[8]_i_1 ;
  wire \n_3_time_out_counter_reg[0]_i_2 ;
  wire \n_3_time_out_counter_reg[12]_i_1 ;
  wire \n_3_time_out_counter_reg[4]_i_1 ;
  wire \n_3_time_out_counter_reg[8]_i_1 ;
  wire \n_3_wait_bypass_count_reg[0]_i_3 ;
  wire \n_3_wait_bypass_count_reg[12]_i_1 ;
  wire \n_3_wait_bypass_count_reg[4]_i_1 ;
  wire \n_3_wait_bypass_count_reg[8]_i_1 ;
  wire \n_4_time_out_counter_reg[0]_i_2 ;
  wire \n_4_time_out_counter_reg[12]_i_1 ;
  wire \n_4_time_out_counter_reg[4]_i_1 ;
  wire \n_4_time_out_counter_reg[8]_i_1 ;
  wire \n_4_wait_bypass_count_reg[0]_i_3 ;
  wire \n_4_wait_bypass_count_reg[12]_i_1 ;
  wire \n_4_wait_bypass_count_reg[4]_i_1 ;
  wire \n_4_wait_bypass_count_reg[8]_i_1 ;
  wire \n_5_time_out_counter_reg[0]_i_2 ;
  wire \n_5_time_out_counter_reg[12]_i_1 ;
  wire \n_5_time_out_counter_reg[4]_i_1 ;
  wire \n_5_time_out_counter_reg[8]_i_1 ;
  wire \n_5_wait_bypass_count_reg[0]_i_3 ;
  wire \n_5_wait_bypass_count_reg[12]_i_1 ;
  wire \n_5_wait_bypass_count_reg[4]_i_1 ;
  wire \n_5_wait_bypass_count_reg[8]_i_1 ;
  wire \n_6_time_out_counter_reg[0]_i_2 ;
  wire \n_6_time_out_counter_reg[12]_i_1 ;
  wire \n_6_time_out_counter_reg[4]_i_1 ;
  wire \n_6_time_out_counter_reg[8]_i_1 ;
  wire \n_6_wait_bypass_count_reg[0]_i_3 ;
  wire \n_6_wait_bypass_count_reg[12]_i_1 ;
  wire \n_6_wait_bypass_count_reg[4]_i_1 ;
  wire \n_6_wait_bypass_count_reg[8]_i_1 ;
  wire \n_7_time_out_counter_reg[0]_i_2 ;
  wire \n_7_time_out_counter_reg[12]_i_1 ;
  wire \n_7_time_out_counter_reg[16]_i_1 ;
  wire \n_7_time_out_counter_reg[4]_i_1 ;
  wire \n_7_time_out_counter_reg[8]_i_1 ;
  wire \n_7_wait_bypass_count_reg[0]_i_3 ;
  wire \n_7_wait_bypass_count_reg[12]_i_1 ;
  wire \n_7_wait_bypass_count_reg[16]_i_1 ;
  wire \n_7_wait_bypass_count_reg[4]_i_1 ;
  wire \n_7_wait_bypass_count_reg[8]_i_1 ;
  wire [5:0]p_0_in;
  wire [9:0]p_0_in__2;
  wire pll_reset_asserted;
  wire reset_time_out;
  wire run_phase_alignment_int;
  wire run_phase_alignment_int_s3;
  wire s_level_out_d3;
  wire time_out_2ms;
  wire time_out_500us;
  wire [16:0]time_out_counter_reg;
  wire time_out_wait_bypass;
  wire time_out_wait_bypass_s3;
  wire time_tlock_max;
  wire tx_fsm_reset_done_int_s3;
  wire txfsm_txresetdone_r;
  wire txresetdone_s3;
  wire user_clk;
  wire [16:0]wait_bypass_count_reg;
  wire [3:0]\NLW_time_out_counter_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_time_out_counter_reg[16]_i_1_O_UNCONNECTED ;
  wire [3:0]\NLW_wait_bypass_count_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_wait_bypass_count_reg[16]_i_1_O_UNCONNECTED ;

LUT4 #(
    .INIT(16'h002E)) 
     CPLL_RESET_i_1
       (.I0(GT1_CPLLRESET_IN),
        .I1(n_0_CPLL_RESET_i_2),
        .I2(pll_reset_asserted),
        .I3(\n_0_FSM_onehot_tx_state[7]_i_1 ),
        .O(n_0_CPLL_RESET_i_1));
LUT6 #(
    .INIT(64'h0000000000000010)) 
     CPLL_RESET_i_2
       (.I0(\n_0_FSM_onehot_tx_state_reg[5] ),
        .I1(\n_0_FSM_onehot_tx_state_reg[3] ),
        .I2(\n_0_FSM_onehot_tx_state_reg[1] ),
        .I3(\n_0_FSM_onehot_tx_state_reg[2] ),
        .I4(\n_0_FSM_onehot_tx_state_reg[6] ),
        .I5(\n_0_FSM_onehot_tx_state_reg[4] ),
        .O(n_0_CPLL_RESET_i_2));
FDRE #(
    .INIT(1'b0)) 
     CPLL_RESET_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_CPLL_RESET_i_1),
        .Q(GT1_CPLLRESET_IN),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'hF00AFF0C000A0F0C)) 
     \FSM_onehot_tx_state[1]_i_1 
       (.I0(time_out_wait_bypass_s3),
        .I1(\n_0_FSM_onehot_tx_state[1]_i_2 ),
        .I2(\n_0_FSM_onehot_tx_state[7]_i_7 ),
        .I3(\n_0_FSM_onehot_tx_state[7]_i_6 ),
        .I4(\n_0_FSM_onehot_tx_state[6]_i_2 ),
        .I5(\n_0_FSM_onehot_tx_state[1]_i_3 ),
        .O(\n_0_FSM_onehot_tx_state[1]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair37" *) 
   LUT2 #(
    .INIT(4'h2)) 
     \FSM_onehot_tx_state[1]_i_2 
       (.I0(time_out_500us),
        .I1(reset_time_out),
        .O(\n_0_FSM_onehot_tx_state[1]_i_2 ));
LUT6 #(
    .INIT(64'hFFFF04FF00000400)) 
     \FSM_onehot_tx_state[1]_i_3 
       (.I0(mmcm_lock_reclocked),
        .I1(time_tlock_max),
        .I2(reset_time_out),
        .I3(\n_0_FSM_onehot_tx_state[1]_i_4 ),
        .I4(\n_0_FSM_onehot_tx_state[1]_i_5 ),
        .I5(time_out_2ms),
        .O(\n_0_FSM_onehot_tx_state[1]_i_3 ));
(* SOFT_HLUTNM = "soft_lutpair33" *) 
   LUT5 #(
    .INIT(32'h00030302)) 
     \FSM_onehot_tx_state[1]_i_4 
       (.I0(\n_0_FSM_onehot_tx_state_reg[3] ),
        .I1(\n_0_FSM_onehot_tx_state_reg[4] ),
        .I2(\n_0_FSM_onehot_tx_state_reg[6] ),
        .I3(\n_0_FSM_onehot_tx_state_reg[5] ),
        .I4(\n_0_FSM_onehot_tx_state_reg[1] ),
        .O(\n_0_FSM_onehot_tx_state[1]_i_4 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFE0)) 
     \FSM_onehot_tx_state[1]_i_5 
       (.I0(\n_0_FSM_onehot_tx_state_reg[5] ),
        .I1(\n_0_FSM_onehot_tx_state_reg[1] ),
        .I2(\n_0_FSM_onehot_tx_state_reg[3] ),
        .I3(\n_0_FSM_onehot_tx_state_reg[0] ),
        .I4(\n_0_FSM_onehot_tx_state_reg[2] ),
        .I5(\n_0_FSM_onehot_tx_state_reg[7] ),
        .O(\n_0_FSM_onehot_tx_state[1]_i_5 ));
(* SOFT_HLUTNM = "soft_lutpair34" *) 
   LUT3 #(
    .INIT(8'h20)) 
     \FSM_onehot_tx_state[2]_i_1 
       (.I0(\n_0_FSM_onehot_tx_state[6]_i_2 ),
        .I1(\n_0_FSM_onehot_tx_state[7]_i_7 ),
        .I2(\n_0_FSM_onehot_tx_state[7]_i_6 ),
        .O(\n_0_FSM_onehot_tx_state[2]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair35" *) 
   LUT4 #(
    .INIT(16'h1000)) 
     \FSM_onehot_tx_state[3]_i_1 
       (.I0(\n_0_FSM_onehot_tx_state[6]_i_2 ),
        .I1(time_out_2ms),
        .I2(\n_0_FSM_onehot_tx_state[7]_i_6 ),
        .I3(\n_0_FSM_onehot_tx_state[7]_i_7 ),
        .O(\n_0_FSM_onehot_tx_state[3]_i_1 ));
LUT6 #(
    .INIT(64'hAA8A000000000000)) 
     \FSM_onehot_tx_state[4]_i_1 
       (.I0(\n_0_FSM_onehot_tx_state[6]_i_2 ),
        .I1(reset_time_out),
        .I2(time_tlock_max),
        .I3(mmcm_lock_reclocked),
        .I4(\n_0_FSM_onehot_tx_state[7]_i_6 ),
        .I5(\n_0_FSM_onehot_tx_state[7]_i_7 ),
        .O(\n_0_FSM_onehot_tx_state[4]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair34" *) 
   LUT5 #(
    .INIT(32'h00000045)) 
     \FSM_onehot_tx_state[5]_i_1 
       (.I0(\n_0_FSM_onehot_tx_state[7]_i_6 ),
        .I1(reset_time_out),
        .I2(time_out_500us),
        .I3(\n_0_FSM_onehot_tx_state[7]_i_7 ),
        .I4(\n_0_FSM_onehot_tx_state[6]_i_2 ),
        .O(\n_0_FSM_onehot_tx_state[5]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair35" *) 
   LUT4 #(
    .INIT(16'h0002)) 
     \FSM_onehot_tx_state[6]_i_1 
       (.I0(\n_0_FSM_onehot_tx_state[6]_i_2 ),
        .I1(\n_0_FSM_onehot_tx_state[7]_i_7 ),
        .I2(\n_0_FSM_onehot_tx_state[7]_i_6 ),
        .I3(time_out_wait_bypass_s3),
        .O(\n_0_FSM_onehot_tx_state[6]_i_1 ));
LUT6 #(
    .INIT(64'h0000000100010100)) 
     \FSM_onehot_tx_state[6]_i_2 
       (.I0(\n_0_FSM_onehot_tx_state_reg[6] ),
        .I1(\n_0_FSM_onehot_tx_state_reg[4] ),
        .I2(\n_0_FSM_onehot_tx_state[7]_i_11 ),
        .I3(\n_0_FSM_onehot_tx_state_reg[3] ),
        .I4(\n_0_FSM_onehot_tx_state_reg[1] ),
        .I5(\n_0_FSM_onehot_tx_state_reg[5] ),
        .O(\n_0_FSM_onehot_tx_state[6]_i_2 ));
LUT5 #(
    .INIT(32'hBFAAAAAA)) 
     \FSM_onehot_tx_state[7]_i_1 
       (.I0(GT_RESET),
        .I1(n_0_tx_fsm_reset_done_int_i_3),
        .I2(n_0_tx_fsm_reset_done_int_i_2),
        .I3(GT1_CPLLREFCLKLOST_OUT),
        .I4(GT0_CPLLREFCLKLOST_OUT),
        .O(\n_0_FSM_onehot_tx_state[7]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair37" *) 
   LUT3 #(
    .INIT(8'hBA)) 
     \FSM_onehot_tx_state[7]_i_10 
       (.I0(txresetdone_s3),
        .I1(reset_time_out),
        .I2(time_out_500us),
        .O(\n_0_FSM_onehot_tx_state[7]_i_10 ));
(* SOFT_HLUTNM = "soft_lutpair36" *) 
   LUT3 #(
    .INIT(8'hFE)) 
     \FSM_onehot_tx_state[7]_i_11 
       (.I0(\n_0_FSM_onehot_tx_state_reg[7] ),
        .I1(\n_0_FSM_onehot_tx_state_reg[2] ),
        .I2(\n_0_FSM_onehot_tx_state_reg[0] ),
        .O(\n_0_FSM_onehot_tx_state[7]_i_11 ));
(* SOFT_HLUTNM = "soft_lutpair36" *) 
   LUT3 #(
    .INIT(8'h01)) 
     \FSM_onehot_tx_state[7]_i_12 
       (.I0(\n_0_FSM_onehot_tx_state_reg[0] ),
        .I1(\n_0_FSM_onehot_tx_state_reg[7] ),
        .I2(\n_0_FSM_onehot_tx_state_reg[4] ),
        .O(\n_0_FSM_onehot_tx_state[7]_i_12 ));
LUT2 #(
    .INIT(4'h4)) 
     \FSM_onehot_tx_state[7]_i_3 
       (.I0(\n_0_FSM_onehot_tx_state[7]_i_6 ),
        .I1(\n_0_FSM_onehot_tx_state[7]_i_7 ),
        .O(\n_0_FSM_onehot_tx_state[7]_i_3 ));
LUT6 #(
    .INIT(64'h0DFD0D0DFFFFFFFF)) 
     \FSM_onehot_tx_state[7]_i_4 
       (.I0(\n_0_FSM_onehot_tx_state[7]_i_8 ),
        .I1(mmcm_lock_reclocked),
        .I2(n_0_tx_fsm_reset_done_int_i_3),
        .I3(I1),
        .I4(pll_reset_asserted),
        .I5(n_0_tx_fsm_reset_done_int_i_2),
        .O(\n_0_FSM_onehot_tx_state[7]_i_4 ));
LUT6 #(
    .INIT(64'hFFFFFFFEFFFEFEFF)) 
     \FSM_onehot_tx_state[7]_i_6 
       (.I0(\n_0_FSM_onehot_tx_state_reg[3] ),
        .I1(\n_0_FSM_onehot_tx_state_reg[1] ),
        .I2(\n_0_FSM_onehot_tx_state[7]_i_11 ),
        .I3(\n_0_FSM_onehot_tx_state_reg[5] ),
        .I4(\n_0_FSM_onehot_tx_state_reg[6] ),
        .I5(\n_0_FSM_onehot_tx_state_reg[4] ),
        .O(\n_0_FSM_onehot_tx_state[7]_i_6 ));
LUT6 #(
    .INIT(64'h0000001000101000)) 
     \FSM_onehot_tx_state[7]_i_7 
       (.I0(\n_0_FSM_onehot_tx_state_reg[1] ),
        .I1(\n_0_FSM_onehot_tx_state_reg[5] ),
        .I2(\n_0_FSM_onehot_tx_state[7]_i_12 ),
        .I3(\n_0_FSM_onehot_tx_state_reg[2] ),
        .I4(\n_0_FSM_onehot_tx_state_reg[6] ),
        .I5(\n_0_FSM_onehot_tx_state_reg[3] ),
        .O(\n_0_FSM_onehot_tx_state[7]_i_7 ));
(* SOFT_HLUTNM = "soft_lutpair42" *) 
   LUT2 #(
    .INIT(4'hB)) 
     \FSM_onehot_tx_state[7]_i_8 
       (.I0(reset_time_out),
        .I1(time_tlock_max),
        .O(\n_0_FSM_onehot_tx_state[7]_i_8 ));
FDSE #(
    .INIT(1'b1)) 
     \FSM_onehot_tx_state_reg[0] 
       (.C(init_clk_in),
        .CE(n_1_cplllock_cdc_sync),
        .D(\<const0> ),
        .Q(\n_0_FSM_onehot_tx_state_reg[0] ),
        .S(\n_0_FSM_onehot_tx_state[7]_i_1 ));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_tx_state_reg[1] 
       (.C(init_clk_in),
        .CE(n_1_cplllock_cdc_sync),
        .D(\n_0_FSM_onehot_tx_state[1]_i_1 ),
        .Q(\n_0_FSM_onehot_tx_state_reg[1] ),
        .R(\n_0_FSM_onehot_tx_state[7]_i_1 ));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_tx_state_reg[2] 
       (.C(init_clk_in),
        .CE(n_1_cplllock_cdc_sync),
        .D(\n_0_FSM_onehot_tx_state[2]_i_1 ),
        .Q(\n_0_FSM_onehot_tx_state_reg[2] ),
        .R(\n_0_FSM_onehot_tx_state[7]_i_1 ));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_tx_state_reg[3] 
       (.C(init_clk_in),
        .CE(n_1_cplllock_cdc_sync),
        .D(\n_0_FSM_onehot_tx_state[3]_i_1 ),
        .Q(\n_0_FSM_onehot_tx_state_reg[3] ),
        .R(\n_0_FSM_onehot_tx_state[7]_i_1 ));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_tx_state_reg[4] 
       (.C(init_clk_in),
        .CE(n_1_cplllock_cdc_sync),
        .D(\n_0_FSM_onehot_tx_state[4]_i_1 ),
        .Q(\n_0_FSM_onehot_tx_state_reg[4] ),
        .R(\n_0_FSM_onehot_tx_state[7]_i_1 ));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_tx_state_reg[5] 
       (.C(init_clk_in),
        .CE(n_1_cplllock_cdc_sync),
        .D(\n_0_FSM_onehot_tx_state[5]_i_1 ),
        .Q(\n_0_FSM_onehot_tx_state_reg[5] ),
        .R(\n_0_FSM_onehot_tx_state[7]_i_1 ));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_tx_state_reg[6] 
       (.C(init_clk_in),
        .CE(n_1_cplllock_cdc_sync),
        .D(\n_0_FSM_onehot_tx_state[6]_i_1 ),
        .Q(\n_0_FSM_onehot_tx_state_reg[6] ),
        .R(\n_0_FSM_onehot_tx_state[7]_i_1 ));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_tx_state_reg[7] 
       (.C(init_clk_in),
        .CE(n_1_cplllock_cdc_sync),
        .D(\n_0_FSM_onehot_tx_state[7]_i_3 ),
        .Q(\n_0_FSM_onehot_tx_state_reg[7] ),
        .R(\n_0_FSM_onehot_tx_state[7]_i_1 ));
GND GND
       (.G(\<const0> ));
LUT6 #(
    .INIT(64'h000000002E2A222A)) 
     GTTXRESET_i_1
       (.I0(GT1_GTTXRESET_IN),
        .I1(n_0_tx_fsm_reset_done_int_i_2),
        .I2(\n_0_FSM_onehot_tx_state_reg[3] ),
        .I3(\n_0_FSM_onehot_tx_state_reg[1] ),
        .I4(n_0_GTTXRESET_i_2),
        .I5(\n_0_FSM_onehot_tx_state[7]_i_1 ),
        .O(n_0_GTTXRESET_i_1));
(* SOFT_HLUTNM = "soft_lutpair40" *) 
   LUT2 #(
    .INIT(4'h1)) 
     GTTXRESET_i_2
       (.I0(\n_0_FSM_onehot_tx_state_reg[2] ),
        .I1(\n_0_FSM_onehot_tx_state_reg[6] ),
        .O(n_0_GTTXRESET_i_2));
FDRE #(
    .INIT(1'b0)) 
     GTTXRESET_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_GTTXRESET_i_1),
        .Q(GT1_GTTXRESET_IN),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'h000000008AABAAAA)) 
     TXUSERRDY_i_1
       (.I0(GT1_TXUSERRDY_IN),
        .I1(\n_0_FSM_onehot_tx_state_reg[5] ),
        .I2(n_0_TXUSERRDY_i_2),
        .I3(n_0_TXUSERRDY_i_3),
        .I4(n_0_tx_fsm_reset_done_int_i_3),
        .I5(\n_0_FSM_onehot_tx_state[7]_i_1 ),
        .O(n_0_TXUSERRDY_i_1));
LUT2 #(
    .INIT(4'hE)) 
     TXUSERRDY_i_2
       (.I0(\n_0_FSM_onehot_tx_state_reg[3] ),
        .I1(\n_0_FSM_onehot_tx_state_reg[1] ),
        .O(n_0_TXUSERRDY_i_2));
LUT2 #(
    .INIT(4'h1)) 
     TXUSERRDY_i_3
       (.I0(\n_0_FSM_onehot_tx_state_reg[4] ),
        .I1(\n_0_FSM_onehot_tx_state_reg[6] ),
        .O(n_0_TXUSERRDY_i_3));
FDRE #(
    .INIT(1'b0)) 
     TXUSERRDY_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_TXUSERRDY_i_1),
        .Q(GT1_TXUSERRDY_IN),
        .R(\<const0> ));
VCC VCC
       (.P(\<const1> ));
data_mgtdata_mgt_cdc_sync__parameterized0_16 cplllock_cdc_sync
       (.CPLLLOCK(CPLLLOCK),
        .E(n_1_cplllock_cdc_sync),
        .I1(n_0_tx_fsm_reset_done_int_i_3),
        .I2(n_0_tx_fsm_reset_done_int_i_4),
        .I3(n_0_tx_fsm_reset_done_int_i_2),
        .I4(\n_0_FSM_onehot_tx_state[7]_i_4 ),
        .I5(\n_0_FSM_onehot_tx_state[7]_i_10 ),
        .I6(\n_0_FSM_onehot_tx_state[7]_i_1 ),
        .O1(cplllock_sync),
        .O2(n_2_cplllock_cdc_sync),
        .Q({\n_0_FSM_onehot_tx_state_reg[6] ,\n_0_FSM_onehot_tx_state_reg[5] ,\n_0_FSM_onehot_tx_state_reg[3] ,\n_0_FSM_onehot_tx_state_reg[2] ,\n_0_FSM_onehot_tx_state_reg[1] }),
        .init_clk_in(init_clk_in),
        .init_wait_done(init_wait_done),
        .mmcm_lock_reclocked(mmcm_lock_reclocked),
        .reset_time_out(reset_time_out),
        .time_out_2ms(time_out_2ms),
        .txresetdone_s3(txresetdone_s3));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair44" *) 
   LUT1 #(
    .INIT(2'h1)) 
     \init_wait_count[0]_i_1 
       (.I0(init_wait_count_reg__0[0]),
        .O(p_0_in[0]));
(* SOFT_HLUTNM = "soft_lutpair44" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \init_wait_count[1]_i_1 
       (.I0(init_wait_count_reg__0[1]),
        .I1(init_wait_count_reg__0[0]),
        .O(p_0_in[1]));
(* SOFT_HLUTNM = "soft_lutpair41" *) 
   LUT3 #(
    .INIT(8'h6A)) 
     \init_wait_count[2]_i_1 
       (.I0(init_wait_count_reg__0[2]),
        .I1(init_wait_count_reg__0[0]),
        .I2(init_wait_count_reg__0[1]),
        .O(p_0_in[2]));
(* SOFT_HLUTNM = "soft_lutpair32" *) 
   LUT4 #(
    .INIT(16'h6AAA)) 
     \init_wait_count[3]_i_1 
       (.I0(init_wait_count_reg__0[3]),
        .I1(init_wait_count_reg__0[1]),
        .I2(init_wait_count_reg__0[0]),
        .I3(init_wait_count_reg__0[2]),
        .O(p_0_in[3]));
(* SOFT_HLUTNM = "soft_lutpair32" *) 
   LUT5 #(
    .INIT(32'h6AAAAAAA)) 
     \init_wait_count[4]_i_1 
       (.I0(init_wait_count_reg__0[4]),
        .I1(init_wait_count_reg__0[2]),
        .I2(init_wait_count_reg__0[0]),
        .I3(init_wait_count_reg__0[1]),
        .I4(init_wait_count_reg__0[3]),
        .O(p_0_in[4]));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFF7F)) 
     \init_wait_count[5]_i_1 
       (.I0(init_wait_count_reg__0[1]),
        .I1(init_wait_count_reg__0[0]),
        .I2(init_wait_count_reg__0[5]),
        .I3(init_wait_count_reg__0[4]),
        .I4(init_wait_count_reg__0[3]),
        .I5(init_wait_count_reg__0[2]),
        .O(\n_0_init_wait_count[5]_i_1 ));
LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
     \init_wait_count[5]_i_2 
       (.I0(init_wait_count_reg__0[5]),
        .I1(init_wait_count_reg__0[3]),
        .I2(init_wait_count_reg__0[1]),
        .I3(init_wait_count_reg__0[0]),
        .I4(init_wait_count_reg__0[2]),
        .I5(init_wait_count_reg__0[4]),
        .O(p_0_in[5]));
(* counter = "19" *) 
   FDRE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[0] 
       (.C(init_clk_in),
        .CE(\n_0_init_wait_count[5]_i_1 ),
        .D(p_0_in[0]),
        .Q(init_wait_count_reg__0[0]),
        .R(\<const0> ));
(* counter = "19" *) 
   FDRE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[1] 
       (.C(init_clk_in),
        .CE(\n_0_init_wait_count[5]_i_1 ),
        .D(p_0_in[1]),
        .Q(init_wait_count_reg__0[1]),
        .R(\<const0> ));
(* counter = "19" *) 
   FDRE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[2] 
       (.C(init_clk_in),
        .CE(\n_0_init_wait_count[5]_i_1 ),
        .D(p_0_in[2]),
        .Q(init_wait_count_reg__0[2]),
        .R(\<const0> ));
(* counter = "19" *) 
   FDRE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[3] 
       (.C(init_clk_in),
        .CE(\n_0_init_wait_count[5]_i_1 ),
        .D(p_0_in[3]),
        .Q(init_wait_count_reg__0[3]),
        .R(\<const0> ));
(* counter = "19" *) 
   FDRE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[4] 
       (.C(init_clk_in),
        .CE(\n_0_init_wait_count[5]_i_1 ),
        .D(p_0_in[4]),
        .Q(init_wait_count_reg__0[4]),
        .R(\<const0> ));
(* counter = "19" *) 
   FDRE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[5] 
       (.C(init_clk_in),
        .CE(\n_0_init_wait_count[5]_i_1 ),
        .D(p_0_in[5]),
        .Q(init_wait_count_reg__0[5]),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
     init_wait_done_i_1
       (.I0(init_wait_done),
        .I1(init_wait_count_reg__0[2]),
        .I2(init_wait_count_reg__0[3]),
        .I3(init_wait_count_reg__0[4]),
        .I4(init_wait_count_reg__0[5]),
        .I5(n_0_init_wait_done_i_2),
        .O(n_0_init_wait_done_i_1));
(* SOFT_HLUTNM = "soft_lutpair41" *) 
   LUT2 #(
    .INIT(4'h8)) 
     init_wait_done_i_2
       (.I0(init_wait_count_reg__0[1]),
        .I1(init_wait_count_reg__0[0]),
        .O(n_0_init_wait_done_i_2));
FDRE #(
    .INIT(1'b0)) 
     init_wait_done_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_init_wait_done_i_1),
        .Q(init_wait_done),
        .R(\<const0> ));
LUT1 #(
    .INIT(2'h1)) 
     \mmcm_lock_count[0]_i_1 
       (.I0(mmcm_lock_count_reg__0[0]),
        .O(p_0_in__2[0]));
(* SOFT_HLUTNM = "soft_lutpair38" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \mmcm_lock_count[1]_i_1 
       (.I0(mmcm_lock_count_reg__0[0]),
        .I1(mmcm_lock_count_reg__0[1]),
        .O(p_0_in__2[1]));
(* SOFT_HLUTNM = "soft_lutpair38" *) 
   LUT3 #(
    .INIT(8'h6A)) 
     \mmcm_lock_count[2]_i_1 
       (.I0(mmcm_lock_count_reg__0[2]),
        .I1(mmcm_lock_count_reg__0[1]),
        .I2(mmcm_lock_count_reg__0[0]),
        .O(p_0_in__2[2]));
(* SOFT_HLUTNM = "soft_lutpair30" *) 
   LUT4 #(
    .INIT(16'h6AAA)) 
     \mmcm_lock_count[3]_i_1 
       (.I0(mmcm_lock_count_reg__0[3]),
        .I1(mmcm_lock_count_reg__0[2]),
        .I2(mmcm_lock_count_reg__0[0]),
        .I3(mmcm_lock_count_reg__0[1]),
        .O(p_0_in__2[3]));
(* SOFT_HLUTNM = "soft_lutpair30" *) 
   LUT5 #(
    .INIT(32'h6AAAAAAA)) 
     \mmcm_lock_count[4]_i_1 
       (.I0(mmcm_lock_count_reg__0[4]),
        .I1(mmcm_lock_count_reg__0[3]),
        .I2(mmcm_lock_count_reg__0[1]),
        .I3(mmcm_lock_count_reg__0[0]),
        .I4(mmcm_lock_count_reg__0[2]),
        .O(p_0_in__2[4]));
LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
     \mmcm_lock_count[5]_i_1 
       (.I0(mmcm_lock_count_reg__0[5]),
        .I1(mmcm_lock_count_reg__0[4]),
        .I2(mmcm_lock_count_reg__0[2]),
        .I3(mmcm_lock_count_reg__0[0]),
        .I4(mmcm_lock_count_reg__0[1]),
        .I5(mmcm_lock_count_reg__0[3]),
        .O(p_0_in__2[5]));
(* SOFT_HLUTNM = "soft_lutpair39" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \mmcm_lock_count[6]_i_1 
       (.I0(mmcm_lock_count_reg__0[6]),
        .I1(\n_0_mmcm_lock_count[9]_i_5 ),
        .O(p_0_in__2[6]));
(* SOFT_HLUTNM = "soft_lutpair39" *) 
   LUT3 #(
    .INIT(8'h6A)) 
     \mmcm_lock_count[7]_i_1 
       (.I0(mmcm_lock_count_reg__0[7]),
        .I1(mmcm_lock_count_reg__0[6]),
        .I2(\n_0_mmcm_lock_count[9]_i_5 ),
        .O(p_0_in__2[7]));
(* SOFT_HLUTNM = "soft_lutpair31" *) 
   LUT4 #(
    .INIT(16'h6AAA)) 
     \mmcm_lock_count[8]_i_1 
       (.I0(mmcm_lock_count_reg__0[8]),
        .I1(mmcm_lock_count_reg__0[7]),
        .I2(\n_0_mmcm_lock_count[9]_i_5 ),
        .I3(mmcm_lock_count_reg__0[6]),
        .O(p_0_in__2[8]));
LUT5 #(
    .INIT(32'hBFFFFFFF)) 
     \mmcm_lock_count[9]_i_2__0 
       (.I0(\n_0_mmcm_lock_count[9]_i_4__0 ),
        .I1(mmcm_lock_count_reg__0[3]),
        .I2(mmcm_lock_count_reg__0[2]),
        .I3(mmcm_lock_count_reg__0[1]),
        .I4(mmcm_lock_count_reg__0[0]),
        .O(\n_0_mmcm_lock_count[9]_i_2__0 ));
(* SOFT_HLUTNM = "soft_lutpair31" *) 
   LUT5 #(
    .INIT(32'h6AAAAAAA)) 
     \mmcm_lock_count[9]_i_3 
       (.I0(mmcm_lock_count_reg__0[9]),
        .I1(mmcm_lock_count_reg__0[8]),
        .I2(mmcm_lock_count_reg__0[6]),
        .I3(\n_0_mmcm_lock_count[9]_i_5 ),
        .I4(mmcm_lock_count_reg__0[7]),
        .O(p_0_in__2[9]));
LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
     \mmcm_lock_count[9]_i_4__0 
       (.I0(mmcm_lock_count_reg__0[9]),
        .I1(mmcm_lock_count_reg__0[4]),
        .I2(mmcm_lock_count_reg__0[6]),
        .I3(mmcm_lock_count_reg__0[5]),
        .I4(mmcm_lock_count_reg__0[7]),
        .I5(mmcm_lock_count_reg__0[8]),
        .O(\n_0_mmcm_lock_count[9]_i_4__0 ));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     \mmcm_lock_count[9]_i_5 
       (.I0(mmcm_lock_count_reg__0[4]),
        .I1(mmcm_lock_count_reg__0[2]),
        .I2(mmcm_lock_count_reg__0[0]),
        .I3(mmcm_lock_count_reg__0[1]),
        .I4(mmcm_lock_count_reg__0[3]),
        .I5(mmcm_lock_count_reg__0[5]),
        .O(\n_0_mmcm_lock_count[9]_i_5 ));
(* counter = "27" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[0] 
       (.C(init_clk_in),
        .CE(\n_0_mmcm_lock_count[9]_i_2__0 ),
        .D(p_0_in__2[0]),
        .Q(mmcm_lock_count_reg__0[0]),
        .R(SR));
(* counter = "27" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[1] 
       (.C(init_clk_in),
        .CE(\n_0_mmcm_lock_count[9]_i_2__0 ),
        .D(p_0_in__2[1]),
        .Q(mmcm_lock_count_reg__0[1]),
        .R(SR));
(* counter = "27" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[2] 
       (.C(init_clk_in),
        .CE(\n_0_mmcm_lock_count[9]_i_2__0 ),
        .D(p_0_in__2[2]),
        .Q(mmcm_lock_count_reg__0[2]),
        .R(SR));
(* counter = "27" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[3] 
       (.C(init_clk_in),
        .CE(\n_0_mmcm_lock_count[9]_i_2__0 ),
        .D(p_0_in__2[3]),
        .Q(mmcm_lock_count_reg__0[3]),
        .R(SR));
(* counter = "27" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[4] 
       (.C(init_clk_in),
        .CE(\n_0_mmcm_lock_count[9]_i_2__0 ),
        .D(p_0_in__2[4]),
        .Q(mmcm_lock_count_reg__0[4]),
        .R(SR));
(* counter = "27" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[5] 
       (.C(init_clk_in),
        .CE(\n_0_mmcm_lock_count[9]_i_2__0 ),
        .D(p_0_in__2[5]),
        .Q(mmcm_lock_count_reg__0[5]),
        .R(SR));
(* counter = "27" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[6] 
       (.C(init_clk_in),
        .CE(\n_0_mmcm_lock_count[9]_i_2__0 ),
        .D(p_0_in__2[6]),
        .Q(mmcm_lock_count_reg__0[6]),
        .R(SR));
(* counter = "27" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[7] 
       (.C(init_clk_in),
        .CE(\n_0_mmcm_lock_count[9]_i_2__0 ),
        .D(p_0_in__2[7]),
        .Q(mmcm_lock_count_reg__0[7]),
        .R(SR));
(* counter = "27" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[8] 
       (.C(init_clk_in),
        .CE(\n_0_mmcm_lock_count[9]_i_2__0 ),
        .D(p_0_in__2[8]),
        .Q(mmcm_lock_count_reg__0[8]),
        .R(SR));
(* counter = "27" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[9] 
       (.C(init_clk_in),
        .CE(\n_0_mmcm_lock_count[9]_i_2__0 ),
        .D(p_0_in__2[9]),
        .Q(mmcm_lock_count_reg__0[9]),
        .R(SR));
data_mgtdata_mgt_cdc_sync__parameterized0_19 mmcm_lock_reclocked_cdc_sync
       (.E(\n_0_mmcm_lock_count[9]_i_2__0 ),
        .O1(O1),
        .O2(n_2_mmcm_lock_reclocked_cdc_sync),
        .SR(SR),
        .init_clk_in(init_clk_in),
        .mmcm_lock_reclocked(mmcm_lock_reclocked));
FDRE #(
    .INIT(1'b0)) 
     mmcm_lock_reclocked_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_2_mmcm_lock_reclocked_cdc_sync),
        .Q(mmcm_lock_reclocked),
        .R(\<const0> ));
LUT5 #(
    .INIT(32'h0000BA8A)) 
     pll_reset_asserted_i_1
       (.I0(pll_reset_asserted),
        .I1(n_0_pll_reset_asserted_i_2),
        .I2(n_0_tx_fsm_reset_done_int_i_2),
        .I3(n_0_tx_fsm_reset_done_int_i_3),
        .I4(\n_0_FSM_onehot_tx_state[7]_i_1 ),
        .O(n_0_pll_reset_asserted_i_1));
LUT6 #(
    .INIT(64'hFEFEFEFEFEFEFFF1)) 
     pll_reset_asserted_i_2
       (.I0(\n_0_FSM_onehot_tx_state_reg[5] ),
        .I1(\n_0_FSM_onehot_tx_state_reg[1] ),
        .I2(\n_0_FSM_onehot_tx_state_reg[3] ),
        .I3(pll_reset_asserted),
        .I4(\n_0_FSM_onehot_tx_state_reg[2] ),
        .I5(\n_0_FSM_onehot_tx_state_reg[6] ),
        .O(n_0_pll_reset_asserted_i_2));
FDRE #(
    .INIT(1'b0)) 
     pll_reset_asserted_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_pll_reset_asserted_i_1),
        .Q(pll_reset_asserted),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     reset_time_out_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_2_cplllock_cdc_sync),
        .Q(reset_time_out),
        .R(\<const0> ));
data_mgtdata_mgt_cdc_sync__parameterized0_18 run_phase_alignment_int_cdc_sync
       (.run_phase_alignment_int(run_phase_alignment_int),
        .s_level_out_d3(s_level_out_d3),
        .user_clk(user_clk));
LUT5 #(
    .INIT(32'h00008ABA)) 
     run_phase_alignment_int_i_1
       (.I0(run_phase_alignment_int),
        .I1(n_0_tx_fsm_reset_done_int_i_4),
        .I2(n_0_tx_fsm_reset_done_int_i_3),
        .I3(n_0_tx_fsm_reset_done_int_i_2),
        .I4(\n_0_FSM_onehot_tx_state[7]_i_1 ),
        .O(n_0_run_phase_alignment_int_i_1));
FDRE #(
    .INIT(1'b0)) 
     run_phase_alignment_int_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_run_phase_alignment_int_i_1),
        .Q(run_phase_alignment_int),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     run_phase_alignment_int_s3_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(s_level_out_d3),
        .Q(run_phase_alignment_int_s3),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair42" *) 
   LUT3 #(
    .INIT(8'h0E)) 
     time_out_2ms_i_1
       (.I0(time_out_2ms),
        .I1(n_0_time_out_2ms_i_2),
        .I2(reset_time_out),
        .O(n_0_time_out_2ms_i_1));
LUT6 #(
    .INIT(64'h0000000000000002)) 
     time_out_2ms_i_2
       (.I0(\n_0_time_out_counter[0]_i_3 ),
        .I1(\n_0_time_out_counter[0]_i_5 ),
        .I2(time_out_counter_reg[14]),
        .I3(time_out_counter_reg[13]),
        .I4(time_out_counter_reg[4]),
        .I5(n_0_time_out_500us_i_4),
        .O(n_0_time_out_2ms_i_2));
FDRE #(
    .INIT(1'b0)) 
     time_out_2ms_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_time_out_2ms_i_1),
        .Q(time_out_2ms),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair43" *) 
   LUT3 #(
    .INIT(8'h0E)) 
     time_out_500us_i_1
       (.I0(time_out_500us),
        .I1(n_0_time_out_500us_i_2),
        .I2(reset_time_out),
        .O(n_0_time_out_500us_i_1));
LUT6 #(
    .INIT(64'h0000000000000020)) 
     time_out_500us_i_2
       (.I0(n_0_time_out_500us_i_3),
        .I1(n_0_time_out_500us_i_4),
        .I2(time_out_counter_reg[3]),
        .I3(time_out_counter_reg[6]),
        .I4(time_out_counter_reg[4]),
        .I5(n_0_time_out_500us_i_5),
        .O(n_0_time_out_500us_i_2));
LUT4 #(
    .INIT(16'h0800)) 
     time_out_500us_i_3
       (.I0(time_out_counter_reg[14]),
        .I1(time_out_counter_reg[13]),
        .I2(time_out_counter_reg[9]),
        .I3(time_out_counter_reg[5]),
        .O(n_0_time_out_500us_i_3));
LUT4 #(
    .INIT(16'hFFFE)) 
     time_out_500us_i_4
       (.I0(time_out_counter_reg[2]),
        .I1(time_out_counter_reg[1]),
        .I2(time_out_counter_reg[11]),
        .I3(time_out_counter_reg[12]),
        .O(n_0_time_out_500us_i_4));
LUT6 #(
    .INIT(64'hFFFFFEFFFFFFFFFF)) 
     time_out_500us_i_5
       (.I0(time_out_counter_reg[0]),
        .I1(time_out_counter_reg[16]),
        .I2(time_out_counter_reg[10]),
        .I3(time_out_counter_reg[8]),
        .I4(time_out_counter_reg[15]),
        .I5(time_out_counter_reg[7]),
        .O(n_0_time_out_500us_i_5));
FDRE #(
    .INIT(1'b0)) 
     time_out_500us_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_time_out_500us_i_1),
        .Q(time_out_500us),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFD)) 
     \time_out_counter[0]_i_1 
       (.I0(\n_0_time_out_counter[0]_i_3 ),
        .I1(\n_0_time_out_counter[0]_i_4 ),
        .I2(time_out_counter_reg[4]),
        .I3(time_out_counter_reg[11]),
        .I4(time_out_counter_reg[12]),
        .I5(\n_0_time_out_counter[0]_i_5 ),
        .O(\n_0_time_out_counter[0]_i_1 ));
LUT6 #(
    .INIT(64'h0000010000000000)) 
     \time_out_counter[0]_i_3 
       (.I0(time_out_counter_reg[8]),
        .I1(time_out_counter_reg[3]),
        .I2(time_out_counter_reg[0]),
        .I3(time_out_counter_reg[5]),
        .I4(time_out_counter_reg[6]),
        .I5(time_out_counter_reg[7]),
        .O(\n_0_time_out_counter[0]_i_3 ));
LUT4 #(
    .INIT(16'hFFFE)) 
     \time_out_counter[0]_i_4 
       (.I0(time_out_counter_reg[2]),
        .I1(time_out_counter_reg[1]),
        .I2(time_out_counter_reg[13]),
        .I3(time_out_counter_reg[14]),
        .O(\n_0_time_out_counter[0]_i_4 ));
LUT4 #(
    .INIT(16'h7FFF)) 
     \time_out_counter[0]_i_5 
       (.I0(time_out_counter_reg[10]),
        .I1(time_out_counter_reg[16]),
        .I2(time_out_counter_reg[9]),
        .I3(time_out_counter_reg[15]),
        .O(\n_0_time_out_counter[0]_i_5 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[0]_i_6 
       (.I0(time_out_counter_reg[3]),
        .O(\n_0_time_out_counter[0]_i_6 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[0]_i_7__0 
       (.I0(time_out_counter_reg[2]),
        .O(\n_0_time_out_counter[0]_i_7__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[0]_i_8__0 
       (.I0(time_out_counter_reg[1]),
        .O(\n_0_time_out_counter[0]_i_8__0 ));
LUT1 #(
    .INIT(2'h1)) 
     \time_out_counter[0]_i_9 
       (.I0(time_out_counter_reg[0]),
        .O(\n_0_time_out_counter[0]_i_9 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_2 
       (.I0(time_out_counter_reg[15]),
        .O(\n_0_time_out_counter[12]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_3 
       (.I0(time_out_counter_reg[14]),
        .O(\n_0_time_out_counter[12]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_4 
       (.I0(time_out_counter_reg[13]),
        .O(\n_0_time_out_counter[12]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_5 
       (.I0(time_out_counter_reg[12]),
        .O(\n_0_time_out_counter[12]_i_5 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[16]_i_2 
       (.I0(time_out_counter_reg[16]),
        .O(\n_0_time_out_counter[16]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_2 
       (.I0(time_out_counter_reg[7]),
        .O(\n_0_time_out_counter[4]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_3 
       (.I0(time_out_counter_reg[6]),
        .O(\n_0_time_out_counter[4]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_4 
       (.I0(time_out_counter_reg[5]),
        .O(\n_0_time_out_counter[4]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_5 
       (.I0(time_out_counter_reg[4]),
        .O(\n_0_time_out_counter[4]_i_5 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_2 
       (.I0(time_out_counter_reg[11]),
        .O(\n_0_time_out_counter[8]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_3 
       (.I0(time_out_counter_reg[10]),
        .O(\n_0_time_out_counter[8]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_4 
       (.I0(time_out_counter_reg[9]),
        .O(\n_0_time_out_counter[8]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_5 
       (.I0(time_out_counter_reg[8]),
        .O(\n_0_time_out_counter[8]_i_5 ));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[0] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_7_time_out_counter_reg[0]_i_2 ),
        .Q(time_out_counter_reg[0]),
        .R(reset_time_out));
CARRY4 \time_out_counter_reg[0]_i_2 
       (.CI(\<const0> ),
        .CO({\n_0_time_out_counter_reg[0]_i_2 ,\n_1_time_out_counter_reg[0]_i_2 ,\n_2_time_out_counter_reg[0]_i_2 ,\n_3_time_out_counter_reg[0]_i_2 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const1> }),
        .O({\n_4_time_out_counter_reg[0]_i_2 ,\n_5_time_out_counter_reg[0]_i_2 ,\n_6_time_out_counter_reg[0]_i_2 ,\n_7_time_out_counter_reg[0]_i_2 }),
        .S({\n_0_time_out_counter[0]_i_6 ,\n_0_time_out_counter[0]_i_7__0 ,\n_0_time_out_counter[0]_i_8__0 ,\n_0_time_out_counter[0]_i_9 }));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[10] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_5_time_out_counter_reg[8]_i_1 ),
        .Q(time_out_counter_reg[10]),
        .R(reset_time_out));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[11] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_4_time_out_counter_reg[8]_i_1 ),
        .Q(time_out_counter_reg[11]),
        .R(reset_time_out));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[12] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_7_time_out_counter_reg[12]_i_1 ),
        .Q(time_out_counter_reg[12]),
        .R(reset_time_out));
CARRY4 \time_out_counter_reg[12]_i_1 
       (.CI(\n_0_time_out_counter_reg[8]_i_1 ),
        .CO({\n_0_time_out_counter_reg[12]_i_1 ,\n_1_time_out_counter_reg[12]_i_1 ,\n_2_time_out_counter_reg[12]_i_1 ,\n_3_time_out_counter_reg[12]_i_1 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_time_out_counter_reg[12]_i_1 ,\n_5_time_out_counter_reg[12]_i_1 ,\n_6_time_out_counter_reg[12]_i_1 ,\n_7_time_out_counter_reg[12]_i_1 }),
        .S({\n_0_time_out_counter[12]_i_2 ,\n_0_time_out_counter[12]_i_3 ,\n_0_time_out_counter[12]_i_4 ,\n_0_time_out_counter[12]_i_5 }));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[13] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_6_time_out_counter_reg[12]_i_1 ),
        .Q(time_out_counter_reg[13]),
        .R(reset_time_out));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[14] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_5_time_out_counter_reg[12]_i_1 ),
        .Q(time_out_counter_reg[14]),
        .R(reset_time_out));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[15] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_4_time_out_counter_reg[12]_i_1 ),
        .Q(time_out_counter_reg[15]),
        .R(reset_time_out));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[16] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_7_time_out_counter_reg[16]_i_1 ),
        .Q(time_out_counter_reg[16]),
        .R(reset_time_out));
CARRY4 \time_out_counter_reg[16]_i_1 
       (.CI(\n_0_time_out_counter_reg[12]_i_1 ),
        .CO(\NLW_time_out_counter_reg[16]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\NLW_time_out_counter_reg[16]_i_1_O_UNCONNECTED [3:1],\n_7_time_out_counter_reg[16]_i_1 }),
        .S({\<const0> ,\<const0> ,\<const0> ,\n_0_time_out_counter[16]_i_2 }));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[1] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_6_time_out_counter_reg[0]_i_2 ),
        .Q(time_out_counter_reg[1]),
        .R(reset_time_out));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[2] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_5_time_out_counter_reg[0]_i_2 ),
        .Q(time_out_counter_reg[2]),
        .R(reset_time_out));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[3] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_4_time_out_counter_reg[0]_i_2 ),
        .Q(time_out_counter_reg[3]),
        .R(reset_time_out));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[4] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_7_time_out_counter_reg[4]_i_1 ),
        .Q(time_out_counter_reg[4]),
        .R(reset_time_out));
CARRY4 \time_out_counter_reg[4]_i_1 
       (.CI(\n_0_time_out_counter_reg[0]_i_2 ),
        .CO({\n_0_time_out_counter_reg[4]_i_1 ,\n_1_time_out_counter_reg[4]_i_1 ,\n_2_time_out_counter_reg[4]_i_1 ,\n_3_time_out_counter_reg[4]_i_1 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_time_out_counter_reg[4]_i_1 ,\n_5_time_out_counter_reg[4]_i_1 ,\n_6_time_out_counter_reg[4]_i_1 ,\n_7_time_out_counter_reg[4]_i_1 }),
        .S({\n_0_time_out_counter[4]_i_2 ,\n_0_time_out_counter[4]_i_3 ,\n_0_time_out_counter[4]_i_4 ,\n_0_time_out_counter[4]_i_5 }));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[5] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_6_time_out_counter_reg[4]_i_1 ),
        .Q(time_out_counter_reg[5]),
        .R(reset_time_out));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[6] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_5_time_out_counter_reg[4]_i_1 ),
        .Q(time_out_counter_reg[6]),
        .R(reset_time_out));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[7] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_4_time_out_counter_reg[4]_i_1 ),
        .Q(time_out_counter_reg[7]),
        .R(reset_time_out));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[8] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_7_time_out_counter_reg[8]_i_1 ),
        .Q(time_out_counter_reg[8]),
        .R(reset_time_out));
CARRY4 \time_out_counter_reg[8]_i_1 
       (.CI(\n_0_time_out_counter_reg[4]_i_1 ),
        .CO({\n_0_time_out_counter_reg[8]_i_1 ,\n_1_time_out_counter_reg[8]_i_1 ,\n_2_time_out_counter_reg[8]_i_1 ,\n_3_time_out_counter_reg[8]_i_1 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_time_out_counter_reg[8]_i_1 ,\n_5_time_out_counter_reg[8]_i_1 ,\n_6_time_out_counter_reg[8]_i_1 ,\n_7_time_out_counter_reg[8]_i_1 }),
        .S({\n_0_time_out_counter[8]_i_2 ,\n_0_time_out_counter[8]_i_3 ,\n_0_time_out_counter[8]_i_4 ,\n_0_time_out_counter[8]_i_5 }));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[9] 
       (.C(init_clk_in),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_6_time_out_counter_reg[8]_i_1 ),
        .Q(time_out_counter_reg[9]),
        .R(reset_time_out));
data_mgtdata_mgt_cdc_sync__parameterized0_17 time_out_wait_bypass_cdc_sync
       (.O1(n_0_time_out_wait_bypass_cdc_sync),
        .init_clk_in(init_clk_in),
        .time_out_wait_bypass(time_out_wait_bypass));
LUT5 #(
    .INIT(32'h888A8888)) 
     time_out_wait_bypass_i_1
       (.I0(run_phase_alignment_int_s3),
        .I1(time_out_wait_bypass),
        .I2(tx_fsm_reset_done_int_s3),
        .I3(n_0_time_out_wait_bypass_i_2),
        .I4(n_0_time_out_wait_bypass_i_3),
        .O(n_0_time_out_wait_bypass_i_1));
LUT3 #(
    .INIT(8'hBF)) 
     time_out_wait_bypass_i_2
       (.I0(wait_bypass_count_reg[4]),
        .I1(wait_bypass_count_reg[2]),
        .I2(wait_bypass_count_reg[3]),
        .O(n_0_time_out_wait_bypass_i_2));
LUT4 #(
    .INIT(16'h4000)) 
     time_out_wait_bypass_i_3
       (.I0(wait_bypass_count_reg[9]),
        .I1(wait_bypass_count_reg[16]),
        .I2(n_0_time_out_wait_bypass_i_4),
        .I3(n_0_time_out_wait_bypass_i_5),
        .O(n_0_time_out_wait_bypass_i_3));
LUT6 #(
    .INIT(64'h0000000040000000)) 
     time_out_wait_bypass_i_4
       (.I0(wait_bypass_count_reg[6]),
        .I1(wait_bypass_count_reg[13]),
        .I2(wait_bypass_count_reg[7]),
        .I3(wait_bypass_count_reg[8]),
        .I4(wait_bypass_count_reg[1]),
        .I5(wait_bypass_count_reg[14]),
        .O(n_0_time_out_wait_bypass_i_4));
LUT6 #(
    .INIT(64'h0000000080000000)) 
     time_out_wait_bypass_i_5
       (.I0(wait_bypass_count_reg[11]),
        .I1(wait_bypass_count_reg[10]),
        .I2(wait_bypass_count_reg[0]),
        .I3(wait_bypass_count_reg[5]),
        .I4(wait_bypass_count_reg[15]),
        .I5(wait_bypass_count_reg[12]),
        .O(n_0_time_out_wait_bypass_i_5));
FDRE #(
    .INIT(1'b0)) 
     time_out_wait_bypass_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_time_out_wait_bypass_i_1),
        .Q(time_out_wait_bypass),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     time_out_wait_bypass_s3_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_time_out_wait_bypass_cdc_sync),
        .Q(time_out_wait_bypass_s3),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair43" *) 
   LUT3 #(
    .INIT(8'h0E)) 
     time_tlock_max_i_1
       (.I0(time_tlock_max),
        .I1(n_0_time_tlock_max_i_2),
        .I2(reset_time_out),
        .O(n_0_time_tlock_max_i_1));
LUT6 #(
    .INIT(64'h0000000000000020)) 
     time_tlock_max_i_2
       (.I0(n_0_time_tlock_max_i_3__0),
        .I1(\n_0_time_out_counter[0]_i_4 ),
        .I2(time_out_counter_reg[3]),
        .I3(time_out_counter_reg[6]),
        .I4(time_out_counter_reg[4]),
        .I5(n_0_time_out_500us_i_5),
        .O(n_0_time_tlock_max_i_2));
LUT4 #(
    .INIT(16'h0008)) 
     time_tlock_max_i_3__0
       (.I0(time_out_counter_reg[12]),
        .I1(time_out_counter_reg[9]),
        .I2(time_out_counter_reg[5]),
        .I3(time_out_counter_reg[11]),
        .O(n_0_time_tlock_max_i_3__0));
FDRE #(
    .INIT(1'b0)) 
     time_tlock_max_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_time_tlock_max_i_1),
        .Q(time_tlock_max),
        .R(\<const0> ));
data_mgtdata_mgt_cdc_sync__parameterized0_20 tx_fsm_reset_done_int_cdc_sync
       (.O1(n_0_tx_fsm_reset_done_int_cdc_sync),
        .TX_RESETDONE_OUT(TX_RESETDONE_OUT),
        .user_clk(user_clk));
LUT5 #(
    .INIT(32'h0000ABAA)) 
     tx_fsm_reset_done_int_i_1
       (.I0(TX_RESETDONE_OUT),
        .I1(n_0_tx_fsm_reset_done_int_i_2),
        .I2(n_0_tx_fsm_reset_done_int_i_3),
        .I3(n_0_tx_fsm_reset_done_int_i_4),
        .I4(\n_0_FSM_onehot_tx_state[7]_i_1 ),
        .O(n_0_tx_fsm_reset_done_int_i_1));
(* SOFT_HLUTNM = "soft_lutpair33" *) 
   LUT3 #(
    .INIT(8'h01)) 
     tx_fsm_reset_done_int_i_2
       (.I0(\n_0_FSM_onehot_tx_state_reg[6] ),
        .I1(\n_0_FSM_onehot_tx_state_reg[4] ),
        .I2(\n_0_FSM_onehot_tx_state_reg[5] ),
        .O(n_0_tx_fsm_reset_done_int_i_2));
(* SOFT_HLUTNM = "soft_lutpair40" *) 
   LUT3 #(
    .INIT(8'h01)) 
     tx_fsm_reset_done_int_i_3
       (.I0(\n_0_FSM_onehot_tx_state_reg[6] ),
        .I1(\n_0_FSM_onehot_tx_state_reg[2] ),
        .I2(\n_0_FSM_onehot_tx_state_reg[3] ),
        .O(n_0_tx_fsm_reset_done_int_i_3));
LUT3 #(
    .INIT(8'h01)) 
     tx_fsm_reset_done_int_i_4
       (.I0(\n_0_FSM_onehot_tx_state_reg[5] ),
        .I1(\n_0_FSM_onehot_tx_state_reg[1] ),
        .I2(\n_0_FSM_onehot_tx_state_reg[3] ),
        .O(n_0_tx_fsm_reset_done_int_i_4));
FDRE #(
    .INIT(1'b0)) 
     tx_fsm_reset_done_int_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_tx_fsm_reset_done_int_i_1),
        .Q(TX_RESETDONE_OUT),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     tx_fsm_reset_done_int_s3_reg
       (.C(user_clk),
        .CE(\<const1> ),
        .D(n_0_tx_fsm_reset_done_int_cdc_sync),
        .Q(tx_fsm_reset_done_int_s3),
        .R(\<const0> ));
data_mgtdata_mgt_cdc_sync__parameterized0_15 txresetdone_cdc_sync
       (.O1(n_0_txresetdone_cdc_sync),
        .init_clk_in(init_clk_in),
        .txfsm_txresetdone_r(txfsm_txresetdone_r));
FDRE #(
    .INIT(1'b0)) 
     txresetdone_s3_reg
       (.C(init_clk_in),
        .CE(\<const1> ),
        .D(n_0_txresetdone_cdc_sync),
        .Q(txresetdone_s3),
        .R(\<const0> ));
LUT1 #(
    .INIT(2'h1)) 
     \wait_bypass_count[0]_i_1 
       (.I0(run_phase_alignment_int_s3),
        .O(clear));
LUT5 #(
    .INIT(32'h0000DFFF)) 
     \wait_bypass_count[0]_i_2 
       (.I0(n_0_time_out_wait_bypass_i_3),
        .I1(wait_bypass_count_reg[4]),
        .I2(wait_bypass_count_reg[2]),
        .I3(wait_bypass_count_reg[3]),
        .I4(tx_fsm_reset_done_int_s3),
        .O(\n_0_wait_bypass_count[0]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[0]_i_4__0 
       (.I0(wait_bypass_count_reg[3]),
        .O(\n_0_wait_bypass_count[0]_i_4__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[0]_i_5__0 
       (.I0(wait_bypass_count_reg[2]),
        .O(\n_0_wait_bypass_count[0]_i_5__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[0]_i_6 
       (.I0(wait_bypass_count_reg[1]),
        .O(\n_0_wait_bypass_count[0]_i_6 ));
LUT1 #(
    .INIT(2'h1)) 
     \wait_bypass_count[0]_i_7 
       (.I0(wait_bypass_count_reg[0]),
        .O(\n_0_wait_bypass_count[0]_i_7 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[12]_i_2 
       (.I0(wait_bypass_count_reg[15]),
        .O(\n_0_wait_bypass_count[12]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[12]_i_3 
       (.I0(wait_bypass_count_reg[14]),
        .O(\n_0_wait_bypass_count[12]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[12]_i_4 
       (.I0(wait_bypass_count_reg[13]),
        .O(\n_0_wait_bypass_count[12]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[12]_i_5 
       (.I0(wait_bypass_count_reg[12]),
        .O(\n_0_wait_bypass_count[12]_i_5 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[16]_i_2 
       (.I0(wait_bypass_count_reg[16]),
        .O(\n_0_wait_bypass_count[16]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_2 
       (.I0(wait_bypass_count_reg[7]),
        .O(\n_0_wait_bypass_count[4]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_3 
       (.I0(wait_bypass_count_reg[6]),
        .O(\n_0_wait_bypass_count[4]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_4 
       (.I0(wait_bypass_count_reg[5]),
        .O(\n_0_wait_bypass_count[4]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_5 
       (.I0(wait_bypass_count_reg[4]),
        .O(\n_0_wait_bypass_count[4]_i_5 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_2 
       (.I0(wait_bypass_count_reg[11]),
        .O(\n_0_wait_bypass_count[8]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_3 
       (.I0(wait_bypass_count_reg[10]),
        .O(\n_0_wait_bypass_count[8]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_4 
       (.I0(wait_bypass_count_reg[9]),
        .O(\n_0_wait_bypass_count[8]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_5 
       (.I0(wait_bypass_count_reg[8]),
        .O(\n_0_wait_bypass_count[8]_i_5 ));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[0] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_7_wait_bypass_count_reg[0]_i_3 ),
        .Q(wait_bypass_count_reg[0]),
        .R(clear));
CARRY4 \wait_bypass_count_reg[0]_i_3 
       (.CI(\<const0> ),
        .CO({\n_0_wait_bypass_count_reg[0]_i_3 ,\n_1_wait_bypass_count_reg[0]_i_3 ,\n_2_wait_bypass_count_reg[0]_i_3 ,\n_3_wait_bypass_count_reg[0]_i_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const1> }),
        .O({\n_4_wait_bypass_count_reg[0]_i_3 ,\n_5_wait_bypass_count_reg[0]_i_3 ,\n_6_wait_bypass_count_reg[0]_i_3 ,\n_7_wait_bypass_count_reg[0]_i_3 }),
        .S({\n_0_wait_bypass_count[0]_i_4__0 ,\n_0_wait_bypass_count[0]_i_5__0 ,\n_0_wait_bypass_count[0]_i_6 ,\n_0_wait_bypass_count[0]_i_7 }));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[10] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_5_wait_bypass_count_reg[8]_i_1 ),
        .Q(wait_bypass_count_reg[10]),
        .R(clear));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[11] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_4_wait_bypass_count_reg[8]_i_1 ),
        .Q(wait_bypass_count_reg[11]),
        .R(clear));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[12] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_7_wait_bypass_count_reg[12]_i_1 ),
        .Q(wait_bypass_count_reg[12]),
        .R(clear));
CARRY4 \wait_bypass_count_reg[12]_i_1 
       (.CI(\n_0_wait_bypass_count_reg[8]_i_1 ),
        .CO({\n_0_wait_bypass_count_reg[12]_i_1 ,\n_1_wait_bypass_count_reg[12]_i_1 ,\n_2_wait_bypass_count_reg[12]_i_1 ,\n_3_wait_bypass_count_reg[12]_i_1 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_wait_bypass_count_reg[12]_i_1 ,\n_5_wait_bypass_count_reg[12]_i_1 ,\n_6_wait_bypass_count_reg[12]_i_1 ,\n_7_wait_bypass_count_reg[12]_i_1 }),
        .S({\n_0_wait_bypass_count[12]_i_2 ,\n_0_wait_bypass_count[12]_i_3 ,\n_0_wait_bypass_count[12]_i_4 ,\n_0_wait_bypass_count[12]_i_5 }));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[13] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_6_wait_bypass_count_reg[12]_i_1 ),
        .Q(wait_bypass_count_reg[13]),
        .R(clear));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[14] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_5_wait_bypass_count_reg[12]_i_1 ),
        .Q(wait_bypass_count_reg[14]),
        .R(clear));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[15] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_4_wait_bypass_count_reg[12]_i_1 ),
        .Q(wait_bypass_count_reg[15]),
        .R(clear));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[16] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_7_wait_bypass_count_reg[16]_i_1 ),
        .Q(wait_bypass_count_reg[16]),
        .R(clear));
CARRY4 \wait_bypass_count_reg[16]_i_1 
       (.CI(\n_0_wait_bypass_count_reg[12]_i_1 ),
        .CO(\NLW_wait_bypass_count_reg[16]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\NLW_wait_bypass_count_reg[16]_i_1_O_UNCONNECTED [3:1],\n_7_wait_bypass_count_reg[16]_i_1 }),
        .S({\<const0> ,\<const0> ,\<const0> ,\n_0_wait_bypass_count[16]_i_2 }));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[1] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_6_wait_bypass_count_reg[0]_i_3 ),
        .Q(wait_bypass_count_reg[1]),
        .R(clear));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[2] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_5_wait_bypass_count_reg[0]_i_3 ),
        .Q(wait_bypass_count_reg[2]),
        .R(clear));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[3] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_4_wait_bypass_count_reg[0]_i_3 ),
        .Q(wait_bypass_count_reg[3]),
        .R(clear));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[4] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_7_wait_bypass_count_reg[4]_i_1 ),
        .Q(wait_bypass_count_reg[4]),
        .R(clear));
CARRY4 \wait_bypass_count_reg[4]_i_1 
       (.CI(\n_0_wait_bypass_count_reg[0]_i_3 ),
        .CO({\n_0_wait_bypass_count_reg[4]_i_1 ,\n_1_wait_bypass_count_reg[4]_i_1 ,\n_2_wait_bypass_count_reg[4]_i_1 ,\n_3_wait_bypass_count_reg[4]_i_1 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_wait_bypass_count_reg[4]_i_1 ,\n_5_wait_bypass_count_reg[4]_i_1 ,\n_6_wait_bypass_count_reg[4]_i_1 ,\n_7_wait_bypass_count_reg[4]_i_1 }),
        .S({\n_0_wait_bypass_count[4]_i_2 ,\n_0_wait_bypass_count[4]_i_3 ,\n_0_wait_bypass_count[4]_i_4 ,\n_0_wait_bypass_count[4]_i_5 }));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[5] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_6_wait_bypass_count_reg[4]_i_1 ),
        .Q(wait_bypass_count_reg[5]),
        .R(clear));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[6] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_5_wait_bypass_count_reg[4]_i_1 ),
        .Q(wait_bypass_count_reg[6]),
        .R(clear));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[7] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_4_wait_bypass_count_reg[4]_i_1 ),
        .Q(wait_bypass_count_reg[7]),
        .R(clear));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[8] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_7_wait_bypass_count_reg[8]_i_1 ),
        .Q(wait_bypass_count_reg[8]),
        .R(clear));
CARRY4 \wait_bypass_count_reg[8]_i_1 
       (.CI(\n_0_wait_bypass_count_reg[4]_i_1 ),
        .CO({\n_0_wait_bypass_count_reg[8]_i_1 ,\n_1_wait_bypass_count_reg[8]_i_1 ,\n_2_wait_bypass_count_reg[8]_i_1 ,\n_3_wait_bypass_count_reg[8]_i_1 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\n_4_wait_bypass_count_reg[8]_i_1 ,\n_5_wait_bypass_count_reg[8]_i_1 ,\n_6_wait_bypass_count_reg[8]_i_1 ,\n_7_wait_bypass_count_reg[8]_i_1 }),
        .S({\n_0_wait_bypass_count[8]_i_2 ,\n_0_wait_bypass_count[8]_i_3 ,\n_0_wait_bypass_count[8]_i_4 ,\n_0_wait_bypass_count[8]_i_5 }));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[9] 
       (.C(user_clk),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_6_wait_bypass_count_reg[8]_i_1 ),
        .Q(wait_bypass_count_reg[9]),
        .R(clear));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
