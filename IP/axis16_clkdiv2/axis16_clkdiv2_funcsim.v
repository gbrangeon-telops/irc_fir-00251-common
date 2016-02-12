// Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2013.4 (win64) Build 353583 Mon Dec  9 17:49:19 MST 2013
// Date        : Fri Dec 12 12:27:12 2014
// Host        : TELOPS210 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim d:/Telops/fir-00251-Common/IP/axis16_clkdiv2/axis16_clkdiv2_funcsim.v
// Design      : axis16_clkdiv2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* X_CORE_INFO = "axis_clock_converter_v1_1_axis_clock_converter,Vivado 2013.4" *) (* CHECK_LICENSE_TYPE = "axis16_clkdiv2,axis_clock_converter_v1_1_axis_clock_converter,{}" *) (* CORE_GENERATION_INFO = "axis16_clkdiv2,axis_clock_converter_v1_1_axis_clock_converter,{x_ipProduct=Vivado 2013.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=axis_clock_converter,x_ipVersion=1.1,x_ipCoreRevision=1,x_ipLanguage=VHDL,C_FAMILY=kintex7,C_AXIS_TDATA_WIDTH=16,C_AXIS_TID_WIDTH=1,C_AXIS_TDEST_WIDTH=3,C_AXIS_TUSER_WIDTH=4,C_AXIS_SIGNAL_SET=0b11111111,C_IS_ACLK_ASYNC=0,C_SYNCHRONIZER_STAGE=2,C_S_AXIS_ACLK_RATIO=2,C_M_AXIS_ACLK_RATIO=1,C_ACLKEN_CONV_MODE=0}" *) 
(* DowngradeIPIdentifiedWarnings = "yes" *) 
(* NotValidForBitStream *)
module axis16_clkdiv2
   (s_axis_aresetn,
    m_axis_aresetn,
    s_axis_aclk,
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
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser);
  input s_axis_aresetn;
  input m_axis_aresetn;
  input s_axis_aclk;
  input s_axis_tvalid;
  output s_axis_tready;
  input [15:0]s_axis_tdata;
  input [1:0]s_axis_tstrb;
  input [1:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [2:0]s_axis_tdest;
  input [3:0]s_axis_tuser;
  input m_axis_aclk;
  output m_axis_tvalid;
  input m_axis_tready;
  output [15:0]m_axis_tdata;
  output [1:0]m_axis_tstrb;
  output [1:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [2:0]m_axis_tdest;
  output [3:0]m_axis_tuser;

  wire \<const1> ;
  wire m_axis_aclk;
  wire m_axis_aresetn;
  wire [15:0]m_axis_tdata;
  wire [2:0]m_axis_tdest;
  wire [0:0]m_axis_tid;
  wire [1:0]m_axis_tkeep;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire [1:0]m_axis_tstrb;
  wire [3:0]m_axis_tuser;
  wire m_axis_tvalid;
  wire s_axis_aclk;
  wire s_axis_aresetn;
  wire [15:0]s_axis_tdata;
  wire [2:0]s_axis_tdest;
  wire [0:0]s_axis_tid;
  wire [1:0]s_axis_tkeep;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire [1:0]s_axis_tstrb;
  wire [3:0]s_axis_tuser;
  wire s_axis_tvalid;

VCC VCC
       (.P(\<const1> ));
(* C_ACLKEN_CONV_MODE = "0" *) 
   (* C_AXIS_SIGNAL_SET = "32'b00000000000000000000000011111111" *) 
   (* C_AXIS_TDATA_WIDTH = "16" *) 
   (* C_AXIS_TDEST_WIDTH = "3" *) 
   (* C_AXIS_TID_WIDTH = "1" *) 
   (* C_AXIS_TUSER_WIDTH = "4" *) 
   (* C_FAMILY = "kintex7" *) 
   (* C_IS_ACLK_ASYNC = "0" *) 
   (* C_M_AXIS_ACLK_RATIO = "1" *) 
   (* C_SYNCHRONIZER_STAGE = "2" *) 
   (* C_S_AXIS_ACLK_RATIO = "2" *) 
   (* DowngradeIPIdentifiedWarnings = "yes" *) 
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
   (* LP_M_ACLKEN_CAN_TOGGLE = "0" *) 
   (* LP_S_ACLKEN_CAN_TOGGLE = "0" *) 
   (* P_FIFO_DEPTH = "32" *) 
   (* P_FIFO_MODE = "1" *) 
   (* P_INST_FIFO_GEN = "0" *) 
   (* P_M_AXIS_ACLK_RATIO = "1" *) 
   (* P_SAMPLE_CYCLE_RATIO = "2" *) 
   (* P_S_AXIS_ACLK_RATIO = "2" *) 
   (* P_TPAYLOAD_WIDTH = "29" *) 
   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) 
   axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter inst
       (.m_axis_aclk(m_axis_aclk),
        .m_axis_aclken(\<const1> ),
        .m_axis_aresetn(m_axis_aresetn),
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
        .s_axis_aclken(\<const1> ),
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

(* DowngradeIPIdentifiedWarnings = "yes" *) (* C_FAMILY = "kintex7" *) (* C_AXIS_TDATA_WIDTH = "16" *) 
(* C_AXIS_TID_WIDTH = "1" *) (* C_AXIS_TDEST_WIDTH = "3" *) (* C_AXIS_TUSER_WIDTH = "4" *) 
(* C_AXIS_SIGNAL_SET = "32'b00000000000000000000000011111111" *) (* C_IS_ACLK_ASYNC = "0" *) (* C_SYNCHRONIZER_STAGE = "2" *) 
(* C_S_AXIS_ACLK_RATIO = "2" *) (* C_M_AXIS_ACLK_RATIO = "1" *) (* C_ACLKEN_CONV_MODE = "0" *) 
(* G_INDX_SS_TREADY = "0" *) (* G_INDX_SS_TDATA = "1" *) (* G_INDX_SS_TSTRB = "2" *) 
(* G_INDX_SS_TKEEP = "3" *) (* G_INDX_SS_TLAST = "4" *) (* G_INDX_SS_TID = "5" *) 
(* G_INDX_SS_TDEST = "6" *) (* G_INDX_SS_TUSER = "7" *) (* G_MASK_SS_TREADY = "1" *) 
(* G_MASK_SS_TDATA = "2" *) (* G_MASK_SS_TSTRB = "4" *) (* G_MASK_SS_TKEEP = "8" *) 
(* G_MASK_SS_TLAST = "16" *) (* G_MASK_SS_TID = "32" *) (* G_MASK_SS_TDEST = "64" *) 
(* G_MASK_SS_TUSER = "128" *) (* G_TASK_SEVERITY_ERR = "2" *) (* G_TASK_SEVERITY_WARNING = "1" *) 
(* G_TASK_SEVERITY_INFO = "0" *) (* LP_S_ACLKEN_CAN_TOGGLE = "0" *) (* LP_M_ACLKEN_CAN_TOGGLE = "0" *) 
(* P_FIFO_MODE = "1" *) (* P_FIFO_DEPTH = "32" *) (* P_S_AXIS_ACLK_RATIO = "2" *) 
(* P_M_AXIS_ACLK_RATIO = "1" *) (* P_INST_FIFO_GEN = "0" *) (* P_TPAYLOAD_WIDTH = "29" *) 
(* P_SAMPLE_CYCLE_RATIO = "2" *) 
module axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter
   (s_axis_aresetn,
    m_axis_aresetn,
    s_axis_aclken,
    m_axis_aclken,
    s_axis_aclk,
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
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser);
  input s_axis_aresetn;
  input m_axis_aresetn;
  input s_axis_aclken;
  input m_axis_aclken;
  input s_axis_aclk;
  input s_axis_tvalid;
  output s_axis_tready;
  input [15:0]s_axis_tdata;
  input [1:0]s_axis_tstrb;
  input [1:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [2:0]s_axis_tdest;
  input [3:0]s_axis_tuser;
  input m_axis_aclk;
  output m_axis_tvalid;
  input m_axis_tready;
  output [15:0]m_axis_tdata;
  output [1:0]m_axis_tstrb;
  output [1:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [2:0]m_axis_tdest;
  output [3:0]m_axis_tuser;

  wire m_axis_aclk;
  wire m_axis_aresetn;
  wire [15:0]m_axis_tdata;
  wire [2:0]m_axis_tdest;
  wire [0:0]m_axis_tid;
  wire [1:0]m_axis_tkeep;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire [1:0]m_axis_tstrb;
  wire [3:0]m_axis_tuser;
  wire m_axis_tvalid;
  wire \n_0_gen_sync_ck_conv.axisc_sample_cycle_ratio_m ;
  wire s_areset_r;
  wire s_axis_aclk;
  wire s_axis_aresetn;
  wire [15:0]s_axis_tdata;
  wire [2:0]s_axis_tdest;
  wire [0:0]s_axis_tid;
  wire [1:0]s_axis_tkeep;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire [1:0]s_axis_tstrb;
  wire [3:0]s_axis_tuser;
  wire s_axis_tvalid;
  wire s_ready_ns;

axis16_clkdiv2axis_clock_converter_v1_1_axisc_sample_cycle_ratio \gen_sync_ck_conv.axisc_sample_cycle_ratio_m 
       (.O1(\n_0_gen_sync_ck_conv.axisc_sample_cycle_ratio_m ),
        .Q(s_ready_ns),
        .m_axis_aclk(m_axis_aclk),
        .s_areset_r(s_areset_r),
        .s_axis_aclk(s_axis_aclk));
axis16_clkdiv2axis_clock_converter_v1_1_axisc_sync_clock_converter \gen_sync_ck_conv.axisc_sync_clock_converter_0 
       (.D({s_axis_tuser,s_axis_tdest,s_axis_tid,s_axis_tlast,s_axis_tkeep,s_axis_tstrb,s_axis_tdata}),
        .I1(\n_0_gen_sync_ck_conv.axisc_sample_cycle_ratio_m ),
        .O1({m_axis_tuser,m_axis_tdest,m_axis_tid,m_axis_tlast,m_axis_tkeep,m_axis_tstrb,m_axis_tdata}),
        .Q(s_ready_ns),
        .m_axis_aclk(m_axis_aclk),
        .m_axis_aresetn(m_axis_aresetn),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_areset_r(s_areset_r),
        .s_axis_aclk(s_axis_aclk),
        .s_axis_aresetn(s_axis_aresetn),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

module axis16_clkdiv2axis_clock_converter_v1_1_axisc_sample_cycle_ratio
   (O1,
    m_axis_aclk,
    s_axis_aclk,
    s_areset_r,
    Q);
  output O1;
  input m_axis_aclk;
  input s_axis_aclk;
  input s_areset_r;
  input [0:0]Q;

  wire \<const0> ;
  wire \<const1> ;
  wire O1;
  wire [0:0]Q;
  wire m_axis_aclk;
  wire posedge_finder_first;
  wire posedge_finder_second;
  wire s_areset_r;
  wire s_axis_aclk;
  wire slow_aclk_div2;
  wire slow_aclk_div20;

GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
FDRE \gen_sample_cycle.posedge_finder_first_reg 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(slow_aclk_div2),
        .Q(posedge_finder_first),
        .R(\<const0> ));
FDRE \gen_sample_cycle.posedge_finder_second_reg 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(slow_aclk_div20),
        .Q(posedge_finder_second),
        .R(\<const0> ));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair0" *) 
   LUT1 #(
    .INIT(2'h1)) 
     \gen_sample_cycle.slow_aclk_div2_i_1 
       (.I0(slow_aclk_div2),
        .O(slow_aclk_div20));
FDRE \gen_sample_cycle.slow_aclk_div2_reg 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .D(slow_aclk_div20),
        .Q(slow_aclk_div2),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair0" *) 
   LUT5 #(
    .INIT(32'h00044404)) 
     \gen_sync_clock_converter.s_ready_r_i_1 
       (.I0(s_areset_r),
        .I1(Q),
        .I2(posedge_finder_second),
        .I3(slow_aclk_div2),
        .I4(posedge_finder_first),
        .O(O1));
endmodule

module axis16_clkdiv2axis_clock_converter_v1_1_axisc_sync_clock_converter
   (s_areset_r,
    s_axis_tready,
    m_axis_tvalid,
    Q,
    O1,
    s_axis_aclk,
    m_axis_aclk,
    I1,
    s_axis_aresetn,
    m_axis_aresetn,
    m_axis_tready,
    s_axis_tvalid,
    D);
  output s_areset_r;
  output s_axis_tready;
  output m_axis_tvalid;
  output [0:0]Q;
  output [28:0]O1;
  input s_axis_aclk;
  input m_axis_aclk;
  input I1;
  input s_axis_aresetn;
  input m_axis_aresetn;
  input m_axis_tready;
  input s_axis_tvalid;
  input [28:0]D;

  wire \<const0> ;
  wire \<const1> ;
  wire [28:0]D;
  wire I1;
  wire [28:0]O1;
  wire [0:0]Q;
  wire load_payload;
  wire load_storage;
  wire m_areset_r;
  wire m_axis_aclk;
  wire m_axis_aresetn;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire [28:0]m_storage_r;
  wire \n_0_gen_sync_clock_converter.m_valid_r_i_1 ;
  wire \n_0_gen_sync_clock_converter.s_areset_r_i_1 ;
  wire \n_0_gen_sync_clock_converter.state[0]_i_1 ;
  wire \n_0_gen_sync_clock_converter.state[1]_i_1 ;
  wire [28:0]p_0_in;
  wire s_areset_r;
  wire s_axis_aclk;
  wire s_axis_aresetn;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire [0:0]state;

GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
FDRE \gen_sync_clock_converter.m_areset_r_reg 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .D(\n_0_gen_sync_clock_converter.s_areset_r_i_1 ),
        .Q(m_areset_r),
        .R(\<const0> ));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[0]_i_1 
       (.I0(m_storage_r[0]),
        .I1(D[0]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[0]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[10]_i_1 
       (.I0(m_storage_r[10]),
        .I1(D[10]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[10]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[11]_i_1 
       (.I0(m_storage_r[11]),
        .I1(D[11]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[11]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[12]_i_1 
       (.I0(m_storage_r[12]),
        .I1(D[12]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[12]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[13]_i_1 
       (.I0(m_storage_r[13]),
        .I1(D[13]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[13]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[14]_i_1 
       (.I0(m_storage_r[14]),
        .I1(D[14]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[14]));
LUT3 #(
    .INIT(8'hBA)) 
     \gen_sync_clock_converter.m_payload_r[15]_i_1 
       (.I0(m_axis_tready),
        .I1(state),
        .I2(Q),
        .O(load_payload));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[15]_i_2 
       (.I0(m_storage_r[15]),
        .I1(D[15]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[15]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[16]_i_1 
       (.I0(m_storage_r[16]),
        .I1(D[16]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[16]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[17]_i_1 
       (.I0(m_storage_r[17]),
        .I1(D[17]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[17]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[18]_i_1 
       (.I0(m_storage_r[18]),
        .I1(D[18]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[18]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[19]_i_1 
       (.I0(m_storage_r[19]),
        .I1(D[19]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[19]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[1]_i_1 
       (.I0(m_storage_r[1]),
        .I1(D[1]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[1]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[20]_i_1 
       (.I0(m_storage_r[20]),
        .I1(D[20]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[20]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[21]_i_1 
       (.I0(m_storage_r[21]),
        .I1(D[21]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[21]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[22]_i_1 
       (.I0(m_storage_r[22]),
        .I1(D[22]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[22]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[23]_i_1 
       (.I0(m_storage_r[23]),
        .I1(D[23]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[23]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[24]_i_1 
       (.I0(m_storage_r[24]),
        .I1(D[24]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[24]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[25]_i_1 
       (.I0(m_storage_r[25]),
        .I1(D[25]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[25]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[26]_i_1 
       (.I0(m_storage_r[26]),
        .I1(D[26]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[26]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[27]_i_1 
       (.I0(m_storage_r[27]),
        .I1(D[27]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[27]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[28]_i_1 
       (.I0(m_storage_r[28]),
        .I1(D[28]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[28]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[2]_i_1 
       (.I0(m_storage_r[2]),
        .I1(D[2]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[2]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[3]_i_1 
       (.I0(m_storage_r[3]),
        .I1(D[3]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[3]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[4]_i_1 
       (.I0(m_storage_r[4]),
        .I1(D[4]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[4]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[5]_i_1 
       (.I0(m_storage_r[5]),
        .I1(D[5]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[5]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[6]_i_1 
       (.I0(m_storage_r[6]),
        .I1(D[6]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[6]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[7]_i_1 
       (.I0(m_storage_r[7]),
        .I1(D[7]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[7]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[8]_i_1 
       (.I0(m_storage_r[8]),
        .I1(D[8]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[8]));
LUT5 #(
    .INIT(32'hCACCCCCC)) 
     \gen_sync_clock_converter.m_payload_r[9]_i_1 
       (.I0(m_storage_r[9]),
        .I1(D[9]),
        .I2(Q),
        .I3(state),
        .I4(m_axis_tready),
        .O(p_0_in[9]));
FDRE \gen_sync_clock_converter.m_payload_r_reg[0] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[0]),
        .Q(O1[0]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[10] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[10]),
        .Q(O1[10]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[11] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[11]),
        .Q(O1[11]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[12] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[12]),
        .Q(O1[12]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[13] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[13]),
        .Q(O1[13]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[14] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[14]),
        .Q(O1[14]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[15] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[15]),
        .Q(O1[15]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[16] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[16]),
        .Q(O1[16]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[17] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[17]),
        .Q(O1[17]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[18] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[18]),
        .Q(O1[18]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[19] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[19]),
        .Q(O1[19]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[1] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[1]),
        .Q(O1[1]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[20] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[20]),
        .Q(O1[20]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[21] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[21]),
        .Q(O1[21]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[22] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[22]),
        .Q(O1[22]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[23] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[23]),
        .Q(O1[23]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[24] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[24]),
        .Q(O1[24]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[25] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[25]),
        .Q(O1[25]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[26] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[26]),
        .Q(O1[26]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[27] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[27]),
        .Q(O1[27]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[28] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[28]),
        .Q(O1[28]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[2] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[2]),
        .Q(O1[2]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[3] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[3]),
        .Q(O1[3]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[4] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[4]),
        .Q(O1[4]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[5] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[5]),
        .Q(O1[5]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[6] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[6]),
        .Q(O1[6]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[7] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[7]),
        .Q(O1[7]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[8] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[8]),
        .Q(O1[8]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_payload_r_reg[9] 
       (.C(m_axis_aclk),
        .CE(load_payload),
        .D(p_0_in[9]),
        .Q(O1[9]),
        .R(\<const0> ));
LUT2 #(
    .INIT(4'hB)) 
     \gen_sync_clock_converter.m_storage_r[28]_i_1 
       (.I0(Q),
        .I1(state),
        .O(load_storage));
FDRE \gen_sync_clock_converter.m_storage_r_reg[0] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[0]),
        .Q(m_storage_r[0]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[10] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[10]),
        .Q(m_storage_r[10]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[11] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[11]),
        .Q(m_storage_r[11]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[12] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[12]),
        .Q(m_storage_r[12]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[13] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[13]),
        .Q(m_storage_r[13]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[14] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[14]),
        .Q(m_storage_r[14]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[15] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[15]),
        .Q(m_storage_r[15]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[16] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[16]),
        .Q(m_storage_r[16]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[17] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[17]),
        .Q(m_storage_r[17]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[18] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[18]),
        .Q(m_storage_r[18]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[19] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[19]),
        .Q(m_storage_r[19]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[1] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[1]),
        .Q(m_storage_r[1]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[20] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[20]),
        .Q(m_storage_r[20]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[21] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[21]),
        .Q(m_storage_r[21]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[22] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[22]),
        .Q(m_storage_r[22]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[23] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[23]),
        .Q(m_storage_r[23]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[24] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[24]),
        .Q(m_storage_r[24]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[25] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[25]),
        .Q(m_storage_r[25]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[26] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[26]),
        .Q(m_storage_r[26]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[27] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[27]),
        .Q(m_storage_r[27]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[28] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[28]),
        .Q(m_storage_r[28]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[2] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[2]),
        .Q(m_storage_r[2]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[3] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[3]),
        .Q(m_storage_r[3]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[4] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[4]),
        .Q(m_storage_r[4]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[5] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[5]),
        .Q(m_storage_r[5]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[6] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[6]),
        .Q(m_storage_r[6]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[7] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[7]),
        .Q(m_storage_r[7]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[8] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[8]),
        .Q(m_storage_r[8]),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.m_storage_r_reg[9] 
       (.C(m_axis_aclk),
        .CE(load_storage),
        .D(D[9]),
        .Q(m_storage_r[9]),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair1" *) 
   LUT5 #(
    .INIT(32'h0000FC4C)) 
     \gen_sync_clock_converter.m_valid_r_i_1 
       (.I0(m_axis_tready),
        .I1(state),
        .I2(Q),
        .I3(s_axis_tvalid),
        .I4(m_areset_r),
        .O(\n_0_gen_sync_clock_converter.m_valid_r_i_1 ));
FDRE \gen_sync_clock_converter.m_valid_r_reg 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .D(\n_0_gen_sync_clock_converter.m_valid_r_i_1 ),
        .Q(m_axis_tvalid),
        .R(\<const0> ));
LUT2 #(
    .INIT(4'h7)) 
     \gen_sync_clock_converter.s_areset_r_i_1 
       (.I0(s_axis_aresetn),
        .I1(m_axis_aresetn),
        .O(\n_0_gen_sync_clock_converter.s_areset_r_i_1 ));
FDRE \gen_sync_clock_converter.s_areset_r_reg 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(\n_0_gen_sync_clock_converter.s_areset_r_i_1 ),
        .Q(s_areset_r),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.s_ready_r_reg 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(I1),
        .Q(s_axis_tready),
        .R(\<const0> ));
(* SOFT_HLUTNM = "soft_lutpair1" *) 
   LUT5 #(
    .INIT(32'h0000B8F8)) 
     \gen_sync_clock_converter.state[0]_i_1 
       (.I0(s_axis_tvalid),
        .I1(Q),
        .I2(state),
        .I3(m_axis_tready),
        .I4(m_areset_r),
        .O(\n_0_gen_sync_clock_converter.state[0]_i_1 ));
LUT5 #(
    .INIT(32'h0000F4FF)) 
     \gen_sync_clock_converter.state[1]_i_1 
       (.I0(s_axis_tvalid),
        .I1(Q),
        .I2(m_axis_tready),
        .I3(state),
        .I4(m_areset_r),
        .O(\n_0_gen_sync_clock_converter.state[1]_i_1 ));
FDRE \gen_sync_clock_converter.state_reg[0] 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .D(\n_0_gen_sync_clock_converter.state[0]_i_1 ),
        .Q(state),
        .R(\<const0> ));
FDRE \gen_sync_clock_converter.state_reg[1] 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .D(\n_0_gen_sync_clock_converter.state[1]_i_1 ),
        .Q(Q),
        .R(\<const0> ));
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
