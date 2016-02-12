// Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2013.4 (win64) Build 353583 Mon Dec  9 17:49:19 MST 2013
// Date        : Fri Dec 12 12:25:23 2014
// Host        : TELOPS210 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               d:/Telops/fir-00251-Common/IP/axis_32_to_16_lite/axis_32_to_16_lite_funcsim.v
// Design      : axis_32_to_16_lite
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* X_CORE_INFO = "axis_dwidth_converter_v1_1_axis_dwidth_converter,Vivado 2013.4" *) (* CHECK_LICENSE_TYPE = "axis_32_to_16_lite,axis_dwidth_converter_v1_1_axis_dwidth_converter,{}" *) (* CORE_GENERATION_INFO = "axis_32_to_16_lite,axis_dwidth_converter_v1_1_axis_dwidth_converter,{x_ipProduct=Vivado 2013.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=axis_dwidth_converter,x_ipVersion=1.1,x_ipCoreRevision=1,x_ipLanguage=VHDL,C_FAMILY=kintex7,C_S_AXIS_TDATA_WIDTH=32,C_M_AXIS_TDATA_WIDTH=16,C_AXIS_TID_WIDTH=1,C_AXIS_TDEST_WIDTH=1,C_S_AXIS_TUSER_WIDTH=1,C_M_AXIS_TUSER_WIDTH=1,C_AXIS_SIGNAL_SET=0b00011011}" *) 
(* DowngradeIPIdentifiedWarnings = "yes" *) 
(* NotValidForBitStream *)
module axis_32_to_16_lite
   (aclk,
    aresetn,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tkeep,
    s_axis_tlast,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tkeep,
    m_axis_tlast);
  input aclk;
  input aresetn;
  input s_axis_tvalid;
  output s_axis_tready;
  input [31:0]s_axis_tdata;
  input [3:0]s_axis_tkeep;
  input s_axis_tlast;
  output m_axis_tvalid;
  input m_axis_tready;
  output [15:0]m_axis_tdata;
  output [1:0]m_axis_tkeep;
  output m_axis_tlast;

  wire \<const0> ;
  wire \<const1> ;
  wire aclk;
  wire aresetn;
  wire [15:0]m_axis_tdata;
  wire [1:0]m_axis_tkeep;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire [31:0]s_axis_tdata;
  wire [3:0]s_axis_tkeep;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire [0:0]NLW_inst_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_inst_m_axis_tid_UNCONNECTED;
  wire [1:0]NLW_inst_m_axis_tstrb_UNCONNECTED;
  wire [0:0]NLW_inst_m_axis_tuser_UNCONNECTED;

GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
(* C_AXIS_SIGNAL_SET = "32'b00000000000000000000000000011011" *) 
   (* C_AXIS_TDEST_WIDTH = "1" *) 
   (* C_AXIS_TID_WIDTH = "1" *) 
   (* C_FAMILY = "kintex7" *) 
   (* C_M_AXIS_TDATA_WIDTH = "16" *) 
   (* C_M_AXIS_TUSER_WIDTH = "1" *) 
   (* C_S_AXIS_TDATA_WIDTH = "32" *) 
   (* C_S_AXIS_TUSER_WIDTH = "1" *) 
   (* DONT_TOUCH *) 
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
   (* P_AXIS_SIGNAL_SET = "32'b00000000000000000000000000011011" *) 
   (* P_D1_REG_CONFIG = "0" *) 
   (* P_D1_TUSER_WIDTH = "4" *) 
   (* P_D2_TDATA_WIDTH = "32" *) 
   (* P_D2_TUSER_WIDTH = "4" *) 
   (* P_D3_REG_CONFIG = "0" *) 
   (* P_D3_TUSER_WIDTH = "2" *) 
   (* P_M_RATIO = "2" *) 
   (* P_SS_TKEEP_REQUIRED = "8" *) 
   (* P_S_RATIO = "1" *) 
   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) 
   axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter inst
       (.aclk(aclk),
        .aclken(\<const1> ),
        .aresetn(aresetn),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tdest(NLW_inst_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_inst_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(m_axis_tkeep),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .m_axis_tstrb(NLW_inst_m_axis_tstrb_UNCONNECTED[1:0]),
        .m_axis_tuser(NLW_inst_m_axis_tuser_UNCONNECTED[0]),
        .m_axis_tvalid(m_axis_tvalid),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tdest(\<const0> ),
        .s_axis_tid(\<const0> ),
        .s_axis_tkeep(s_axis_tkeep),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tready(s_axis_tready),
        .s_axis_tstrb({\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .s_axis_tuser(\<const0> ),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* DowngradeIPIdentifiedWarnings = "yes" *) (* C_FAMILY = "kintex7" *) (* C_S_AXIS_TDATA_WIDTH = "32" *) 
(* C_M_AXIS_TDATA_WIDTH = "16" *) (* C_AXIS_TID_WIDTH = "1" *) (* C_AXIS_TDEST_WIDTH = "1" *) 
(* C_S_AXIS_TUSER_WIDTH = "1" *) (* C_M_AXIS_TUSER_WIDTH = "1" *) (* C_AXIS_SIGNAL_SET = "32'b00000000000000000000000000011011" *) 
(* G_INDX_SS_TREADY = "0" *) (* G_INDX_SS_TDATA = "1" *) (* G_INDX_SS_TSTRB = "2" *) 
(* G_INDX_SS_TKEEP = "3" *) (* G_INDX_SS_TLAST = "4" *) (* G_INDX_SS_TID = "5" *) 
(* G_INDX_SS_TDEST = "6" *) (* G_INDX_SS_TUSER = "7" *) (* G_MASK_SS_TREADY = "1" *) 
(* G_MASK_SS_TDATA = "2" *) (* G_MASK_SS_TSTRB = "4" *) (* G_MASK_SS_TKEEP = "8" *) 
(* G_MASK_SS_TLAST = "16" *) (* G_MASK_SS_TID = "32" *) (* G_MASK_SS_TDEST = "64" *) 
(* G_MASK_SS_TUSER = "128" *) (* G_TASK_SEVERITY_ERR = "2" *) (* G_TASK_SEVERITY_WARNING = "1" *) 
(* G_TASK_SEVERITY_INFO = "0" *) (* P_SS_TKEEP_REQUIRED = "8" *) (* P_AXIS_SIGNAL_SET = "32'b00000000000000000000000000011011" *) 
(* P_S_RATIO = "1" *) (* P_M_RATIO = "2" *) (* P_D2_TDATA_WIDTH = "32" *) 
(* P_D1_TUSER_WIDTH = "4" *) (* P_D2_TUSER_WIDTH = "4" *) (* P_D3_TUSER_WIDTH = "2" *) 
(* P_D1_REG_CONFIG = "0" *) (* P_D3_REG_CONFIG = "0" *) 
module axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter
   (aclk,
    aresetn,
    aclken,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tid,
    s_axis_tdest,
    s_axis_tuser,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser);
  input aclk;
  input aresetn;
  input aclken;
  input s_axis_tvalid;
  output s_axis_tready;
  input [31:0]s_axis_tdata;
  input [3:0]s_axis_tstrb;
  input [3:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [0:0]s_axis_tdest;
  input [0:0]s_axis_tuser;
  output m_axis_tvalid;
  input m_axis_tready;
  output [15:0]m_axis_tdata;
  output [1:0]m_axis_tstrb;
  output [1:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [0:0]m_axis_tdest;
  output [0:0]m_axis_tuser;

  wire \<const0> ;
  wire \<const1> ;
  wire aclk;
  wire aclken;
  wire areset_r;
  wire aresetn;
  wire [15:0]m_axis_tdata;
  wire [1:0]m_axis_tkeep;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire n_0_areset_r_i_1;
  wire [31:0]s_axis_tdata;
  wire [0:0]s_axis_tdest;
  wire [0:0]s_axis_tid;
  wire [3:0]s_axis_tkeep;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire [3:0]s_axis_tstrb;
  wire s_axis_tvalid;

  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tid[0] = \<const0> ;
  assign m_axis_tstrb[1] = \<const0> ;
  assign m_axis_tstrb[0] = \<const0> ;
  assign m_axis_tuser[0] = \<const0> ;
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
LUT1 #(
    .INIT(2'h1)) 
     areset_r_i_1
       (.I0(aresetn),
        .O(n_0_areset_r_i_1));
FDRE areset_r_reg
       (.C(aclk),
        .CE(\<const1> ),
        .D(n_0_areset_r_i_1),
        .Q(areset_r),
        .R(\<const0> ));
axis_32_to_16_liteaxis_dwidth_converter_v1_1_axisc_downsizer \gen_downsizer_conversion.axisc_downsizer_0 
       (.O1(s_axis_tready),
        .O2(m_axis_tvalid),
        .aclk(aclk),
        .aclken(aclken),
        .areset_r(areset_r),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tkeep(m_axis_tkeep),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tkeep(s_axis_tkeep),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

module axis_32_to_16_liteaxis_dwidth_converter_v1_1_axisc_downsizer
   (O1,
    O2,
    m_axis_tlast,
    m_axis_tdata,
    m_axis_tkeep,
    aclk,
    m_axis_tready,
    aclken,
    areset_r,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tvalid,
    s_axis_tdata);
  output O1;
  output O2;
  output m_axis_tlast;
  output [15:0]m_axis_tdata;
  output [1:0]m_axis_tkeep;
  input aclk;
  input m_axis_tready;
  input aclken;
  input areset_r;
  input [3:0]s_axis_tkeep;
  input s_axis_tlast;
  input s_axis_tvalid;
  input [31:0]s_axis_tdata;

  wire \<const0> ;
  wire \<const1> ;
  wire O1;
  wire O2;
  wire aclk;
  wire aclken;
  wire areset_r;
  wire [15:0]m_axis_tdata;
  wire [1:0]m_axis_tkeep;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire \n_0_r0_data[31]_i_1 ;
  wire \n_0_r0_is_null_r[1]_i_1 ;
  wire n_0_r0_last_i_1;
  wire n_0_r0_last_reg;
  wire \n_0_r0_out_sel_r[0]_i_1 ;
  wire \n_0_r0_out_sel_r[0]_i_2 ;
  wire \n_0_r0_out_sel_r_reg[0] ;
  wire \n_0_r1_data[15]_i_1 ;
  wire n_0_r1_last_i_1;
  wire n_0_r1_last_reg;
  wire \n_0_state[0]_i_1 ;
  wire \n_0_state[0]_i_2 ;
  wire \n_0_state[1]_i_1 ;
  wire \n_0_state[1]_i_2 ;
  wire \n_0_state[2]_i_1 ;
  wire \n_0_state[2]_i_2 ;
  wire \n_0_state_reg[2] ;
  wire [31:0]p_0_in;
  wire [3:0]p_1_in;
  wire [31:16]r0_data;
  wire r0_is_null_r;
  wire [3:2]r0_keep;
  wire [31:0]s_axis_tdata;
  wire [3:0]s_axis_tkeep;
  wire s_axis_tlast;
  wire s_axis_tvalid;
  wire state27_in;

GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
(* SOFT_HLUTNM = "soft_lutpair1" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_axis_tdata[0]_INST_0 
       (.I0(p_0_in[16]),
        .I1(\n_0_r0_out_sel_r_reg[0] ),
        .I2(p_0_in[0]),
        .O(m_axis_tdata[0]));
(* SOFT_HLUTNM = "soft_lutpair6" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_axis_tdata[10]_INST_0 
       (.I0(p_0_in[26]),
        .I1(\n_0_r0_out_sel_r_reg[0] ),
        .I2(p_0_in[10]),
        .O(m_axis_tdata[10]));
(* SOFT_HLUTNM = "soft_lutpair6" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_axis_tdata[11]_INST_0 
       (.I0(p_0_in[27]),
        .I1(\n_0_r0_out_sel_r_reg[0] ),
        .I2(p_0_in[11]),
        .O(m_axis_tdata[11]));
(* SOFT_HLUTNM = "soft_lutpair7" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_axis_tdata[12]_INST_0 
       (.I0(p_0_in[28]),
        .I1(\n_0_r0_out_sel_r_reg[0] ),
        .I2(p_0_in[12]),
        .O(m_axis_tdata[12]));
(* SOFT_HLUTNM = "soft_lutpair7" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_axis_tdata[13]_INST_0 
       (.I0(p_0_in[29]),
        .I1(\n_0_r0_out_sel_r_reg[0] ),
        .I2(p_0_in[13]),
        .O(m_axis_tdata[13]));
(* SOFT_HLUTNM = "soft_lutpair8" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_axis_tdata[14]_INST_0 
       (.I0(p_0_in[30]),
        .I1(\n_0_r0_out_sel_r_reg[0] ),
        .I2(p_0_in[14]),
        .O(m_axis_tdata[14]));
(* SOFT_HLUTNM = "soft_lutpair8" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_axis_tdata[15]_INST_0 
       (.I0(p_0_in[31]),
        .I1(\n_0_r0_out_sel_r_reg[0] ),
        .I2(p_0_in[15]),
        .O(m_axis_tdata[15]));
(* SOFT_HLUTNM = "soft_lutpair2" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_axis_tdata[1]_INST_0 
       (.I0(p_0_in[17]),
        .I1(\n_0_r0_out_sel_r_reg[0] ),
        .I2(p_0_in[1]),
        .O(m_axis_tdata[1]));
(* SOFT_HLUTNM = "soft_lutpair1" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_axis_tdata[2]_INST_0 
       (.I0(p_0_in[18]),
        .I1(\n_0_r0_out_sel_r_reg[0] ),
        .I2(p_0_in[2]),
        .O(m_axis_tdata[2]));
(* SOFT_HLUTNM = "soft_lutpair3" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_axis_tdata[3]_INST_0 
       (.I0(p_0_in[19]),
        .I1(\n_0_r0_out_sel_r_reg[0] ),
        .I2(p_0_in[3]),
        .O(m_axis_tdata[3]));
(* SOFT_HLUTNM = "soft_lutpair4" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_axis_tdata[4]_INST_0 
       (.I0(p_0_in[20]),
        .I1(\n_0_r0_out_sel_r_reg[0] ),
        .I2(p_0_in[4]),
        .O(m_axis_tdata[4]));
(* SOFT_HLUTNM = "soft_lutpair4" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_axis_tdata[5]_INST_0 
       (.I0(p_0_in[21]),
        .I1(\n_0_r0_out_sel_r_reg[0] ),
        .I2(p_0_in[5]),
        .O(m_axis_tdata[5]));
(* SOFT_HLUTNM = "soft_lutpair5" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_axis_tdata[6]_INST_0 
       (.I0(p_0_in[22]),
        .I1(\n_0_r0_out_sel_r_reg[0] ),
        .I2(p_0_in[6]),
        .O(m_axis_tdata[6]));
(* SOFT_HLUTNM = "soft_lutpair5" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_axis_tdata[7]_INST_0 
       (.I0(p_0_in[23]),
        .I1(\n_0_r0_out_sel_r_reg[0] ),
        .I2(p_0_in[7]),
        .O(m_axis_tdata[7]));
(* SOFT_HLUTNM = "soft_lutpair2" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_axis_tdata[8]_INST_0 
       (.I0(p_0_in[24]),
        .I1(\n_0_r0_out_sel_r_reg[0] ),
        .I2(p_0_in[8]),
        .O(m_axis_tdata[8]));
(* SOFT_HLUTNM = "soft_lutpair3" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_axis_tdata[9]_INST_0 
       (.I0(p_0_in[25]),
        .I1(\n_0_r0_out_sel_r_reg[0] ),
        .I2(p_0_in[9]),
        .O(m_axis_tdata[9]));
(* SOFT_HLUTNM = "soft_lutpair9" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_axis_tkeep[0]_INST_0 
       (.I0(p_1_in[2]),
        .I1(\n_0_r0_out_sel_r_reg[0] ),
        .I2(p_1_in[0]),
        .O(m_axis_tkeep[0]));
(* SOFT_HLUTNM = "soft_lutpair9" *) 
   LUT3 #(
    .INIT(8'hB8)) 
     \m_axis_tkeep[1]_INST_0 
       (.I0(p_1_in[3]),
        .I1(\n_0_r0_out_sel_r_reg[0] ),
        .I2(p_1_in[1]),
        .O(m_axis_tkeep[1]));
LUT6 #(
    .INIT(64'h8F88F88880880888)) 
     m_axis_tlast_INST_0
       (.I0(n_0_r0_last_reg),
        .I1(state27_in),
        .I2(O1),
        .I3(O2),
        .I4(\n_0_state_reg[2] ),
        .I5(n_0_r1_last_reg),
        .O(m_axis_tlast));
LUT3 #(
    .INIT(8'h40)) 
     \r0_data[31]_i_1 
       (.I0(\n_0_state_reg[2] ),
        .I1(O1),
        .I2(aclken),
        .O(\n_0_r0_data[31]_i_1 ));
FDRE \r0_data_reg[0] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[0]),
        .Q(p_0_in[0]),
        .R(\<const0> ));
FDRE \r0_data_reg[10] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[10]),
        .Q(p_0_in[10]),
        .R(\<const0> ));
FDRE \r0_data_reg[11] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[11]),
        .Q(p_0_in[11]),
        .R(\<const0> ));
FDRE \r0_data_reg[12] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[12]),
        .Q(p_0_in[12]),
        .R(\<const0> ));
FDRE \r0_data_reg[13] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[13]),
        .Q(p_0_in[13]),
        .R(\<const0> ));
FDRE \r0_data_reg[14] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[14]),
        .Q(p_0_in[14]),
        .R(\<const0> ));
FDRE \r0_data_reg[15] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[15]),
        .Q(p_0_in[15]),
        .R(\<const0> ));
FDRE \r0_data_reg[16] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[16]),
        .Q(r0_data[16]),
        .R(\<const0> ));
FDRE \r0_data_reg[17] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[17]),
        .Q(r0_data[17]),
        .R(\<const0> ));
FDRE \r0_data_reg[18] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[18]),
        .Q(r0_data[18]),
        .R(\<const0> ));
FDRE \r0_data_reg[19] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[19]),
        .Q(r0_data[19]),
        .R(\<const0> ));
FDRE \r0_data_reg[1] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[1]),
        .Q(p_0_in[1]),
        .R(\<const0> ));
FDRE \r0_data_reg[20] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[20]),
        .Q(r0_data[20]),
        .R(\<const0> ));
FDRE \r0_data_reg[21] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[21]),
        .Q(r0_data[21]),
        .R(\<const0> ));
FDRE \r0_data_reg[22] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[22]),
        .Q(r0_data[22]),
        .R(\<const0> ));
FDRE \r0_data_reg[23] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[23]),
        .Q(r0_data[23]),
        .R(\<const0> ));
FDRE \r0_data_reg[24] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[24]),
        .Q(r0_data[24]),
        .R(\<const0> ));
FDRE \r0_data_reg[25] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[25]),
        .Q(r0_data[25]),
        .R(\<const0> ));
FDRE \r0_data_reg[26] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[26]),
        .Q(r0_data[26]),
        .R(\<const0> ));
FDRE \r0_data_reg[27] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[27]),
        .Q(r0_data[27]),
        .R(\<const0> ));
FDRE \r0_data_reg[28] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[28]),
        .Q(r0_data[28]),
        .R(\<const0> ));
FDRE \r0_data_reg[29] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[29]),
        .Q(r0_data[29]),
        .R(\<const0> ));
FDRE \r0_data_reg[2] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[2]),
        .Q(p_0_in[2]),
        .R(\<const0> ));
FDRE \r0_data_reg[30] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[30]),
        .Q(r0_data[30]),
        .R(\<const0> ));
FDRE \r0_data_reg[31] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[31]),
        .Q(r0_data[31]),
        .R(\<const0> ));
FDRE \r0_data_reg[3] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[3]),
        .Q(p_0_in[3]),
        .R(\<const0> ));
FDRE \r0_data_reg[4] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[4]),
        .Q(p_0_in[4]),
        .R(\<const0> ));
FDRE \r0_data_reg[5] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[5]),
        .Q(p_0_in[5]),
        .R(\<const0> ));
FDRE \r0_data_reg[6] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[6]),
        .Q(p_0_in[6]),
        .R(\<const0> ));
FDRE \r0_data_reg[7] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[7]),
        .Q(p_0_in[7]),
        .R(\<const0> ));
FDRE \r0_data_reg[8] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[8]),
        .Q(p_0_in[8]),
        .R(\<const0> ));
FDRE \r0_data_reg[9] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tdata[9]),
        .Q(p_0_in[9]),
        .R(\<const0> ));
LUT5 #(
    .INIT(32'h0000222E)) 
     \r0_is_null_r[1]_i_1 
       (.I0(state27_in),
        .I1(r0_is_null_r),
        .I2(s_axis_tkeep[2]),
        .I3(s_axis_tkeep[3]),
        .I4(areset_r),
        .O(\n_0_r0_is_null_r[1]_i_1 ));
LUT4 #(
    .INIT(16'h4000)) 
     \r0_is_null_r[1]_i_2 
       (.I0(\n_0_state_reg[2] ),
        .I1(O1),
        .I2(s_axis_tvalid),
        .I3(aclken),
        .O(r0_is_null_r));
FDRE \r0_is_null_r_reg[1] 
       (.C(aclk),
        .CE(\<const1> ),
        .D(\n_0_r0_is_null_r[1]_i_1 ),
        .Q(state27_in),
        .R(\<const0> ));
FDRE \r0_keep_reg[0] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tkeep[0]),
        .Q(p_1_in[0]),
        .R(\<const0> ));
FDRE \r0_keep_reg[1] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tkeep[1]),
        .Q(p_1_in[1]),
        .R(\<const0> ));
FDRE \r0_keep_reg[2] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tkeep[2]),
        .Q(r0_keep[2]),
        .R(\<const0> ));
FDRE \r0_keep_reg[3] 
       (.C(aclk),
        .CE(\n_0_r0_data[31]_i_1 ),
        .D(s_axis_tkeep[3]),
        .Q(r0_keep[3]),
        .R(\<const0> ));
LUT5 #(
    .INIT(32'hEFFF2000)) 
     r0_last_i_1
       (.I0(s_axis_tlast),
        .I1(\n_0_state_reg[2] ),
        .I2(O1),
        .I3(aclken),
        .I4(n_0_r0_last_reg),
        .O(n_0_r0_last_i_1));
FDRE r0_last_reg
       (.C(aclk),
        .CE(\<const1> ),
        .D(n_0_r0_last_i_1),
        .Q(n_0_r0_last_reg),
        .R(\<const0> ));
LUT5 #(
    .INIT(32'h00005F40)) 
     \r0_out_sel_r[0]_i_1 
       (.I0(\n_0_r0_out_sel_r[0]_i_2 ),
        .I1(m_axis_tready),
        .I2(aclken),
        .I3(\n_0_r0_out_sel_r_reg[0] ),
        .I4(areset_r),
        .O(\n_0_r0_out_sel_r[0]_i_1 ));
LUT6 #(
    .INIT(64'hFF04FF04FF040404)) 
     \r0_out_sel_r[0]_i_2 
       (.I0(O2),
        .I1(O1),
        .I2(\n_0_state_reg[2] ),
        .I3(m_axis_tready),
        .I4(\n_0_r0_out_sel_r_reg[0] ),
        .I5(state27_in),
        .O(\n_0_r0_out_sel_r[0]_i_2 ));
FDRE \r0_out_sel_r_reg[0] 
       (.C(aclk),
        .CE(\<const1> ),
        .D(\n_0_r0_out_sel_r[0]_i_1 ),
        .Q(\n_0_r0_out_sel_r_reg[0] ),
        .R(\<const0> ));
LUT4 #(
    .INIT(16'h0040)) 
     \r1_data[15]_i_1 
       (.I0(\n_0_state_reg[2] ),
        .I1(aclken),
        .I2(O2),
        .I3(O1),
        .O(\n_0_r1_data[15]_i_1 ));
FDRE \r1_data_reg[0] 
       (.C(aclk),
        .CE(\n_0_r1_data[15]_i_1 ),
        .D(r0_data[16]),
        .Q(p_0_in[16]),
        .R(\<const0> ));
FDRE \r1_data_reg[10] 
       (.C(aclk),
        .CE(\n_0_r1_data[15]_i_1 ),
        .D(r0_data[26]),
        .Q(p_0_in[26]),
        .R(\<const0> ));
FDRE \r1_data_reg[11] 
       (.C(aclk),
        .CE(\n_0_r1_data[15]_i_1 ),
        .D(r0_data[27]),
        .Q(p_0_in[27]),
        .R(\<const0> ));
FDRE \r1_data_reg[12] 
       (.C(aclk),
        .CE(\n_0_r1_data[15]_i_1 ),
        .D(r0_data[28]),
        .Q(p_0_in[28]),
        .R(\<const0> ));
FDRE \r1_data_reg[13] 
       (.C(aclk),
        .CE(\n_0_r1_data[15]_i_1 ),
        .D(r0_data[29]),
        .Q(p_0_in[29]),
        .R(\<const0> ));
FDRE \r1_data_reg[14] 
       (.C(aclk),
        .CE(\n_0_r1_data[15]_i_1 ),
        .D(r0_data[30]),
        .Q(p_0_in[30]),
        .R(\<const0> ));
FDRE \r1_data_reg[15] 
       (.C(aclk),
        .CE(\n_0_r1_data[15]_i_1 ),
        .D(r0_data[31]),
        .Q(p_0_in[31]),
        .R(\<const0> ));
FDRE \r1_data_reg[1] 
       (.C(aclk),
        .CE(\n_0_r1_data[15]_i_1 ),
        .D(r0_data[17]),
        .Q(p_0_in[17]),
        .R(\<const0> ));
FDRE \r1_data_reg[2] 
       (.C(aclk),
        .CE(\n_0_r1_data[15]_i_1 ),
        .D(r0_data[18]),
        .Q(p_0_in[18]),
        .R(\<const0> ));
FDRE \r1_data_reg[3] 
       (.C(aclk),
        .CE(\n_0_r1_data[15]_i_1 ),
        .D(r0_data[19]),
        .Q(p_0_in[19]),
        .R(\<const0> ));
FDRE \r1_data_reg[4] 
       (.C(aclk),
        .CE(\n_0_r1_data[15]_i_1 ),
        .D(r0_data[20]),
        .Q(p_0_in[20]),
        .R(\<const0> ));
FDRE \r1_data_reg[5] 
       (.C(aclk),
        .CE(\n_0_r1_data[15]_i_1 ),
        .D(r0_data[21]),
        .Q(p_0_in[21]),
        .R(\<const0> ));
FDRE \r1_data_reg[6] 
       (.C(aclk),
        .CE(\n_0_r1_data[15]_i_1 ),
        .D(r0_data[22]),
        .Q(p_0_in[22]),
        .R(\<const0> ));
FDRE \r1_data_reg[7] 
       (.C(aclk),
        .CE(\n_0_r1_data[15]_i_1 ),
        .D(r0_data[23]),
        .Q(p_0_in[23]),
        .R(\<const0> ));
FDRE \r1_data_reg[8] 
       (.C(aclk),
        .CE(\n_0_r1_data[15]_i_1 ),
        .D(r0_data[24]),
        .Q(p_0_in[24]),
        .R(\<const0> ));
FDRE \r1_data_reg[9] 
       (.C(aclk),
        .CE(\n_0_r1_data[15]_i_1 ),
        .D(r0_data[25]),
        .Q(p_0_in[25]),
        .R(\<const0> ));
FDRE \r1_keep_reg[0] 
       (.C(aclk),
        .CE(\n_0_r1_data[15]_i_1 ),
        .D(r0_keep[2]),
        .Q(p_1_in[2]),
        .R(\<const0> ));
FDRE \r1_keep_reg[1] 
       (.C(aclk),
        .CE(\n_0_r1_data[15]_i_1 ),
        .D(r0_keep[3]),
        .Q(p_1_in[3]),
        .R(\<const0> ));
LUT6 #(
    .INIT(64'hFFFFEFFF00002000)) 
     r1_last_i_1
       (.I0(n_0_r0_last_reg),
        .I1(\n_0_state_reg[2] ),
        .I2(aclken),
        .I3(O2),
        .I4(O1),
        .I5(n_0_r1_last_reg),
        .O(n_0_r1_last_i_1));
FDRE r1_last_reg
       (.C(aclk),
        .CE(\<const1> ),
        .D(n_0_r1_last_i_1),
        .Q(n_0_r1_last_reg),
        .R(\<const0> ));
LUT2 #(
    .INIT(4'h2)) 
     \state[0]_i_1 
       (.I0(\n_0_state[0]_i_2 ),
        .I1(areset_r),
        .O(\n_0_state[0]_i_1 ));
LUT6 #(
    .INIT(64'hFF33FFFF0FAF0000)) 
     \state[0]_i_2 
       (.I0(m_axis_tready),
        .I1(s_axis_tvalid),
        .I2(O2),
        .I3(\n_0_state_reg[2] ),
        .I4(aclken),
        .I5(O1),
        .O(\n_0_state[0]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair0" *) 
   LUT4 #(
    .INIT(16'h00E2)) 
     \state[1]_i_1 
       (.I0(O2),
        .I1(aclken),
        .I2(\n_0_state[1]_i_2 ),
        .I3(areset_r),
        .O(\n_0_state[1]_i_1 ));
LUT6 #(
    .INIT(64'h308830F830B830F8)) 
     \state[1]_i_2 
       (.I0(s_axis_tvalid),
        .I1(O1),
        .I2(O2),
        .I3(\n_0_state_reg[2] ),
        .I4(m_axis_tready),
        .I5(state27_in),
        .O(\n_0_state[1]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair0" *) 
   LUT2 #(
    .INIT(4'h2)) 
     \state[2]_i_1 
       (.I0(\n_0_state[2]_i_2 ),
        .I1(areset_r),
        .O(\n_0_state[2]_i_1 ));
LUT6 #(
    .INIT(64'h0300FFFF20000000)) 
     \state[2]_i_2 
       (.I0(s_axis_tvalid),
        .I1(m_axis_tready),
        .I2(O1),
        .I3(O2),
        .I4(aclken),
        .I5(\n_0_state_reg[2] ),
        .O(\n_0_state[2]_i_2 ));
FDRE \state_reg[0] 
       (.C(aclk),
        .CE(\<const1> ),
        .D(\n_0_state[0]_i_1 ),
        .Q(O1),
        .R(\<const0> ));
FDRE \state_reg[1] 
       (.C(aclk),
        .CE(\<const1> ),
        .D(\n_0_state[1]_i_1 ),
        .Q(O2),
        .R(\<const0> ));
FDRE \state_reg[2] 
       (.C(aclk),
        .CE(\<const1> ),
        .D(\n_0_state[2]_i_1 ),
        .Q(\n_0_state_reg[2] ),
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
