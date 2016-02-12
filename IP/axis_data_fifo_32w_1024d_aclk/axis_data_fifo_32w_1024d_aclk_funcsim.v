// Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2013.4 (win64) Build 353583 Mon Dec  9 17:49:19 MST 2013
// Date        : Fri Dec 12 12:27:17 2014
// Host        : TELOPS210 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               d:/Telops/fir-00251-Common/IP/axis_data_fifo_32w_1024d_aclk/axis_data_fifo_32w_1024d_aclk_funcsim.v
// Design      : axis_data_fifo_32w_1024d_aclk
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* X_CORE_INFO = "axis_data_fifo_v1_1_axis_data_fifo,Vivado 2013.4" *) (* CHECK_LICENSE_TYPE = "axis_data_fifo_32w_1024d_aclk,axis_data_fifo_v1_1_axis_data_fifo,{}" *) (* CORE_GENERATION_INFO = "axis_data_fifo_32w_1024d_aclk,axis_data_fifo_v1_1_axis_data_fifo,{x_ipProduct=Vivado 2013.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=axis_data_fifo,x_ipVersion=1.1,x_ipCoreRevision=1,x_ipLanguage=VHDL,C_FAMILY=kintex7,C_AXIS_TDATA_WIDTH=32,C_AXIS_TID_WIDTH=1,C_AXIS_TDEST_WIDTH=3,C_AXIS_TUSER_WIDTH=8,C_AXIS_SIGNAL_SET=0b11111111,C_FIFO_DEPTH=1024,C_FIFO_MODE=2,C_IS_ACLK_ASYNC=0,C_SYNCHRONIZER_STAGE=2,C_ACLKEN_CONV_MODE=3}" *) 
(* DowngradeIPIdentifiedWarnings = "yes" *) 
(* NotValidForBitStream *)
module axis_data_fifo_32w_1024d_aclk
   (s_axis_aresetn,
    s_axis_aclk,
    s_axis_aclken,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tid,
    s_axis_tdest,
    s_axis_tuser,
    m_axis_aclken,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser,
    axis_data_count,
    axis_wr_data_count,
    axis_rd_data_count);
  input s_axis_aresetn;
  input s_axis_aclk;
  input s_axis_aclken;
  input s_axis_tvalid;
  output s_axis_tready;
  input [31:0]s_axis_tdata;
  input [3:0]s_axis_tstrb;
  input [3:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [2:0]s_axis_tdest;
  input [7:0]s_axis_tuser;
  input m_axis_aclken;
  output m_axis_tvalid;
  input m_axis_tready;
  output [31:0]m_axis_tdata;
  output [3:0]m_axis_tstrb;
  output [3:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [2:0]m_axis_tdest;
  output [7:0]m_axis_tuser;
  output [31:0]axis_data_count;
  output [31:0]axis_wr_data_count;
  output [31:0]axis_rd_data_count;

  wire \<const0> ;
  wire [31:0]axis_data_count;
  wire [31:0]axis_rd_data_count;
  wire [31:0]axis_wr_data_count;
  wire m_axis_aclken;
  wire [31:0]m_axis_tdata;
  wire [2:0]m_axis_tdest;
  wire [0:0]m_axis_tid;
  wire [3:0]m_axis_tkeep;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire [3:0]m_axis_tstrb;
  wire [7:0]m_axis_tuser;
  wire m_axis_tvalid;
  wire s_axis_aclk;
  wire s_axis_aclken;
  wire s_axis_aresetn;
  wire [31:0]s_axis_tdata;
  wire [2:0]s_axis_tdest;
  wire [0:0]s_axis_tid;
  wire [3:0]s_axis_tkeep;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire [3:0]s_axis_tstrb;
  wire [7:0]s_axis_tuser;
  wire s_axis_tvalid;

GND GND
       (.G(\<const0> ));
(* C_ACLKEN_CONV_MODE = "3" *) 
   (* C_AXIS_SIGNAL_SET = "32'b00000000000000000000000011111111" *) 
   (* C_AXIS_TDATA_WIDTH = "32" *) 
   (* C_AXIS_TDEST_WIDTH = "3" *) 
   (* C_AXIS_TID_WIDTH = "1" *) 
   (* C_AXIS_TUSER_WIDTH = "8" *) 
   (* C_AXI_ADDR_WIDTH = "32" *) 
   (* C_AXI_ARUSER_WIDTH = "1" *) 
   (* C_AXI_AWUSER_WIDTH = "1" *) 
   (* C_AXI_BUSER_WIDTH = "1" *) 
   (* C_AXI_DATA_WIDTH = "64" *) 
   (* C_AXI_ID_WIDTH = "4" *) 
   (* C_AXI_RUSER_WIDTH = "1" *) 
   (* C_AXI_WUSER_WIDTH = "1" *) 
   (* C_DATA_COUNT_WIDTH = "10" *) 
   (* C_DIN_WIDTH = "18" *) 
   (* C_DOUT_WIDTH = "18" *) 
   (* C_FAMILY = "kintex7" *) 
   (* C_FIFO_DEPTH = "1024" *) 
   (* C_FIFO_MODE = "2" *) 
   (* C_IS_ACLK_ASYNC = "0" *) 
   (* C_RD_DATA_COUNT_WIDTH = "10" *) 
   (* C_RD_PNTR_WIDTH = "10" *) 
   (* C_RD_PNTR_WIDTH_RACH = "4" *) 
   (* C_RD_PNTR_WIDTH_RDCH = "10" *) 
   (* C_RD_PNTR_WIDTH_WACH = "4" *) 
   (* C_RD_PNTR_WIDTH_WDCH = "10" *) 
   (* C_RD_PNTR_WIDTH_WRCH = "4" *) 
   (* C_SYNCHRONIZER_STAGE = "2" *) 
   (* C_WR_DATA_COUNT_WIDTH = "10" *) 
   (* C_WR_PNTR_WIDTH = "10" *) 
   (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
   (* C_WR_PNTR_WIDTH_RACH = "4" *) 
   (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
   (* C_WR_PNTR_WIDTH_WACH = "4" *) 
   (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
   (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
   (* G_INDX_SS_TDATA = "1" *) 
   (* G_INDX_SS_TDEST = "6" *) 
   (* G_INDX_SS_TID = "5" *) 
   (* G_INDX_SS_TKEEP = "3" *) 
   (* G_INDX_SS_TLAST = "4" *) 
   (* G_INDX_SS_TREADY = "0" *) 
   (* G_INDX_SS_TSTRB = "2" *) 
   (* G_INDX_SS_TUSER = "7" *) 
   (* G_MASK_SS_TDATA = "2" *) 
   (* G_MASK_SS_TDEST = "64" *) 
   (* G_MASK_SS_TID = "32" *) 
   (* G_MASK_SS_TKEEP = "8" *) 
   (* G_MASK_SS_TLAST = "16" *) 
   (* G_MASK_SS_TREADY = "1" *) 
   (* G_MASK_SS_TSTRB = "4" *) 
   (* G_MASK_SS_TUSER = "128" *) 
   (* G_TASK_SEVERITY_ERR = "2" *) 
   (* G_TASK_SEVERITY_INFO = "0" *) 
   (* G_TASK_SEVERITY_WARNING = "1" *) 
   (* LP_M_ACLKEN_CAN_TOGGLE = "1" *) 
   (* LP_S_ACLKEN_CAN_TOGGLE = "1" *) 
   (* P_APPLICATION_TYPE_AXIS = "1" *) 
   (* P_AXIS_PAYLOAD_WIDTH = "53" *) 
   (* P_COMMON_CLOCK = "1" *) 
   (* P_FIFO_COUNT_WIDTH = "11" *) 
   (* P_FIFO_TYPE = "1" *) 
   (* P_IMPLEMENTATION_TYPE_AXIS = "1" *) 
   (* P_MSGON_VAL = "1" *) 
   (* P_TDATA_EXISTS = "1" *) 
   (* P_TDEST_EXISTS = "1" *) 
   (* P_TID_EXISTS = "1" *) 
   (* P_TKEEP_EXISTS = "1" *) 
   (* P_TLAST_EXISTS = "1" *) 
   (* P_TREADY_EXISTS = "1" *) 
   (* P_TSTRB_EXISTS = "1" *) 
   (* P_TUSER_EXISTS = "1" *) 
   (* P_WR_PNTR_WIDTH = "10" *) 
   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) 
   axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo inst
       (.axis_data_count(axis_data_count),
        .axis_rd_data_count(axis_rd_data_count),
        .axis_wr_data_count(axis_wr_data_count),
        .m_axis_aclk(\<const0> ),
        .m_axis_aclken(m_axis_aclken),
        .m_axis_aresetn(\<const0> ),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tdest(m_axis_tdest),
        .m_axis_tid(m_axis_tid),
        .m_axis_tkeep(m_axis_tkeep),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .m_axis_tstrb(m_axis_tstrb),
        .m_axis_tuser(m_axis_tuser),
        .m_axis_tvalid(m_axis_tvalid),
        .s_axis_aclk(s_axis_aclk),
        .s_axis_aclken(s_axis_aclken),
        .s_axis_aresetn(s_axis_aresetn),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tdest(s_axis_tdest),
        .s_axis_tid(s_axis_tid),
        .s_axis_tkeep(s_axis_tkeep),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tready(s_axis_tready),
        .s_axis_tstrb(s_axis_tstrb),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* C_FAMILY = "kintex7" *) (* C_AXIS_TDATA_WIDTH = "32" *) (* C_AXIS_TID_WIDTH = "1" *) 
(* C_AXIS_TDEST_WIDTH = "3" *) (* C_AXIS_TUSER_WIDTH = "8" *) (* C_AXIS_SIGNAL_SET = "32'b00000000000000000000000011111111" *) 
(* C_FIFO_DEPTH = "1024" *) (* C_FIFO_MODE = "2" *) (* C_IS_ACLK_ASYNC = "0" *) 
(* C_SYNCHRONIZER_STAGE = "2" *) (* C_ACLKEN_CONV_MODE = "3" *) (* G_INDX_SS_TREADY = "0" *) 
(* G_INDX_SS_TDATA = "1" *) (* G_INDX_SS_TSTRB = "2" *) (* G_INDX_SS_TKEEP = "3" *) 
(* G_INDX_SS_TLAST = "4" *) (* G_INDX_SS_TID = "5" *) (* G_INDX_SS_TDEST = "6" *) 
(* G_INDX_SS_TUSER = "7" *) (* G_MASK_SS_TREADY = "1" *) (* G_MASK_SS_TDATA = "2" *) 
(* G_MASK_SS_TSTRB = "4" *) (* G_MASK_SS_TKEEP = "8" *) (* G_MASK_SS_TLAST = "16" *) 
(* G_MASK_SS_TID = "32" *) (* G_MASK_SS_TDEST = "64" *) (* G_MASK_SS_TUSER = "128" *) 
(* G_TASK_SEVERITY_ERR = "2" *) (* G_TASK_SEVERITY_WARNING = "1" *) (* G_TASK_SEVERITY_INFO = "0" *) 
(* P_TREADY_EXISTS = "1" *) (* P_TDATA_EXISTS = "1" *) (* P_TSTRB_EXISTS = "1" *) 
(* P_TKEEP_EXISTS = "1" *) (* P_TLAST_EXISTS = "1" *) (* P_TID_EXISTS = "1" *) 
(* P_TDEST_EXISTS = "1" *) (* P_TUSER_EXISTS = "1" *) (* P_AXIS_PAYLOAD_WIDTH = "53" *) 
(* P_WR_PNTR_WIDTH = "10" *) (* P_FIFO_COUNT_WIDTH = "11" *) (* P_FIFO_TYPE = "1" *) 
(* P_IMPLEMENTATION_TYPE_AXIS = "1" *) (* P_COMMON_CLOCK = "1" *) (* P_MSGON_VAL = "1" *) 
(* P_APPLICATION_TYPE_AXIS = "1" *) (* LP_S_ACLKEN_CAN_TOGGLE = "1" *) (* LP_M_ACLKEN_CAN_TOGGLE = "1" *) 
(* C_DIN_WIDTH = "18" *) (* C_RD_PNTR_WIDTH = "10" *) (* C_WR_PNTR_WIDTH = "10" *) 
(* C_DOUT_WIDTH = "18" *) (* C_DATA_COUNT_WIDTH = "10" *) (* C_RD_DATA_COUNT_WIDTH = "10" *) 
(* C_WR_DATA_COUNT_WIDTH = "10" *) (* C_AXI_ID_WIDTH = "4" *) (* C_AXI_ADDR_WIDTH = "32" *) 
(* C_AXI_DATA_WIDTH = "64" *) (* C_AXI_AWUSER_WIDTH = "1" *) (* C_AXI_ARUSER_WIDTH = "1" *) 
(* C_AXI_RUSER_WIDTH = "1" *) (* C_AXI_BUSER_WIDTH = "1" *) (* C_AXI_WUSER_WIDTH = "1" *) 
(* C_WR_PNTR_WIDTH_RACH = "4" *) (* C_WR_PNTR_WIDTH_RDCH = "10" *) (* C_WR_PNTR_WIDTH_WACH = "4" *) 
(* C_WR_PNTR_WIDTH_WDCH = "10" *) (* C_WR_PNTR_WIDTH_WRCH = "4" *) (* C_RD_PNTR_WIDTH_RACH = "4" *) 
(* C_RD_PNTR_WIDTH_RDCH = "10" *) (* C_RD_PNTR_WIDTH_WACH = "4" *) (* C_RD_PNTR_WIDTH_WDCH = "10" *) 
(* C_RD_PNTR_WIDTH_WRCH = "4" *) (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
module axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo
   (s_axis_aresetn,
    m_axis_aresetn,
    s_axis_aclk,
    s_axis_aclken,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tid,
    s_axis_tdest,
    s_axis_tuser,
    m_axis_aclk,
    m_axis_aclken,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser,
    axis_data_count,
    axis_wr_data_count,
    axis_rd_data_count);
  input s_axis_aresetn;
  input m_axis_aresetn;
  input s_axis_aclk;
  input s_axis_aclken;
  input s_axis_tvalid;
  output s_axis_tready;
  input [31:0]s_axis_tdata;
  input [3:0]s_axis_tstrb;
  input [3:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [2:0]s_axis_tdest;
  input [7:0]s_axis_tuser;
  input m_axis_aclk;
  input m_axis_aclken;
  output m_axis_tvalid;
  input m_axis_tready;
  output [31:0]m_axis_tdata;
  output [3:0]m_axis_tstrb;
  output [3:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [2:0]m_axis_tdest;
  output [7:0]m_axis_tuser;
  output [31:0]axis_data_count;
  output [31:0]axis_wr_data_count;
  output [31:0]axis_rd_data_count;

  wire \<const0> ;
  wire [10:0]\^axis_data_count ;
  wire [31:0]d1_tdata;
  wire [2:0]d1_tdest;
  wire d1_tid;
  wire [3:0]d1_tkeep;
  wire d1_tlast;
  wire [3:0]d1_tstrb;
  wire [7:0]d1_tuser;
  wire d2_tlast;
  wire [52:1]dout_i;
  wire \gen_aclken_converter.s_util_aclken_converter_0/areset ;
  wire \inst_fifo_gen/axis_rd_en ;
  wire \inst_fifo_gen/axis_wr_eop ;
  wire \inst_fifo_gen/p_8_out ;
  wire m_axis_aclken;
  wire [31:0]m_axis_tdata;
  wire [2:0]m_axis_tdest;
  wire [0:0]m_axis_tid;
  wire [3:0]m_axis_tkeep;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire [3:0]m_axis_tstrb;
  wire [7:0]m_axis_tuser;
  wire m_axis_tvalid;
  wire \n_0_gen_fifo_generator.m_util_aclken_converter_wrapper_0 ;
  wire \n_1_gen_fifo_generator.m_util_aclken_converter_wrapper_0 ;
  wire \n_1_gen_fifo_generator.s_util_aclken_converter_wrapper_0 ;
  wire \n_2_gen_fifo_generator.fifo_generator_inst ;
  wire \n_2_gen_fifo_generator.m_util_aclken_converter_wrapper_0 ;
  wire \n_2_gen_fifo_generator.s_util_aclken_converter_wrapper_0 ;
  wire \n_3_gen_fifo_generator.m_util_aclken_converter_wrapper_0 ;
  wire \n_3_gen_fifo_generator.s_util_aclken_converter_wrapper_0 ;
  wire \n_68_gen_fifo_generator.fifo_generator_inst ;
  wire \n_69_gen_fifo_generator.fifo_generator_inst ;
  wire \n_70_gen_fifo_generator.fifo_generator_inst ;
  wire ram_full_i;
  wire s_axis_aclk;
  wire s_axis_aclken;
(* RTL_KEEP = "true" *)   wire s_axis_aresetn;
  wire [31:0]s_axis_tdata;
  wire [2:0]s_axis_tdest;
  wire [0:0]s_axis_tid;
  wire [3:0]s_axis_tkeep;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire [3:0]s_axis_tstrb;
  wire [7:0]s_axis_tuser;
  wire s_axis_tvalid;

  assign axis_data_count[31] = \<const0> ;
  assign axis_data_count[30] = \<const0> ;
  assign axis_data_count[29] = \<const0> ;
  assign axis_data_count[28] = \<const0> ;
  assign axis_data_count[27] = \<const0> ;
  assign axis_data_count[26] = \<const0> ;
  assign axis_data_count[25] = \<const0> ;
  assign axis_data_count[24] = \<const0> ;
  assign axis_data_count[23] = \<const0> ;
  assign axis_data_count[22] = \<const0> ;
  assign axis_data_count[21] = \<const0> ;
  assign axis_data_count[20] = \<const0> ;
  assign axis_data_count[19] = \<const0> ;
  assign axis_data_count[18] = \<const0> ;
  assign axis_data_count[17] = \<const0> ;
  assign axis_data_count[16] = \<const0> ;
  assign axis_data_count[15] = \<const0> ;
  assign axis_data_count[14] = \<const0> ;
  assign axis_data_count[13] = \<const0> ;
  assign axis_data_count[12] = \<const0> ;
  assign axis_data_count[11] = \<const0> ;
  assign axis_data_count[10:0] = \^axis_data_count [10:0];
  assign axis_rd_data_count[31] = \<const0> ;
  assign axis_rd_data_count[30] = \<const0> ;
  assign axis_rd_data_count[29] = \<const0> ;
  assign axis_rd_data_count[28] = \<const0> ;
  assign axis_rd_data_count[27] = \<const0> ;
  assign axis_rd_data_count[26] = \<const0> ;
  assign axis_rd_data_count[25] = \<const0> ;
  assign axis_rd_data_count[24] = \<const0> ;
  assign axis_rd_data_count[23] = \<const0> ;
  assign axis_rd_data_count[22] = \<const0> ;
  assign axis_rd_data_count[21] = \<const0> ;
  assign axis_rd_data_count[20] = \<const0> ;
  assign axis_rd_data_count[19] = \<const0> ;
  assign axis_rd_data_count[18] = \<const0> ;
  assign axis_rd_data_count[17] = \<const0> ;
  assign axis_rd_data_count[16] = \<const0> ;
  assign axis_rd_data_count[15] = \<const0> ;
  assign axis_rd_data_count[14] = \<const0> ;
  assign axis_rd_data_count[13] = \<const0> ;
  assign axis_rd_data_count[12] = \<const0> ;
  assign axis_rd_data_count[11] = \<const0> ;
  assign axis_rd_data_count[10:0] = \^axis_data_count [10:0];
  assign axis_wr_data_count[31] = \<const0> ;
  assign axis_wr_data_count[30] = \<const0> ;
  assign axis_wr_data_count[29] = \<const0> ;
  assign axis_wr_data_count[28] = \<const0> ;
  assign axis_wr_data_count[27] = \<const0> ;
  assign axis_wr_data_count[26] = \<const0> ;
  assign axis_wr_data_count[25] = \<const0> ;
  assign axis_wr_data_count[24] = \<const0> ;
  assign axis_wr_data_count[23] = \<const0> ;
  assign axis_wr_data_count[22] = \<const0> ;
  assign axis_wr_data_count[21] = \<const0> ;
  assign axis_wr_data_count[20] = \<const0> ;
  assign axis_wr_data_count[19] = \<const0> ;
  assign axis_wr_data_count[18] = \<const0> ;
  assign axis_wr_data_count[17] = \<const0> ;
  assign axis_wr_data_count[16] = \<const0> ;
  assign axis_wr_data_count[15] = \<const0> ;
  assign axis_wr_data_count[14] = \<const0> ;
  assign axis_wr_data_count[13] = \<const0> ;
  assign axis_wr_data_count[12] = \<const0> ;
  assign axis_wr_data_count[11] = \<const0> ;
  assign axis_wr_data_count[10:0] = \^axis_data_count [10:0];
GND GND
       (.G(\<const0> ));
axis_data_fifo_32w_1024d_aclkfifo_generator_v11_0 \gen_fifo_generator.fifo_generator_inst 
       (.E(\n_3_gen_fifo_generator.s_util_aclken_converter_wrapper_0 ),
        .I1({\n_0_gen_fifo_generator.m_util_aclken_converter_wrapper_0 ,\n_1_gen_fifo_generator.m_util_aclken_converter_wrapper_0 ,\n_2_gen_fifo_generator.m_util_aclken_converter_wrapper_0 ,\n_3_gen_fifo_generator.m_util_aclken_converter_wrapper_0 }),
        .I2(s_axis_aresetn),
        .I3({d1_tuser,d1_tdest,d1_tid,d1_tlast,d1_tkeep,d1_tstrb,d1_tdata}),
        .O1(\n_2_gen_fifo_generator.fifo_generator_inst ),
        .O2({dout_i,d2_tlast}),
        .O3(\n_68_gen_fifo_generator.fifo_generator_inst ),
        .O4(\n_69_gen_fifo_generator.fifo_generator_inst ),
        .O5(\n_70_gen_fifo_generator.fifo_generator_inst ),
        .Q({\n_1_gen_fifo_generator.s_util_aclken_converter_wrapper_0 ,\n_2_gen_fifo_generator.s_util_aclken_converter_wrapper_0 }),
        .axis_data_count(\^axis_data_count ),
        .axis_rd_en(\inst_fifo_gen/axis_rd_en ),
        .axis_wr_eop(\inst_fifo_gen/axis_wr_eop ),
        .m_axis_aclken(m_axis_aclken),
        .m_axis_tready(m_axis_tready),
        .p_8_out(\inst_fifo_gen/p_8_out ),
        .ram_full_i(ram_full_i),
        .s_axis_aclk(s_axis_aclk));
axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter_wrapper__parameterized0 \gen_fifo_generator.m_util_aclken_converter_wrapper_0 
       (.D({dout_i[8:1],dout_i[11:9],dout_i[12],d2_tlast,dout_i[16:13],dout_i[20:17],dout_i[52:21]}),
        .I1(\n_2_gen_fifo_generator.fifo_generator_inst ),
        .I2(\n_68_gen_fifo_generator.fifo_generator_inst ),
        .I3(\n_69_gen_fifo_generator.fifo_generator_inst ),
        .I4(\n_70_gen_fifo_generator.fifo_generator_inst ),
        .O1({m_axis_tuser,m_axis_tdest,m_axis_tid,m_axis_tlast,m_axis_tkeep,m_axis_tstrb,m_axis_tdata}),
        .Q({\n_0_gen_fifo_generator.m_util_aclken_converter_wrapper_0 ,\n_1_gen_fifo_generator.m_util_aclken_converter_wrapper_0 ,\n_2_gen_fifo_generator.m_util_aclken_converter_wrapper_0 ,\n_3_gen_fifo_generator.m_util_aclken_converter_wrapper_0 }),
        .SR(\gen_aclken_converter.s_util_aclken_converter_0/areset ),
        .m_axis_aclken(m_axis_aclken),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .p_8_out(\inst_fifo_gen/p_8_out ),
        .s_axis_aclk(s_axis_aclk));
axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter_wrapper \gen_fifo_generator.s_util_aclken_converter_wrapper_0 
       (.D({s_axis_tuser,s_axis_tdest,s_axis_tid,s_axis_tlast,s_axis_tkeep,s_axis_tstrb,s_axis_tdata}),
        .E(\n_3_gen_fifo_generator.s_util_aclken_converter_wrapper_0 ),
        .O1({d1_tuser,d1_tdest,d1_tid,d1_tlast,d1_tkeep,d1_tstrb,d1_tdata}),
        .Q({\n_1_gen_fifo_generator.s_util_aclken_converter_wrapper_0 ,\n_2_gen_fifo_generator.s_util_aclken_converter_wrapper_0 }),
        .SR(\gen_aclken_converter.s_util_aclken_converter_0/areset ),
        .axis_rd_en(\inst_fifo_gen/axis_rd_en ),
        .axis_wr_eop(\inst_fifo_gen/axis_wr_eop ),
        .ram_full_i(ram_full_i),
        .s_axis_aclk(s_axis_aclk),
        .s_axis_aclken(s_axis_aclken),
        .s_axis_aresetn(s_axis_aresetn),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

module axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter
   (SS,
    Q,
    E,
    axis_wr_eop,
    O1,
    s_axis_tready,
    s_axis_aclk,
    s_axis_tvalid,
    s_axis_aclken,
    ram_full_i,
    axis_rd_en,
    D,
    s_axis_aresetn);
  output [0:0]SS;
  output [1:0]Q;
  output [0:0]E;
  output axis_wr_eop;
  output [52:0]O1;
  output s_axis_tready;
  input s_axis_aclk;
  input s_axis_tvalid;
  input s_axis_aclken;
  input ram_full_i;
  input axis_rd_en;
  input [52:0]D;
  input s_axis_aresetn;

  wire \<const0> ;
  wire \<const1> ;
  wire [52:0]D;
  wire [0:0]E;
  wire [52:0]O1;
  wire [1:0]Q;
  wire [0:0]SS;
  wire axis_rd_en;
  wire axis_wr_eop;
  wire load_r0;
  wire load_r1;
  wire \n_0_FSM_onehot_state[0]_i_1 ;
  wire \n_0_FSM_onehot_state[0]_i_2 ;
  wire \n_0_FSM_onehot_state[1]_i_1 ;
  wire \n_0_FSM_onehot_state[1]_i_2__0 ;
  wire \n_0_FSM_onehot_state[1]_i_3 ;
  wire \n_0_FSM_onehot_state[2]_i_1 ;
  wire \n_0_FSM_onehot_state[2]_i_2 ;
  wire \n_0_FSM_onehot_state[2]_i_3 ;
  wire \n_0_FSM_onehot_state[2]_i_4 ;
  wire \n_0_FSM_onehot_state[3]_i_1 ;
  wire \n_0_FSM_onehot_state[3]_i_2 ;
  wire \n_0_FSM_onehot_state[4]_i_1__0 ;
  wire \n_0_FSM_onehot_state[4]_i_2__0 ;
  wire \n_0_FSM_onehot_state_reg[2] ;
  wire \n_0_FSM_onehot_state_reg[3] ;
  wire \n_0_FSM_onehot_state_reg[4] ;
  wire \n_0_r0[0]_i_1__0 ;
  wire \n_0_r0[10]_i_1__0 ;
  wire \n_0_r0[11]_i_1__0 ;
  wire \n_0_r0[12]_i_1__0 ;
  wire \n_0_r0[13]_i_1__0 ;
  wire \n_0_r0[14]_i_1__0 ;
  wire \n_0_r0[15]_i_1__0 ;
  wire \n_0_r0[16]_i_1__0 ;
  wire \n_0_r0[17]_i_1__0 ;
  wire \n_0_r0[18]_i_1__0 ;
  wire \n_0_r0[19]_i_1__0 ;
  wire \n_0_r0[1]_i_1__0 ;
  wire \n_0_r0[20]_i_1__0 ;
  wire \n_0_r0[21]_i_1__0 ;
  wire \n_0_r0[22]_i_1__0 ;
  wire \n_0_r0[23]_i_1__0 ;
  wire \n_0_r0[24]_i_1__0 ;
  wire \n_0_r0[25]_i_1__0 ;
  wire \n_0_r0[26]_i_1__0 ;
  wire \n_0_r0[27]_i_1__0 ;
  wire \n_0_r0[28]_i_1__0 ;
  wire \n_0_r0[29]_i_1__0 ;
  wire \n_0_r0[2]_i_1__0 ;
  wire \n_0_r0[30]_i_1__0 ;
  wire \n_0_r0[31]_i_1__0 ;
  wire \n_0_r0[32]_i_1__0 ;
  wire \n_0_r0[33]_i_1__0 ;
  wire \n_0_r0[34]_i_1__0 ;
  wire \n_0_r0[35]_i_1__0 ;
  wire \n_0_r0[36]_i_1__0 ;
  wire \n_0_r0[37]_i_1__0 ;
  wire \n_0_r0[38]_i_1__0 ;
  wire \n_0_r0[39]_i_1__0 ;
  wire \n_0_r0[3]_i_1__0 ;
  wire \n_0_r0[40]_i_1__0 ;
  wire \n_0_r0[41]_i_1__0 ;
  wire \n_0_r0[42]_i_1__0 ;
  wire \n_0_r0[43]_i_1__0 ;
  wire \n_0_r0[44]_i_1__0 ;
  wire \n_0_r0[45]_i_1__0 ;
  wire \n_0_r0[46]_i_1__0 ;
  wire \n_0_r0[47]_i_1__0 ;
  wire \n_0_r0[48]_i_1__0 ;
  wire \n_0_r0[49]_i_1__0 ;
  wire \n_0_r0[4]_i_1__0 ;
  wire \n_0_r0[50]_i_1__0 ;
  wire \n_0_r0[51]_i_1__0 ;
  wire \n_0_r0[52]_i_2 ;
  wire \n_0_r0[5]_i_1__0 ;
  wire \n_0_r0[6]_i_1__0 ;
  wire \n_0_r0[7]_i_1__0 ;
  wire \n_0_r0[8]_i_1__0 ;
  wire \n_0_r0[9]_i_1__0 ;
  wire p_0_in;
  wire [52:0]r1;
  wire ram_full_i;
  wire s_axis_aclk;
  wire s_axis_aclken;
  wire s_axis_aresetn;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire state17_out;

LUT4 #(
    .INIT(16'h0100)) 
     \FSM_onehot_state[0]_i_1 
       (.I0(\n_0_FSM_onehot_state_reg[3] ),
        .I1(Q[1]),
        .I2(\n_0_FSM_onehot_state_reg[2] ),
        .I3(\n_0_FSM_onehot_state[0]_i_2 ),
        .O(\n_0_FSM_onehot_state[0]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair16" *) 
   LUT4 #(
    .INIT(16'h0206)) 
     \FSM_onehot_state[0]_i_2 
       (.I0(Q[0]),
        .I1(\n_0_FSM_onehot_state_reg[4] ),
        .I2(s_axis_aclken),
        .I3(ram_full_i),
        .O(\n_0_FSM_onehot_state[0]_i_2 ));
LUT4 #(
    .INIT(16'h8B88)) 
     \FSM_onehot_state[1]_i_1 
       (.I0(\n_0_FSM_onehot_state[1]_i_2__0 ),
        .I1(Q[0]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state[1]_i_3 ),
        .O(\n_0_FSM_onehot_state[1]_i_1 ));
LUT5 #(
    .INIT(32'h00000004)) 
     \FSM_onehot_state[1]_i_2__0 
       (.I0(Q[1]),
        .I1(s_axis_aclken),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(\n_0_FSM_onehot_state_reg[4] ),
        .O(\n_0_FSM_onehot_state[1]_i_2__0 ));
LUT6 #(
    .INIT(64'h00020512000A005A)) 
     \FSM_onehot_state[1]_i_3 
       (.I0(Q[1]),
        .I1(s_axis_tvalid),
        .I2(\n_0_FSM_onehot_state_reg[2] ),
        .I3(\n_0_FSM_onehot_state_reg[4] ),
        .I4(ram_full_i),
        .I5(s_axis_aclken),
        .O(\n_0_FSM_onehot_state[1]_i_3 ));
LUT6 #(
    .INIT(64'h3333303033333130)) 
     \FSM_onehot_state[2]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(\n_0_FSM_onehot_state[2]_i_2 ),
        .I3(\n_0_FSM_onehot_state[2]_i_3 ),
        .I4(\n_0_FSM_onehot_state[2]_i_4 ),
        .I5(\n_0_FSM_onehot_state_reg[2] ),
        .O(\n_0_FSM_onehot_state[2]_i_1 ));
LUT6 #(
    .INIT(64'h0000000400040000)) 
     \FSM_onehot_state[2]_i_2 
       (.I0(Q[1]),
        .I1(\n_0_FSM_onehot_state_reg[2] ),
        .I2(\n_0_FSM_onehot_state_reg[4] ),
        .I3(\n_0_FSM_onehot_state_reg[3] ),
        .I4(ram_full_i),
        .I5(state17_out),
        .O(\n_0_FSM_onehot_state[2]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair14" *) 
   LUT4 #(
    .INIT(16'h0280)) 
     \FSM_onehot_state[2]_i_3 
       (.I0(s_axis_aclken),
        .I1(ram_full_i),
        .I2(\n_0_FSM_onehot_state_reg[4] ),
        .I3(\n_0_FSM_onehot_state_reg[3] ),
        .O(\n_0_FSM_onehot_state[2]_i_3 ));
LUT6 #(
    .INIT(64'h0000000000002000)) 
     \FSM_onehot_state[2]_i_4 
       (.I0(Q[1]),
        .I1(\n_0_FSM_onehot_state_reg[4] ),
        .I2(s_axis_aclken),
        .I3(s_axis_tvalid),
        .I4(\n_0_FSM_onehot_state_reg[3] ),
        .I5(\n_0_FSM_onehot_state_reg[2] ),
        .O(\n_0_FSM_onehot_state[2]_i_4 ));
(* SOFT_HLUTNM = "soft_lutpair16" *) 
   LUT2 #(
    .INIT(4'h8)) 
     \FSM_onehot_state[2]_i_5 
       (.I0(s_axis_aclken),
        .I1(s_axis_tvalid),
        .O(state17_out));
(* SOFT_HLUTNM = "soft_lutpair15" *) 
   LUT3 #(
    .INIT(8'h10)) 
     \FSM_onehot_state[3]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(\n_0_FSM_onehot_state[3]_i_2 ),
        .O(\n_0_FSM_onehot_state[3]_i_1 ));
LUT6 #(
    .INIT(64'h0000000033008000)) 
     \FSM_onehot_state[3]_i_2 
       (.I0(s_axis_tvalid),
        .I1(\n_0_FSM_onehot_state_reg[2] ),
        .I2(s_axis_aclken),
        .I3(ram_full_i),
        .I4(\n_0_FSM_onehot_state_reg[3] ),
        .I5(\n_0_FSM_onehot_state_reg[4] ),
        .O(\n_0_FSM_onehot_state[3]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair15" *) 
   LUT4 #(
    .INIT(16'h0100)) 
     \FSM_onehot_state[4]_i_1__0 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(\n_0_FSM_onehot_state_reg[2] ),
        .I3(\n_0_FSM_onehot_state[4]_i_2__0 ),
        .O(\n_0_FSM_onehot_state[4]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair14" *) 
   LUT4 #(
    .INIT(16'h0042)) 
     \FSM_onehot_state[4]_i_2__0 
       (.I0(\n_0_FSM_onehot_state_reg[3] ),
        .I1(ram_full_i),
        .I2(\n_0_FSM_onehot_state_reg[4] ),
        .I3(s_axis_aclken),
        .O(\n_0_FSM_onehot_state[4]_i_2__0 ));
FDSE #(
    .INIT(1'b1)) 
     \FSM_onehot_state_reg[0] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(\n_0_FSM_onehot_state[0]_i_1 ),
        .Q(Q[0]),
        .S(SS));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_state_reg[1] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(\n_0_FSM_onehot_state[1]_i_1 ),
        .Q(Q[1]),
        .R(SS));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_state_reg[2] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(\n_0_FSM_onehot_state[2]_i_1 ),
        .Q(\n_0_FSM_onehot_state_reg[2] ),
        .R(SS));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_state_reg[3] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(\n_0_FSM_onehot_state[3]_i_1 ),
        .Q(\n_0_FSM_onehot_state_reg[3] ),
        .R(SS));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_state_reg[4] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(\n_0_FSM_onehot_state[4]_i_1__0 ),
        .Q(\n_0_FSM_onehot_state_reg[4] ),
        .R(SS));
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
LUT1 #(
    .INIT(2'h1)) 
     areset_i_1
       (.I0(s_axis_aresetn),
        .O(p_0_in));
FDRE areset_reg
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(p_0_in),
        .Q(SS),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair13" *) 
   LUT4 #(
    .INIT(16'h0002)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_wr_eop_d1_i_1 
       (.I0(O1[40]),
        .I1(ram_full_i),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(axis_wr_eop));
(* SOFT_HLUTNM = "soft_lutpair13" *) 
   LUT4 #(
    .INIT(16'hFE01)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(ram_full_i),
        .I3(axis_rd_en),
        .O(E));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[0]_i_1__0 
       (.I0(r1[0]),
        .I1(D[0]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[0]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[10]_i_1__0 
       (.I0(r1[10]),
        .I1(D[10]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[10]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[11]_i_1__0 
       (.I0(r1[11]),
        .I1(D[11]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[11]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[12]_i_1__0 
       (.I0(r1[12]),
        .I1(D[12]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[12]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[13]_i_1__0 
       (.I0(r1[13]),
        .I1(D[13]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[13]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[14]_i_1__0 
       (.I0(r1[14]),
        .I1(D[14]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[14]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[15]_i_1__0 
       (.I0(r1[15]),
        .I1(D[15]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[15]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[16]_i_1__0 
       (.I0(r1[16]),
        .I1(D[16]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[16]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[17]_i_1__0 
       (.I0(r1[17]),
        .I1(D[17]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[17]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair12" *) 
   LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[18]_i_1__0 
       (.I0(r1[18]),
        .I1(D[18]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[18]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[19]_i_1__0 
       (.I0(r1[19]),
        .I1(D[19]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[19]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[1]_i_1__0 
       (.I0(r1[1]),
        .I1(D[1]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[1]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[20]_i_1__0 
       (.I0(r1[20]),
        .I1(D[20]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[20]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[21]_i_1__0 
       (.I0(r1[21]),
        .I1(D[21]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[21]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[22]_i_1__0 
       (.I0(r1[22]),
        .I1(D[22]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[22]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[23]_i_1__0 
       (.I0(r1[23]),
        .I1(D[23]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[23]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[24]_i_1__0 
       (.I0(r1[24]),
        .I1(D[24]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[24]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[25]_i_1__0 
       (.I0(r1[25]),
        .I1(D[25]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[25]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[26]_i_1__0 
       (.I0(r1[26]),
        .I1(D[26]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[26]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[27]_i_1__0 
       (.I0(r1[27]),
        .I1(D[27]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[27]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[28]_i_1__0 
       (.I0(r1[28]),
        .I1(D[28]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[28]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[29]_i_1__0 
       (.I0(r1[29]),
        .I1(D[29]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[29]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[2]_i_1__0 
       (.I0(r1[2]),
        .I1(D[2]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[2]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[30]_i_1__0 
       (.I0(r1[30]),
        .I1(D[30]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[30]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[31]_i_1__0 
       (.I0(r1[31]),
        .I1(D[31]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[31]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[32]_i_1__0 
       (.I0(r1[32]),
        .I1(D[32]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[32]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[33]_i_1__0 
       (.I0(r1[33]),
        .I1(D[33]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[33]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[34]_i_1__0 
       (.I0(r1[34]),
        .I1(D[34]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[34]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[35]_i_1__0 
       (.I0(r1[35]),
        .I1(D[35]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[35]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[36]_i_1__0 
       (.I0(r1[36]),
        .I1(D[36]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[36]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[37]_i_1__0 
       (.I0(r1[37]),
        .I1(D[37]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[37]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[38]_i_1__0 
       (.I0(r1[38]),
        .I1(D[38]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[38]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[39]_i_1__0 
       (.I0(r1[39]),
        .I1(D[39]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[39]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[3]_i_1__0 
       (.I0(r1[3]),
        .I1(D[3]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[3]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[40]_i_1__0 
       (.I0(r1[40]),
        .I1(D[40]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[40]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[41]_i_1__0 
       (.I0(r1[41]),
        .I1(D[41]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[41]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[42]_i_1__0 
       (.I0(r1[42]),
        .I1(D[42]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[42]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[43]_i_1__0 
       (.I0(r1[43]),
        .I1(D[43]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[43]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[44]_i_1__0 
       (.I0(r1[44]),
        .I1(D[44]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[44]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[45]_i_1__0 
       (.I0(r1[45]),
        .I1(D[45]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[45]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[46]_i_1__0 
       (.I0(r1[46]),
        .I1(D[46]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[46]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[47]_i_1__0 
       (.I0(r1[47]),
        .I1(D[47]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[47]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[48]_i_1__0 
       (.I0(r1[48]),
        .I1(D[48]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[48]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[49]_i_1__0 
       (.I0(r1[49]),
        .I1(D[49]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[49]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[4]_i_1__0 
       (.I0(r1[4]),
        .I1(D[4]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[4]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[50]_i_1__0 
       (.I0(r1[50]),
        .I1(D[50]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[50]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[51]_i_1__0 
       (.I0(r1[51]),
        .I1(D[51]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[51]_i_1__0 ));
LUT5 #(
    .INIT(32'h3238333C)) 
     \r0[52]_i_1__0 
       (.I0(Q[0]),
        .I1(\n_0_FSM_onehot_state_reg[3] ),
        .I2(Q[1]),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(ram_full_i),
        .O(load_r0));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[52]_i_2 
       (.I0(r1[52]),
        .I1(D[52]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[52]_i_2 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[5]_i_1__0 
       (.I0(r1[5]),
        .I1(D[5]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[5]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[6]_i_1__0 
       (.I0(r1[6]),
        .I1(D[6]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[6]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[7]_i_1__0 
       (.I0(r1[7]),
        .I1(D[7]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[7]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[8]_i_1__0 
       (.I0(r1[8]),
        .I1(D[8]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[8]_i_1__0 ));
LUT5 #(
    .INIT(32'hCCCCCCAC)) 
     \r0[9]_i_1__0 
       (.I0(r1[9]),
        .I1(D[9]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .I3(\n_0_FSM_onehot_state_reg[2] ),
        .I4(Q[1]),
        .O(\n_0_r0[9]_i_1__0 ));
FDRE \r0_reg[0] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[0]_i_1__0 ),
        .Q(O1[0]),
        .R(\<const0> ));
FDRE \r0_reg[10] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[10]_i_1__0 ),
        .Q(O1[10]),
        .R(\<const0> ));
FDRE \r0_reg[11] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[11]_i_1__0 ),
        .Q(O1[11]),
        .R(\<const0> ));
FDRE \r0_reg[12] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[12]_i_1__0 ),
        .Q(O1[12]),
        .R(\<const0> ));
FDRE \r0_reg[13] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[13]_i_1__0 ),
        .Q(O1[13]),
        .R(\<const0> ));
FDRE \r0_reg[14] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[14]_i_1__0 ),
        .Q(O1[14]),
        .R(\<const0> ));
FDRE \r0_reg[15] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[15]_i_1__0 ),
        .Q(O1[15]),
        .R(\<const0> ));
FDRE \r0_reg[16] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[16]_i_1__0 ),
        .Q(O1[16]),
        .R(\<const0> ));
FDRE \r0_reg[17] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[17]_i_1__0 ),
        .Q(O1[17]),
        .R(\<const0> ));
FDRE \r0_reg[18] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[18]_i_1__0 ),
        .Q(O1[18]),
        .R(\<const0> ));
FDRE \r0_reg[19] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[19]_i_1__0 ),
        .Q(O1[19]),
        .R(\<const0> ));
FDRE \r0_reg[1] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[1]_i_1__0 ),
        .Q(O1[1]),
        .R(\<const0> ));
FDRE \r0_reg[20] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[20]_i_1__0 ),
        .Q(O1[20]),
        .R(\<const0> ));
FDRE \r0_reg[21] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[21]_i_1__0 ),
        .Q(O1[21]),
        .R(\<const0> ));
FDRE \r0_reg[22] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[22]_i_1__0 ),
        .Q(O1[22]),
        .R(\<const0> ));
FDRE \r0_reg[23] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[23]_i_1__0 ),
        .Q(O1[23]),
        .R(\<const0> ));
FDRE \r0_reg[24] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[24]_i_1__0 ),
        .Q(O1[24]),
        .R(\<const0> ));
FDRE \r0_reg[25] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[25]_i_1__0 ),
        .Q(O1[25]),
        .R(\<const0> ));
FDRE \r0_reg[26] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[26]_i_1__0 ),
        .Q(O1[26]),
        .R(\<const0> ));
FDRE \r0_reg[27] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[27]_i_1__0 ),
        .Q(O1[27]),
        .R(\<const0> ));
FDRE \r0_reg[28] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[28]_i_1__0 ),
        .Q(O1[28]),
        .R(\<const0> ));
FDRE \r0_reg[29] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[29]_i_1__0 ),
        .Q(O1[29]),
        .R(\<const0> ));
FDRE \r0_reg[2] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[2]_i_1__0 ),
        .Q(O1[2]),
        .R(\<const0> ));
FDRE \r0_reg[30] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[30]_i_1__0 ),
        .Q(O1[30]),
        .R(\<const0> ));
FDRE \r0_reg[31] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[31]_i_1__0 ),
        .Q(O1[31]),
        .R(\<const0> ));
FDRE \r0_reg[32] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[32]_i_1__0 ),
        .Q(O1[32]),
        .R(\<const0> ));
FDRE \r0_reg[33] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[33]_i_1__0 ),
        .Q(O1[33]),
        .R(\<const0> ));
FDRE \r0_reg[34] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[34]_i_1__0 ),
        .Q(O1[34]),
        .R(\<const0> ));
FDRE \r0_reg[35] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[35]_i_1__0 ),
        .Q(O1[35]),
        .R(\<const0> ));
FDRE \r0_reg[36] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[36]_i_1__0 ),
        .Q(O1[36]),
        .R(\<const0> ));
FDRE \r0_reg[37] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[37]_i_1__0 ),
        .Q(O1[37]),
        .R(\<const0> ));
FDRE \r0_reg[38] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[38]_i_1__0 ),
        .Q(O1[38]),
        .R(\<const0> ));
FDRE \r0_reg[39] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[39]_i_1__0 ),
        .Q(O1[39]),
        .R(\<const0> ));
FDRE \r0_reg[3] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[3]_i_1__0 ),
        .Q(O1[3]),
        .R(\<const0> ));
FDRE \r0_reg[40] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[40]_i_1__0 ),
        .Q(O1[40]),
        .R(\<const0> ));
FDRE \r0_reg[41] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[41]_i_1__0 ),
        .Q(O1[41]),
        .R(\<const0> ));
FDRE \r0_reg[42] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[42]_i_1__0 ),
        .Q(O1[42]),
        .R(\<const0> ));
FDRE \r0_reg[43] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[43]_i_1__0 ),
        .Q(O1[43]),
        .R(\<const0> ));
FDRE \r0_reg[44] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[44]_i_1__0 ),
        .Q(O1[44]),
        .R(\<const0> ));
FDRE \r0_reg[45] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[45]_i_1__0 ),
        .Q(O1[45]),
        .R(\<const0> ));
FDRE \r0_reg[46] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[46]_i_1__0 ),
        .Q(O1[46]),
        .R(\<const0> ));
FDRE \r0_reg[47] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[47]_i_1__0 ),
        .Q(O1[47]),
        .R(\<const0> ));
FDRE \r0_reg[48] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[48]_i_1__0 ),
        .Q(O1[48]),
        .R(\<const0> ));
FDRE \r0_reg[49] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[49]_i_1__0 ),
        .Q(O1[49]),
        .R(\<const0> ));
FDRE \r0_reg[4] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[4]_i_1__0 ),
        .Q(O1[4]),
        .R(\<const0> ));
FDRE \r0_reg[50] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[50]_i_1__0 ),
        .Q(O1[50]),
        .R(\<const0> ));
FDRE \r0_reg[51] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[51]_i_1__0 ),
        .Q(O1[51]),
        .R(\<const0> ));
FDRE \r0_reg[52] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[52]_i_2 ),
        .Q(O1[52]),
        .R(\<const0> ));
FDRE \r0_reg[5] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[5]_i_1__0 ),
        .Q(O1[5]),
        .R(\<const0> ));
FDRE \r0_reg[6] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[6]_i_1__0 ),
        .Q(O1[6]),
        .R(\<const0> ));
FDRE \r0_reg[7] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[7]_i_1__0 ),
        .Q(O1[7]),
        .R(\<const0> ));
FDRE \r0_reg[8] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[8]_i_1__0 ),
        .Q(O1[8]),
        .R(\<const0> ));
FDRE \r0_reg[9] 
       (.C(s_axis_aclk),
        .CE(load_r0),
        .D(\n_0_r0[9]_i_1__0 ),
        .Q(O1[9]),
        .R(\<const0> ));
LUT3 #(
    .INIT(8'h0E)) 
     \r1[52]_i_1__0 
       (.I0(\n_0_FSM_onehot_state_reg[2] ),
        .I1(Q[1]),
        .I2(\n_0_FSM_onehot_state_reg[3] ),
        .O(load_r1));
FDRE \r1_reg[0] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[0]),
        .Q(r1[0]),
        .R(\<const0> ));
FDRE \r1_reg[10] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[10]),
        .Q(r1[10]),
        .R(\<const0> ));
FDRE \r1_reg[11] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[11]),
        .Q(r1[11]),
        .R(\<const0> ));
FDRE \r1_reg[12] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[12]),
        .Q(r1[12]),
        .R(\<const0> ));
FDRE \r1_reg[13] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[13]),
        .Q(r1[13]),
        .R(\<const0> ));
FDRE \r1_reg[14] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[14]),
        .Q(r1[14]),
        .R(\<const0> ));
FDRE \r1_reg[15] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[15]),
        .Q(r1[15]),
        .R(\<const0> ));
FDRE \r1_reg[16] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[16]),
        .Q(r1[16]),
        .R(\<const0> ));
FDRE \r1_reg[17] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[17]),
        .Q(r1[17]),
        .R(\<const0> ));
FDRE \r1_reg[18] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[18]),
        .Q(r1[18]),
        .R(\<const0> ));
FDRE \r1_reg[19] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[19]),
        .Q(r1[19]),
        .R(\<const0> ));
FDRE \r1_reg[1] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[1]),
        .Q(r1[1]),
        .R(\<const0> ));
FDRE \r1_reg[20] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[20]),
        .Q(r1[20]),
        .R(\<const0> ));
FDRE \r1_reg[21] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[21]),
        .Q(r1[21]),
        .R(\<const0> ));
FDRE \r1_reg[22] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[22]),
        .Q(r1[22]),
        .R(\<const0> ));
FDRE \r1_reg[23] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[23]),
        .Q(r1[23]),
        .R(\<const0> ));
FDRE \r1_reg[24] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[24]),
        .Q(r1[24]),
        .R(\<const0> ));
FDRE \r1_reg[25] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[25]),
        .Q(r1[25]),
        .R(\<const0> ));
FDRE \r1_reg[26] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[26]),
        .Q(r1[26]),
        .R(\<const0> ));
FDRE \r1_reg[27] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[27]),
        .Q(r1[27]),
        .R(\<const0> ));
FDRE \r1_reg[28] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[28]),
        .Q(r1[28]),
        .R(\<const0> ));
FDRE \r1_reg[29] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[29]),
        .Q(r1[29]),
        .R(\<const0> ));
FDRE \r1_reg[2] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[2]),
        .Q(r1[2]),
        .R(\<const0> ));
FDRE \r1_reg[30] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[30]),
        .Q(r1[30]),
        .R(\<const0> ));
FDRE \r1_reg[31] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[31]),
        .Q(r1[31]),
        .R(\<const0> ));
FDRE \r1_reg[32] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[32]),
        .Q(r1[32]),
        .R(\<const0> ));
FDRE \r1_reg[33] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[33]),
        .Q(r1[33]),
        .R(\<const0> ));
FDRE \r1_reg[34] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[34]),
        .Q(r1[34]),
        .R(\<const0> ));
FDRE \r1_reg[35] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[35]),
        .Q(r1[35]),
        .R(\<const0> ));
FDRE \r1_reg[36] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[36]),
        .Q(r1[36]),
        .R(\<const0> ));
FDRE \r1_reg[37] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[37]),
        .Q(r1[37]),
        .R(\<const0> ));
FDRE \r1_reg[38] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[38]),
        .Q(r1[38]),
        .R(\<const0> ));
FDRE \r1_reg[39] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[39]),
        .Q(r1[39]),
        .R(\<const0> ));
FDRE \r1_reg[3] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[3]),
        .Q(r1[3]),
        .R(\<const0> ));
FDRE \r1_reg[40] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[40]),
        .Q(r1[40]),
        .R(\<const0> ));
FDRE \r1_reg[41] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[41]),
        .Q(r1[41]),
        .R(\<const0> ));
FDRE \r1_reg[42] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[42]),
        .Q(r1[42]),
        .R(\<const0> ));
FDRE \r1_reg[43] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[43]),
        .Q(r1[43]),
        .R(\<const0> ));
FDRE \r1_reg[44] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[44]),
        .Q(r1[44]),
        .R(\<const0> ));
FDRE \r1_reg[45] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[45]),
        .Q(r1[45]),
        .R(\<const0> ));
FDRE \r1_reg[46] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[46]),
        .Q(r1[46]),
        .R(\<const0> ));
FDRE \r1_reg[47] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[47]),
        .Q(r1[47]),
        .R(\<const0> ));
FDRE \r1_reg[48] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[48]),
        .Q(r1[48]),
        .R(\<const0> ));
FDRE \r1_reg[49] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[49]),
        .Q(r1[49]),
        .R(\<const0> ));
FDRE \r1_reg[4] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[4]),
        .Q(r1[4]),
        .R(\<const0> ));
FDRE \r1_reg[50] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[50]),
        .Q(r1[50]),
        .R(\<const0> ));
FDRE \r1_reg[51] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[51]),
        .Q(r1[51]),
        .R(\<const0> ));
FDRE \r1_reg[52] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[52]),
        .Q(r1[52]),
        .R(\<const0> ));
FDRE \r1_reg[5] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[5]),
        .Q(r1[5]),
        .R(\<const0> ));
FDRE \r1_reg[6] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[6]),
        .Q(r1[6]),
        .R(\<const0> ));
FDRE \r1_reg[7] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[7]),
        .Q(r1[7]),
        .R(\<const0> ));
FDRE \r1_reg[8] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[8]),
        .Q(r1[8]),
        .R(\<const0> ));
FDRE \r1_reg[9] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[9]),
        .Q(r1[9]),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair12" *) 
   LUT2 #(
    .INIT(4'hE)) 
     s_axis_tready_INST_0
       (.I0(Q[1]),
        .I1(\n_0_FSM_onehot_state_reg[2] ),
        .O(s_axis_tready));
endmodule

(* ORIG_REF_NAME = "axis_infrastructure_v1_1_util_aclken_converter" *) 
module axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter__parameterized0
   (Q,
    m_axis_tvalid,
    O1,
    m_axis_aclken,
    I1,
    p_8_out,
    m_axis_tready,
    I2,
    I3,
    I4,
    D,
    SR,
    s_axis_aclk);
  output [3:0]Q;
  output m_axis_tvalid;
  output [52:0]O1;
  input m_axis_aclken;
  input I1;
  input p_8_out;
  input m_axis_tready;
  input I2;
  input I3;
  input I4;
  input [52:0]D;
  input [0:0]SR;
  input s_axis_aclk;

  wire \<const0> ;
  wire \<const1> ;
  wire [52:0]D;
  wire I1;
  wire I2;
  wire I3;
  wire I4;
  wire [52:0]O1;
  wire [3:0]Q;
  wire [0:0]SR;
  wire load_r1;
  wire m_axis_aclken;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire \n_0_FSM_onehot_state[1]_i_1__0 ;
  wire \n_0_FSM_onehot_state[1]_i_2 ;
  wire \n_0_FSM_onehot_state[2]_i_1__0 ;
  wire \n_0_FSM_onehot_state[3]_i_1__0 ;
  wire \n_0_FSM_onehot_state[3]_i_2__0 ;
  wire \n_0_FSM_onehot_state[3]_i_3 ;
  wire \n_0_FSM_onehot_state[4]_i_1 ;
  wire \n_0_FSM_onehot_state_reg[0] ;
  wire \n_0_r0[0]_i_1 ;
  wire \n_0_r0[10]_i_1 ;
  wire \n_0_r0[11]_i_1 ;
  wire \n_0_r0[12]_i_1 ;
  wire \n_0_r0[13]_i_1 ;
  wire \n_0_r0[14]_i_1 ;
  wire \n_0_r0[15]_i_1 ;
  wire \n_0_r0[16]_i_1 ;
  wire \n_0_r0[17]_i_1 ;
  wire \n_0_r0[18]_i_1 ;
  wire \n_0_r0[19]_i_1 ;
  wire \n_0_r0[1]_i_1 ;
  wire \n_0_r0[20]_i_1 ;
  wire \n_0_r0[21]_i_1 ;
  wire \n_0_r0[22]_i_1 ;
  wire \n_0_r0[23]_i_1 ;
  wire \n_0_r0[24]_i_1 ;
  wire \n_0_r0[25]_i_1 ;
  wire \n_0_r0[26]_i_1 ;
  wire \n_0_r0[27]_i_1 ;
  wire \n_0_r0[28]_i_1 ;
  wire \n_0_r0[29]_i_1 ;
  wire \n_0_r0[2]_i_1 ;
  wire \n_0_r0[30]_i_1 ;
  wire \n_0_r0[31]_i_1 ;
  wire \n_0_r0[31]_i_2 ;
  wire \n_0_r0[32]_i_1 ;
  wire \n_0_r0[33]_i_1 ;
  wire \n_0_r0[34]_i_1 ;
  wire \n_0_r0[35]_i_1 ;
  wire \n_0_r0[36]_i_1 ;
  wire \n_0_r0[37]_i_1 ;
  wire \n_0_r0[38]_i_1 ;
  wire \n_0_r0[39]_i_1 ;
  wire \n_0_r0[3]_i_1 ;
  wire \n_0_r0[40]_i_1 ;
  wire \n_0_r0[41]_i_1 ;
  wire \n_0_r0[42]_i_1 ;
  wire \n_0_r0[43]_i_1 ;
  wire \n_0_r0[44]_i_1 ;
  wire \n_0_r0[45]_i_1 ;
  wire \n_0_r0[46]_i_1 ;
  wire \n_0_r0[47]_i_1 ;
  wire \n_0_r0[48]_i_1 ;
  wire \n_0_r0[49]_i_1 ;
  wire \n_0_r0[4]_i_1 ;
  wire \n_0_r0[50]_i_1 ;
  wire \n_0_r0[51]_i_1 ;
  wire \n_0_r0[52]_i_1 ;
  wire \n_0_r0[5]_i_1 ;
  wire \n_0_r0[6]_i_1 ;
  wire \n_0_r0[7]_i_1 ;
  wire \n_0_r0[8]_i_1 ;
  wire \n_0_r0[9]_i_1 ;
  wire \n_0_r1_reg[0] ;
  wire \n_0_r1_reg[10] ;
  wire \n_0_r1_reg[11] ;
  wire \n_0_r1_reg[12] ;
  wire \n_0_r1_reg[13] ;
  wire \n_0_r1_reg[14] ;
  wire \n_0_r1_reg[15] ;
  wire \n_0_r1_reg[16] ;
  wire \n_0_r1_reg[17] ;
  wire \n_0_r1_reg[18] ;
  wire \n_0_r1_reg[19] ;
  wire \n_0_r1_reg[1] ;
  wire \n_0_r1_reg[20] ;
  wire \n_0_r1_reg[21] ;
  wire \n_0_r1_reg[22] ;
  wire \n_0_r1_reg[23] ;
  wire \n_0_r1_reg[24] ;
  wire \n_0_r1_reg[25] ;
  wire \n_0_r1_reg[26] ;
  wire \n_0_r1_reg[27] ;
  wire \n_0_r1_reg[28] ;
  wire \n_0_r1_reg[29] ;
  wire \n_0_r1_reg[2] ;
  wire \n_0_r1_reg[30] ;
  wire \n_0_r1_reg[31] ;
  wire \n_0_r1_reg[32] ;
  wire \n_0_r1_reg[33] ;
  wire \n_0_r1_reg[34] ;
  wire \n_0_r1_reg[35] ;
  wire \n_0_r1_reg[36] ;
  wire \n_0_r1_reg[37] ;
  wire \n_0_r1_reg[38] ;
  wire \n_0_r1_reg[39] ;
  wire \n_0_r1_reg[3] ;
  wire \n_0_r1_reg[40] ;
  wire \n_0_r1_reg[41] ;
  wire \n_0_r1_reg[42] ;
  wire \n_0_r1_reg[43] ;
  wire \n_0_r1_reg[44] ;
  wire \n_0_r1_reg[45] ;
  wire \n_0_r1_reg[46] ;
  wire \n_0_r1_reg[47] ;
  wire \n_0_r1_reg[48] ;
  wire \n_0_r1_reg[49] ;
  wire \n_0_r1_reg[4] ;
  wire \n_0_r1_reg[50] ;
  wire \n_0_r1_reg[51] ;
  wire \n_0_r1_reg[52] ;
  wire \n_0_r1_reg[5] ;
  wire \n_0_r1_reg[6] ;
  wire \n_0_r1_reg[7] ;
  wire \n_0_r1_reg[8] ;
  wire \n_0_r1_reg[9] ;
  wire p_8_out;
  wire s_axis_aclk;

LUT6 #(
    .INIT(64'h0010001000101110)) 
     \FSM_onehot_state[1]_i_1__0 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(\n_0_FSM_onehot_state[1]_i_2 ),
        .I3(\n_0_FSM_onehot_state_reg[0] ),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_FSM_onehot_state[1]_i_1__0 ));
LUT6 #(
    .INIT(64'h6606220222022202)) 
     \FSM_onehot_state[1]_i_2 
       (.I0(Q[0]),
        .I1(Q[2]),
        .I2(I1),
        .I3(p_8_out),
        .I4(m_axis_aclken),
        .I5(m_axis_tready),
        .O(\n_0_FSM_onehot_state[1]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair11" *) 
   LUT4 #(
    .INIT(16'h0100)) 
     \FSM_onehot_state[2]_i_1__0 
       (.I0(Q[3]),
        .I1(\n_0_FSM_onehot_state_reg[0] ),
        .I2(Q[2]),
        .I3(I2),
        .O(\n_0_FSM_onehot_state[2]_i_1__0 ));
LUT4 #(
    .INIT(16'h0151)) 
     \FSM_onehot_state[3]_i_1__0 
       (.I0(\n_0_FSM_onehot_state_reg[0] ),
        .I1(\n_0_FSM_onehot_state[3]_i_2__0 ),
        .I2(Q[0]),
        .I3(\n_0_FSM_onehot_state[3]_i_3 ),
        .O(\n_0_FSM_onehot_state[3]_i_1__0 ));
LUT6 #(
    .INIT(64'hFAFFFFFFB5E5EFEF)) 
     \FSM_onehot_state[3]_i_2__0 
       (.I0(Q[1]),
        .I1(I4),
        .I2(Q[2]),
        .I3(m_axis_tready),
        .I4(m_axis_aclken),
        .I5(Q[3]),
        .O(\n_0_FSM_onehot_state[3]_i_2__0 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEFFF)) 
     \FSM_onehot_state[3]_i_3 
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(m_axis_aclken),
        .I3(I1),
        .I4(p_8_out),
        .I5(Q[3]),
        .O(\n_0_FSM_onehot_state[3]_i_3 ));
LUT4 #(
    .INIT(16'h0100)) 
     \FSM_onehot_state[4]_i_1 
       (.I0(Q[0]),
        .I1(\n_0_FSM_onehot_state_reg[0] ),
        .I2(Q[1]),
        .I3(I3),
        .O(\n_0_FSM_onehot_state[4]_i_1 ));
FDSE #(
    .INIT(1'b1)) 
     \FSM_onehot_state_reg[0] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(\<const0> ),
        .Q(\n_0_FSM_onehot_state_reg[0] ),
        .S(SR));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_state_reg[1] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(\n_0_FSM_onehot_state[1]_i_1__0 ),
        .Q(Q[0]),
        .R(SR));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_state_reg[2] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(\n_0_FSM_onehot_state[2]_i_1__0 ),
        .Q(Q[1]),
        .R(SR));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_state_reg[3] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(\n_0_FSM_onehot_state[3]_i_1__0 ),
        .Q(Q[2]),
        .R(SR));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_state_reg[4] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(\n_0_FSM_onehot_state[4]_i_1 ),
        .Q(Q[3]),
        .R(SR));
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
(* SOFT_HLUTNM = "soft_lutpair11" *) 
   LUT2 #(
    .INIT(4'hE)) 
     m_axis_tvalid_INST_0
       (.I0(Q[2]),
        .I1(Q[3]),
        .O(m_axis_tvalid));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[0]_i_1 
       (.I0(\n_0_r1_reg[0] ),
        .I1(D[0]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[0]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[10]_i_1 
       (.I0(\n_0_r1_reg[10] ),
        .I1(D[10]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[10]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[11]_i_1 
       (.I0(\n_0_r1_reg[11] ),
        .I1(D[11]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[11]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[12]_i_1 
       (.I0(\n_0_r1_reg[12] ),
        .I1(D[12]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[12]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[13]_i_1 
       (.I0(\n_0_r1_reg[13] ),
        .I1(D[13]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[13]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[14]_i_1 
       (.I0(\n_0_r1_reg[14] ),
        .I1(D[14]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[14]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[15]_i_1 
       (.I0(\n_0_r1_reg[15] ),
        .I1(D[15]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[15]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[16]_i_1 
       (.I0(\n_0_r1_reg[16] ),
        .I1(D[16]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[16]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[17]_i_1 
       (.I0(\n_0_r1_reg[17] ),
        .I1(D[17]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[17]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[18]_i_1 
       (.I0(\n_0_r1_reg[18] ),
        .I1(D[18]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[18]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[19]_i_1 
       (.I0(\n_0_r1_reg[19] ),
        .I1(D[19]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[19]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[1]_i_1 
       (.I0(\n_0_r1_reg[1] ),
        .I1(D[1]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[1]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[20]_i_1 
       (.I0(\n_0_r1_reg[20] ),
        .I1(D[20]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[20]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[21]_i_1 
       (.I0(\n_0_r1_reg[21] ),
        .I1(D[21]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[21]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[22]_i_1 
       (.I0(\n_0_r1_reg[22] ),
        .I1(D[22]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[22]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[23]_i_1 
       (.I0(\n_0_r1_reg[23] ),
        .I1(D[23]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[23]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[24]_i_1 
       (.I0(\n_0_r1_reg[24] ),
        .I1(D[24]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[24]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[25]_i_1 
       (.I0(\n_0_r1_reg[25] ),
        .I1(D[25]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[25]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[26]_i_1 
       (.I0(\n_0_r1_reg[26] ),
        .I1(D[26]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[26]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[27]_i_1 
       (.I0(\n_0_r1_reg[27] ),
        .I1(D[27]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[27]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[28]_i_1 
       (.I0(\n_0_r1_reg[28] ),
        .I1(D[28]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[28]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[29]_i_1 
       (.I0(\n_0_r1_reg[29] ),
        .I1(D[29]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[29]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[2]_i_1 
       (.I0(\n_0_r1_reg[2] ),
        .I1(D[2]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[2]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[30]_i_1 
       (.I0(\n_0_r1_reg[30] ),
        .I1(D[30]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[30]_i_1 ));
LUT6 #(
    .INIT(64'h020202A800020020)) 
     \r0[31]_i_1 
       (.I0(m_axis_aclken),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[1]),
        .I5(m_axis_tready),
        .O(\n_0_r0[31]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[31]_i_2 
       (.I0(\n_0_r1_reg[31] ),
        .I1(D[31]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[31]_i_2 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[32]_i_1 
       (.I0(\n_0_r1_reg[32] ),
        .I1(D[32]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[32]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[33]_i_1 
       (.I0(\n_0_r1_reg[33] ),
        .I1(D[33]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[33]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[34]_i_1 
       (.I0(\n_0_r1_reg[34] ),
        .I1(D[34]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[34]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[35]_i_1 
       (.I0(\n_0_r1_reg[35] ),
        .I1(D[35]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[35]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[36]_i_1 
       (.I0(\n_0_r1_reg[36] ),
        .I1(D[36]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[36]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[37]_i_1 
       (.I0(\n_0_r1_reg[37] ),
        .I1(D[37]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[37]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[38]_i_1 
       (.I0(\n_0_r1_reg[38] ),
        .I1(D[38]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[38]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[39]_i_1 
       (.I0(\n_0_r1_reg[39] ),
        .I1(D[39]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[39]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[3]_i_1 
       (.I0(\n_0_r1_reg[3] ),
        .I1(D[3]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[3]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[40]_i_1 
       (.I0(\n_0_r1_reg[40] ),
        .I1(D[40]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[40]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[41]_i_1 
       (.I0(\n_0_r1_reg[41] ),
        .I1(D[41]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[41]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[42]_i_1 
       (.I0(\n_0_r1_reg[42] ),
        .I1(D[42]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[42]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[43]_i_1 
       (.I0(\n_0_r1_reg[43] ),
        .I1(D[43]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[43]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[44]_i_1 
       (.I0(\n_0_r1_reg[44] ),
        .I1(D[44]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[44]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[45]_i_1 
       (.I0(\n_0_r1_reg[45] ),
        .I1(D[45]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[45]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[46]_i_1 
       (.I0(\n_0_r1_reg[46] ),
        .I1(D[46]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[46]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[47]_i_1 
       (.I0(\n_0_r1_reg[47] ),
        .I1(D[47]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[47]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[48]_i_1 
       (.I0(\n_0_r1_reg[48] ),
        .I1(D[48]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[48]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[49]_i_1 
       (.I0(\n_0_r1_reg[49] ),
        .I1(D[49]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[49]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[4]_i_1 
       (.I0(\n_0_r1_reg[4] ),
        .I1(D[4]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[4]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[50]_i_1 
       (.I0(\n_0_r1_reg[50] ),
        .I1(D[50]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[50]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[51]_i_1 
       (.I0(\n_0_r1_reg[51] ),
        .I1(D[51]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[51]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[52]_i_1 
       (.I0(\n_0_r1_reg[52] ),
        .I1(D[52]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[52]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[5]_i_1 
       (.I0(\n_0_r1_reg[5] ),
        .I1(D[5]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[5]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[6]_i_1 
       (.I0(\n_0_r1_reg[6] ),
        .I1(D[6]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[6]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[7]_i_1 
       (.I0(\n_0_r1_reg[7] ),
        .I1(D[7]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[7]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[8]_i_1 
       (.I0(\n_0_r1_reg[8] ),
        .I1(D[8]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[8]_i_1 ));
LUT6 #(
    .INIT(64'hCCCCCCCCCCCCAAAC)) 
     \r0[9]_i_1 
       (.I0(\n_0_r1_reg[9] ),
        .I1(D[9]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\n_0_r0[9]_i_1 ));
FDRE \r0_reg[0] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[0]_i_1 ),
        .Q(O1[0]),
        .R(\<const0> ));
FDRE \r0_reg[10] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[10]_i_1 ),
        .Q(O1[10]),
        .R(\<const0> ));
FDRE \r0_reg[11] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[11]_i_1 ),
        .Q(O1[11]),
        .R(\<const0> ));
FDRE \r0_reg[12] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[12]_i_1 ),
        .Q(O1[12]),
        .R(\<const0> ));
FDRE \r0_reg[13] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[13]_i_1 ),
        .Q(O1[13]),
        .R(\<const0> ));
FDRE \r0_reg[14] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[14]_i_1 ),
        .Q(O1[14]),
        .R(\<const0> ));
FDRE \r0_reg[15] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[15]_i_1 ),
        .Q(O1[15]),
        .R(\<const0> ));
FDRE \r0_reg[16] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[16]_i_1 ),
        .Q(O1[16]),
        .R(\<const0> ));
FDRE \r0_reg[17] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[17]_i_1 ),
        .Q(O1[17]),
        .R(\<const0> ));
FDRE \r0_reg[18] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[18]_i_1 ),
        .Q(O1[18]),
        .R(\<const0> ));
FDRE \r0_reg[19] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[19]_i_1 ),
        .Q(O1[19]),
        .R(\<const0> ));
FDRE \r0_reg[1] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[1]_i_1 ),
        .Q(O1[1]),
        .R(\<const0> ));
FDRE \r0_reg[20] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[20]_i_1 ),
        .Q(O1[20]),
        .R(\<const0> ));
FDRE \r0_reg[21] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[21]_i_1 ),
        .Q(O1[21]),
        .R(\<const0> ));
FDRE \r0_reg[22] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[22]_i_1 ),
        .Q(O1[22]),
        .R(\<const0> ));
FDRE \r0_reg[23] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[23]_i_1 ),
        .Q(O1[23]),
        .R(\<const0> ));
FDRE \r0_reg[24] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[24]_i_1 ),
        .Q(O1[24]),
        .R(\<const0> ));
FDRE \r0_reg[25] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[25]_i_1 ),
        .Q(O1[25]),
        .R(\<const0> ));
FDRE \r0_reg[26] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[26]_i_1 ),
        .Q(O1[26]),
        .R(\<const0> ));
FDRE \r0_reg[27] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[27]_i_1 ),
        .Q(O1[27]),
        .R(\<const0> ));
FDRE \r0_reg[28] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[28]_i_1 ),
        .Q(O1[28]),
        .R(\<const0> ));
FDRE \r0_reg[29] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[29]_i_1 ),
        .Q(O1[29]),
        .R(\<const0> ));
FDRE \r0_reg[2] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[2]_i_1 ),
        .Q(O1[2]),
        .R(\<const0> ));
FDRE \r0_reg[30] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[30]_i_1 ),
        .Q(O1[30]),
        .R(\<const0> ));
FDRE \r0_reg[31] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[31]_i_2 ),
        .Q(O1[31]),
        .R(\<const0> ));
FDRE \r0_reg[32] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[32]_i_1 ),
        .Q(O1[32]),
        .R(\<const0> ));
FDRE \r0_reg[33] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[33]_i_1 ),
        .Q(O1[33]),
        .R(\<const0> ));
FDRE \r0_reg[34] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[34]_i_1 ),
        .Q(O1[34]),
        .R(\<const0> ));
FDRE \r0_reg[35] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[35]_i_1 ),
        .Q(O1[35]),
        .R(\<const0> ));
FDRE \r0_reg[36] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[36]_i_1 ),
        .Q(O1[36]),
        .R(\<const0> ));
FDRE \r0_reg[37] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[37]_i_1 ),
        .Q(O1[37]),
        .R(\<const0> ));
FDRE \r0_reg[38] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[38]_i_1 ),
        .Q(O1[38]),
        .R(\<const0> ));
FDRE \r0_reg[39] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[39]_i_1 ),
        .Q(O1[39]),
        .R(\<const0> ));
FDRE \r0_reg[3] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[3]_i_1 ),
        .Q(O1[3]),
        .R(\<const0> ));
FDRE \r0_reg[40] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[40]_i_1 ),
        .Q(O1[40]),
        .R(\<const0> ));
FDRE \r0_reg[41] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[41]_i_1 ),
        .Q(O1[41]),
        .R(\<const0> ));
FDRE \r0_reg[42] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[42]_i_1 ),
        .Q(O1[42]),
        .R(\<const0> ));
FDRE \r0_reg[43] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[43]_i_1 ),
        .Q(O1[43]),
        .R(\<const0> ));
FDRE \r0_reg[44] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[44]_i_1 ),
        .Q(O1[44]),
        .R(\<const0> ));
FDRE \r0_reg[45] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[45]_i_1 ),
        .Q(O1[45]),
        .R(\<const0> ));
FDRE \r0_reg[46] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[46]_i_1 ),
        .Q(O1[46]),
        .R(\<const0> ));
FDRE \r0_reg[47] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[47]_i_1 ),
        .Q(O1[47]),
        .R(\<const0> ));
FDRE \r0_reg[48] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[48]_i_1 ),
        .Q(O1[48]),
        .R(\<const0> ));
FDRE \r0_reg[49] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[49]_i_1 ),
        .Q(O1[49]),
        .R(\<const0> ));
FDRE \r0_reg[4] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[4]_i_1 ),
        .Q(O1[4]),
        .R(\<const0> ));
FDRE \r0_reg[50] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[50]_i_1 ),
        .Q(O1[50]),
        .R(\<const0> ));
FDRE \r0_reg[51] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[51]_i_1 ),
        .Q(O1[51]),
        .R(\<const0> ));
FDRE \r0_reg[52] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[52]_i_1 ),
        .Q(O1[52]),
        .R(\<const0> ));
FDRE \r0_reg[5] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[5]_i_1 ),
        .Q(O1[5]),
        .R(\<const0> ));
FDRE \r0_reg[6] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[6]_i_1 ),
        .Q(O1[6]),
        .R(\<const0> ));
FDRE \r0_reg[7] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[7]_i_1 ),
        .Q(O1[7]),
        .R(\<const0> ));
FDRE \r0_reg[8] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[8]_i_1 ),
        .Q(O1[8]),
        .R(\<const0> ));
FDRE \r0_reg[9] 
       (.C(s_axis_aclk),
        .CE(\n_0_r0[31]_i_1 ),
        .D(\n_0_r0[9]_i_1 ),
        .Q(O1[9]),
        .R(\<const0> ));
LUT4 #(
    .INIT(16'h000E)) 
     \r1[52]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[3]),
        .I3(Q[1]),
        .O(load_r1));
FDRE \r1_reg[0] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[0]),
        .Q(\n_0_r1_reg[0] ),
        .R(\<const0> ));
FDRE \r1_reg[10] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[10]),
        .Q(\n_0_r1_reg[10] ),
        .R(\<const0> ));
FDRE \r1_reg[11] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[11]),
        .Q(\n_0_r1_reg[11] ),
        .R(\<const0> ));
FDRE \r1_reg[12] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[12]),
        .Q(\n_0_r1_reg[12] ),
        .R(\<const0> ));
FDRE \r1_reg[13] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[13]),
        .Q(\n_0_r1_reg[13] ),
        .R(\<const0> ));
FDRE \r1_reg[14] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[14]),
        .Q(\n_0_r1_reg[14] ),
        .R(\<const0> ));
FDRE \r1_reg[15] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[15]),
        .Q(\n_0_r1_reg[15] ),
        .R(\<const0> ));
FDRE \r1_reg[16] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[16]),
        .Q(\n_0_r1_reg[16] ),
        .R(\<const0> ));
FDRE \r1_reg[17] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[17]),
        .Q(\n_0_r1_reg[17] ),
        .R(\<const0> ));
FDRE \r1_reg[18] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[18]),
        .Q(\n_0_r1_reg[18] ),
        .R(\<const0> ));
FDRE \r1_reg[19] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[19]),
        .Q(\n_0_r1_reg[19] ),
        .R(\<const0> ));
FDRE \r1_reg[1] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[1]),
        .Q(\n_0_r1_reg[1] ),
        .R(\<const0> ));
FDRE \r1_reg[20] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[20]),
        .Q(\n_0_r1_reg[20] ),
        .R(\<const0> ));
FDRE \r1_reg[21] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[21]),
        .Q(\n_0_r1_reg[21] ),
        .R(\<const0> ));
FDRE \r1_reg[22] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[22]),
        .Q(\n_0_r1_reg[22] ),
        .R(\<const0> ));
FDRE \r1_reg[23] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[23]),
        .Q(\n_0_r1_reg[23] ),
        .R(\<const0> ));
FDRE \r1_reg[24] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[24]),
        .Q(\n_0_r1_reg[24] ),
        .R(\<const0> ));
FDRE \r1_reg[25] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[25]),
        .Q(\n_0_r1_reg[25] ),
        .R(\<const0> ));
FDRE \r1_reg[26] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[26]),
        .Q(\n_0_r1_reg[26] ),
        .R(\<const0> ));
FDRE \r1_reg[27] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[27]),
        .Q(\n_0_r1_reg[27] ),
        .R(\<const0> ));
FDRE \r1_reg[28] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[28]),
        .Q(\n_0_r1_reg[28] ),
        .R(\<const0> ));
FDRE \r1_reg[29] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[29]),
        .Q(\n_0_r1_reg[29] ),
        .R(\<const0> ));
FDRE \r1_reg[2] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[2]),
        .Q(\n_0_r1_reg[2] ),
        .R(\<const0> ));
FDRE \r1_reg[30] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[30]),
        .Q(\n_0_r1_reg[30] ),
        .R(\<const0> ));
FDRE \r1_reg[31] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[31]),
        .Q(\n_0_r1_reg[31] ),
        .R(\<const0> ));
FDRE \r1_reg[32] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[32]),
        .Q(\n_0_r1_reg[32] ),
        .R(\<const0> ));
FDRE \r1_reg[33] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[33]),
        .Q(\n_0_r1_reg[33] ),
        .R(\<const0> ));
FDRE \r1_reg[34] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[34]),
        .Q(\n_0_r1_reg[34] ),
        .R(\<const0> ));
FDRE \r1_reg[35] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[35]),
        .Q(\n_0_r1_reg[35] ),
        .R(\<const0> ));
FDRE \r1_reg[36] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[36]),
        .Q(\n_0_r1_reg[36] ),
        .R(\<const0> ));
FDRE \r1_reg[37] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[37]),
        .Q(\n_0_r1_reg[37] ),
        .R(\<const0> ));
FDRE \r1_reg[38] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[38]),
        .Q(\n_0_r1_reg[38] ),
        .R(\<const0> ));
FDRE \r1_reg[39] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[39]),
        .Q(\n_0_r1_reg[39] ),
        .R(\<const0> ));
FDRE \r1_reg[3] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[3]),
        .Q(\n_0_r1_reg[3] ),
        .R(\<const0> ));
FDRE \r1_reg[40] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[40]),
        .Q(\n_0_r1_reg[40] ),
        .R(\<const0> ));
FDRE \r1_reg[41] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[41]),
        .Q(\n_0_r1_reg[41] ),
        .R(\<const0> ));
FDRE \r1_reg[42] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[42]),
        .Q(\n_0_r1_reg[42] ),
        .R(\<const0> ));
FDRE \r1_reg[43] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[43]),
        .Q(\n_0_r1_reg[43] ),
        .R(\<const0> ));
FDRE \r1_reg[44] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[44]),
        .Q(\n_0_r1_reg[44] ),
        .R(\<const0> ));
FDRE \r1_reg[45] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[45]),
        .Q(\n_0_r1_reg[45] ),
        .R(\<const0> ));
FDRE \r1_reg[46] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[46]),
        .Q(\n_0_r1_reg[46] ),
        .R(\<const0> ));
FDRE \r1_reg[47] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[47]),
        .Q(\n_0_r1_reg[47] ),
        .R(\<const0> ));
FDRE \r1_reg[48] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[48]),
        .Q(\n_0_r1_reg[48] ),
        .R(\<const0> ));
FDRE \r1_reg[49] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[49]),
        .Q(\n_0_r1_reg[49] ),
        .R(\<const0> ));
FDRE \r1_reg[4] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[4]),
        .Q(\n_0_r1_reg[4] ),
        .R(\<const0> ));
FDRE \r1_reg[50] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[50]),
        .Q(\n_0_r1_reg[50] ),
        .R(\<const0> ));
FDRE \r1_reg[51] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[51]),
        .Q(\n_0_r1_reg[51] ),
        .R(\<const0> ));
FDRE \r1_reg[52] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[52]),
        .Q(\n_0_r1_reg[52] ),
        .R(\<const0> ));
FDRE \r1_reg[5] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[5]),
        .Q(\n_0_r1_reg[5] ),
        .R(\<const0> ));
FDRE \r1_reg[6] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[6]),
        .Q(\n_0_r1_reg[6] ),
        .R(\<const0> ));
FDRE \r1_reg[7] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[7]),
        .Q(\n_0_r1_reg[7] ),
        .R(\<const0> ));
FDRE \r1_reg[8] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[8]),
        .Q(\n_0_r1_reg[8] ),
        .R(\<const0> ));
FDRE \r1_reg[9] 
       (.C(s_axis_aclk),
        .CE(load_r1),
        .D(D[9]),
        .Q(\n_0_r1_reg[9] ),
        .R(\<const0> ));
endmodule

module axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter_wrapper
   (SR,
    Q,
    E,
    axis_wr_eop,
    O1,
    s_axis_tready,
    s_axis_aclk,
    s_axis_tvalid,
    s_axis_aclken,
    ram_full_i,
    axis_rd_en,
    D,
    s_axis_aresetn);
  output [0:0]SR;
  output [1:0]Q;
  output [0:0]E;
  output axis_wr_eop;
  output [52:0]O1;
  output s_axis_tready;
  input s_axis_aclk;
  input s_axis_tvalid;
  input s_axis_aclken;
  input ram_full_i;
  input axis_rd_en;
  input [52:0]D;
  input s_axis_aresetn;

  wire [52:0]D;
  wire [0:0]E;
  wire [52:0]O1;
  wire [1:0]Q;
  wire [0:0]SR;
  wire axis_rd_en;
  wire axis_wr_eop;
  wire ram_full_i;
  wire s_axis_aclk;
  wire s_axis_aclken;
  wire s_axis_aresetn;
  wire s_axis_tready;
  wire s_axis_tvalid;

axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter \gen_aclken_converter.s_util_aclken_converter_0 
       (.D(D),
        .E(E),
        .O1(O1),
        .Q(Q),
        .SS(SR),
        .axis_rd_en(axis_rd_en),
        .axis_wr_eop(axis_wr_eop),
        .ram_full_i(ram_full_i),
        .s_axis_aclk(s_axis_aclk),
        .s_axis_aclken(s_axis_aclken),
        .s_axis_aresetn(s_axis_aresetn),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "axis_infrastructure_v1_1_util_aclken_converter_wrapper" *) 
module axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter_wrapper__parameterized0
   (Q,
    m_axis_tvalid,
    O1,
    m_axis_aclken,
    I1,
    p_8_out,
    m_axis_tready,
    I2,
    I3,
    I4,
    D,
    SR,
    s_axis_aclk);
  output [3:0]Q;
  output m_axis_tvalid;
  output [52:0]O1;
  input m_axis_aclken;
  input I1;
  input p_8_out;
  input m_axis_tready;
  input I2;
  input I3;
  input I4;
  input [52:0]D;
  input [0:0]SR;
  input s_axis_aclk;

  wire [52:0]D;
  wire I1;
  wire I2;
  wire I3;
  wire I4;
  wire [52:0]O1;
  wire [3:0]Q;
  wire [0:0]SR;
  wire m_axis_aclken;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire p_8_out;
  wire s_axis_aclk;

axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter__parameterized0 \gen_aclken_converter.s_util_aclken_converter_0 
       (.D(D),
        .I1(I1),
        .I2(I2),
        .I3(I3),
        .I4(I4),
        .O1(O1),
        .Q(Q),
        .SR(SR),
        .m_axis_aclken(m_axis_aclken),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .p_8_out(p_8_out),
        .s_axis_aclk(s_axis_aclk));
endmodule

module axis_data_fifo_32w_1024d_aclkblk_mem_gen_generic_cstr
   (DOUTB,
    s_axis_aclk,
    I4,
    ENB,
    I5,
    O6,
    I12);
  output [52:0]DOUTB;
  input s_axis_aclk;
  input I4;
  input ENB;
  input [9:0]I5;
  input [9:0]O6;
  input [52:0]I12;

  wire [52:0]DOUTB;
  wire ENB;
  wire [52:0]I12;
  wire I4;
  wire [9:0]I5;
  wire [9:0]O6;
  wire s_axis_aclk;

axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_width \ramloop[0].ram.r 
       (.DOUTB(DOUTB[17:0]),
        .ENB(ENB),
        .I12({I12[52:36],I12[32]}),
        .I4(I4),
        .I5(I5),
        .O6(O6),
        .s_axis_aclk(s_axis_aclk));
axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_width__parameterized0 \ramloop[1].ram.r 
       (.DOUTB(DOUTB[52:18]),
        .ENB(ENB),
        .I12({I12[35:33],I12[31:0]}),
        .I4(I4),
        .I5(I5),
        .O6(O6),
        .s_axis_aclk(s_axis_aclk));
endmodule

module axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_width
   (DOUTB,
    s_axis_aclk,
    I4,
    ENB,
    I5,
    O6,
    I12);
  output [17:0]DOUTB;
  input s_axis_aclk;
  input I4;
  input ENB;
  input [9:0]I5;
  input [9:0]O6;
  input [17:0]I12;

  wire [17:0]DOUTB;
  wire ENB;
  wire [17:0]I12;
  wire I4;
  wire [9:0]I5;
  wire [9:0]O6;
  wire s_axis_aclk;

axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_wrapper \prim_noinit.ram 
       (.DOUTB(DOUTB),
        .ENB(ENB),
        .I12(I12),
        .I4(I4),
        .I5(I5),
        .O6(O6),
        .s_axis_aclk(s_axis_aclk));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_width__parameterized0
   (DOUTB,
    I4,
    s_axis_aclk,
    ENB,
    I5,
    O6,
    I12);
  output [34:0]DOUTB;
  input I4;
  input s_axis_aclk;
  input ENB;
  input [9:0]I5;
  input [9:0]O6;
  input [34:0]I12;

  wire [34:0]DOUTB;
  wire ENB;
  wire [34:0]I12;
  wire I4;
  wire [9:0]I5;
  wire [9:0]O6;
  wire s_axis_aclk;

axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_wrapper__parameterized0 \prim_noinit.ram 
       (.DOUTB(DOUTB),
        .ENB(ENB),
        .I12(I12),
        .I4(I4),
        .I5(I5),
        .O6(O6),
        .s_axis_aclk(s_axis_aclk));
endmodule

module axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_wrapper
   (DOUTB,
    s_axis_aclk,
    I4,
    ENB,
    I5,
    O6,
    I12);
  output [17:0]DOUTB;
  input s_axis_aclk;
  input I4;
  input ENB;
  input [9:0]I5;
  input [9:0]O6;
  input [17:0]I12;

  wire \<const0> ;
  wire [17:0]DOUTB;
  wire ENB;
  wire [17:0]I12;
  wire I4;
  wire [9:0]I5;
  wire [9:0]O6;
  wire s_axis_aclk;
  wire [15:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED ;

(* box_type = "PRIMITIVE" *) 
   RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
     \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram 
       (.ADDRARDADDR({I5,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ADDRBWRADDR({O6,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .CLKARDCLK(s_axis_aclk),
        .CLKBWRCLK(s_axis_aclk),
        .DIADI({I12[4:1],I12[6],I12[9:7],I12[16:10],I12[5]}),
        .DIBDI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .DIPADIP({I12[0],I12[17]}),
        .DIPBDIP({\<const0> ,\<const0> }),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED [15:0]),
        .DOBDO({DOUTB[16:9],DOUTB[7:0]}),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED [1:0]),
        .DOPBDOP({DOUTB[17],DOUTB[8]}),
        .ENARDEN(I4),
        .ENBWREN(ENB),
        .REGCEAREGCE(\<const0> ),
        .REGCEB(\<const0> ),
        .RSTRAMARSTRAM(\<const0> ),
        .RSTRAMB(\<const0> ),
        .RSTREGARSTREG(\<const0> ),
        .RSTREGB(\<const0> ),
        .WEA({I4,I4}),
        .WEBWE({\<const0> ,\<const0> ,\<const0> ,\<const0> }));
GND GND
       (.G(\<const0> ));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_wrapper__parameterized0
   (DOUTB,
    I4,
    s_axis_aclk,
    ENB,
    I5,
    O6,
    I12);
  output [34:0]DOUTB;
  input I4;
  input s_axis_aclk;
  input ENB;
  input [9:0]I5;
  input [9:0]O6;
  input [34:0]I12;

  wire \<const0> ;
  wire \<const1> ;
  wire [34:0]DOUTB;
  wire ENB;
  wire [34:0]I12;
  wire I4;
  wire [9:0]I5;
  wire [9:0]O6;
  wire \n_72_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire s_axis_aclk;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

(* box_type = "PRIMITIVE" *) 
   RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
     \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({\<const1> ,I5,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .ADDRBWRADDR({\<const1> ,O6,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .CASCADEINA(\<const0> ),
        .CASCADEINB(\<const0> ),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(s_axis_aclk),
        .CLKBWRCLK(s_axis_aclk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({I12[31:24],I12[22:15],I12[13:6],I12[4:0],I12[34:32]}),
        .DIBDI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .DIPADIP({\<const0> ,I12[23],I12[14],I12[5]}),
        .DIPBDIP({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:0]),
        .DOBDO({DOUTB[34:27],DOUTB[25:18],DOUTB[16:9],DOUTB[7:0]}),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP({\n_72_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,DOUTB[26],DOUTB[17],DOUTB[8]}),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(I4),
        .ENBWREN(ENB),
        .INJECTDBITERR(\<const0> ),
        .INJECTSBITERR(\<const0> ),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(\<const0> ),
        .REGCEB(\<const0> ),
        .RSTRAMARSTRAM(\<const0> ),
        .RSTRAMB(\<const0> ),
        .RSTREGARSTREG(\<const0> ),
        .RSTREGB(\<const0> ),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({I4,I4,I4,I4}),
        .WEBWE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }));
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
endmodule

module axis_data_fifo_32w_1024d_aclkblk_mem_gen_top
   (DOUTB,
    s_axis_aclk,
    I4,
    ENB,
    I5,
    O6,
    I12);
  output [52:0]DOUTB;
  input s_axis_aclk;
  input I4;
  input ENB;
  input [9:0]I5;
  input [9:0]O6;
  input [52:0]I12;

  wire [52:0]DOUTB;
  wire ENB;
  wire [52:0]I12;
  wire I4;
  wire [9:0]I5;
  wire [9:0]O6;
  wire s_axis_aclk;

axis_data_fifo_32w_1024d_aclkblk_mem_gen_generic_cstr \valid.cstr 
       (.DOUTB(DOUTB),
        .ENB(ENB),
        .I12(I12),
        .I4(I4),
        .I5(I5),
        .O6(O6),
        .s_axis_aclk(s_axis_aclk));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_1" *) 
module axis_data_fifo_32w_1024d_aclkblk_mem_gen_v8_1__parameterized0
   (DOUTB,
    s_axis_aclk,
    I4,
    ENB,
    I5,
    O6,
    I12);
  output [52:0]DOUTB;
  input s_axis_aclk;
  input I4;
  input ENB;
  input [9:0]I5;
  input [9:0]O6;
  input [52:0]I12;

  wire [52:0]DOUTB;
  wire ENB;
  wire [52:0]I12;
  wire I4;
  wire [9:0]I5;
  wire [9:0]O6;
  wire s_axis_aclk;

axis_data_fifo_32w_1024d_aclkblk_mem_gen_v8_1_synth inst_blk_mem_gen
       (.DOUTB(DOUTB),
        .ENB(ENB),
        .I12(I12),
        .I4(I4),
        .I5(I5),
        .O6(O6),
        .s_axis_aclk(s_axis_aclk));
endmodule

module axis_data_fifo_32w_1024d_aclkblk_mem_gen_v8_1_synth
   (DOUTB,
    s_axis_aclk,
    I4,
    ENB,
    I5,
    O6,
    I12);
  output [52:0]DOUTB;
  input s_axis_aclk;
  input I4;
  input ENB;
  input [9:0]I5;
  input [9:0]O6;
  input [52:0]I12;

  wire [52:0]DOUTB;
  wire ENB;
  wire [52:0]I12;
  wire I4;
  wire [9:0]I5;
  wire [9:0]O6;
  wire s_axis_aclk;

axis_data_fifo_32w_1024d_aclkblk_mem_gen_top \gnativebmg.native_blk_mem_gen 
       (.DOUTB(DOUTB),
        .ENB(ENB),
        .I12(I12),
        .I4(I4),
        .I5(I5),
        .O6(O6),
        .s_axis_aclk(s_axis_aclk));
endmodule

module axis_data_fifo_32w_1024d_aclkcompare
   (comp0,
    v1_reg);
  output comp0;
  input [4:0]v1_reg;

  wire \<const0> ;
  wire \<const1> ;
  wire comp0;
  wire lopt;
  wire lopt_1;
  wire \n_0_gmux.gm[3].gms.ms ;
  wire [4:0]v1_reg;
  wire [2:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* box_type = "PRIMITIVE" *) 
   CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(lopt),
        .CO({\n_0_gmux.gm[3].gms.ms ,\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const1> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg[3:0]));
GND \gmux.gm[0].gm1.m1_CARRY4_GND 
       (.G(lopt));
(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* box_type = "PRIMITIVE" *) 
   CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(\n_0_gmux.gm[3].gms.ms ),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp0}),
        .CYINIT(lopt_1),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],\<const0> }),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],v1_reg[4]}));
GND \gmux.gm[4].gms.ms_CARRY4_GND 
       (.G(lopt_1));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module axis_data_fifo_32w_1024d_aclkcompare_0
   (comp1,
    v1_reg_0);
  output comp1;
  input [4:0]v1_reg_0;

  wire \<const0> ;
  wire \<const1> ;
  wire comp1;
  wire lopt;
  wire lopt_1;
  wire \n_0_gmux.gm[3].gms.ms ;
  wire [4:0]v1_reg_0;
  wire [2:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* box_type = "PRIMITIVE" *) 
   CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(lopt),
        .CO({\n_0_gmux.gm[3].gms.ms ,\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const1> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg_0[3:0]));
GND \gmux.gm[0].gm1.m1_CARRY4_GND 
       (.G(lopt));
(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* box_type = "PRIMITIVE" *) 
   CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(\n_0_gmux.gm[3].gms.ms ),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp1}),
        .CYINIT(lopt_1),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],\<const0> }),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],v1_reg_0[4]}));
GND \gmux.gm[4].gms.ms_CARRY4_GND 
       (.G(lopt_1));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module axis_data_fifo_32w_1024d_aclkcompare_1
   (p_0_in,
    v1_reg_1);
  output p_0_in;
  input [4:0]v1_reg_1;

  wire \<const0> ;
  wire \<const1> ;
  wire lopt;
  wire lopt_1;
  wire \n_0_gmux.gm[3].gms.ms ;
  wire p_0_in;
  wire [4:0]v1_reg_1;
  wire [2:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* box_type = "PRIMITIVE" *) 
   CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(lopt),
        .CO({\n_0_gmux.gm[3].gms.ms ,\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const1> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg_1[3:0]));
GND \gmux.gm[0].gm1.m1_CARRY4_GND 
       (.G(lopt));
(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* box_type = "PRIMITIVE" *) 
   CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(\n_0_gmux.gm[3].gms.ms ),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],p_0_in}),
        .CYINIT(lopt_1),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],\<const0> }),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],v1_reg_1[4]}));
GND \gmux.gm[4].gms.ms_CARRY4_GND 
       (.G(lopt_1));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module axis_data_fifo_32w_1024d_aclkcompare_2
   (comp0,
    v1_reg);
  output comp0;
  input [4:0]v1_reg;

  wire \<const0> ;
  wire \<const1> ;
  wire comp0;
  wire lopt;
  wire lopt_1;
  wire \n_0_gmux.gm[3].gms.ms ;
  wire [4:0]v1_reg;
  wire [2:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* box_type = "PRIMITIVE" *) 
   CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(lopt),
        .CO({\n_0_gmux.gm[3].gms.ms ,\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const1> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg[3:0]));
GND \gmux.gm[0].gm1.m1_CARRY4_GND 
       (.G(lopt));
(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* box_type = "PRIMITIVE" *) 
   CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(\n_0_gmux.gm[3].gms.ms ),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp0}),
        .CYINIT(lopt_1),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],\<const0> }),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],v1_reg[4]}));
GND \gmux.gm[4].gms.ms_CARRY4_GND 
       (.G(lopt_1));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module axis_data_fifo_32w_1024d_aclkcompare_3
   (comp1,
    v1_reg_0);
  output comp1;
  input [4:0]v1_reg_0;

  wire \<const0> ;
  wire \<const1> ;
  wire comp1;
  wire lopt;
  wire lopt_1;
  wire \n_0_gmux.gm[3].gms.ms ;
  wire [4:0]v1_reg_0;
  wire [2:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* box_type = "PRIMITIVE" *) 
   CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(lopt),
        .CO({\n_0_gmux.gm[3].gms.ms ,\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const1> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg_0[3:0]));
GND \gmux.gm[0].gm1.m1_CARRY4_GND 
       (.G(lopt));
(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* box_type = "PRIMITIVE" *) 
   CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(\n_0_gmux.gm[3].gms.ms ),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp1}),
        .CYINIT(lopt_1),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],\<const0> }),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],v1_reg_0[4]}));
GND \gmux.gm[4].gms.ms_CARRY4_GND 
       (.G(lopt_1));
endmodule

module axis_data_fifo_32w_1024d_aclkfifo_generator_ramfifo
   (O1,
    O2,
    O3,
    D,
    O4,
    O5,
    O6,
    E,
    O7,
    O8,
    O9,
    O10,
    s_axis_aclk,
    Q,
    S,
    I1,
    I2,
    I3,
    I4,
    I5,
    I6,
    I7,
    axis_wr_eop_d1,
    CO,
    I8,
    I9,
    m_axis_aclken,
    m_axis_tready,
    I10,
    I11,
    I12);
  output O1;
  output O2;
  output O3;
  output [10:0]D;
  output [10:0]O4;
  output O5;
  output [52:0]O6;
  output [0:0]E;
  output O7;
  output O8;
  output O9;
  output O10;
  input s_axis_aclk;
  input [9:0]Q;
  input [1:0]S;
  input [3:0]I1;
  input [2:0]I2;
  input [8:0]I3;
  input [1:0]I4;
  input [3:0]I5;
  input [2:0]I6;
  input [1:0]I7;
  input axis_wr_eop_d1;
  input [0:0]CO;
  input [3:0]I8;
  input I9;
  input m_axis_aclken;
  input m_axis_tready;
  input I10;
  input I11;
  input [52:0]I12;

  wire [0:0]CO;
  wire [10:0]D;
  wire [0:0]E;
  wire [3:0]I1;
  wire I10;
  wire I11;
  wire [52:0]I12;
  wire [2:0]I2;
  wire [8:0]I3;
  wire [1:0]I4;
  wire [3:0]I5;
  wire [2:0]I6;
  wire [1:0]I7;
  wire [3:0]I8;
  wire I9;
  wire O1;
  wire O10;
  wire O2;
  wire O3;
  wire [10:0]O4;
  wire O5;
  wire [52:0]O6;
  wire O7;
  wire O8;
  wire O9;
  wire [9:0]Q;
  wire RD_RST;
  wire RST;
  wire [1:0]S;
  wire axis_almost_full;
  wire axis_wr_eop_d1;
  wire [4:0]\grss.rsts/c1/v1_reg ;
  wire [4:0]\grss.rsts/c2/v1_reg ;
  wire \grss.rsts/comp0 ;
  wire \grss.rsts/comp1 ;
  wire m_axis_aclken;
  wire m_axis_tready;
  wire \n_13_gntv_or_sync_fifo.gl0.wr ;
  wire \n_14_gntv_or_sync_fifo.gl0.wr ;
  wire \n_17_gntv_or_sync_fifo.gl0.rd ;
  wire \n_30_gntv_or_sync_fifo.gl0.rd ;
  wire \n_31_gntv_or_sync_fifo.gl0.rd ;
  wire \n_32_gntv_or_sync_fifo.gl0.rd ;
  wire \n_54_gntv_or_sync_fifo.mem ;
  wire \n_56_gntv_or_sync_fifo.mem ;
  wire n_5_rstblk;
  wire p_13_out;
  wire p_17_out;
  wire [9:0]p_19_out;
  wire [9:0]p_8_out;
  wire [9:0]rd_pntr_plus1;
  wire rst_d2;
  wire rst_full_gen_i;
  wire s_axis_aclk;

axis_data_fifo_32w_1024d_aclkrd_logic \gntv_or_sync_fifo.gl0.rd 
       (.D(D),
        .DI(\n_54_gntv_or_sync_fifo.mem ),
        .E(\n_31_gntv_or_sync_fifo.gl0.rd ),
        .ENB(\n_30_gntv_or_sync_fifo.gl0.rd ),
        .I1(\n_14_gntv_or_sync_fifo.gl0.wr ),
        .I10(I3[1]),
        .I2({Q[8:2],Q[0]}),
        .I3(I1),
        .I4(I2),
        .I5(O3),
        .I6(O6[0]),
        .I7(I7),
        .I8(I8),
        .I9(I9),
        .O1(O2),
        .O10(O10),
        .O2(O5),
        .O3(\n_17_gntv_or_sync_fifo.gl0.rd ),
        .O4(rd_pntr_plus1),
        .O5(\n_32_gntv_or_sync_fifo.gl0.rd ),
        .O6(p_19_out),
        .O7(O7),
        .O8(O8),
        .Q({RD_RST,n_5_rstblk}),
        .S({S[1],\n_56_gntv_or_sync_fifo.mem ,S[0]}),
        .axis_wr_eop_d1(axis_wr_eop_d1),
        .comp0(\grss.rsts/comp0 ),
        .comp1(\grss.rsts/comp1 ),
        .m_axis_aclken(m_axis_aclken),
        .m_axis_tready(m_axis_tready),
        .p_13_out(p_13_out),
        .p_17_out(p_17_out),
        .s_axis_aclk(s_axis_aclk),
        .v1_reg(\grss.rsts/c1/v1_reg ),
        .v1_reg_0(\grss.rsts/c2/v1_reg ));
axis_data_fifo_32w_1024d_aclkwr_logic \gntv_or_sync_fifo.gl0.wr 
       (.AR(RST),
        .I1(O5),
        .I2(rd_pntr_plus1),
        .I3({I3[8:2],I3[0]}),
        .I5(I5),
        .I6(I6),
        .I7(I7),
        .O1(O3),
        .O2(\n_13_gntv_or_sync_fifo.gl0.wr ),
        .O3(\n_17_gntv_or_sync_fifo.gl0.rd ),
        .O4(O4),
        .O5(\n_14_gntv_or_sync_fifo.gl0.wr ),
        .O6(p_19_out),
        .Q(p_8_out),
        .S({I4[1],\n_32_gntv_or_sync_fifo.gl0.rd ,I4[0]}),
        .axis_almost_full(axis_almost_full),
        .comp0(\grss.rsts/comp0 ),
        .comp1(\grss.rsts/comp1 ),
        .p_13_out(p_13_out),
        .p_17_out(p_17_out),
        .rst_d2(rst_d2),
        .rst_full_gen_i(rst_full_gen_i),
        .s_axis_aclk(s_axis_aclk),
        .v1_reg(\grss.rsts/c1/v1_reg ),
        .v1_reg_0(\grss.rsts/c2/v1_reg ));
axis_data_fifo_32w_1024d_aclkmemory \gntv_or_sync_fifo.mem 
       (.CO(CO),
        .DI(\n_54_gntv_or_sync_fifo.mem ),
        .E(E),
        .ENB(\n_30_gntv_or_sync_fifo.gl0.rd ),
        .I1(O5),
        .I11(I11),
        .I12(I12),
        .I2(O2),
        .I3({Q[9],Q[1]}),
        .I4(\n_13_gntv_or_sync_fifo.gl0.wr ),
        .I5(p_8_out),
        .I6(\n_31_gntv_or_sync_fifo.gl0.rd ),
        .I8({I8[2],I8[0]}),
        .I9(I9),
        .O6(p_19_out),
        .O9(O9),
        .Q(O6),
        .S(\n_56_gntv_or_sync_fifo.mem ),
        .axis_almost_full(axis_almost_full),
        .axis_wr_eop_d1(axis_wr_eop_d1),
        .s_axis_aclk(s_axis_aclk));
axis_data_fifo_32w_1024d_aclkreset_blk_ramfifo rstblk
       (.AR(RST),
        .I10(I10),
        .O1(O1),
        .Q({RD_RST,n_5_rstblk}),
        .rst_d2(rst_d2),
        .rst_full_gen_i(rst_full_gen_i),
        .s_axis_aclk(s_axis_aclk));
endmodule

module axis_data_fifo_32w_1024d_aclkfifo_generator_top
   (AR,
    O1,
    O2,
    D,
    O3,
    O4,
    O5,
    E,
    O6,
    O7,
    O8,
    O9,
    s_axis_aclk,
    Q,
    S,
    I1,
    I2,
    I3,
    I4,
    I5,
    I6,
    I7,
    axis_wr_eop_d1,
    CO,
    I8,
    I9,
    m_axis_aclken,
    m_axis_tready,
    I10,
    I11,
    I12);
  output [0:0]AR;
  output O1;
  output O2;
  output [10:0]D;
  output [10:0]O3;
  output O4;
  output [52:0]O5;
  output [0:0]E;
  output O6;
  output O7;
  output O8;
  output O9;
  input s_axis_aclk;
  input [9:0]Q;
  input [1:0]S;
  input [3:0]I1;
  input [2:0]I2;
  input [8:0]I3;
  input [1:0]I4;
  input [3:0]I5;
  input [2:0]I6;
  input [1:0]I7;
  input axis_wr_eop_d1;
  input [0:0]CO;
  input [3:0]I8;
  input I9;
  input m_axis_aclken;
  input m_axis_tready;
  input I10;
  input I11;
  input [52:0]I12;

  wire [0:0]AR;
  wire [0:0]CO;
  wire [10:0]D;
  wire [0:0]E;
  wire [3:0]I1;
  wire I10;
  wire I11;
  wire [52:0]I12;
  wire [2:0]I2;
  wire [8:0]I3;
  wire [1:0]I4;
  wire [3:0]I5;
  wire [2:0]I6;
  wire [1:0]I7;
  wire [3:0]I8;
  wire I9;
  wire O1;
  wire O2;
  wire [10:0]O3;
  wire O4;
  wire [52:0]O5;
  wire O6;
  wire O7;
  wire O8;
  wire O9;
  wire [9:0]Q;
  wire [1:0]S;
  wire axis_wr_eop_d1;
  wire m_axis_aclken;
  wire m_axis_tready;
  wire s_axis_aclk;

axis_data_fifo_32w_1024d_aclkfifo_generator_ramfifo \grf.rf 
       (.CO(CO),
        .D(D),
        .E(E),
        .I1(I1),
        .I10(I10),
        .I11(I11),
        .I12(I12),
        .I2(I2),
        .I3(I3),
        .I4(I4),
        .I5(I5),
        .I6(I6),
        .I7(I7),
        .I8(I8),
        .I9(I9),
        .O1(AR),
        .O10(O9),
        .O2(O1),
        .O3(O2),
        .O4(O3),
        .O5(O4),
        .O6(O5),
        .O7(O6),
        .O8(O7),
        .O9(O8),
        .Q(Q),
        .S(S),
        .axis_wr_eop_d1(axis_wr_eop_d1),
        .m_axis_aclken(m_axis_aclken),
        .m_axis_tready(m_axis_tready),
        .s_axis_aclk(s_axis_aclk));
endmodule

module axis_data_fifo_32w_1024d_aclkfifo_generator_v11_0
   (p_8_out,
    ram_full_i,
    O1,
    axis_data_count,
    axis_rd_en,
    O2,
    O3,
    O4,
    O5,
    s_axis_aclk,
    axis_wr_eop,
    Q,
    I1,
    m_axis_aclken,
    m_axis_tready,
    I2,
    I3,
    E);
  output p_8_out;
  output ram_full_i;
  output O1;
  output [10:0]axis_data_count;
  output axis_rd_en;
  output [52:0]O2;
  output O3;
  output O4;
  output O5;
  input s_axis_aclk;
  input axis_wr_eop;
  input [1:0]Q;
  input [3:0]I1;
  input m_axis_aclken;
  input m_axis_tready;
  input I2;
  input [52:0]I3;
  input [0:0]E;

  wire [0:0]E;
  wire [3:0]I1;
  wire I2;
  wire [52:0]I3;
  wire O1;
  wire [52:0]O2;
  wire O3;
  wire O4;
  wire O5;
  wire [1:0]Q;
  wire [10:0]axis_data_count;
  wire axis_rd_en;
  wire axis_wr_eop;
  wire m_axis_aclken;
  wire m_axis_tready;
  wire p_8_out;
  wire ram_full_i;
  wire s_axis_aclk;

axis_data_fifo_32w_1024d_aclkfifo_generator_v11_0_synth inst_fifo_gen
       (.E(E),
        .I1(Q),
        .I2(I1),
        .I3(I2),
        .I4(I3),
        .O1(p_8_out),
        .O2(ram_full_i),
        .O3(O1),
        .O4(axis_rd_en),
        .O5(O2),
        .O6(O3),
        .O7(O4),
        .O8(O5),
        .Q(axis_data_count),
        .axis_wr_eop(axis_wr_eop),
        .m_axis_aclken(m_axis_aclken),
        .m_axis_tready(m_axis_tready),
        .s_axis_aclk(s_axis_aclk));
endmodule

module axis_data_fifo_32w_1024d_aclkfifo_generator_v11_0_synth
   (O1,
    O2,
    O3,
    Q,
    O4,
    O5,
    O6,
    O7,
    O8,
    s_axis_aclk,
    axis_wr_eop,
    I1,
    I2,
    m_axis_aclken,
    m_axis_tready,
    I3,
    I4,
    E);
  output O1;
  output O2;
  output O3;
  output [10:0]Q;
  output O4;
  output [52:0]O5;
  output O6;
  output O7;
  output O8;
  input s_axis_aclk;
  input axis_wr_eop;
  input [1:0]I1;
  input [3:0]I2;
  input m_axis_aclken;
  input m_axis_tready;
  input I3;
  input [52:0]I4;
  input [0:0]E;

  wire \<const0> ;
  wire \<const1> ;
  wire [0:0]E;
  wire [1:0]I1;
  wire [3:0]I2;
  wire I3;
  wire [52:0]I4;
  wire O1;
  wire O2;
  wire O3;
  wire O4;
  wire [52:0]O5;
  wire O6;
  wire O7;
  wire O8;
  wire [10:0]Q;
  wire axis_wr_eop;
  wire axis_wr_eop_d1;
  wire clear;
  wire [10:0]\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 ;
  wire m_axis_aclken;
  wire m_axis_tready;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_3 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_4 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_5 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_4 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_7 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_2 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_3 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_4 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_5 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_10 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_11 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_3 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_5 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_8 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_9 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_5 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_6 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_7 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_4 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_7 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_2 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_3 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_4 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_5 ;
  wire \n_10_gaxis_fifo.gaxisf.axisf ;
  wire \n_11_gaxis_fifo.gaxisf.axisf ;
  wire \n_12_gaxis_fifo.gaxisf.axisf ;
  wire \n_13_gaxis_fifo.gaxisf.axisf ;
  wire \n_14_gaxis_fifo.gaxisf.axisf ;
  wire \n_15_gaxis_fifo.gaxisf.axisf ;
  wire \n_16_gaxis_fifo.gaxisf.axisf ;
  wire \n_17_gaxis_fifo.gaxisf.axisf ;
  wire \n_18_gaxis_fifo.gaxisf.axisf ;
  wire \n_19_gaxis_fifo.gaxisf.axisf ;
  wire \n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6 ;
  wire \n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7 ;
  wire \n_20_gaxis_fifo.gaxisf.axisf ;
  wire \n_21_gaxis_fifo.gaxisf.axisf ;
  wire \n_22_gaxis_fifo.gaxisf.axisf ;
  wire \n_23_gaxis_fifo.gaxisf.axisf ;
  wire \n_24_gaxis_fifo.gaxisf.axisf ;
  wire \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4 ;
  wire \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6 ;
  wire \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7 ;
  wire \n_3_gaxis_fifo.gaxisf.axisf ;
  wire \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4 ;
  wire \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6 ;
  wire \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7 ;
  wire \n_4_gaxis_fifo.gaxisf.axisf ;
  wire \n_5_gaxis_fifo.gaxisf.axisf ;
  wire \n_6_gaxis_fifo.gaxisf.axisf ;
  wire \n_79_gaxis_fifo.gaxisf.axisf ;
  wire \n_7_gaxis_fifo.gaxisf.axisf ;
  wire \n_82_gaxis_fifo.gaxisf.axisf ;
  wire \n_8_gaxis_fifo.gaxisf.axisf ;
  wire \n_9_gaxis_fifo.gaxisf.axisf ;
  wire p_13_in;
  wire s_axis_aclk;
  wire [3:3]\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4_CO_UNCONNECTED ;
  wire [3:0]\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4_O_UNCONNECTED ;
  wire [3:0]\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6_O_UNCONNECTED ;
  wire [3:0]\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7_O_UNCONNECTED ;

GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
axis_data_fifo_32w_1024d_aclkfifo_generator_top \gaxis_fifo.gaxisf.axisf 
       (.AR(clear),
        .CO(p_13_in),
        .D({\n_3_gaxis_fifo.gaxisf.axisf ,\n_4_gaxis_fifo.gaxisf.axisf ,\n_5_gaxis_fifo.gaxisf.axisf ,\n_6_gaxis_fifo.gaxisf.axisf ,\n_7_gaxis_fifo.gaxisf.axisf ,\n_8_gaxis_fifo.gaxisf.axisf ,\n_9_gaxis_fifo.gaxisf.axisf ,\n_10_gaxis_fifo.gaxisf.axisf ,\n_11_gaxis_fifo.gaxisf.axisf ,\n_12_gaxis_fifo.gaxisf.axisf ,\n_13_gaxis_fifo.gaxisf.axisf }),
        .E(\n_79_gaxis_fifo.gaxisf.axisf ),
        .I1({\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_2 ,\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_3 ,\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_4 ,\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_5 }),
        .I10(I3),
        .I11(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_3 ),
        .I12(I4),
        .I2({\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_3 ,\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_4 ,\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_5 }),
        .I3(Q[8:0]),
        .I4({\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_4 ,\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_7 }),
        .I5({\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_2 ,\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_3 ,\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_4 ,\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_5 }),
        .I6({\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_5 ,\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_6 ,\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_7 }),
        .I7(I1),
        .I8(I2),
        .I9(O3),
        .O1(O1),
        .O2(O2),
        .O3({\n_14_gaxis_fifo.gaxisf.axisf ,\n_15_gaxis_fifo.gaxisf.axisf ,\n_16_gaxis_fifo.gaxisf.axisf ,\n_17_gaxis_fifo.gaxisf.axisf ,\n_18_gaxis_fifo.gaxisf.axisf ,\n_19_gaxis_fifo.gaxisf.axisf ,\n_20_gaxis_fifo.gaxisf.axisf ,\n_21_gaxis_fifo.gaxisf.axisf ,\n_22_gaxis_fifo.gaxisf.axisf ,\n_23_gaxis_fifo.gaxisf.axisf ,\n_24_gaxis_fifo.gaxisf.axisf }),
        .O4(O4),
        .O5(O5),
        .O6(O6),
        .O7(O7),
        .O8(\n_82_gaxis_fifo.gaxisf.axisf ),
        .O9(O8),
        .Q({\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [10],\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [8:0]}),
        .S({\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_4 ,\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_7 }),
        .axis_wr_eop_d1(axis_wr_eop_d1),
        .m_axis_aclken(m_axis_aclken),
        .m_axis_tready(m_axis_tready),
        .s_axis_aclk(s_axis_aclk));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_3 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [9]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [10]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_3 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_4 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [8]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [9]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_4 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_5 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [7]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [8]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_5 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_4 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [2]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [3]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_4 ));
LUT1 #(
    .INIT(2'h1)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_7 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [0]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_7 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_2 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [6]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [7]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_2 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_3 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [5]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [6]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_3 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_4 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [4]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [5]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_4 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_5 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [3]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [4]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_5 ));
(* counter = "5" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[0] 
       (.C(s_axis_aclk),
        .CE(\n_79_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_13_gaxis_fifo.gaxisf.axisf ),
        .Q(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [0]));
(* counter = "5" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10] 
       (.C(s_axis_aclk),
        .CE(\n_79_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_3_gaxis_fifo.gaxisf.axisf ),
        .Q(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [10]));
(* counter = "5" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[1] 
       (.C(s_axis_aclk),
        .CE(\n_79_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_12_gaxis_fifo.gaxisf.axisf ),
        .Q(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [1]));
(* counter = "5" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[2] 
       (.C(s_axis_aclk),
        .CE(\n_79_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_11_gaxis_fifo.gaxisf.axisf ),
        .Q(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [2]));
(* counter = "5" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3] 
       (.C(s_axis_aclk),
        .CE(\n_79_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_10_gaxis_fifo.gaxisf.axisf ),
        .Q(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [3]));
(* counter = "5" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[4] 
       (.C(s_axis_aclk),
        .CE(\n_79_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_9_gaxis_fifo.gaxisf.axisf ),
        .Q(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [4]));
(* counter = "5" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[5] 
       (.C(s_axis_aclk),
        .CE(\n_79_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_8_gaxis_fifo.gaxisf.axisf ),
        .Q(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [5]));
(* counter = "5" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[6] 
       (.C(s_axis_aclk),
        .CE(\n_79_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_7_gaxis_fifo.gaxisf.axisf ),
        .Q(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [6]));
(* counter = "5" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7] 
       (.C(s_axis_aclk),
        .CE(\n_79_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_6_gaxis_fifo.gaxisf.axisf ),
        .Q(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [7]));
(* counter = "5" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[8] 
       (.C(s_axis_aclk),
        .CE(\n_79_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_5_gaxis_fifo.gaxisf.axisf ),
        .Q(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [8]));
(* counter = "5" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[9] 
       (.C(s_axis_aclk),
        .CE(\n_79_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_4_gaxis_fifo.gaxisf.axisf ),
        .Q(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [9]));
LUT3 #(
    .INIT(8'h01)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_10 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [5]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [4]),
        .I2(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [3]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_10 ));
LUT3 #(
    .INIT(8'h02)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_11 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [0]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [2]),
        .I2(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [1]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_11 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF4)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_3 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [1]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [0]),
        .I2(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_5 ),
        .I3(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [7]),
        .I4(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [8]),
        .I5(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [9]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_3 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_5 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [2]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [1]),
        .I2(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [5]),
        .I3(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [6]),
        .I4(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [3]),
        .I5(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [4]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_5 ));
LUT2 #(
    .INIT(4'h1)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_8 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [9]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [10]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_8 ));
LUT3 #(
    .INIT(8'h01)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_9 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [8]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [7]),
        .I2(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [6]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_9 ));
FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .CLR(clear),
        .D(\n_82_gaxis_fifo.gaxisf.axisf ),
        .Q(O3));
CARRY4 \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4 
       (.CI(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6 ),
        .CO({\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4_CO_UNCONNECTED [3],p_13_in,\n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4 ,\n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4_O_UNCONNECTED [3:0]),
        .S({\<const0> ,\<const1> ,\<const1> ,\<const1> }));
CARRY4 \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6 
       (.CI(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7 ),
        .CO({\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6 ,\n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6 ,\n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6 ,\n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6_O_UNCONNECTED [3:0]),
        .S({\<const1> ,\<const1> ,\<const1> ,\<const1> }));
CARRY4 \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7 
       (.CI(\<const0> ),
        .CO({\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7 ,\n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7 ,\n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7 ,\n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7 }),
        .CYINIT(\<const1> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7_O_UNCONNECTED [3:0]),
        .S({\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_8 ,\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_9 ,\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_10 ,\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_11 }));
FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_wr_eop_d1_reg 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .CLR(clear),
        .D(axis_wr_eop),
        .Q(axis_wr_eop_d1));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_5 
       (.I0(Q[9]),
        .I1(Q[10]),
        .O(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_5 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_6 
       (.I0(Q[8]),
        .I1(Q[9]),
        .O(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_6 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_7 
       (.I0(Q[7]),
        .I1(Q[8]),
        .O(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_7 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_4 
       (.I0(Q[2]),
        .I1(Q[3]),
        .O(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_4 ));
LUT1 #(
    .INIT(2'h1)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_7 
       (.I0(Q[0]),
        .O(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_7 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_2 
       (.I0(Q[6]),
        .I1(Q[7]),
        .O(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_2 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_3 
       (.I0(Q[5]),
        .I1(Q[6]),
        .O(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_3 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_4 
       (.I0(Q[4]),
        .I1(Q[5]),
        .O(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_4 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_5 
       (.I0(Q[3]),
        .I1(Q[4]),
        .O(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_5 ));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[0] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(clear),
        .D(\n_24_gaxis_fifo.gaxisf.axisf ),
        .Q(Q[0]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(clear),
        .D(\n_14_gaxis_fifo.gaxisf.axisf ),
        .Q(Q[10]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[1] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(clear),
        .D(\n_23_gaxis_fifo.gaxisf.axisf ),
        .Q(Q[1]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[2] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(clear),
        .D(\n_22_gaxis_fifo.gaxisf.axisf ),
        .Q(Q[2]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(clear),
        .D(\n_21_gaxis_fifo.gaxisf.axisf ),
        .Q(Q[3]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[4] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(clear),
        .D(\n_20_gaxis_fifo.gaxisf.axisf ),
        .Q(Q[4]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[5] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(clear),
        .D(\n_19_gaxis_fifo.gaxisf.axisf ),
        .Q(Q[5]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[6] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(clear),
        .D(\n_18_gaxis_fifo.gaxisf.axisf ),
        .Q(Q[6]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(clear),
        .D(\n_17_gaxis_fifo.gaxisf.axisf ),
        .Q(Q[7]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[8] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(clear),
        .D(\n_16_gaxis_fifo.gaxisf.axisf ),
        .Q(Q[8]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[9] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(clear),
        .D(\n_15_gaxis_fifo.gaxisf.axisf ),
        .Q(Q[9]));
endmodule

module axis_data_fifo_32w_1024d_aclkmemory
   (Q,
    E,
    DI,
    O9,
    S,
    axis_wr_eop_d1,
    I1,
    CO,
    I8,
    I9,
    I2,
    axis_almost_full,
    I11,
    I3,
    s_axis_aclk,
    I4,
    ENB,
    I5,
    O6,
    I12,
    I6);
  output [52:0]Q;
  output [0:0]E;
  output [0:0]DI;
  output O9;
  output [0:0]S;
  input axis_wr_eop_d1;
  input I1;
  input [0:0]CO;
  input [1:0]I8;
  input I9;
  input I2;
  input axis_almost_full;
  input I11;
  input [1:0]I3;
  input s_axis_aclk;
  input I4;
  input ENB;
  input [9:0]I5;
  input [9:0]O6;
  input [52:0]I12;
  input [0:0]I6;

  wire \<const0> ;
  wire [0:0]CO;
  wire [0:0]DI;
  wire [0:0]E;
  wire ENB;
  wire I1;
  wire I11;
  wire [52:0]I12;
  wire I2;
  wire [1:0]I3;
  wire I4;
  wire [9:0]I5;
  wire [0:0]I6;
  wire [1:0]I8;
  wire I9;
  wire [9:0]O6;
  wire O9;
  wire [52:0]Q;
  wire [0:0]S;
  wire axis_almost_full;
  wire axis_wr_eop_d1;
  wire [52:0]doutb;
  wire p_14_out;
  wire s_axis_aclk;

GND GND
       (.G(\<const0> ));
LUT6 #(
    .INIT(64'hAAAAAAAA666AAAAA)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_1 
       (.I0(axis_wr_eop_d1),
        .I1(Q[0]),
        .I2(I8[0]),
        .I3(I8[1]),
        .I4(I9),
        .I5(I2),
        .O(E));
LUT6 #(
    .INIT(64'h0000A800FFFFFFFF)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_3 
       (.I0(Q[0]),
        .I1(I8[0]),
        .I2(I8[1]),
        .I3(I9),
        .I4(I2),
        .I5(axis_wr_eop_d1),
        .O(DI));
LUT4 #(
    .INIT(16'h708F)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_6 
       (.I0(Q[0]),
        .I1(I1),
        .I2(axis_wr_eop_d1),
        .I3(I3[0]),
        .O(S));
LUT6 #(
    .INIT(64'h5555555555555504)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_1 
       (.I0(p_14_out),
        .I1(axis_almost_full),
        .I2(I2),
        .I3(I11),
        .I4(I3[1]),
        .I5(I9),
        .O(O9));
LUT4 #(
    .INIT(16'h4000)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_2 
       (.I0(axis_wr_eop_d1),
        .I1(Q[0]),
        .I2(I1),
        .I3(CO),
        .O(p_14_out));
axis_data_fifo_32w_1024d_aclkblk_mem_gen_v8_1__parameterized0 \gbm.gbmg.gbmga.ngecc.bmg 
       (.DOUTB(doutb),
        .ENB(ENB),
        .I12(I12),
        .I4(I4),
        .I5(I5),
        .O6(O6),
        .s_axis_aclk(s_axis_aclk));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[0] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[0]),
        .Q(Q[0]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[10] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[10]),
        .Q(Q[10]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[11] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[11]),
        .Q(Q[11]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[12] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[12]),
        .Q(Q[12]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[13] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[13]),
        .Q(Q[13]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[14] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[14]),
        .Q(Q[14]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[15] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[15]),
        .Q(Q[15]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[16] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[16]),
        .Q(Q[16]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[17] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[17]),
        .Q(Q[17]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[18] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[18]),
        .Q(Q[18]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[19] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[19]),
        .Q(Q[19]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[1] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[1]),
        .Q(Q[1]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[20] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[20]),
        .Q(Q[20]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[21] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[21]),
        .Q(Q[21]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[22] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[22]),
        .Q(Q[22]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[23] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[23]),
        .Q(Q[23]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[24] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[24]),
        .Q(Q[24]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[25] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[25]),
        .Q(Q[25]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[26] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[26]),
        .Q(Q[26]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[27] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[27]),
        .Q(Q[27]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[28] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[28]),
        .Q(Q[28]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[29] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[29]),
        .Q(Q[29]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[2] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[2]),
        .Q(Q[2]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[30] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[30]),
        .Q(Q[30]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[31] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[31]),
        .Q(Q[31]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[32] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[32]),
        .Q(Q[32]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[33] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[33]),
        .Q(Q[33]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[34] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[34]),
        .Q(Q[34]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[35] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[35]),
        .Q(Q[35]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[36] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[36]),
        .Q(Q[36]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[37] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[37]),
        .Q(Q[37]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[38] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[38]),
        .Q(Q[38]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[39] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[39]),
        .Q(Q[39]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[3] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[3]),
        .Q(Q[3]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[40] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[40]),
        .Q(Q[40]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[41] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[41]),
        .Q(Q[41]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[42] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[42]),
        .Q(Q[42]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[43] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[43]),
        .Q(Q[43]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[44] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[44]),
        .Q(Q[44]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[45] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[45]),
        .Q(Q[45]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[46] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[46]),
        .Q(Q[46]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[47] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[47]),
        .Q(Q[47]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[48] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[48]),
        .Q(Q[48]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[49] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[49]),
        .Q(Q[49]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[4] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[4]),
        .Q(Q[4]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[50] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[50]),
        .Q(Q[50]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[51] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[51]),
        .Q(Q[51]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[52] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[52]),
        .Q(Q[52]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[5] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[5]),
        .Q(Q[5]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[6] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[6]),
        .Q(Q[6]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[7] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[7]),
        .Q(Q[7]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[8] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[8]),
        .Q(Q[8]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[9] 
       (.C(s_axis_aclk),
        .CE(I6),
        .D(doutb[9]),
        .Q(Q[9]),
        .R(\<const0> ));
endmodule

module axis_data_fifo_32w_1024d_aclkrd_bin_cntr
   (Q,
    O6,
    E,
    s_axis_aclk,
    I1);
  output [9:0]Q;
  output [9:0]O6;
  input [0:0]E;
  input s_axis_aclk;
  input [0:0]I1;

  wire [0:0]E;
  wire [0:0]I1;
  wire [9:0]O6;
  wire [9:0]Q;
  wire \n_0_gc0.count[9]_i_2 ;
  wire [9:0]plusOp;
  wire s_axis_aclk;

LUT1 #(
    .INIT(2'h1)) 
     \gc0.count[0]_i_1 
       (.I0(Q[0]),
        .O(plusOp[0]));
(* SOFT_HLUTNM = "soft_lutpair3" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \gc0.count[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(plusOp[1]));
(* SOFT_HLUTNM = "soft_lutpair3" *) 
   LUT3 #(
    .INIT(8'h78)) 
     \gc0.count[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(plusOp[2]));
(* SOFT_HLUTNM = "soft_lutpair0" *) 
   LUT4 #(
    .INIT(16'h7F80)) 
     \gc0.count[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(plusOp[3]));
(* SOFT_HLUTNM = "soft_lutpair0" *) 
   LUT5 #(
    .INIT(32'h7FFF8000)) 
     \gc0.count[4]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(plusOp[4]));
LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
     \gc0.count[5]_i_1 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[4]),
        .I5(Q[5]),
        .O(plusOp[5]));
(* SOFT_HLUTNM = "soft_lutpair2" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \gc0.count[6]_i_1 
       (.I0(\n_0_gc0.count[9]_i_2 ),
        .I1(Q[6]),
        .O(plusOp[6]));
(* SOFT_HLUTNM = "soft_lutpair2" *) 
   LUT3 #(
    .INIT(8'h78)) 
     \gc0.count[7]_i_1 
       (.I0(\n_0_gc0.count[9]_i_2 ),
        .I1(Q[6]),
        .I2(Q[7]),
        .O(plusOp[7]));
(* SOFT_HLUTNM = "soft_lutpair1" *) 
   LUT4 #(
    .INIT(16'h7F80)) 
     \gc0.count[8]_i_1 
       (.I0(Q[6]),
        .I1(\n_0_gc0.count[9]_i_2 ),
        .I2(Q[7]),
        .I3(Q[8]),
        .O(plusOp[8]));
(* SOFT_HLUTNM = "soft_lutpair1" *) 
   LUT5 #(
    .INIT(32'h7FFF8000)) 
     \gc0.count[9]_i_1 
       (.I0(Q[7]),
        .I1(\n_0_gc0.count[9]_i_2 ),
        .I2(Q[6]),
        .I3(Q[8]),
        .I4(Q[9]),
        .O(plusOp[9]));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     \gc0.count[9]_i_2 
       (.I0(Q[5]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(Q[4]),
        .O(\n_0_gc0.count[9]_i_2 ));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[0] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I1),
        .D(Q[0]),
        .Q(O6[0]));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[1] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I1),
        .D(Q[1]),
        .Q(O6[1]));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[2] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I1),
        .D(Q[2]),
        .Q(O6[2]));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[3] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I1),
        .D(Q[3]),
        .Q(O6[3]));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[4] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I1),
        .D(Q[4]),
        .Q(O6[4]));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[5] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I1),
        .D(Q[5]),
        .Q(O6[5]));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[6] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I1),
        .D(Q[6]),
        .Q(O6[6]));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[7] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I1),
        .D(Q[7]),
        .Q(O6[7]));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[8] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I1),
        .D(Q[8]),
        .Q(O6[8]));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[9] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I1),
        .D(Q[9]),
        .Q(O6[9]));
(* counter = "7" *) 
   FDPE #(
    .INIT(1'b1)) 
     \gc0.count_reg[0] 
       (.C(s_axis_aclk),
        .CE(E),
        .D(plusOp[0]),
        .PRE(I1),
        .Q(Q[0]));
(* counter = "7" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gc0.count_reg[1] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I1),
        .D(plusOp[1]),
        .Q(Q[1]));
(* counter = "7" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gc0.count_reg[2] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I1),
        .D(plusOp[2]),
        .Q(Q[2]));
(* counter = "7" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gc0.count_reg[3] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I1),
        .D(plusOp[3]),
        .Q(Q[3]));
(* counter = "7" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gc0.count_reg[4] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I1),
        .D(plusOp[4]),
        .Q(Q[4]));
(* counter = "7" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gc0.count_reg[5] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I1),
        .D(plusOp[5]),
        .Q(Q[5]));
(* counter = "7" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gc0.count_reg[6] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I1),
        .D(plusOp[6]),
        .Q(Q[6]));
(* counter = "7" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gc0.count_reg[7] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I1),
        .D(plusOp[7]),
        .Q(Q[7]));
(* counter = "7" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gc0.count_reg[8] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I1),
        .D(plusOp[8]),
        .Q(Q[8]));
(* counter = "7" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gc0.count_reg[9] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I1),
        .D(plusOp[9]),
        .Q(Q[9]));
endmodule

module axis_data_fifo_32w_1024d_aclkrd_fwft
   (O1,
    D,
    O2,
    p_13_out,
    O3,
    O7,
    O8,
    ENB,
    E,
    O5,
    O10,
    s_axis_aclk,
    Q,
    I2,
    DI,
    S,
    I3,
    I4,
    I1,
    I7,
    I5,
    axis_wr_eop_d1,
    I9,
    I8,
    I6,
    m_axis_aclken,
    m_axis_tready,
    I10);
  output O1;
  output [10:0]D;
  output O2;
  output p_13_out;
  output [0:0]O3;
  output O7;
  output O8;
  output ENB;
  output [0:0]E;
  output [0:0]O5;
  output O10;
  input s_axis_aclk;
  input [1:0]Q;
  input [7:0]I2;
  input [0:0]DI;
  input [2:0]S;
  input [3:0]I3;
  input [2:0]I4;
  input I1;
  input [1:0]I7;
  input I5;
  input axis_wr_eop_d1;
  input I9;
  input [3:0]I8;
  input [0:0]I6;
  input m_axis_aclken;
  input m_axis_tready;
  input [0:0]I10;

  wire \<const0> ;
  wire \<const1> ;
  wire [10:0]D;
  wire [0:0]DI;
  wire [0:0]E;
  wire ENB;
  wire I1;
  wire [0:0]I10;
  wire [7:0]I2;
  wire [3:0]I3;
  wire [2:0]I4;
  wire I5;
  wire [0:0]I6;
  wire [1:0]I7;
  wire [3:0]I8;
  wire I9;
  wire O1;
  wire O10;
  wire O2;
  wire [0:0]O3;
  wire [0:0]O5;
  wire O7;
  wire O8;
  wire [1:0]Q;
  wire [2:0]S;
  wire axis_wr_eop_d1;
  wire [0:0]curr_fwft_state;
  wire empty_fwft_fb;
  wire empty_fwft_i0;
  wire m_axis_aclken;
  wire m_axis_tready;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_2 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_5 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1 ;
  wire \n_0_gpregsm1.curr_fwft_state_reg[1] ;
  wire \n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1 ;
  wire \n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1 ;
  wire \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2 ;
  wire \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1 ;
  wire \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1 ;
  wire \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2 ;
  wire \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1 ;
  wire \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1 ;
  wire [1:0]next_fwft_state;
  wire p_13_out;
  wire s_axis_aclk;
  wire [3:2]\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2_O_UNCONNECTED ;

LUT2 #(
    .INIT(4'h2)) 
     \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_i_2 
       (.I0(p_13_out),
        .I1(I1),
        .O(ENB));
(* SOFT_HLUTNM = "soft_lutpair4" *) 
   LUT5 #(
    .INIT(32'h00000F40)) 
     \FSM_onehot_state[2]_i_2__0 
       (.I0(O1),
        .I1(I9),
        .I2(I8[0]),
        .I3(I8[1]),
        .I4(m_axis_aclken),
        .O(O7));
(* SOFT_HLUTNM = "soft_lutpair4" *) 
   LUT2 #(
    .INIT(4'h2)) 
     \FSM_onehot_state[3]_i_4 
       (.I0(I9),
        .I1(O1),
        .O(O10));
LUT6 #(
    .INIT(64'h000F0F0F00202020)) 
     \FSM_onehot_state[4]_i_2 
       (.I0(I9),
        .I1(O1),
        .I2(I8[2]),
        .I3(m_axis_tready),
        .I4(m_axis_aclken),
        .I5(I8[3]),
        .O(O8));
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
(* SOFT_HLUTNM = "soft_lutpair6" *) 
   LUT4 #(
    .INIT(16'hBA22)) 
     empty_fwft_fb_i_1
       (.I0(empty_fwft_fb),
        .I1(\n_0_gpregsm1.curr_fwft_state_reg[1] ),
        .I2(O2),
        .I3(curr_fwft_state),
        .O(empty_fwft_i0));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     empty_fwft_fb_reg
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(empty_fwft_i0),
        .PRE(Q[1]),
        .Q(empty_fwft_fb));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     empty_fwft_i_reg
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(empty_fwft_i0),
        .PRE(Q[1]),
        .Q(O1));
LUT6 #(
    .INIT(64'h8A8A8AAAAAAAAAAA)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_2 
       (.I0(axis_wr_eop_d1),
        .I1(O1),
        .I2(I9),
        .I3(I8[2]),
        .I4(I8[0]),
        .I5(I6),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_2 ));
LUT4 #(
    .INIT(16'h2AD5)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_5 
       (.I0(axis_wr_eop_d1),
        .I1(O2),
        .I2(I6),
        .I3(I2[1]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_5 ));
CARRY4 \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2 
       (.CI(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1 ),
        .CO({\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2_CO_UNCONNECTED [3:2],\n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2 ,\n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,I2[7:6]}),
        .O({\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2_O_UNCONNECTED [3],D[10:8]}),
        .S({\<const0> ,I4}));
CARRY4 \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1 
       (.CI(\<const0> ),
        .CO({\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1 ,\n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1 ,\n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1 ,\n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1 }),
        .CYINIT(\<const0> ),
        .DI({I2[1],\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_2 ,DI,I2[0]}),
        .O(D[3:0]),
        .S({S[2],\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_5 ,S[1:0]}));
CARRY4 \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1 
       (.CI(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1 ),
        .CO({\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1 ,\n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1 ,\n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1 ,\n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1 }),
        .CYINIT(\<const0> ),
        .DI(I2[5:2]),
        .O(D[7:4]),
        .S(I3));
LUT4 #(
    .INIT(16'h4440)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_4 
       (.I0(O1),
        .I1(I9),
        .I2(I8[2]),
        .I3(I8[0]),
        .O(O2));
LUT4 #(
    .INIT(16'hFFFE)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_3 
       (.I0(O2),
        .I1(I7[1]),
        .I2(I7[0]),
        .I3(I5),
        .O(O3));
LUT5 #(
    .INIT(32'h0001FFFE)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_6 
       (.I0(O2),
        .I1(I7[1]),
        .I2(I7[0]),
        .I3(I5),
        .I4(I10),
        .O(O5));
(* SOFT_HLUTNM = "soft_lutpair5" *) 
   LUT4 #(
    .INIT(16'h00BF)) 
     \gc0.count_d1[9]_i_1 
       (.I0(O2),
        .I1(curr_fwft_state),
        .I2(\n_0_gpregsm1.curr_fwft_state_reg[1] ),
        .I3(I1),
        .O(p_13_out));
LUT4 #(
    .INIT(16'h00B0)) 
     \goreg_bm.dout_i[52]_i_1 
       (.I0(O2),
        .I1(curr_fwft_state),
        .I2(\n_0_gpregsm1.curr_fwft_state_reg[1] ),
        .I3(Q[0]),
        .O(E));
(* SOFT_HLUTNM = "soft_lutpair6" *) 
   LUT3 #(
    .INIT(8'hBA)) 
     \gpregsm1.curr_fwft_state[0]_i_1 
       (.I0(\n_0_gpregsm1.curr_fwft_state_reg[1] ),
        .I1(O2),
        .I2(curr_fwft_state),
        .O(next_fwft_state[0]));
(* SOFT_HLUTNM = "soft_lutpair5" *) 
   LUT4 #(
    .INIT(16'h40FF)) 
     \gpregsm1.curr_fwft_state[1]_i_1 
       (.I0(O2),
        .I1(curr_fwft_state),
        .I2(\n_0_gpregsm1.curr_fwft_state_reg[1] ),
        .I3(I1),
        .O(next_fwft_state[1]));
(* equivalent_register_removal = "no" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gpregsm1.curr_fwft_state_reg[0] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .CLR(Q[1]),
        .D(next_fwft_state[0]),
        .Q(curr_fwft_state));
(* equivalent_register_removal = "no" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gpregsm1.curr_fwft_state_reg[1] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .CLR(Q[1]),
        .D(next_fwft_state[1]),
        .Q(\n_0_gpregsm1.curr_fwft_state_reg[1] ));
endmodule

module axis_data_fifo_32w_1024d_aclkrd_logic
   (comp0,
    comp1,
    p_17_out,
    O1,
    D,
    O2,
    p_13_out,
    O3,
    O7,
    O8,
    O4,
    ENB,
    E,
    O5,
    O10,
    O6,
    v1_reg,
    v1_reg_0,
    I1,
    s_axis_aclk,
    Q,
    I2,
    DI,
    S,
    I3,
    I4,
    I7,
    I5,
    axis_wr_eop_d1,
    I9,
    I8,
    I6,
    m_axis_aclken,
    m_axis_tready,
    I10);
  output comp0;
  output comp1;
  output p_17_out;
  output O1;
  output [10:0]D;
  output O2;
  output p_13_out;
  output [0:0]O3;
  output O7;
  output O8;
  output [9:0]O4;
  output ENB;
  output [0:0]E;
  output [0:0]O5;
  output O10;
  output [9:0]O6;
  input [4:0]v1_reg;
  input [4:0]v1_reg_0;
  input I1;
  input s_axis_aclk;
  input [1:0]Q;
  input [7:0]I2;
  input [0:0]DI;
  input [2:0]S;
  input [3:0]I3;
  input [2:0]I4;
  input [1:0]I7;
  input I5;
  input axis_wr_eop_d1;
  input I9;
  input [3:0]I8;
  input [0:0]I6;
  input m_axis_aclken;
  input m_axis_tready;
  input [0:0]I10;

  wire [10:0]D;
  wire [0:0]DI;
  wire [0:0]E;
  wire ENB;
  wire I1;
  wire [0:0]I10;
  wire [7:0]I2;
  wire [3:0]I3;
  wire [2:0]I4;
  wire I5;
  wire [0:0]I6;
  wire [1:0]I7;
  wire [3:0]I8;
  wire I9;
  wire O1;
  wire O10;
  wire O2;
  wire [0:0]O3;
  wire [9:0]O4;
  wire [0:0]O5;
  wire [9:0]O6;
  wire O7;
  wire O8;
  wire [1:0]Q;
  wire [2:0]S;
  wire axis_wr_eop_d1;
  wire comp0;
  wire comp1;
  wire m_axis_aclken;
  wire m_axis_tready;
  wire p_13_out;
  wire p_17_out;
  wire s_axis_aclk;
  wire [4:0]v1_reg;
  wire [4:0]v1_reg_0;

axis_data_fifo_32w_1024d_aclkrd_fwft \gr1.rfwft 
       (.D(D),
        .DI(DI),
        .E(E),
        .ENB(ENB),
        .I1(p_17_out),
        .I10(I10),
        .I2(I2),
        .I3(I3),
        .I4(I4),
        .I5(I5),
        .I6(I6),
        .I7(I7),
        .I8(I8),
        .I9(I9),
        .O1(O1),
        .O10(O10),
        .O2(O2),
        .O3(O3),
        .O5(O5),
        .O7(O7),
        .O8(O8),
        .Q(Q),
        .S(S),
        .axis_wr_eop_d1(axis_wr_eop_d1),
        .m_axis_aclken(m_axis_aclken),
        .m_axis_tready(m_axis_tready),
        .p_13_out(p_13_out),
        .s_axis_aclk(s_axis_aclk));
axis_data_fifo_32w_1024d_aclkrd_status_flags_ss \grss.rsts 
       (.I1(I1),
        .Q(Q[1]),
        .comp0(comp0),
        .comp1(comp1),
        .p_17_out(p_17_out),
        .s_axis_aclk(s_axis_aclk),
        .v1_reg(v1_reg),
        .v1_reg_0(v1_reg_0));
axis_data_fifo_32w_1024d_aclkrd_bin_cntr rpntr
       (.E(p_13_out),
        .I1(Q[1]),
        .O6(O6),
        .Q(O4),
        .s_axis_aclk(s_axis_aclk));
endmodule

module axis_data_fifo_32w_1024d_aclkrd_status_flags_ss
   (comp0,
    comp1,
    p_17_out,
    v1_reg,
    v1_reg_0,
    I1,
    s_axis_aclk,
    Q);
  output comp0;
  output comp1;
  output p_17_out;
  input [4:0]v1_reg;
  input [4:0]v1_reg_0;
  input I1;
  input s_axis_aclk;
  input [0:0]Q;

  wire \<const1> ;
  wire I1;
  wire [0:0]Q;
  wire comp0;
  wire comp1;
  wire p_17_out;
  wire s_axis_aclk;
  wire [4:0]v1_reg;
  wire [4:0]v1_reg_0;

VCC VCC
       (.P(\<const1> ));
axis_data_fifo_32w_1024d_aclkcompare_2 c1
       (.comp0(comp0),
        .v1_reg(v1_reg));
axis_data_fifo_32w_1024d_aclkcompare_3 c2
       (.comp1(comp1),
        .v1_reg_0(v1_reg_0));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     ram_empty_fb_i_reg
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(I1),
        .PRE(Q),
        .Q(p_17_out));
endmodule

module axis_data_fifo_32w_1024d_aclkreset_blk_ramfifo
   (rst_full_gen_i,
    O1,
    AR,
    rst_d2,
    Q,
    s_axis_aclk,
    I10);
  output rst_full_gen_i;
  output O1;
  output [0:0]AR;
  output rst_d2;
  output [1:0]Q;
  input s_axis_aclk;
  input I10;

  wire \<const0> ;
  wire \<const1> ;
  wire [0:0]AR;
  wire I10;
  wire O1;
  wire [1:0]Q;
  wire \n_0_ngwrdrst.grst.g7serrst.rd_rst_asreg_i_1 ;
  wire \n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1 ;
  wire \n_0_ngwrdrst.grst.g7serrst.wr_rst_asreg_i_1 ;
  wire \n_0_ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1 ;
  wire rd_rst_asreg;
  wire rd_rst_asreg_d1;
  wire rd_rst_asreg_d2;
  wire rst_d1;
  wire rst_d2;
  wire rst_d3;
  wire rst_full_gen_i;
  wire s_axis_aclk;
  wire wr_rst_asreg;
  wire wr_rst_asreg_d1;
  wire wr_rst_asreg_d2;

GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
LUT1 #(
    .INIT(2'h1)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_3 
       (.I0(I10),
        .O(O1));
FDCE #(
    .INIT(1'b0)) 
     \grstd1.grst_full.grst_f.RST_FULL_GEN_reg 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .CLR(O1),
        .D(rst_d3),
        .Q(rst_full_gen_i));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDPE #(
    .INIT(1'b1)) 
     \grstd1.grst_full.grst_f.rst_d1_reg 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(\<const0> ),
        .PRE(O1),
        .Q(rst_d1));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDPE #(
    .INIT(1'b1)) 
     \grstd1.grst_full.grst_f.rst_d2_reg 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(rst_d1),
        .PRE(O1),
        .Q(rst_d2));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDPE #(
    .INIT(1'b1)) 
     \grstd1.grst_full.grst_f.rst_d3_reg 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(rst_d2),
        .PRE(O1),
        .Q(rst_d3));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDRE #(
    .INIT(1'b0)) 
     \ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(rd_rst_asreg),
        .Q(rd_rst_asreg_d1),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDRE #(
    .INIT(1'b0)) 
     \ngwrdrst.grst.g7serrst.rd_rst_asreg_d2_reg 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(rd_rst_asreg_d1),
        .Q(rd_rst_asreg_d2),
        .R(\<const0> ));
LUT2 #(
    .INIT(4'h2)) 
     \ngwrdrst.grst.g7serrst.rd_rst_asreg_i_1 
       (.I0(rd_rst_asreg),
        .I1(rd_rst_asreg_d1),
        .O(\n_0_ngwrdrst.grst.g7serrst.rd_rst_asreg_i_1 ));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDPE \ngwrdrst.grst.g7serrst.rd_rst_asreg_reg 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(\n_0_ngwrdrst.grst.g7serrst.rd_rst_asreg_i_1 ),
        .PRE(O1),
        .Q(rd_rst_asreg));
LUT2 #(
    .INIT(4'h2)) 
     \ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1 
       (.I0(rd_rst_asreg),
        .I1(rd_rst_asreg_d2),
        .O(\n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1 ));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(\<const0> ),
        .PRE(\n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1 ),
        .Q(Q[0]));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(\<const0> ),
        .PRE(\n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1 ),
        .Q(Q[1]));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDRE #(
    .INIT(1'b0)) 
     \ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(wr_rst_asreg),
        .Q(wr_rst_asreg_d1),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDRE #(
    .INIT(1'b0)) 
     \ngwrdrst.grst.g7serrst.wr_rst_asreg_d2_reg 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(wr_rst_asreg_d1),
        .Q(wr_rst_asreg_d2),
        .R(\<const0> ));
LUT2 #(
    .INIT(4'h2)) 
     \ngwrdrst.grst.g7serrst.wr_rst_asreg_i_1 
       (.I0(wr_rst_asreg),
        .I1(wr_rst_asreg_d1),
        .O(\n_0_ngwrdrst.grst.g7serrst.wr_rst_asreg_i_1 ));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDPE \ngwrdrst.grst.g7serrst.wr_rst_asreg_reg 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(\n_0_ngwrdrst.grst.g7serrst.wr_rst_asreg_i_1 ),
        .PRE(O1),
        .Q(wr_rst_asreg));
LUT2 #(
    .INIT(4'h2)) 
     \ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1 
       (.I0(wr_rst_asreg),
        .I1(wr_rst_asreg_d2),
        .O(\n_0_ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1 ));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(\<const0> ),
        .PRE(\n_0_ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1 ),
        .Q(AR));
endmodule

module axis_data_fifo_32w_1024d_aclkwr_bin_cntr
   (p_2_out_0,
    ram_full_comb,
    O5,
    v1_reg,
    Q,
    v1_reg_0,
    v1_reg_1,
    v1_reg_2,
    v1_reg_3,
    p_0_in,
    axis_almost_full,
    comp1_4,
    p_13_out,
    E,
    rst_full_gen_i,
    p_2_out,
    comp0_5,
    comp0,
    p_17_out,
    comp1,
    O6,
    I2,
    s_axis_aclk,
    AR);
  output p_2_out_0;
  output ram_full_comb;
  output O5;
  output [4:0]v1_reg;
  output [9:0]Q;
  output [4:0]v1_reg_0;
  output [4:0]v1_reg_1;
  output [4:0]v1_reg_2;
  output [4:0]v1_reg_3;
  input p_0_in;
  input axis_almost_full;
  input comp1_4;
  input p_13_out;
  input [0:0]E;
  input rst_full_gen_i;
  input p_2_out;
  input comp0_5;
  input comp0;
  input p_17_out;
  input comp1;
  input [9:0]O6;
  input [9:0]I2;
  input s_axis_aclk;
  input [0:0]AR;

  wire [0:0]AR;
  wire [0:0]E;
  wire [9:0]I2;
  wire O5;
  wire [9:0]O6;
  wire [9:0]Q;
  wire axis_almost_full;
  wire comp0;
  wire comp0_5;
  wire comp1;
  wire comp1_4;
  wire \n_0_gcc0.gc1.count[9]_i_2 ;
  wire p_0_in;
  wire p_13_out;
  wire p_17_out;
  wire p_2_out;
  wire p_2_out_0;
  wire [9:0]plusOp__0;
  wire ram_full_comb;
  wire rst_full_gen_i;
  wire s_axis_aclk;
  wire [4:0]v1_reg;
  wire [4:0]v1_reg_0;
  wire [4:0]v1_reg_1;
  wire [4:0]v1_reg_2;
  wire [4:0]v1_reg_3;
  wire [9:0]wr_pntr_plus1;
  wire [9:0]wr_pntr_plus2;

LUT6 #(
    .INIT(64'h00AA0000CCEE0CCC)) 
     \gaf.gaf0.ram_afull_i_i_1 
       (.I0(p_0_in),
        .I1(axis_almost_full),
        .I2(comp1_4),
        .I3(p_13_out),
        .I4(E),
        .I5(rst_full_gen_i),
        .O(p_2_out_0));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair10" *) 
   LUT1 #(
    .INIT(2'h1)) 
     \gcc0.gc1.count[0]_i_1 
       (.I0(wr_pntr_plus2[0]),
        .O(plusOp__0[0]));
LUT2 #(
    .INIT(4'h6)) 
     \gcc0.gc1.count[1]_i_1 
       (.I0(wr_pntr_plus2[0]),
        .I1(wr_pntr_plus2[1]),
        .O(plusOp__0[1]));
(* SOFT_HLUTNM = "soft_lutpair10" *) 
   LUT3 #(
    .INIT(8'h78)) 
     \gcc0.gc1.count[2]_i_1 
       (.I0(wr_pntr_plus2[0]),
        .I1(wr_pntr_plus2[1]),
        .I2(wr_pntr_plus2[2]),
        .O(plusOp__0[2]));
(* SOFT_HLUTNM = "soft_lutpair8" *) 
   LUT4 #(
    .INIT(16'h7F80)) 
     \gcc0.gc1.count[3]_i_1 
       (.I0(wr_pntr_plus2[1]),
        .I1(wr_pntr_plus2[0]),
        .I2(wr_pntr_plus2[2]),
        .I3(wr_pntr_plus2[3]),
        .O(plusOp__0[3]));
(* SOFT_HLUTNM = "soft_lutpair8" *) 
   LUT5 #(
    .INIT(32'h7FFF8000)) 
     \gcc0.gc1.count[4]_i_1 
       (.I0(wr_pntr_plus2[2]),
        .I1(wr_pntr_plus2[0]),
        .I2(wr_pntr_plus2[1]),
        .I3(wr_pntr_plus2[3]),
        .I4(wr_pntr_plus2[4]),
        .O(plusOp__0[4]));
LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
     \gcc0.gc1.count[5]_i_1 
       (.I0(wr_pntr_plus2[3]),
        .I1(wr_pntr_plus2[1]),
        .I2(wr_pntr_plus2[0]),
        .I3(wr_pntr_plus2[2]),
        .I4(wr_pntr_plus2[4]),
        .I5(wr_pntr_plus2[5]),
        .O(plusOp__0[5]));
(* SOFT_HLUTNM = "soft_lutpair9" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \gcc0.gc1.count[6]_i_1 
       (.I0(\n_0_gcc0.gc1.count[9]_i_2 ),
        .I1(wr_pntr_plus2[6]),
        .O(plusOp__0[6]));
(* SOFT_HLUTNM = "soft_lutpair9" *) 
   LUT3 #(
    .INIT(8'h78)) 
     \gcc0.gc1.count[7]_i_1 
       (.I0(\n_0_gcc0.gc1.count[9]_i_2 ),
        .I1(wr_pntr_plus2[6]),
        .I2(wr_pntr_plus2[7]),
        .O(plusOp__0[7]));
(* SOFT_HLUTNM = "soft_lutpair7" *) 
   LUT4 #(
    .INIT(16'h7F80)) 
     \gcc0.gc1.count[8]_i_1 
       (.I0(wr_pntr_plus2[6]),
        .I1(\n_0_gcc0.gc1.count[9]_i_2 ),
        .I2(wr_pntr_plus2[7]),
        .I3(wr_pntr_plus2[8]),
        .O(plusOp__0[8]));
(* SOFT_HLUTNM = "soft_lutpair7" *) 
   LUT5 #(
    .INIT(32'h7FFF8000)) 
     \gcc0.gc1.count[9]_i_1 
       (.I0(wr_pntr_plus2[7]),
        .I1(\n_0_gcc0.gc1.count[9]_i_2 ),
        .I2(wr_pntr_plus2[6]),
        .I3(wr_pntr_plus2[8]),
        .I4(wr_pntr_plus2[9]),
        .O(plusOp__0[9]));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     \gcc0.gc1.count[9]_i_2 
       (.I0(wr_pntr_plus2[5]),
        .I1(wr_pntr_plus2[3]),
        .I2(wr_pntr_plus2[1]),
        .I3(wr_pntr_plus2[0]),
        .I4(wr_pntr_plus2[2]),
        .I5(wr_pntr_plus2[4]),
        .O(\n_0_gcc0.gc1.count[9]_i_2 ));
FDPE #(
    .INIT(1'b1)) 
     \gcc0.gc1.count_d1_reg[0] 
       (.C(s_axis_aclk),
        .CE(E),
        .D(wr_pntr_plus2[0]),
        .PRE(AR),
        .Q(wr_pntr_plus1[0]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_d1_reg[1] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus2[1]),
        .Q(wr_pntr_plus1[1]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_d1_reg[2] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus2[2]),
        .Q(wr_pntr_plus1[2]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_d1_reg[3] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus2[3]),
        .Q(wr_pntr_plus1[3]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_d1_reg[4] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus2[4]),
        .Q(wr_pntr_plus1[4]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_d1_reg[5] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus2[5]),
        .Q(wr_pntr_plus1[5]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_d1_reg[6] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus2[6]),
        .Q(wr_pntr_plus1[6]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_d1_reg[7] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus2[7]),
        .Q(wr_pntr_plus1[7]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_d1_reg[8] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus2[8]),
        .Q(wr_pntr_plus1[8]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_d1_reg[9] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus2[9]),
        .Q(wr_pntr_plus1[9]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_d2_reg[0] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus1[0]),
        .Q(Q[0]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_d2_reg[1] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus1[1]),
        .Q(Q[1]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_d2_reg[2] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus1[2]),
        .Q(Q[2]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_d2_reg[3] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus1[3]),
        .Q(Q[3]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_d2_reg[4] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus1[4]),
        .Q(Q[4]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_d2_reg[5] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus1[5]),
        .Q(Q[5]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_d2_reg[6] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus1[6]),
        .Q(Q[6]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_d2_reg[7] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus1[7]),
        .Q(Q[7]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_d2_reg[8] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus1[8]),
        .Q(Q[8]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_d2_reg[9] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus1[9]),
        .Q(Q[9]));
(* counter = "8" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_reg[0] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(plusOp__0[0]),
        .Q(wr_pntr_plus2[0]));
(* counter = "8" *) 
   FDPE #(
    .INIT(1'b1)) 
     \gcc0.gc1.count_reg[1] 
       (.C(s_axis_aclk),
        .CE(E),
        .D(plusOp__0[1]),
        .PRE(AR),
        .Q(wr_pntr_plus2[1]));
(* counter = "8" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_reg[2] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(plusOp__0[2]),
        .Q(wr_pntr_plus2[2]));
(* counter = "8" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_reg[3] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(plusOp__0[3]),
        .Q(wr_pntr_plus2[3]));
(* counter = "8" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_reg[4] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(plusOp__0[4]),
        .Q(wr_pntr_plus2[4]));
(* counter = "8" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_reg[5] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(plusOp__0[5]),
        .Q(wr_pntr_plus2[5]));
(* counter = "8" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_reg[6] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(plusOp__0[6]),
        .Q(wr_pntr_plus2[6]));
(* counter = "8" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_reg[7] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(plusOp__0[7]),
        .Q(wr_pntr_plus2[7]));
(* counter = "8" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_reg[8] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(plusOp__0[8]),
        .Q(wr_pntr_plus2[8]));
(* counter = "8" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.count_reg[9] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(AR),
        .D(plusOp__0[9]),
        .Q(wr_pntr_plus2[9]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[0].gm1.m1_i_1 
       (.I0(Q[0]),
        .I1(O6[0]),
        .I2(Q[1]),
        .I3(O6[1]),
        .O(v1_reg[0]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[0].gm1.m1_i_1__0 
       (.I0(Q[0]),
        .I1(I2[0]),
        .I2(Q[1]),
        .I3(I2[1]),
        .O(v1_reg_0[0]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[0].gm1.m1_i_1__1 
       (.I0(Q[0]),
        .I1(O6[0]),
        .I2(Q[1]),
        .I3(O6[1]),
        .O(v1_reg_1[0]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[0].gm1.m1_i_1__2 
       (.I0(wr_pntr_plus1[0]),
        .I1(O6[0]),
        .I2(wr_pntr_plus1[1]),
        .I3(O6[1]),
        .O(v1_reg_2[0]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[0].gm1.m1_i_1__3 
       (.I0(wr_pntr_plus2[0]),
        .I1(O6[0]),
        .I2(wr_pntr_plus2[1]),
        .I3(O6[1]),
        .O(v1_reg_3[0]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[1].gms.ms_i_1 
       (.I0(Q[2]),
        .I1(O6[2]),
        .I2(Q[3]),
        .I3(O6[3]),
        .O(v1_reg[1]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[1].gms.ms_i_1__0 
       (.I0(Q[2]),
        .I1(I2[2]),
        .I2(Q[3]),
        .I3(I2[3]),
        .O(v1_reg_0[1]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[1].gms.ms_i_1__1 
       (.I0(Q[2]),
        .I1(O6[2]),
        .I2(Q[3]),
        .I3(O6[3]),
        .O(v1_reg_1[1]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[1].gms.ms_i_1__2 
       (.I0(wr_pntr_plus1[2]),
        .I1(O6[2]),
        .I2(wr_pntr_plus1[3]),
        .I3(O6[3]),
        .O(v1_reg_2[1]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[1].gms.ms_i_1__3 
       (.I0(wr_pntr_plus2[2]),
        .I1(O6[2]),
        .I2(wr_pntr_plus2[3]),
        .I3(O6[3]),
        .O(v1_reg_3[1]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[2].gms.ms_i_1 
       (.I0(Q[4]),
        .I1(O6[4]),
        .I2(Q[5]),
        .I3(O6[5]),
        .O(v1_reg[2]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[2].gms.ms_i_1__0 
       (.I0(Q[4]),
        .I1(I2[4]),
        .I2(Q[5]),
        .I3(I2[5]),
        .O(v1_reg_0[2]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[2].gms.ms_i_1__1 
       (.I0(Q[4]),
        .I1(O6[4]),
        .I2(Q[5]),
        .I3(O6[5]),
        .O(v1_reg_1[2]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[2].gms.ms_i_1__2 
       (.I0(wr_pntr_plus1[4]),
        .I1(O6[4]),
        .I2(wr_pntr_plus1[5]),
        .I3(O6[5]),
        .O(v1_reg_2[2]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[2].gms.ms_i_1__3 
       (.I0(wr_pntr_plus2[4]),
        .I1(O6[4]),
        .I2(wr_pntr_plus2[5]),
        .I3(O6[5]),
        .O(v1_reg_3[2]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[3].gms.ms_i_1 
       (.I0(Q[6]),
        .I1(O6[6]),
        .I2(Q[7]),
        .I3(O6[7]),
        .O(v1_reg[3]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[3].gms.ms_i_1__0 
       (.I0(Q[6]),
        .I1(I2[6]),
        .I2(Q[7]),
        .I3(I2[7]),
        .O(v1_reg_0[3]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[3].gms.ms_i_1__1 
       (.I0(Q[6]),
        .I1(O6[6]),
        .I2(Q[7]),
        .I3(O6[7]),
        .O(v1_reg_1[3]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[3].gms.ms_i_1__2 
       (.I0(wr_pntr_plus1[6]),
        .I1(O6[6]),
        .I2(wr_pntr_plus1[7]),
        .I3(O6[7]),
        .O(v1_reg_2[3]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[3].gms.ms_i_1__3 
       (.I0(wr_pntr_plus2[6]),
        .I1(O6[6]),
        .I2(wr_pntr_plus2[7]),
        .I3(O6[7]),
        .O(v1_reg_3[3]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[4].gms.ms_i_1 
       (.I0(Q[8]),
        .I1(O6[8]),
        .I2(Q[9]),
        .I3(O6[9]),
        .O(v1_reg[4]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[4].gms.ms_i_1__0 
       (.I0(Q[8]),
        .I1(I2[8]),
        .I2(Q[9]),
        .I3(I2[9]),
        .O(v1_reg_0[4]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[4].gms.ms_i_1__1 
       (.I0(Q[8]),
        .I1(O6[8]),
        .I2(Q[9]),
        .I3(O6[9]),
        .O(v1_reg_1[4]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[4].gms.ms_i_1__2 
       (.I0(wr_pntr_plus1[8]),
        .I1(O6[8]),
        .I2(wr_pntr_plus1[9]),
        .I3(O6[9]),
        .O(v1_reg_2[4]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[4].gms.ms_i_1__3 
       (.I0(wr_pntr_plus2[8]),
        .I1(O6[8]),
        .I2(wr_pntr_plus2[9]),
        .I3(O6[9]),
        .O(v1_reg_3[4]));
LUT5 #(
    .INIT(32'h4444FCCC)) 
     ram_empty_fb_i_i_1
       (.I0(comp0),
        .I1(p_17_out),
        .I2(p_13_out),
        .I3(comp1),
        .I4(E),
        .O(O5));
LUT6 #(
    .INIT(64'h0088008800F8F0F8)) 
     ram_full_fb_i_i_1
       (.I0(comp1_4),
        .I1(E),
        .I2(p_2_out),
        .I3(p_13_out),
        .I4(comp0_5),
        .I5(rst_full_gen_i),
        .O(ram_full_comb));
endmodule

module axis_data_fifo_32w_1024d_aclkwr_logic
   (axis_almost_full,
    O1,
    O4,
    O2,
    O5,
    v1_reg,
    Q,
    v1_reg_0,
    s_axis_aclk,
    rst_d2,
    I3,
    O3,
    S,
    I5,
    I6,
    p_13_out,
    rst_full_gen_i,
    comp0,
    p_17_out,
    comp1,
    I7,
    I1,
    O6,
    I2,
    AR);
  output axis_almost_full;
  output O1;
  output [10:0]O4;
  output O2;
  output O5;
  output [4:0]v1_reg;
  output [9:0]Q;
  output [4:0]v1_reg_0;
  input s_axis_aclk;
  input rst_d2;
  input [7:0]I3;
  input [0:0]O3;
  input [2:0]S;
  input [3:0]I5;
  input [2:0]I6;
  input p_13_out;
  input rst_full_gen_i;
  input comp0;
  input p_17_out;
  input comp1;
  input [1:0]I7;
  input I1;
  input [9:0]O6;
  input [9:0]I2;
  input [0:0]AR;

  wire [0:0]AR;
  wire I1;
  wire [9:0]I2;
  wire [7:0]I3;
  wire [3:0]I5;
  wire [2:0]I6;
  wire [1:0]I7;
  wire O1;
  wire O2;
  wire [0:0]O3;
  wire [10:0]O4;
  wire O5;
  wire [9:0]O6;
  wire [9:0]Q;
  wire [2:0]S;
  wire axis_almost_full;
  wire [4:0]\c0/v1_reg ;
  wire [4:0]\c1/v1_reg ;
  wire comp0;
  wire comp0_2;
  wire comp1;
  wire comp1_1;
  wire [4:0]\gaf.c2/v1_reg ;
  wire p_0_in;
  wire p_13_out;
  wire p_17_out;
  wire p_2_out;
  wire p_2_out_0;
  wire ram_full_comb;
  wire rst_d2;
  wire rst_full_gen_i;
  wire s_axis_aclk;
  wire [4:0]v1_reg;
  wire [4:0]v1_reg_0;

axis_data_fifo_32w_1024d_aclkwr_status_flags_ss \gwss.wsts 
       (.I1(I1),
        .I3(I3),
        .I5(I5),
        .I6(I6),
        .I7(I7),
        .O1(O1),
        .O2(O2),
        .O3(O3),
        .O4(O4),
        .S(S),
        .axis_almost_full(axis_almost_full),
        .comp0(comp0_2),
        .comp1(comp1_1),
        .p_0_in(p_0_in),
        .p_2_out(p_2_out),
        .p_2_out_2(p_2_out_0),
        .ram_full_comb(ram_full_comb),
        .rst_d2(rst_d2),
        .s_axis_aclk(s_axis_aclk),
        .v1_reg(\c0/v1_reg ),
        .v1_reg_0(\c1/v1_reg ),
        .v1_reg_1(\gaf.c2/v1_reg ));
axis_data_fifo_32w_1024d_aclkwr_bin_cntr wpntr
       (.AR(AR),
        .E(O2),
        .I2(I2),
        .O5(O5),
        .O6(O6),
        .Q(Q),
        .axis_almost_full(axis_almost_full),
        .comp0(comp0),
        .comp0_5(comp0_2),
        .comp1(comp1),
        .comp1_4(comp1_1),
        .p_0_in(p_0_in),
        .p_13_out(p_13_out),
        .p_17_out(p_17_out),
        .p_2_out(p_2_out),
        .p_2_out_0(p_2_out_0),
        .ram_full_comb(ram_full_comb),
        .rst_full_gen_i(rst_full_gen_i),
        .s_axis_aclk(s_axis_aclk),
        .v1_reg(v1_reg),
        .v1_reg_0(v1_reg_0),
        .v1_reg_1(\c0/v1_reg ),
        .v1_reg_2(\c1/v1_reg ),
        .v1_reg_3(\gaf.c2/v1_reg ));
endmodule

module axis_data_fifo_32w_1024d_aclkwr_status_flags_ss
   (comp0,
    comp1,
    p_0_in,
    p_2_out,
    axis_almost_full,
    O1,
    O4,
    O2,
    v1_reg,
    v1_reg_0,
    v1_reg_1,
    ram_full_comb,
    s_axis_aclk,
    rst_d2,
    p_2_out_2,
    I3,
    O3,
    S,
    I5,
    I6,
    I7,
    I1);
  output comp0;
  output comp1;
  output p_0_in;
  output p_2_out;
  output axis_almost_full;
  output O1;
  output [10:0]O4;
  output O2;
  input [4:0]v1_reg;
  input [4:0]v1_reg_0;
  input [4:0]v1_reg_1;
  input ram_full_comb;
  input s_axis_aclk;
  input rst_d2;
  input p_2_out_2;
  input [7:0]I3;
  input [0:0]O3;
  input [2:0]S;
  input [3:0]I5;
  input [2:0]I6;
  input [1:0]I7;
  input I1;

  wire \<const0> ;
  wire \<const1> ;
  wire I1;
  wire [7:0]I3;
  wire [3:0]I5;
  wire [2:0]I6;
  wire [1:0]I7;
  wire O1;
  wire O2;
  wire [0:0]O3;
  wire [10:0]O4;
  wire [2:0]S;
  wire axis_almost_full;
  wire comp0;
  wire comp1;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_2 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_5 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1 ;
  wire \n_1_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1 ;
  wire \n_1_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1 ;
  wire \n_2_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2 ;
  wire \n_2_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1 ;
  wire \n_2_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1 ;
  wire \n_3_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2 ;
  wire \n_3_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1 ;
  wire \n_3_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1 ;
  wire p_0_in;
  wire p_2_out;
  wire p_2_out_2;
  wire ram_full_comb;
  wire rst_d2;
  wire s_axis_aclk;
  wire [4:0]v1_reg;
  wire [4:0]v1_reg_0;
  wire [4:0]v1_reg_1;
  wire [3:2]\NLW_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2_O_UNCONNECTED ;

LUT4 #(
    .INIT(16'h0001)) 
     \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_i_1 
       (.I0(O1),
        .I1(I7[0]),
        .I2(I7[1]),
        .I3(p_2_out),
        .O(O2));
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
axis_data_fifo_32w_1024d_aclkcompare c0
       (.comp0(comp0),
        .v1_reg(v1_reg));
axis_data_fifo_32w_1024d_aclkcompare_0 c1
       (.comp1(comp1),
        .v1_reg_0(v1_reg_0));
axis_data_fifo_32w_1024d_aclkcompare_1 \gaf.c2 
       (.p_0_in(p_0_in),
        .v1_reg_1(v1_reg_1));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     \gaf.gaf0.ram_afull_i_reg 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(p_2_out_2),
        .PRE(rst_d2),
        .Q(axis_almost_full));
LUT4 #(
    .INIT(16'h0001)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_2 
       (.I0(O1),
        .I1(I7[0]),
        .I2(I7[1]),
        .I3(I1),
        .O(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_2 ));
LUT5 #(
    .INIT(32'h0001FFFE)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_5 
       (.I0(O1),
        .I1(I7[0]),
        .I2(I7[1]),
        .I3(I1),
        .I4(I3[1]),
        .O(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_5 ));
CARRY4 \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2 
       (.CI(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1 ),
        .CO({\NLW_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2_CO_UNCONNECTED [3:2],\n_2_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2 ,\n_3_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,I3[7:6]}),
        .O({\NLW_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2_O_UNCONNECTED [3],O4[10:8]}),
        .S({\<const0> ,I6}));
CARRY4 \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1 
       (.CI(\<const0> ),
        .CO({\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1 ,\n_1_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1 ,\n_2_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1 ,\n_3_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1 }),
        .CYINIT(\<const0> ),
        .DI({I3[1],\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_2 ,O3,I3[0]}),
        .O(O4[3:0]),
        .S({S[2],\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_5 ,S[1:0]}));
CARRY4 \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1 
       (.CI(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1 ),
        .CO({\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1 ,\n_1_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1 ,\n_2_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1 ,\n_3_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1 }),
        .CYINIT(\<const0> ),
        .DI(I3[5:2]),
        .O(O4[7:4]),
        .S(I5));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     ram_full_fb_i_reg
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(ram_full_comb),
        .PRE(rst_d2),
        .Q(p_2_out));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     ram_full_i_reg
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(ram_full_comb),
        .PRE(rst_d2),
        .Q(O1));
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
