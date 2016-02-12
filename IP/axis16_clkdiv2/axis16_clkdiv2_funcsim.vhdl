-- Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2013.4 (win64) Build 353583 Mon Dec  9 17:49:19 MST 2013
-- Date        : Fri Dec 12 12:27:12 2014
-- Host        : TELOPS210 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim d:/Telops/fir-00251-Common/IP/axis16_clkdiv2/axis16_clkdiv2_funcsim.vhdl
-- Design      : axis16_clkdiv2
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k160tfbg676-1
-- --------------------------------------------------------------------------------
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis16_clkdiv2axis_clock_converter_v1_1_axisc_sample_cycle_ratio is
  port (
    O1 : out STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_areset_r : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end axis16_clkdiv2axis_clock_converter_v1_1_axisc_sample_cycle_ratio;

architecture STRUCTURE of axis16_clkdiv2axis_clock_converter_v1_1_axisc_sample_cycle_ratio is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal posedge_finder_first : STD_LOGIC;
  signal posedge_finder_second : STD_LOGIC;
  signal slow_aclk_div2 : STD_LOGIC;
  signal slow_aclk_div20 : STD_LOGIC;
  attribute RETAIN_INVERTER : boolean;
  attribute RETAIN_INVERTER of \gen_sample_cycle.slow_aclk_div2_i_1\ : label is true;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gen_sample_cycle.slow_aclk_div2_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \gen_sync_clock_converter.s_ready_r_i_1\ : label is "soft_lutpair0";
begin
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
\gen_sample_cycle.posedge_finder_first_reg\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => slow_aclk_div2,
      Q => posedge_finder_first,
      R => \<const0>\
    );
\gen_sample_cycle.posedge_finder_second_reg\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => slow_aclk_div20,
      Q => posedge_finder_second,
      R => \<const0>\
    );
\gen_sample_cycle.slow_aclk_div2_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => slow_aclk_div2,
      O => slow_aclk_div20
    );
\gen_sample_cycle.slow_aclk_div2_reg\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => \<const1>\,
      D => slow_aclk_div20,
      Q => slow_aclk_div2,
      R => \<const0>\
    );
\gen_sync_clock_converter.s_ready_r_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00044404"
    )
    port map (
      I0 => s_areset_r,
      I1 => Q(0),
      I2 => posedge_finder_second,
      I3 => slow_aclk_div2,
      I4 => posedge_finder_first,
      O => O1
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis16_clkdiv2axis_clock_converter_v1_1_axisc_sync_clock_converter is
  port (
    s_areset_r : out STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    O1 : out STD_LOGIC_VECTOR ( 28 downto 0 );
    s_axis_aclk : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    I1 : in STD_LOGIC;
    s_axis_aresetn : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 28 downto 0 )
  );
end axis16_clkdiv2axis_clock_converter_v1_1_axisc_sync_clock_converter;

architecture STRUCTURE of axis16_clkdiv2axis_clock_converter_v1_1_axisc_sync_clock_converter is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal load_payload : STD_LOGIC;
  signal load_storage : STD_LOGIC;
  signal m_areset_r : STD_LOGIC;
  signal m_storage_r : STD_LOGIC_VECTOR ( 28 downto 0 );
  signal \n_0_gen_sync_clock_converter.m_valid_r_i_1\ : STD_LOGIC;
  signal \n_0_gen_sync_clock_converter.s_areset_r_i_1\ : STD_LOGIC;
  signal \n_0_gen_sync_clock_converter.state[0]_i_1\ : STD_LOGIC;
  signal \n_0_gen_sync_clock_converter.state[1]_i_1\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 28 downto 0 );
  signal state : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gen_sync_clock_converter.m_valid_r_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \gen_sync_clock_converter.state[0]_i_1\ : label is "soft_lutpair1";
begin
  Q(0) <= \^q\(0);
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
\gen_sync_clock_converter.m_areset_r_reg\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => \<const1>\,
      D => \n_0_gen_sync_clock_converter.s_areset_r_i_1\,
      Q => m_areset_r,
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(0),
      I1 => D(0),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(0)
    );
\gen_sync_clock_converter.m_payload_r[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(10),
      I1 => D(10),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(10)
    );
\gen_sync_clock_converter.m_payload_r[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(11),
      I1 => D(11),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(11)
    );
\gen_sync_clock_converter.m_payload_r[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(12),
      I1 => D(12),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(12)
    );
\gen_sync_clock_converter.m_payload_r[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(13),
      I1 => D(13),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(13)
    );
\gen_sync_clock_converter.m_payload_r[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(14),
      I1 => D(14),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(14)
    );
\gen_sync_clock_converter.m_payload_r[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
    port map (
      I0 => m_axis_tready,
      I1 => state(0),
      I2 => \^q\(0),
      O => load_payload
    );
\gen_sync_clock_converter.m_payload_r[15]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(15),
      I1 => D(15),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(15)
    );
\gen_sync_clock_converter.m_payload_r[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(16),
      I1 => D(16),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(16)
    );
\gen_sync_clock_converter.m_payload_r[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(17),
      I1 => D(17),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(17)
    );
\gen_sync_clock_converter.m_payload_r[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(18),
      I1 => D(18),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(18)
    );
\gen_sync_clock_converter.m_payload_r[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(19),
      I1 => D(19),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(19)
    );
\gen_sync_clock_converter.m_payload_r[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(1),
      I1 => D(1),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(1)
    );
\gen_sync_clock_converter.m_payload_r[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(20),
      I1 => D(20),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(20)
    );
\gen_sync_clock_converter.m_payload_r[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(21),
      I1 => D(21),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(21)
    );
\gen_sync_clock_converter.m_payload_r[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(22),
      I1 => D(22),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(22)
    );
\gen_sync_clock_converter.m_payload_r[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(23),
      I1 => D(23),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(23)
    );
\gen_sync_clock_converter.m_payload_r[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(24),
      I1 => D(24),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(24)
    );
\gen_sync_clock_converter.m_payload_r[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(25),
      I1 => D(25),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(25)
    );
\gen_sync_clock_converter.m_payload_r[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(26),
      I1 => D(26),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(26)
    );
\gen_sync_clock_converter.m_payload_r[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(27),
      I1 => D(27),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(27)
    );
\gen_sync_clock_converter.m_payload_r[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(28),
      I1 => D(28),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(28)
    );
\gen_sync_clock_converter.m_payload_r[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(2),
      I1 => D(2),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(2)
    );
\gen_sync_clock_converter.m_payload_r[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(3),
      I1 => D(3),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(3)
    );
\gen_sync_clock_converter.m_payload_r[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(4),
      I1 => D(4),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(4)
    );
\gen_sync_clock_converter.m_payload_r[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(5),
      I1 => D(5),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(5)
    );
\gen_sync_clock_converter.m_payload_r[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(6),
      I1 => D(6),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(6)
    );
\gen_sync_clock_converter.m_payload_r[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(7),
      I1 => D(7),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(7)
    );
\gen_sync_clock_converter.m_payload_r[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(8),
      I1 => D(8),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(8)
    );
\gen_sync_clock_converter.m_payload_r[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACCCCCC"
    )
    port map (
      I0 => m_storage_r(9),
      I1 => D(9),
      I2 => \^q\(0),
      I3 => state(0),
      I4 => m_axis_tready,
      O => p_0_in(9)
    );
\gen_sync_clock_converter.m_payload_r_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(0),
      Q => O1(0),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(10),
      Q => O1(10),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(11),
      Q => O1(11),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[12]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(12),
      Q => O1(12),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[13]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(13),
      Q => O1(13),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[14]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(14),
      Q => O1(14),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[15]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(15),
      Q => O1(15),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[16]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(16),
      Q => O1(16),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[17]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(17),
      Q => O1(17),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[18]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(18),
      Q => O1(18),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[19]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(19),
      Q => O1(19),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(1),
      Q => O1(1),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[20]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(20),
      Q => O1(20),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[21]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(21),
      Q => O1(21),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[22]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(22),
      Q => O1(22),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[23]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(23),
      Q => O1(23),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[24]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(24),
      Q => O1(24),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[25]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(25),
      Q => O1(25),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[26]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(26),
      Q => O1(26),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[27]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(27),
      Q => O1(27),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[28]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(28),
      Q => O1(28),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(2),
      Q => O1(2),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(3),
      Q => O1(3),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(4),
      Q => O1(4),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(5),
      Q => O1(5),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(6),
      Q => O1(6),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(7),
      Q => O1(7),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(8),
      Q => O1(8),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_payload_r_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_payload,
      D => p_0_in(9),
      Q => O1(9),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r[28]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => \^q\(0),
      I1 => state(0),
      O => load_storage
    );
\gen_sync_clock_converter.m_storage_r_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(0),
      Q => m_storage_r(0),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(10),
      Q => m_storage_r(10),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(11),
      Q => m_storage_r(11),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[12]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(12),
      Q => m_storage_r(12),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[13]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(13),
      Q => m_storage_r(13),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[14]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(14),
      Q => m_storage_r(14),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[15]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(15),
      Q => m_storage_r(15),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[16]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(16),
      Q => m_storage_r(16),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[17]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(17),
      Q => m_storage_r(17),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[18]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(18),
      Q => m_storage_r(18),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[19]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(19),
      Q => m_storage_r(19),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(1),
      Q => m_storage_r(1),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[20]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(20),
      Q => m_storage_r(20),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[21]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(21),
      Q => m_storage_r(21),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[22]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(22),
      Q => m_storage_r(22),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[23]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(23),
      Q => m_storage_r(23),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[24]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(24),
      Q => m_storage_r(24),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[25]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(25),
      Q => m_storage_r(25),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[26]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(26),
      Q => m_storage_r(26),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[27]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(27),
      Q => m_storage_r(27),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[28]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(28),
      Q => m_storage_r(28),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(2),
      Q => m_storage_r(2),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(3),
      Q => m_storage_r(3),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(4),
      Q => m_storage_r(4),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(5),
      Q => m_storage_r(5),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(6),
      Q => m_storage_r(6),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(7),
      Q => m_storage_r(7),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(8),
      Q => m_storage_r(8),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_storage_r_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => load_storage,
      D => D(9),
      Q => m_storage_r(9),
      R => \<const0>\
    );
\gen_sync_clock_converter.m_valid_r_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FC4C"
    )
    port map (
      I0 => m_axis_tready,
      I1 => state(0),
      I2 => \^q\(0),
      I3 => s_axis_tvalid,
      I4 => m_areset_r,
      O => \n_0_gen_sync_clock_converter.m_valid_r_i_1\
    );
\gen_sync_clock_converter.m_valid_r_reg\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => \<const1>\,
      D => \n_0_gen_sync_clock_converter.m_valid_r_i_1\,
      Q => m_axis_tvalid,
      R => \<const0>\
    );
\gen_sync_clock_converter.s_areset_r_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => s_axis_aresetn,
      I1 => m_axis_aresetn,
      O => \n_0_gen_sync_clock_converter.s_areset_r_i_1\
    );
\gen_sync_clock_converter.s_areset_r_reg\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => \n_0_gen_sync_clock_converter.s_areset_r_i_1\,
      Q => s_areset_r,
      R => \<const0>\
    );
\gen_sync_clock_converter.s_ready_r_reg\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => I1,
      Q => s_axis_tready,
      R => \<const0>\
    );
\gen_sync_clock_converter.state[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000B8F8"
    )
    port map (
      I0 => s_axis_tvalid,
      I1 => \^q\(0),
      I2 => state(0),
      I3 => m_axis_tready,
      I4 => m_areset_r,
      O => \n_0_gen_sync_clock_converter.state[0]_i_1\
    );
\gen_sync_clock_converter.state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000F4FF"
    )
    port map (
      I0 => s_axis_tvalid,
      I1 => \^q\(0),
      I2 => m_axis_tready,
      I3 => state(0),
      I4 => m_areset_r,
      O => \n_0_gen_sync_clock_converter.state[1]_i_1\
    );
\gen_sync_clock_converter.state_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => \<const1>\,
      D => \n_0_gen_sync_clock_converter.state[0]_i_1\,
      Q => state(0),
      R => \<const0>\
    );
\gen_sync_clock_converter.state_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => m_axis_aclk,
      CE => \<const1>\,
      D => \n_0_gen_sync_clock_converter.state[1]_i_1\,
      Q => \^q\(0),
      R => \<const0>\
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter is
  port (
    s_axis_aresetn : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC;
    s_axis_aclken : in STD_LOGIC;
    m_axis_aclken : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_aclk : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is "yes";
  attribute C_FAMILY : string;
  attribute C_FAMILY of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is "kintex7";
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 16;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 1;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 3;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 4;
  attribute C_AXIS_SIGNAL_SET : string;
  attribute C_AXIS_SIGNAL_SET of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is "32'b00000000000000000000000011111111";
  attribute C_IS_ACLK_ASYNC : integer;
  attribute C_IS_ACLK_ASYNC of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 0;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 2;
  attribute C_S_AXIS_ACLK_RATIO : integer;
  attribute C_S_AXIS_ACLK_RATIO of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 2;
  attribute C_M_AXIS_ACLK_RATIO : integer;
  attribute C_M_AXIS_ACLK_RATIO of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 1;
  attribute C_ACLKEN_CONV_MODE : integer;
  attribute C_ACLKEN_CONV_MODE of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 0;
  attribute G_INDX_SS_TREADY : integer;
  attribute G_INDX_SS_TREADY of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 0;
  attribute G_INDX_SS_TDATA : integer;
  attribute G_INDX_SS_TDATA of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 1;
  attribute G_INDX_SS_TSTRB : integer;
  attribute G_INDX_SS_TSTRB of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 2;
  attribute G_INDX_SS_TKEEP : integer;
  attribute G_INDX_SS_TKEEP of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 3;
  attribute G_INDX_SS_TLAST : integer;
  attribute G_INDX_SS_TLAST of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 4;
  attribute G_INDX_SS_TID : integer;
  attribute G_INDX_SS_TID of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 5;
  attribute G_INDX_SS_TDEST : integer;
  attribute G_INDX_SS_TDEST of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 6;
  attribute G_INDX_SS_TUSER : integer;
  attribute G_INDX_SS_TUSER of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 7;
  attribute G_MASK_SS_TREADY : integer;
  attribute G_MASK_SS_TREADY of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 1;
  attribute G_MASK_SS_TDATA : integer;
  attribute G_MASK_SS_TDATA of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 2;
  attribute G_MASK_SS_TSTRB : integer;
  attribute G_MASK_SS_TSTRB of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 4;
  attribute G_MASK_SS_TKEEP : integer;
  attribute G_MASK_SS_TKEEP of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 8;
  attribute G_MASK_SS_TLAST : integer;
  attribute G_MASK_SS_TLAST of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 16;
  attribute G_MASK_SS_TID : integer;
  attribute G_MASK_SS_TID of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 32;
  attribute G_MASK_SS_TDEST : integer;
  attribute G_MASK_SS_TDEST of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 64;
  attribute G_MASK_SS_TUSER : integer;
  attribute G_MASK_SS_TUSER of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 128;
  attribute G_TASK_SEVERITY_ERR : integer;
  attribute G_TASK_SEVERITY_ERR of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 2;
  attribute G_TASK_SEVERITY_WARNING : integer;
  attribute G_TASK_SEVERITY_WARNING of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 1;
  attribute G_TASK_SEVERITY_INFO : integer;
  attribute G_TASK_SEVERITY_INFO of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 0;
  attribute LP_S_ACLKEN_CAN_TOGGLE : integer;
  attribute LP_S_ACLKEN_CAN_TOGGLE of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 0;
  attribute LP_M_ACLKEN_CAN_TOGGLE : integer;
  attribute LP_M_ACLKEN_CAN_TOGGLE of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 0;
  attribute P_FIFO_MODE : integer;
  attribute P_FIFO_MODE of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 1;
  attribute P_FIFO_DEPTH : integer;
  attribute P_FIFO_DEPTH of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 32;
  attribute P_S_AXIS_ACLK_RATIO : integer;
  attribute P_S_AXIS_ACLK_RATIO of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 2;
  attribute P_M_AXIS_ACLK_RATIO : integer;
  attribute P_M_AXIS_ACLK_RATIO of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 1;
  attribute P_INST_FIFO_GEN : integer;
  attribute P_INST_FIFO_GEN of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 0;
  attribute P_TPAYLOAD_WIDTH : integer;
  attribute P_TPAYLOAD_WIDTH of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 29;
  attribute P_SAMPLE_CYCLE_RATIO : integer;
  attribute P_SAMPLE_CYCLE_RATIO of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter : entity is 2;
end axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter;

architecture STRUCTURE of axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter is
  signal \n_0_gen_sync_ck_conv.axisc_sample_cycle_ratio_m\ : STD_LOGIC;
  signal s_areset_r : STD_LOGIC;
  signal s_ready_ns : STD_LOGIC;
begin
\gen_sync_ck_conv.axisc_sample_cycle_ratio_m\: entity work.axis16_clkdiv2axis_clock_converter_v1_1_axisc_sample_cycle_ratio
    port map (
      O1 => \n_0_gen_sync_ck_conv.axisc_sample_cycle_ratio_m\,
      Q(0) => s_ready_ns,
      m_axis_aclk => m_axis_aclk,
      s_areset_r => s_areset_r,
      s_axis_aclk => s_axis_aclk
    );
\gen_sync_ck_conv.axisc_sync_clock_converter_0\: entity work.axis16_clkdiv2axis_clock_converter_v1_1_axisc_sync_clock_converter
    port map (
      D(28 downto 25) => s_axis_tuser(3 downto 0),
      D(24 downto 22) => s_axis_tdest(2 downto 0),
      D(21) => s_axis_tid(0),
      D(20) => s_axis_tlast,
      D(19 downto 18) => s_axis_tkeep(1 downto 0),
      D(17 downto 16) => s_axis_tstrb(1 downto 0),
      D(15 downto 0) => s_axis_tdata(15 downto 0),
      I1 => \n_0_gen_sync_ck_conv.axisc_sample_cycle_ratio_m\,
      O1(28 downto 25) => m_axis_tuser(3 downto 0),
      O1(24 downto 22) => m_axis_tdest(2 downto 0),
      O1(21) => m_axis_tid(0),
      O1(20) => m_axis_tlast,
      O1(19 downto 18) => m_axis_tkeep(1 downto 0),
      O1(17 downto 16) => m_axis_tstrb(1 downto 0),
      O1(15 downto 0) => m_axis_tdata(15 downto 0),
      Q(0) => s_ready_ns,
      m_axis_aclk => m_axis_aclk,
      m_axis_aresetn => m_axis_aresetn,
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => m_axis_tvalid,
      s_areset_r => s_areset_r,
      s_axis_aclk => s_axis_aclk,
      s_axis_aresetn => s_axis_aresetn,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis16_clkdiv2 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_aclk : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of axis16_clkdiv2 : entity is true;
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of axis16_clkdiv2 : entity is "axis_clock_converter_v1_1_axis_clock_converter,Vivado 2013.4";
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of axis16_clkdiv2 : entity is "axis16_clkdiv2,axis_clock_converter_v1_1_axis_clock_converter,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of axis16_clkdiv2 : entity is "axis16_clkdiv2,axis_clock_converter_v1_1_axis_clock_converter,{x_ipProduct=Vivado 2013.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=axis_clock_converter,x_ipVersion=1.1,x_ipCoreRevision=1,x_ipLanguage=VHDL,C_FAMILY=kintex7,C_AXIS_TDATA_WIDTH=16,C_AXIS_TID_WIDTH=1,C_AXIS_TDEST_WIDTH=3,C_AXIS_TUSER_WIDTH=4,C_AXIS_SIGNAL_SET=0b11111111,C_IS_ACLK_ASYNC=0,C_SYNCHRONIZER_STAGE=2,C_S_AXIS_ACLK_RATIO=2,C_M_AXIS_ACLK_RATIO=1,C_ACLKEN_CONV_MODE=0}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of axis16_clkdiv2 : entity is "yes";
end axis16_clkdiv2;

architecture STRUCTURE of axis16_clkdiv2 is
  signal \<const1>\ : STD_LOGIC;
  attribute C_ACLKEN_CONV_MODE : integer;
  attribute C_ACLKEN_CONV_MODE of inst : label is 0;
  attribute C_AXIS_SIGNAL_SET : string;
  attribute C_AXIS_SIGNAL_SET of inst : label is "32'b00000000000000000000000011111111";
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of inst : label is 16;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of inst : label is 3;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of inst : label is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of inst : label is 4;
  attribute C_FAMILY : string;
  attribute C_FAMILY of inst : label is "kintex7";
  attribute C_IS_ACLK_ASYNC : integer;
  attribute C_IS_ACLK_ASYNC of inst : label is 0;
  attribute C_M_AXIS_ACLK_RATIO : integer;
  attribute C_M_AXIS_ACLK_RATIO of inst : label is 1;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of inst : label is 2;
  attribute C_S_AXIS_ACLK_RATIO : integer;
  attribute C_S_AXIS_ACLK_RATIO of inst : label is 2;
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
  attribute LP_M_ACLKEN_CAN_TOGGLE : integer;
  attribute LP_M_ACLKEN_CAN_TOGGLE of inst : label is 0;
  attribute LP_S_ACLKEN_CAN_TOGGLE : integer;
  attribute LP_S_ACLKEN_CAN_TOGGLE of inst : label is 0;
  attribute P_FIFO_DEPTH : integer;
  attribute P_FIFO_DEPTH of inst : label is 32;
  attribute P_FIFO_MODE : integer;
  attribute P_FIFO_MODE of inst : label is 1;
  attribute P_INST_FIFO_GEN : integer;
  attribute P_INST_FIFO_GEN of inst : label is 0;
  attribute P_M_AXIS_ACLK_RATIO : integer;
  attribute P_M_AXIS_ACLK_RATIO of inst : label is 1;
  attribute P_SAMPLE_CYCLE_RATIO : integer;
  attribute P_SAMPLE_CYCLE_RATIO of inst : label is 2;
  attribute P_S_AXIS_ACLK_RATIO : integer;
  attribute P_S_AXIS_ACLK_RATIO of inst : label is 2;
  attribute P_TPAYLOAD_WIDTH : integer;
  attribute P_TPAYLOAD_WIDTH of inst : label is 29;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of inst : label is "xilinx.com:interface:axis:1.0 S_AXIS TREADY";
begin
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
inst: entity work.axis16_clkdiv2axis_clock_converter_v1_1_axis_clock_converter
    port map (
      m_axis_aclk => m_axis_aclk,
      m_axis_aclken => \<const1>\,
      m_axis_aresetn => m_axis_aresetn,
      m_axis_tdata(15 downto 0) => m_axis_tdata(15 downto 0),
      m_axis_tdest(2 downto 0) => m_axis_tdest(2 downto 0),
      m_axis_tid(0) => m_axis_tid(0),
      m_axis_tkeep(1 downto 0) => m_axis_tkeep(1 downto 0),
      m_axis_tlast => m_axis_tlast,
      m_axis_tready => m_axis_tready,
      m_axis_tstrb(1 downto 0) => m_axis_tstrb(1 downto 0),
      m_axis_tuser(3 downto 0) => m_axis_tuser(3 downto 0),
      m_axis_tvalid => m_axis_tvalid,
      s_axis_aclk => s_axis_aclk,
      s_axis_aclken => \<const1>\,
      s_axis_aresetn => s_axis_aresetn,
      s_axis_tdata(15 downto 0) => s_axis_tdata(15 downto 0),
      s_axis_tdest(2 downto 0) => s_axis_tdest(2 downto 0),
      s_axis_tid(0) => s_axis_tid(0),
      s_axis_tkeep(1 downto 0) => s_axis_tkeep(1 downto 0),
      s_axis_tlast => s_axis_tlast,
      s_axis_tready => s_axis_tready,
      s_axis_tstrb(1 downto 0) => s_axis_tstrb(1 downto 0),
      s_axis_tuser(3 downto 0) => s_axis_tuser(3 downto 0),
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
