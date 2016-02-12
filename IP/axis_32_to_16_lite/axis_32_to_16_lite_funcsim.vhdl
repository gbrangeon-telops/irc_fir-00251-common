-- Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2013.4 (win64) Build 353583 Mon Dec  9 17:49:19 MST 2013
-- Date        : Fri Dec 12 12:25:23 2014
-- Host        : TELOPS210 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               d:/Telops/fir-00251-Common/IP/axis_32_to_16_lite/axis_32_to_16_lite_funcsim.vhdl
-- Design      : axis_32_to_16_lite
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k160tfbg676-1
-- --------------------------------------------------------------------------------
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_32_to_16_liteaxis_dwidth_converter_v1_1_axisc_downsizer is
  port (
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    m_axis_tlast : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 1 downto 0 );
    aclk : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    aclken : in STD_LOGIC;
    areset_r : in STD_LOGIC;
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end axis_32_to_16_liteaxis_dwidth_converter_v1_1_axisc_downsizer;

architecture STRUCTURE of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axisc_downsizer is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^o1\ : STD_LOGIC;
  signal \^o2\ : STD_LOGIC;
  signal \n_0_r0_data[31]_i_1\ : STD_LOGIC;
  signal \n_0_r0_is_null_r[1]_i_1\ : STD_LOGIC;
  signal n_0_r0_last_i_1 : STD_LOGIC;
  signal n_0_r0_last_reg : STD_LOGIC;
  signal \n_0_r0_out_sel_r[0]_i_1\ : STD_LOGIC;
  signal \n_0_r0_out_sel_r[0]_i_2\ : STD_LOGIC;
  signal \n_0_r0_out_sel_r_reg[0]\ : STD_LOGIC;
  signal \n_0_r1_data[15]_i_1\ : STD_LOGIC;
  signal n_0_r1_last_i_1 : STD_LOGIC;
  signal n_0_r1_last_reg : STD_LOGIC;
  signal \n_0_state[0]_i_1\ : STD_LOGIC;
  signal \n_0_state[0]_i_2\ : STD_LOGIC;
  signal \n_0_state[1]_i_1\ : STD_LOGIC;
  signal \n_0_state[1]_i_2\ : STD_LOGIC;
  signal \n_0_state[2]_i_1\ : STD_LOGIC;
  signal \n_0_state[2]_i_2\ : STD_LOGIC;
  signal \n_0_state_reg[2]\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal r0_data : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal r0_is_null_r : STD_LOGIC;
  signal r0_keep : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal state27_in : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \m_axis_tdata[0]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \m_axis_tdata[10]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \m_axis_tdata[11]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \m_axis_tdata[12]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \m_axis_tdata[13]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \m_axis_tdata[14]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \m_axis_tdata[15]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \m_axis_tdata[1]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \m_axis_tdata[2]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \m_axis_tdata[3]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \m_axis_tdata[4]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \m_axis_tdata[5]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \m_axis_tdata[6]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \m_axis_tdata[7]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \m_axis_tdata[8]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \m_axis_tdata[9]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \m_axis_tkeep[0]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \m_axis_tkeep[1]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \state[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \state[2]_i_1\ : label is "soft_lutpair0";
begin
  O1 <= \^o1\;
  O2 <= \^o2\;
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
\m_axis_tdata[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => p_0_in(16),
      I1 => \n_0_r0_out_sel_r_reg[0]\,
      I2 => p_0_in(0),
      O => m_axis_tdata(0)
    );
\m_axis_tdata[10]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => p_0_in(26),
      I1 => \n_0_r0_out_sel_r_reg[0]\,
      I2 => p_0_in(10),
      O => m_axis_tdata(10)
    );
\m_axis_tdata[11]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => p_0_in(27),
      I1 => \n_0_r0_out_sel_r_reg[0]\,
      I2 => p_0_in(11),
      O => m_axis_tdata(11)
    );
\m_axis_tdata[12]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => p_0_in(28),
      I1 => \n_0_r0_out_sel_r_reg[0]\,
      I2 => p_0_in(12),
      O => m_axis_tdata(12)
    );
\m_axis_tdata[13]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => p_0_in(29),
      I1 => \n_0_r0_out_sel_r_reg[0]\,
      I2 => p_0_in(13),
      O => m_axis_tdata(13)
    );
\m_axis_tdata[14]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => p_0_in(30),
      I1 => \n_0_r0_out_sel_r_reg[0]\,
      I2 => p_0_in(14),
      O => m_axis_tdata(14)
    );
\m_axis_tdata[15]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => p_0_in(31),
      I1 => \n_0_r0_out_sel_r_reg[0]\,
      I2 => p_0_in(15),
      O => m_axis_tdata(15)
    );
\m_axis_tdata[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => p_0_in(17),
      I1 => \n_0_r0_out_sel_r_reg[0]\,
      I2 => p_0_in(1),
      O => m_axis_tdata(1)
    );
\m_axis_tdata[2]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => p_0_in(18),
      I1 => \n_0_r0_out_sel_r_reg[0]\,
      I2 => p_0_in(2),
      O => m_axis_tdata(2)
    );
\m_axis_tdata[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => p_0_in(19),
      I1 => \n_0_r0_out_sel_r_reg[0]\,
      I2 => p_0_in(3),
      O => m_axis_tdata(3)
    );
\m_axis_tdata[4]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => p_0_in(20),
      I1 => \n_0_r0_out_sel_r_reg[0]\,
      I2 => p_0_in(4),
      O => m_axis_tdata(4)
    );
\m_axis_tdata[5]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => p_0_in(21),
      I1 => \n_0_r0_out_sel_r_reg[0]\,
      I2 => p_0_in(5),
      O => m_axis_tdata(5)
    );
\m_axis_tdata[6]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => p_0_in(22),
      I1 => \n_0_r0_out_sel_r_reg[0]\,
      I2 => p_0_in(6),
      O => m_axis_tdata(6)
    );
\m_axis_tdata[7]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => p_0_in(23),
      I1 => \n_0_r0_out_sel_r_reg[0]\,
      I2 => p_0_in(7),
      O => m_axis_tdata(7)
    );
\m_axis_tdata[8]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => p_0_in(24),
      I1 => \n_0_r0_out_sel_r_reg[0]\,
      I2 => p_0_in(8),
      O => m_axis_tdata(8)
    );
\m_axis_tdata[9]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => p_0_in(25),
      I1 => \n_0_r0_out_sel_r_reg[0]\,
      I2 => p_0_in(9),
      O => m_axis_tdata(9)
    );
\m_axis_tkeep[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => p_1_in(2),
      I1 => \n_0_r0_out_sel_r_reg[0]\,
      I2 => p_1_in(0),
      O => m_axis_tkeep(0)
    );
\m_axis_tkeep[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => p_1_in(3),
      I1 => \n_0_r0_out_sel_r_reg[0]\,
      I2 => p_1_in(1),
      O => m_axis_tkeep(1)
    );
m_axis_tlast_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F88F88880880888"
    )
    port map (
      I0 => n_0_r0_last_reg,
      I1 => state27_in,
      I2 => \^o1\,
      I3 => \^o2\,
      I4 => \n_0_state_reg[2]\,
      I5 => n_0_r1_last_reg,
      O => m_axis_tlast
    );
\r0_data[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => \n_0_state_reg[2]\,
      I1 => \^o1\,
      I2 => aclken,
      O => \n_0_r0_data[31]_i_1\
    );
\r0_data_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(0),
      Q => p_0_in(0),
      R => \<const0>\
    );
\r0_data_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(10),
      Q => p_0_in(10),
      R => \<const0>\
    );
\r0_data_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(11),
      Q => p_0_in(11),
      R => \<const0>\
    );
\r0_data_reg[12]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(12),
      Q => p_0_in(12),
      R => \<const0>\
    );
\r0_data_reg[13]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(13),
      Q => p_0_in(13),
      R => \<const0>\
    );
\r0_data_reg[14]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(14),
      Q => p_0_in(14),
      R => \<const0>\
    );
\r0_data_reg[15]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(15),
      Q => p_0_in(15),
      R => \<const0>\
    );
\r0_data_reg[16]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(16),
      Q => r0_data(16),
      R => \<const0>\
    );
\r0_data_reg[17]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(17),
      Q => r0_data(17),
      R => \<const0>\
    );
\r0_data_reg[18]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(18),
      Q => r0_data(18),
      R => \<const0>\
    );
\r0_data_reg[19]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(19),
      Q => r0_data(19),
      R => \<const0>\
    );
\r0_data_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(1),
      Q => p_0_in(1),
      R => \<const0>\
    );
\r0_data_reg[20]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(20),
      Q => r0_data(20),
      R => \<const0>\
    );
\r0_data_reg[21]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(21),
      Q => r0_data(21),
      R => \<const0>\
    );
\r0_data_reg[22]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(22),
      Q => r0_data(22),
      R => \<const0>\
    );
\r0_data_reg[23]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(23),
      Q => r0_data(23),
      R => \<const0>\
    );
\r0_data_reg[24]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(24),
      Q => r0_data(24),
      R => \<const0>\
    );
\r0_data_reg[25]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(25),
      Q => r0_data(25),
      R => \<const0>\
    );
\r0_data_reg[26]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(26),
      Q => r0_data(26),
      R => \<const0>\
    );
\r0_data_reg[27]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(27),
      Q => r0_data(27),
      R => \<const0>\
    );
\r0_data_reg[28]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(28),
      Q => r0_data(28),
      R => \<const0>\
    );
\r0_data_reg[29]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(29),
      Q => r0_data(29),
      R => \<const0>\
    );
\r0_data_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(2),
      Q => p_0_in(2),
      R => \<const0>\
    );
\r0_data_reg[30]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(30),
      Q => r0_data(30),
      R => \<const0>\
    );
\r0_data_reg[31]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(31),
      Q => r0_data(31),
      R => \<const0>\
    );
\r0_data_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(3),
      Q => p_0_in(3),
      R => \<const0>\
    );
\r0_data_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(4),
      Q => p_0_in(4),
      R => \<const0>\
    );
\r0_data_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(5),
      Q => p_0_in(5),
      R => \<const0>\
    );
\r0_data_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(6),
      Q => p_0_in(6),
      R => \<const0>\
    );
\r0_data_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(7),
      Q => p_0_in(7),
      R => \<const0>\
    );
\r0_data_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(8),
      Q => p_0_in(8),
      R => \<const0>\
    );
\r0_data_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tdata(9),
      Q => p_0_in(9),
      R => \<const0>\
    );
\r0_is_null_r[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000222E"
    )
    port map (
      I0 => state27_in,
      I1 => r0_is_null_r,
      I2 => s_axis_tkeep(2),
      I3 => s_axis_tkeep(3),
      I4 => areset_r,
      O => \n_0_r0_is_null_r[1]_i_1\
    );
\r0_is_null_r[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
    port map (
      I0 => \n_0_state_reg[2]\,
      I1 => \^o1\,
      I2 => s_axis_tvalid,
      I3 => aclken,
      O => r0_is_null_r
    );
\r0_is_null_r_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \<const1>\,
      D => \n_0_r0_is_null_r[1]_i_1\,
      Q => state27_in,
      R => \<const0>\
    );
\r0_keep_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tkeep(0),
      Q => p_1_in(0),
      R => \<const0>\
    );
\r0_keep_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tkeep(1),
      Q => p_1_in(1),
      R => \<const0>\
    );
\r0_keep_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tkeep(2),
      Q => r0_keep(2),
      R => \<const0>\
    );
\r0_keep_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r0_data[31]_i_1\,
      D => s_axis_tkeep(3),
      Q => r0_keep(3),
      R => \<const0>\
    );
r0_last_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
    port map (
      I0 => s_axis_tlast,
      I1 => \n_0_state_reg[2]\,
      I2 => \^o1\,
      I3 => aclken,
      I4 => n_0_r0_last_reg,
      O => n_0_r0_last_i_1
    );
r0_last_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \<const1>\,
      D => n_0_r0_last_i_1,
      Q => n_0_r0_last_reg,
      R => \<const0>\
    );
\r0_out_sel_r[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005F40"
    )
    port map (
      I0 => \n_0_r0_out_sel_r[0]_i_2\,
      I1 => m_axis_tready,
      I2 => aclken,
      I3 => \n_0_r0_out_sel_r_reg[0]\,
      I4 => areset_r,
      O => \n_0_r0_out_sel_r[0]_i_1\
    );
\r0_out_sel_r[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF04FF04FF040404"
    )
    port map (
      I0 => \^o2\,
      I1 => \^o1\,
      I2 => \n_0_state_reg[2]\,
      I3 => m_axis_tready,
      I4 => \n_0_r0_out_sel_r_reg[0]\,
      I5 => state27_in,
      O => \n_0_r0_out_sel_r[0]_i_2\
    );
\r0_out_sel_r_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \<const1>\,
      D => \n_0_r0_out_sel_r[0]_i_1\,
      Q => \n_0_r0_out_sel_r_reg[0]\,
      R => \<const0>\
    );
\r1_data[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
    port map (
      I0 => \n_0_state_reg[2]\,
      I1 => aclken,
      I2 => \^o2\,
      I3 => \^o1\,
      O => \n_0_r1_data[15]_i_1\
    );
\r1_data_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r1_data[15]_i_1\,
      D => r0_data(16),
      Q => p_0_in(16),
      R => \<const0>\
    );
\r1_data_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r1_data[15]_i_1\,
      D => r0_data(26),
      Q => p_0_in(26),
      R => \<const0>\
    );
\r1_data_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r1_data[15]_i_1\,
      D => r0_data(27),
      Q => p_0_in(27),
      R => \<const0>\
    );
\r1_data_reg[12]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r1_data[15]_i_1\,
      D => r0_data(28),
      Q => p_0_in(28),
      R => \<const0>\
    );
\r1_data_reg[13]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r1_data[15]_i_1\,
      D => r0_data(29),
      Q => p_0_in(29),
      R => \<const0>\
    );
\r1_data_reg[14]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r1_data[15]_i_1\,
      D => r0_data(30),
      Q => p_0_in(30),
      R => \<const0>\
    );
\r1_data_reg[15]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r1_data[15]_i_1\,
      D => r0_data(31),
      Q => p_0_in(31),
      R => \<const0>\
    );
\r1_data_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r1_data[15]_i_1\,
      D => r0_data(17),
      Q => p_0_in(17),
      R => \<const0>\
    );
\r1_data_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r1_data[15]_i_1\,
      D => r0_data(18),
      Q => p_0_in(18),
      R => \<const0>\
    );
\r1_data_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r1_data[15]_i_1\,
      D => r0_data(19),
      Q => p_0_in(19),
      R => \<const0>\
    );
\r1_data_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r1_data[15]_i_1\,
      D => r0_data(20),
      Q => p_0_in(20),
      R => \<const0>\
    );
\r1_data_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r1_data[15]_i_1\,
      D => r0_data(21),
      Q => p_0_in(21),
      R => \<const0>\
    );
\r1_data_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r1_data[15]_i_1\,
      D => r0_data(22),
      Q => p_0_in(22),
      R => \<const0>\
    );
\r1_data_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r1_data[15]_i_1\,
      D => r0_data(23),
      Q => p_0_in(23),
      R => \<const0>\
    );
\r1_data_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r1_data[15]_i_1\,
      D => r0_data(24),
      Q => p_0_in(24),
      R => \<const0>\
    );
\r1_data_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r1_data[15]_i_1\,
      D => r0_data(25),
      Q => p_0_in(25),
      R => \<const0>\
    );
\r1_keep_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r1_data[15]_i_1\,
      D => r0_keep(2),
      Q => p_1_in(2),
      R => \<const0>\
    );
\r1_keep_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \n_0_r1_data[15]_i_1\,
      D => r0_keep(3),
      Q => p_1_in(3),
      R => \<const0>\
    );
r1_last_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00002000"
    )
    port map (
      I0 => n_0_r0_last_reg,
      I1 => \n_0_state_reg[2]\,
      I2 => aclken,
      I3 => \^o2\,
      I4 => \^o1\,
      I5 => n_0_r1_last_reg,
      O => n_0_r1_last_i_1
    );
r1_last_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \<const1>\,
      D => n_0_r1_last_i_1,
      Q => n_0_r1_last_reg,
      R => \<const0>\
    );
\state[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_state[0]_i_2\,
      I1 => areset_r,
      O => \n_0_state[0]_i_1\
    );
\state[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF33FFFF0FAF0000"
    )
    port map (
      I0 => m_axis_tready,
      I1 => s_axis_tvalid,
      I2 => \^o2\,
      I3 => \n_0_state_reg[2]\,
      I4 => aclken,
      I5 => \^o1\,
      O => \n_0_state[0]_i_2\
    );
\state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
    port map (
      I0 => \^o2\,
      I1 => aclken,
      I2 => \n_0_state[1]_i_2\,
      I3 => areset_r,
      O => \n_0_state[1]_i_1\
    );
\state[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"308830F830B830F8"
    )
    port map (
      I0 => s_axis_tvalid,
      I1 => \^o1\,
      I2 => \^o2\,
      I3 => \n_0_state_reg[2]\,
      I4 => m_axis_tready,
      I5 => state27_in,
      O => \n_0_state[1]_i_2\
    );
\state[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_state[2]_i_2\,
      I1 => areset_r,
      O => \n_0_state[2]_i_1\
    );
\state[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0300FFFF20000000"
    )
    port map (
      I0 => s_axis_tvalid,
      I1 => m_axis_tready,
      I2 => \^o1\,
      I3 => \^o2\,
      I4 => aclken,
      I5 => \n_0_state_reg[2]\,
      O => \n_0_state[2]_i_2\
    );
\state_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \<const1>\,
      D => \n_0_state[0]_i_1\,
      Q => \^o1\,
      R => \<const0>\
    );
\state_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \<const1>\,
      D => \n_0_state[1]_i_1\,
      Q => \^o2\,
      R => \<const0>\
    );
\state_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \<const1>\,
      D => \n_0_state[2]_i_1\,
      Q => \n_0_state_reg[2]\,
      R => \<const0>\
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    aclken : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is "yes";
  attribute C_FAMILY : string;
  attribute C_FAMILY of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is "kintex7";
  attribute C_S_AXIS_TDATA_WIDTH : integer;
  attribute C_S_AXIS_TDATA_WIDTH of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 32;
  attribute C_M_AXIS_TDATA_WIDTH : integer;
  attribute C_M_AXIS_TDATA_WIDTH of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 16;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 1;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 1;
  attribute C_S_AXIS_TUSER_WIDTH : integer;
  attribute C_S_AXIS_TUSER_WIDTH of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 1;
  attribute C_M_AXIS_TUSER_WIDTH : integer;
  attribute C_M_AXIS_TUSER_WIDTH of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 1;
  attribute C_AXIS_SIGNAL_SET : string;
  attribute C_AXIS_SIGNAL_SET of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is "32'b00000000000000000000000000011011";
  attribute G_INDX_SS_TREADY : integer;
  attribute G_INDX_SS_TREADY of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 0;
  attribute G_INDX_SS_TDATA : integer;
  attribute G_INDX_SS_TDATA of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 1;
  attribute G_INDX_SS_TSTRB : integer;
  attribute G_INDX_SS_TSTRB of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 2;
  attribute G_INDX_SS_TKEEP : integer;
  attribute G_INDX_SS_TKEEP of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 3;
  attribute G_INDX_SS_TLAST : integer;
  attribute G_INDX_SS_TLAST of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 4;
  attribute G_INDX_SS_TID : integer;
  attribute G_INDX_SS_TID of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 5;
  attribute G_INDX_SS_TDEST : integer;
  attribute G_INDX_SS_TDEST of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 6;
  attribute G_INDX_SS_TUSER : integer;
  attribute G_INDX_SS_TUSER of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 7;
  attribute G_MASK_SS_TREADY : integer;
  attribute G_MASK_SS_TREADY of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 1;
  attribute G_MASK_SS_TDATA : integer;
  attribute G_MASK_SS_TDATA of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 2;
  attribute G_MASK_SS_TSTRB : integer;
  attribute G_MASK_SS_TSTRB of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 4;
  attribute G_MASK_SS_TKEEP : integer;
  attribute G_MASK_SS_TKEEP of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 8;
  attribute G_MASK_SS_TLAST : integer;
  attribute G_MASK_SS_TLAST of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 16;
  attribute G_MASK_SS_TID : integer;
  attribute G_MASK_SS_TID of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 32;
  attribute G_MASK_SS_TDEST : integer;
  attribute G_MASK_SS_TDEST of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 64;
  attribute G_MASK_SS_TUSER : integer;
  attribute G_MASK_SS_TUSER of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 128;
  attribute G_TASK_SEVERITY_ERR : integer;
  attribute G_TASK_SEVERITY_ERR of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 2;
  attribute G_TASK_SEVERITY_WARNING : integer;
  attribute G_TASK_SEVERITY_WARNING of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 1;
  attribute G_TASK_SEVERITY_INFO : integer;
  attribute G_TASK_SEVERITY_INFO of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 0;
  attribute P_SS_TKEEP_REQUIRED : integer;
  attribute P_SS_TKEEP_REQUIRED of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 8;
  attribute P_AXIS_SIGNAL_SET : string;
  attribute P_AXIS_SIGNAL_SET of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is "32'b00000000000000000000000000011011";
  attribute P_S_RATIO : integer;
  attribute P_S_RATIO of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 1;
  attribute P_M_RATIO : integer;
  attribute P_M_RATIO of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 2;
  attribute P_D2_TDATA_WIDTH : integer;
  attribute P_D2_TDATA_WIDTH of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 32;
  attribute P_D1_TUSER_WIDTH : integer;
  attribute P_D1_TUSER_WIDTH of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 4;
  attribute P_D2_TUSER_WIDTH : integer;
  attribute P_D2_TUSER_WIDTH of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 4;
  attribute P_D3_TUSER_WIDTH : integer;
  attribute P_D3_TUSER_WIDTH of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 2;
  attribute P_D1_REG_CONFIG : integer;
  attribute P_D1_REG_CONFIG of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 0;
  attribute P_D3_REG_CONFIG : integer;
  attribute P_D3_REG_CONFIG of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter : entity is 0;
end axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter;

architecture STRUCTURE of axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal areset_r : STD_LOGIC;
  signal n_0_areset_r_i_1 : STD_LOGIC;
begin
  m_axis_tdest(0) <= \<const0>\;
  m_axis_tid(0) <= \<const0>\;
  m_axis_tstrb(1) <= \<const0>\;
  m_axis_tstrb(0) <= \<const0>\;
  m_axis_tuser(0) <= \<const0>\;
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
areset_r_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => aresetn,
      O => n_0_areset_r_i_1
    );
areset_r_reg: unisim.vcomponents.FDRE
    port map (
      C => aclk,
      CE => \<const1>\,
      D => n_0_areset_r_i_1,
      Q => areset_r,
      R => \<const0>\
    );
\gen_downsizer_conversion.axisc_downsizer_0\: entity work.axis_32_to_16_liteaxis_dwidth_converter_v1_1_axisc_downsizer
    port map (
      O1 => s_axis_tready,
      O2 => m_axis_tvalid,
      aclk => aclk,
      aclken => aclken,
      areset_r => areset_r,
      m_axis_tdata(15 downto 0) => m_axis_tdata(15 downto 0),
      m_axis_tkeep(1 downto 0) => m_axis_tkeep(1 downto 0),
      m_axis_tlast => m_axis_tlast,
      m_axis_tready => m_axis_tready,
      s_axis_tdata(31 downto 0) => s_axis_tdata(31 downto 0),
      s_axis_tkeep(3 downto 0) => s_axis_tkeep(3 downto 0),
      s_axis_tlast => s_axis_tlast,
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_32_to_16_lite is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of axis_32_to_16_lite : entity is true;
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of axis_32_to_16_lite : entity is "axis_dwidth_converter_v1_1_axis_dwidth_converter,Vivado 2013.4";
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of axis_32_to_16_lite : entity is "axis_32_to_16_lite,axis_dwidth_converter_v1_1_axis_dwidth_converter,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of axis_32_to_16_lite : entity is "axis_32_to_16_lite,axis_dwidth_converter_v1_1_axis_dwidth_converter,{x_ipProduct=Vivado 2013.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=axis_dwidth_converter,x_ipVersion=1.1,x_ipCoreRevision=1,x_ipLanguage=VHDL,C_FAMILY=kintex7,C_S_AXIS_TDATA_WIDTH=32,C_M_AXIS_TDATA_WIDTH=16,C_AXIS_TID_WIDTH=1,C_AXIS_TDEST_WIDTH=1,C_S_AXIS_TUSER_WIDTH=1,C_M_AXIS_TUSER_WIDTH=1,C_AXIS_SIGNAL_SET=0b00011011}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of axis_32_to_16_lite : entity is "yes";
end axis_32_to_16_lite;

architecture STRUCTURE of axis_32_to_16_lite is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal NLW_inst_m_axis_tdest_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axis_tid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_m_axis_tuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute C_AXIS_SIGNAL_SET : string;
  attribute C_AXIS_SIGNAL_SET of inst : label is "32'b00000000000000000000000000011011";
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of inst : label is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of inst : label is 1;
  attribute C_FAMILY : string;
  attribute C_FAMILY of inst : label is "kintex7";
  attribute C_M_AXIS_TDATA_WIDTH : integer;
  attribute C_M_AXIS_TDATA_WIDTH of inst : label is 16;
  attribute C_M_AXIS_TUSER_WIDTH : integer;
  attribute C_M_AXIS_TUSER_WIDTH of inst : label is 1;
  attribute C_S_AXIS_TDATA_WIDTH : integer;
  attribute C_S_AXIS_TDATA_WIDTH of inst : label is 32;
  attribute C_S_AXIS_TUSER_WIDTH : integer;
  attribute C_S_AXIS_TUSER_WIDTH of inst : label is 1;
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of inst : label is true;
  attribute DowngradeIPIdentifiedWarnings of inst : label is "yes";
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
  attribute P_AXIS_SIGNAL_SET : string;
  attribute P_AXIS_SIGNAL_SET of inst : label is "32'b00000000000000000000000000011011";
  attribute P_D1_REG_CONFIG : integer;
  attribute P_D1_REG_CONFIG of inst : label is 0;
  attribute P_D1_TUSER_WIDTH : integer;
  attribute P_D1_TUSER_WIDTH of inst : label is 4;
  attribute P_D2_TDATA_WIDTH : integer;
  attribute P_D2_TDATA_WIDTH of inst : label is 32;
  attribute P_D2_TUSER_WIDTH : integer;
  attribute P_D2_TUSER_WIDTH of inst : label is 4;
  attribute P_D3_REG_CONFIG : integer;
  attribute P_D3_REG_CONFIG of inst : label is 0;
  attribute P_D3_TUSER_WIDTH : integer;
  attribute P_D3_TUSER_WIDTH of inst : label is 2;
  attribute P_M_RATIO : integer;
  attribute P_M_RATIO of inst : label is 2;
  attribute P_SS_TKEEP_REQUIRED : integer;
  attribute P_SS_TKEEP_REQUIRED of inst : label is 8;
  attribute P_S_RATIO : integer;
  attribute P_S_RATIO of inst : label is 1;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of inst : label is "xilinx.com:interface:axis:1.0 S_AXIS TREADY";
begin
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
inst: entity work.axis_32_to_16_liteaxis_dwidth_converter_v1_1_axis_dwidth_converter
    port map (
      aclk => aclk,
      aclken => \<const1>\,
      aresetn => aresetn,
      m_axis_tdata(15 downto 0) => m_axis_tdata(15 downto 0),
      m_axis_tdest(0) => NLW_inst_m_axis_tdest_UNCONNECTED(0),
      m_axis_tid(0) => NLW_inst_m_axis_tid_UNCONNECTED(0),
      m_axis_tkeep(1 downto 0) => m_axis_tkeep(1 downto 0),
      m_axis_tlast => m_axis_tlast,
      m_axis_tready => m_axis_tready,
      m_axis_tstrb(1 downto 0) => NLW_inst_m_axis_tstrb_UNCONNECTED(1 downto 0),
      m_axis_tuser(0) => NLW_inst_m_axis_tuser_UNCONNECTED(0),
      m_axis_tvalid => m_axis_tvalid,
      s_axis_tdata(31 downto 0) => s_axis_tdata(31 downto 0),
      s_axis_tdest(0) => \<const0>\,
      s_axis_tid(0) => \<const0>\,
      s_axis_tkeep(3 downto 0) => s_axis_tkeep(3 downto 0),
      s_axis_tlast => s_axis_tlast,
      s_axis_tready => s_axis_tready,
      s_axis_tstrb(3) => \<const1>\,
      s_axis_tstrb(2) => \<const1>\,
      s_axis_tstrb(1) => \<const1>\,
      s_axis_tstrb(0) => \<const1>\,
      s_axis_tuser(0) => \<const0>\,
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
