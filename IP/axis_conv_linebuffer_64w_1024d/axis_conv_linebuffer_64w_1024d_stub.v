// Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2013.4 (win64) Build 353583 Mon Dec  9 17:49:19 MST 2013
// Date        : Fri Dec 12 12:26:53 2014
// Host        : TELOPS210 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               d:/Telops/fir-00251-Common/IP/axis_conv_linebuffer_64w_1024d/axis_conv_linebuffer_64w_1024d_stub.v
// Design      : axis_conv_linebuffer_64w_1024d
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module axis_conv_linebuffer_64w_1024d(ACLK, ARESETN, ACLKEN, S00_AXIS_ACLK, S00_AXIS_ARESETN, S00_AXIS_ACLKEN, S00_AXIS_TVALID, S00_AXIS_TREADY, S00_AXIS_TDATA, S00_AXIS_TSTRB, S00_AXIS_TKEEP, S00_AXIS_TLAST, S00_AXIS_TID, S00_AXIS_TDEST, S00_AXIS_TUSER, M00_AXIS_ACLK, M00_AXIS_ARESETN, M00_AXIS_ACLKEN, M00_AXIS_TVALID, M00_AXIS_TREADY, M00_AXIS_TDATA, M00_AXIS_TSTRB, M00_AXIS_TKEEP, M00_AXIS_TLAST, M00_AXIS_TID, M00_AXIS_TDEST, M00_AXIS_TUSER, S00_DECODE_ERR, M00_FIFO_DATA_COUNT)
/* synthesis syn_black_box black_box_pad_pin="ACLK,ARESETN,ACLKEN,S00_AXIS_ACLK,S00_AXIS_ARESETN,S00_AXIS_ACLKEN,S00_AXIS_TVALID,S00_AXIS_TREADY,S00_AXIS_TDATA[31:0],S00_AXIS_TSTRB[3:0],S00_AXIS_TKEEP[3:0],S00_AXIS_TLAST,S00_AXIS_TID[0:0],S00_AXIS_TDEST[2:0],S00_AXIS_TUSER[7:0],M00_AXIS_ACLK,M00_AXIS_ARESETN,M00_AXIS_ACLKEN,M00_AXIS_TVALID,M00_AXIS_TREADY,M00_AXIS_TDATA[63:0],M00_AXIS_TSTRB[7:0],M00_AXIS_TKEEP[7:0],M00_AXIS_TLAST,M00_AXIS_TID[0:0],M00_AXIS_TDEST[2:0],M00_AXIS_TUSER[15:0],S00_DECODE_ERR,M00_FIFO_DATA_COUNT[31:0]" */;
  input ACLK;
  input ARESETN;
  input ACLKEN;
  input S00_AXIS_ACLK;
  input S00_AXIS_ARESETN;
  input S00_AXIS_ACLKEN;
  input S00_AXIS_TVALID;
  output S00_AXIS_TREADY;
  input [31:0]S00_AXIS_TDATA;
  input [3:0]S00_AXIS_TSTRB;
  input [3:0]S00_AXIS_TKEEP;
  input S00_AXIS_TLAST;
  input [0:0]S00_AXIS_TID;
  input [2:0]S00_AXIS_TDEST;
  input [7:0]S00_AXIS_TUSER;
  input M00_AXIS_ACLK;
  input M00_AXIS_ARESETN;
  input M00_AXIS_ACLKEN;
  output M00_AXIS_TVALID;
  input M00_AXIS_TREADY;
  output [63:0]M00_AXIS_TDATA;
  output [7:0]M00_AXIS_TSTRB;
  output [7:0]M00_AXIS_TKEEP;
  output M00_AXIS_TLAST;
  output [0:0]M00_AXIS_TID;
  output [2:0]M00_AXIS_TDEST;
  output [15:0]M00_AXIS_TUSER;
  output S00_DECODE_ERR;
  output [31:0]M00_FIFO_DATA_COUNT;
endmodule
