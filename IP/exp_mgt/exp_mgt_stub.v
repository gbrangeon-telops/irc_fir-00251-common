// Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2013.4 (win64) Build 353583 Mon Dec  9 17:49:19 MST 2013
// Date        : Mon Oct 26 13:37:11 2015
// Host        : TELOPS212 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub d:/Telops/fir-00251-Common/IP/exp_mgt/exp_mgt_stub.v
// Design      : exp_mgt
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module exp_mgt(s_axi_tx_tdata, s_axi_tx_tvalid, s_axi_tx_tready, s_axi_tx_tkeep, s_axi_tx_tlast, m_axi_rx_tdata, m_axi_rx_tvalid, m_axi_rx_tkeep, m_axi_rx_tlast, rxp, rxn, txp, txn, gt_refclk1, frame_err, hard_err, soft_err, channel_up, lane_up, warn_cc, do_cc, user_clk, sync_clk, reset, power_down, loopback, gt_reset, tx_lock, sys_reset_out, init_clk_in, tx_resetdone_out, rx_resetdone_out, link_reset_out, drpclk_in, drpaddr_in, drpdi_in, drpdo_out, drpen_in, drprdy_out, drpwe_in, drpaddr_in_lane1, drpdi_in_lane1, drpdo_out_lane1, drpen_in_lane1, drprdy_out_lane1, drpwe_in_lane1, gt0_qplllock_in, gt0_qpllrefclklost_in, gt0_qpllreset_out, gt_qpllclk_quad2_in, gt_qpllrefclk_quad2_in, tx_out_clk, pll_not_locked)
/* synthesis syn_black_box black_box_pad_pin="s_axi_tx_tdata[0:63],s_axi_tx_tvalid,s_axi_tx_tready,s_axi_tx_tkeep[0:7],s_axi_tx_tlast,m_axi_rx_tdata[0:63],m_axi_rx_tvalid,m_axi_rx_tkeep[0:7],m_axi_rx_tlast,rxp[0:1],rxn[0:1],txp[0:1],txn[0:1],gt_refclk1,frame_err,hard_err,soft_err,channel_up,lane_up[0:1],warn_cc,do_cc,user_clk,sync_clk,reset,power_down,loopback[2:0],gt_reset,tx_lock,sys_reset_out,init_clk_in,tx_resetdone_out,rx_resetdone_out,link_reset_out,drpclk_in,drpaddr_in[8:0],drpdi_in[15:0],drpdo_out[15:0],drpen_in,drprdy_out,drpwe_in,drpaddr_in_lane1[8:0],drpdi_in_lane1[15:0],drpdo_out_lane1[15:0],drpen_in_lane1,drprdy_out_lane1,drpwe_in_lane1,gt0_qplllock_in,gt0_qpllrefclklost_in,gt0_qpllreset_out,gt_qpllclk_quad2_in,gt_qpllrefclk_quad2_in,tx_out_clk,pll_not_locked" */;
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
  input gt_qpllclk_quad2_in;
  input gt_qpllrefclk_quad2_in;
  output tx_out_clk;
  input pll_not_locked;
endmodule
