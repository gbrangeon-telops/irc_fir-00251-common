-- Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2013.4 (win64) Build 353583 Mon Dec  9 17:49:19 MST 2013
-- Date        : Fri Dec 12 12:27:17 2014
-- Host        : TELOPS210 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               d:/Telops/fir-00251-Common/IP/axis_data_fifo_32w_1024d_aclk/axis_data_fifo_32w_1024d_aclk_funcsim.vhdl
-- Design      : axis_data_fifo_32w_1024d_aclk
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k160tfbg676-1
-- --------------------------------------------------------------------------------
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter is
  port (
    SS : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    axis_wr_eop : out STD_LOGIC;
    O1 : out STD_LOGIC_VECTOR ( 52 downto 0 );
    s_axis_tready : out STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_aclken : in STD_LOGIC;
    ram_full_i : in STD_LOGIC;
    axis_rd_en : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 52 downto 0 );
    s_axis_aresetn : in STD_LOGIC
  );
end axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^o1\ : STD_LOGIC_VECTOR ( 52 downto 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^ss\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal load_r0 : STD_LOGIC;
  signal load_r1 : STD_LOGIC;
  signal \n_0_FSM_onehot_state[0]_i_1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_state[0]_i_2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_state[1]_i_1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_state[1]_i_2__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_state[1]_i_3\ : STD_LOGIC;
  signal \n_0_FSM_onehot_state[2]_i_1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_state[2]_i_2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_state[2]_i_3\ : STD_LOGIC;
  signal \n_0_FSM_onehot_state[2]_i_4\ : STD_LOGIC;
  signal \n_0_FSM_onehot_state[3]_i_1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_state[3]_i_2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_state[4]_i_1__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_state[4]_i_2__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_state_reg[2]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_state_reg[3]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_state_reg[4]\ : STD_LOGIC;
  signal \n_0_r0[0]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[10]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[11]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[12]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[13]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[14]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[15]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[16]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[17]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[18]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[19]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[1]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[20]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[21]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[22]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[23]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[24]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[25]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[26]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[27]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[28]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[29]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[2]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[30]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[31]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[32]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[33]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[34]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[35]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[36]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[37]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[38]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[39]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[3]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[40]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[41]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[42]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[43]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[44]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[45]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[46]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[47]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[48]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[49]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[4]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[50]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[51]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[52]_i_2\ : STD_LOGIC;
  signal \n_0_r0[5]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[6]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[7]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[8]_i_1__0\ : STD_LOGIC;
  signal \n_0_r0[9]_i_1__0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal r1 : STD_LOGIC_VECTOR ( 52 downto 0 );
  signal state17_out : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_state[0]_i_2\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \FSM_onehot_state[2]_i_3\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \FSM_onehot_state[2]_i_5\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \FSM_onehot_state[3]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \FSM_onehot_state[4]_i_1__0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \FSM_onehot_state[4]_i_2__0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_wr_eop_d1_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \r0[18]_i_1__0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of s_axis_tready_INST_0 : label is "soft_lutpair12";
begin
  O1(52 downto 0) <= \^o1\(52 downto 0);
  Q(1 downto 0) <= \^q\(1 downto 0);
  SS(0) <= \^ss\(0);
\FSM_onehot_state[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0100"
    )
    port map (
      I0 => \n_0_FSM_onehot_state_reg[3]\,
      I1 => \^q\(1),
      I2 => \n_0_FSM_onehot_state_reg[2]\,
      I3 => \n_0_FSM_onehot_state[0]_i_2\,
      O => \n_0_FSM_onehot_state[0]_i_1\
    );
\FSM_onehot_state[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0206"
    )
    port map (
      I0 => \^q\(0),
      I1 => \n_0_FSM_onehot_state_reg[4]\,
      I2 => s_axis_aclken,
      I3 => ram_full_i,
      O => \n_0_FSM_onehot_state[0]_i_2\
    );
\FSM_onehot_state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8B88"
    )
    port map (
      I0 => \n_0_FSM_onehot_state[1]_i_2__0\,
      I1 => \^q\(0),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state[1]_i_3\,
      O => \n_0_FSM_onehot_state[1]_i_1\
    );
\FSM_onehot_state[1]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
    port map (
      I0 => \^q\(1),
      I1 => s_axis_aclken,
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \n_0_FSM_onehot_state_reg[4]\,
      O => \n_0_FSM_onehot_state[1]_i_2__0\
    );
\FSM_onehot_state[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00020512000A005A"
    )
    port map (
      I0 => \^q\(1),
      I1 => s_axis_tvalid,
      I2 => \n_0_FSM_onehot_state_reg[2]\,
      I3 => \n_0_FSM_onehot_state_reg[4]\,
      I4 => ram_full_i,
      I5 => s_axis_aclken,
      O => \n_0_FSM_onehot_state[1]_i_3\
    );
\FSM_onehot_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3333303033333130"
    )
    port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \n_0_FSM_onehot_state[2]_i_2\,
      I3 => \n_0_FSM_onehot_state[2]_i_3\,
      I4 => \n_0_FSM_onehot_state[2]_i_4\,
      I5 => \n_0_FSM_onehot_state_reg[2]\,
      O => \n_0_FSM_onehot_state[2]_i_1\
    );
\FSM_onehot_state[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000400040000"
    )
    port map (
      I0 => \^q\(1),
      I1 => \n_0_FSM_onehot_state_reg[2]\,
      I2 => \n_0_FSM_onehot_state_reg[4]\,
      I3 => \n_0_FSM_onehot_state_reg[3]\,
      I4 => ram_full_i,
      I5 => state17_out,
      O => \n_0_FSM_onehot_state[2]_i_2\
    );
\FSM_onehot_state[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0280"
    )
    port map (
      I0 => s_axis_aclken,
      I1 => ram_full_i,
      I2 => \n_0_FSM_onehot_state_reg[4]\,
      I3 => \n_0_FSM_onehot_state_reg[3]\,
      O => \n_0_FSM_onehot_state[2]_i_3\
    );
\FSM_onehot_state[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000002000"
    )
    port map (
      I0 => \^q\(1),
      I1 => \n_0_FSM_onehot_state_reg[4]\,
      I2 => s_axis_aclken,
      I3 => s_axis_tvalid,
      I4 => \n_0_FSM_onehot_state_reg[3]\,
      I5 => \n_0_FSM_onehot_state_reg[2]\,
      O => \n_0_FSM_onehot_state[2]_i_4\
    );
\FSM_onehot_state[2]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => s_axis_aclken,
      I1 => s_axis_tvalid,
      O => state17_out
    );
\FSM_onehot_state[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \n_0_FSM_onehot_state[3]_i_2\,
      O => \n_0_FSM_onehot_state[3]_i_1\
    );
\FSM_onehot_state[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000033008000"
    )
    port map (
      I0 => s_axis_tvalid,
      I1 => \n_0_FSM_onehot_state_reg[2]\,
      I2 => s_axis_aclken,
      I3 => ram_full_i,
      I4 => \n_0_FSM_onehot_state_reg[3]\,
      I5 => \n_0_FSM_onehot_state_reg[4]\,
      O => \n_0_FSM_onehot_state[3]_i_2\
    );
\FSM_onehot_state[4]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0100"
    )
    port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \n_0_FSM_onehot_state_reg[2]\,
      I3 => \n_0_FSM_onehot_state[4]_i_2__0\,
      O => \n_0_FSM_onehot_state[4]_i_1__0\
    );
\FSM_onehot_state[4]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0042"
    )
    port map (
      I0 => \n_0_FSM_onehot_state_reg[3]\,
      I1 => ram_full_i,
      I2 => \n_0_FSM_onehot_state_reg[4]\,
      I3 => s_axis_aclken,
      O => \n_0_FSM_onehot_state[4]_i_2__0\
    );
\FSM_onehot_state_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => \n_0_FSM_onehot_state[0]_i_1\,
      Q => \^q\(0),
      S => \^ss\(0)
    );
\FSM_onehot_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => \n_0_FSM_onehot_state[1]_i_1\,
      Q => \^q\(1),
      R => \^ss\(0)
    );
\FSM_onehot_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => \n_0_FSM_onehot_state[2]_i_1\,
      Q => \n_0_FSM_onehot_state_reg[2]\,
      R => \^ss\(0)
    );
\FSM_onehot_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => \n_0_FSM_onehot_state[3]_i_1\,
      Q => \n_0_FSM_onehot_state_reg[3]\,
      R => \^ss\(0)
    );
\FSM_onehot_state_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => \n_0_FSM_onehot_state[4]_i_1__0\,
      Q => \n_0_FSM_onehot_state_reg[4]\,
      R => \^ss\(0)
    );
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
areset_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => s_axis_aresetn,
      O => p_0_in
    );
areset_reg: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => p_0_in,
      Q => \^ss\(0),
      R => \<const0>\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_wr_eop_d1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => \^o1\(40),
      I1 => ram_full_i,
      I2 => \^q\(0),
      I3 => \^q\(1),
      O => axis_wr_eop
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE01"
    )
    port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => ram_full_i,
      I3 => axis_rd_en,
      O => E(0)
    );
\r0[0]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(0),
      I1 => D(0),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[0]_i_1__0\
    );
\r0[10]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(10),
      I1 => D(10),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[10]_i_1__0\
    );
\r0[11]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(11),
      I1 => D(11),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[11]_i_1__0\
    );
\r0[12]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(12),
      I1 => D(12),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[12]_i_1__0\
    );
\r0[13]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(13),
      I1 => D(13),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[13]_i_1__0\
    );
\r0[14]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(14),
      I1 => D(14),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[14]_i_1__0\
    );
\r0[15]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(15),
      I1 => D(15),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[15]_i_1__0\
    );
\r0[16]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(16),
      I1 => D(16),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[16]_i_1__0\
    );
\r0[17]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(17),
      I1 => D(17),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[17]_i_1__0\
    );
\r0[18]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(18),
      I1 => D(18),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[18]_i_1__0\
    );
\r0[19]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(19),
      I1 => D(19),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[19]_i_1__0\
    );
\r0[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(1),
      I1 => D(1),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[1]_i_1__0\
    );
\r0[20]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(20),
      I1 => D(20),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[20]_i_1__0\
    );
\r0[21]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(21),
      I1 => D(21),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[21]_i_1__0\
    );
\r0[22]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(22),
      I1 => D(22),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[22]_i_1__0\
    );
\r0[23]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(23),
      I1 => D(23),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[23]_i_1__0\
    );
\r0[24]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(24),
      I1 => D(24),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[24]_i_1__0\
    );
\r0[25]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(25),
      I1 => D(25),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[25]_i_1__0\
    );
\r0[26]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(26),
      I1 => D(26),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[26]_i_1__0\
    );
\r0[27]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(27),
      I1 => D(27),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[27]_i_1__0\
    );
\r0[28]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(28),
      I1 => D(28),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[28]_i_1__0\
    );
\r0[29]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(29),
      I1 => D(29),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[29]_i_1__0\
    );
\r0[2]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(2),
      I1 => D(2),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[2]_i_1__0\
    );
\r0[30]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(30),
      I1 => D(30),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[30]_i_1__0\
    );
\r0[31]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(31),
      I1 => D(31),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[31]_i_1__0\
    );
\r0[32]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(32),
      I1 => D(32),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[32]_i_1__0\
    );
\r0[33]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(33),
      I1 => D(33),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[33]_i_1__0\
    );
\r0[34]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(34),
      I1 => D(34),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[34]_i_1__0\
    );
\r0[35]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(35),
      I1 => D(35),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[35]_i_1__0\
    );
\r0[36]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(36),
      I1 => D(36),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[36]_i_1__0\
    );
\r0[37]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(37),
      I1 => D(37),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[37]_i_1__0\
    );
\r0[38]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(38),
      I1 => D(38),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[38]_i_1__0\
    );
\r0[39]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(39),
      I1 => D(39),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[39]_i_1__0\
    );
\r0[3]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(3),
      I1 => D(3),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[3]_i_1__0\
    );
\r0[40]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(40),
      I1 => D(40),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[40]_i_1__0\
    );
\r0[41]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(41),
      I1 => D(41),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[41]_i_1__0\
    );
\r0[42]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(42),
      I1 => D(42),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[42]_i_1__0\
    );
\r0[43]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(43),
      I1 => D(43),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[43]_i_1__0\
    );
\r0[44]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(44),
      I1 => D(44),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[44]_i_1__0\
    );
\r0[45]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(45),
      I1 => D(45),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[45]_i_1__0\
    );
\r0[46]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(46),
      I1 => D(46),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[46]_i_1__0\
    );
\r0[47]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(47),
      I1 => D(47),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[47]_i_1__0\
    );
\r0[48]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(48),
      I1 => D(48),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[48]_i_1__0\
    );
\r0[49]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(49),
      I1 => D(49),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[49]_i_1__0\
    );
\r0[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(4),
      I1 => D(4),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[4]_i_1__0\
    );
\r0[50]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(50),
      I1 => D(50),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[50]_i_1__0\
    );
\r0[51]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(51),
      I1 => D(51),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[51]_i_1__0\
    );
\r0[52]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3238333C"
    )
    port map (
      I0 => \^q\(0),
      I1 => \n_0_FSM_onehot_state_reg[3]\,
      I2 => \^q\(1),
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => ram_full_i,
      O => load_r0
    );
\r0[52]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(52),
      I1 => D(52),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[52]_i_2\
    );
\r0[5]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(5),
      I1 => D(5),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[5]_i_1__0\
    );
\r0[6]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(6),
      I1 => D(6),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[6]_i_1__0\
    );
\r0[7]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(7),
      I1 => D(7),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[7]_i_1__0\
    );
\r0[8]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(8),
      I1 => D(8),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[8]_i_1__0\
    );
\r0[9]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCAC"
    )
    port map (
      I0 => r1(9),
      I1 => D(9),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      I3 => \n_0_FSM_onehot_state_reg[2]\,
      I4 => \^q\(1),
      O => \n_0_r0[9]_i_1__0\
    );
\r0_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[0]_i_1__0\,
      Q => \^o1\(0),
      R => \<const0>\
    );
\r0_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[10]_i_1__0\,
      Q => \^o1\(10),
      R => \<const0>\
    );
\r0_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[11]_i_1__0\,
      Q => \^o1\(11),
      R => \<const0>\
    );
\r0_reg[12]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[12]_i_1__0\,
      Q => \^o1\(12),
      R => \<const0>\
    );
\r0_reg[13]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[13]_i_1__0\,
      Q => \^o1\(13),
      R => \<const0>\
    );
\r0_reg[14]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[14]_i_1__0\,
      Q => \^o1\(14),
      R => \<const0>\
    );
\r0_reg[15]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[15]_i_1__0\,
      Q => \^o1\(15),
      R => \<const0>\
    );
\r0_reg[16]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[16]_i_1__0\,
      Q => \^o1\(16),
      R => \<const0>\
    );
\r0_reg[17]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[17]_i_1__0\,
      Q => \^o1\(17),
      R => \<const0>\
    );
\r0_reg[18]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[18]_i_1__0\,
      Q => \^o1\(18),
      R => \<const0>\
    );
\r0_reg[19]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[19]_i_1__0\,
      Q => \^o1\(19),
      R => \<const0>\
    );
\r0_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[1]_i_1__0\,
      Q => \^o1\(1),
      R => \<const0>\
    );
\r0_reg[20]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[20]_i_1__0\,
      Q => \^o1\(20),
      R => \<const0>\
    );
\r0_reg[21]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[21]_i_1__0\,
      Q => \^o1\(21),
      R => \<const0>\
    );
\r0_reg[22]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[22]_i_1__0\,
      Q => \^o1\(22),
      R => \<const0>\
    );
\r0_reg[23]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[23]_i_1__0\,
      Q => \^o1\(23),
      R => \<const0>\
    );
\r0_reg[24]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[24]_i_1__0\,
      Q => \^o1\(24),
      R => \<const0>\
    );
\r0_reg[25]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[25]_i_1__0\,
      Q => \^o1\(25),
      R => \<const0>\
    );
\r0_reg[26]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[26]_i_1__0\,
      Q => \^o1\(26),
      R => \<const0>\
    );
\r0_reg[27]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[27]_i_1__0\,
      Q => \^o1\(27),
      R => \<const0>\
    );
\r0_reg[28]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[28]_i_1__0\,
      Q => \^o1\(28),
      R => \<const0>\
    );
\r0_reg[29]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[29]_i_1__0\,
      Q => \^o1\(29),
      R => \<const0>\
    );
\r0_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[2]_i_1__0\,
      Q => \^o1\(2),
      R => \<const0>\
    );
\r0_reg[30]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[30]_i_1__0\,
      Q => \^o1\(30),
      R => \<const0>\
    );
\r0_reg[31]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[31]_i_1__0\,
      Q => \^o1\(31),
      R => \<const0>\
    );
\r0_reg[32]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[32]_i_1__0\,
      Q => \^o1\(32),
      R => \<const0>\
    );
\r0_reg[33]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[33]_i_1__0\,
      Q => \^o1\(33),
      R => \<const0>\
    );
\r0_reg[34]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[34]_i_1__0\,
      Q => \^o1\(34),
      R => \<const0>\
    );
\r0_reg[35]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[35]_i_1__0\,
      Q => \^o1\(35),
      R => \<const0>\
    );
\r0_reg[36]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[36]_i_1__0\,
      Q => \^o1\(36),
      R => \<const0>\
    );
\r0_reg[37]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[37]_i_1__0\,
      Q => \^o1\(37),
      R => \<const0>\
    );
\r0_reg[38]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[38]_i_1__0\,
      Q => \^o1\(38),
      R => \<const0>\
    );
\r0_reg[39]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[39]_i_1__0\,
      Q => \^o1\(39),
      R => \<const0>\
    );
\r0_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[3]_i_1__0\,
      Q => \^o1\(3),
      R => \<const0>\
    );
\r0_reg[40]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[40]_i_1__0\,
      Q => \^o1\(40),
      R => \<const0>\
    );
\r0_reg[41]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[41]_i_1__0\,
      Q => \^o1\(41),
      R => \<const0>\
    );
\r0_reg[42]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[42]_i_1__0\,
      Q => \^o1\(42),
      R => \<const0>\
    );
\r0_reg[43]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[43]_i_1__0\,
      Q => \^o1\(43),
      R => \<const0>\
    );
\r0_reg[44]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[44]_i_1__0\,
      Q => \^o1\(44),
      R => \<const0>\
    );
\r0_reg[45]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[45]_i_1__0\,
      Q => \^o1\(45),
      R => \<const0>\
    );
\r0_reg[46]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[46]_i_1__0\,
      Q => \^o1\(46),
      R => \<const0>\
    );
\r0_reg[47]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[47]_i_1__0\,
      Q => \^o1\(47),
      R => \<const0>\
    );
\r0_reg[48]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[48]_i_1__0\,
      Q => \^o1\(48),
      R => \<const0>\
    );
\r0_reg[49]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[49]_i_1__0\,
      Q => \^o1\(49),
      R => \<const0>\
    );
\r0_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[4]_i_1__0\,
      Q => \^o1\(4),
      R => \<const0>\
    );
\r0_reg[50]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[50]_i_1__0\,
      Q => \^o1\(50),
      R => \<const0>\
    );
\r0_reg[51]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[51]_i_1__0\,
      Q => \^o1\(51),
      R => \<const0>\
    );
\r0_reg[52]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[52]_i_2\,
      Q => \^o1\(52),
      R => \<const0>\
    );
\r0_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[5]_i_1__0\,
      Q => \^o1\(5),
      R => \<const0>\
    );
\r0_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[6]_i_1__0\,
      Q => \^o1\(6),
      R => \<const0>\
    );
\r0_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[7]_i_1__0\,
      Q => \^o1\(7),
      R => \<const0>\
    );
\r0_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[8]_i_1__0\,
      Q => \^o1\(8),
      R => \<const0>\
    );
\r0_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r0,
      D => \n_0_r0[9]_i_1__0\,
      Q => \^o1\(9),
      R => \<const0>\
    );
\r1[52]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
    port map (
      I0 => \n_0_FSM_onehot_state_reg[2]\,
      I1 => \^q\(1),
      I2 => \n_0_FSM_onehot_state_reg[3]\,
      O => load_r1
    );
\r1_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(0),
      Q => r1(0),
      R => \<const0>\
    );
\r1_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(10),
      Q => r1(10),
      R => \<const0>\
    );
\r1_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(11),
      Q => r1(11),
      R => \<const0>\
    );
\r1_reg[12]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(12),
      Q => r1(12),
      R => \<const0>\
    );
\r1_reg[13]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(13),
      Q => r1(13),
      R => \<const0>\
    );
\r1_reg[14]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(14),
      Q => r1(14),
      R => \<const0>\
    );
\r1_reg[15]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(15),
      Q => r1(15),
      R => \<const0>\
    );
\r1_reg[16]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(16),
      Q => r1(16),
      R => \<const0>\
    );
\r1_reg[17]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(17),
      Q => r1(17),
      R => \<const0>\
    );
\r1_reg[18]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(18),
      Q => r1(18),
      R => \<const0>\
    );
\r1_reg[19]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(19),
      Q => r1(19),
      R => \<const0>\
    );
\r1_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(1),
      Q => r1(1),
      R => \<const0>\
    );
\r1_reg[20]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(20),
      Q => r1(20),
      R => \<const0>\
    );
\r1_reg[21]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(21),
      Q => r1(21),
      R => \<const0>\
    );
\r1_reg[22]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(22),
      Q => r1(22),
      R => \<const0>\
    );
\r1_reg[23]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(23),
      Q => r1(23),
      R => \<const0>\
    );
\r1_reg[24]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(24),
      Q => r1(24),
      R => \<const0>\
    );
\r1_reg[25]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(25),
      Q => r1(25),
      R => \<const0>\
    );
\r1_reg[26]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(26),
      Q => r1(26),
      R => \<const0>\
    );
\r1_reg[27]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(27),
      Q => r1(27),
      R => \<const0>\
    );
\r1_reg[28]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(28),
      Q => r1(28),
      R => \<const0>\
    );
\r1_reg[29]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(29),
      Q => r1(29),
      R => \<const0>\
    );
\r1_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(2),
      Q => r1(2),
      R => \<const0>\
    );
\r1_reg[30]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(30),
      Q => r1(30),
      R => \<const0>\
    );
\r1_reg[31]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(31),
      Q => r1(31),
      R => \<const0>\
    );
\r1_reg[32]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(32),
      Q => r1(32),
      R => \<const0>\
    );
\r1_reg[33]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(33),
      Q => r1(33),
      R => \<const0>\
    );
\r1_reg[34]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(34),
      Q => r1(34),
      R => \<const0>\
    );
\r1_reg[35]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(35),
      Q => r1(35),
      R => \<const0>\
    );
\r1_reg[36]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(36),
      Q => r1(36),
      R => \<const0>\
    );
\r1_reg[37]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(37),
      Q => r1(37),
      R => \<const0>\
    );
\r1_reg[38]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(38),
      Q => r1(38),
      R => \<const0>\
    );
\r1_reg[39]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(39),
      Q => r1(39),
      R => \<const0>\
    );
\r1_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(3),
      Q => r1(3),
      R => \<const0>\
    );
\r1_reg[40]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(40),
      Q => r1(40),
      R => \<const0>\
    );
\r1_reg[41]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(41),
      Q => r1(41),
      R => \<const0>\
    );
\r1_reg[42]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(42),
      Q => r1(42),
      R => \<const0>\
    );
\r1_reg[43]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(43),
      Q => r1(43),
      R => \<const0>\
    );
\r1_reg[44]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(44),
      Q => r1(44),
      R => \<const0>\
    );
\r1_reg[45]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(45),
      Q => r1(45),
      R => \<const0>\
    );
\r1_reg[46]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(46),
      Q => r1(46),
      R => \<const0>\
    );
\r1_reg[47]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(47),
      Q => r1(47),
      R => \<const0>\
    );
\r1_reg[48]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(48),
      Q => r1(48),
      R => \<const0>\
    );
\r1_reg[49]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(49),
      Q => r1(49),
      R => \<const0>\
    );
\r1_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(4),
      Q => r1(4),
      R => \<const0>\
    );
\r1_reg[50]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(50),
      Q => r1(50),
      R => \<const0>\
    );
\r1_reg[51]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(51),
      Q => r1(51),
      R => \<const0>\
    );
\r1_reg[52]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(52),
      Q => r1(52),
      R => \<const0>\
    );
\r1_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(5),
      Q => r1(5),
      R => \<const0>\
    );
\r1_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(6),
      Q => r1(6),
      R => \<const0>\
    );
\r1_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(7),
      Q => r1(7),
      R => \<const0>\
    );
\r1_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(8),
      Q => r1(8),
      R => \<const0>\
    );
\r1_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(9),
      Q => r1(9),
      R => \<const0>\
    );
s_axis_tready_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \^q\(1),
      I1 => \n_0_FSM_onehot_state_reg[2]\,
      O => s_axis_tready
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity \axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter__parameterized0\ is
  port (
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    O1 : out STD_LOGIC_VECTOR ( 52 downto 0 );
    m_axis_aclken : in STD_LOGIC;
    I1 : in STD_LOGIC;
    p_8_out : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    I2 : in STD_LOGIC;
    I3 : in STD_LOGIC;
    I4 : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 52 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter__parameterized0\ : entity is "axis_infrastructure_v1_1_util_aclken_converter";
end \axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter__parameterized0\;

architecture STRUCTURE of \axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter__parameterized0\ is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal load_r1 : STD_LOGIC;
  signal \n_0_FSM_onehot_state[1]_i_1__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_state[1]_i_2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_state[2]_i_1__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_state[3]_i_1__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_state[3]_i_2__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_state[3]_i_3\ : STD_LOGIC;
  signal \n_0_FSM_onehot_state[4]_i_1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_state_reg[0]\ : STD_LOGIC;
  signal \n_0_r0[0]_i_1\ : STD_LOGIC;
  signal \n_0_r0[10]_i_1\ : STD_LOGIC;
  signal \n_0_r0[11]_i_1\ : STD_LOGIC;
  signal \n_0_r0[12]_i_1\ : STD_LOGIC;
  signal \n_0_r0[13]_i_1\ : STD_LOGIC;
  signal \n_0_r0[14]_i_1\ : STD_LOGIC;
  signal \n_0_r0[15]_i_1\ : STD_LOGIC;
  signal \n_0_r0[16]_i_1\ : STD_LOGIC;
  signal \n_0_r0[17]_i_1\ : STD_LOGIC;
  signal \n_0_r0[18]_i_1\ : STD_LOGIC;
  signal \n_0_r0[19]_i_1\ : STD_LOGIC;
  signal \n_0_r0[1]_i_1\ : STD_LOGIC;
  signal \n_0_r0[20]_i_1\ : STD_LOGIC;
  signal \n_0_r0[21]_i_1\ : STD_LOGIC;
  signal \n_0_r0[22]_i_1\ : STD_LOGIC;
  signal \n_0_r0[23]_i_1\ : STD_LOGIC;
  signal \n_0_r0[24]_i_1\ : STD_LOGIC;
  signal \n_0_r0[25]_i_1\ : STD_LOGIC;
  signal \n_0_r0[26]_i_1\ : STD_LOGIC;
  signal \n_0_r0[27]_i_1\ : STD_LOGIC;
  signal \n_0_r0[28]_i_1\ : STD_LOGIC;
  signal \n_0_r0[29]_i_1\ : STD_LOGIC;
  signal \n_0_r0[2]_i_1\ : STD_LOGIC;
  signal \n_0_r0[30]_i_1\ : STD_LOGIC;
  signal \n_0_r0[31]_i_1\ : STD_LOGIC;
  signal \n_0_r0[31]_i_2\ : STD_LOGIC;
  signal \n_0_r0[32]_i_1\ : STD_LOGIC;
  signal \n_0_r0[33]_i_1\ : STD_LOGIC;
  signal \n_0_r0[34]_i_1\ : STD_LOGIC;
  signal \n_0_r0[35]_i_1\ : STD_LOGIC;
  signal \n_0_r0[36]_i_1\ : STD_LOGIC;
  signal \n_0_r0[37]_i_1\ : STD_LOGIC;
  signal \n_0_r0[38]_i_1\ : STD_LOGIC;
  signal \n_0_r0[39]_i_1\ : STD_LOGIC;
  signal \n_0_r0[3]_i_1\ : STD_LOGIC;
  signal \n_0_r0[40]_i_1\ : STD_LOGIC;
  signal \n_0_r0[41]_i_1\ : STD_LOGIC;
  signal \n_0_r0[42]_i_1\ : STD_LOGIC;
  signal \n_0_r0[43]_i_1\ : STD_LOGIC;
  signal \n_0_r0[44]_i_1\ : STD_LOGIC;
  signal \n_0_r0[45]_i_1\ : STD_LOGIC;
  signal \n_0_r0[46]_i_1\ : STD_LOGIC;
  signal \n_0_r0[47]_i_1\ : STD_LOGIC;
  signal \n_0_r0[48]_i_1\ : STD_LOGIC;
  signal \n_0_r0[49]_i_1\ : STD_LOGIC;
  signal \n_0_r0[4]_i_1\ : STD_LOGIC;
  signal \n_0_r0[50]_i_1\ : STD_LOGIC;
  signal \n_0_r0[51]_i_1\ : STD_LOGIC;
  signal \n_0_r0[52]_i_1\ : STD_LOGIC;
  signal \n_0_r0[5]_i_1\ : STD_LOGIC;
  signal \n_0_r0[6]_i_1\ : STD_LOGIC;
  signal \n_0_r0[7]_i_1\ : STD_LOGIC;
  signal \n_0_r0[8]_i_1\ : STD_LOGIC;
  signal \n_0_r0[9]_i_1\ : STD_LOGIC;
  signal \n_0_r1_reg[0]\ : STD_LOGIC;
  signal \n_0_r1_reg[10]\ : STD_LOGIC;
  signal \n_0_r1_reg[11]\ : STD_LOGIC;
  signal \n_0_r1_reg[12]\ : STD_LOGIC;
  signal \n_0_r1_reg[13]\ : STD_LOGIC;
  signal \n_0_r1_reg[14]\ : STD_LOGIC;
  signal \n_0_r1_reg[15]\ : STD_LOGIC;
  signal \n_0_r1_reg[16]\ : STD_LOGIC;
  signal \n_0_r1_reg[17]\ : STD_LOGIC;
  signal \n_0_r1_reg[18]\ : STD_LOGIC;
  signal \n_0_r1_reg[19]\ : STD_LOGIC;
  signal \n_0_r1_reg[1]\ : STD_LOGIC;
  signal \n_0_r1_reg[20]\ : STD_LOGIC;
  signal \n_0_r1_reg[21]\ : STD_LOGIC;
  signal \n_0_r1_reg[22]\ : STD_LOGIC;
  signal \n_0_r1_reg[23]\ : STD_LOGIC;
  signal \n_0_r1_reg[24]\ : STD_LOGIC;
  signal \n_0_r1_reg[25]\ : STD_LOGIC;
  signal \n_0_r1_reg[26]\ : STD_LOGIC;
  signal \n_0_r1_reg[27]\ : STD_LOGIC;
  signal \n_0_r1_reg[28]\ : STD_LOGIC;
  signal \n_0_r1_reg[29]\ : STD_LOGIC;
  signal \n_0_r1_reg[2]\ : STD_LOGIC;
  signal \n_0_r1_reg[30]\ : STD_LOGIC;
  signal \n_0_r1_reg[31]\ : STD_LOGIC;
  signal \n_0_r1_reg[32]\ : STD_LOGIC;
  signal \n_0_r1_reg[33]\ : STD_LOGIC;
  signal \n_0_r1_reg[34]\ : STD_LOGIC;
  signal \n_0_r1_reg[35]\ : STD_LOGIC;
  signal \n_0_r1_reg[36]\ : STD_LOGIC;
  signal \n_0_r1_reg[37]\ : STD_LOGIC;
  signal \n_0_r1_reg[38]\ : STD_LOGIC;
  signal \n_0_r1_reg[39]\ : STD_LOGIC;
  signal \n_0_r1_reg[3]\ : STD_LOGIC;
  signal \n_0_r1_reg[40]\ : STD_LOGIC;
  signal \n_0_r1_reg[41]\ : STD_LOGIC;
  signal \n_0_r1_reg[42]\ : STD_LOGIC;
  signal \n_0_r1_reg[43]\ : STD_LOGIC;
  signal \n_0_r1_reg[44]\ : STD_LOGIC;
  signal \n_0_r1_reg[45]\ : STD_LOGIC;
  signal \n_0_r1_reg[46]\ : STD_LOGIC;
  signal \n_0_r1_reg[47]\ : STD_LOGIC;
  signal \n_0_r1_reg[48]\ : STD_LOGIC;
  signal \n_0_r1_reg[49]\ : STD_LOGIC;
  signal \n_0_r1_reg[4]\ : STD_LOGIC;
  signal \n_0_r1_reg[50]\ : STD_LOGIC;
  signal \n_0_r1_reg[51]\ : STD_LOGIC;
  signal \n_0_r1_reg[52]\ : STD_LOGIC;
  signal \n_0_r1_reg[5]\ : STD_LOGIC;
  signal \n_0_r1_reg[6]\ : STD_LOGIC;
  signal \n_0_r1_reg[7]\ : STD_LOGIC;
  signal \n_0_r1_reg[8]\ : STD_LOGIC;
  signal \n_0_r1_reg[9]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_state[2]_i_1__0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of m_axis_tvalid_INST_0 : label is "soft_lutpair11";
begin
  Q(3 downto 0) <= \^q\(3 downto 0);
\FSM_onehot_state[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010001000101110"
    )
    port map (
      I0 => \^q\(3),
      I1 => \^q\(1),
      I2 => \n_0_FSM_onehot_state[1]_i_2\,
      I3 => \n_0_FSM_onehot_state_reg[0]\,
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_FSM_onehot_state[1]_i_1__0\
    );
\FSM_onehot_state[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6606220222022202"
    )
    port map (
      I0 => \^q\(0),
      I1 => \^q\(2),
      I2 => I1,
      I3 => p_8_out,
      I4 => m_axis_aclken,
      I5 => m_axis_tready,
      O => \n_0_FSM_onehot_state[1]_i_2\
    );
\FSM_onehot_state[2]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0100"
    )
    port map (
      I0 => \^q\(3),
      I1 => \n_0_FSM_onehot_state_reg[0]\,
      I2 => \^q\(2),
      I3 => I2,
      O => \n_0_FSM_onehot_state[2]_i_1__0\
    );
\FSM_onehot_state[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
    port map (
      I0 => \n_0_FSM_onehot_state_reg[0]\,
      I1 => \n_0_FSM_onehot_state[3]_i_2__0\,
      I2 => \^q\(0),
      I3 => \n_0_FSM_onehot_state[3]_i_3\,
      O => \n_0_FSM_onehot_state[3]_i_1__0\
    );
\FSM_onehot_state[3]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAFFFFFFB5E5EFEF"
    )
    port map (
      I0 => \^q\(1),
      I1 => I4,
      I2 => \^q\(2),
      I3 => m_axis_tready,
      I4 => m_axis_aclken,
      I5 => \^q\(3),
      O => \n_0_FSM_onehot_state[3]_i_2__0\
    );
\FSM_onehot_state[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEFFF"
    )
    port map (
      I0 => \^q\(1),
      I1 => \^q\(2),
      I2 => m_axis_aclken,
      I3 => I1,
      I4 => p_8_out,
      I5 => \^q\(3),
      O => \n_0_FSM_onehot_state[3]_i_3\
    );
\FSM_onehot_state[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0100"
    )
    port map (
      I0 => \^q\(0),
      I1 => \n_0_FSM_onehot_state_reg[0]\,
      I2 => \^q\(1),
      I3 => I3,
      O => \n_0_FSM_onehot_state[4]_i_1\
    );
\FSM_onehot_state_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => \<const0>\,
      Q => \n_0_FSM_onehot_state_reg[0]\,
      S => SR(0)
    );
\FSM_onehot_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => \n_0_FSM_onehot_state[1]_i_1__0\,
      Q => \^q\(0),
      R => SR(0)
    );
\FSM_onehot_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => \n_0_FSM_onehot_state[2]_i_1__0\,
      Q => \^q\(1),
      R => SR(0)
    );
\FSM_onehot_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => \n_0_FSM_onehot_state[3]_i_1__0\,
      Q => \^q\(2),
      R => SR(0)
    );
\FSM_onehot_state_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => \n_0_FSM_onehot_state[4]_i_1\,
      Q => \^q\(3),
      R => SR(0)
    );
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
m_axis_tvalid_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \^q\(2),
      I1 => \^q\(3),
      O => m_axis_tvalid
    );
\r0[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[0]\,
      I1 => D(0),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[0]_i_1\
    );
\r0[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[10]\,
      I1 => D(10),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[10]_i_1\
    );
\r0[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[11]\,
      I1 => D(11),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[11]_i_1\
    );
\r0[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[12]\,
      I1 => D(12),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[12]_i_1\
    );
\r0[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[13]\,
      I1 => D(13),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[13]_i_1\
    );
\r0[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[14]\,
      I1 => D(14),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[14]_i_1\
    );
\r0[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[15]\,
      I1 => D(15),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[15]_i_1\
    );
\r0[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[16]\,
      I1 => D(16),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[16]_i_1\
    );
\r0[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[17]\,
      I1 => D(17),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[17]_i_1\
    );
\r0[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[18]\,
      I1 => D(18),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[18]_i_1\
    );
\r0[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[19]\,
      I1 => D(19),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[19]_i_1\
    );
\r0[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[1]\,
      I1 => D(1),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[1]_i_1\
    );
\r0[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[20]\,
      I1 => D(20),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[20]_i_1\
    );
\r0[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[21]\,
      I1 => D(21),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[21]_i_1\
    );
\r0[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[22]\,
      I1 => D(22),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[22]_i_1\
    );
\r0[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[23]\,
      I1 => D(23),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[23]_i_1\
    );
\r0[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[24]\,
      I1 => D(24),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[24]_i_1\
    );
\r0[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[25]\,
      I1 => D(25),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[25]_i_1\
    );
\r0[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[26]\,
      I1 => D(26),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[26]_i_1\
    );
\r0[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[27]\,
      I1 => D(27),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[27]_i_1\
    );
\r0[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[28]\,
      I1 => D(28),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[28]_i_1\
    );
\r0[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[29]\,
      I1 => D(29),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[29]_i_1\
    );
\r0[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[2]\,
      I1 => D(2),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[2]_i_1\
    );
\r0[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[30]\,
      I1 => D(30),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[30]_i_1\
    );
\r0[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"020202A800020020"
    )
    port map (
      I0 => m_axis_aclken,
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \^q\(3),
      I4 => \^q\(1),
      I5 => m_axis_tready,
      O => \n_0_r0[31]_i_1\
    );
\r0[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[31]\,
      I1 => D(31),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[31]_i_2\
    );
\r0[32]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[32]\,
      I1 => D(32),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[32]_i_1\
    );
\r0[33]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[33]\,
      I1 => D(33),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[33]_i_1\
    );
\r0[34]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[34]\,
      I1 => D(34),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[34]_i_1\
    );
\r0[35]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[35]\,
      I1 => D(35),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[35]_i_1\
    );
\r0[36]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[36]\,
      I1 => D(36),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[36]_i_1\
    );
\r0[37]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[37]\,
      I1 => D(37),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[37]_i_1\
    );
\r0[38]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[38]\,
      I1 => D(38),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[38]_i_1\
    );
\r0[39]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[39]\,
      I1 => D(39),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[39]_i_1\
    );
\r0[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[3]\,
      I1 => D(3),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[3]_i_1\
    );
\r0[40]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[40]\,
      I1 => D(40),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[40]_i_1\
    );
\r0[41]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[41]\,
      I1 => D(41),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[41]_i_1\
    );
\r0[42]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[42]\,
      I1 => D(42),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[42]_i_1\
    );
\r0[43]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[43]\,
      I1 => D(43),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[43]_i_1\
    );
\r0[44]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[44]\,
      I1 => D(44),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[44]_i_1\
    );
\r0[45]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[45]\,
      I1 => D(45),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[45]_i_1\
    );
\r0[46]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[46]\,
      I1 => D(46),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[46]_i_1\
    );
\r0[47]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[47]\,
      I1 => D(47),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[47]_i_1\
    );
\r0[48]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[48]\,
      I1 => D(48),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[48]_i_1\
    );
\r0[49]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[49]\,
      I1 => D(49),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[49]_i_1\
    );
\r0[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[4]\,
      I1 => D(4),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[4]_i_1\
    );
\r0[50]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[50]\,
      I1 => D(50),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[50]_i_1\
    );
\r0[51]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[51]\,
      I1 => D(51),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[51]_i_1\
    );
\r0[52]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[52]\,
      I1 => D(52),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[52]_i_1\
    );
\r0[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[5]\,
      I1 => D(5),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[5]_i_1\
    );
\r0[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[6]\,
      I1 => D(6),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[6]_i_1\
    );
\r0[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[7]\,
      I1 => D(7),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[7]_i_1\
    );
\r0[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[8]\,
      I1 => D(8),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[8]_i_1\
    );
\r0[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCAAAC"
    )
    port map (
      I0 => \n_0_r1_reg[9]\,
      I1 => D(9),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \n_0_r0[9]_i_1\
    );
\r0_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[0]_i_1\,
      Q => O1(0),
      R => \<const0>\
    );
\r0_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[10]_i_1\,
      Q => O1(10),
      R => \<const0>\
    );
\r0_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[11]_i_1\,
      Q => O1(11),
      R => \<const0>\
    );
\r0_reg[12]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[12]_i_1\,
      Q => O1(12),
      R => \<const0>\
    );
\r0_reg[13]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[13]_i_1\,
      Q => O1(13),
      R => \<const0>\
    );
\r0_reg[14]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[14]_i_1\,
      Q => O1(14),
      R => \<const0>\
    );
\r0_reg[15]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[15]_i_1\,
      Q => O1(15),
      R => \<const0>\
    );
\r0_reg[16]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[16]_i_1\,
      Q => O1(16),
      R => \<const0>\
    );
\r0_reg[17]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[17]_i_1\,
      Q => O1(17),
      R => \<const0>\
    );
\r0_reg[18]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[18]_i_1\,
      Q => O1(18),
      R => \<const0>\
    );
\r0_reg[19]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[19]_i_1\,
      Q => O1(19),
      R => \<const0>\
    );
\r0_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[1]_i_1\,
      Q => O1(1),
      R => \<const0>\
    );
\r0_reg[20]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[20]_i_1\,
      Q => O1(20),
      R => \<const0>\
    );
\r0_reg[21]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[21]_i_1\,
      Q => O1(21),
      R => \<const0>\
    );
\r0_reg[22]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[22]_i_1\,
      Q => O1(22),
      R => \<const0>\
    );
\r0_reg[23]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[23]_i_1\,
      Q => O1(23),
      R => \<const0>\
    );
\r0_reg[24]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[24]_i_1\,
      Q => O1(24),
      R => \<const0>\
    );
\r0_reg[25]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[25]_i_1\,
      Q => O1(25),
      R => \<const0>\
    );
\r0_reg[26]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[26]_i_1\,
      Q => O1(26),
      R => \<const0>\
    );
\r0_reg[27]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[27]_i_1\,
      Q => O1(27),
      R => \<const0>\
    );
\r0_reg[28]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[28]_i_1\,
      Q => O1(28),
      R => \<const0>\
    );
\r0_reg[29]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[29]_i_1\,
      Q => O1(29),
      R => \<const0>\
    );
\r0_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[2]_i_1\,
      Q => O1(2),
      R => \<const0>\
    );
\r0_reg[30]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[30]_i_1\,
      Q => O1(30),
      R => \<const0>\
    );
\r0_reg[31]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[31]_i_2\,
      Q => O1(31),
      R => \<const0>\
    );
\r0_reg[32]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[32]_i_1\,
      Q => O1(32),
      R => \<const0>\
    );
\r0_reg[33]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[33]_i_1\,
      Q => O1(33),
      R => \<const0>\
    );
\r0_reg[34]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[34]_i_1\,
      Q => O1(34),
      R => \<const0>\
    );
\r0_reg[35]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[35]_i_1\,
      Q => O1(35),
      R => \<const0>\
    );
\r0_reg[36]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[36]_i_1\,
      Q => O1(36),
      R => \<const0>\
    );
\r0_reg[37]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[37]_i_1\,
      Q => O1(37),
      R => \<const0>\
    );
\r0_reg[38]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[38]_i_1\,
      Q => O1(38),
      R => \<const0>\
    );
\r0_reg[39]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[39]_i_1\,
      Q => O1(39),
      R => \<const0>\
    );
\r0_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[3]_i_1\,
      Q => O1(3),
      R => \<const0>\
    );
\r0_reg[40]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[40]_i_1\,
      Q => O1(40),
      R => \<const0>\
    );
\r0_reg[41]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[41]_i_1\,
      Q => O1(41),
      R => \<const0>\
    );
\r0_reg[42]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[42]_i_1\,
      Q => O1(42),
      R => \<const0>\
    );
\r0_reg[43]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[43]_i_1\,
      Q => O1(43),
      R => \<const0>\
    );
\r0_reg[44]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[44]_i_1\,
      Q => O1(44),
      R => \<const0>\
    );
\r0_reg[45]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[45]_i_1\,
      Q => O1(45),
      R => \<const0>\
    );
\r0_reg[46]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[46]_i_1\,
      Q => O1(46),
      R => \<const0>\
    );
\r0_reg[47]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[47]_i_1\,
      Q => O1(47),
      R => \<const0>\
    );
\r0_reg[48]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[48]_i_1\,
      Q => O1(48),
      R => \<const0>\
    );
\r0_reg[49]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[49]_i_1\,
      Q => O1(49),
      R => \<const0>\
    );
\r0_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[4]_i_1\,
      Q => O1(4),
      R => \<const0>\
    );
\r0_reg[50]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[50]_i_1\,
      Q => O1(50),
      R => \<const0>\
    );
\r0_reg[51]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[51]_i_1\,
      Q => O1(51),
      R => \<const0>\
    );
\r0_reg[52]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[52]_i_1\,
      Q => O1(52),
      R => \<const0>\
    );
\r0_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[5]_i_1\,
      Q => O1(5),
      R => \<const0>\
    );
\r0_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[6]_i_1\,
      Q => O1(6),
      R => \<const0>\
    );
\r0_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[7]_i_1\,
      Q => O1(7),
      R => \<const0>\
    );
\r0_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[8]_i_1\,
      Q => O1(8),
      R => \<const0>\
    );
\r0_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \n_0_r0[31]_i_1\,
      D => \n_0_r0[9]_i_1\,
      Q => O1(9),
      R => \<const0>\
    );
\r1[52]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"000E"
    )
    port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(3),
      I3 => \^q\(1),
      O => load_r1
    );
\r1_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(0),
      Q => \n_0_r1_reg[0]\,
      R => \<const0>\
    );
\r1_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(10),
      Q => \n_0_r1_reg[10]\,
      R => \<const0>\
    );
\r1_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(11),
      Q => \n_0_r1_reg[11]\,
      R => \<const0>\
    );
\r1_reg[12]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(12),
      Q => \n_0_r1_reg[12]\,
      R => \<const0>\
    );
\r1_reg[13]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(13),
      Q => \n_0_r1_reg[13]\,
      R => \<const0>\
    );
\r1_reg[14]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(14),
      Q => \n_0_r1_reg[14]\,
      R => \<const0>\
    );
\r1_reg[15]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(15),
      Q => \n_0_r1_reg[15]\,
      R => \<const0>\
    );
\r1_reg[16]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(16),
      Q => \n_0_r1_reg[16]\,
      R => \<const0>\
    );
\r1_reg[17]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(17),
      Q => \n_0_r1_reg[17]\,
      R => \<const0>\
    );
\r1_reg[18]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(18),
      Q => \n_0_r1_reg[18]\,
      R => \<const0>\
    );
\r1_reg[19]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(19),
      Q => \n_0_r1_reg[19]\,
      R => \<const0>\
    );
\r1_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(1),
      Q => \n_0_r1_reg[1]\,
      R => \<const0>\
    );
\r1_reg[20]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(20),
      Q => \n_0_r1_reg[20]\,
      R => \<const0>\
    );
\r1_reg[21]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(21),
      Q => \n_0_r1_reg[21]\,
      R => \<const0>\
    );
\r1_reg[22]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(22),
      Q => \n_0_r1_reg[22]\,
      R => \<const0>\
    );
\r1_reg[23]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(23),
      Q => \n_0_r1_reg[23]\,
      R => \<const0>\
    );
\r1_reg[24]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(24),
      Q => \n_0_r1_reg[24]\,
      R => \<const0>\
    );
\r1_reg[25]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(25),
      Q => \n_0_r1_reg[25]\,
      R => \<const0>\
    );
\r1_reg[26]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(26),
      Q => \n_0_r1_reg[26]\,
      R => \<const0>\
    );
\r1_reg[27]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(27),
      Q => \n_0_r1_reg[27]\,
      R => \<const0>\
    );
\r1_reg[28]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(28),
      Q => \n_0_r1_reg[28]\,
      R => \<const0>\
    );
\r1_reg[29]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(29),
      Q => \n_0_r1_reg[29]\,
      R => \<const0>\
    );
\r1_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(2),
      Q => \n_0_r1_reg[2]\,
      R => \<const0>\
    );
\r1_reg[30]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(30),
      Q => \n_0_r1_reg[30]\,
      R => \<const0>\
    );
\r1_reg[31]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(31),
      Q => \n_0_r1_reg[31]\,
      R => \<const0>\
    );
\r1_reg[32]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(32),
      Q => \n_0_r1_reg[32]\,
      R => \<const0>\
    );
\r1_reg[33]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(33),
      Q => \n_0_r1_reg[33]\,
      R => \<const0>\
    );
\r1_reg[34]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(34),
      Q => \n_0_r1_reg[34]\,
      R => \<const0>\
    );
\r1_reg[35]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(35),
      Q => \n_0_r1_reg[35]\,
      R => \<const0>\
    );
\r1_reg[36]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(36),
      Q => \n_0_r1_reg[36]\,
      R => \<const0>\
    );
\r1_reg[37]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(37),
      Q => \n_0_r1_reg[37]\,
      R => \<const0>\
    );
\r1_reg[38]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(38),
      Q => \n_0_r1_reg[38]\,
      R => \<const0>\
    );
\r1_reg[39]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(39),
      Q => \n_0_r1_reg[39]\,
      R => \<const0>\
    );
\r1_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(3),
      Q => \n_0_r1_reg[3]\,
      R => \<const0>\
    );
\r1_reg[40]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(40),
      Q => \n_0_r1_reg[40]\,
      R => \<const0>\
    );
\r1_reg[41]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(41),
      Q => \n_0_r1_reg[41]\,
      R => \<const0>\
    );
\r1_reg[42]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(42),
      Q => \n_0_r1_reg[42]\,
      R => \<const0>\
    );
\r1_reg[43]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(43),
      Q => \n_0_r1_reg[43]\,
      R => \<const0>\
    );
\r1_reg[44]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(44),
      Q => \n_0_r1_reg[44]\,
      R => \<const0>\
    );
\r1_reg[45]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(45),
      Q => \n_0_r1_reg[45]\,
      R => \<const0>\
    );
\r1_reg[46]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(46),
      Q => \n_0_r1_reg[46]\,
      R => \<const0>\
    );
\r1_reg[47]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(47),
      Q => \n_0_r1_reg[47]\,
      R => \<const0>\
    );
\r1_reg[48]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(48),
      Q => \n_0_r1_reg[48]\,
      R => \<const0>\
    );
\r1_reg[49]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(49),
      Q => \n_0_r1_reg[49]\,
      R => \<const0>\
    );
\r1_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(4),
      Q => \n_0_r1_reg[4]\,
      R => \<const0>\
    );
\r1_reg[50]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(50),
      Q => \n_0_r1_reg[50]\,
      R => \<const0>\
    );
\r1_reg[51]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(51),
      Q => \n_0_r1_reg[51]\,
      R => \<const0>\
    );
\r1_reg[52]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(52),
      Q => \n_0_r1_reg[52]\,
      R => \<const0>\
    );
\r1_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(5),
      Q => \n_0_r1_reg[5]\,
      R => \<const0>\
    );
\r1_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(6),
      Q => \n_0_r1_reg[6]\,
      R => \<const0>\
    );
\r1_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(7),
      Q => \n_0_r1_reg[7]\,
      R => \<const0>\
    );
\r1_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(8),
      Q => \n_0_r1_reg[8]\,
      R => \<const0>\
    );
\r1_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => load_r1,
      D => D(9),
      Q => \n_0_r1_reg[9]\,
      R => \<const0>\
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_wrapper is
  port (
    DOUTB : out STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axis_aclk : in STD_LOGIC;
    I4 : in STD_LOGIC;
    ENB : in STD_LOGIC;
    I5 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    O6 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    I12 : in STD_LOGIC_VECTOR ( 17 downto 0 )
  );
end axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_wrapper;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_wrapper is
  signal \<const0>\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute box_type : string;
  attribute box_type of \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram\ : label is "PRIMITIVE";
begin
\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram\: unisim.vcomponents.RAMB18E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"00000",
      INIT_B => X"00000",
      INIT_FILE => "NONE",
      IS_CLKARDCLK_INVERTED => '0',
      IS_CLKBWRCLK_INVERTED => '0',
      IS_ENARDEN_INVERTED => '0',
      IS_ENBWREN_INVERTED => '0',
      IS_RSTRAMARSTRAM_INVERTED => '0',
      IS_RSTRAMB_INVERTED => '0',
      IS_RSTREGARSTREG_INVERTED => '0',
      IS_RSTREGB_INVERTED => '0',
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "REGCE",
      RSTREG_PRIORITY_B => "REGCE",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"00000",
      SRVAL_B => X"00000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "READ_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
    port map (
      ADDRARDADDR(13 downto 4) => I5(9 downto 0),
      ADDRARDADDR(3) => \<const0>\,
      ADDRARDADDR(2) => \<const0>\,
      ADDRARDADDR(1) => \<const0>\,
      ADDRARDADDR(0) => \<const0>\,
      ADDRBWRADDR(13 downto 4) => O6(9 downto 0),
      ADDRBWRADDR(3) => \<const0>\,
      ADDRBWRADDR(2) => \<const0>\,
      ADDRBWRADDR(1) => \<const0>\,
      ADDRBWRADDR(0) => \<const0>\,
      CLKARDCLK => s_axis_aclk,
      CLKBWRCLK => s_axis_aclk,
      DIADI(15 downto 12) => I12(4 downto 1),
      DIADI(11) => I12(6),
      DIADI(10 downto 8) => I12(9 downto 7),
      DIADI(7 downto 1) => I12(16 downto 10),
      DIADI(0) => I12(5),
      DIBDI(15) => \<const0>\,
      DIBDI(14) => \<const0>\,
      DIBDI(13) => \<const0>\,
      DIBDI(12) => \<const0>\,
      DIBDI(11) => \<const0>\,
      DIBDI(10) => \<const0>\,
      DIBDI(9) => \<const0>\,
      DIBDI(8) => \<const0>\,
      DIBDI(7) => \<const0>\,
      DIBDI(6) => \<const0>\,
      DIBDI(5) => \<const0>\,
      DIBDI(4) => \<const0>\,
      DIBDI(3) => \<const0>\,
      DIBDI(2) => \<const0>\,
      DIBDI(1) => \<const0>\,
      DIBDI(0) => \<const0>\,
      DIPADIP(1) => I12(0),
      DIPADIP(0) => I12(17),
      DIPBDIP(1) => \<const0>\,
      DIPBDIP(0) => \<const0>\,
      DOADO(15 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED\(15 downto 0),
      DOBDO(15 downto 8) => DOUTB(16 downto 9),
      DOBDO(7 downto 0) => DOUTB(7 downto 0),
      DOPADOP(1 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED\(1 downto 0),
      DOPBDOP(1) => DOUTB(17),
      DOPBDOP(0) => DOUTB(8),
      ENARDEN => I4,
      ENBWREN => ENB,
      REGCEAREGCE => \<const0>\,
      REGCEB => \<const0>\,
      RSTRAMARSTRAM => \<const0>\,
      RSTRAMB => \<const0>\,
      RSTREGARSTREG => \<const0>\,
      RSTREGB => \<const0>\,
      WEA(1) => I4,
      WEA(0) => I4,
      WEBWE(3) => \<const0>\,
      WEBWE(2) => \<const0>\,
      WEBWE(1) => \<const0>\,
      WEBWE(0) => \<const0>\
    );
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity \axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_wrapper__parameterized0\ is
  port (
    DOUTB : out STD_LOGIC_VECTOR ( 34 downto 0 );
    I4 : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    ENB : in STD_LOGIC;
    I5 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    O6 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    I12 : in STD_LOGIC_VECTOR ( 34 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_wrapper__parameterized0\ : entity is "blk_mem_gen_prim_wrapper";
end \axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_wrapper__parameterized0\;

architecture STRUCTURE of \axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_wrapper__parameterized0\ is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \n_72_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute box_type : string;
  attribute box_type of \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram\ : label is "PRIMITIVE";
begin
\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram\: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      IS_CLKARDCLK_INVERTED => '0',
      IS_CLKBWRCLK_INVERTED => '0',
      IS_ENARDEN_INVERTED => '0',
      IS_ENBWREN_INVERTED => '0',
      IS_RSTRAMARSTRAM_INVERTED => '0',
      IS_RSTRAMB_INVERTED => '0',
      IS_RSTREGARSTREG_INVERTED => '0',
      IS_RSTREGB_INVERTED => '0',
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "REGCE",
      RSTREG_PRIORITY_B => "REGCE",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "READ_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
    port map (
      ADDRARDADDR(15) => \<const1>\,
      ADDRARDADDR(14 downto 5) => I5(9 downto 0),
      ADDRARDADDR(4) => \<const1>\,
      ADDRARDADDR(3) => \<const1>\,
      ADDRARDADDR(2) => \<const1>\,
      ADDRARDADDR(1) => \<const1>\,
      ADDRARDADDR(0) => \<const1>\,
      ADDRBWRADDR(15) => \<const1>\,
      ADDRBWRADDR(14 downto 5) => O6(9 downto 0),
      ADDRBWRADDR(4) => \<const1>\,
      ADDRBWRADDR(3) => \<const1>\,
      ADDRBWRADDR(2) => \<const1>\,
      ADDRBWRADDR(1) => \<const1>\,
      ADDRBWRADDR(0) => \<const1>\,
      CASCADEINA => \<const0>\,
      CASCADEINB => \<const0>\,
      CASCADEOUTA => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED\,
      CASCADEOUTB => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED\,
      CLKARDCLK => s_axis_aclk,
      CLKBWRCLK => s_axis_aclk,
      DBITERR => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED\,
      DIADI(31 downto 24) => I12(31 downto 24),
      DIADI(23 downto 16) => I12(22 downto 15),
      DIADI(15 downto 8) => I12(13 downto 6),
      DIADI(7 downto 3) => I12(4 downto 0),
      DIADI(2 downto 0) => I12(34 downto 32),
      DIBDI(31) => \<const0>\,
      DIBDI(30) => \<const0>\,
      DIBDI(29) => \<const0>\,
      DIBDI(28) => \<const0>\,
      DIBDI(27) => \<const0>\,
      DIBDI(26) => \<const0>\,
      DIBDI(25) => \<const0>\,
      DIBDI(24) => \<const0>\,
      DIBDI(23) => \<const0>\,
      DIBDI(22) => \<const0>\,
      DIBDI(21) => \<const0>\,
      DIBDI(20) => \<const0>\,
      DIBDI(19) => \<const0>\,
      DIBDI(18) => \<const0>\,
      DIBDI(17) => \<const0>\,
      DIBDI(16) => \<const0>\,
      DIBDI(15) => \<const0>\,
      DIBDI(14) => \<const0>\,
      DIBDI(13) => \<const0>\,
      DIBDI(12) => \<const0>\,
      DIBDI(11) => \<const0>\,
      DIBDI(10) => \<const0>\,
      DIBDI(9) => \<const0>\,
      DIBDI(8) => \<const0>\,
      DIBDI(7) => \<const0>\,
      DIBDI(6) => \<const0>\,
      DIBDI(5) => \<const0>\,
      DIBDI(4) => \<const0>\,
      DIBDI(3) => \<const0>\,
      DIBDI(2) => \<const0>\,
      DIBDI(1) => \<const0>\,
      DIBDI(0) => \<const0>\,
      DIPADIP(3) => \<const0>\,
      DIPADIP(2) => I12(23),
      DIPADIP(1) => I12(14),
      DIPADIP(0) => I12(5),
      DIPBDIP(3) => \<const0>\,
      DIPBDIP(2) => \<const0>\,
      DIPBDIP(1) => \<const0>\,
      DIPBDIP(0) => \<const0>\,
      DOADO(31 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED\(31 downto 0),
      DOBDO(31 downto 24) => DOUTB(34 downto 27),
      DOBDO(23 downto 16) => DOUTB(25 downto 18),
      DOBDO(15 downto 8) => DOUTB(16 downto 9),
      DOBDO(7 downto 0) => DOUTB(7 downto 0),
      DOPADOP(3 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED\(3 downto 0),
      DOPBDOP(3) => \n_72_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram\,
      DOPBDOP(2) => DOUTB(26),
      DOPBDOP(1) => DOUTB(17),
      DOPBDOP(0) => DOUTB(8),
      ECCPARITY(7 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED\(7 downto 0),
      ENARDEN => I4,
      ENBWREN => ENB,
      INJECTDBITERR => \<const0>\,
      INJECTSBITERR => \<const0>\,
      RDADDRECC(8 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => \<const0>\,
      REGCEB => \<const0>\,
      RSTRAMARSTRAM => \<const0>\,
      RSTRAMB => \<const0>\,
      RSTREGARSTREG => \<const0>\,
      RSTREGB => \<const0>\,
      SBITERR => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED\,
      WEA(3) => I4,
      WEA(2) => I4,
      WEA(1) => I4,
      WEA(0) => I4,
      WEBWE(7) => \<const0>\,
      WEBWE(6) => \<const0>\,
      WEBWE(5) => \<const0>\,
      WEBWE(4) => \<const0>\,
      WEBWE(3) => \<const0>\,
      WEBWE(2) => \<const0>\,
      WEBWE(1) => \<const0>\,
      WEBWE(0) => \<const0>\
    );
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkcompare is
  port (
    comp0 : out STD_LOGIC;
    v1_reg : in STD_LOGIC_VECTOR ( 4 downto 0 )
  );
end axis_data_fifo_32w_1024d_aclkcompare;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkcompare is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal lopt : STD_LOGIC;
  signal lopt_1 : STD_LOGIC;
  signal \n_0_gmux.gm[3].gms.ms\ : STD_LOGIC;
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \gmux.gm[0].gm1.m1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type : string;
  attribute box_type of \gmux.gm[0].gm1.m1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \gmux.gm[4].gms.ms_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type of \gmux.gm[4].gms.ms_CARRY4\ : label is "PRIMITIVE";
begin
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
\gmux.gm[0].gm1.m1_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => lopt,
      CO(3) => \n_0_gmux.gm[3].gms.ms\,
      CO(2 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\(2 downto 0),
      CYINIT => \<const1>\,
      DI(3) => \<const0>\,
      DI(2) => \<const0>\,
      DI(1) => \<const0>\,
      DI(0) => \<const0>\,
      O(3 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => v1_reg(3 downto 0)
    );
\gmux.gm[0].gm1.m1_CARRY4_GND\: unisim.vcomponents.GND
    port map (
      G => lopt
    );
\gmux.gm[4].gms.ms_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gmux.gm[3].gms.ms\,
      CO(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\(3 downto 1),
      CO(0) => comp0,
      CYINIT => lopt_1,
      DI(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\(3 downto 1),
      DI(0) => \<const0>\,
      O(3 downto 0) => \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => v1_reg(4)
    );
\gmux.gm[4].gms.ms_CARRY4_GND\: unisim.vcomponents.GND
    port map (
      G => lopt_1
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkcompare_0 is
  port (
    comp1 : out STD_LOGIC;
    v1_reg_0 : in STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axis_data_fifo_32w_1024d_aclkcompare_0 : entity is "compare";
end axis_data_fifo_32w_1024d_aclkcompare_0;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkcompare_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal lopt : STD_LOGIC;
  signal lopt_1 : STD_LOGIC;
  signal \n_0_gmux.gm[3].gms.ms\ : STD_LOGIC;
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \gmux.gm[0].gm1.m1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type : string;
  attribute box_type of \gmux.gm[0].gm1.m1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \gmux.gm[4].gms.ms_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type of \gmux.gm[4].gms.ms_CARRY4\ : label is "PRIMITIVE";
begin
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
\gmux.gm[0].gm1.m1_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => lopt,
      CO(3) => \n_0_gmux.gm[3].gms.ms\,
      CO(2 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\(2 downto 0),
      CYINIT => \<const1>\,
      DI(3) => \<const0>\,
      DI(2) => \<const0>\,
      DI(1) => \<const0>\,
      DI(0) => \<const0>\,
      O(3 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => v1_reg_0(3 downto 0)
    );
\gmux.gm[0].gm1.m1_CARRY4_GND\: unisim.vcomponents.GND
    port map (
      G => lopt
    );
\gmux.gm[4].gms.ms_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gmux.gm[3].gms.ms\,
      CO(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\(3 downto 1),
      CO(0) => comp1,
      CYINIT => lopt_1,
      DI(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\(3 downto 1),
      DI(0) => \<const0>\,
      O(3 downto 0) => \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => v1_reg_0(4)
    );
\gmux.gm[4].gms.ms_CARRY4_GND\: unisim.vcomponents.GND
    port map (
      G => lopt_1
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkcompare_1 is
  port (
    p_0_in : out STD_LOGIC;
    v1_reg_1 : in STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axis_data_fifo_32w_1024d_aclkcompare_1 : entity is "compare";
end axis_data_fifo_32w_1024d_aclkcompare_1;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkcompare_1 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal lopt : STD_LOGIC;
  signal lopt_1 : STD_LOGIC;
  signal \n_0_gmux.gm[3].gms.ms\ : STD_LOGIC;
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \gmux.gm[0].gm1.m1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type : string;
  attribute box_type of \gmux.gm[0].gm1.m1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \gmux.gm[4].gms.ms_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type of \gmux.gm[4].gms.ms_CARRY4\ : label is "PRIMITIVE";
begin
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
\gmux.gm[0].gm1.m1_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => lopt,
      CO(3) => \n_0_gmux.gm[3].gms.ms\,
      CO(2 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\(2 downto 0),
      CYINIT => \<const1>\,
      DI(3) => \<const0>\,
      DI(2) => \<const0>\,
      DI(1) => \<const0>\,
      DI(0) => \<const0>\,
      O(3 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => v1_reg_1(3 downto 0)
    );
\gmux.gm[0].gm1.m1_CARRY4_GND\: unisim.vcomponents.GND
    port map (
      G => lopt
    );
\gmux.gm[4].gms.ms_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gmux.gm[3].gms.ms\,
      CO(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\(3 downto 1),
      CO(0) => p_0_in,
      CYINIT => lopt_1,
      DI(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\(3 downto 1),
      DI(0) => \<const0>\,
      O(3 downto 0) => \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => v1_reg_1(4)
    );
\gmux.gm[4].gms.ms_CARRY4_GND\: unisim.vcomponents.GND
    port map (
      G => lopt_1
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkcompare_2 is
  port (
    comp0 : out STD_LOGIC;
    v1_reg : in STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axis_data_fifo_32w_1024d_aclkcompare_2 : entity is "compare";
end axis_data_fifo_32w_1024d_aclkcompare_2;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkcompare_2 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal lopt : STD_LOGIC;
  signal lopt_1 : STD_LOGIC;
  signal \n_0_gmux.gm[3].gms.ms\ : STD_LOGIC;
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \gmux.gm[0].gm1.m1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type : string;
  attribute box_type of \gmux.gm[0].gm1.m1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \gmux.gm[4].gms.ms_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type of \gmux.gm[4].gms.ms_CARRY4\ : label is "PRIMITIVE";
begin
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
\gmux.gm[0].gm1.m1_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => lopt,
      CO(3) => \n_0_gmux.gm[3].gms.ms\,
      CO(2 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\(2 downto 0),
      CYINIT => \<const1>\,
      DI(3) => \<const0>\,
      DI(2) => \<const0>\,
      DI(1) => \<const0>\,
      DI(0) => \<const0>\,
      O(3 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => v1_reg(3 downto 0)
    );
\gmux.gm[0].gm1.m1_CARRY4_GND\: unisim.vcomponents.GND
    port map (
      G => lopt
    );
\gmux.gm[4].gms.ms_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gmux.gm[3].gms.ms\,
      CO(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\(3 downto 1),
      CO(0) => comp0,
      CYINIT => lopt_1,
      DI(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\(3 downto 1),
      DI(0) => \<const0>\,
      O(3 downto 0) => \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => v1_reg(4)
    );
\gmux.gm[4].gms.ms_CARRY4_GND\: unisim.vcomponents.GND
    port map (
      G => lopt_1
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkcompare_3 is
  port (
    comp1 : out STD_LOGIC;
    v1_reg_0 : in STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axis_data_fifo_32w_1024d_aclkcompare_3 : entity is "compare";
end axis_data_fifo_32w_1024d_aclkcompare_3;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkcompare_3 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal lopt : STD_LOGIC;
  signal lopt_1 : STD_LOGIC;
  signal \n_0_gmux.gm[3].gms.ms\ : STD_LOGIC;
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \gmux.gm[0].gm1.m1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type : string;
  attribute box_type of \gmux.gm[0].gm1.m1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \gmux.gm[4].gms.ms_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type of \gmux.gm[4].gms.ms_CARRY4\ : label is "PRIMITIVE";
begin
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
\gmux.gm[0].gm1.m1_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => lopt,
      CO(3) => \n_0_gmux.gm[3].gms.ms\,
      CO(2 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\(2 downto 0),
      CYINIT => \<const1>\,
      DI(3) => \<const0>\,
      DI(2) => \<const0>\,
      DI(1) => \<const0>\,
      DI(0) => \<const0>\,
      O(3 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => v1_reg_0(3 downto 0)
    );
\gmux.gm[0].gm1.m1_CARRY4_GND\: unisim.vcomponents.GND
    port map (
      G => lopt
    );
\gmux.gm[4].gms.ms_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gmux.gm[3].gms.ms\,
      CO(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\(3 downto 1),
      CO(0) => comp1,
      CYINIT => lopt_1,
      DI(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\(3 downto 1),
      DI(0) => \<const0>\,
      O(3 downto 0) => \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => v1_reg_0(4)
    );
\gmux.gm[4].gms.ms_CARRY4_GND\: unisim.vcomponents.GND
    port map (
      G => lopt_1
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkrd_bin_cntr is
  port (
    Q : out STD_LOGIC_VECTOR ( 9 downto 0 );
    O6 : out STD_LOGIC_VECTOR ( 9 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_aclk : in STD_LOGIC;
    I1 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end axis_data_fifo_32w_1024d_aclkrd_bin_cntr;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkrd_bin_cntr is
  signal \^q\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \n_0_gc0.count[9]_i_2\ : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 9 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gc0.count[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \gc0.count[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \gc0.count[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \gc0.count[4]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \gc0.count[6]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \gc0.count[7]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \gc0.count[8]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \gc0.count[9]_i_1\ : label is "soft_lutpair1";
  attribute counter : integer;
  attribute counter of \gc0.count_reg[0]\ : label is 7;
  attribute counter of \gc0.count_reg[1]\ : label is 7;
  attribute counter of \gc0.count_reg[2]\ : label is 7;
  attribute counter of \gc0.count_reg[3]\ : label is 7;
  attribute counter of \gc0.count_reg[4]\ : label is 7;
  attribute counter of \gc0.count_reg[5]\ : label is 7;
  attribute counter of \gc0.count_reg[6]\ : label is 7;
  attribute counter of \gc0.count_reg[7]\ : label is 7;
  attribute counter of \gc0.count_reg[8]\ : label is 7;
  attribute counter of \gc0.count_reg[9]\ : label is 7;
begin
  Q(9 downto 0) <= \^q\(9 downto 0);
\gc0.count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \^q\(0),
      O => plusOp(0)
    );
\gc0.count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => plusOp(1)
    );
\gc0.count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => plusOp(2)
    );
\gc0.count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
    port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => plusOp(3)
    );
\gc0.count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
    port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => plusOp(4)
    );
\gc0.count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
    port map (
      I0 => \^q\(3),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(4),
      I5 => \^q\(5),
      O => plusOp(5)
    );
\gc0.count[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \n_0_gc0.count[9]_i_2\,
      I1 => \^q\(6),
      O => plusOp(6)
    );
\gc0.count[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => \n_0_gc0.count[9]_i_2\,
      I1 => \^q\(6),
      I2 => \^q\(7),
      O => plusOp(7)
    );
\gc0.count[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
    port map (
      I0 => \^q\(6),
      I1 => \n_0_gc0.count[9]_i_2\,
      I2 => \^q\(7),
      I3 => \^q\(8),
      O => plusOp(8)
    );
\gc0.count[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
    port map (
      I0 => \^q\(7),
      I1 => \n_0_gc0.count[9]_i_2\,
      I2 => \^q\(6),
      I3 => \^q\(8),
      I4 => \^q\(9),
      O => plusOp(9)
    );
\gc0.count[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => \^q\(5),
      I1 => \^q\(3),
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => \^q\(2),
      I5 => \^q\(4),
      O => \n_0_gc0.count[9]_i_2\
    );
\gc0.count_d1_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I1(0),
      D => \^q\(0),
      Q => O6(0)
    );
\gc0.count_d1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I1(0),
      D => \^q\(1),
      Q => O6(1)
    );
\gc0.count_d1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I1(0),
      D => \^q\(2),
      Q => O6(2)
    );
\gc0.count_d1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I1(0),
      D => \^q\(3),
      Q => O6(3)
    );
\gc0.count_d1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I1(0),
      D => \^q\(4),
      Q => O6(4)
    );
\gc0.count_d1_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I1(0),
      D => \^q\(5),
      Q => O6(5)
    );
\gc0.count_d1_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I1(0),
      D => \^q\(6),
      Q => O6(6)
    );
\gc0.count_d1_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I1(0),
      D => \^q\(7),
      Q => O6(7)
    );
\gc0.count_d1_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I1(0),
      D => \^q\(8),
      Q => O6(8)
    );
\gc0.count_d1_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I1(0),
      D => \^q\(9),
      Q => O6(9)
    );
\gc0.count_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      D => plusOp(0),
      PRE => I1(0),
      Q => \^q\(0)
    );
\gc0.count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I1(0),
      D => plusOp(1),
      Q => \^q\(1)
    );
\gc0.count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I1(0),
      D => plusOp(2),
      Q => \^q\(2)
    );
\gc0.count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I1(0),
      D => plusOp(3),
      Q => \^q\(3)
    );
\gc0.count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I1(0),
      D => plusOp(4),
      Q => \^q\(4)
    );
\gc0.count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I1(0),
      D => plusOp(5),
      Q => \^q\(5)
    );
\gc0.count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I1(0),
      D => plusOp(6),
      Q => \^q\(6)
    );
\gc0.count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I1(0),
      D => plusOp(7),
      Q => \^q\(7)
    );
\gc0.count_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I1(0),
      D => plusOp(8),
      Q => \^q\(8)
    );
\gc0.count_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I1(0),
      D => plusOp(9),
      Q => \^q\(9)
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkrd_fwft is
  port (
    O1 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 10 downto 0 );
    O2 : out STD_LOGIC;
    p_13_out : out STD_LOGIC;
    O3 : out STD_LOGIC_VECTOR ( 0 to 0 );
    O7 : out STD_LOGIC;
    O8 : out STD_LOGIC;
    ENB : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    O5 : out STD_LOGIC_VECTOR ( 0 to 0 );
    O10 : out STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    DI : in STD_LOGIC_VECTOR ( 0 to 0 );
    S : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I3 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I4 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I1 : in STD_LOGIC;
    I7 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I5 : in STD_LOGIC;
    axis_wr_eop_d1 : in STD_LOGIC;
    I9 : in STD_LOGIC;
    I8 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_aclken : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    I10 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end axis_data_fifo_32w_1024d_aclkrd_fwft;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkrd_fwft is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^o1\ : STD_LOGIC;
  signal \^o2\ : STD_LOGIC;
  signal curr_fwft_state : STD_LOGIC_VECTOR ( 0 to 0 );
  signal empty_fwft_fb : STD_LOGIC;
  signal empty_fwft_i0 : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_5\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1\ : STD_LOGIC;
  signal \n_0_gpregsm1.curr_fwft_state_reg[1]\ : STD_LOGIC;
  signal \n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1\ : STD_LOGIC;
  signal \n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1\ : STD_LOGIC;
  signal \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2\ : STD_LOGIC;
  signal \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1\ : STD_LOGIC;
  signal \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1\ : STD_LOGIC;
  signal \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2\ : STD_LOGIC;
  signal \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1\ : STD_LOGIC;
  signal \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1\ : STD_LOGIC;
  signal next_fwft_state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^p_13_out\ : STD_LOGIC;
  signal \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_state[2]_i_2__0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \FSM_onehot_state[3]_i_4\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of empty_fwft_fb_i_1 : label is "soft_lutpair6";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of empty_fwft_fb_reg : label is "no";
  attribute equivalent_register_removal of empty_fwft_i_reg : label is "no";
  attribute SOFT_HLUTNM of \gc0.count_d1[9]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \gpregsm1.curr_fwft_state[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \gpregsm1.curr_fwft_state[1]_i_1\ : label is "soft_lutpair5";
  attribute equivalent_register_removal of \gpregsm1.curr_fwft_state_reg[0]\ : label is "no";
  attribute equivalent_register_removal of \gpregsm1.curr_fwft_state_reg[1]\ : label is "no";
begin
  O1 <= \^o1\;
  O2 <= \^o2\;
  p_13_out <= \^p_13_out\;
\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \^p_13_out\,
      I1 => I1,
      O => ENB
    );
\FSM_onehot_state[2]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000F40"
    )
    port map (
      I0 => \^o1\,
      I1 => I9,
      I2 => I8(0),
      I3 => I8(1),
      I4 => m_axis_aclken,
      O => O7
    );
\FSM_onehot_state[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => I9,
      I1 => \^o1\,
      O => O10
    );
\FSM_onehot_state[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000F0F0F00202020"
    )
    port map (
      I0 => I9,
      I1 => \^o1\,
      I2 => I8(2),
      I3 => m_axis_tready,
      I4 => m_axis_aclken,
      I5 => I8(3),
      O => O8
    );
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
empty_fwft_fb_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BA22"
    )
    port map (
      I0 => empty_fwft_fb,
      I1 => \n_0_gpregsm1.curr_fwft_state_reg[1]\,
      I2 => \^o2\,
      I3 => curr_fwft_state(0),
      O => empty_fwft_i0
    );
empty_fwft_fb_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => empty_fwft_i0,
      PRE => Q(1),
      Q => empty_fwft_fb
    );
empty_fwft_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => empty_fwft_i0,
      PRE => Q(1),
      Q => \^o1\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A8A8AAAAAAAAAAA"
    )
    port map (
      I0 => axis_wr_eop_d1,
      I1 => \^o1\,
      I2 => I9,
      I3 => I8(2),
      I4 => I8(0),
      I5 => I6(0),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_2\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2AD5"
    )
    port map (
      I0 => axis_wr_eop_d1,
      I1 => \^o2\,
      I2 => I6(0),
      I3 => I2(1),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_5\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1\,
      CO(3 downto 2) => \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2\,
      CO(0) => \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2\,
      CYINIT => \<const0>\,
      DI(3) => \<const0>\,
      DI(2) => \<const0>\,
      DI(1 downto 0) => I2(7 downto 6),
      O(3) => \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2_O_UNCONNECTED\(3),
      O(2 downto 0) => D(10 downto 8),
      S(3) => \<const0>\,
      S(2 downto 0) => I4(2 downto 0)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => \<const0>\,
      CO(3) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1\,
      CO(2) => \n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1\,
      CO(1) => \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1\,
      CO(0) => \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1\,
      CYINIT => \<const0>\,
      DI(3) => I2(1),
      DI(2) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_2\,
      DI(1) => DI(0),
      DI(0) => I2(0),
      O(3 downto 0) => D(3 downto 0),
      S(3) => S(2),
      S(2) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_5\,
      S(1 downto 0) => S(1 downto 0)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1\,
      CO(3) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1\,
      CO(2) => \n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1\,
      CO(1) => \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1\,
      CO(0) => \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1\,
      CYINIT => \<const0>\,
      DI(3 downto 0) => I2(5 downto 2),
      O(3 downto 0) => D(7 downto 4),
      S(3 downto 0) => I3(3 downto 0)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4440"
    )
    port map (
      I0 => \^o1\,
      I1 => I9,
      I2 => I8(2),
      I3 => I8(0),
      O => \^o2\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => \^o2\,
      I1 => I7(1),
      I2 => I7(0),
      I3 => I5,
      O => O3(0)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0001FFFE"
    )
    port map (
      I0 => \^o2\,
      I1 => I7(1),
      I2 => I7(0),
      I3 => I5,
      I4 => I10(0),
      O => O5(0)
    );
\gc0.count_d1[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00BF"
    )
    port map (
      I0 => \^o2\,
      I1 => curr_fwft_state(0),
      I2 => \n_0_gpregsm1.curr_fwft_state_reg[1]\,
      I3 => I1,
      O => \^p_13_out\
    );
\goreg_bm.dout_i[52]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B0"
    )
    port map (
      I0 => \^o2\,
      I1 => curr_fwft_state(0),
      I2 => \n_0_gpregsm1.curr_fwft_state_reg[1]\,
      I3 => Q(0),
      O => E(0)
    );
\gpregsm1.curr_fwft_state[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
    port map (
      I0 => \n_0_gpregsm1.curr_fwft_state_reg[1]\,
      I1 => \^o2\,
      I2 => curr_fwft_state(0),
      O => next_fwft_state(0)
    );
\gpregsm1.curr_fwft_state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"40FF"
    )
    port map (
      I0 => \^o2\,
      I1 => curr_fwft_state(0),
      I2 => \n_0_gpregsm1.curr_fwft_state_reg[1]\,
      I3 => I1,
      O => next_fwft_state(1)
    );
\gpregsm1.curr_fwft_state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      CLR => Q(1),
      D => next_fwft_state(0),
      Q => curr_fwft_state(0)
    );
\gpregsm1.curr_fwft_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      CLR => Q(1),
      D => next_fwft_state(1),
      Q => \n_0_gpregsm1.curr_fwft_state_reg[1]\
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkreset_blk_ramfifo is
  port (
    rst_full_gen_i : out STD_LOGIC;
    O1 : out STD_LOGIC;
    AR : out STD_LOGIC_VECTOR ( 0 to 0 );
    rst_d2 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_aclk : in STD_LOGIC;
    I10 : in STD_LOGIC
  );
end axis_data_fifo_32w_1024d_aclkreset_blk_ramfifo;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkreset_blk_ramfifo is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^o1\ : STD_LOGIC;
  signal \n_0_ngwrdrst.grst.g7serrst.rd_rst_asreg_i_1\ : STD_LOGIC;
  signal \n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\ : STD_LOGIC;
  signal \n_0_ngwrdrst.grst.g7serrst.wr_rst_asreg_i_1\ : STD_LOGIC;
  signal \n_0_ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1\ : STD_LOGIC;
  signal rd_rst_asreg : STD_LOGIC;
  signal rd_rst_asreg_d1 : STD_LOGIC;
  signal rd_rst_asreg_d2 : STD_LOGIC;
  signal rst_d1 : STD_LOGIC;
  signal \^rst_d2\ : STD_LOGIC;
  signal rst_d3 : STD_LOGIC;
  signal wr_rst_asreg : STD_LOGIC;
  signal wr_rst_asreg_d1 : STD_LOGIC;
  signal wr_rst_asreg_d2 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \grstd1.grst_full.grst_f.rst_d1_reg\ : label is true;
  attribute msgon : string;
  attribute msgon of \grstd1.grst_full.grst_f.rst_d1_reg\ : label is "true";
  attribute ASYNC_REG of \grstd1.grst_full.grst_f.rst_d2_reg\ : label is true;
  attribute msgon of \grstd1.grst_full.grst_f.rst_d2_reg\ : label is "true";
  attribute ASYNC_REG of \grstd1.grst_full.grst_f.rst_d3_reg\ : label is true;
  attribute msgon of \grstd1.grst_full.grst_f.rst_d3_reg\ : label is "true";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg\ : label is true;
  attribute msgon of \ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg\ : label is "true";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.rd_rst_asreg_d2_reg\ : label is true;
  attribute msgon of \ngwrdrst.grst.g7serrst.rd_rst_asreg_d2_reg\ : label is "true";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.rd_rst_asreg_reg\ : label is true;
  attribute msgon of \ngwrdrst.grst.g7serrst.rd_rst_asreg_reg\ : label is "true";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\ : label is "no";
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\ : label is "no";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg\ : label is true;
  attribute msgon of \ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg\ : label is "true";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.wr_rst_asreg_d2_reg\ : label is true;
  attribute msgon of \ngwrdrst.grst.g7serrst.wr_rst_asreg_d2_reg\ : label is "true";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.wr_rst_asreg_reg\ : label is true;
  attribute msgon of \ngwrdrst.grst.g7serrst.wr_rst_asreg_reg\ : label is "true";
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\ : label is "no";
begin
  O1 <= \^o1\;
  rst_d2 <= \^rst_d2\;
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => I10,
      O => \^o1\
    );
\grstd1.grst_full.grst_f.RST_FULL_GEN_reg\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      CLR => \^o1\,
      D => rst_d3,
      Q => rst_full_gen_i
    );
\grstd1.grst_full.grst_f.rst_d1_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => \<const0>\,
      PRE => \^o1\,
      Q => rst_d1
    );
\grstd1.grst_full.grst_f.rst_d2_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => rst_d1,
      PRE => \^o1\,
      Q => \^rst_d2\
    );
\grstd1.grst_full.grst_f.rst_d3_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => \^rst_d2\,
      PRE => \^o1\,
      Q => rst_d3
    );
\ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => rd_rst_asreg,
      Q => rd_rst_asreg_d1,
      R => \<const0>\
    );
\ngwrdrst.grst.g7serrst.rd_rst_asreg_d2_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => rd_rst_asreg_d1,
      Q => rd_rst_asreg_d2,
      R => \<const0>\
    );
\ngwrdrst.grst.g7serrst.rd_rst_asreg_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => rd_rst_asreg,
      I1 => rd_rst_asreg_d1,
      O => \n_0_ngwrdrst.grst.g7serrst.rd_rst_asreg_i_1\
    );
\ngwrdrst.grst.g7serrst.rd_rst_asreg_reg\: unisim.vcomponents.FDPE
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => \n_0_ngwrdrst.grst.g7serrst.rd_rst_asreg_i_1\,
      PRE => \^o1\,
      Q => rd_rst_asreg
    );
\ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => rd_rst_asreg,
      I1 => rd_rst_asreg_d2,
      O => \n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\
    );
\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => \<const0>\,
      PRE => \n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\,
      Q => Q(0)
    );
\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => \<const0>\,
      PRE => \n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\,
      Q => Q(1)
    );
\ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => wr_rst_asreg,
      Q => wr_rst_asreg_d1,
      R => \<const0>\
    );
\ngwrdrst.grst.g7serrst.wr_rst_asreg_d2_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => wr_rst_asreg_d1,
      Q => wr_rst_asreg_d2,
      R => \<const0>\
    );
\ngwrdrst.grst.g7serrst.wr_rst_asreg_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wr_rst_asreg,
      I1 => wr_rst_asreg_d1,
      O => \n_0_ngwrdrst.grst.g7serrst.wr_rst_asreg_i_1\
    );
\ngwrdrst.grst.g7serrst.wr_rst_asreg_reg\: unisim.vcomponents.FDPE
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => \n_0_ngwrdrst.grst.g7serrst.wr_rst_asreg_i_1\,
      PRE => \^o1\,
      Q => wr_rst_asreg
    );
\ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wr_rst_asreg,
      I1 => wr_rst_asreg_d2,
      O => \n_0_ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1\
    );
\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => \<const0>\,
      PRE => \n_0_ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1\,
      Q => AR(0)
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkwr_bin_cntr is
  port (
    p_2_out_0 : out STD_LOGIC;
    ram_full_comb : out STD_LOGIC;
    O5 : out STD_LOGIC;
    v1_reg : out STD_LOGIC_VECTOR ( 4 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 9 downto 0 );
    v1_reg_0 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    v1_reg_1 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    v1_reg_2 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    v1_reg_3 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    p_0_in : in STD_LOGIC;
    axis_almost_full : in STD_LOGIC;
    comp1_4 : in STD_LOGIC;
    p_13_out : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    rst_full_gen_i : in STD_LOGIC;
    p_2_out : in STD_LOGIC;
    comp0_5 : in STD_LOGIC;
    comp0 : in STD_LOGIC;
    p_17_out : in STD_LOGIC;
    comp1 : in STD_LOGIC;
    O6 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    I2 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axis_aclk : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end axis_data_fifo_32w_1024d_aclkwr_bin_cntr;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkwr_bin_cntr is
  signal \^q\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \n_0_gcc0.gc1.count[9]_i_2\ : STD_LOGIC;
  signal \plusOp__0\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal wr_pntr_plus1 : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal wr_pntr_plus2 : STD_LOGIC_VECTOR ( 9 downto 0 );
  attribute RETAIN_INVERTER : boolean;
  attribute RETAIN_INVERTER of \gcc0.gc1.count[0]_i_1\ : label is true;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gcc0.gc1.count[0]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \gcc0.gc1.count[2]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \gcc0.gc1.count[3]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \gcc0.gc1.count[4]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \gcc0.gc1.count[6]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \gcc0.gc1.count[7]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \gcc0.gc1.count[8]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \gcc0.gc1.count[9]_i_1\ : label is "soft_lutpair7";
  attribute counter : integer;
  attribute counter of \gcc0.gc1.count_reg[0]\ : label is 8;
  attribute counter of \gcc0.gc1.count_reg[1]\ : label is 8;
  attribute counter of \gcc0.gc1.count_reg[2]\ : label is 8;
  attribute counter of \gcc0.gc1.count_reg[3]\ : label is 8;
  attribute counter of \gcc0.gc1.count_reg[4]\ : label is 8;
  attribute counter of \gcc0.gc1.count_reg[5]\ : label is 8;
  attribute counter of \gcc0.gc1.count_reg[6]\ : label is 8;
  attribute counter of \gcc0.gc1.count_reg[7]\ : label is 8;
  attribute counter of \gcc0.gc1.count_reg[8]\ : label is 8;
  attribute counter of \gcc0.gc1.count_reg[9]\ : label is 8;
begin
  Q(9 downto 0) <= \^q\(9 downto 0);
\gaf.gaf0.ram_afull_i_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00AA0000CCEE0CCC"
    )
    port map (
      I0 => p_0_in,
      I1 => axis_almost_full,
      I2 => comp1_4,
      I3 => p_13_out,
      I4 => E(0),
      I5 => rst_full_gen_i,
      O => p_2_out_0
    );
\gcc0.gc1.count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => wr_pntr_plus2(0),
      O => \plusOp__0\(0)
    );
\gcc0.gc1.count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => wr_pntr_plus2(0),
      I1 => wr_pntr_plus2(1),
      O => \plusOp__0\(1)
    );
\gcc0.gc1.count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => wr_pntr_plus2(0),
      I1 => wr_pntr_plus2(1),
      I2 => wr_pntr_plus2(2),
      O => \plusOp__0\(2)
    );
\gcc0.gc1.count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
    port map (
      I0 => wr_pntr_plus2(1),
      I1 => wr_pntr_plus2(0),
      I2 => wr_pntr_plus2(2),
      I3 => wr_pntr_plus2(3),
      O => \plusOp__0\(3)
    );
\gcc0.gc1.count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
    port map (
      I0 => wr_pntr_plus2(2),
      I1 => wr_pntr_plus2(0),
      I2 => wr_pntr_plus2(1),
      I3 => wr_pntr_plus2(3),
      I4 => wr_pntr_plus2(4),
      O => \plusOp__0\(4)
    );
\gcc0.gc1.count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
    port map (
      I0 => wr_pntr_plus2(3),
      I1 => wr_pntr_plus2(1),
      I2 => wr_pntr_plus2(0),
      I3 => wr_pntr_plus2(2),
      I4 => wr_pntr_plus2(4),
      I5 => wr_pntr_plus2(5),
      O => \plusOp__0\(5)
    );
\gcc0.gc1.count[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \n_0_gcc0.gc1.count[9]_i_2\,
      I1 => wr_pntr_plus2(6),
      O => \plusOp__0\(6)
    );
\gcc0.gc1.count[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => \n_0_gcc0.gc1.count[9]_i_2\,
      I1 => wr_pntr_plus2(6),
      I2 => wr_pntr_plus2(7),
      O => \plusOp__0\(7)
    );
\gcc0.gc1.count[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
    port map (
      I0 => wr_pntr_plus2(6),
      I1 => \n_0_gcc0.gc1.count[9]_i_2\,
      I2 => wr_pntr_plus2(7),
      I3 => wr_pntr_plus2(8),
      O => \plusOp__0\(8)
    );
\gcc0.gc1.count[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
    port map (
      I0 => wr_pntr_plus2(7),
      I1 => \n_0_gcc0.gc1.count[9]_i_2\,
      I2 => wr_pntr_plus2(6),
      I3 => wr_pntr_plus2(8),
      I4 => wr_pntr_plus2(9),
      O => \plusOp__0\(9)
    );
\gcc0.gc1.count[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => wr_pntr_plus2(5),
      I1 => wr_pntr_plus2(3),
      I2 => wr_pntr_plus2(1),
      I3 => wr_pntr_plus2(0),
      I4 => wr_pntr_plus2(2),
      I5 => wr_pntr_plus2(4),
      O => \n_0_gcc0.gc1.count[9]_i_2\
    );
\gcc0.gc1.count_d1_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      D => wr_pntr_plus2(0),
      PRE => AR(0),
      Q => wr_pntr_plus1(0)
    );
\gcc0.gc1.count_d1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus2(1),
      Q => wr_pntr_plus1(1)
    );
\gcc0.gc1.count_d1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus2(2),
      Q => wr_pntr_plus1(2)
    );
\gcc0.gc1.count_d1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus2(3),
      Q => wr_pntr_plus1(3)
    );
\gcc0.gc1.count_d1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus2(4),
      Q => wr_pntr_plus1(4)
    );
\gcc0.gc1.count_d1_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus2(5),
      Q => wr_pntr_plus1(5)
    );
\gcc0.gc1.count_d1_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus2(6),
      Q => wr_pntr_plus1(6)
    );
\gcc0.gc1.count_d1_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus2(7),
      Q => wr_pntr_plus1(7)
    );
\gcc0.gc1.count_d1_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus2(8),
      Q => wr_pntr_plus1(8)
    );
\gcc0.gc1.count_d1_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus2(9),
      Q => wr_pntr_plus1(9)
    );
\gcc0.gc1.count_d2_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus1(0),
      Q => \^q\(0)
    );
\gcc0.gc1.count_d2_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus1(1),
      Q => \^q\(1)
    );
\gcc0.gc1.count_d2_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus1(2),
      Q => \^q\(2)
    );
\gcc0.gc1.count_d2_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus1(3),
      Q => \^q\(3)
    );
\gcc0.gc1.count_d2_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus1(4),
      Q => \^q\(4)
    );
\gcc0.gc1.count_d2_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus1(5),
      Q => \^q\(5)
    );
\gcc0.gc1.count_d2_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus1(6),
      Q => \^q\(6)
    );
\gcc0.gc1.count_d2_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus1(7),
      Q => \^q\(7)
    );
\gcc0.gc1.count_d2_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus1(8),
      Q => \^q\(8)
    );
\gcc0.gc1.count_d2_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus1(9),
      Q => \^q\(9)
    );
\gcc0.gc1.count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => \plusOp__0\(0),
      Q => wr_pntr_plus2(0)
    );
\gcc0.gc1.count_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      D => \plusOp__0\(1),
      PRE => AR(0),
      Q => wr_pntr_plus2(1)
    );
\gcc0.gc1.count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => \plusOp__0\(2),
      Q => wr_pntr_plus2(2)
    );
\gcc0.gc1.count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => \plusOp__0\(3),
      Q => wr_pntr_plus2(3)
    );
\gcc0.gc1.count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => \plusOp__0\(4),
      Q => wr_pntr_plus2(4)
    );
\gcc0.gc1.count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => \plusOp__0\(5),
      Q => wr_pntr_plus2(5)
    );
\gcc0.gc1.count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => \plusOp__0\(6),
      Q => wr_pntr_plus2(6)
    );
\gcc0.gc1.count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => \plusOp__0\(7),
      Q => wr_pntr_plus2(7)
    );
\gcc0.gc1.count_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => \plusOp__0\(8),
      Q => wr_pntr_plus2(8)
    );
\gcc0.gc1.count_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => AR(0),
      D => \plusOp__0\(9),
      Q => wr_pntr_plus2(9)
    );
\gmux.gm[0].gm1.m1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^q\(0),
      I1 => O6(0),
      I2 => \^q\(1),
      I3 => O6(1),
      O => v1_reg(0)
    );
\gmux.gm[0].gm1.m1_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^q\(0),
      I1 => I2(0),
      I2 => \^q\(1),
      I3 => I2(1),
      O => v1_reg_0(0)
    );
\gmux.gm[0].gm1.m1_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^q\(0),
      I1 => O6(0),
      I2 => \^q\(1),
      I3 => O6(1),
      O => v1_reg_1(0)
    );
\gmux.gm[0].gm1.m1_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => wr_pntr_plus1(0),
      I1 => O6(0),
      I2 => wr_pntr_plus1(1),
      I3 => O6(1),
      O => v1_reg_2(0)
    );
\gmux.gm[0].gm1.m1_i_1__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => wr_pntr_plus2(0),
      I1 => O6(0),
      I2 => wr_pntr_plus2(1),
      I3 => O6(1),
      O => v1_reg_3(0)
    );
\gmux.gm[1].gms.ms_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^q\(2),
      I1 => O6(2),
      I2 => \^q\(3),
      I3 => O6(3),
      O => v1_reg(1)
    );
\gmux.gm[1].gms.ms_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^q\(2),
      I1 => I2(2),
      I2 => \^q\(3),
      I3 => I2(3),
      O => v1_reg_0(1)
    );
\gmux.gm[1].gms.ms_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^q\(2),
      I1 => O6(2),
      I2 => \^q\(3),
      I3 => O6(3),
      O => v1_reg_1(1)
    );
\gmux.gm[1].gms.ms_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => wr_pntr_plus1(2),
      I1 => O6(2),
      I2 => wr_pntr_plus1(3),
      I3 => O6(3),
      O => v1_reg_2(1)
    );
\gmux.gm[1].gms.ms_i_1__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => wr_pntr_plus2(2),
      I1 => O6(2),
      I2 => wr_pntr_plus2(3),
      I3 => O6(3),
      O => v1_reg_3(1)
    );
\gmux.gm[2].gms.ms_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^q\(4),
      I1 => O6(4),
      I2 => \^q\(5),
      I3 => O6(5),
      O => v1_reg(2)
    );
\gmux.gm[2].gms.ms_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^q\(4),
      I1 => I2(4),
      I2 => \^q\(5),
      I3 => I2(5),
      O => v1_reg_0(2)
    );
\gmux.gm[2].gms.ms_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^q\(4),
      I1 => O6(4),
      I2 => \^q\(5),
      I3 => O6(5),
      O => v1_reg_1(2)
    );
\gmux.gm[2].gms.ms_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => wr_pntr_plus1(4),
      I1 => O6(4),
      I2 => wr_pntr_plus1(5),
      I3 => O6(5),
      O => v1_reg_2(2)
    );
\gmux.gm[2].gms.ms_i_1__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => wr_pntr_plus2(4),
      I1 => O6(4),
      I2 => wr_pntr_plus2(5),
      I3 => O6(5),
      O => v1_reg_3(2)
    );
\gmux.gm[3].gms.ms_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^q\(6),
      I1 => O6(6),
      I2 => \^q\(7),
      I3 => O6(7),
      O => v1_reg(3)
    );
\gmux.gm[3].gms.ms_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^q\(6),
      I1 => I2(6),
      I2 => \^q\(7),
      I3 => I2(7),
      O => v1_reg_0(3)
    );
\gmux.gm[3].gms.ms_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^q\(6),
      I1 => O6(6),
      I2 => \^q\(7),
      I3 => O6(7),
      O => v1_reg_1(3)
    );
\gmux.gm[3].gms.ms_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => wr_pntr_plus1(6),
      I1 => O6(6),
      I2 => wr_pntr_plus1(7),
      I3 => O6(7),
      O => v1_reg_2(3)
    );
\gmux.gm[3].gms.ms_i_1__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => wr_pntr_plus2(6),
      I1 => O6(6),
      I2 => wr_pntr_plus2(7),
      I3 => O6(7),
      O => v1_reg_3(3)
    );
\gmux.gm[4].gms.ms_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^q\(8),
      I1 => O6(8),
      I2 => \^q\(9),
      I3 => O6(9),
      O => v1_reg(4)
    );
\gmux.gm[4].gms.ms_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^q\(8),
      I1 => I2(8),
      I2 => \^q\(9),
      I3 => I2(9),
      O => v1_reg_0(4)
    );
\gmux.gm[4].gms.ms_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^q\(8),
      I1 => O6(8),
      I2 => \^q\(9),
      I3 => O6(9),
      O => v1_reg_1(4)
    );
\gmux.gm[4].gms.ms_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => wr_pntr_plus1(8),
      I1 => O6(8),
      I2 => wr_pntr_plus1(9),
      I3 => O6(9),
      O => v1_reg_2(4)
    );
\gmux.gm[4].gms.ms_i_1__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => wr_pntr_plus2(8),
      I1 => O6(8),
      I2 => wr_pntr_plus2(9),
      I3 => O6(9),
      O => v1_reg_3(4)
    );
ram_empty_fb_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4444FCCC"
    )
    port map (
      I0 => comp0,
      I1 => p_17_out,
      I2 => p_13_out,
      I3 => comp1,
      I4 => E(0),
      O => O5
    );
ram_full_fb_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008800F8F0F8"
    )
    port map (
      I0 => comp1_4,
      I1 => E(0),
      I2 => p_2_out,
      I3 => p_13_out,
      I4 => comp0_5,
      I5 => rst_full_gen_i,
      O => ram_full_comb
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter_wrapper is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    axis_wr_eop : out STD_LOGIC;
    O1 : out STD_LOGIC_VECTOR ( 52 downto 0 );
    s_axis_tready : out STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_aclken : in STD_LOGIC;
    ram_full_i : in STD_LOGIC;
    axis_rd_en : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 52 downto 0 );
    s_axis_aresetn : in STD_LOGIC
  );
end axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter_wrapper;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter_wrapper is
begin
\gen_aclken_converter.s_util_aclken_converter_0\: entity work.axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter
    port map (
      D(52 downto 0) => D(52 downto 0),
      E(0) => E(0),
      O1(52 downto 0) => O1(52 downto 0),
      Q(1 downto 0) => Q(1 downto 0),
      SS(0) => SR(0),
      axis_rd_en => axis_rd_en,
      axis_wr_eop => axis_wr_eop,
      ram_full_i => ram_full_i,
      s_axis_aclk => s_axis_aclk,
      s_axis_aclken => s_axis_aclken,
      s_axis_aresetn => s_axis_aresetn,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity \axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter_wrapper__parameterized0\ is
  port (
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    O1 : out STD_LOGIC_VECTOR ( 52 downto 0 );
    m_axis_aclken : in STD_LOGIC;
    I1 : in STD_LOGIC;
    p_8_out : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    I2 : in STD_LOGIC;
    I3 : in STD_LOGIC;
    I4 : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 52 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter_wrapper__parameterized0\ : entity is "axis_infrastructure_v1_1_util_aclken_converter_wrapper";
end \axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter_wrapper__parameterized0\;

architecture STRUCTURE of \axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter_wrapper__parameterized0\ is
begin
\gen_aclken_converter.s_util_aclken_converter_0\: entity work.\axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter__parameterized0\
    port map (
      D(52 downto 0) => D(52 downto 0),
      I1 => I1,
      I2 => I2,
      I3 => I3,
      I4 => I4,
      O1(52 downto 0) => O1(52 downto 0),
      Q(3 downto 0) => Q(3 downto 0),
      SR(0) => SR(0),
      m_axis_aclken => m_axis_aclken,
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => m_axis_tvalid,
      p_8_out => p_8_out,
      s_axis_aclk => s_axis_aclk
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_width is
  port (
    DOUTB : out STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axis_aclk : in STD_LOGIC;
    I4 : in STD_LOGIC;
    ENB : in STD_LOGIC;
    I5 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    O6 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    I12 : in STD_LOGIC_VECTOR ( 17 downto 0 )
  );
end axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_width;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_width is
begin
\prim_noinit.ram\: entity work.axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_wrapper
    port map (
      DOUTB(17 downto 0) => DOUTB(17 downto 0),
      ENB => ENB,
      I12(17 downto 0) => I12(17 downto 0),
      I4 => I4,
      I5(9 downto 0) => I5(9 downto 0),
      O6(9 downto 0) => O6(9 downto 0),
      s_axis_aclk => s_axis_aclk
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity \axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_width__parameterized0\ is
  port (
    DOUTB : out STD_LOGIC_VECTOR ( 34 downto 0 );
    I4 : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    ENB : in STD_LOGIC;
    I5 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    O6 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    I12 : in STD_LOGIC_VECTOR ( 34 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_width__parameterized0\ : entity is "blk_mem_gen_prim_width";
end \axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_width__parameterized0\;

architecture STRUCTURE of \axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_width__parameterized0\ is
begin
\prim_noinit.ram\: entity work.\axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_wrapper__parameterized0\
    port map (
      DOUTB(34 downto 0) => DOUTB(34 downto 0),
      ENB => ENB,
      I12(34 downto 0) => I12(34 downto 0),
      I4 => I4,
      I5(9 downto 0) => I5(9 downto 0),
      O6(9 downto 0) => O6(9 downto 0),
      s_axis_aclk => s_axis_aclk
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkrd_status_flags_ss is
  port (
    comp0 : out STD_LOGIC;
    comp1 : out STD_LOGIC;
    p_17_out : out STD_LOGIC;
    v1_reg : in STD_LOGIC_VECTOR ( 4 downto 0 );
    v1_reg_0 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    I1 : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end axis_data_fifo_32w_1024d_aclkrd_status_flags_ss;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkrd_status_flags_ss is
  signal \<const1>\ : STD_LOGIC;
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of ram_empty_fb_i_reg : label is "no";
begin
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
c1: entity work.axis_data_fifo_32w_1024d_aclkcompare_2
    port map (
      comp0 => comp0,
      v1_reg(4 downto 0) => v1_reg(4 downto 0)
    );
c2: entity work.axis_data_fifo_32w_1024d_aclkcompare_3
    port map (
      comp1 => comp1,
      v1_reg_0(4 downto 0) => v1_reg_0(4 downto 0)
    );
ram_empty_fb_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => I1,
      PRE => Q(0),
      Q => p_17_out
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkwr_status_flags_ss is
  port (
    comp0 : out STD_LOGIC;
    comp1 : out STD_LOGIC;
    p_0_in : out STD_LOGIC;
    p_2_out : out STD_LOGIC;
    axis_almost_full : out STD_LOGIC;
    O1 : out STD_LOGIC;
    O4 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    O2 : out STD_LOGIC;
    v1_reg : in STD_LOGIC_VECTOR ( 4 downto 0 );
    v1_reg_0 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    v1_reg_1 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    ram_full_comb : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    rst_d2 : in STD_LOGIC;
    p_2_out_2 : in STD_LOGIC;
    I3 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    O3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    S : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I5 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I6 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I7 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I1 : in STD_LOGIC
  );
end axis_data_fifo_32w_1024d_aclkwr_status_flags_ss;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkwr_status_flags_ss is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^o1\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_5\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1\ : STD_LOGIC;
  signal \n_1_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1\ : STD_LOGIC;
  signal \n_1_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1\ : STD_LOGIC;
  signal \n_2_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2\ : STD_LOGIC;
  signal \n_2_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1\ : STD_LOGIC;
  signal \n_2_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1\ : STD_LOGIC;
  signal \n_3_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2\ : STD_LOGIC;
  signal \n_3_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1\ : STD_LOGIC;
  signal \n_3_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1\ : STD_LOGIC;
  signal \^p_2_out\ : STD_LOGIC;
  signal \NLW_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \gaf.gaf0.ram_afull_i_reg\ : label is "no";
  attribute equivalent_register_removal of ram_full_fb_i_reg : label is "no";
  attribute equivalent_register_removal of ram_full_i_reg : label is "no";
begin
  O1 <= \^o1\;
  p_2_out <= \^p_2_out\;
\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => \^o1\,
      I1 => I7(0),
      I2 => I7(1),
      I3 => \^p_2_out\,
      O => O2
    );
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
c0: entity work.axis_data_fifo_32w_1024d_aclkcompare
    port map (
      comp0 => comp0,
      v1_reg(4 downto 0) => v1_reg(4 downto 0)
    );
c1: entity work.axis_data_fifo_32w_1024d_aclkcompare_0
    port map (
      comp1 => comp1,
      v1_reg_0(4 downto 0) => v1_reg_0(4 downto 0)
    );
\gaf.c2\: entity work.axis_data_fifo_32w_1024d_aclkcompare_1
    port map (
      p_0_in => p_0_in,
      v1_reg_1(4 downto 0) => v1_reg_1(4 downto 0)
    );
\gaf.gaf0.ram_afull_i_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => p_2_out_2,
      PRE => rst_d2,
      Q => axis_almost_full
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => \^o1\,
      I1 => I7(0),
      I2 => I7(1),
      I3 => I1,
      O => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_2\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0001FFFE"
    )
    port map (
      I0 => \^o1\,
      I1 => I7(0),
      I2 => I7(1),
      I3 => I1,
      I4 => I3(1),
      O => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_5\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1\,
      CO(3 downto 2) => \NLW_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \n_2_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2\,
      CO(0) => \n_3_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2\,
      CYINIT => \<const0>\,
      DI(3) => \<const0>\,
      DI(2) => \<const0>\,
      DI(1 downto 0) => I3(7 downto 6),
      O(3) => \NLW_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2_O_UNCONNECTED\(3),
      O(2 downto 0) => O4(10 downto 8),
      S(3) => \<const0>\,
      S(2 downto 0) => I6(2 downto 0)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => \<const0>\,
      CO(3) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1\,
      CO(2) => \n_1_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1\,
      CO(1) => \n_2_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1\,
      CO(0) => \n_3_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1\,
      CYINIT => \<const0>\,
      DI(3) => I3(1),
      DI(2) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_2\,
      DI(1) => O3(0),
      DI(0) => I3(0),
      O(3 downto 0) => O4(3 downto 0),
      S(3) => S(2),
      S(2) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_5\,
      S(1 downto 0) => S(1 downto 0)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1\,
      CO(3) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1\,
      CO(2) => \n_1_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1\,
      CO(1) => \n_2_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1\,
      CO(0) => \n_3_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1\,
      CYINIT => \<const0>\,
      DI(3 downto 0) => I3(5 downto 2),
      O(3 downto 0) => O4(7 downto 4),
      S(3 downto 0) => I5(3 downto 0)
    );
ram_full_fb_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => ram_full_comb,
      PRE => rst_d2,
      Q => \^p_2_out\
    );
ram_full_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => ram_full_comb,
      PRE => rst_d2,
      Q => \^o1\
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkblk_mem_gen_generic_cstr is
  port (
    DOUTB : out STD_LOGIC_VECTOR ( 52 downto 0 );
    s_axis_aclk : in STD_LOGIC;
    I4 : in STD_LOGIC;
    ENB : in STD_LOGIC;
    I5 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    O6 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    I12 : in STD_LOGIC_VECTOR ( 52 downto 0 )
  );
end axis_data_fifo_32w_1024d_aclkblk_mem_gen_generic_cstr;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkblk_mem_gen_generic_cstr is
begin
\ramloop[0].ram.r\: entity work.axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_width
    port map (
      DOUTB(17 downto 0) => DOUTB(17 downto 0),
      ENB => ENB,
      I12(17 downto 1) => I12(52 downto 36),
      I12(0) => I12(32),
      I4 => I4,
      I5(9 downto 0) => I5(9 downto 0),
      O6(9 downto 0) => O6(9 downto 0),
      s_axis_aclk => s_axis_aclk
    );
\ramloop[1].ram.r\: entity work.\axis_data_fifo_32w_1024d_aclkblk_mem_gen_prim_width__parameterized0\
    port map (
      DOUTB(34 downto 0) => DOUTB(52 downto 18),
      ENB => ENB,
      I12(34 downto 32) => I12(35 downto 33),
      I12(31 downto 0) => I12(31 downto 0),
      I4 => I4,
      I5(9 downto 0) => I5(9 downto 0),
      O6(9 downto 0) => O6(9 downto 0),
      s_axis_aclk => s_axis_aclk
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkrd_logic is
  port (
    comp0 : out STD_LOGIC;
    comp1 : out STD_LOGIC;
    p_17_out : out STD_LOGIC;
    O1 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 10 downto 0 );
    O2 : out STD_LOGIC;
    p_13_out : out STD_LOGIC;
    O3 : out STD_LOGIC_VECTOR ( 0 to 0 );
    O7 : out STD_LOGIC;
    O8 : out STD_LOGIC;
    O4 : out STD_LOGIC_VECTOR ( 9 downto 0 );
    ENB : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    O5 : out STD_LOGIC_VECTOR ( 0 to 0 );
    O10 : out STD_LOGIC;
    O6 : out STD_LOGIC_VECTOR ( 9 downto 0 );
    v1_reg : in STD_LOGIC_VECTOR ( 4 downto 0 );
    v1_reg_0 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    I1 : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    DI : in STD_LOGIC_VECTOR ( 0 to 0 );
    S : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I3 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I4 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I7 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I5 : in STD_LOGIC;
    axis_wr_eop_d1 : in STD_LOGIC;
    I9 : in STD_LOGIC;
    I8 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_aclken : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    I10 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end axis_data_fifo_32w_1024d_aclkrd_logic;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkrd_logic is
  signal \^p_13_out\ : STD_LOGIC;
  signal \^p_17_out\ : STD_LOGIC;
begin
  p_13_out <= \^p_13_out\;
  p_17_out <= \^p_17_out\;
\gr1.rfwft\: entity work.axis_data_fifo_32w_1024d_aclkrd_fwft
    port map (
      D(10 downto 0) => D(10 downto 0),
      DI(0) => DI(0),
      E(0) => E(0),
      ENB => ENB,
      I1 => \^p_17_out\,
      I10(0) => I10(0),
      I2(7 downto 0) => I2(7 downto 0),
      I3(3 downto 0) => I3(3 downto 0),
      I4(2 downto 0) => I4(2 downto 0),
      I5 => I5,
      I6(0) => I6(0),
      I7(1 downto 0) => I7(1 downto 0),
      I8(3 downto 0) => I8(3 downto 0),
      I9 => I9,
      O1 => O1,
      O10 => O10,
      O2 => O2,
      O3(0) => O3(0),
      O5(0) => O5(0),
      O7 => O7,
      O8 => O8,
      Q(1 downto 0) => Q(1 downto 0),
      S(2 downto 0) => S(2 downto 0),
      axis_wr_eop_d1 => axis_wr_eop_d1,
      m_axis_aclken => m_axis_aclken,
      m_axis_tready => m_axis_tready,
      p_13_out => \^p_13_out\,
      s_axis_aclk => s_axis_aclk
    );
\grss.rsts\: entity work.axis_data_fifo_32w_1024d_aclkrd_status_flags_ss
    port map (
      I1 => I1,
      Q(0) => Q(1),
      comp0 => comp0,
      comp1 => comp1,
      p_17_out => \^p_17_out\,
      s_axis_aclk => s_axis_aclk,
      v1_reg(4 downto 0) => v1_reg(4 downto 0),
      v1_reg_0(4 downto 0) => v1_reg_0(4 downto 0)
    );
rpntr: entity work.axis_data_fifo_32w_1024d_aclkrd_bin_cntr
    port map (
      E(0) => \^p_13_out\,
      I1(0) => Q(1),
      O6(9 downto 0) => O6(9 downto 0),
      Q(9 downto 0) => O4(9 downto 0),
      s_axis_aclk => s_axis_aclk
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkwr_logic is
  port (
    axis_almost_full : out STD_LOGIC;
    O1 : out STD_LOGIC;
    O4 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    O2 : out STD_LOGIC;
    O5 : out STD_LOGIC;
    v1_reg : out STD_LOGIC_VECTOR ( 4 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 9 downto 0 );
    v1_reg_0 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axis_aclk : in STD_LOGIC;
    rst_d2 : in STD_LOGIC;
    I3 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    O3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    S : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I5 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I6 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    p_13_out : in STD_LOGIC;
    rst_full_gen_i : in STD_LOGIC;
    comp0 : in STD_LOGIC;
    p_17_out : in STD_LOGIC;
    comp1 : in STD_LOGIC;
    I7 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I1 : in STD_LOGIC;
    O6 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    I2 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    AR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end axis_data_fifo_32w_1024d_aclkwr_logic;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkwr_logic is
  signal \^o2\ : STD_LOGIC;
  signal \^axis_almost_full\ : STD_LOGIC;
  signal \c0/v1_reg\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \c1/v1_reg\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal comp0_2 : STD_LOGIC;
  signal comp1_1 : STD_LOGIC;
  signal \gaf.c2/v1_reg\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal p_0_in : STD_LOGIC;
  signal p_2_out : STD_LOGIC;
  signal p_2_out_0 : STD_LOGIC;
  signal ram_full_comb : STD_LOGIC;
begin
  O2 <= \^o2\;
  axis_almost_full <= \^axis_almost_full\;
\gwss.wsts\: entity work.axis_data_fifo_32w_1024d_aclkwr_status_flags_ss
    port map (
      I1 => I1,
      I3(7 downto 0) => I3(7 downto 0),
      I5(3 downto 0) => I5(3 downto 0),
      I6(2 downto 0) => I6(2 downto 0),
      I7(1 downto 0) => I7(1 downto 0),
      O1 => O1,
      O2 => \^o2\,
      O3(0) => O3(0),
      O4(10 downto 0) => O4(10 downto 0),
      S(2 downto 0) => S(2 downto 0),
      axis_almost_full => \^axis_almost_full\,
      comp0 => comp0_2,
      comp1 => comp1_1,
      p_0_in => p_0_in,
      p_2_out => p_2_out,
      p_2_out_2 => p_2_out_0,
      ram_full_comb => ram_full_comb,
      rst_d2 => rst_d2,
      s_axis_aclk => s_axis_aclk,
      v1_reg(4 downto 0) => \c0/v1_reg\(4 downto 0),
      v1_reg_0(4 downto 0) => \c1/v1_reg\(4 downto 0),
      v1_reg_1(4 downto 0) => \gaf.c2/v1_reg\(4 downto 0)
    );
wpntr: entity work.axis_data_fifo_32w_1024d_aclkwr_bin_cntr
    port map (
      AR(0) => AR(0),
      E(0) => \^o2\,
      I2(9 downto 0) => I2(9 downto 0),
      O5 => O5,
      O6(9 downto 0) => O6(9 downto 0),
      Q(9 downto 0) => Q(9 downto 0),
      axis_almost_full => \^axis_almost_full\,
      comp0 => comp0,
      comp0_5 => comp0_2,
      comp1 => comp1,
      comp1_4 => comp1_1,
      p_0_in => p_0_in,
      p_13_out => p_13_out,
      p_17_out => p_17_out,
      p_2_out => p_2_out,
      p_2_out_0 => p_2_out_0,
      ram_full_comb => ram_full_comb,
      rst_full_gen_i => rst_full_gen_i,
      s_axis_aclk => s_axis_aclk,
      v1_reg(4 downto 0) => v1_reg(4 downto 0),
      v1_reg_0(4 downto 0) => v1_reg_0(4 downto 0),
      v1_reg_1(4 downto 0) => \c0/v1_reg\(4 downto 0),
      v1_reg_2(4 downto 0) => \c1/v1_reg\(4 downto 0),
      v1_reg_3(4 downto 0) => \gaf.c2/v1_reg\(4 downto 0)
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkblk_mem_gen_top is
  port (
    DOUTB : out STD_LOGIC_VECTOR ( 52 downto 0 );
    s_axis_aclk : in STD_LOGIC;
    I4 : in STD_LOGIC;
    ENB : in STD_LOGIC;
    I5 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    O6 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    I12 : in STD_LOGIC_VECTOR ( 52 downto 0 )
  );
end axis_data_fifo_32w_1024d_aclkblk_mem_gen_top;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkblk_mem_gen_top is
begin
\valid.cstr\: entity work.axis_data_fifo_32w_1024d_aclkblk_mem_gen_generic_cstr
    port map (
      DOUTB(52 downto 0) => DOUTB(52 downto 0),
      ENB => ENB,
      I12(52 downto 0) => I12(52 downto 0),
      I4 => I4,
      I5(9 downto 0) => I5(9 downto 0),
      O6(9 downto 0) => O6(9 downto 0),
      s_axis_aclk => s_axis_aclk
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkblk_mem_gen_v8_1_synth is
  port (
    DOUTB : out STD_LOGIC_VECTOR ( 52 downto 0 );
    s_axis_aclk : in STD_LOGIC;
    I4 : in STD_LOGIC;
    ENB : in STD_LOGIC;
    I5 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    O6 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    I12 : in STD_LOGIC_VECTOR ( 52 downto 0 )
  );
end axis_data_fifo_32w_1024d_aclkblk_mem_gen_v8_1_synth;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkblk_mem_gen_v8_1_synth is
begin
\gnativebmg.native_blk_mem_gen\: entity work.axis_data_fifo_32w_1024d_aclkblk_mem_gen_top
    port map (
      DOUTB(52 downto 0) => DOUTB(52 downto 0),
      ENB => ENB,
      I12(52 downto 0) => I12(52 downto 0),
      I4 => I4,
      I5(9 downto 0) => I5(9 downto 0),
      O6(9 downto 0) => O6(9 downto 0),
      s_axis_aclk => s_axis_aclk
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity \axis_data_fifo_32w_1024d_aclkblk_mem_gen_v8_1__parameterized0\ is
  port (
    DOUTB : out STD_LOGIC_VECTOR ( 52 downto 0 );
    s_axis_aclk : in STD_LOGIC;
    I4 : in STD_LOGIC;
    ENB : in STD_LOGIC;
    I5 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    O6 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    I12 : in STD_LOGIC_VECTOR ( 52 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \axis_data_fifo_32w_1024d_aclkblk_mem_gen_v8_1__parameterized0\ : entity is "blk_mem_gen_v8_1";
end \axis_data_fifo_32w_1024d_aclkblk_mem_gen_v8_1__parameterized0\;

architecture STRUCTURE of \axis_data_fifo_32w_1024d_aclkblk_mem_gen_v8_1__parameterized0\ is
begin
inst_blk_mem_gen: entity work.axis_data_fifo_32w_1024d_aclkblk_mem_gen_v8_1_synth
    port map (
      DOUTB(52 downto 0) => DOUTB(52 downto 0),
      ENB => ENB,
      I12(52 downto 0) => I12(52 downto 0),
      I4 => I4,
      I5(9 downto 0) => I5(9 downto 0),
      O6(9 downto 0) => O6(9 downto 0),
      s_axis_aclk => s_axis_aclk
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkmemory is
  port (
    Q : out STD_LOGIC_VECTOR ( 52 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    DI : out STD_LOGIC_VECTOR ( 0 to 0 );
    O9 : out STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 0 to 0 );
    axis_wr_eop_d1 : in STD_LOGIC;
    I1 : in STD_LOGIC;
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    I8 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I9 : in STD_LOGIC;
    I2 : in STD_LOGIC;
    axis_almost_full : in STD_LOGIC;
    I11 : in STD_LOGIC;
    I3 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_aclk : in STD_LOGIC;
    I4 : in STD_LOGIC;
    ENB : in STD_LOGIC;
    I5 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    O6 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    I12 : in STD_LOGIC_VECTOR ( 52 downto 0 );
    I6 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end axis_data_fifo_32w_1024d_aclkmemory;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkmemory is
  signal \<const0>\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 52 downto 0 );
  signal doutb : STD_LOGIC_VECTOR ( 52 downto 0 );
  signal p_14_out : STD_LOGIC;
begin
  Q(52 downto 0) <= \^q\(52 downto 0);
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA666AAAAA"
    )
    port map (
      I0 => axis_wr_eop_d1,
      I1 => \^q\(0),
      I2 => I8(0),
      I3 => I8(1),
      I4 => I9,
      I5 => I2,
      O => E(0)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000A800FFFFFFFF"
    )
    port map (
      I0 => \^q\(0),
      I1 => I8(0),
      I2 => I8(1),
      I3 => I9,
      I4 => I2,
      I5 => axis_wr_eop_d1,
      O => DI(0)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"708F"
    )
    port map (
      I0 => \^q\(0),
      I1 => I1,
      I2 => axis_wr_eop_d1,
      I3 => I3(0),
      O => S(0)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555555555504"
    )
    port map (
      I0 => p_14_out,
      I1 => axis_almost_full,
      I2 => I2,
      I3 => I11,
      I4 => I3(1),
      I5 => I9,
      O => O9
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
    port map (
      I0 => axis_wr_eop_d1,
      I1 => \^q\(0),
      I2 => I1,
      I3 => CO(0),
      O => p_14_out
    );
\gbm.gbmg.gbmga.ngecc.bmg\: entity work.\axis_data_fifo_32w_1024d_aclkblk_mem_gen_v8_1__parameterized0\
    port map (
      DOUTB(52 downto 0) => doutb(52 downto 0),
      ENB => ENB,
      I12(52 downto 0) => I12(52 downto 0),
      I4 => I4,
      I5(9 downto 0) => I5(9 downto 0),
      O6(9 downto 0) => O6(9 downto 0),
      s_axis_aclk => s_axis_aclk
    );
\goreg_bm.dout_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(0),
      Q => \^q\(0),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(10),
      Q => \^q\(10),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(11),
      Q => \^q\(11),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(12),
      Q => \^q\(12),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(13),
      Q => \^q\(13),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(14),
      Q => \^q\(14),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(15),
      Q => \^q\(15),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(16),
      Q => \^q\(16),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(17),
      Q => \^q\(17),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(18),
      Q => \^q\(18),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(19),
      Q => \^q\(19),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(1),
      Q => \^q\(1),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(20),
      Q => \^q\(20),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(21),
      Q => \^q\(21),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(22),
      Q => \^q\(22),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(23),
      Q => \^q\(23),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(24),
      Q => \^q\(24),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(25),
      Q => \^q\(25),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(26),
      Q => \^q\(26),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(27),
      Q => \^q\(27),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(28),
      Q => \^q\(28),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(29),
      Q => \^q\(29),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(2),
      Q => \^q\(2),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(30),
      Q => \^q\(30),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(31),
      Q => \^q\(31),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(32),
      Q => \^q\(32),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(33),
      Q => \^q\(33),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(34),
      Q => \^q\(34),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(35),
      Q => \^q\(35),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(36),
      Q => \^q\(36),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(37),
      Q => \^q\(37),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(38),
      Q => \^q\(38),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(39),
      Q => \^q\(39),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(3),
      Q => \^q\(3),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(40),
      Q => \^q\(40),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(41),
      Q => \^q\(41),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(42),
      Q => \^q\(42),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(43),
      Q => \^q\(43),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(44),
      Q => \^q\(44),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(45),
      Q => \^q\(45),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(46),
      Q => \^q\(46),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(47),
      Q => \^q\(47),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(48),
      Q => \^q\(48),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(49),
      Q => \^q\(49),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(4),
      Q => \^q\(4),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(50),
      Q => \^q\(50),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(51),
      Q => \^q\(51),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(52),
      Q => \^q\(52),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(5),
      Q => \^q\(5),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(6),
      Q => \^q\(6),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(7),
      Q => \^q\(7),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(8),
      Q => \^q\(8),
      R => \<const0>\
    );
\goreg_bm.dout_i_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => I6(0),
      D => doutb(9),
      Q => \^q\(9),
      R => \<const0>\
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkfifo_generator_ramfifo is
  port (
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    O3 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 10 downto 0 );
    O4 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    O5 : out STD_LOGIC;
    O6 : out STD_LOGIC_VECTOR ( 52 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    O7 : out STD_LOGIC;
    O8 : out STD_LOGIC;
    O9 : out STD_LOGIC;
    O10 : out STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 9 downto 0 );
    S : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I2 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I3 : in STD_LOGIC_VECTOR ( 8 downto 0 );
    I4 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I5 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I6 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I7 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    axis_wr_eop_d1 : in STD_LOGIC;
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    I8 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I9 : in STD_LOGIC;
    m_axis_aclken : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    I10 : in STD_LOGIC;
    I11 : in STD_LOGIC;
    I12 : in STD_LOGIC_VECTOR ( 52 downto 0 )
  );
end axis_data_fifo_32w_1024d_aclkfifo_generator_ramfifo;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkfifo_generator_ramfifo is
  signal \^o2\ : STD_LOGIC;
  signal \^o3\ : STD_LOGIC;
  signal \^o5\ : STD_LOGIC;
  signal \^o6\ : STD_LOGIC_VECTOR ( 52 downto 0 );
  signal RD_RST : STD_LOGIC;
  signal RST : STD_LOGIC;
  signal axis_almost_full : STD_LOGIC;
  signal \grss.rsts/c1/v1_reg\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \grss.rsts/c2/v1_reg\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \grss.rsts/comp0\ : STD_LOGIC;
  signal \grss.rsts/comp1\ : STD_LOGIC;
  signal \n_13_gntv_or_sync_fifo.gl0.wr\ : STD_LOGIC;
  signal \n_14_gntv_or_sync_fifo.gl0.wr\ : STD_LOGIC;
  signal \n_17_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_30_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_31_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_32_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_54_gntv_or_sync_fifo.mem\ : STD_LOGIC;
  signal \n_56_gntv_or_sync_fifo.mem\ : STD_LOGIC;
  signal n_5_rstblk : STD_LOGIC;
  signal p_13_out : STD_LOGIC;
  signal p_17_out : STD_LOGIC;
  signal p_19_out : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal p_8_out : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal rd_pntr_plus1 : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal rst_d2 : STD_LOGIC;
  signal rst_full_gen_i : STD_LOGIC;
begin
  O2 <= \^o2\;
  O3 <= \^o3\;
  O5 <= \^o5\;
  O6(52 downto 0) <= \^o6\(52 downto 0);
\gntv_or_sync_fifo.gl0.rd\: entity work.axis_data_fifo_32w_1024d_aclkrd_logic
    port map (
      D(10 downto 0) => D(10 downto 0),
      DI(0) => \n_54_gntv_or_sync_fifo.mem\,
      E(0) => \n_31_gntv_or_sync_fifo.gl0.rd\,
      ENB => \n_30_gntv_or_sync_fifo.gl0.rd\,
      I1 => \n_14_gntv_or_sync_fifo.gl0.wr\,
      I10(0) => I3(1),
      I2(7 downto 1) => Q(8 downto 2),
      I2(0) => Q(0),
      I3(3 downto 0) => I1(3 downto 0),
      I4(2 downto 0) => I2(2 downto 0),
      I5 => \^o3\,
      I6(0) => \^o6\(0),
      I7(1 downto 0) => I7(1 downto 0),
      I8(3 downto 0) => I8(3 downto 0),
      I9 => I9,
      O1 => \^o2\,
      O10 => O10,
      O2 => \^o5\,
      O3(0) => \n_17_gntv_or_sync_fifo.gl0.rd\,
      O4(9 downto 0) => rd_pntr_plus1(9 downto 0),
      O5(0) => \n_32_gntv_or_sync_fifo.gl0.rd\,
      O6(9 downto 0) => p_19_out(9 downto 0),
      O7 => O7,
      O8 => O8,
      Q(1) => RD_RST,
      Q(0) => n_5_rstblk,
      S(2) => S(1),
      S(1) => \n_56_gntv_or_sync_fifo.mem\,
      S(0) => S(0),
      axis_wr_eop_d1 => axis_wr_eop_d1,
      comp0 => \grss.rsts/comp0\,
      comp1 => \grss.rsts/comp1\,
      m_axis_aclken => m_axis_aclken,
      m_axis_tready => m_axis_tready,
      p_13_out => p_13_out,
      p_17_out => p_17_out,
      s_axis_aclk => s_axis_aclk,
      v1_reg(4 downto 0) => \grss.rsts/c1/v1_reg\(4 downto 0),
      v1_reg_0(4 downto 0) => \grss.rsts/c2/v1_reg\(4 downto 0)
    );
\gntv_or_sync_fifo.gl0.wr\: entity work.axis_data_fifo_32w_1024d_aclkwr_logic
    port map (
      AR(0) => RST,
      I1 => \^o5\,
      I2(9 downto 0) => rd_pntr_plus1(9 downto 0),
      I3(7 downto 1) => I3(8 downto 2),
      I3(0) => I3(0),
      I5(3 downto 0) => I5(3 downto 0),
      I6(2 downto 0) => I6(2 downto 0),
      I7(1 downto 0) => I7(1 downto 0),
      O1 => \^o3\,
      O2 => \n_13_gntv_or_sync_fifo.gl0.wr\,
      O3(0) => \n_17_gntv_or_sync_fifo.gl0.rd\,
      O4(10 downto 0) => O4(10 downto 0),
      O5 => \n_14_gntv_or_sync_fifo.gl0.wr\,
      O6(9 downto 0) => p_19_out(9 downto 0),
      Q(9 downto 0) => p_8_out(9 downto 0),
      S(2) => I4(1),
      S(1) => \n_32_gntv_or_sync_fifo.gl0.rd\,
      S(0) => I4(0),
      axis_almost_full => axis_almost_full,
      comp0 => \grss.rsts/comp0\,
      comp1 => \grss.rsts/comp1\,
      p_13_out => p_13_out,
      p_17_out => p_17_out,
      rst_d2 => rst_d2,
      rst_full_gen_i => rst_full_gen_i,
      s_axis_aclk => s_axis_aclk,
      v1_reg(4 downto 0) => \grss.rsts/c1/v1_reg\(4 downto 0),
      v1_reg_0(4 downto 0) => \grss.rsts/c2/v1_reg\(4 downto 0)
    );
\gntv_or_sync_fifo.mem\: entity work.axis_data_fifo_32w_1024d_aclkmemory
    port map (
      CO(0) => CO(0),
      DI(0) => \n_54_gntv_or_sync_fifo.mem\,
      E(0) => E(0),
      ENB => \n_30_gntv_or_sync_fifo.gl0.rd\,
      I1 => \^o5\,
      I11 => I11,
      I12(52 downto 0) => I12(52 downto 0),
      I2 => \^o2\,
      I3(1) => Q(9),
      I3(0) => Q(1),
      I4 => \n_13_gntv_or_sync_fifo.gl0.wr\,
      I5(9 downto 0) => p_8_out(9 downto 0),
      I6(0) => \n_31_gntv_or_sync_fifo.gl0.rd\,
      I8(1) => I8(2),
      I8(0) => I8(0),
      I9 => I9,
      O6(9 downto 0) => p_19_out(9 downto 0),
      O9 => O9,
      Q(52 downto 0) => \^o6\(52 downto 0),
      S(0) => \n_56_gntv_or_sync_fifo.mem\,
      axis_almost_full => axis_almost_full,
      axis_wr_eop_d1 => axis_wr_eop_d1,
      s_axis_aclk => s_axis_aclk
    );
rstblk: entity work.axis_data_fifo_32w_1024d_aclkreset_blk_ramfifo
    port map (
      AR(0) => RST,
      I10 => I10,
      O1 => O1,
      Q(1) => RD_RST,
      Q(0) => n_5_rstblk,
      rst_d2 => rst_d2,
      rst_full_gen_i => rst_full_gen_i,
      s_axis_aclk => s_axis_aclk
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkfifo_generator_top is
  port (
    AR : out STD_LOGIC_VECTOR ( 0 to 0 );
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 10 downto 0 );
    O3 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    O4 : out STD_LOGIC;
    O5 : out STD_LOGIC_VECTOR ( 52 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    O6 : out STD_LOGIC;
    O7 : out STD_LOGIC;
    O8 : out STD_LOGIC;
    O9 : out STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 9 downto 0 );
    S : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I2 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I3 : in STD_LOGIC_VECTOR ( 8 downto 0 );
    I4 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I5 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I6 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I7 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    axis_wr_eop_d1 : in STD_LOGIC;
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    I8 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I9 : in STD_LOGIC;
    m_axis_aclken : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    I10 : in STD_LOGIC;
    I11 : in STD_LOGIC;
    I12 : in STD_LOGIC_VECTOR ( 52 downto 0 )
  );
end axis_data_fifo_32w_1024d_aclkfifo_generator_top;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkfifo_generator_top is
begin
\grf.rf\: entity work.axis_data_fifo_32w_1024d_aclkfifo_generator_ramfifo
    port map (
      CO(0) => CO(0),
      D(10 downto 0) => D(10 downto 0),
      E(0) => E(0),
      I1(3 downto 0) => I1(3 downto 0),
      I10 => I10,
      I11 => I11,
      I12(52 downto 0) => I12(52 downto 0),
      I2(2 downto 0) => I2(2 downto 0),
      I3(8 downto 0) => I3(8 downto 0),
      I4(1 downto 0) => I4(1 downto 0),
      I5(3 downto 0) => I5(3 downto 0),
      I6(2 downto 0) => I6(2 downto 0),
      I7(1 downto 0) => I7(1 downto 0),
      I8(3 downto 0) => I8(3 downto 0),
      I9 => I9,
      O1 => AR(0),
      O10 => O9,
      O2 => O1,
      O3 => O2,
      O4(10 downto 0) => O3(10 downto 0),
      O5 => O4,
      O6(52 downto 0) => O5(52 downto 0),
      O7 => O6,
      O8 => O7,
      O9 => O8,
      Q(9 downto 0) => Q(9 downto 0),
      S(1 downto 0) => S(1 downto 0),
      axis_wr_eop_d1 => axis_wr_eop_d1,
      m_axis_aclken => m_axis_aclken,
      m_axis_tready => m_axis_tready,
      s_axis_aclk => s_axis_aclk
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkfifo_generator_v11_0_synth is
  port (
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    O3 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 10 downto 0 );
    O4 : out STD_LOGIC;
    O5 : out STD_LOGIC_VECTOR ( 52 downto 0 );
    O6 : out STD_LOGIC;
    O7 : out STD_LOGIC;
    O8 : out STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    axis_wr_eop : in STD_LOGIC;
    I1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I2 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_aclken : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    I3 : in STD_LOGIC;
    I4 : in STD_LOGIC_VECTOR ( 52 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end axis_data_fifo_32w_1024d_aclkfifo_generator_v11_0_synth;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkfifo_generator_v11_0_synth is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^o3\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal axis_wr_eop_d1 : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_3\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_4\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_5\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_4\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_7\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_3\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_4\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_5\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_10\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_11\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_3\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_5\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_8\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_9\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_5\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_6\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_7\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_4\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_7\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_3\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_4\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_5\ : STD_LOGIC;
  signal \n_10_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_11_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_12_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_13_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_14_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_15_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_16_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_17_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_18_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_19_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6\ : STD_LOGIC;
  signal \n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7\ : STD_LOGIC;
  signal \n_20_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_21_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_22_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_23_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_24_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4\ : STD_LOGIC;
  signal \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6\ : STD_LOGIC;
  signal \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7\ : STD_LOGIC;
  signal \n_3_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4\ : STD_LOGIC;
  signal \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6\ : STD_LOGIC;
  signal \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7\ : STD_LOGIC;
  signal \n_4_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_5_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_6_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_79_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_7_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_82_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_8_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_9_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal p_13_in : STD_LOGIC;
  signal \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute counter : integer;
  attribute counter of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[0]\ : label is 5;
  attribute counter of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]\ : label is 5;
  attribute counter of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[1]\ : label is 5;
  attribute counter of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[2]\ : label is 5;
  attribute counter of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]\ : label is 5;
  attribute counter of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[4]\ : label is 5;
  attribute counter of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[5]\ : label is 5;
  attribute counter of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[6]\ : label is 5;
  attribute counter of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]\ : label is 5;
  attribute counter of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[8]\ : label is 5;
  attribute counter of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[9]\ : label is 5;
  attribute counter of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[0]\ : label is 6;
  attribute counter of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]\ : label is 6;
  attribute counter of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[1]\ : label is 6;
  attribute counter of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[2]\ : label is 6;
  attribute counter of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]\ : label is 6;
  attribute counter of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[4]\ : label is 6;
  attribute counter of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[5]\ : label is 6;
  attribute counter of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[6]\ : label is 6;
  attribute counter of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]\ : label is 6;
  attribute counter of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[8]\ : label is 6;
  attribute counter of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[9]\ : label is 6;
begin
  O3 <= \^o3\;
  Q(10 downto 0) <= \^q\(10 downto 0);
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
\gaxis_fifo.gaxisf.axisf\: entity work.axis_data_fifo_32w_1024d_aclkfifo_generator_top
    port map (
      AR(0) => clear,
      CO(0) => p_13_in,
      D(10) => \n_3_gaxis_fifo.gaxisf.axisf\,
      D(9) => \n_4_gaxis_fifo.gaxisf.axisf\,
      D(8) => \n_5_gaxis_fifo.gaxisf.axisf\,
      D(7) => \n_6_gaxis_fifo.gaxisf.axisf\,
      D(6) => \n_7_gaxis_fifo.gaxisf.axisf\,
      D(5) => \n_8_gaxis_fifo.gaxisf.axisf\,
      D(4) => \n_9_gaxis_fifo.gaxisf.axisf\,
      D(3) => \n_10_gaxis_fifo.gaxisf.axisf\,
      D(2) => \n_11_gaxis_fifo.gaxisf.axisf\,
      D(1) => \n_12_gaxis_fifo.gaxisf.axisf\,
      D(0) => \n_13_gaxis_fifo.gaxisf.axisf\,
      E(0) => \n_79_gaxis_fifo.gaxisf.axisf\,
      I1(3) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_2\,
      I1(2) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_3\,
      I1(1) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_4\,
      I1(0) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_5\,
      I10 => I3,
      I11 => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_3\,
      I12(52 downto 0) => I4(52 downto 0),
      I2(2) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_3\,
      I2(1) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_4\,
      I2(0) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_5\,
      I3(8 downto 0) => \^q\(8 downto 0),
      I4(1) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_4\,
      I4(0) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_7\,
      I5(3) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_2\,
      I5(2) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_3\,
      I5(1) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_4\,
      I5(0) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_5\,
      I6(2) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_5\,
      I6(1) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_6\,
      I6(0) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_7\,
      I7(1 downto 0) => I1(1 downto 0),
      I8(3 downto 0) => I2(3 downto 0),
      I9 => \^o3\,
      O1 => O1,
      O2 => O2,
      O3(10) => \n_14_gaxis_fifo.gaxisf.axisf\,
      O3(9) => \n_15_gaxis_fifo.gaxisf.axisf\,
      O3(8) => \n_16_gaxis_fifo.gaxisf.axisf\,
      O3(7) => \n_17_gaxis_fifo.gaxisf.axisf\,
      O3(6) => \n_18_gaxis_fifo.gaxisf.axisf\,
      O3(5) => \n_19_gaxis_fifo.gaxisf.axisf\,
      O3(4) => \n_20_gaxis_fifo.gaxisf.axisf\,
      O3(3) => \n_21_gaxis_fifo.gaxisf.axisf\,
      O3(2) => \n_22_gaxis_fifo.gaxisf.axisf\,
      O3(1) => \n_23_gaxis_fifo.gaxisf.axisf\,
      O3(0) => \n_24_gaxis_fifo.gaxisf.axisf\,
      O4 => O4,
      O5(52 downto 0) => O5(52 downto 0),
      O6 => O6,
      O7 => O7,
      O8 => \n_82_gaxis_fifo.gaxisf.axisf\,
      O9 => O8,
      Q(9) => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(10),
      Q(8 downto 0) => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(8 downto 0),
      S(1) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_4\,
      S(0) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_7\,
      axis_wr_eop_d1 => axis_wr_eop_d1,
      m_axis_aclken => m_axis_aclken,
      m_axis_tready => m_axis_tready,
      s_axis_aclk => s_axis_aclk
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(9),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(10),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_3\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(8),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(9),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_4\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(7),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(8),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_5\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(2),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(3),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_4\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(0),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_7\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(6),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(7),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_2\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(5),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(6),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_3\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(4),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(5),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_4\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(3),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(4),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_5\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \n_79_gaxis_fifo.gaxisf.axisf\,
      CLR => clear,
      D => \n_13_gaxis_fifo.gaxisf.axisf\,
      Q => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(0)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \n_79_gaxis_fifo.gaxisf.axisf\,
      CLR => clear,
      D => \n_3_gaxis_fifo.gaxisf.axisf\,
      Q => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(10)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \n_79_gaxis_fifo.gaxisf.axisf\,
      CLR => clear,
      D => \n_12_gaxis_fifo.gaxisf.axisf\,
      Q => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(1)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \n_79_gaxis_fifo.gaxisf.axisf\,
      CLR => clear,
      D => \n_11_gaxis_fifo.gaxisf.axisf\,
      Q => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(2)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \n_79_gaxis_fifo.gaxisf.axisf\,
      CLR => clear,
      D => \n_10_gaxis_fifo.gaxisf.axisf\,
      Q => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(3)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \n_79_gaxis_fifo.gaxisf.axisf\,
      CLR => clear,
      D => \n_9_gaxis_fifo.gaxisf.axisf\,
      Q => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(4)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \n_79_gaxis_fifo.gaxisf.axisf\,
      CLR => clear,
      D => \n_8_gaxis_fifo.gaxisf.axisf\,
      Q => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(5)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \n_79_gaxis_fifo.gaxisf.axisf\,
      CLR => clear,
      D => \n_7_gaxis_fifo.gaxisf.axisf\,
      Q => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(6)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \n_79_gaxis_fifo.gaxisf.axisf\,
      CLR => clear,
      D => \n_6_gaxis_fifo.gaxisf.axisf\,
      Q => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(7)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \n_79_gaxis_fifo.gaxisf.axisf\,
      CLR => clear,
      D => \n_5_gaxis_fifo.gaxisf.axisf\,
      Q => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(8)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \n_79_gaxis_fifo.gaxisf.axisf\,
      CLR => clear,
      D => \n_4_gaxis_fifo.gaxisf.axisf\,
      Q => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(9)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(5),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(4),
      I2 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(3),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_10\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(0),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(2),
      I2 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(1),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_11\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF4"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(1),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(0),
      I2 => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_5\,
      I3 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(7),
      I4 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(8),
      I5 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(9),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_3\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(2),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(1),
      I2 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(5),
      I3 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(6),
      I4 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(3),
      I5 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(4),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_5\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(9),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(10),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_8\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(8),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(7),
      I2 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0\(6),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_9\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      CLR => clear,
      D => \n_82_gaxis_fifo.gaxisf.axisf\,
      Q => \^o3\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6\,
      CO(3) => \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4_CO_UNCONNECTED\(3),
      CO(2) => p_13_in,
      CO(1) => \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4\,
      CO(0) => \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4\,
      CYINIT => \<const0>\,
      DI(3) => \<const0>\,
      DI(2) => \<const0>\,
      DI(1) => \<const0>\,
      DI(0) => \<const0>\,
      O(3 downto 0) => \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4_O_UNCONNECTED\(3 downto 0),
      S(3) => \<const0>\,
      S(2) => \<const1>\,
      S(1) => \<const1>\,
      S(0) => \<const1>\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7\,
      CO(3) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6\,
      CO(2) => \n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6\,
      CO(1) => \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6\,
      CO(0) => \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6\,
      CYINIT => \<const0>\,
      DI(3) => \<const0>\,
      DI(2) => \<const0>\,
      DI(1) => \<const0>\,
      DI(0) => \<const0>\,
      O(3 downto 0) => \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6_O_UNCONNECTED\(3 downto 0),
      S(3) => \<const1>\,
      S(2) => \<const1>\,
      S(1) => \<const1>\,
      S(0) => \<const1>\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7\: unisim.vcomponents.CARRY4
    port map (
      CI => \<const0>\,
      CO(3) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7\,
      CO(2) => \n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7\,
      CO(1) => \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7\,
      CO(0) => \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7\,
      CYINIT => \<const1>\,
      DI(3) => \<const0>\,
      DI(2) => \<const0>\,
      DI(1) => \<const0>\,
      DI(0) => \<const0>\,
      O(3 downto 0) => \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7_O_UNCONNECTED\(3 downto 0),
      S(3) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_8\,
      S(2) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_9\,
      S(1) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_10\,
      S(0) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_11\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_wr_eop_d1_reg\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      CLR => clear,
      D => axis_wr_eop,
      Q => axis_wr_eop_d1
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^q\(9),
      I1 => \^q\(10),
      O => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_5\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^q\(8),
      I1 => \^q\(9),
      O => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_6\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^q\(7),
      I1 => \^q\(8),
      O => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_7\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^q\(2),
      I1 => \^q\(3),
      O => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_4\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \^q\(0),
      O => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_7\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^q\(6),
      I1 => \^q\(7),
      O => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_2\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^q\(5),
      I1 => \^q\(6),
      O => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_3\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^q\(4),
      I1 => \^q\(5),
      O => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_4\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^q\(3),
      I1 => \^q\(4),
      O => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_5\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => clear,
      D => \n_24_gaxis_fifo.gaxisf.axisf\,
      Q => \^q\(0)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => clear,
      D => \n_14_gaxis_fifo.gaxisf.axisf\,
      Q => \^q\(10)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => clear,
      D => \n_23_gaxis_fifo.gaxisf.axisf\,
      Q => \^q\(1)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => clear,
      D => \n_22_gaxis_fifo.gaxisf.axisf\,
      Q => \^q\(2)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => clear,
      D => \n_21_gaxis_fifo.gaxisf.axisf\,
      Q => \^q\(3)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => clear,
      D => \n_20_gaxis_fifo.gaxisf.axisf\,
      Q => \^q\(4)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => clear,
      D => \n_19_gaxis_fifo.gaxisf.axisf\,
      Q => \^q\(5)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => clear,
      D => \n_18_gaxis_fifo.gaxisf.axisf\,
      Q => \^q\(6)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => clear,
      D => \n_17_gaxis_fifo.gaxisf.axisf\,
      Q => \^q\(7)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => clear,
      D => \n_16_gaxis_fifo.gaxisf.axisf\,
      Q => \^q\(8)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => clear,
      D => \n_15_gaxis_fifo.gaxisf.axisf\,
      Q => \^q\(9)
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkfifo_generator_v11_0 is
  port (
    p_8_out : out STD_LOGIC;
    ram_full_i : out STD_LOGIC;
    O1 : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_rd_en : out STD_LOGIC;
    O2 : out STD_LOGIC_VECTOR ( 52 downto 0 );
    O3 : out STD_LOGIC;
    O4 : out STD_LOGIC;
    O5 : out STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    axis_wr_eop : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_aclken : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    I2 : in STD_LOGIC;
    I3 : in STD_LOGIC_VECTOR ( 52 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end axis_data_fifo_32w_1024d_aclkfifo_generator_v11_0;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkfifo_generator_v11_0 is
begin
inst_fifo_gen: entity work.axis_data_fifo_32w_1024d_aclkfifo_generator_v11_0_synth
    port map (
      E(0) => E(0),
      I1(1 downto 0) => Q(1 downto 0),
      I2(3 downto 0) => I1(3 downto 0),
      I3 => I2,
      I4(52 downto 0) => I3(52 downto 0),
      O1 => p_8_out,
      O2 => ram_full_i,
      O3 => O1,
      O4 => axis_rd_en,
      O5(52 downto 0) => O2(52 downto 0),
      O6 => O3,
      O7 => O4,
      O8 => O5,
      Q(10 downto 0) => axis_data_count(10 downto 0),
      axis_wr_eop => axis_wr_eop,
      m_axis_aclken => m_axis_aclken,
      m_axis_tready => m_axis_tready,
      s_axis_aclk => s_axis_aclk
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo is
  port (
    s_axis_aresetn : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_aclken : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_aclk : in STD_LOGIC;
    m_axis_aclken : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 7 downto 0 );
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute C_FAMILY : string;
  attribute C_FAMILY of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is "kintex7";
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 32;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 3;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 8;
  attribute C_AXIS_SIGNAL_SET : string;
  attribute C_AXIS_SIGNAL_SET of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is "32'b00000000000000000000000011111111";
  attribute C_FIFO_DEPTH : integer;
  attribute C_FIFO_DEPTH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1024;
  attribute C_FIFO_MODE : integer;
  attribute C_FIFO_MODE of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 2;
  attribute C_IS_ACLK_ASYNC : integer;
  attribute C_IS_ACLK_ASYNC of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 0;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 2;
  attribute C_ACLKEN_CONV_MODE : integer;
  attribute C_ACLKEN_CONV_MODE of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 3;
  attribute G_INDX_SS_TREADY : integer;
  attribute G_INDX_SS_TREADY of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 0;
  attribute G_INDX_SS_TDATA : integer;
  attribute G_INDX_SS_TDATA of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute G_INDX_SS_TSTRB : integer;
  attribute G_INDX_SS_TSTRB of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 2;
  attribute G_INDX_SS_TKEEP : integer;
  attribute G_INDX_SS_TKEEP of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 3;
  attribute G_INDX_SS_TLAST : integer;
  attribute G_INDX_SS_TLAST of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 4;
  attribute G_INDX_SS_TID : integer;
  attribute G_INDX_SS_TID of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 5;
  attribute G_INDX_SS_TDEST : integer;
  attribute G_INDX_SS_TDEST of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 6;
  attribute G_INDX_SS_TUSER : integer;
  attribute G_INDX_SS_TUSER of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 7;
  attribute G_MASK_SS_TREADY : integer;
  attribute G_MASK_SS_TREADY of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute G_MASK_SS_TDATA : integer;
  attribute G_MASK_SS_TDATA of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 2;
  attribute G_MASK_SS_TSTRB : integer;
  attribute G_MASK_SS_TSTRB of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 4;
  attribute G_MASK_SS_TKEEP : integer;
  attribute G_MASK_SS_TKEEP of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 8;
  attribute G_MASK_SS_TLAST : integer;
  attribute G_MASK_SS_TLAST of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 16;
  attribute G_MASK_SS_TID : integer;
  attribute G_MASK_SS_TID of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 32;
  attribute G_MASK_SS_TDEST : integer;
  attribute G_MASK_SS_TDEST of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 64;
  attribute G_MASK_SS_TUSER : integer;
  attribute G_MASK_SS_TUSER of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 128;
  attribute G_TASK_SEVERITY_ERR : integer;
  attribute G_TASK_SEVERITY_ERR of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 2;
  attribute G_TASK_SEVERITY_WARNING : integer;
  attribute G_TASK_SEVERITY_WARNING of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute G_TASK_SEVERITY_INFO : integer;
  attribute G_TASK_SEVERITY_INFO of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 0;
  attribute P_TREADY_EXISTS : integer;
  attribute P_TREADY_EXISTS of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute P_TDATA_EXISTS : integer;
  attribute P_TDATA_EXISTS of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute P_TSTRB_EXISTS : integer;
  attribute P_TSTRB_EXISTS of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute P_TKEEP_EXISTS : integer;
  attribute P_TKEEP_EXISTS of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute P_TLAST_EXISTS : integer;
  attribute P_TLAST_EXISTS of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute P_TID_EXISTS : integer;
  attribute P_TID_EXISTS of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute P_TDEST_EXISTS : integer;
  attribute P_TDEST_EXISTS of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute P_TUSER_EXISTS : integer;
  attribute P_TUSER_EXISTS of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute P_AXIS_PAYLOAD_WIDTH : integer;
  attribute P_AXIS_PAYLOAD_WIDTH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 53;
  attribute P_WR_PNTR_WIDTH : integer;
  attribute P_WR_PNTR_WIDTH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 10;
  attribute P_FIFO_COUNT_WIDTH : integer;
  attribute P_FIFO_COUNT_WIDTH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 11;
  attribute P_FIFO_TYPE : integer;
  attribute P_FIFO_TYPE of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute P_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute P_IMPLEMENTATION_TYPE_AXIS of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute P_COMMON_CLOCK : integer;
  attribute P_COMMON_CLOCK of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute P_MSGON_VAL : integer;
  attribute P_MSGON_VAL of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute P_APPLICATION_TYPE_AXIS : integer;
  attribute P_APPLICATION_TYPE_AXIS of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute LP_S_ACLKEN_CAN_TOGGLE : integer;
  attribute LP_S_ACLKEN_CAN_TOGGLE of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute LP_M_ACLKEN_CAN_TOGGLE : integer;
  attribute LP_M_ACLKEN_CAN_TOGGLE of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 18;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 10;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 10;
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 18;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 10;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 10;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 10;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 4;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 32;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 64;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 1;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 10;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 4;
  attribute C_RD_PNTR_WIDTH_RACH : integer;
  attribute C_RD_PNTR_WIDTH_RACH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 4;
  attribute C_RD_PNTR_WIDTH_RDCH : integer;
  attribute C_RD_PNTR_WIDTH_RDCH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 10;
  attribute C_RD_PNTR_WIDTH_WACH : integer;
  attribute C_RD_PNTR_WIDTH_WACH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 4;
  attribute C_RD_PNTR_WIDTH_WDCH : integer;
  attribute C_RD_PNTR_WIDTH_WDCH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 10;
  attribute C_RD_PNTR_WIDTH_WRCH : integer;
  attribute C_RD_PNTR_WIDTH_WRCH of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 4;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo : entity is 10;
end axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo is
  signal \<const0>\ : STD_LOGIC;
  signal \^axis_data_count\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal d1_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal d1_tdest : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal d1_tid : STD_LOGIC;
  signal d1_tkeep : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal d1_tlast : STD_LOGIC;
  signal d1_tstrb : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal d1_tuser : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal d2_tlast : STD_LOGIC;
  signal dout_i : STD_LOGIC_VECTOR ( 52 downto 1 );
  signal \gen_aclken_converter.s_util_aclken_converter_0/areset\ : STD_LOGIC;
  signal \inst_fifo_gen/axis_rd_en\ : STD_LOGIC;
  signal \inst_fifo_gen/axis_wr_eop\ : STD_LOGIC;
  signal \inst_fifo_gen/p_8_out\ : STD_LOGIC;
  signal \n_0_gen_fifo_generator.m_util_aclken_converter_wrapper_0\ : STD_LOGIC;
  signal \n_1_gen_fifo_generator.m_util_aclken_converter_wrapper_0\ : STD_LOGIC;
  signal \n_1_gen_fifo_generator.s_util_aclken_converter_wrapper_0\ : STD_LOGIC;
  signal \n_2_gen_fifo_generator.fifo_generator_inst\ : STD_LOGIC;
  signal \n_2_gen_fifo_generator.m_util_aclken_converter_wrapper_0\ : STD_LOGIC;
  signal \n_2_gen_fifo_generator.s_util_aclken_converter_wrapper_0\ : STD_LOGIC;
  signal \n_3_gen_fifo_generator.m_util_aclken_converter_wrapper_0\ : STD_LOGIC;
  signal \n_3_gen_fifo_generator.s_util_aclken_converter_wrapper_0\ : STD_LOGIC;
  signal \n_68_gen_fifo_generator.fifo_generator_inst\ : STD_LOGIC;
  signal \n_69_gen_fifo_generator.fifo_generator_inst\ : STD_LOGIC;
  signal \n_70_gen_fifo_generator.fifo_generator_inst\ : STD_LOGIC;
  signal ram_full_i : STD_LOGIC;
begin
  axis_data_count(31) <= \<const0>\;
  axis_data_count(30) <= \<const0>\;
  axis_data_count(29) <= \<const0>\;
  axis_data_count(28) <= \<const0>\;
  axis_data_count(27) <= \<const0>\;
  axis_data_count(26) <= \<const0>\;
  axis_data_count(25) <= \<const0>\;
  axis_data_count(24) <= \<const0>\;
  axis_data_count(23) <= \<const0>\;
  axis_data_count(22) <= \<const0>\;
  axis_data_count(21) <= \<const0>\;
  axis_data_count(20) <= \<const0>\;
  axis_data_count(19) <= \<const0>\;
  axis_data_count(18) <= \<const0>\;
  axis_data_count(17) <= \<const0>\;
  axis_data_count(16) <= \<const0>\;
  axis_data_count(15) <= \<const0>\;
  axis_data_count(14) <= \<const0>\;
  axis_data_count(13) <= \<const0>\;
  axis_data_count(12) <= \<const0>\;
  axis_data_count(11) <= \<const0>\;
  axis_data_count(10 downto 0) <= \^axis_data_count\(10 downto 0);
  axis_rd_data_count(31) <= \<const0>\;
  axis_rd_data_count(30) <= \<const0>\;
  axis_rd_data_count(29) <= \<const0>\;
  axis_rd_data_count(28) <= \<const0>\;
  axis_rd_data_count(27) <= \<const0>\;
  axis_rd_data_count(26) <= \<const0>\;
  axis_rd_data_count(25) <= \<const0>\;
  axis_rd_data_count(24) <= \<const0>\;
  axis_rd_data_count(23) <= \<const0>\;
  axis_rd_data_count(22) <= \<const0>\;
  axis_rd_data_count(21) <= \<const0>\;
  axis_rd_data_count(20) <= \<const0>\;
  axis_rd_data_count(19) <= \<const0>\;
  axis_rd_data_count(18) <= \<const0>\;
  axis_rd_data_count(17) <= \<const0>\;
  axis_rd_data_count(16) <= \<const0>\;
  axis_rd_data_count(15) <= \<const0>\;
  axis_rd_data_count(14) <= \<const0>\;
  axis_rd_data_count(13) <= \<const0>\;
  axis_rd_data_count(12) <= \<const0>\;
  axis_rd_data_count(11) <= \<const0>\;
  axis_rd_data_count(10 downto 0) <= \^axis_data_count\(10 downto 0);
  axis_wr_data_count(31) <= \<const0>\;
  axis_wr_data_count(30) <= \<const0>\;
  axis_wr_data_count(29) <= \<const0>\;
  axis_wr_data_count(28) <= \<const0>\;
  axis_wr_data_count(27) <= \<const0>\;
  axis_wr_data_count(26) <= \<const0>\;
  axis_wr_data_count(25) <= \<const0>\;
  axis_wr_data_count(24) <= \<const0>\;
  axis_wr_data_count(23) <= \<const0>\;
  axis_wr_data_count(22) <= \<const0>\;
  axis_wr_data_count(21) <= \<const0>\;
  axis_wr_data_count(20) <= \<const0>\;
  axis_wr_data_count(19) <= \<const0>\;
  axis_wr_data_count(18) <= \<const0>\;
  axis_wr_data_count(17) <= \<const0>\;
  axis_wr_data_count(16) <= \<const0>\;
  axis_wr_data_count(15) <= \<const0>\;
  axis_wr_data_count(14) <= \<const0>\;
  axis_wr_data_count(13) <= \<const0>\;
  axis_wr_data_count(12) <= \<const0>\;
  axis_wr_data_count(11) <= \<const0>\;
  axis_wr_data_count(10 downto 0) <= \^axis_data_count\(10 downto 0);
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
\gen_fifo_generator.fifo_generator_inst\: entity work.axis_data_fifo_32w_1024d_aclkfifo_generator_v11_0
    port map (
      E(0) => \n_3_gen_fifo_generator.s_util_aclken_converter_wrapper_0\,
      I1(3) => \n_0_gen_fifo_generator.m_util_aclken_converter_wrapper_0\,
      I1(2) => \n_1_gen_fifo_generator.m_util_aclken_converter_wrapper_0\,
      I1(1) => \n_2_gen_fifo_generator.m_util_aclken_converter_wrapper_0\,
      I1(0) => \n_3_gen_fifo_generator.m_util_aclken_converter_wrapper_0\,
      I2 => s_axis_aresetn,
      I3(52 downto 45) => d1_tuser(7 downto 0),
      I3(44 downto 42) => d1_tdest(2 downto 0),
      I3(41) => d1_tid,
      I3(40) => d1_tlast,
      I3(39 downto 36) => d1_tkeep(3 downto 0),
      I3(35 downto 32) => d1_tstrb(3 downto 0),
      I3(31 downto 0) => d1_tdata(31 downto 0),
      O1 => \n_2_gen_fifo_generator.fifo_generator_inst\,
      O2(52 downto 1) => dout_i(52 downto 1),
      O2(0) => d2_tlast,
      O3 => \n_68_gen_fifo_generator.fifo_generator_inst\,
      O4 => \n_69_gen_fifo_generator.fifo_generator_inst\,
      O5 => \n_70_gen_fifo_generator.fifo_generator_inst\,
      Q(1) => \n_1_gen_fifo_generator.s_util_aclken_converter_wrapper_0\,
      Q(0) => \n_2_gen_fifo_generator.s_util_aclken_converter_wrapper_0\,
      axis_data_count(10 downto 0) => \^axis_data_count\(10 downto 0),
      axis_rd_en => \inst_fifo_gen/axis_rd_en\,
      axis_wr_eop => \inst_fifo_gen/axis_wr_eop\,
      m_axis_aclken => m_axis_aclken,
      m_axis_tready => m_axis_tready,
      p_8_out => \inst_fifo_gen/p_8_out\,
      ram_full_i => ram_full_i,
      s_axis_aclk => s_axis_aclk
    );
\gen_fifo_generator.m_util_aclken_converter_wrapper_0\: entity work.\axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter_wrapper__parameterized0\
    port map (
      D(52 downto 45) => dout_i(8 downto 1),
      D(44 downto 42) => dout_i(11 downto 9),
      D(41) => dout_i(12),
      D(40) => d2_tlast,
      D(39 downto 36) => dout_i(16 downto 13),
      D(35 downto 32) => dout_i(20 downto 17),
      D(31 downto 0) => dout_i(52 downto 21),
      I1 => \n_2_gen_fifo_generator.fifo_generator_inst\,
      I2 => \n_68_gen_fifo_generator.fifo_generator_inst\,
      I3 => \n_69_gen_fifo_generator.fifo_generator_inst\,
      I4 => \n_70_gen_fifo_generator.fifo_generator_inst\,
      O1(52 downto 45) => m_axis_tuser(7 downto 0),
      O1(44 downto 42) => m_axis_tdest(2 downto 0),
      O1(41) => m_axis_tid(0),
      O1(40) => m_axis_tlast,
      O1(39 downto 36) => m_axis_tkeep(3 downto 0),
      O1(35 downto 32) => m_axis_tstrb(3 downto 0),
      O1(31 downto 0) => m_axis_tdata(31 downto 0),
      Q(3) => \n_0_gen_fifo_generator.m_util_aclken_converter_wrapper_0\,
      Q(2) => \n_1_gen_fifo_generator.m_util_aclken_converter_wrapper_0\,
      Q(1) => \n_2_gen_fifo_generator.m_util_aclken_converter_wrapper_0\,
      Q(0) => \n_3_gen_fifo_generator.m_util_aclken_converter_wrapper_0\,
      SR(0) => \gen_aclken_converter.s_util_aclken_converter_0/areset\,
      m_axis_aclken => m_axis_aclken,
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => m_axis_tvalid,
      p_8_out => \inst_fifo_gen/p_8_out\,
      s_axis_aclk => s_axis_aclk
    );
\gen_fifo_generator.s_util_aclken_converter_wrapper_0\: entity work.axis_data_fifo_32w_1024d_aclkaxis_infrastructure_v1_1_util_aclken_converter_wrapper
    port map (
      D(52 downto 45) => s_axis_tuser(7 downto 0),
      D(44 downto 42) => s_axis_tdest(2 downto 0),
      D(41) => s_axis_tid(0),
      D(40) => s_axis_tlast,
      D(39 downto 36) => s_axis_tkeep(3 downto 0),
      D(35 downto 32) => s_axis_tstrb(3 downto 0),
      D(31 downto 0) => s_axis_tdata(31 downto 0),
      E(0) => \n_3_gen_fifo_generator.s_util_aclken_converter_wrapper_0\,
      O1(52 downto 45) => d1_tuser(7 downto 0),
      O1(44 downto 42) => d1_tdest(2 downto 0),
      O1(41) => d1_tid,
      O1(40) => d1_tlast,
      O1(39 downto 36) => d1_tkeep(3 downto 0),
      O1(35 downto 32) => d1_tstrb(3 downto 0),
      O1(31 downto 0) => d1_tdata(31 downto 0),
      Q(1) => \n_1_gen_fifo_generator.s_util_aclken_converter_wrapper_0\,
      Q(0) => \n_2_gen_fifo_generator.s_util_aclken_converter_wrapper_0\,
      SR(0) => \gen_aclken_converter.s_util_aclken_converter_0/areset\,
      axis_rd_en => \inst_fifo_gen/axis_rd_en\,
      axis_wr_eop => \inst_fifo_gen/axis_wr_eop\,
      ram_full_i => ram_full_i,
      s_axis_aclk => s_axis_aclk,
      s_axis_aclken => s_axis_aclken,
      s_axis_aresetn => s_axis_aresetn,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_data_fifo_32w_1024d_aclk is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_aclken : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_aclken : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 7 downto 0 );
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of axis_data_fifo_32w_1024d_aclk : entity is true;
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of axis_data_fifo_32w_1024d_aclk : entity is "axis_data_fifo_v1_1_axis_data_fifo,Vivado 2013.4";
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of axis_data_fifo_32w_1024d_aclk : entity is "axis_data_fifo_32w_1024d_aclk,axis_data_fifo_v1_1_axis_data_fifo,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of axis_data_fifo_32w_1024d_aclk : entity is "axis_data_fifo_32w_1024d_aclk,axis_data_fifo_v1_1_axis_data_fifo,{x_ipProduct=Vivado 2013.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=axis_data_fifo,x_ipVersion=1.1,x_ipCoreRevision=1,x_ipLanguage=VHDL,C_FAMILY=kintex7,C_AXIS_TDATA_WIDTH=32,C_AXIS_TID_WIDTH=1,C_AXIS_TDEST_WIDTH=3,C_AXIS_TUSER_WIDTH=8,C_AXIS_SIGNAL_SET=0b11111111,C_FIFO_DEPTH=1024,C_FIFO_MODE=2,C_IS_ACLK_ASYNC=0,C_SYNCHRONIZER_STAGE=2,C_ACLKEN_CONV_MODE=3}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of axis_data_fifo_32w_1024d_aclk : entity is "yes";
end axis_data_fifo_32w_1024d_aclk;

architecture STRUCTURE of axis_data_fifo_32w_1024d_aclk is
  signal \<const0>\ : STD_LOGIC;
  attribute C_ACLKEN_CONV_MODE : integer;
  attribute C_ACLKEN_CONV_MODE of inst : label is 3;
  attribute C_AXIS_SIGNAL_SET : string;
  attribute C_AXIS_SIGNAL_SET of inst : label is "32'b00000000000000000000000011111111";
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of inst : label is 32;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of inst : label is 3;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of inst : label is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of inst : label is 8;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of inst : label is 32;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of inst : label is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of inst : label is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of inst : label is 1;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of inst : label is 64;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of inst : label is 4;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of inst : label is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of inst : label is 1;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of inst : label is 10;
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of inst : label is 18;
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of inst : label is 18;
  attribute C_FAMILY : string;
  attribute C_FAMILY of inst : label is "kintex7";
  attribute C_FIFO_DEPTH : integer;
  attribute C_FIFO_DEPTH of inst : label is 1024;
  attribute C_FIFO_MODE : integer;
  attribute C_FIFO_MODE of inst : label is 2;
  attribute C_IS_ACLK_ASYNC : integer;
  attribute C_IS_ACLK_ASYNC of inst : label is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of inst : label is 10;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of inst : label is 10;
  attribute C_RD_PNTR_WIDTH_RACH : integer;
  attribute C_RD_PNTR_WIDTH_RACH of inst : label is 4;
  attribute C_RD_PNTR_WIDTH_RDCH : integer;
  attribute C_RD_PNTR_WIDTH_RDCH of inst : label is 10;
  attribute C_RD_PNTR_WIDTH_WACH : integer;
  attribute C_RD_PNTR_WIDTH_WACH of inst : label is 4;
  attribute C_RD_PNTR_WIDTH_WDCH : integer;
  attribute C_RD_PNTR_WIDTH_WDCH of inst : label is 10;
  attribute C_RD_PNTR_WIDTH_WRCH : integer;
  attribute C_RD_PNTR_WIDTH_WRCH of inst : label is 4;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of inst : label is 2;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of inst : label is 10;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of inst : label is 10;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of inst : label is 10;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of inst : label is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of inst : label is 10;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of inst : label is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of inst : label is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of inst : label is 4;
  attribute G_INDX_SS_TDATA : integer;
  attribute G_INDX_SS_TDATA of inst : label is 1;
  attribute G_INDX_SS_TDEST : integer;
  attribute G_INDX_SS_TDEST of inst : label is 6;
  attribute G_INDX_SS_TID : integer;
  attribute G_INDX_SS_TID of inst : label is 5;
  attribute G_INDX_SS_TKEEP : integer;
  attribute G_INDX_SS_TKEEP of inst : label is 3;
  attribute G_INDX_SS_TLAST : integer;
  attribute G_INDX_SS_TLAST of inst : label is 4;
  attribute G_INDX_SS_TREADY : integer;
  attribute G_INDX_SS_TREADY of inst : label is 0;
  attribute G_INDX_SS_TSTRB : integer;
  attribute G_INDX_SS_TSTRB of inst : label is 2;
  attribute G_INDX_SS_TUSER : integer;
  attribute G_INDX_SS_TUSER of inst : label is 7;
  attribute G_MASK_SS_TDATA : integer;
  attribute G_MASK_SS_TDATA of inst : label is 2;
  attribute G_MASK_SS_TDEST : integer;
  attribute G_MASK_SS_TDEST of inst : label is 64;
  attribute G_MASK_SS_TID : integer;
  attribute G_MASK_SS_TID of inst : label is 32;
  attribute G_MASK_SS_TKEEP : integer;
  attribute G_MASK_SS_TKEEP of inst : label is 8;
  attribute G_MASK_SS_TLAST : integer;
  attribute G_MASK_SS_TLAST of inst : label is 16;
  attribute G_MASK_SS_TREADY : integer;
  attribute G_MASK_SS_TREADY of inst : label is 1;
  attribute G_MASK_SS_TSTRB : integer;
  attribute G_MASK_SS_TSTRB of inst : label is 4;
  attribute G_MASK_SS_TUSER : integer;
  attribute G_MASK_SS_TUSER of inst : label is 128;
  attribute G_TASK_SEVERITY_ERR : integer;
  attribute G_TASK_SEVERITY_ERR of inst : label is 2;
  attribute G_TASK_SEVERITY_INFO : integer;
  attribute G_TASK_SEVERITY_INFO of inst : label is 0;
  attribute G_TASK_SEVERITY_WARNING : integer;
  attribute G_TASK_SEVERITY_WARNING of inst : label is 1;
  attribute LP_M_ACLKEN_CAN_TOGGLE : integer;
  attribute LP_M_ACLKEN_CAN_TOGGLE of inst : label is 1;
  attribute LP_S_ACLKEN_CAN_TOGGLE : integer;
  attribute LP_S_ACLKEN_CAN_TOGGLE of inst : label is 1;
  attribute P_APPLICATION_TYPE_AXIS : integer;
  attribute P_APPLICATION_TYPE_AXIS of inst : label is 1;
  attribute P_AXIS_PAYLOAD_WIDTH : integer;
  attribute P_AXIS_PAYLOAD_WIDTH of inst : label is 53;
  attribute P_COMMON_CLOCK : integer;
  attribute P_COMMON_CLOCK of inst : label is 1;
  attribute P_FIFO_COUNT_WIDTH : integer;
  attribute P_FIFO_COUNT_WIDTH of inst : label is 11;
  attribute P_FIFO_TYPE : integer;
  attribute P_FIFO_TYPE of inst : label is 1;
  attribute P_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute P_IMPLEMENTATION_TYPE_AXIS of inst : label is 1;
  attribute P_MSGON_VAL : integer;
  attribute P_MSGON_VAL of inst : label is 1;
  attribute P_TDATA_EXISTS : integer;
  attribute P_TDATA_EXISTS of inst : label is 1;
  attribute P_TDEST_EXISTS : integer;
  attribute P_TDEST_EXISTS of inst : label is 1;
  attribute P_TID_EXISTS : integer;
  attribute P_TID_EXISTS of inst : label is 1;
  attribute P_TKEEP_EXISTS : integer;
  attribute P_TKEEP_EXISTS of inst : label is 1;
  attribute P_TLAST_EXISTS : integer;
  attribute P_TLAST_EXISTS of inst : label is 1;
  attribute P_TREADY_EXISTS : integer;
  attribute P_TREADY_EXISTS of inst : label is 1;
  attribute P_TSTRB_EXISTS : integer;
  attribute P_TSTRB_EXISTS of inst : label is 1;
  attribute P_TUSER_EXISTS : integer;
  attribute P_TUSER_EXISTS of inst : label is 1;
  attribute P_WR_PNTR_WIDTH : integer;
  attribute P_WR_PNTR_WIDTH of inst : label is 10;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of inst : label is "xilinx.com:interface:axis:1.0 S_AXIS TREADY";
begin
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
inst: entity work.axis_data_fifo_32w_1024d_aclkaxis_data_fifo_v1_1_axis_data_fifo
    port map (
      axis_data_count(31 downto 0) => axis_data_count(31 downto 0),
      axis_rd_data_count(31 downto 0) => axis_rd_data_count(31 downto 0),
      axis_wr_data_count(31 downto 0) => axis_wr_data_count(31 downto 0),
      m_axis_aclk => \<const0>\,
      m_axis_aclken => m_axis_aclken,
      m_axis_aresetn => \<const0>\,
      m_axis_tdata(31 downto 0) => m_axis_tdata(31 downto 0),
      m_axis_tdest(2 downto 0) => m_axis_tdest(2 downto 0),
      m_axis_tid(0) => m_axis_tid(0),
      m_axis_tkeep(3 downto 0) => m_axis_tkeep(3 downto 0),
      m_axis_tlast => m_axis_tlast,
      m_axis_tready => m_axis_tready,
      m_axis_tstrb(3 downto 0) => m_axis_tstrb(3 downto 0),
      m_axis_tuser(7 downto 0) => m_axis_tuser(7 downto 0),
      m_axis_tvalid => m_axis_tvalid,
      s_axis_aclk => s_axis_aclk,
      s_axis_aclken => s_axis_aclken,
      s_axis_aresetn => s_axis_aresetn,
      s_axis_tdata(31 downto 0) => s_axis_tdata(31 downto 0),
      s_axis_tdest(2 downto 0) => s_axis_tdest(2 downto 0),
      s_axis_tid(0) => s_axis_tid(0),
      s_axis_tkeep(3 downto 0) => s_axis_tkeep(3 downto 0),
      s_axis_tlast => s_axis_tlast,
      s_axis_tready => s_axis_tready,
      s_axis_tstrb(3 downto 0) => s_axis_tstrb(3 downto 0),
      s_axis_tuser(7 downto 0) => s_axis_tuser(7 downto 0),
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
