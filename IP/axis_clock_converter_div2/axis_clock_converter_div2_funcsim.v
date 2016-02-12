// Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2013.4 (win64) Build 353583 Mon Dec  9 17:49:19 MST 2013
// Date        : Fri Dec 12 12:27:00 2014
// Host        : TELOPS210 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               d:/Telops/fir-00251-Common/IP/axis_clock_converter_div2/axis_clock_converter_div2_funcsim.v
// Design      : axis_clock_converter_div2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* X_CORE_INFO = "axis_clock_converter_v1_1_axis_clock_converter,Vivado 2013.4" *) (* CHECK_LICENSE_TYPE = "axis_clock_converter_div2,axis_clock_converter_v1_1_axis_clock_converter,{}" *) (* CORE_GENERATION_INFO = "axis_clock_converter_div2,axis_clock_converter_v1_1_axis_clock_converter,{x_ipProduct=Vivado 2013.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=axis_clock_converter,x_ipVersion=1.1,x_ipCoreRevision=1,x_ipLanguage=VHDL,C_FAMILY=kintex7,C_AXIS_TDATA_WIDTH=64,C_AXIS_TID_WIDTH=1,C_AXIS_TDEST_WIDTH=3,C_AXIS_TUSER_WIDTH=16,C_AXIS_SIGNAL_SET=0b11111111,C_IS_ACLK_ASYNC=1,C_SYNCHRONIZER_STAGE=1,C_S_AXIS_ACLK_RATIO=1,C_M_AXIS_ACLK_RATIO=2,C_ACLKEN_CONV_MODE=0}" *) 
(* DowngradeIPIdentifiedWarnings = "yes" *) 
(* NotValidForBitStream *)
module axis_clock_converter_div2
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
  input [63:0]s_axis_tdata;
  input [7:0]s_axis_tstrb;
  input [7:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [2:0]s_axis_tdest;
  input [15:0]s_axis_tuser;
  input m_axis_aclk;
  output m_axis_tvalid;
  input m_axis_tready;
  output [63:0]m_axis_tdata;
  output [7:0]m_axis_tstrb;
  output [7:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [2:0]m_axis_tdest;
  output [15:0]m_axis_tuser;

  wire \<const1> ;
  wire m_axis_aclk;
  wire m_axis_aresetn;
  wire [63:0]m_axis_tdata;
  wire [2:0]m_axis_tdest;
  wire [0:0]m_axis_tid;
  wire [7:0]m_axis_tkeep;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire [7:0]m_axis_tstrb;
  wire [15:0]m_axis_tuser;
  wire m_axis_tvalid;
  wire s_axis_aclk;
  wire s_axis_aresetn;
  wire [63:0]s_axis_tdata;
  wire [2:0]s_axis_tdest;
  wire [0:0]s_axis_tid;
  wire [7:0]s_axis_tkeep;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire [7:0]s_axis_tstrb;
  wire [15:0]s_axis_tuser;
  wire s_axis_tvalid;

VCC VCC
       (.P(\<const1> ));
(* C_ACLKEN_CONV_MODE = "0" *) 
   (* C_AXIS_SIGNAL_SET = "32'b00000000000000000000000011111111" *) 
   (* C_AXIS_TDATA_WIDTH = "64" *) 
   (* C_AXIS_TDEST_WIDTH = "3" *) 
   (* C_AXIS_TID_WIDTH = "1" *) 
   (* C_AXIS_TUSER_WIDTH = "16" *) 
   (* C_FAMILY = "kintex7" *) 
   (* C_IS_ACLK_ASYNC = "1" *) 
   (* C_M_AXIS_ACLK_RATIO = "2" *) 
   (* C_SYNCHRONIZER_STAGE = "1" *) 
   (* C_S_AXIS_ACLK_RATIO = "1" *) 
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
   (* P_INST_FIFO_GEN = "1" *) 
   (* P_M_AXIS_ACLK_RATIO = "2" *) 
   (* P_SAMPLE_CYCLE_RATIO = "2" *) 
   (* P_S_AXIS_ACLK_RATIO = "1" *) 
   (* P_TPAYLOAD_WIDTH = "101" *) 
   (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) 
   axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter inst
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

(* DowngradeIPIdentifiedWarnings = "yes" *) (* C_FAMILY = "kintex7" *) (* C_AXIS_TDATA_WIDTH = "64" *) 
(* C_AXIS_TID_WIDTH = "1" *) (* C_AXIS_TDEST_WIDTH = "3" *) (* C_AXIS_TUSER_WIDTH = "16" *) 
(* C_AXIS_SIGNAL_SET = "32'b00000000000000000000000011111111" *) (* C_IS_ACLK_ASYNC = "1" *) (* C_SYNCHRONIZER_STAGE = "1" *) 
(* C_S_AXIS_ACLK_RATIO = "1" *) (* C_M_AXIS_ACLK_RATIO = "2" *) (* C_ACLKEN_CONV_MODE = "0" *) 
(* G_INDX_SS_TREADY = "0" *) (* G_INDX_SS_TDATA = "1" *) (* G_INDX_SS_TSTRB = "2" *) 
(* G_INDX_SS_TKEEP = "3" *) (* G_INDX_SS_TLAST = "4" *) (* G_INDX_SS_TID = "5" *) 
(* G_INDX_SS_TDEST = "6" *) (* G_INDX_SS_TUSER = "7" *) (* G_MASK_SS_TREADY = "1" *) 
(* G_MASK_SS_TDATA = "2" *) (* G_MASK_SS_TSTRB = "4" *) (* G_MASK_SS_TKEEP = "8" *) 
(* G_MASK_SS_TLAST = "16" *) (* G_MASK_SS_TID = "32" *) (* G_MASK_SS_TDEST = "64" *) 
(* G_MASK_SS_TUSER = "128" *) (* G_TASK_SEVERITY_ERR = "2" *) (* G_TASK_SEVERITY_WARNING = "1" *) 
(* G_TASK_SEVERITY_INFO = "0" *) (* LP_S_ACLKEN_CAN_TOGGLE = "0" *) (* LP_M_ACLKEN_CAN_TOGGLE = "0" *) 
(* P_FIFO_MODE = "1" *) (* P_FIFO_DEPTH = "32" *) (* P_S_AXIS_ACLK_RATIO = "1" *) 
(* P_M_AXIS_ACLK_RATIO = "2" *) (* P_INST_FIFO_GEN = "1" *) (* P_TPAYLOAD_WIDTH = "101" *) 
(* P_SAMPLE_CYCLE_RATIO = "2" *) 
module axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter
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
  input [63:0]s_axis_tdata;
  input [7:0]s_axis_tstrb;
  input [7:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [2:0]s_axis_tdest;
  input [15:0]s_axis_tuser;
  input m_axis_aclk;
  output m_axis_tvalid;
  input m_axis_tready;
  output [63:0]m_axis_tdata;
  output [7:0]m_axis_tstrb;
  output [7:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [2:0]m_axis_tdest;
  output [15:0]m_axis_tuser;

  wire m_axis_aclk;
  wire m_axis_aclken;
  wire m_axis_aresetn;
  wire [63:0]m_axis_tdata;
  wire [2:0]m_axis_tdest;
  wire [0:0]m_axis_tid;
  wire [7:0]m_axis_tkeep;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire [7:0]m_axis_tstrb;
  wire [15:0]m_axis_tuser;
  wire m_axis_tvalid;
  wire s_axis_aclk;
  wire s_axis_aclken;
  wire s_axis_aresetn;
  wire [63:0]s_axis_tdata;
  wire [2:0]s_axis_tdest;
  wire [0:0]s_axis_tid;
  wire [7:0]s_axis_tkeep;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire [7:0]s_axis_tstrb;
  wire [15:0]s_axis_tuser;
  wire s_axis_tvalid;

axis_clock_converter_div2axis_data_fifo_v1_1_axis_data_fifo \gen_fifo_gen_ck_conv.axis_data_fifo_0 
       (.DI({s_axis_tdata,s_axis_tstrb,s_axis_tkeep,s_axis_tid,s_axis_tdest,s_axis_tuser,s_axis_tlast}),
        .Q({m_axis_tdata,m_axis_tstrb,m_axis_tkeep,m_axis_tid,m_axis_tdest,m_axis_tuser,m_axis_tlast}),
        .m_axis_aclk(m_axis_aclk),
        .m_axis_aresetn(m_axis_aresetn),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_axis_aclk(s_axis_aclk),
        .s_axis_aresetn(s_axis_aresetn),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

module axis_clock_converter_div2axis_data_fifo_v1_1_axis_data_fifo
   (Q,
    s_axis_tready,
    m_axis_tvalid,
    m_axis_tready,
    s_axis_tvalid,
    m_axis_aclk,
    DI,
    s_axis_aclk,
    s_axis_aresetn,
    m_axis_aresetn);
  output [100:0]Q;
  output s_axis_tready;
  output m_axis_tvalid;
  input m_axis_tready;
  input s_axis_tvalid;
  input m_axis_aclk;
  input [100:0]DI;
  input s_axis_aclk;
  input s_axis_aresetn;
  input m_axis_aresetn;

  wire [100:0]DI;
  wire [100:0]Q;
  wire m_axis_aclk;
  wire m_axis_aresetn;
  wire m_axis_tready;
  wire m_axis_tvalid;
(* RTL_KEEP = "true" *)   wire s_and_m_aresetn_i;
  wire s_axis_aclk;
  wire s_axis_aresetn;
  wire s_axis_tready;
  wire s_axis_tvalid;

axis_clock_converter_div2axis_infrastructure_v1_1_clock_synchronizer \gen_async_clock_and_reset.inst_clock_synchronizer 
       (.m_axis_aresetn(m_axis_aresetn),
        .s_aresetn_synch(s_and_m_aresetn_i),
        .s_axis_aclk(s_axis_aclk),
        .s_axis_aresetn(s_axis_aresetn));
axis_clock_converter_div2fifo_generator_v11_0 \gen_fifo_generator.fifo_generator_inst 
       (.DI(DI),
        .I1(s_and_m_aresetn_i),
        .Q(Q),
        .m_axis_aclk(m_axis_aclk),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_axis_aclk(s_axis_aclk),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

module axis_clock_converter_div2axis_infrastructure_v1_1_clock_synchronizer
   (s_aresetn_synch,
    s_axis_aclk,
    s_axis_aresetn,
    m_axis_aresetn);
  output s_aresetn_synch;
  input s_axis_aclk;
  input s_axis_aresetn;
  input m_axis_aresetn;

  wire \<const0> ;
  wire \<const1> ;
  wire m_axis_aresetn;
  wire \n_0_gen_synchronizer.synch_d[0]_i_1 ;
  wire s_aresetn_synch;
  wire s_axis_aclk;
  wire s_axis_aresetn;
  wire synch_d;

GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
LUT2 #(
    .INIT(4'h8)) 
     \gen_synchronizer.synch_d[0]_i_1 
       (.I0(s_axis_aresetn),
        .I1(m_axis_aresetn),
        .O(\n_0_gen_synchronizer.synch_d[0]_i_1 ));
FDRE \gen_synchronizer.synch_d_reg[0] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(\n_0_gen_synchronizer.synch_d[0]_i_1 ),
        .Q(synch_d),
        .R(\<const0> ));
LUT1 #(
    .INIT(2'h2)) 
     i_0
       (.I0(synch_d),
        .O(s_aresetn_synch));
endmodule

module axis_clock_converter_div2clk_x_pntrs
   (O1,
    Q,
    O2,
    O4,
    O5,
    O6,
    O3,
    I1,
    I2,
    I3,
    I4,
    m_axis_aclk,
    I5,
    s_axis_aclk,
    I6,
    D);
  output O1;
  output [0:0]Q;
  output O2;
  output O4;
  output [2:0]O5;
  output O6;
  input [3:0]O3;
  input [3:0]I1;
  input [1:0]I2;
  input [3:0]I3;
  input [4:0]I4;
  input m_axis_aclk;
  input [0:0]I5;
  input s_axis_aclk;
  input [0:0]I6;
  input [3:0]D;

  wire \<const1> ;
  wire [3:0]D;
  wire [3:0]I1;
  wire [1:0]I2;
  wire [3:0]I3;
  wire [4:0]I4;
  wire [0:0]I5;
  wire [0:0]I6;
  wire O1;
  wire O2;
  wire [3:0]O3;
  wire O4;
  wire [2:0]O5;
  wire O6;
  wire [0:0]Q;
  wire m_axis_aclk;
  wire \n_0_gsync_stage[1].wr_stg_inst ;
  wire n_0_ram_empty_fb_i_i_4;
  wire n_0_ram_empty_fb_i_i_5;
  wire n_0_ram_full_fb_i_i_6;
  wire \n_1_gsync_stage[1].wr_stg_inst ;
  wire \n_2_gsync_stage[1].wr_stg_inst ;
  wire \n_3_gsync_stage[1].wr_stg_inst ;
  wire \n_4_gsync_stage[1].wr_stg_inst ;
  wire [4:0]p_0_in;
  wire [3:0]p_0_in2_out;
  wire [1:0]p_0_out;
  wire [4:0]p_1_out;
  wire [4:0]rd_pntr_gc;
  wire s_axis_aclk;
  wire [4:0]wr_pntr_gc;

VCC VCC
       (.P(\<const1> ));
axis_clock_converter_div2synchronizer_ff_0 \gsync_stage[1].rd_stg_inst 
       (.I5(I5),
        .Q(wr_pntr_gc),
        .m_axis_aclk(m_axis_aclk),
        .p_0_in(p_0_in));
axis_clock_converter_div2synchronizer_ff \gsync_stage[1].wr_stg_inst 
       (.D({\n_1_gsync_stage[1].wr_stg_inst ,\n_2_gsync_stage[1].wr_stg_inst ,\n_3_gsync_stage[1].wr_stg_inst ,\n_4_gsync_stage[1].wr_stg_inst }),
        .I1(rd_pntr_gc),
        .I6(I6),
        .Q(\n_0_gsync_stage[1].wr_stg_inst ),
        .s_axis_aclk(s_axis_aclk));
LUT5 #(
    .INIT(32'hFFFF6FF6)) 
     ram_empty_fb_i_i_2
       (.I0(I1[0]),
        .I1(p_1_out[0]),
        .I2(I1[1]),
        .I3(p_1_out[1]),
        .I4(n_0_ram_empty_fb_i_i_4),
        .O(O2));
LUT5 #(
    .INIT(32'h00009009)) 
     ram_empty_fb_i_i_3
       (.I0(O3[1]),
        .I1(p_1_out[1]),
        .I2(O3[0]),
        .I3(p_1_out[0]),
        .I4(n_0_ram_empty_fb_i_i_5),
        .O(O1));
LUT4 #(
    .INIT(16'h6FF6)) 
     ram_empty_fb_i_i_4
       (.I0(p_1_out[2]),
        .I1(I1[2]),
        .I2(p_1_out[4]),
        .I3(I1[3]),
        .O(n_0_ram_empty_fb_i_i_4));
LUT4 #(
    .INIT(16'h6FF6)) 
     ram_empty_fb_i_i_5
       (.I0(p_1_out[2]),
        .I1(O3[2]),
        .I2(p_1_out[4]),
        .I3(O3[3]),
        .O(n_0_ram_empty_fb_i_i_5));
LUT5 #(
    .INIT(32'h00009009)) 
     ram_full_fb_i_i_3
       (.I0(I3[0]),
        .I1(p_0_out[0]),
        .I2(I3[1]),
        .I3(p_0_out[1]),
        .I4(n_0_ram_full_fb_i_i_6),
        .O(O6));
LUT4 #(
    .INIT(16'h6FF6)) 
     ram_full_fb_i_i_5
       (.I0(p_0_out[1]),
        .I1(I2[1]),
        .I2(p_0_out[0]),
        .I3(I2[0]),
        .O(O4));
LUT4 #(
    .INIT(16'h6FF6)) 
     ram_full_fb_i_i_6
       (.I0(O5[0]),
        .I1(I3[2]),
        .I2(O5[2]),
        .I3(I3[3]),
        .O(n_0_ram_full_fb_i_i_6));
FDCE #(
    .INIT(1'b0)) 
     \rd_pntr_bin_reg[0] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .CLR(I6),
        .D(\n_4_gsync_stage[1].wr_stg_inst ),
        .Q(p_0_out[0]));
FDCE #(
    .INIT(1'b0)) 
     \rd_pntr_bin_reg[1] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .CLR(I6),
        .D(\n_3_gsync_stage[1].wr_stg_inst ),
        .Q(p_0_out[1]));
FDCE #(
    .INIT(1'b0)) 
     \rd_pntr_bin_reg[2] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .CLR(I6),
        .D(\n_2_gsync_stage[1].wr_stg_inst ),
        .Q(O5[0]));
FDCE #(
    .INIT(1'b0)) 
     \rd_pntr_bin_reg[3] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .CLR(I6),
        .D(\n_1_gsync_stage[1].wr_stg_inst ),
        .Q(O5[1]));
FDCE #(
    .INIT(1'b0)) 
     \rd_pntr_bin_reg[4] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .CLR(I6),
        .D(\n_0_gsync_stage[1].wr_stg_inst ),
        .Q(O5[2]));
FDCE #(
    .INIT(1'b0)) 
     \rd_pntr_gc_reg[0] 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .CLR(I5),
        .D(D[0]),
        .Q(rd_pntr_gc[0]));
FDCE #(
    .INIT(1'b0)) 
     \rd_pntr_gc_reg[1] 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .CLR(I5),
        .D(D[1]),
        .Q(rd_pntr_gc[1]));
FDCE #(
    .INIT(1'b0)) 
     \rd_pntr_gc_reg[2] 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .CLR(I5),
        .D(D[2]),
        .Q(rd_pntr_gc[2]));
FDCE #(
    .INIT(1'b0)) 
     \rd_pntr_gc_reg[3] 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .CLR(I5),
        .D(D[3]),
        .Q(rd_pntr_gc[3]));
FDCE #(
    .INIT(1'b0)) 
     \rd_pntr_gc_reg[4] 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .CLR(I5),
        .D(O3[3]),
        .Q(rd_pntr_gc[4]));
FDCE #(
    .INIT(1'b0)) 
     \wr_pntr_bin_reg[0] 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .CLR(I5),
        .D(p_0_in[0]),
        .Q(p_1_out[0]));
FDCE #(
    .INIT(1'b0)) 
     \wr_pntr_bin_reg[1] 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .CLR(I5),
        .D(p_0_in[1]),
        .Q(p_1_out[1]));
FDCE #(
    .INIT(1'b0)) 
     \wr_pntr_bin_reg[2] 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .CLR(I5),
        .D(p_0_in[2]),
        .Q(p_1_out[2]));
FDCE #(
    .INIT(1'b0)) 
     \wr_pntr_bin_reg[3] 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .CLR(I5),
        .D(p_0_in[3]),
        .Q(Q));
FDCE #(
    .INIT(1'b0)) 
     \wr_pntr_bin_reg[4] 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .CLR(I5),
        .D(p_0_in[4]),
        .Q(p_1_out[4]));
(* SOFT_HLUTNM = "soft_lutpair10" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \wr_pntr_gc[0]_i_1 
       (.I0(I4[0]),
        .I1(I4[1]),
        .O(p_0_in2_out[0]));
(* SOFT_HLUTNM = "soft_lutpair10" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \wr_pntr_gc[1]_i_1 
       (.I0(I4[1]),
        .I1(I4[2]),
        .O(p_0_in2_out[1]));
(* SOFT_HLUTNM = "soft_lutpair11" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \wr_pntr_gc[2]_i_1 
       (.I0(I4[2]),
        .I1(I4[3]),
        .O(p_0_in2_out[2]));
(* SOFT_HLUTNM = "soft_lutpair11" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \wr_pntr_gc[3]_i_1 
       (.I0(I4[3]),
        .I1(I4[4]),
        .O(p_0_in2_out[3]));
FDCE #(
    .INIT(1'b0)) 
     \wr_pntr_gc_reg[0] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .CLR(I6),
        .D(p_0_in2_out[0]),
        .Q(wr_pntr_gc[0]));
FDCE #(
    .INIT(1'b0)) 
     \wr_pntr_gc_reg[1] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .CLR(I6),
        .D(p_0_in2_out[1]),
        .Q(wr_pntr_gc[1]));
FDCE #(
    .INIT(1'b0)) 
     \wr_pntr_gc_reg[2] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .CLR(I6),
        .D(p_0_in2_out[2]),
        .Q(wr_pntr_gc[2]));
FDCE #(
    .INIT(1'b0)) 
     \wr_pntr_gc_reg[3] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .CLR(I6),
        .D(p_0_in2_out[3]),
        .Q(wr_pntr_gc[3]));
FDCE #(
    .INIT(1'b0)) 
     \wr_pntr_gc_reg[4] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .CLR(I6),
        .D(I4[4]),
        .Q(wr_pntr_gc[4]));
endmodule

module axis_clock_converter_div2dmem
   (D,
    I1,
    m_axis_aclk,
    E,
    DI,
    s_axis_aclk,
    O3,
    Q);
  output [100:0]D;
  input I1;
  input m_axis_aclk;
  input [0:0]E;
  input [100:0]DI;
  input s_axis_aclk;
  input [4:0]O3;
  input [4:0]Q;

  wire \<const0> ;
  wire [100:0]D;
  wire [100:0]DI;
  wire [0:0]E;
  wire I1;
  wire [4:0]O3;
  wire [4:0]Q;
  wire m_axis_aclk;
  wire [100:0]p_0_out;
  wire s_axis_aclk;
  wire [1:0]NLW_RAM_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_12_17_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_18_23_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_24_29_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_30_35_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_36_41_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_42_47_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_48_53_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_54_59_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_60_65_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_66_71_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_6_11_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_72_77_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_78_83_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_84_89_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_90_95_DOD_UNCONNECTED;
  wire [1:1]NLW_RAM_reg_0_31_96_100_DOC_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_96_100_DOD_UNCONNECTED;

GND GND
       (.G(\<const0> ));
RAM32M RAM_reg_0_31_0_5
       (.ADDRA(O3),
        .ADDRB(O3),
        .ADDRC(O3),
        .ADDRD(Q),
        .DIA(DI[1:0]),
        .DIB(DI[3:2]),
        .DIC(DI[5:4]),
        .DID({\<const0> ,\<const0> }),
        .DOA(p_0_out[1:0]),
        .DOB(p_0_out[3:2]),
        .DOC(p_0_out[5:4]),
        .DOD(NLW_RAM_reg_0_31_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(s_axis_aclk),
        .WE(E));
RAM32M RAM_reg_0_31_12_17
       (.ADDRA(O3),
        .ADDRB(O3),
        .ADDRC(O3),
        .ADDRD(Q),
        .DIA(DI[13:12]),
        .DIB(DI[15:14]),
        .DIC(DI[17:16]),
        .DID({\<const0> ,\<const0> }),
        .DOA(p_0_out[13:12]),
        .DOB(p_0_out[15:14]),
        .DOC(p_0_out[17:16]),
        .DOD(NLW_RAM_reg_0_31_12_17_DOD_UNCONNECTED[1:0]),
        .WCLK(s_axis_aclk),
        .WE(E));
RAM32M RAM_reg_0_31_18_23
       (.ADDRA(O3),
        .ADDRB(O3),
        .ADDRC(O3),
        .ADDRD(Q),
        .DIA(DI[19:18]),
        .DIB(DI[21:20]),
        .DIC(DI[23:22]),
        .DID({\<const0> ,\<const0> }),
        .DOA(p_0_out[19:18]),
        .DOB(p_0_out[21:20]),
        .DOC(p_0_out[23:22]),
        .DOD(NLW_RAM_reg_0_31_18_23_DOD_UNCONNECTED[1:0]),
        .WCLK(s_axis_aclk),
        .WE(E));
RAM32M RAM_reg_0_31_24_29
       (.ADDRA(O3),
        .ADDRB(O3),
        .ADDRC(O3),
        .ADDRD(Q),
        .DIA(DI[25:24]),
        .DIB(DI[27:26]),
        .DIC(DI[29:28]),
        .DID({\<const0> ,\<const0> }),
        .DOA(p_0_out[25:24]),
        .DOB(p_0_out[27:26]),
        .DOC(p_0_out[29:28]),
        .DOD(NLW_RAM_reg_0_31_24_29_DOD_UNCONNECTED[1:0]),
        .WCLK(s_axis_aclk),
        .WE(E));
RAM32M RAM_reg_0_31_30_35
       (.ADDRA(O3),
        .ADDRB(O3),
        .ADDRC(O3),
        .ADDRD(Q),
        .DIA(DI[31:30]),
        .DIB(DI[33:32]),
        .DIC(DI[35:34]),
        .DID({\<const0> ,\<const0> }),
        .DOA(p_0_out[31:30]),
        .DOB(p_0_out[33:32]),
        .DOC(p_0_out[35:34]),
        .DOD(NLW_RAM_reg_0_31_30_35_DOD_UNCONNECTED[1:0]),
        .WCLK(s_axis_aclk),
        .WE(E));
RAM32M RAM_reg_0_31_36_41
       (.ADDRA(O3),
        .ADDRB(O3),
        .ADDRC(O3),
        .ADDRD(Q),
        .DIA(DI[37:36]),
        .DIB(DI[39:38]),
        .DIC(DI[41:40]),
        .DID({\<const0> ,\<const0> }),
        .DOA(p_0_out[37:36]),
        .DOB(p_0_out[39:38]),
        .DOC(p_0_out[41:40]),
        .DOD(NLW_RAM_reg_0_31_36_41_DOD_UNCONNECTED[1:0]),
        .WCLK(s_axis_aclk),
        .WE(E));
RAM32M RAM_reg_0_31_42_47
       (.ADDRA(O3),
        .ADDRB(O3),
        .ADDRC(O3),
        .ADDRD(Q),
        .DIA(DI[43:42]),
        .DIB(DI[45:44]),
        .DIC(DI[47:46]),
        .DID({\<const0> ,\<const0> }),
        .DOA(p_0_out[43:42]),
        .DOB(p_0_out[45:44]),
        .DOC(p_0_out[47:46]),
        .DOD(NLW_RAM_reg_0_31_42_47_DOD_UNCONNECTED[1:0]),
        .WCLK(s_axis_aclk),
        .WE(E));
RAM32M RAM_reg_0_31_48_53
       (.ADDRA(O3),
        .ADDRB(O3),
        .ADDRC(O3),
        .ADDRD(Q),
        .DIA(DI[49:48]),
        .DIB(DI[51:50]),
        .DIC(DI[53:52]),
        .DID({\<const0> ,\<const0> }),
        .DOA(p_0_out[49:48]),
        .DOB(p_0_out[51:50]),
        .DOC(p_0_out[53:52]),
        .DOD(NLW_RAM_reg_0_31_48_53_DOD_UNCONNECTED[1:0]),
        .WCLK(s_axis_aclk),
        .WE(E));
RAM32M RAM_reg_0_31_54_59
       (.ADDRA(O3),
        .ADDRB(O3),
        .ADDRC(O3),
        .ADDRD(Q),
        .DIA(DI[55:54]),
        .DIB(DI[57:56]),
        .DIC(DI[59:58]),
        .DID({\<const0> ,\<const0> }),
        .DOA(p_0_out[55:54]),
        .DOB(p_0_out[57:56]),
        .DOC(p_0_out[59:58]),
        .DOD(NLW_RAM_reg_0_31_54_59_DOD_UNCONNECTED[1:0]),
        .WCLK(s_axis_aclk),
        .WE(E));
RAM32M RAM_reg_0_31_60_65
       (.ADDRA(O3),
        .ADDRB(O3),
        .ADDRC(O3),
        .ADDRD(Q),
        .DIA(DI[61:60]),
        .DIB(DI[63:62]),
        .DIC(DI[65:64]),
        .DID({\<const0> ,\<const0> }),
        .DOA(p_0_out[61:60]),
        .DOB(p_0_out[63:62]),
        .DOC(p_0_out[65:64]),
        .DOD(NLW_RAM_reg_0_31_60_65_DOD_UNCONNECTED[1:0]),
        .WCLK(s_axis_aclk),
        .WE(E));
RAM32M RAM_reg_0_31_66_71
       (.ADDRA(O3),
        .ADDRB(O3),
        .ADDRC(O3),
        .ADDRD(Q),
        .DIA(DI[67:66]),
        .DIB(DI[69:68]),
        .DIC(DI[71:70]),
        .DID({\<const0> ,\<const0> }),
        .DOA(p_0_out[67:66]),
        .DOB(p_0_out[69:68]),
        .DOC(p_0_out[71:70]),
        .DOD(NLW_RAM_reg_0_31_66_71_DOD_UNCONNECTED[1:0]),
        .WCLK(s_axis_aclk),
        .WE(E));
RAM32M RAM_reg_0_31_6_11
       (.ADDRA(O3),
        .ADDRB(O3),
        .ADDRC(O3),
        .ADDRD(Q),
        .DIA(DI[7:6]),
        .DIB(DI[9:8]),
        .DIC(DI[11:10]),
        .DID({\<const0> ,\<const0> }),
        .DOA(p_0_out[7:6]),
        .DOB(p_0_out[9:8]),
        .DOC(p_0_out[11:10]),
        .DOD(NLW_RAM_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(s_axis_aclk),
        .WE(E));
RAM32M RAM_reg_0_31_72_77
       (.ADDRA(O3),
        .ADDRB(O3),
        .ADDRC(O3),
        .ADDRD(Q),
        .DIA(DI[73:72]),
        .DIB(DI[75:74]),
        .DIC(DI[77:76]),
        .DID({\<const0> ,\<const0> }),
        .DOA(p_0_out[73:72]),
        .DOB(p_0_out[75:74]),
        .DOC(p_0_out[77:76]),
        .DOD(NLW_RAM_reg_0_31_72_77_DOD_UNCONNECTED[1:0]),
        .WCLK(s_axis_aclk),
        .WE(E));
RAM32M RAM_reg_0_31_78_83
       (.ADDRA(O3),
        .ADDRB(O3),
        .ADDRC(O3),
        .ADDRD(Q),
        .DIA(DI[79:78]),
        .DIB(DI[81:80]),
        .DIC(DI[83:82]),
        .DID({\<const0> ,\<const0> }),
        .DOA(p_0_out[79:78]),
        .DOB(p_0_out[81:80]),
        .DOC(p_0_out[83:82]),
        .DOD(NLW_RAM_reg_0_31_78_83_DOD_UNCONNECTED[1:0]),
        .WCLK(s_axis_aclk),
        .WE(E));
RAM32M RAM_reg_0_31_84_89
       (.ADDRA(O3),
        .ADDRB(O3),
        .ADDRC(O3),
        .ADDRD(Q),
        .DIA(DI[85:84]),
        .DIB(DI[87:86]),
        .DIC(DI[89:88]),
        .DID({\<const0> ,\<const0> }),
        .DOA(p_0_out[85:84]),
        .DOB(p_0_out[87:86]),
        .DOC(p_0_out[89:88]),
        .DOD(NLW_RAM_reg_0_31_84_89_DOD_UNCONNECTED[1:0]),
        .WCLK(s_axis_aclk),
        .WE(E));
RAM32M RAM_reg_0_31_90_95
       (.ADDRA(O3),
        .ADDRB(O3),
        .ADDRC(O3),
        .ADDRD(Q),
        .DIA(DI[91:90]),
        .DIB(DI[93:92]),
        .DIC(DI[95:94]),
        .DID({\<const0> ,\<const0> }),
        .DOA(p_0_out[91:90]),
        .DOB(p_0_out[93:92]),
        .DOC(p_0_out[95:94]),
        .DOD(NLW_RAM_reg_0_31_90_95_DOD_UNCONNECTED[1:0]),
        .WCLK(s_axis_aclk),
        .WE(E));
RAM32M RAM_reg_0_31_96_100
       (.ADDRA(O3),
        .ADDRB(O3),
        .ADDRC(O3),
        .ADDRD(Q),
        .DIA(DI[97:96]),
        .DIB(DI[99:98]),
        .DIC({\<const0> ,DI[100]}),
        .DID({\<const0> ,\<const0> }),
        .DOA(p_0_out[97:96]),
        .DOB(p_0_out[99:98]),
        .DOC({NLW_RAM_reg_0_31_96_100_DOC_UNCONNECTED[1],p_0_out[100]}),
        .DOD(NLW_RAM_reg_0_31_96_100_DOD_UNCONNECTED[1:0]),
        .WCLK(s_axis_aclk),
        .WE(E));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[0] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[0]),
        .Q(D[0]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[100] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[100]),
        .Q(D[100]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[10] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[10]),
        .Q(D[10]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[11] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[11]),
        .Q(D[11]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[12] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[12]),
        .Q(D[12]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[13] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[13]),
        .Q(D[13]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[14] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[14]),
        .Q(D[14]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[15] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[15]),
        .Q(D[15]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[16] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[16]),
        .Q(D[16]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[17] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[17]),
        .Q(D[17]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[18] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[18]),
        .Q(D[18]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[19] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[19]),
        .Q(D[19]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[1] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[1]),
        .Q(D[1]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[20] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[20]),
        .Q(D[20]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[21] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[21]),
        .Q(D[21]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[22] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[22]),
        .Q(D[22]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[23] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[23]),
        .Q(D[23]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[24] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[24]),
        .Q(D[24]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[25] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[25]),
        .Q(D[25]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[26] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[26]),
        .Q(D[26]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[27] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[27]),
        .Q(D[27]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[28] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[28]),
        .Q(D[28]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[29] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[29]),
        .Q(D[29]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[2] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[2]),
        .Q(D[2]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[30] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[30]),
        .Q(D[30]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[31] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[31]),
        .Q(D[31]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[32] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[32]),
        .Q(D[32]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[33] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[33]),
        .Q(D[33]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[34] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[34]),
        .Q(D[34]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[35] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[35]),
        .Q(D[35]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[36] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[36]),
        .Q(D[36]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[37] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[37]),
        .Q(D[37]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[38] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[38]),
        .Q(D[38]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[39] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[39]),
        .Q(D[39]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[3] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[3]),
        .Q(D[3]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[40] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[40]),
        .Q(D[40]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[41] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[41]),
        .Q(D[41]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[42] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[42]),
        .Q(D[42]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[43] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[43]),
        .Q(D[43]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[44] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[44]),
        .Q(D[44]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[45] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[45]),
        .Q(D[45]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[46] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[46]),
        .Q(D[46]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[47] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[47]),
        .Q(D[47]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[48] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[48]),
        .Q(D[48]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[49] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[49]),
        .Q(D[49]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[4] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[4]),
        .Q(D[4]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[50] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[50]),
        .Q(D[50]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[51] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[51]),
        .Q(D[51]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[52] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[52]),
        .Q(D[52]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[53] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[53]),
        .Q(D[53]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[54] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[54]),
        .Q(D[54]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[55] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[55]),
        .Q(D[55]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[56] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[56]),
        .Q(D[56]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[57] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[57]),
        .Q(D[57]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[58] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[58]),
        .Q(D[58]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[59] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[59]),
        .Q(D[59]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[5] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[5]),
        .Q(D[5]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[60] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[60]),
        .Q(D[60]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[61] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[61]),
        .Q(D[61]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[62] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[62]),
        .Q(D[62]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[63] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[63]),
        .Q(D[63]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[64] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[64]),
        .Q(D[64]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[65] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[65]),
        .Q(D[65]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[66] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[66]),
        .Q(D[66]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[67] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[67]),
        .Q(D[67]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[68] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[68]),
        .Q(D[68]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[69] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[69]),
        .Q(D[69]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[6] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[6]),
        .Q(D[6]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[70] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[70]),
        .Q(D[70]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[71] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[71]),
        .Q(D[71]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[72] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[72]),
        .Q(D[72]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[73] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[73]),
        .Q(D[73]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[74] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[74]),
        .Q(D[74]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[75] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[75]),
        .Q(D[75]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[76] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[76]),
        .Q(D[76]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[77] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[77]),
        .Q(D[77]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[78] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[78]),
        .Q(D[78]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[79] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[79]),
        .Q(D[79]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[7] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[7]),
        .Q(D[7]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[80] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[80]),
        .Q(D[80]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[81] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[81]),
        .Q(D[81]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[82] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[82]),
        .Q(D[82]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[83] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[83]),
        .Q(D[83]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[84] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[84]),
        .Q(D[84]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[85] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[85]),
        .Q(D[85]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[86] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[86]),
        .Q(D[86]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[87] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[87]),
        .Q(D[87]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[88] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[88]),
        .Q(D[88]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[89] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[89]),
        .Q(D[89]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[8] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[8]),
        .Q(D[8]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[90] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[90]),
        .Q(D[90]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[91] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[91]),
        .Q(D[91]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[92] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[92]),
        .Q(D[92]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[93] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[93]),
        .Q(D[93]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[94] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[94]),
        .Q(D[94]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[95] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[95]),
        .Q(D[95]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[96] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[96]),
        .Q(D[96]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[97] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[97]),
        .Q(D[97]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[98] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[98]),
        .Q(D[98]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[99] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[99]),
        .Q(D[99]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \gpr1.dout_i_reg[9] 
       (.C(m_axis_aclk),
        .CE(I1),
        .D(p_0_out[9]),
        .Q(D[9]),
        .R(\<const0> ));
endmodule

module axis_clock_converter_div2fifo_generator_ramfifo
   (s_axis_tready,
    m_axis_tvalid,
    Q,
    s_axis_aclk,
    m_axis_aclk,
    m_axis_tready,
    s_axis_tvalid,
    I1,
    DI);
  output s_axis_tready;
  output m_axis_tvalid;
  output [100:0]Q;
  input s_axis_aclk;
  input m_axis_aclk;
  input m_axis_tready;
  input s_axis_tvalid;
  input I1;
  input [100:0]DI;

  wire [100:0]DI;
  wire I1;
  wire [100:0]Q;
  wire RD_RST;
  wire RST;
  wire m_axis_aclk;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire \n_0_gntv_or_sync_fifo.gcx.clkx ;
  wire \n_0_gntv_or_sync_fifo.gl0.rd ;
  wire \n_12_gntv_or_sync_fifo.gl0.rd ;
  wire \n_13_gntv_or_sync_fifo.gl0.rd ;
  wire \n_14_gntv_or_sync_fifo.gl0.rd ;
  wire \n_15_gntv_or_sync_fifo.gl0.rd ;
  wire \n_2_gntv_or_sync_fifo.gcx.clkx ;
  wire n_2_rstblk;
  wire \n_3_gntv_or_sync_fifo.gcx.clkx ;
  wire \n_6_gntv_or_sync_fifo.gl0.rd ;
  wire n_6_rstblk;
  wire \n_7_gntv_or_sync_fifo.gcx.clkx ;
  wire [4:2]p_0_out;
  wire [4:0]p_19_out;
  wire [3:3]p_1_out;
  wire p_3_out;
  wire [4:0]p_8_out;
  wire [4:0]rd_pntr_plus1;
  wire [0:0]rd_rst_i;
  wire rst_d2;
  wire rst_full_gen_i;
  wire s_axis_aclk;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire [4:0]wr_pntr_plus1;
  wire [1:0]wr_pntr_plus2;

axis_clock_converter_div2clk_x_pntrs \gntv_or_sync_fifo.gcx.clkx 
       (.D({\n_12_gntv_or_sync_fifo.gl0.rd ,\n_13_gntv_or_sync_fifo.gl0.rd ,\n_14_gntv_or_sync_fifo.gl0.rd ,\n_15_gntv_or_sync_fifo.gl0.rd }),
        .I1({rd_pntr_plus1[4],rd_pntr_plus1[2:0]}),
        .I2(wr_pntr_plus2),
        .I3({wr_pntr_plus1[4],wr_pntr_plus1[2:0]}),
        .I4(p_8_out),
        .I5(RD_RST),
        .I6(n_6_rstblk),
        .O1(\n_0_gntv_or_sync_fifo.gcx.clkx ),
        .O2(\n_2_gntv_or_sync_fifo.gcx.clkx ),
        .O3({p_19_out[4],p_19_out[2:0]}),
        .O4(\n_3_gntv_or_sync_fifo.gcx.clkx ),
        .O5(p_0_out),
        .O6(\n_7_gntv_or_sync_fifo.gcx.clkx ),
        .Q(p_1_out),
        .m_axis_aclk(m_axis_aclk),
        .s_axis_aclk(s_axis_aclk));
axis_clock_converter_div2rd_logic \gntv_or_sync_fifo.gl0.rd 
       (.D({\n_12_gntv_or_sync_fifo.gl0.rd ,\n_13_gntv_or_sync_fifo.gl0.rd ,\n_14_gntv_or_sync_fifo.gl0.rd ,\n_15_gntv_or_sync_fifo.gl0.rd }),
        .E(\n_6_gntv_or_sync_fifo.gl0.rd ),
        .I1(\n_2_gntv_or_sync_fifo.gcx.clkx ),
        .I2(p_1_out),
        .I3(\n_0_gntv_or_sync_fifo.gcx.clkx ),
        .O1(\n_0_gntv_or_sync_fifo.gl0.rd ),
        .O2({rd_pntr_plus1[4],rd_pntr_plus1[2:0]}),
        .O3(p_19_out),
        .Q({n_2_rstblk,rd_rst_i}),
        .m_axis_aclk(m_axis_aclk),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid));
axis_clock_converter_div2wr_logic \gntv_or_sync_fifo.gl0.wr 
       (.E(p_3_out),
        .I1(\n_3_gntv_or_sync_fifo.gcx.clkx ),
        .I2(\n_7_gntv_or_sync_fifo.gcx.clkx ),
        .I3(RST),
        .O1({wr_pntr_plus1[4],wr_pntr_plus1[2:0]}),
        .O2(p_8_out),
        .O5(p_0_out),
        .Q(wr_pntr_plus2),
        .rst_d2(rst_d2),
        .rst_full_gen_i(rst_full_gen_i),
        .s_axis_aclk(s_axis_aclk),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
axis_clock_converter_div2memory \gntv_or_sync_fifo.mem 
       (.DI(DI),
        .E(p_3_out),
        .I1(\n_0_gntv_or_sync_fifo.gl0.rd ),
        .I2(\n_6_gntv_or_sync_fifo.gl0.rd ),
        .O1(Q),
        .O3(p_19_out),
        .Q(p_8_out),
        .m_axis_aclk(m_axis_aclk),
        .s_axis_aclk(s_axis_aclk));
axis_clock_converter_div2reset_blk_ramfifo rstblk
       (.I1(I1),
        .O1({RST,n_6_rstblk}),
        .Q({n_2_rstblk,RD_RST,rd_rst_i}),
        .m_axis_aclk(m_axis_aclk),
        .rst_d2(rst_d2),
        .rst_full_gen_i(rst_full_gen_i),
        .s_axis_aclk(s_axis_aclk));
endmodule

module axis_clock_converter_div2fifo_generator_top
   (s_axis_tready,
    m_axis_tvalid,
    Q,
    s_axis_aclk,
    m_axis_aclk,
    m_axis_tready,
    s_axis_tvalid,
    I1,
    DI);
  output s_axis_tready;
  output m_axis_tvalid;
  output [100:0]Q;
  input s_axis_aclk;
  input m_axis_aclk;
  input m_axis_tready;
  input s_axis_tvalid;
  input I1;
  input [100:0]DI;

  wire [100:0]DI;
  wire I1;
  wire [100:0]Q;
  wire m_axis_aclk;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire s_axis_aclk;
  wire s_axis_tready;
  wire s_axis_tvalid;

axis_clock_converter_div2fifo_generator_ramfifo \grf.rf 
       (.DI(DI),
        .I1(I1),
        .Q(Q),
        .m_axis_aclk(m_axis_aclk),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_axis_aclk(s_axis_aclk),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

module axis_clock_converter_div2fifo_generator_v11_0
   (s_axis_tready,
    m_axis_tvalid,
    Q,
    s_axis_aclk,
    m_axis_aclk,
    m_axis_tready,
    s_axis_tvalid,
    I1,
    DI);
  output s_axis_tready;
  output m_axis_tvalid;
  output [100:0]Q;
  input s_axis_aclk;
  input m_axis_aclk;
  input m_axis_tready;
  input s_axis_tvalid;
  input I1;
  input [100:0]DI;

  wire [100:0]DI;
  wire I1;
  wire [100:0]Q;
  wire m_axis_aclk;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire s_axis_aclk;
  wire s_axis_tready;
  wire s_axis_tvalid;

axis_clock_converter_div2fifo_generator_v11_0_synth inst_fifo_gen
       (.DI(DI),
        .I1(I1),
        .Q(Q),
        .m_axis_aclk(m_axis_aclk),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_axis_aclk(s_axis_aclk),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

module axis_clock_converter_div2fifo_generator_v11_0_synth
   (s_axis_tready,
    m_axis_tvalid,
    Q,
    s_axis_aclk,
    m_axis_aclk,
    m_axis_tready,
    s_axis_tvalid,
    I1,
    DI);
  output s_axis_tready;
  output m_axis_tvalid;
  output [100:0]Q;
  input s_axis_aclk;
  input m_axis_aclk;
  input m_axis_tready;
  input s_axis_tvalid;
  input I1;
  input [100:0]DI;

  wire [100:0]DI;
  wire I1;
  wire [100:0]Q;
  wire m_axis_aclk;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire s_axis_aclk;
  wire s_axis_tready;
  wire s_axis_tvalid;

axis_clock_converter_div2fifo_generator_top \gaxis_fifo.gaxisf.axisf 
       (.DI(DI),
        .I1(I1),
        .Q(Q),
        .m_axis_aclk(m_axis_aclk),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_axis_aclk(s_axis_aclk),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

module axis_clock_converter_div2memory
   (O1,
    I1,
    m_axis_aclk,
    E,
    DI,
    s_axis_aclk,
    O3,
    Q,
    I2);
  output [100:0]O1;
  input I1;
  input m_axis_aclk;
  input [0:0]E;
  input [100:0]DI;
  input s_axis_aclk;
  input [4:0]O3;
  input [4:0]Q;
  input [0:0]I2;

  wire \<const0> ;
  wire [100:0]DI;
  wire [0:0]E;
  wire I1;
  wire [0:0]I2;
  wire [100:0]O1;
  wire [4:0]O3;
  wire [4:0]Q;
  wire m_axis_aclk;
  wire [100:0]p_0_out;
  wire s_axis_aclk;

GND GND
       (.G(\<const0> ));
axis_clock_converter_div2dmem \gdm.dm 
       (.D(p_0_out),
        .DI(DI),
        .E(E),
        .I1(I1),
        .O3(O3),
        .Q(Q),
        .m_axis_aclk(m_axis_aclk),
        .s_axis_aclk(s_axis_aclk));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[0] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[0]),
        .Q(O1[0]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[100] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[100]),
        .Q(O1[100]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[10] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[10]),
        .Q(O1[10]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[11] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[11]),
        .Q(O1[11]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[12] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[12]),
        .Q(O1[12]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[13] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[13]),
        .Q(O1[13]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[14] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[14]),
        .Q(O1[14]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[15] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[15]),
        .Q(O1[15]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[16] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[16]),
        .Q(O1[16]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[17] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[17]),
        .Q(O1[17]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[18] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[18]),
        .Q(O1[18]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[19] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[19]),
        .Q(O1[19]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[1] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[1]),
        .Q(O1[1]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[20] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[20]),
        .Q(O1[20]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[21] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[21]),
        .Q(O1[21]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[22] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[22]),
        .Q(O1[22]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[23] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[23]),
        .Q(O1[23]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[24] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[24]),
        .Q(O1[24]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[25] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[25]),
        .Q(O1[25]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[26] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[26]),
        .Q(O1[26]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[27] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[27]),
        .Q(O1[27]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[28] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[28]),
        .Q(O1[28]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[29] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[29]),
        .Q(O1[29]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[2] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[2]),
        .Q(O1[2]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[30] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[30]),
        .Q(O1[30]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[31] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[31]),
        .Q(O1[31]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[32] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[32]),
        .Q(O1[32]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[33] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[33]),
        .Q(O1[33]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[34] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[34]),
        .Q(O1[34]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[35] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[35]),
        .Q(O1[35]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[36] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[36]),
        .Q(O1[36]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[37] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[37]),
        .Q(O1[37]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[38] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[38]),
        .Q(O1[38]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[39] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[39]),
        .Q(O1[39]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[3] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[3]),
        .Q(O1[3]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[40] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[40]),
        .Q(O1[40]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[41] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[41]),
        .Q(O1[41]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[42] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[42]),
        .Q(O1[42]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[43] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[43]),
        .Q(O1[43]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[44] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[44]),
        .Q(O1[44]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[45] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[45]),
        .Q(O1[45]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[46] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[46]),
        .Q(O1[46]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[47] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[47]),
        .Q(O1[47]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[48] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[48]),
        .Q(O1[48]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[49] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[49]),
        .Q(O1[49]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[4] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[4]),
        .Q(O1[4]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[50] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[50]),
        .Q(O1[50]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[51] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[51]),
        .Q(O1[51]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[52] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[52]),
        .Q(O1[52]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[53] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[53]),
        .Q(O1[53]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[54] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[54]),
        .Q(O1[54]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[55] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[55]),
        .Q(O1[55]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[56] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[56]),
        .Q(O1[56]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[57] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[57]),
        .Q(O1[57]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[58] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[58]),
        .Q(O1[58]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[59] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[59]),
        .Q(O1[59]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[5] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[5]),
        .Q(O1[5]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[60] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[60]),
        .Q(O1[60]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[61] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[61]),
        .Q(O1[61]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[62] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[62]),
        .Q(O1[62]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[63] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[63]),
        .Q(O1[63]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[64] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[64]),
        .Q(O1[64]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[65] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[65]),
        .Q(O1[65]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[66] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[66]),
        .Q(O1[66]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[67] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[67]),
        .Q(O1[67]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[68] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[68]),
        .Q(O1[68]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[69] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[69]),
        .Q(O1[69]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[6] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[6]),
        .Q(O1[6]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[70] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[70]),
        .Q(O1[70]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[71] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[71]),
        .Q(O1[71]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[72] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[72]),
        .Q(O1[72]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[73] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[73]),
        .Q(O1[73]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[74] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[74]),
        .Q(O1[74]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[75] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[75]),
        .Q(O1[75]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[76] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[76]),
        .Q(O1[76]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[77] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[77]),
        .Q(O1[77]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[78] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[78]),
        .Q(O1[78]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[79] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[79]),
        .Q(O1[79]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[7] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[7]),
        .Q(O1[7]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[80] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[80]),
        .Q(O1[80]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[81] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[81]),
        .Q(O1[81]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[82] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[82]),
        .Q(O1[82]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[83] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[83]),
        .Q(O1[83]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[84] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[84]),
        .Q(O1[84]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[85] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[85]),
        .Q(O1[85]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[86] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[86]),
        .Q(O1[86]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[87] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[87]),
        .Q(O1[87]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[88] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[88]),
        .Q(O1[88]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[89] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[89]),
        .Q(O1[89]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[8] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[8]),
        .Q(O1[8]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[90] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[90]),
        .Q(O1[90]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[91] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[91]),
        .Q(O1[91]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[92] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[92]),
        .Q(O1[92]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[93] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[93]),
        .Q(O1[93]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[94] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[94]),
        .Q(O1[94]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[95] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[95]),
        .Q(O1[95]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[96] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[96]),
        .Q(O1[96]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[97] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[97]),
        .Q(O1[97]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[98] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[98]),
        .Q(O1[98]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[99] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[99]),
        .Q(O1[99]),
        .R(\<const0> ));
FDRE #(
    .INIT(1'b0)) 
     \goreg_dm.dout_i_reg[9] 
       (.C(m_axis_aclk),
        .CE(I2),
        .D(p_0_out[9]),
        .Q(O1[9]),
        .R(\<const0> ));
endmodule

module axis_clock_converter_div2rd_bin_cntr
   (Q,
    O1,
    O2,
    D,
    I1,
    I2,
    I3,
    I4,
    E,
    m_axis_aclk,
    I5);
  output [3:0]Q;
  output O1;
  output [4:0]O2;
  output [3:0]D;
  input I1;
  input I2;
  input [0:0]I3;
  input I4;
  input [0:0]E;
  input m_axis_aclk;
  input [0:0]I5;

  wire [3:0]D;
  wire [0:0]E;
  wire I1;
  wire I2;
  wire [0:0]I3;
  wire I4;
  wire [0:0]I5;
  wire O1;
  wire [4:0]O2;
  wire [3:0]Q;
  wire m_axis_aclk;
  wire [4:0]plusOp;
  wire [3:3]rd_pntr_plus1;

LUT1 #(
    .INIT(2'h1)) 
     \gc0.count[0]_i_1 
       (.I0(Q[0]),
        .O(plusOp[0]));
(* SOFT_HLUTNM = "soft_lutpair1" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \gc0.count[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(plusOp[1]));
(* SOFT_HLUTNM = "soft_lutpair1" *) 
   LUT3 #(
    .INIT(8'h6A)) 
     \gc0.count[2]_i_1 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(plusOp[2]));
(* SOFT_HLUTNM = "soft_lutpair0" *) 
   LUT4 #(
    .INIT(16'h6AAA)) 
     \gc0.count[3]_i_1 
       (.I0(rd_pntr_plus1),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .O(plusOp[3]));
(* SOFT_HLUTNM = "soft_lutpair0" *) 
   LUT5 #(
    .INIT(32'h6AAAAAAA)) 
     \gc0.count[4]_i_1 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(rd_pntr_plus1),
        .O(plusOp[4]));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[0] 
       (.C(m_axis_aclk),
        .CE(E),
        .CLR(I5),
        .D(Q[0]),
        .Q(O2[0]));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[1] 
       (.C(m_axis_aclk),
        .CE(E),
        .CLR(I5),
        .D(Q[1]),
        .Q(O2[1]));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[2] 
       (.C(m_axis_aclk),
        .CE(E),
        .CLR(I5),
        .D(Q[2]),
        .Q(O2[2]));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[3] 
       (.C(m_axis_aclk),
        .CE(E),
        .CLR(I5),
        .D(rd_pntr_plus1),
        .Q(O2[3]));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[4] 
       (.C(m_axis_aclk),
        .CE(E),
        .CLR(I5),
        .D(Q[3]),
        .Q(O2[4]));
(* counter = "2" *) 
   FDPE #(
    .INIT(1'b1)) 
     \gc0.count_reg[0] 
       (.C(m_axis_aclk),
        .CE(E),
        .D(plusOp[0]),
        .PRE(I5),
        .Q(Q[0]));
(* counter = "2" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gc0.count_reg[1] 
       (.C(m_axis_aclk),
        .CE(E),
        .CLR(I5),
        .D(plusOp[1]),
        .Q(Q[1]));
(* counter = "2" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gc0.count_reg[2] 
       (.C(m_axis_aclk),
        .CE(E),
        .CLR(I5),
        .D(plusOp[2]),
        .Q(Q[2]));
(* counter = "2" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gc0.count_reg[3] 
       (.C(m_axis_aclk),
        .CE(E),
        .CLR(I5),
        .D(plusOp[3]),
        .Q(rd_pntr_plus1));
(* counter = "2" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gc0.count_reg[4] 
       (.C(m_axis_aclk),
        .CE(E),
        .CLR(I5),
        .D(plusOp[4]),
        .Q(Q[3]));
LUT6 #(
    .INIT(64'hFF2010FF20201010)) 
     ram_empty_fb_i_i_1
       (.I0(rd_pntr_plus1),
        .I1(I1),
        .I2(I2),
        .I3(O2[3]),
        .I4(I3),
        .I5(I4),
        .O(O1));
LUT2 #(
    .INIT(4'h6)) 
     \rd_pntr_gc[0]_i_1 
       (.I0(O2[1]),
        .I1(O2[0]),
        .O(D[0]));
(* SOFT_HLUTNM = "soft_lutpair2" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \rd_pntr_gc[1]_i_1 
       (.I0(O2[1]),
        .I1(O2[2]),
        .O(D[1]));
(* SOFT_HLUTNM = "soft_lutpair2" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \rd_pntr_gc[2]_i_1 
       (.I0(O2[2]),
        .I1(O2[3]),
        .O(D[2]));
LUT2 #(
    .INIT(4'h6)) 
     \rd_pntr_gc[3]_i_1 
       (.I0(O2[3]),
        .I1(O2[4]),
        .O(D[3]));
endmodule

module axis_clock_converter_div2rd_fwft
   (O1,
    E,
    m_axis_tvalid,
    O2,
    m_axis_aclk,
    Q,
    p_17_out,
    m_axis_tready);
  output O1;
  output [0:0]E;
  output m_axis_tvalid;
  output [0:0]O2;
  input m_axis_aclk;
  input [1:0]Q;
  input p_17_out;
  input m_axis_tready;

  wire \<const1> ;
  wire [0:0]E;
  wire O1;
  wire [0:0]O2;
  wire [1:0]Q;
  wire [0:0]curr_fwft_state;
  wire empty_fwft_fb;
  wire empty_fwft_i;
  wire empty_fwft_i0;
  wire m_axis_aclk;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire \n_0_gpregsm1.curr_fwft_state[1]_i_1 ;
  wire [0:0]next_fwft_state;
  wire p_17_out;
  wire ram_valid_fwft;

VCC VCC
       (.P(\<const1> ));
(* SOFT_HLUTNM = "soft_lutpair5" *) 
   LUT4 #(
    .INIT(16'hCF08)) 
     empty_fwft_fb_i_1
       (.I0(m_axis_tready),
        .I1(curr_fwft_state),
        .I2(ram_valid_fwft),
        .I3(empty_fwft_fb),
        .O(empty_fwft_i0));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     empty_fwft_fb_reg
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .D(empty_fwft_i0),
        .PRE(Q[1]),
        .Q(empty_fwft_fb));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     empty_fwft_i_reg
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .D(empty_fwft_i0),
        .PRE(Q[1]),
        .Q(empty_fwft_i));
(* SOFT_HLUTNM = "soft_lutpair3" *) 
   LUT4 #(
    .INIT(16'h4555)) 
     \gc0.count_d1[4]_i_1 
       (.I0(p_17_out),
        .I1(m_axis_tready),
        .I2(curr_fwft_state),
        .I3(ram_valid_fwft),
        .O(E));
(* SOFT_HLUTNM = "soft_lutpair4" *) 
   LUT4 #(
    .INIT(16'h00D0)) 
     \goreg_dm.dout_i[100]_i_1 
       (.I0(curr_fwft_state),
        .I1(m_axis_tready),
        .I2(ram_valid_fwft),
        .I3(Q[0]),
        .O(O2));
(* SOFT_HLUTNM = "soft_lutpair3" *) 
   LUT4 #(
    .INIT(16'h4555)) 
     \gpr1.dout_i[100]_i_1 
       (.I0(p_17_out),
        .I1(m_axis_tready),
        .I2(curr_fwft_state),
        .I3(ram_valid_fwft),
        .O(O1));
(* SOFT_HLUTNM = "soft_lutpair5" *) 
   LUT3 #(
    .INIT(8'hAE)) 
     \gpregsm1.curr_fwft_state[0]_i_1 
       (.I0(ram_valid_fwft),
        .I1(curr_fwft_state),
        .I2(m_axis_tready),
        .O(next_fwft_state));
(* SOFT_HLUTNM = "soft_lutpair4" *) 
   LUT4 #(
    .INIT(16'h40FF)) 
     \gpregsm1.curr_fwft_state[1]_i_1 
       (.I0(m_axis_tready),
        .I1(curr_fwft_state),
        .I2(ram_valid_fwft),
        .I3(p_17_out),
        .O(\n_0_gpregsm1.curr_fwft_state[1]_i_1 ));
(* equivalent_register_removal = "no" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gpregsm1.curr_fwft_state_reg[0] 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .CLR(Q[1]),
        .D(next_fwft_state),
        .Q(curr_fwft_state));
(* equivalent_register_removal = "no" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gpregsm1.curr_fwft_state_reg[1] 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .CLR(Q[1]),
        .D(\n_0_gpregsm1.curr_fwft_state[1]_i_1 ),
        .Q(ram_valid_fwft));
LUT1 #(
    .INIT(2'h1)) 
     m_axis_tvalid_INST_0
       (.I0(empty_fwft_i),
        .O(m_axis_tvalid));
endmodule

module axis_clock_converter_div2rd_logic
   (O1,
    m_axis_tvalid,
    O2,
    E,
    O3,
    D,
    m_axis_aclk,
    Q,
    m_axis_tready,
    I1,
    I2,
    I3);
  output O1;
  output m_axis_tvalid;
  output [3:0]O2;
  output [0:0]E;
  output [4:0]O3;
  output [3:0]D;
  input m_axis_aclk;
  input [1:0]Q;
  input m_axis_tready;
  input I1;
  input [0:0]I2;
  input I3;

  wire [3:0]D;
  wire [0:0]E;
  wire I1;
  wire [0:0]I2;
  wire I3;
  wire O1;
  wire [3:0]O2;
  wire [4:0]O3;
  wire [1:0]Q;
  wire m_axis_aclk;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire \n_1_gr1.rfwft ;
  wire n_4_rpntr;
  wire p_17_out;

axis_clock_converter_div2rd_fwft \gr1.rfwft 
       (.E(\n_1_gr1.rfwft ),
        .O1(O1),
        .O2(E),
        .Q(Q),
        .m_axis_aclk(m_axis_aclk),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .p_17_out(p_17_out));
axis_clock_converter_div2rd_status_flags_as \gras.rsts 
       (.I1(n_4_rpntr),
        .Q(Q[1]),
        .m_axis_aclk(m_axis_aclk),
        .p_17_out(p_17_out));
axis_clock_converter_div2rd_bin_cntr rpntr
       (.D(D),
        .E(\n_1_gr1.rfwft ),
        .I1(I1),
        .I2(O1),
        .I3(I2),
        .I4(I3),
        .I5(Q[1]),
        .O1(n_4_rpntr),
        .O2(O3),
        .Q(O2),
        .m_axis_aclk(m_axis_aclk));
endmodule

module axis_clock_converter_div2rd_status_flags_as
   (p_17_out,
    I1,
    m_axis_aclk,
    Q);
  output p_17_out;
  input I1;
  input m_axis_aclk;
  input [0:0]Q;

  wire \<const1> ;
  wire I1;
  wire [0:0]Q;
  wire m_axis_aclk;
  wire p_17_out;

VCC VCC
       (.P(\<const1> ));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     ram_empty_fb_i_reg
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .D(I1),
        .PRE(Q),
        .Q(p_17_out));
endmodule

module axis_clock_converter_div2reset_blk_ramfifo
   (rst_full_gen_i,
    rst_d2,
    Q,
    O1,
    s_axis_aclk,
    m_axis_aclk,
    I1);
  output rst_full_gen_i;
  output rst_d2;
  output [2:0]Q;
  output [1:0]O1;
  input s_axis_aclk;
  input m_axis_aclk;
  input I1;

  wire \<const0> ;
  wire \<const1> ;
  wire I1;
  wire [1:0]O1;
  wire [2:0]Q;
  wire inverted_reset;
  wire m_axis_aclk;
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
     \grstd1.grst_full.grst_f.RST_FULL_GEN_i_1 
       (.I0(I1),
        .O(inverted_reset));
FDCE #(
    .INIT(1'b0)) 
     \grstd1.grst_full.grst_f.RST_FULL_GEN_reg 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .CLR(inverted_reset),
        .D(rst_d3),
        .Q(rst_full_gen_i));
(* ASYNC_REG *) 
   (* msgon = "false" *) 
   FDPE #(
    .INIT(1'b1)) 
     \grstd1.grst_full.grst_f.rst_d1_reg 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(\<const0> ),
        .PRE(inverted_reset),
        .Q(rst_d1));
(* ASYNC_REG *) 
   (* msgon = "false" *) 
   FDPE #(
    .INIT(1'b1)) 
     \grstd1.grst_full.grst_f.rst_d2_reg 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(rst_d1),
        .PRE(inverted_reset),
        .Q(rst_d2));
(* ASYNC_REG *) 
   (* msgon = "false" *) 
   FDPE #(
    .INIT(1'b1)) 
     \grstd1.grst_full.grst_f.rst_d3_reg 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(rst_d2),
        .PRE(inverted_reset),
        .Q(rst_d3));
(* ASYNC_REG *) 
   (* msgon = "false" *) 
   FDRE #(
    .INIT(1'b0)) 
     \ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .D(rd_rst_asreg),
        .Q(rd_rst_asreg_d1),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* msgon = "false" *) 
   FDRE #(
    .INIT(1'b0)) 
     \ngwrdrst.grst.g7serrst.rd_rst_asreg_d2_reg 
       (.C(m_axis_aclk),
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
   (* msgon = "false" *) 
   FDPE \ngwrdrst.grst.g7serrst.rd_rst_asreg_reg 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .D(\n_0_ngwrdrst.grst.g7serrst.rd_rst_asreg_i_1 ),
        .PRE(inverted_reset),
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
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .D(\<const0> ),
        .PRE(\n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1 ),
        .Q(Q[0]));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .D(\<const0> ),
        .PRE(\n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1 ),
        .Q(Q[1]));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .D(\<const0> ),
        .PRE(\n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1 ),
        .Q(Q[2]));
(* ASYNC_REG *) 
   (* msgon = "false" *) 
   FDRE #(
    .INIT(1'b0)) 
     \ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(wr_rst_asreg),
        .Q(wr_rst_asreg_d1),
        .R(\<const0> ));
(* ASYNC_REG *) 
   (* msgon = "false" *) 
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
   (* msgon = "false" *) 
   FDPE \ngwrdrst.grst.g7serrst.wr_rst_asreg_reg 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(\n_0_ngwrdrst.grst.g7serrst.wr_rst_asreg_i_1 ),
        .PRE(inverted_reset),
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
     \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(\<const0> ),
        .PRE(\n_0_ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1 ),
        .Q(O1[0]));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(\<const0> ),
        .PRE(\n_0_ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1 ),
        .Q(O1[1]));
endmodule

module axis_clock_converter_div2synchronizer_ff
   (Q,
    D,
    I1,
    s_axis_aclk,
    I6);
  output [0:0]Q;
  output [3:0]D;
  input [4:0]I1;
  input s_axis_aclk;
  input [0:0]I6;

  wire \<const1> ;
  wire [3:0]D;
  wire [4:0]I1;
  wire [0:0]I6;
  wire [0:0]Q;
  wire \n_0_Q_reg_reg[0] ;
  wire \n_0_Q_reg_reg[1] ;
  wire \n_0_Q_reg_reg[2] ;
  wire \n_0_Q_reg_reg[3] ;
  wire s_axis_aclk;

(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDCE #(
    .INIT(1'b0)) 
     \Q_reg_reg[0] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .CLR(I6),
        .D(I1[0]),
        .Q(\n_0_Q_reg_reg[0] ));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDCE #(
    .INIT(1'b0)) 
     \Q_reg_reg[1] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .CLR(I6),
        .D(I1[1]),
        .Q(\n_0_Q_reg_reg[1] ));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDCE #(
    .INIT(1'b0)) 
     \Q_reg_reg[2] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .CLR(I6),
        .D(I1[2]),
        .Q(\n_0_Q_reg_reg[2] ));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDCE #(
    .INIT(1'b0)) 
     \Q_reg_reg[3] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .CLR(I6),
        .D(I1[3]),
        .Q(\n_0_Q_reg_reg[3] ));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDCE #(
    .INIT(1'b0)) 
     \Q_reg_reg[4] 
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .CLR(I6),
        .D(I1[4]),
        .Q(Q));
VCC VCC
       (.P(\<const1> ));
(* SOFT_HLUTNM = "soft_lutpair6" *) 
   LUT5 #(
    .INIT(32'h96696996)) 
     \rd_pntr_bin[0]_i_1 
       (.I0(\n_0_Q_reg_reg[2] ),
        .I1(\n_0_Q_reg_reg[3] ),
        .I2(\n_0_Q_reg_reg[0] ),
        .I3(\n_0_Q_reg_reg[1] ),
        .I4(Q),
        .O(D[0]));
(* SOFT_HLUTNM = "soft_lutpair6" *) 
   LUT4 #(
    .INIT(16'h6996)) 
     \rd_pntr_bin[1]_i_1 
       (.I0(\n_0_Q_reg_reg[2] ),
        .I1(\n_0_Q_reg_reg[1] ),
        .I2(Q),
        .I3(\n_0_Q_reg_reg[3] ),
        .O(D[1]));
(* SOFT_HLUTNM = "soft_lutpair7" *) 
   LUT3 #(
    .INIT(8'h96)) 
     \rd_pntr_bin[2]_i_1 
       (.I0(\n_0_Q_reg_reg[3] ),
        .I1(\n_0_Q_reg_reg[2] ),
        .I2(Q),
        .O(D[2]));
(* SOFT_HLUTNM = "soft_lutpair7" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \rd_pntr_bin[3]_i_1 
       (.I0(\n_0_Q_reg_reg[3] ),
        .I1(Q),
        .O(D[3]));
endmodule

(* ORIG_REF_NAME = "synchronizer_ff" *) 
module axis_clock_converter_div2synchronizer_ff_0
   (p_0_in,
    Q,
    m_axis_aclk,
    I5);
  output [4:0]p_0_in;
  input [4:0]Q;
  input m_axis_aclk;
  input [0:0]I5;

  wire \<const1> ;
  wire [0:0]I5;
  wire [4:0]Q;
  wire m_axis_aclk;
  wire \n_0_Q_reg_reg[0] ;
  wire \n_0_Q_reg_reg[1] ;
  wire \n_0_Q_reg_reg[2] ;
  wire \n_0_Q_reg_reg[3] ;
  wire [4:0]p_0_in;

(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDCE #(
    .INIT(1'b0)) 
     \Q_reg_reg[0] 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .CLR(I5),
        .D(Q[0]),
        .Q(\n_0_Q_reg_reg[0] ));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDCE #(
    .INIT(1'b0)) 
     \Q_reg_reg[1] 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .CLR(I5),
        .D(Q[1]),
        .Q(\n_0_Q_reg_reg[1] ));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDCE #(
    .INIT(1'b0)) 
     \Q_reg_reg[2] 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .CLR(I5),
        .D(Q[2]),
        .Q(\n_0_Q_reg_reg[2] ));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDCE #(
    .INIT(1'b0)) 
     \Q_reg_reg[3] 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .CLR(I5),
        .D(Q[3]),
        .Q(\n_0_Q_reg_reg[3] ));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDCE #(
    .INIT(1'b0)) 
     \Q_reg_reg[4] 
       (.C(m_axis_aclk),
        .CE(\<const1> ),
        .CLR(I5),
        .D(Q[4]),
        .Q(p_0_in[4]));
VCC VCC
       (.P(\<const1> ));
(* SOFT_HLUTNM = "soft_lutpair8" *) 
   LUT5 #(
    .INIT(32'h96696996)) 
     \wr_pntr_bin[0]_i_1 
       (.I0(\n_0_Q_reg_reg[2] ),
        .I1(\n_0_Q_reg_reg[3] ),
        .I2(\n_0_Q_reg_reg[0] ),
        .I3(\n_0_Q_reg_reg[1] ),
        .I4(p_0_in[4]),
        .O(p_0_in[0]));
(* SOFT_HLUTNM = "soft_lutpair8" *) 
   LUT4 #(
    .INIT(16'h6996)) 
     \wr_pntr_bin[1]_i_1 
       (.I0(\n_0_Q_reg_reg[2] ),
        .I1(\n_0_Q_reg_reg[1] ),
        .I2(p_0_in[4]),
        .I3(\n_0_Q_reg_reg[3] ),
        .O(p_0_in[1]));
(* SOFT_HLUTNM = "soft_lutpair9" *) 
   LUT3 #(
    .INIT(8'h96)) 
     \wr_pntr_bin[2]_i_1 
       (.I0(\n_0_Q_reg_reg[3] ),
        .I1(\n_0_Q_reg_reg[2] ),
        .I2(p_0_in[4]),
        .O(p_0_in[2]));
(* SOFT_HLUTNM = "soft_lutpair9" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \wr_pntr_bin[3]_i_1 
       (.I0(\n_0_Q_reg_reg[3] ),
        .I1(p_0_in[4]),
        .O(p_0_in[3]));
endmodule

module axis_clock_converter_div2wr_bin_cntr
   (Q,
    ram_full_i,
    O2,
    O1,
    O5,
    I1,
    s_axis_tvalid,
    p_0_out,
    I2,
    rst_full_gen_i,
    E,
    s_axis_aclk,
    I3);
  output [1:0]Q;
  output ram_full_i;
  output [4:0]O2;
  output [3:0]O1;
  input [2:0]O5;
  input I1;
  input s_axis_tvalid;
  input p_0_out;
  input I2;
  input rst_full_gen_i;
  input [0:0]E;
  input s_axis_aclk;
  input [0:0]I3;

  wire [0:0]E;
  wire I1;
  wire I2;
  wire [0:0]I3;
  wire [3:0]O1;
  wire [4:0]O2;
  wire [2:0]O5;
  wire [1:0]Q;
  wire n_0_ram_full_fb_i_i_2;
  wire n_0_ram_full_fb_i_i_4;
  wire p_0_out;
  wire [4:0]plusOp__0;
  wire ram_full_i;
  wire rst_full_gen_i;
  wire s_axis_aclk;
  wire s_axis_tvalid;
  wire [3:3]wr_pntr_plus1;
  wire [4:2]wr_pntr_plus2;

(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair13" *) 
   LUT1 #(
    .INIT(2'h1)) 
     \gic0.gc0.count[0]_i_1 
       (.I0(Q[0]),
        .O(plusOp__0[0]));
LUT2 #(
    .INIT(4'h6)) 
     \gic0.gc0.count[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(plusOp__0[1]));
(* SOFT_HLUTNM = "soft_lutpair13" *) 
   LUT3 #(
    .INIT(8'h78)) 
     \gic0.gc0.count[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(wr_pntr_plus2[2]),
        .O(plusOp__0[2]));
(* SOFT_HLUTNM = "soft_lutpair12" *) 
   LUT4 #(
    .INIT(16'h6AAA)) 
     \gic0.gc0.count[3]_i_1 
       (.I0(wr_pntr_plus2[3]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(wr_pntr_plus2[2]),
        .O(plusOp__0[3]));
(* SOFT_HLUTNM = "soft_lutpair12" *) 
   LUT5 #(
    .INIT(32'h6AAAAAAA)) 
     \gic0.gc0.count[4]_i_1 
       (.I0(wr_pntr_plus2[4]),
        .I1(wr_pntr_plus2[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(wr_pntr_plus2[3]),
        .O(plusOp__0[4]));
FDPE #(
    .INIT(1'b1)) 
     \gic0.gc0.count_d1_reg[0] 
       (.C(s_axis_aclk),
        .CE(E),
        .D(Q[0]),
        .PRE(I3),
        .Q(O1[0]));
FDCE #(
    .INIT(1'b0)) 
     \gic0.gc0.count_d1_reg[1] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I3),
        .D(Q[1]),
        .Q(O1[1]));
FDCE #(
    .INIT(1'b0)) 
     \gic0.gc0.count_d1_reg[2] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I3),
        .D(wr_pntr_plus2[2]),
        .Q(O1[2]));
FDCE #(
    .INIT(1'b0)) 
     \gic0.gc0.count_d1_reg[3] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I3),
        .D(wr_pntr_plus2[3]),
        .Q(wr_pntr_plus1));
FDCE #(
    .INIT(1'b0)) 
     \gic0.gc0.count_d1_reg[4] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I3),
        .D(wr_pntr_plus2[4]),
        .Q(O1[3]));
FDCE #(
    .INIT(1'b0)) 
     \gic0.gc0.count_d2_reg[0] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I3),
        .D(O1[0]),
        .Q(O2[0]));
FDCE #(
    .INIT(1'b0)) 
     \gic0.gc0.count_d2_reg[1] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I3),
        .D(O1[1]),
        .Q(O2[1]));
FDCE #(
    .INIT(1'b0)) 
     \gic0.gc0.count_d2_reg[2] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I3),
        .D(O1[2]),
        .Q(O2[2]));
FDCE #(
    .INIT(1'b0)) 
     \gic0.gc0.count_d2_reg[3] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I3),
        .D(wr_pntr_plus1),
        .Q(O2[3]));
FDCE #(
    .INIT(1'b0)) 
     \gic0.gc0.count_d2_reg[4] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I3),
        .D(O1[3]),
        .Q(O2[4]));
(* counter = "3" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gic0.gc0.count_reg[0] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I3),
        .D(plusOp__0[0]),
        .Q(Q[0]));
(* counter = "3" *) 
   FDPE #(
    .INIT(1'b1)) 
     \gic0.gc0.count_reg[1] 
       (.C(s_axis_aclk),
        .CE(E),
        .D(plusOp__0[1]),
        .PRE(I3),
        .Q(Q[1]));
(* counter = "3" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gic0.gc0.count_reg[2] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I3),
        .D(plusOp__0[2]),
        .Q(wr_pntr_plus2[2]));
(* counter = "3" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gic0.gc0.count_reg[3] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I3),
        .D(plusOp__0[3]),
        .Q(wr_pntr_plus2[3]));
(* counter = "3" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gic0.gc0.count_reg[4] 
       (.C(s_axis_aclk),
        .CE(E),
        .CLR(I3),
        .D(plusOp__0[4]),
        .Q(wr_pntr_plus2[4]));
LUT5 #(
    .INIT(32'h0000D55D)) 
     ram_full_fb_i_i_1
       (.I0(n_0_ram_full_fb_i_i_2),
        .I1(I2),
        .I2(O5[1]),
        .I3(wr_pntr_plus1),
        .I4(rst_full_gen_i),
        .O(ram_full_i));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFF6FF6)) 
     ram_full_fb_i_i_2
       (.I0(wr_pntr_plus2[4]),
        .I1(O5[2]),
        .I2(wr_pntr_plus2[2]),
        .I3(O5[0]),
        .I4(n_0_ram_full_fb_i_i_4),
        .I5(I1),
        .O(n_0_ram_full_fb_i_i_2));
LUT4 #(
    .INIT(16'hFF6F)) 
     ram_full_fb_i_i_4
       (.I0(O5[1]),
        .I1(wr_pntr_plus2[3]),
        .I2(s_axis_tvalid),
        .I3(p_0_out),
        .O(n_0_ram_full_fb_i_i_4));
endmodule

module axis_clock_converter_div2wr_logic
   (Q,
    s_axis_tready,
    O1,
    E,
    O2,
    s_axis_aclk,
    rst_d2,
    O5,
    I1,
    s_axis_tvalid,
    I2,
    rst_full_gen_i,
    I3);
  output [1:0]Q;
  output s_axis_tready;
  output [3:0]O1;
  output [0:0]E;
  output [4:0]O2;
  input s_axis_aclk;
  input rst_d2;
  input [2:0]O5;
  input I1;
  input s_axis_tvalid;
  input I2;
  input rst_full_gen_i;
  input [0:0]I3;

  wire [0:0]E;
  wire I1;
  wire I2;
  wire [0:0]I3;
  wire [3:0]O1;
  wire [4:0]O2;
  wire [2:0]O5;
  wire [1:0]Q;
  wire p_0_out;
  wire ram_full_i;
  wire rst_d2;
  wire rst_full_gen_i;
  wire s_axis_aclk;
  wire s_axis_tready;
  wire s_axis_tvalid;

axis_clock_converter_div2wr_status_flags_as \gwas.wsts 
       (.E(E),
        .p_0_out(p_0_out),
        .ram_full_i(ram_full_i),
        .rst_d2(rst_d2),
        .s_axis_aclk(s_axis_aclk),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
axis_clock_converter_div2wr_bin_cntr wpntr
       (.E(E),
        .I1(I1),
        .I2(I2),
        .I3(I3),
        .O1(O1),
        .O2(O2),
        .O5(O5),
        .Q(Q),
        .p_0_out(p_0_out),
        .ram_full_i(ram_full_i),
        .rst_full_gen_i(rst_full_gen_i),
        .s_axis_aclk(s_axis_aclk),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

module axis_clock_converter_div2wr_status_flags_as
   (p_0_out,
    s_axis_tready,
    E,
    ram_full_i,
    s_axis_aclk,
    rst_d2,
    s_axis_tvalid);
  output p_0_out;
  output s_axis_tready;
  output [0:0]E;
  input ram_full_i;
  input s_axis_aclk;
  input rst_d2;
  input s_axis_tvalid;

  wire \<const1> ;
  wire [0:0]E;
  wire p_0_out;
  wire ram_full_i;
  wire ram_full_i__0;
  wire rst_d2;
  wire s_axis_aclk;
  wire s_axis_tready;
  wire s_axis_tvalid;

LUT2 #(
    .INIT(4'h2)) 
     RAM_reg_0_31_0_5_i_1
       (.I0(s_axis_tvalid),
        .I1(p_0_out),
        .O(E));
VCC VCC
       (.P(\<const1> ));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     ram_full_fb_i_reg
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(ram_full_i),
        .PRE(rst_d2),
        .Q(p_0_out));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     ram_full_i_reg
       (.C(s_axis_aclk),
        .CE(\<const1> ),
        .D(ram_full_i),
        .PRE(rst_d2),
        .Q(ram_full_i__0));
LUT1 #(
    .INIT(2'h1)) 
     s_axis_tready_INST_0
       (.I0(ram_full_i__0),
        .O(s_axis_tready));
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
