-- Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2013.4 (win64) Build 353583 Mon Dec  9 17:49:19 MST 2013
-- Date        : Fri Dec 12 12:27:00 2014
-- Host        : TELOPS210 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               d:/Telops/fir-00251-Common/IP/axis_clock_converter_div2/axis_clock_converter_div2_funcsim.vhdl
-- Design      : axis_clock_converter_div2
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k160tfbg676-1
-- --------------------------------------------------------------------------------
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_clock_converter_div2axis_infrastructure_v1_1_clock_synchronizer is
  port (
    s_aresetn_synch : out STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_aresetn : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC
  );
end axis_clock_converter_div2axis_infrastructure_v1_1_clock_synchronizer;

architecture STRUCTURE of axis_clock_converter_div2axis_infrastructure_v1_1_clock_synchronizer is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \n_0_gen_synchronizer.synch_d[0]_i_1\ : STD_LOGIC;
  signal synch_d : STD_LOGIC;
begin
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
\gen_synchronizer.synch_d[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => s_axis_aresetn,
      I1 => m_axis_aresetn,
      O => \n_0_gen_synchronizer.synch_d[0]_i_1\
    );
\gen_synchronizer.synch_d_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => \n_0_gen_synchronizer.synch_d[0]_i_1\,
      Q => synch_d,
      R => \<const0>\
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => synch_d,
      O => s_aresetn_synch
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_clock_converter_div2dmem is
  port (
    D : out STD_LOGIC_VECTOR ( 100 downto 0 );
    I1 : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    DI : in STD_LOGIC_VECTOR ( 100 downto 0 );
    s_axis_aclk : in STD_LOGIC;
    O3 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 4 downto 0 )
  );
end axis_clock_converter_div2dmem;

architecture STRUCTURE of axis_clock_converter_div2dmem is
  signal \<const0>\ : STD_LOGIC;
  signal p_0_out : STD_LOGIC_VECTOR ( 100 downto 0 );
  signal NLW_RAM_reg_0_31_0_5_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_12_17_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_18_23_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_24_29_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_30_35_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_36_41_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_42_47_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_48_53_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_54_59_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_60_65_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_66_71_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_6_11_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_72_77_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_78_83_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_84_89_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_90_95_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_0_31_96_100_DOC_UNCONNECTED : STD_LOGIC_VECTOR ( 1 to 1 );
  signal NLW_RAM_reg_0_31_96_100_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
begin
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
RAM_reg_0_31_0_5: unisim.vcomponents.RAM32M
    port map (
      ADDRA(4 downto 0) => O3(4 downto 0),
      ADDRB(4 downto 0) => O3(4 downto 0),
      ADDRC(4 downto 0) => O3(4 downto 0),
      ADDRD(4 downto 0) => Q(4 downto 0),
      DIA(1 downto 0) => DI(1 downto 0),
      DIB(1 downto 0) => DI(3 downto 2),
      DIC(1 downto 0) => DI(5 downto 4),
      DID(1) => \<const0>\,
      DID(0) => \<const0>\,
      DOA(1 downto 0) => p_0_out(1 downto 0),
      DOB(1 downto 0) => p_0_out(3 downto 2),
      DOC(1 downto 0) => p_0_out(5 downto 4),
      DOD(1 downto 0) => NLW_RAM_reg_0_31_0_5_DOD_UNCONNECTED(1 downto 0),
      WCLK => s_axis_aclk,
      WE => E(0)
    );
RAM_reg_0_31_12_17: unisim.vcomponents.RAM32M
    port map (
      ADDRA(4 downto 0) => O3(4 downto 0),
      ADDRB(4 downto 0) => O3(4 downto 0),
      ADDRC(4 downto 0) => O3(4 downto 0),
      ADDRD(4 downto 0) => Q(4 downto 0),
      DIA(1 downto 0) => DI(13 downto 12),
      DIB(1 downto 0) => DI(15 downto 14),
      DIC(1 downto 0) => DI(17 downto 16),
      DID(1) => \<const0>\,
      DID(0) => \<const0>\,
      DOA(1 downto 0) => p_0_out(13 downto 12),
      DOB(1 downto 0) => p_0_out(15 downto 14),
      DOC(1 downto 0) => p_0_out(17 downto 16),
      DOD(1 downto 0) => NLW_RAM_reg_0_31_12_17_DOD_UNCONNECTED(1 downto 0),
      WCLK => s_axis_aclk,
      WE => E(0)
    );
RAM_reg_0_31_18_23: unisim.vcomponents.RAM32M
    port map (
      ADDRA(4 downto 0) => O3(4 downto 0),
      ADDRB(4 downto 0) => O3(4 downto 0),
      ADDRC(4 downto 0) => O3(4 downto 0),
      ADDRD(4 downto 0) => Q(4 downto 0),
      DIA(1 downto 0) => DI(19 downto 18),
      DIB(1 downto 0) => DI(21 downto 20),
      DIC(1 downto 0) => DI(23 downto 22),
      DID(1) => \<const0>\,
      DID(0) => \<const0>\,
      DOA(1 downto 0) => p_0_out(19 downto 18),
      DOB(1 downto 0) => p_0_out(21 downto 20),
      DOC(1 downto 0) => p_0_out(23 downto 22),
      DOD(1 downto 0) => NLW_RAM_reg_0_31_18_23_DOD_UNCONNECTED(1 downto 0),
      WCLK => s_axis_aclk,
      WE => E(0)
    );
RAM_reg_0_31_24_29: unisim.vcomponents.RAM32M
    port map (
      ADDRA(4 downto 0) => O3(4 downto 0),
      ADDRB(4 downto 0) => O3(4 downto 0),
      ADDRC(4 downto 0) => O3(4 downto 0),
      ADDRD(4 downto 0) => Q(4 downto 0),
      DIA(1 downto 0) => DI(25 downto 24),
      DIB(1 downto 0) => DI(27 downto 26),
      DIC(1 downto 0) => DI(29 downto 28),
      DID(1) => \<const0>\,
      DID(0) => \<const0>\,
      DOA(1 downto 0) => p_0_out(25 downto 24),
      DOB(1 downto 0) => p_0_out(27 downto 26),
      DOC(1 downto 0) => p_0_out(29 downto 28),
      DOD(1 downto 0) => NLW_RAM_reg_0_31_24_29_DOD_UNCONNECTED(1 downto 0),
      WCLK => s_axis_aclk,
      WE => E(0)
    );
RAM_reg_0_31_30_35: unisim.vcomponents.RAM32M
    port map (
      ADDRA(4 downto 0) => O3(4 downto 0),
      ADDRB(4 downto 0) => O3(4 downto 0),
      ADDRC(4 downto 0) => O3(4 downto 0),
      ADDRD(4 downto 0) => Q(4 downto 0),
      DIA(1 downto 0) => DI(31 downto 30),
      DIB(1 downto 0) => DI(33 downto 32),
      DIC(1 downto 0) => DI(35 downto 34),
      DID(1) => \<const0>\,
      DID(0) => \<const0>\,
      DOA(1 downto 0) => p_0_out(31 downto 30),
      DOB(1 downto 0) => p_0_out(33 downto 32),
      DOC(1 downto 0) => p_0_out(35 downto 34),
      DOD(1 downto 0) => NLW_RAM_reg_0_31_30_35_DOD_UNCONNECTED(1 downto 0),
      WCLK => s_axis_aclk,
      WE => E(0)
    );
RAM_reg_0_31_36_41: unisim.vcomponents.RAM32M
    port map (
      ADDRA(4 downto 0) => O3(4 downto 0),
      ADDRB(4 downto 0) => O3(4 downto 0),
      ADDRC(4 downto 0) => O3(4 downto 0),
      ADDRD(4 downto 0) => Q(4 downto 0),
      DIA(1 downto 0) => DI(37 downto 36),
      DIB(1 downto 0) => DI(39 downto 38),
      DIC(1 downto 0) => DI(41 downto 40),
      DID(1) => \<const0>\,
      DID(0) => \<const0>\,
      DOA(1 downto 0) => p_0_out(37 downto 36),
      DOB(1 downto 0) => p_0_out(39 downto 38),
      DOC(1 downto 0) => p_0_out(41 downto 40),
      DOD(1 downto 0) => NLW_RAM_reg_0_31_36_41_DOD_UNCONNECTED(1 downto 0),
      WCLK => s_axis_aclk,
      WE => E(0)
    );
RAM_reg_0_31_42_47: unisim.vcomponents.RAM32M
    port map (
      ADDRA(4 downto 0) => O3(4 downto 0),
      ADDRB(4 downto 0) => O3(4 downto 0),
      ADDRC(4 downto 0) => O3(4 downto 0),
      ADDRD(4 downto 0) => Q(4 downto 0),
      DIA(1 downto 0) => DI(43 downto 42),
      DIB(1 downto 0) => DI(45 downto 44),
      DIC(1 downto 0) => DI(47 downto 46),
      DID(1) => \<const0>\,
      DID(0) => \<const0>\,
      DOA(1 downto 0) => p_0_out(43 downto 42),
      DOB(1 downto 0) => p_0_out(45 downto 44),
      DOC(1 downto 0) => p_0_out(47 downto 46),
      DOD(1 downto 0) => NLW_RAM_reg_0_31_42_47_DOD_UNCONNECTED(1 downto 0),
      WCLK => s_axis_aclk,
      WE => E(0)
    );
RAM_reg_0_31_48_53: unisim.vcomponents.RAM32M
    port map (
      ADDRA(4 downto 0) => O3(4 downto 0),
      ADDRB(4 downto 0) => O3(4 downto 0),
      ADDRC(4 downto 0) => O3(4 downto 0),
      ADDRD(4 downto 0) => Q(4 downto 0),
      DIA(1 downto 0) => DI(49 downto 48),
      DIB(1 downto 0) => DI(51 downto 50),
      DIC(1 downto 0) => DI(53 downto 52),
      DID(1) => \<const0>\,
      DID(0) => \<const0>\,
      DOA(1 downto 0) => p_0_out(49 downto 48),
      DOB(1 downto 0) => p_0_out(51 downto 50),
      DOC(1 downto 0) => p_0_out(53 downto 52),
      DOD(1 downto 0) => NLW_RAM_reg_0_31_48_53_DOD_UNCONNECTED(1 downto 0),
      WCLK => s_axis_aclk,
      WE => E(0)
    );
RAM_reg_0_31_54_59: unisim.vcomponents.RAM32M
    port map (
      ADDRA(4 downto 0) => O3(4 downto 0),
      ADDRB(4 downto 0) => O3(4 downto 0),
      ADDRC(4 downto 0) => O3(4 downto 0),
      ADDRD(4 downto 0) => Q(4 downto 0),
      DIA(1 downto 0) => DI(55 downto 54),
      DIB(1 downto 0) => DI(57 downto 56),
      DIC(1 downto 0) => DI(59 downto 58),
      DID(1) => \<const0>\,
      DID(0) => \<const0>\,
      DOA(1 downto 0) => p_0_out(55 downto 54),
      DOB(1 downto 0) => p_0_out(57 downto 56),
      DOC(1 downto 0) => p_0_out(59 downto 58),
      DOD(1 downto 0) => NLW_RAM_reg_0_31_54_59_DOD_UNCONNECTED(1 downto 0),
      WCLK => s_axis_aclk,
      WE => E(0)
    );
RAM_reg_0_31_60_65: unisim.vcomponents.RAM32M
    port map (
      ADDRA(4 downto 0) => O3(4 downto 0),
      ADDRB(4 downto 0) => O3(4 downto 0),
      ADDRC(4 downto 0) => O3(4 downto 0),
      ADDRD(4 downto 0) => Q(4 downto 0),
      DIA(1 downto 0) => DI(61 downto 60),
      DIB(1 downto 0) => DI(63 downto 62),
      DIC(1 downto 0) => DI(65 downto 64),
      DID(1) => \<const0>\,
      DID(0) => \<const0>\,
      DOA(1 downto 0) => p_0_out(61 downto 60),
      DOB(1 downto 0) => p_0_out(63 downto 62),
      DOC(1 downto 0) => p_0_out(65 downto 64),
      DOD(1 downto 0) => NLW_RAM_reg_0_31_60_65_DOD_UNCONNECTED(1 downto 0),
      WCLK => s_axis_aclk,
      WE => E(0)
    );
RAM_reg_0_31_66_71: unisim.vcomponents.RAM32M
    port map (
      ADDRA(4 downto 0) => O3(4 downto 0),
      ADDRB(4 downto 0) => O3(4 downto 0),
      ADDRC(4 downto 0) => O3(4 downto 0),
      ADDRD(4 downto 0) => Q(4 downto 0),
      DIA(1 downto 0) => DI(67 downto 66),
      DIB(1 downto 0) => DI(69 downto 68),
      DIC(1 downto 0) => DI(71 downto 70),
      DID(1) => \<const0>\,
      DID(0) => \<const0>\,
      DOA(1 downto 0) => p_0_out(67 downto 66),
      DOB(1 downto 0) => p_0_out(69 downto 68),
      DOC(1 downto 0) => p_0_out(71 downto 70),
      DOD(1 downto 0) => NLW_RAM_reg_0_31_66_71_DOD_UNCONNECTED(1 downto 0),
      WCLK => s_axis_aclk,
      WE => E(0)
    );
RAM_reg_0_31_6_11: unisim.vcomponents.RAM32M
    port map (
      ADDRA(4 downto 0) => O3(4 downto 0),
      ADDRB(4 downto 0) => O3(4 downto 0),
      ADDRC(4 downto 0) => O3(4 downto 0),
      ADDRD(4 downto 0) => Q(4 downto 0),
      DIA(1 downto 0) => DI(7 downto 6),
      DIB(1 downto 0) => DI(9 downto 8),
      DIC(1 downto 0) => DI(11 downto 10),
      DID(1) => \<const0>\,
      DID(0) => \<const0>\,
      DOA(1 downto 0) => p_0_out(7 downto 6),
      DOB(1 downto 0) => p_0_out(9 downto 8),
      DOC(1 downto 0) => p_0_out(11 downto 10),
      DOD(1 downto 0) => NLW_RAM_reg_0_31_6_11_DOD_UNCONNECTED(1 downto 0),
      WCLK => s_axis_aclk,
      WE => E(0)
    );
RAM_reg_0_31_72_77: unisim.vcomponents.RAM32M
    port map (
      ADDRA(4 downto 0) => O3(4 downto 0),
      ADDRB(4 downto 0) => O3(4 downto 0),
      ADDRC(4 downto 0) => O3(4 downto 0),
      ADDRD(4 downto 0) => Q(4 downto 0),
      DIA(1 downto 0) => DI(73 downto 72),
      DIB(1 downto 0) => DI(75 downto 74),
      DIC(1 downto 0) => DI(77 downto 76),
      DID(1) => \<const0>\,
      DID(0) => \<const0>\,
      DOA(1 downto 0) => p_0_out(73 downto 72),
      DOB(1 downto 0) => p_0_out(75 downto 74),
      DOC(1 downto 0) => p_0_out(77 downto 76),
      DOD(1 downto 0) => NLW_RAM_reg_0_31_72_77_DOD_UNCONNECTED(1 downto 0),
      WCLK => s_axis_aclk,
      WE => E(0)
    );
RAM_reg_0_31_78_83: unisim.vcomponents.RAM32M
    port map (
      ADDRA(4 downto 0) => O3(4 downto 0),
      ADDRB(4 downto 0) => O3(4 downto 0),
      ADDRC(4 downto 0) => O3(4 downto 0),
      ADDRD(4 downto 0) => Q(4 downto 0),
      DIA(1 downto 0) => DI(79 downto 78),
      DIB(1 downto 0) => DI(81 downto 80),
      DIC(1 downto 0) => DI(83 downto 82),
      DID(1) => \<const0>\,
      DID(0) => \<const0>\,
      DOA(1 downto 0) => p_0_out(79 downto 78),
      DOB(1 downto 0) => p_0_out(81 downto 80),
      DOC(1 downto 0) => p_0_out(83 downto 82),
      DOD(1 downto 0) => NLW_RAM_reg_0_31_78_83_DOD_UNCONNECTED(1 downto 0),
      WCLK => s_axis_aclk,
      WE => E(0)
    );
RAM_reg_0_31_84_89: unisim.vcomponents.RAM32M
    port map (
      ADDRA(4 downto 0) => O3(4 downto 0),
      ADDRB(4 downto 0) => O3(4 downto 0),
      ADDRC(4 downto 0) => O3(4 downto 0),
      ADDRD(4 downto 0) => Q(4 downto 0),
      DIA(1 downto 0) => DI(85 downto 84),
      DIB(1 downto 0) => DI(87 downto 86),
      DIC(1 downto 0) => DI(89 downto 88),
      DID(1) => \<const0>\,
      DID(0) => \<const0>\,
      DOA(1 downto 0) => p_0_out(85 downto 84),
      DOB(1 downto 0) => p_0_out(87 downto 86),
      DOC(1 downto 0) => p_0_out(89 downto 88),
      DOD(1 downto 0) => NLW_RAM_reg_0_31_84_89_DOD_UNCONNECTED(1 downto 0),
      WCLK => s_axis_aclk,
      WE => E(0)
    );
RAM_reg_0_31_90_95: unisim.vcomponents.RAM32M
    port map (
      ADDRA(4 downto 0) => O3(4 downto 0),
      ADDRB(4 downto 0) => O3(4 downto 0),
      ADDRC(4 downto 0) => O3(4 downto 0),
      ADDRD(4 downto 0) => Q(4 downto 0),
      DIA(1 downto 0) => DI(91 downto 90),
      DIB(1 downto 0) => DI(93 downto 92),
      DIC(1 downto 0) => DI(95 downto 94),
      DID(1) => \<const0>\,
      DID(0) => \<const0>\,
      DOA(1 downto 0) => p_0_out(91 downto 90),
      DOB(1 downto 0) => p_0_out(93 downto 92),
      DOC(1 downto 0) => p_0_out(95 downto 94),
      DOD(1 downto 0) => NLW_RAM_reg_0_31_90_95_DOD_UNCONNECTED(1 downto 0),
      WCLK => s_axis_aclk,
      WE => E(0)
    );
RAM_reg_0_31_96_100: unisim.vcomponents.RAM32M
    port map (
      ADDRA(4 downto 0) => O3(4 downto 0),
      ADDRB(4 downto 0) => O3(4 downto 0),
      ADDRC(4 downto 0) => O3(4 downto 0),
      ADDRD(4 downto 0) => Q(4 downto 0),
      DIA(1 downto 0) => DI(97 downto 96),
      DIB(1 downto 0) => DI(99 downto 98),
      DIC(1) => \<const0>\,
      DIC(0) => DI(100),
      DID(1) => \<const0>\,
      DID(0) => \<const0>\,
      DOA(1 downto 0) => p_0_out(97 downto 96),
      DOB(1 downto 0) => p_0_out(99 downto 98),
      DOC(1) => NLW_RAM_reg_0_31_96_100_DOC_UNCONNECTED(1),
      DOC(0) => p_0_out(100),
      DOD(1 downto 0) => NLW_RAM_reg_0_31_96_100_DOD_UNCONNECTED(1 downto 0),
      WCLK => s_axis_aclk,
      WE => E(0)
    );
\gpr1.dout_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(0),
      Q => D(0),
      R => \<const0>\
    );
\gpr1.dout_i_reg[100]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(100),
      Q => D(100),
      R => \<const0>\
    );
\gpr1.dout_i_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(10),
      Q => D(10),
      R => \<const0>\
    );
\gpr1.dout_i_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(11),
      Q => D(11),
      R => \<const0>\
    );
\gpr1.dout_i_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(12),
      Q => D(12),
      R => \<const0>\
    );
\gpr1.dout_i_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(13),
      Q => D(13),
      R => \<const0>\
    );
\gpr1.dout_i_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(14),
      Q => D(14),
      R => \<const0>\
    );
\gpr1.dout_i_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(15),
      Q => D(15),
      R => \<const0>\
    );
\gpr1.dout_i_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(16),
      Q => D(16),
      R => \<const0>\
    );
\gpr1.dout_i_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(17),
      Q => D(17),
      R => \<const0>\
    );
\gpr1.dout_i_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(18),
      Q => D(18),
      R => \<const0>\
    );
\gpr1.dout_i_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(19),
      Q => D(19),
      R => \<const0>\
    );
\gpr1.dout_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(1),
      Q => D(1),
      R => \<const0>\
    );
\gpr1.dout_i_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(20),
      Q => D(20),
      R => \<const0>\
    );
\gpr1.dout_i_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(21),
      Q => D(21),
      R => \<const0>\
    );
\gpr1.dout_i_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(22),
      Q => D(22),
      R => \<const0>\
    );
\gpr1.dout_i_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(23),
      Q => D(23),
      R => \<const0>\
    );
\gpr1.dout_i_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(24),
      Q => D(24),
      R => \<const0>\
    );
\gpr1.dout_i_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(25),
      Q => D(25),
      R => \<const0>\
    );
\gpr1.dout_i_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(26),
      Q => D(26),
      R => \<const0>\
    );
\gpr1.dout_i_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(27),
      Q => D(27),
      R => \<const0>\
    );
\gpr1.dout_i_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(28),
      Q => D(28),
      R => \<const0>\
    );
\gpr1.dout_i_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(29),
      Q => D(29),
      R => \<const0>\
    );
\gpr1.dout_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(2),
      Q => D(2),
      R => \<const0>\
    );
\gpr1.dout_i_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(30),
      Q => D(30),
      R => \<const0>\
    );
\gpr1.dout_i_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(31),
      Q => D(31),
      R => \<const0>\
    );
\gpr1.dout_i_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(32),
      Q => D(32),
      R => \<const0>\
    );
\gpr1.dout_i_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(33),
      Q => D(33),
      R => \<const0>\
    );
\gpr1.dout_i_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(34),
      Q => D(34),
      R => \<const0>\
    );
\gpr1.dout_i_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(35),
      Q => D(35),
      R => \<const0>\
    );
\gpr1.dout_i_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(36),
      Q => D(36),
      R => \<const0>\
    );
\gpr1.dout_i_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(37),
      Q => D(37),
      R => \<const0>\
    );
\gpr1.dout_i_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(38),
      Q => D(38),
      R => \<const0>\
    );
\gpr1.dout_i_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(39),
      Q => D(39),
      R => \<const0>\
    );
\gpr1.dout_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(3),
      Q => D(3),
      R => \<const0>\
    );
\gpr1.dout_i_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(40),
      Q => D(40),
      R => \<const0>\
    );
\gpr1.dout_i_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(41),
      Q => D(41),
      R => \<const0>\
    );
\gpr1.dout_i_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(42),
      Q => D(42),
      R => \<const0>\
    );
\gpr1.dout_i_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(43),
      Q => D(43),
      R => \<const0>\
    );
\gpr1.dout_i_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(44),
      Q => D(44),
      R => \<const0>\
    );
\gpr1.dout_i_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(45),
      Q => D(45),
      R => \<const0>\
    );
\gpr1.dout_i_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(46),
      Q => D(46),
      R => \<const0>\
    );
\gpr1.dout_i_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(47),
      Q => D(47),
      R => \<const0>\
    );
\gpr1.dout_i_reg[48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(48),
      Q => D(48),
      R => \<const0>\
    );
\gpr1.dout_i_reg[49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(49),
      Q => D(49),
      R => \<const0>\
    );
\gpr1.dout_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(4),
      Q => D(4),
      R => \<const0>\
    );
\gpr1.dout_i_reg[50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(50),
      Q => D(50),
      R => \<const0>\
    );
\gpr1.dout_i_reg[51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(51),
      Q => D(51),
      R => \<const0>\
    );
\gpr1.dout_i_reg[52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(52),
      Q => D(52),
      R => \<const0>\
    );
\gpr1.dout_i_reg[53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(53),
      Q => D(53),
      R => \<const0>\
    );
\gpr1.dout_i_reg[54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(54),
      Q => D(54),
      R => \<const0>\
    );
\gpr1.dout_i_reg[55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(55),
      Q => D(55),
      R => \<const0>\
    );
\gpr1.dout_i_reg[56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(56),
      Q => D(56),
      R => \<const0>\
    );
\gpr1.dout_i_reg[57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(57),
      Q => D(57),
      R => \<const0>\
    );
\gpr1.dout_i_reg[58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(58),
      Q => D(58),
      R => \<const0>\
    );
\gpr1.dout_i_reg[59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(59),
      Q => D(59),
      R => \<const0>\
    );
\gpr1.dout_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(5),
      Q => D(5),
      R => \<const0>\
    );
\gpr1.dout_i_reg[60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(60),
      Q => D(60),
      R => \<const0>\
    );
\gpr1.dout_i_reg[61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(61),
      Q => D(61),
      R => \<const0>\
    );
\gpr1.dout_i_reg[62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(62),
      Q => D(62),
      R => \<const0>\
    );
\gpr1.dout_i_reg[63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(63),
      Q => D(63),
      R => \<const0>\
    );
\gpr1.dout_i_reg[64]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(64),
      Q => D(64),
      R => \<const0>\
    );
\gpr1.dout_i_reg[65]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(65),
      Q => D(65),
      R => \<const0>\
    );
\gpr1.dout_i_reg[66]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(66),
      Q => D(66),
      R => \<const0>\
    );
\gpr1.dout_i_reg[67]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(67),
      Q => D(67),
      R => \<const0>\
    );
\gpr1.dout_i_reg[68]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(68),
      Q => D(68),
      R => \<const0>\
    );
\gpr1.dout_i_reg[69]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(69),
      Q => D(69),
      R => \<const0>\
    );
\gpr1.dout_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(6),
      Q => D(6),
      R => \<const0>\
    );
\gpr1.dout_i_reg[70]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(70),
      Q => D(70),
      R => \<const0>\
    );
\gpr1.dout_i_reg[71]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(71),
      Q => D(71),
      R => \<const0>\
    );
\gpr1.dout_i_reg[72]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(72),
      Q => D(72),
      R => \<const0>\
    );
\gpr1.dout_i_reg[73]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(73),
      Q => D(73),
      R => \<const0>\
    );
\gpr1.dout_i_reg[74]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(74),
      Q => D(74),
      R => \<const0>\
    );
\gpr1.dout_i_reg[75]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(75),
      Q => D(75),
      R => \<const0>\
    );
\gpr1.dout_i_reg[76]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(76),
      Q => D(76),
      R => \<const0>\
    );
\gpr1.dout_i_reg[77]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(77),
      Q => D(77),
      R => \<const0>\
    );
\gpr1.dout_i_reg[78]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(78),
      Q => D(78),
      R => \<const0>\
    );
\gpr1.dout_i_reg[79]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(79),
      Q => D(79),
      R => \<const0>\
    );
\gpr1.dout_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(7),
      Q => D(7),
      R => \<const0>\
    );
\gpr1.dout_i_reg[80]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(80),
      Q => D(80),
      R => \<const0>\
    );
\gpr1.dout_i_reg[81]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(81),
      Q => D(81),
      R => \<const0>\
    );
\gpr1.dout_i_reg[82]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(82),
      Q => D(82),
      R => \<const0>\
    );
\gpr1.dout_i_reg[83]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(83),
      Q => D(83),
      R => \<const0>\
    );
\gpr1.dout_i_reg[84]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(84),
      Q => D(84),
      R => \<const0>\
    );
\gpr1.dout_i_reg[85]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(85),
      Q => D(85),
      R => \<const0>\
    );
\gpr1.dout_i_reg[86]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(86),
      Q => D(86),
      R => \<const0>\
    );
\gpr1.dout_i_reg[87]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(87),
      Q => D(87),
      R => \<const0>\
    );
\gpr1.dout_i_reg[88]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(88),
      Q => D(88),
      R => \<const0>\
    );
\gpr1.dout_i_reg[89]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(89),
      Q => D(89),
      R => \<const0>\
    );
\gpr1.dout_i_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(8),
      Q => D(8),
      R => \<const0>\
    );
\gpr1.dout_i_reg[90]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(90),
      Q => D(90),
      R => \<const0>\
    );
\gpr1.dout_i_reg[91]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(91),
      Q => D(91),
      R => \<const0>\
    );
\gpr1.dout_i_reg[92]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(92),
      Q => D(92),
      R => \<const0>\
    );
\gpr1.dout_i_reg[93]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(93),
      Q => D(93),
      R => \<const0>\
    );
\gpr1.dout_i_reg[94]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(94),
      Q => D(94),
      R => \<const0>\
    );
\gpr1.dout_i_reg[95]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(95),
      Q => D(95),
      R => \<const0>\
    );
\gpr1.dout_i_reg[96]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(96),
      Q => D(96),
      R => \<const0>\
    );
\gpr1.dout_i_reg[97]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(97),
      Q => D(97),
      R => \<const0>\
    );
\gpr1.dout_i_reg[98]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(98),
      Q => D(98),
      R => \<const0>\
    );
\gpr1.dout_i_reg[99]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(99),
      Q => D(99),
      R => \<const0>\
    );
\gpr1.dout_i_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I1,
      D => p_0_out(9),
      Q => D(9),
      R => \<const0>\
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_clock_converter_div2rd_bin_cntr is
  port (
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    D : out STD_LOGIC_VECTOR ( 3 downto 0 );
    I1 : in STD_LOGIC;
    I2 : in STD_LOGIC;
    I3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    I4 : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_aclk : in STD_LOGIC;
    I5 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end axis_clock_converter_div2rd_bin_cntr;

architecture STRUCTURE of axis_clock_converter_div2rd_bin_cntr is
  signal \^o2\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal plusOp : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal rd_pntr_plus1 : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gc0.count[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \gc0.count[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \gc0.count[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \gc0.count[4]_i_1\ : label is "soft_lutpair0";
  attribute counter : integer;
  attribute counter of \gc0.count_reg[0]\ : label is 2;
  attribute counter of \gc0.count_reg[1]\ : label is 2;
  attribute counter of \gc0.count_reg[2]\ : label is 2;
  attribute counter of \gc0.count_reg[3]\ : label is 2;
  attribute counter of \gc0.count_reg[4]\ : label is 2;
  attribute SOFT_HLUTNM of \rd_pntr_gc[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \rd_pntr_gc[2]_i_1\ : label is "soft_lutpair2";
begin
  O2(4 downto 0) <= \^o2\(4 downto 0);
  Q(3 downto 0) <= \^q\(3 downto 0);
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
      INIT => X"6A"
    )
    port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      O => plusOp(2)
    );
\gc0.count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => rd_pntr_plus1(3),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(2),
      O => plusOp(3)
    );
\gc0.count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
    port map (
      I0 => \^q\(3),
      I1 => \^q\(2),
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => rd_pntr_plus1(3),
      O => plusOp(4)
    );
\gc0.count_d1_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => E(0),
      CLR => I5(0),
      D => \^q\(0),
      Q => \^o2\(0)
    );
\gc0.count_d1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => E(0),
      CLR => I5(0),
      D => \^q\(1),
      Q => \^o2\(1)
    );
\gc0.count_d1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => E(0),
      CLR => I5(0),
      D => \^q\(2),
      Q => \^o2\(2)
    );
\gc0.count_d1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => E(0),
      CLR => I5(0),
      D => rd_pntr_plus1(3),
      Q => \^o2\(3)
    );
\gc0.count_d1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => E(0),
      CLR => I5(0),
      D => \^q\(3),
      Q => \^o2\(4)
    );
\gc0.count_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => m_axis_aclk,
      CE => E(0),
      D => plusOp(0),
      PRE => I5(0),
      Q => \^q\(0)
    );
\gc0.count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => E(0),
      CLR => I5(0),
      D => plusOp(1),
      Q => \^q\(1)
    );
\gc0.count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => E(0),
      CLR => I5(0),
      D => plusOp(2),
      Q => \^q\(2)
    );
\gc0.count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => E(0),
      CLR => I5(0),
      D => plusOp(3),
      Q => rd_pntr_plus1(3)
    );
\gc0.count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => E(0),
      CLR => I5(0),
      D => plusOp(4),
      Q => \^q\(3)
    );
ram_empty_fb_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF2010FF20201010"
    )
    port map (
      I0 => rd_pntr_plus1(3),
      I1 => I1,
      I2 => I2,
      I3 => \^o2\(3),
      I4 => I3(0),
      I5 => I4,
      O => O1
    );
\rd_pntr_gc[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \^o2\(1),
      I1 => \^o2\(0),
      O => D(0)
    );
\rd_pntr_gc[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \^o2\(1),
      I1 => \^o2\(2),
      O => D(1)
    );
\rd_pntr_gc[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \^o2\(2),
      I1 => \^o2\(3),
      O => D(2)
    );
\rd_pntr_gc[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \^o2\(3),
      I1 => \^o2\(4),
      O => D(3)
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_clock_converter_div2rd_fwft is
  port (
    O1 : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tvalid : out STD_LOGIC;
    O2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    p_17_out : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC
  );
end axis_clock_converter_div2rd_fwft;

architecture STRUCTURE of axis_clock_converter_div2rd_fwft is
  signal \<const1>\ : STD_LOGIC;
  signal curr_fwft_state : STD_LOGIC_VECTOR ( 0 to 0 );
  signal empty_fwft_fb : STD_LOGIC;
  signal empty_fwft_i : STD_LOGIC;
  signal empty_fwft_i0 : STD_LOGIC;
  signal \n_0_gpregsm1.curr_fwft_state[1]_i_1\ : STD_LOGIC;
  signal next_fwft_state : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ram_valid_fwft : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of empty_fwft_fb_i_1 : label is "soft_lutpair5";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of empty_fwft_fb_reg : label is "no";
  attribute equivalent_register_removal of empty_fwft_i_reg : label is "no";
  attribute SOFT_HLUTNM of \gc0.count_d1[4]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \goreg_dm.dout_i[100]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \gpr1.dout_i[100]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \gpregsm1.curr_fwft_state[0]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \gpregsm1.curr_fwft_state[1]_i_1\ : label is "soft_lutpair4";
  attribute equivalent_register_removal of \gpregsm1.curr_fwft_state_reg[0]\ : label is "no";
  attribute equivalent_register_removal of \gpregsm1.curr_fwft_state_reg[1]\ : label is "no";
begin
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
empty_fwft_fb_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CF08"
    )
    port map (
      I0 => m_axis_tready,
      I1 => curr_fwft_state(0),
      I2 => ram_valid_fwft,
      I3 => empty_fwft_fb,
      O => empty_fwft_i0
    );
empty_fwft_fb_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => m_axis_aclk,
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
      C => m_axis_aclk,
      CE => \<const1>\,
      D => empty_fwft_i0,
      PRE => Q(1),
      Q => empty_fwft_i
    );
\gc0.count_d1[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4555"
    )
    port map (
      I0 => p_17_out,
      I1 => m_axis_tready,
      I2 => curr_fwft_state(0),
      I3 => ram_valid_fwft,
      O => E(0)
    );
\goreg_dm.dout_i[100]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00D0"
    )
    port map (
      I0 => curr_fwft_state(0),
      I1 => m_axis_tready,
      I2 => ram_valid_fwft,
      I3 => Q(0),
      O => O2(0)
    );
\gpr1.dout_i[100]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4555"
    )
    port map (
      I0 => p_17_out,
      I1 => m_axis_tready,
      I2 => curr_fwft_state(0),
      I3 => ram_valid_fwft,
      O => O1
    );
\gpregsm1.curr_fwft_state[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AE"
    )
    port map (
      I0 => ram_valid_fwft,
      I1 => curr_fwft_state(0),
      I2 => m_axis_tready,
      O => next_fwft_state(0)
    );
\gpregsm1.curr_fwft_state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"40FF"
    )
    port map (
      I0 => m_axis_tready,
      I1 => curr_fwft_state(0),
      I2 => ram_valid_fwft,
      I3 => p_17_out,
      O => \n_0_gpregsm1.curr_fwft_state[1]_i_1\
    );
\gpregsm1.curr_fwft_state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
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
      C => m_axis_aclk,
      CE => \<const1>\,
      CLR => Q(1),
      D => \n_0_gpregsm1.curr_fwft_state[1]_i_1\,
      Q => ram_valid_fwft
    );
m_axis_tvalid_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => empty_fwft_i,
      O => m_axis_tvalid
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_clock_converter_div2rd_status_flags_as is
  port (
    p_17_out : out STD_LOGIC;
    I1 : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end axis_clock_converter_div2rd_status_flags_as;

architecture STRUCTURE of axis_clock_converter_div2rd_status_flags_as is
  signal \<const1>\ : STD_LOGIC;
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of ram_empty_fb_i_reg : label is "no";
begin
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
ram_empty_fb_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => m_axis_aclk,
      CE => \<const1>\,
      D => I1,
      PRE => Q(0),
      Q => p_17_out
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_clock_converter_div2reset_blk_ramfifo is
  port (
    rst_full_gen_i : out STD_LOGIC;
    rst_d2 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 2 downto 0 );
    O1 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_aclk : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    I1 : in STD_LOGIC
  );
end axis_clock_converter_div2reset_blk_ramfifo;

architecture STRUCTURE of axis_clock_converter_div2reset_blk_ramfifo is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal inverted_reset : STD_LOGIC;
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
  attribute msgon of \grstd1.grst_full.grst_f.rst_d1_reg\ : label is "false";
  attribute ASYNC_REG of \grstd1.grst_full.grst_f.rst_d2_reg\ : label is true;
  attribute msgon of \grstd1.grst_full.grst_f.rst_d2_reg\ : label is "false";
  attribute ASYNC_REG of \grstd1.grst_full.grst_f.rst_d3_reg\ : label is true;
  attribute msgon of \grstd1.grst_full.grst_f.rst_d3_reg\ : label is "false";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg\ : label is true;
  attribute msgon of \ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg\ : label is "false";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.rd_rst_asreg_d2_reg\ : label is true;
  attribute msgon of \ngwrdrst.grst.g7serrst.rd_rst_asreg_d2_reg\ : label is "false";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.rd_rst_asreg_reg\ : label is true;
  attribute msgon of \ngwrdrst.grst.g7serrst.rd_rst_asreg_reg\ : label is "false";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\ : label is "no";
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\ : label is "no";
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\ : label is "no";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg\ : label is true;
  attribute msgon of \ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg\ : label is "false";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.wr_rst_asreg_d2_reg\ : label is true;
  attribute msgon of \ngwrdrst.grst.g7serrst.wr_rst_asreg_d2_reg\ : label is "false";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.wr_rst_asreg_reg\ : label is true;
  attribute msgon of \ngwrdrst.grst.g7serrst.wr_rst_asreg_reg\ : label is "false";
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\ : label is "no";
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\ : label is "no";
begin
  rst_d2 <= \^rst_d2\;
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
\grstd1.grst_full.grst_f.RST_FULL_GEN_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => I1,
      O => inverted_reset
    );
\grstd1.grst_full.grst_f.RST_FULL_GEN_reg\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      CLR => inverted_reset,
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
      PRE => inverted_reset,
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
      PRE => inverted_reset,
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
      PRE => inverted_reset,
      Q => rst_d3
    );
\ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
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
      C => m_axis_aclk,
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
      C => m_axis_aclk,
      CE => \<const1>\,
      D => \n_0_ngwrdrst.grst.g7serrst.rd_rst_asreg_i_1\,
      PRE => inverted_reset,
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
      C => m_axis_aclk,
      CE => \<const1>\,
      D => \<const0>\,
      PRE => \n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\,
      Q => Q(0)
    );
\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => m_axis_aclk,
      CE => \<const1>\,
      D => \<const0>\,
      PRE => \n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\,
      Q => Q(1)
    );
\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => m_axis_aclk,
      CE => \<const1>\,
      D => \<const0>\,
      PRE => \n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\,
      Q => Q(2)
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
      PRE => inverted_reset,
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
\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => \<const0>\,
      PRE => \n_0_ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1\,
      Q => O1(0)
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
      Q => O1(1)
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_clock_converter_div2synchronizer_ff is
  port (
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 3 downto 0 );
    I1 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axis_aclk : in STD_LOGIC;
    I6 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end axis_clock_converter_div2synchronizer_ff;

architecture STRUCTURE of axis_clock_converter_div2synchronizer_ff is
  signal \<const1>\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \n_0_Q_reg_reg[0]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[1]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[2]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[3]\ : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \Q_reg_reg[0]\ : label is true;
  attribute msgon : string;
  attribute msgon of \Q_reg_reg[0]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[1]\ : label is true;
  attribute msgon of \Q_reg_reg[1]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[2]\ : label is true;
  attribute msgon of \Q_reg_reg[2]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[3]\ : label is true;
  attribute msgon of \Q_reg_reg[3]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[4]\ : label is true;
  attribute msgon of \Q_reg_reg[4]\ : label is "true";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \rd_pntr_bin[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \rd_pntr_bin[1]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \rd_pntr_bin[2]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \rd_pntr_bin[3]_i_1\ : label is "soft_lutpair7";
begin
  Q(0) <= \^q\(0);
\Q_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      CLR => I6(0),
      D => I1(0),
      Q => \n_0_Q_reg_reg[0]\
    );
\Q_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      CLR => I6(0),
      D => I1(1),
      Q => \n_0_Q_reg_reg[1]\
    );
\Q_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      CLR => I6(0),
      D => I1(2),
      Q => \n_0_Q_reg_reg[2]\
    );
\Q_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      CLR => I6(0),
      D => I1(3),
      Q => \n_0_Q_reg_reg[3]\
    );
\Q_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      CLR => I6(0),
      D => I1(4),
      Q => \^q\(0)
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
\rd_pntr_bin[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
    port map (
      I0 => \n_0_Q_reg_reg[2]\,
      I1 => \n_0_Q_reg_reg[3]\,
      I2 => \n_0_Q_reg_reg[0]\,
      I3 => \n_0_Q_reg_reg[1]\,
      I4 => \^q\(0),
      O => D(0)
    );
\rd_pntr_bin[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => \n_0_Q_reg_reg[2]\,
      I1 => \n_0_Q_reg_reg[1]\,
      I2 => \^q\(0),
      I3 => \n_0_Q_reg_reg[3]\,
      O => D(1)
    );
\rd_pntr_bin[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => \n_0_Q_reg_reg[3]\,
      I1 => \n_0_Q_reg_reg[2]\,
      I2 => \^q\(0),
      O => D(2)
    );
\rd_pntr_bin[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \n_0_Q_reg_reg[3]\,
      I1 => \^q\(0),
      O => D(3)
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_clock_converter_div2synchronizer_ff_0 is
  port (
    p_0_in : out STD_LOGIC_VECTOR ( 4 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 4 downto 0 );
    m_axis_aclk : in STD_LOGIC;
    I5 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axis_clock_converter_div2synchronizer_ff_0 : entity is "synchronizer_ff";
end axis_clock_converter_div2synchronizer_ff_0;

architecture STRUCTURE of axis_clock_converter_div2synchronizer_ff_0 is
  signal \<const1>\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[0]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[1]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[2]\ : STD_LOGIC;
  signal \n_0_Q_reg_reg[3]\ : STD_LOGIC;
  signal \^p_0_in\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \Q_reg_reg[0]\ : label is true;
  attribute msgon : string;
  attribute msgon of \Q_reg_reg[0]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[1]\ : label is true;
  attribute msgon of \Q_reg_reg[1]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[2]\ : label is true;
  attribute msgon of \Q_reg_reg[2]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[3]\ : label is true;
  attribute msgon of \Q_reg_reg[3]\ : label is "true";
  attribute ASYNC_REG of \Q_reg_reg[4]\ : label is true;
  attribute msgon of \Q_reg_reg[4]\ : label is "true";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \wr_pntr_bin[0]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \wr_pntr_bin[1]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \wr_pntr_bin[2]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \wr_pntr_bin[3]_i_1\ : label is "soft_lutpair9";
begin
  p_0_in(4 downto 0) <= \^p_0_in\(4 downto 0);
\Q_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => \<const1>\,
      CLR => I5(0),
      D => Q(0),
      Q => \n_0_Q_reg_reg[0]\
    );
\Q_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => \<const1>\,
      CLR => I5(0),
      D => Q(1),
      Q => \n_0_Q_reg_reg[1]\
    );
\Q_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => \<const1>\,
      CLR => I5(0),
      D => Q(2),
      Q => \n_0_Q_reg_reg[2]\
    );
\Q_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => \<const1>\,
      CLR => I5(0),
      D => Q(3),
      Q => \n_0_Q_reg_reg[3]\
    );
\Q_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => \<const1>\,
      CLR => I5(0),
      D => Q(4),
      Q => \^p_0_in\(4)
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
\wr_pntr_bin[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
    port map (
      I0 => \n_0_Q_reg_reg[2]\,
      I1 => \n_0_Q_reg_reg[3]\,
      I2 => \n_0_Q_reg_reg[0]\,
      I3 => \n_0_Q_reg_reg[1]\,
      I4 => \^p_0_in\(4),
      O => \^p_0_in\(0)
    );
\wr_pntr_bin[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      I0 => \n_0_Q_reg_reg[2]\,
      I1 => \n_0_Q_reg_reg[1]\,
      I2 => \^p_0_in\(4),
      I3 => \n_0_Q_reg_reg[3]\,
      O => \^p_0_in\(1)
    );
\wr_pntr_bin[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => \n_0_Q_reg_reg[3]\,
      I1 => \n_0_Q_reg_reg[2]\,
      I2 => \^p_0_in\(4),
      O => \^p_0_in\(2)
    );
\wr_pntr_bin[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \n_0_Q_reg_reg[3]\,
      I1 => \^p_0_in\(4),
      O => \^p_0_in\(3)
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_clock_converter_div2wr_bin_cntr is
  port (
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ram_full_i : out STD_LOGIC;
    O2 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    O1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O5 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I1 : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    p_0_out : in STD_LOGIC;
    I2 : in STD_LOGIC;
    rst_full_gen_i : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_aclk : in STD_LOGIC;
    I3 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end axis_clock_converter_div2wr_bin_cntr;

architecture STRUCTURE of axis_clock_converter_div2wr_bin_cntr is
  signal \^o1\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal n_0_ram_full_fb_i_i_2 : STD_LOGIC;
  signal n_0_ram_full_fb_i_i_4 : STD_LOGIC;
  signal \plusOp__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal wr_pntr_plus1 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal wr_pntr_plus2 : STD_LOGIC_VECTOR ( 4 downto 2 );
  attribute RETAIN_INVERTER : boolean;
  attribute RETAIN_INVERTER of \gic0.gc0.count[0]_i_1\ : label is true;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gic0.gc0.count[0]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \gic0.gc0.count[2]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \gic0.gc0.count[3]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \gic0.gc0.count[4]_i_1\ : label is "soft_lutpair12";
  attribute counter : integer;
  attribute counter of \gic0.gc0.count_reg[0]\ : label is 3;
  attribute counter of \gic0.gc0.count_reg[1]\ : label is 3;
  attribute counter of \gic0.gc0.count_reg[2]\ : label is 3;
  attribute counter of \gic0.gc0.count_reg[3]\ : label is 3;
  attribute counter of \gic0.gc0.count_reg[4]\ : label is 3;
begin
  O1(3 downto 0) <= \^o1\(3 downto 0);
  Q(1 downto 0) <= \^q\(1 downto 0);
\gic0.gc0.count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \^q\(0),
      O => \plusOp__0\(0)
    );
\gic0.gc0.count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \plusOp__0\(1)
    );
\gic0.gc0.count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => wr_pntr_plus2(2),
      O => \plusOp__0\(2)
    );
\gic0.gc0.count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => wr_pntr_plus2(3),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => wr_pntr_plus2(2),
      O => \plusOp__0\(3)
    );
\gic0.gc0.count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
    port map (
      I0 => wr_pntr_plus2(4),
      I1 => wr_pntr_plus2(2),
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => wr_pntr_plus2(3),
      O => \plusOp__0\(4)
    );
\gic0.gc0.count_d1_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      D => \^q\(0),
      PRE => I3(0),
      Q => \^o1\(0)
    );
\gic0.gc0.count_d1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I3(0),
      D => \^q\(1),
      Q => \^o1\(1)
    );
\gic0.gc0.count_d1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I3(0),
      D => wr_pntr_plus2(2),
      Q => \^o1\(2)
    );
\gic0.gc0.count_d1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I3(0),
      D => wr_pntr_plus2(3),
      Q => wr_pntr_plus1(3)
    );
\gic0.gc0.count_d1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I3(0),
      D => wr_pntr_plus2(4),
      Q => \^o1\(3)
    );
\gic0.gc0.count_d2_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I3(0),
      D => \^o1\(0),
      Q => O2(0)
    );
\gic0.gc0.count_d2_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I3(0),
      D => \^o1\(1),
      Q => O2(1)
    );
\gic0.gc0.count_d2_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I3(0),
      D => \^o1\(2),
      Q => O2(2)
    );
\gic0.gc0.count_d2_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I3(0),
      D => wr_pntr_plus1(3),
      Q => O2(3)
    );
\gic0.gc0.count_d2_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I3(0),
      D => \^o1\(3),
      Q => O2(4)
    );
\gic0.gc0.count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I3(0),
      D => \plusOp__0\(0),
      Q => \^q\(0)
    );
\gic0.gc0.count_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      D => \plusOp__0\(1),
      PRE => I3(0),
      Q => \^q\(1)
    );
\gic0.gc0.count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I3(0),
      D => \plusOp__0\(2),
      Q => wr_pntr_plus2(2)
    );
\gic0.gc0.count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I3(0),
      D => \plusOp__0\(3),
      Q => wr_pntr_plus2(3)
    );
\gic0.gc0.count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => E(0),
      CLR => I3(0),
      D => \plusOp__0\(4),
      Q => wr_pntr_plus2(4)
    );
ram_full_fb_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000D55D"
    )
    port map (
      I0 => n_0_ram_full_fb_i_i_2,
      I1 => I2,
      I2 => O5(1),
      I3 => wr_pntr_plus1(3),
      I4 => rst_full_gen_i,
      O => ram_full_i
    );
ram_full_fb_i_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF6FF6"
    )
    port map (
      I0 => wr_pntr_plus2(4),
      I1 => O5(2),
      I2 => wr_pntr_plus2(2),
      I3 => O5(0),
      I4 => n_0_ram_full_fb_i_i_4,
      I5 => I1,
      O => n_0_ram_full_fb_i_i_2
    );
ram_full_fb_i_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF6F"
    )
    port map (
      I0 => O5(1),
      I1 => wr_pntr_plus2(3),
      I2 => s_axis_tvalid,
      I3 => p_0_out,
      O => n_0_ram_full_fb_i_i_4
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_clock_converter_div2wr_status_flags_as is
  port (
    p_0_out : out STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    ram_full_i : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    rst_d2 : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC
  );
end axis_clock_converter_div2wr_status_flags_as;

architecture STRUCTURE of axis_clock_converter_div2wr_status_flags_as is
  signal \<const1>\ : STD_LOGIC;
  signal \^p_0_out\ : STD_LOGIC;
  signal \ram_full_i__0\ : STD_LOGIC;
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of ram_full_fb_i_reg : label is "no";
  attribute equivalent_register_removal of ram_full_i_reg : label is "no";
begin
  p_0_out <= \^p_0_out\;
RAM_reg_0_31_0_5_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_axis_tvalid,
      I1 => \^p_0_out\,
      O => E(0)
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
ram_full_fb_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => ram_full_i,
      PRE => rst_d2,
      Q => \^p_0_out\
    );
ram_full_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      D => ram_full_i,
      PRE => rst_d2,
      Q => \ram_full_i__0\
    );
s_axis_tready_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \ram_full_i__0\,
      O => s_axis_tready
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_clock_converter_div2clk_x_pntrs is
  port (
    O1 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    O2 : out STD_LOGIC;
    O4 : out STD_LOGIC;
    O5 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    O6 : out STD_LOGIC;
    O3 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I2 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I3 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I4 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    m_axis_aclk : in STD_LOGIC;
    I5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_aclk : in STD_LOGIC;
    I6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end axis_clock_converter_div2clk_x_pntrs;

architecture STRUCTURE of axis_clock_converter_div2clk_x_pntrs is
  signal \<const1>\ : STD_LOGIC;
  signal \^o5\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \n_0_gsync_stage[1].wr_stg_inst\ : STD_LOGIC;
  signal n_0_ram_empty_fb_i_i_4 : STD_LOGIC;
  signal n_0_ram_empty_fb_i_i_5 : STD_LOGIC;
  signal n_0_ram_full_fb_i_i_6 : STD_LOGIC;
  signal \n_1_gsync_stage[1].wr_stg_inst\ : STD_LOGIC;
  signal \n_2_gsync_stage[1].wr_stg_inst\ : STD_LOGIC;
  signal \n_3_gsync_stage[1].wr_stg_inst\ : STD_LOGIC;
  signal \n_4_gsync_stage[1].wr_stg_inst\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal p_0_in2_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_0_out : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_1_out : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal rd_pntr_gc : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal wr_pntr_gc : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \wr_pntr_gc[0]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \wr_pntr_gc[1]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \wr_pntr_gc[2]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \wr_pntr_gc[3]_i_1\ : label is "soft_lutpair11";
begin
  O5(2 downto 0) <= \^o5\(2 downto 0);
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
\gsync_stage[1].rd_stg_inst\: entity work.axis_clock_converter_div2synchronizer_ff_0
    port map (
      I5(0) => I5(0),
      Q(4 downto 0) => wr_pntr_gc(4 downto 0),
      m_axis_aclk => m_axis_aclk,
      p_0_in(4 downto 0) => p_0_in(4 downto 0)
    );
\gsync_stage[1].wr_stg_inst\: entity work.axis_clock_converter_div2synchronizer_ff
    port map (
      D(3) => \n_1_gsync_stage[1].wr_stg_inst\,
      D(2) => \n_2_gsync_stage[1].wr_stg_inst\,
      D(1) => \n_3_gsync_stage[1].wr_stg_inst\,
      D(0) => \n_4_gsync_stage[1].wr_stg_inst\,
      I1(4 downto 0) => rd_pntr_gc(4 downto 0),
      I6(0) => I6(0),
      Q(0) => \n_0_gsync_stage[1].wr_stg_inst\,
      s_axis_aclk => s_axis_aclk
    );
ram_empty_fb_i_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF6FF6"
    )
    port map (
      I0 => I1(0),
      I1 => p_1_out(0),
      I2 => I1(1),
      I3 => p_1_out(1),
      I4 => n_0_ram_empty_fb_i_i_4,
      O => O2
    );
ram_empty_fb_i_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00009009"
    )
    port map (
      I0 => O3(1),
      I1 => p_1_out(1),
      I2 => O3(0),
      I3 => p_1_out(0),
      I4 => n_0_ram_empty_fb_i_i_5,
      O => O1
    );
ram_empty_fb_i_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
    port map (
      I0 => p_1_out(2),
      I1 => I1(2),
      I2 => p_1_out(4),
      I3 => I1(3),
      O => n_0_ram_empty_fb_i_i_4
    );
ram_empty_fb_i_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
    port map (
      I0 => p_1_out(2),
      I1 => O3(2),
      I2 => p_1_out(4),
      I3 => O3(3),
      O => n_0_ram_empty_fb_i_i_5
    );
ram_full_fb_i_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00009009"
    )
    port map (
      I0 => I3(0),
      I1 => p_0_out(0),
      I2 => I3(1),
      I3 => p_0_out(1),
      I4 => n_0_ram_full_fb_i_i_6,
      O => O6
    );
ram_full_fb_i_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
    port map (
      I0 => p_0_out(1),
      I1 => I2(1),
      I2 => p_0_out(0),
      I3 => I2(0),
      O => O4
    );
ram_full_fb_i_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
    port map (
      I0 => \^o5\(0),
      I1 => I3(2),
      I2 => \^o5\(2),
      I3 => I3(3),
      O => n_0_ram_full_fb_i_i_6
    );
\rd_pntr_bin_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      CLR => I6(0),
      D => \n_4_gsync_stage[1].wr_stg_inst\,
      Q => p_0_out(0)
    );
\rd_pntr_bin_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      CLR => I6(0),
      D => \n_3_gsync_stage[1].wr_stg_inst\,
      Q => p_0_out(1)
    );
\rd_pntr_bin_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      CLR => I6(0),
      D => \n_2_gsync_stage[1].wr_stg_inst\,
      Q => \^o5\(0)
    );
\rd_pntr_bin_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      CLR => I6(0),
      D => \n_1_gsync_stage[1].wr_stg_inst\,
      Q => \^o5\(1)
    );
\rd_pntr_bin_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      CLR => I6(0),
      D => \n_0_gsync_stage[1].wr_stg_inst\,
      Q => \^o5\(2)
    );
\rd_pntr_gc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => \<const1>\,
      CLR => I5(0),
      D => D(0),
      Q => rd_pntr_gc(0)
    );
\rd_pntr_gc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => \<const1>\,
      CLR => I5(0),
      D => D(1),
      Q => rd_pntr_gc(1)
    );
\rd_pntr_gc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => \<const1>\,
      CLR => I5(0),
      D => D(2),
      Q => rd_pntr_gc(2)
    );
\rd_pntr_gc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => \<const1>\,
      CLR => I5(0),
      D => D(3),
      Q => rd_pntr_gc(3)
    );
\rd_pntr_gc_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => \<const1>\,
      CLR => I5(0),
      D => O3(3),
      Q => rd_pntr_gc(4)
    );
\wr_pntr_bin_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => \<const1>\,
      CLR => I5(0),
      D => p_0_in(0),
      Q => p_1_out(0)
    );
\wr_pntr_bin_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => \<const1>\,
      CLR => I5(0),
      D => p_0_in(1),
      Q => p_1_out(1)
    );
\wr_pntr_bin_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => \<const1>\,
      CLR => I5(0),
      D => p_0_in(2),
      Q => p_1_out(2)
    );
\wr_pntr_bin_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => \<const1>\,
      CLR => I5(0),
      D => p_0_in(3),
      Q => Q(0)
    );
\wr_pntr_bin_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => \<const1>\,
      CLR => I5(0),
      D => p_0_in(4),
      Q => p_1_out(4)
    );
\wr_pntr_gc[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => I4(0),
      I1 => I4(1),
      O => p_0_in2_out(0)
    );
\wr_pntr_gc[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => I4(1),
      I1 => I4(2),
      O => p_0_in2_out(1)
    );
\wr_pntr_gc[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => I4(2),
      I1 => I4(3),
      O => p_0_in2_out(2)
    );
\wr_pntr_gc[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => I4(3),
      I1 => I4(4),
      O => p_0_in2_out(3)
    );
\wr_pntr_gc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      CLR => I6(0),
      D => p_0_in2_out(0),
      Q => wr_pntr_gc(0)
    );
\wr_pntr_gc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      CLR => I6(0),
      D => p_0_in2_out(1),
      Q => wr_pntr_gc(1)
    );
\wr_pntr_gc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      CLR => I6(0),
      D => p_0_in2_out(2),
      Q => wr_pntr_gc(2)
    );
\wr_pntr_gc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      CLR => I6(0),
      D => p_0_in2_out(3),
      Q => wr_pntr_gc(3)
    );
\wr_pntr_gc_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_axis_aclk,
      CE => \<const1>\,
      CLR => I6(0),
      D => I4(4),
      Q => wr_pntr_gc(4)
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_clock_converter_div2memory is
  port (
    O1 : out STD_LOGIC_VECTOR ( 100 downto 0 );
    I1 : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    DI : in STD_LOGIC_VECTOR ( 100 downto 0 );
    s_axis_aclk : in STD_LOGIC;
    O3 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 4 downto 0 );
    I2 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end axis_clock_converter_div2memory;

architecture STRUCTURE of axis_clock_converter_div2memory is
  signal \<const0>\ : STD_LOGIC;
  signal p_0_out : STD_LOGIC_VECTOR ( 100 downto 0 );
begin
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
\gdm.dm\: entity work.axis_clock_converter_div2dmem
    port map (
      D(100 downto 0) => p_0_out(100 downto 0),
      DI(100 downto 0) => DI(100 downto 0),
      E(0) => E(0),
      I1 => I1,
      O3(4 downto 0) => O3(4 downto 0),
      Q(4 downto 0) => Q(4 downto 0),
      m_axis_aclk => m_axis_aclk,
      s_axis_aclk => s_axis_aclk
    );
\goreg_dm.dout_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(0),
      Q => O1(0),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[100]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(100),
      Q => O1(100),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(10),
      Q => O1(10),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(11),
      Q => O1(11),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(12),
      Q => O1(12),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(13),
      Q => O1(13),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(14),
      Q => O1(14),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(15),
      Q => O1(15),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(16),
      Q => O1(16),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(17),
      Q => O1(17),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(18),
      Q => O1(18),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(19),
      Q => O1(19),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(1),
      Q => O1(1),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(20),
      Q => O1(20),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(21),
      Q => O1(21),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(22),
      Q => O1(22),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(23),
      Q => O1(23),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(24),
      Q => O1(24),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(25),
      Q => O1(25),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(26),
      Q => O1(26),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(27),
      Q => O1(27),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(28),
      Q => O1(28),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(29),
      Q => O1(29),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(2),
      Q => O1(2),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(30),
      Q => O1(30),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(31),
      Q => O1(31),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(32),
      Q => O1(32),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(33),
      Q => O1(33),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(34),
      Q => O1(34),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(35),
      Q => O1(35),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(36),
      Q => O1(36),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(37),
      Q => O1(37),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(38),
      Q => O1(38),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(39),
      Q => O1(39),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(3),
      Q => O1(3),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(40),
      Q => O1(40),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(41),
      Q => O1(41),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(42),
      Q => O1(42),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(43),
      Q => O1(43),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(44),
      Q => O1(44),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(45),
      Q => O1(45),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(46),
      Q => O1(46),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(47),
      Q => O1(47),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(48),
      Q => O1(48),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(49),
      Q => O1(49),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(4),
      Q => O1(4),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(50),
      Q => O1(50),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(51),
      Q => O1(51),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(52),
      Q => O1(52),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(53),
      Q => O1(53),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(54),
      Q => O1(54),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(55),
      Q => O1(55),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(56),
      Q => O1(56),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(57),
      Q => O1(57),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(58),
      Q => O1(58),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(59),
      Q => O1(59),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(5),
      Q => O1(5),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(60),
      Q => O1(60),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(61),
      Q => O1(61),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(62),
      Q => O1(62),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(63),
      Q => O1(63),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[64]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(64),
      Q => O1(64),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[65]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(65),
      Q => O1(65),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[66]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(66),
      Q => O1(66),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[67]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(67),
      Q => O1(67),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[68]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(68),
      Q => O1(68),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[69]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(69),
      Q => O1(69),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(6),
      Q => O1(6),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[70]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(70),
      Q => O1(70),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[71]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(71),
      Q => O1(71),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[72]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(72),
      Q => O1(72),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[73]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(73),
      Q => O1(73),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[74]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(74),
      Q => O1(74),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[75]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(75),
      Q => O1(75),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[76]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(76),
      Q => O1(76),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[77]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(77),
      Q => O1(77),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[78]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(78),
      Q => O1(78),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[79]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(79),
      Q => O1(79),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(7),
      Q => O1(7),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[80]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(80),
      Q => O1(80),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[81]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(81),
      Q => O1(81),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[82]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(82),
      Q => O1(82),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[83]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(83),
      Q => O1(83),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[84]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(84),
      Q => O1(84),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[85]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(85),
      Q => O1(85),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[86]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(86),
      Q => O1(86),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[87]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(87),
      Q => O1(87),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[88]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(88),
      Q => O1(88),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[89]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(89),
      Q => O1(89),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(8),
      Q => O1(8),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[90]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(90),
      Q => O1(90),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[91]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(91),
      Q => O1(91),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[92]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(92),
      Q => O1(92),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[93]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(93),
      Q => O1(93),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[94]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(94),
      Q => O1(94),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[95]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(95),
      Q => O1(95),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[96]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(96),
      Q => O1(96),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[97]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(97),
      Q => O1(97),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[98]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(98),
      Q => O1(98),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[99]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(99),
      Q => O1(99),
      R => \<const0>\
    );
\goreg_dm.dout_i_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => m_axis_aclk,
      CE => I2(0),
      D => p_0_out(9),
      Q => O1(9),
      R => \<const0>\
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_clock_converter_div2rd_logic is
  port (
    O1 : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    O2 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    O3 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    D : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tready : in STD_LOGIC;
    I1 : in STD_LOGIC;
    I2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    I3 : in STD_LOGIC
  );
end axis_clock_converter_div2rd_logic;

architecture STRUCTURE of axis_clock_converter_div2rd_logic is
  signal \^o1\ : STD_LOGIC;
  signal \n_1_gr1.rfwft\ : STD_LOGIC;
  signal n_4_rpntr : STD_LOGIC;
  signal p_17_out : STD_LOGIC;
begin
  O1 <= \^o1\;
\gr1.rfwft\: entity work.axis_clock_converter_div2rd_fwft
    port map (
      E(0) => \n_1_gr1.rfwft\,
      O1 => \^o1\,
      O2(0) => E(0),
      Q(1 downto 0) => Q(1 downto 0),
      m_axis_aclk => m_axis_aclk,
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => m_axis_tvalid,
      p_17_out => p_17_out
    );
\gras.rsts\: entity work.axis_clock_converter_div2rd_status_flags_as
    port map (
      I1 => n_4_rpntr,
      Q(0) => Q(1),
      m_axis_aclk => m_axis_aclk,
      p_17_out => p_17_out
    );
rpntr: entity work.axis_clock_converter_div2rd_bin_cntr
    port map (
      D(3 downto 0) => D(3 downto 0),
      E(0) => \n_1_gr1.rfwft\,
      I1 => I1,
      I2 => \^o1\,
      I3(0) => I2(0),
      I4 => I3,
      I5(0) => Q(1),
      O1 => n_4_rpntr,
      O2(4 downto 0) => O3(4 downto 0),
      Q(3 downto 0) => O2(3 downto 0),
      m_axis_aclk => m_axis_aclk
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_clock_converter_div2wr_logic is
  port (
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_tready : out STD_LOGIC;
    O1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    O2 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axis_aclk : in STD_LOGIC;
    rst_d2 : in STD_LOGIC;
    O5 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I1 : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    I2 : in STD_LOGIC;
    rst_full_gen_i : in STD_LOGIC;
    I3 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end axis_clock_converter_div2wr_logic;

architecture STRUCTURE of axis_clock_converter_div2wr_logic is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal p_0_out : STD_LOGIC;
  signal ram_full_i : STD_LOGIC;
begin
  E(0) <= \^e\(0);
\gwas.wsts\: entity work.axis_clock_converter_div2wr_status_flags_as
    port map (
      E(0) => \^e\(0),
      p_0_out => p_0_out,
      ram_full_i => ram_full_i,
      rst_d2 => rst_d2,
      s_axis_aclk => s_axis_aclk,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid
    );
wpntr: entity work.axis_clock_converter_div2wr_bin_cntr
    port map (
      E(0) => \^e\(0),
      I1 => I1,
      I2 => I2,
      I3(0) => I3(0),
      O1(3 downto 0) => O1(3 downto 0),
      O2(4 downto 0) => O2(4 downto 0),
      O5(2 downto 0) => O5(2 downto 0),
      Q(1 downto 0) => Q(1 downto 0),
      p_0_out => p_0_out,
      ram_full_i => ram_full_i,
      rst_full_gen_i => rst_full_gen_i,
      s_axis_aclk => s_axis_aclk,
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_clock_converter_div2fifo_generator_ramfifo is
  port (
    s_axis_tready : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 100 downto 0 );
    s_axis_aclk : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    I1 : in STD_LOGIC;
    DI : in STD_LOGIC_VECTOR ( 100 downto 0 )
  );
end axis_clock_converter_div2fifo_generator_ramfifo;

architecture STRUCTURE of axis_clock_converter_div2fifo_generator_ramfifo is
  signal RD_RST : STD_LOGIC;
  signal RST : STD_LOGIC;
  signal \n_0_gntv_or_sync_fifo.gcx.clkx\ : STD_LOGIC;
  signal \n_0_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_12_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_13_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_14_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_15_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_2_gntv_or_sync_fifo.gcx.clkx\ : STD_LOGIC;
  signal n_2_rstblk : STD_LOGIC;
  signal \n_3_gntv_or_sync_fifo.gcx.clkx\ : STD_LOGIC;
  signal \n_6_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal n_6_rstblk : STD_LOGIC;
  signal \n_7_gntv_or_sync_fifo.gcx.clkx\ : STD_LOGIC;
  signal p_0_out : STD_LOGIC_VECTOR ( 4 downto 2 );
  signal p_19_out : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal p_1_out : STD_LOGIC_VECTOR ( 3 to 3 );
  signal p_3_out : STD_LOGIC;
  signal p_8_out : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal rd_pntr_plus1 : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal rd_rst_i : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rst_d2 : STD_LOGIC;
  signal rst_full_gen_i : STD_LOGIC;
  signal wr_pntr_plus1 : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal wr_pntr_plus2 : STD_LOGIC_VECTOR ( 1 downto 0 );
begin
\gntv_or_sync_fifo.gcx.clkx\: entity work.axis_clock_converter_div2clk_x_pntrs
    port map (
      D(3) => \n_12_gntv_or_sync_fifo.gl0.rd\,
      D(2) => \n_13_gntv_or_sync_fifo.gl0.rd\,
      D(1) => \n_14_gntv_or_sync_fifo.gl0.rd\,
      D(0) => \n_15_gntv_or_sync_fifo.gl0.rd\,
      I1(3) => rd_pntr_plus1(4),
      I1(2 downto 0) => rd_pntr_plus1(2 downto 0),
      I2(1 downto 0) => wr_pntr_plus2(1 downto 0),
      I3(3) => wr_pntr_plus1(4),
      I3(2 downto 0) => wr_pntr_plus1(2 downto 0),
      I4(4 downto 0) => p_8_out(4 downto 0),
      I5(0) => RD_RST,
      I6(0) => n_6_rstblk,
      O1 => \n_0_gntv_or_sync_fifo.gcx.clkx\,
      O2 => \n_2_gntv_or_sync_fifo.gcx.clkx\,
      O3(3) => p_19_out(4),
      O3(2 downto 0) => p_19_out(2 downto 0),
      O4 => \n_3_gntv_or_sync_fifo.gcx.clkx\,
      O5(2 downto 0) => p_0_out(4 downto 2),
      O6 => \n_7_gntv_or_sync_fifo.gcx.clkx\,
      Q(0) => p_1_out(3),
      m_axis_aclk => m_axis_aclk,
      s_axis_aclk => s_axis_aclk
    );
\gntv_or_sync_fifo.gl0.rd\: entity work.axis_clock_converter_div2rd_logic
    port map (
      D(3) => \n_12_gntv_or_sync_fifo.gl0.rd\,
      D(2) => \n_13_gntv_or_sync_fifo.gl0.rd\,
      D(1) => \n_14_gntv_or_sync_fifo.gl0.rd\,
      D(0) => \n_15_gntv_or_sync_fifo.gl0.rd\,
      E(0) => \n_6_gntv_or_sync_fifo.gl0.rd\,
      I1 => \n_2_gntv_or_sync_fifo.gcx.clkx\,
      I2(0) => p_1_out(3),
      I3 => \n_0_gntv_or_sync_fifo.gcx.clkx\,
      O1 => \n_0_gntv_or_sync_fifo.gl0.rd\,
      O2(3) => rd_pntr_plus1(4),
      O2(2 downto 0) => rd_pntr_plus1(2 downto 0),
      O3(4 downto 0) => p_19_out(4 downto 0),
      Q(1) => n_2_rstblk,
      Q(0) => rd_rst_i(0),
      m_axis_aclk => m_axis_aclk,
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => m_axis_tvalid
    );
\gntv_or_sync_fifo.gl0.wr\: entity work.axis_clock_converter_div2wr_logic
    port map (
      E(0) => p_3_out,
      I1 => \n_3_gntv_or_sync_fifo.gcx.clkx\,
      I2 => \n_7_gntv_or_sync_fifo.gcx.clkx\,
      I3(0) => RST,
      O1(3) => wr_pntr_plus1(4),
      O1(2 downto 0) => wr_pntr_plus1(2 downto 0),
      O2(4 downto 0) => p_8_out(4 downto 0),
      O5(2 downto 0) => p_0_out(4 downto 2),
      Q(1 downto 0) => wr_pntr_plus2(1 downto 0),
      rst_d2 => rst_d2,
      rst_full_gen_i => rst_full_gen_i,
      s_axis_aclk => s_axis_aclk,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid
    );
\gntv_or_sync_fifo.mem\: entity work.axis_clock_converter_div2memory
    port map (
      DI(100 downto 0) => DI(100 downto 0),
      E(0) => p_3_out,
      I1 => \n_0_gntv_or_sync_fifo.gl0.rd\,
      I2(0) => \n_6_gntv_or_sync_fifo.gl0.rd\,
      O1(100 downto 0) => Q(100 downto 0),
      O3(4 downto 0) => p_19_out(4 downto 0),
      Q(4 downto 0) => p_8_out(4 downto 0),
      m_axis_aclk => m_axis_aclk,
      s_axis_aclk => s_axis_aclk
    );
rstblk: entity work.axis_clock_converter_div2reset_blk_ramfifo
    port map (
      I1 => I1,
      O1(1) => RST,
      O1(0) => n_6_rstblk,
      Q(2) => n_2_rstblk,
      Q(1) => RD_RST,
      Q(0) => rd_rst_i(0),
      m_axis_aclk => m_axis_aclk,
      rst_d2 => rst_d2,
      rst_full_gen_i => rst_full_gen_i,
      s_axis_aclk => s_axis_aclk
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_clock_converter_div2fifo_generator_top is
  port (
    s_axis_tready : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 100 downto 0 );
    s_axis_aclk : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    I1 : in STD_LOGIC;
    DI : in STD_LOGIC_VECTOR ( 100 downto 0 )
  );
end axis_clock_converter_div2fifo_generator_top;

architecture STRUCTURE of axis_clock_converter_div2fifo_generator_top is
begin
\grf.rf\: entity work.axis_clock_converter_div2fifo_generator_ramfifo
    port map (
      DI(100 downto 0) => DI(100 downto 0),
      I1 => I1,
      Q(100 downto 0) => Q(100 downto 0),
      m_axis_aclk => m_axis_aclk,
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => m_axis_tvalid,
      s_axis_aclk => s_axis_aclk,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_clock_converter_div2fifo_generator_v11_0_synth is
  port (
    s_axis_tready : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 100 downto 0 );
    s_axis_aclk : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    I1 : in STD_LOGIC;
    DI : in STD_LOGIC_VECTOR ( 100 downto 0 )
  );
end axis_clock_converter_div2fifo_generator_v11_0_synth;

architecture STRUCTURE of axis_clock_converter_div2fifo_generator_v11_0_synth is
begin
\gaxis_fifo.gaxisf.axisf\: entity work.axis_clock_converter_div2fifo_generator_top
    port map (
      DI(100 downto 0) => DI(100 downto 0),
      I1 => I1,
      Q(100 downto 0) => Q(100 downto 0),
      m_axis_aclk => m_axis_aclk,
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => m_axis_tvalid,
      s_axis_aclk => s_axis_aclk,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_clock_converter_div2fifo_generator_v11_0 is
  port (
    s_axis_tready : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 100 downto 0 );
    s_axis_aclk : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    I1 : in STD_LOGIC;
    DI : in STD_LOGIC_VECTOR ( 100 downto 0 )
  );
end axis_clock_converter_div2fifo_generator_v11_0;

architecture STRUCTURE of axis_clock_converter_div2fifo_generator_v11_0 is
begin
inst_fifo_gen: entity work.axis_clock_converter_div2fifo_generator_v11_0_synth
    port map (
      DI(100 downto 0) => DI(100 downto 0),
      I1 => I1,
      Q(100 downto 0) => Q(100 downto 0),
      m_axis_aclk => m_axis_aclk,
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => m_axis_tvalid,
      s_axis_aclk => s_axis_aclk,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_clock_converter_div2axis_data_fifo_v1_1_axis_data_fifo is
  port (
    Q : out STD_LOGIC_VECTOR ( 100 downto 0 );
    s_axis_tready : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    DI : in STD_LOGIC_VECTOR ( 100 downto 0 );
    s_axis_aclk : in STD_LOGIC;
    s_axis_aresetn : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC
  );
end axis_clock_converter_div2axis_data_fifo_v1_1_axis_data_fifo;

architecture STRUCTURE of axis_clock_converter_div2axis_data_fifo_v1_1_axis_data_fifo is
  signal s_and_m_aresetn_i : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of s_and_m_aresetn_i : signal is "true";
begin
\gen_async_clock_and_reset.inst_clock_synchronizer\: entity work.axis_clock_converter_div2axis_infrastructure_v1_1_clock_synchronizer
    port map (
      m_axis_aresetn => m_axis_aresetn,
      s_aresetn_synch => s_and_m_aresetn_i,
      s_axis_aclk => s_axis_aclk,
      s_axis_aresetn => s_axis_aresetn
    );
\gen_fifo_generator.fifo_generator_inst\: entity work.axis_clock_converter_div2fifo_generator_v11_0
    port map (
      DI(100 downto 0) => DI(100 downto 0),
      I1 => s_and_m_aresetn_i,
      Q(100 downto 0) => Q(100 downto 0),
      m_axis_aclk => m_axis_aclk,
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => m_axis_tvalid,
      s_axis_aclk => s_axis_aclk,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter is
  port (
    s_axis_aresetn : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC;
    s_axis_aclken : in STD_LOGIC;
    m_axis_aclken : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_aclk : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is "yes";
  attribute C_FAMILY : string;
  attribute C_FAMILY of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is "kintex7";
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 64;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 1;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 3;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 16;
  attribute C_AXIS_SIGNAL_SET : string;
  attribute C_AXIS_SIGNAL_SET of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is "32'b00000000000000000000000011111111";
  attribute C_IS_ACLK_ASYNC : integer;
  attribute C_IS_ACLK_ASYNC of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 1;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 1;
  attribute C_S_AXIS_ACLK_RATIO : integer;
  attribute C_S_AXIS_ACLK_RATIO of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 1;
  attribute C_M_AXIS_ACLK_RATIO : integer;
  attribute C_M_AXIS_ACLK_RATIO of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 2;
  attribute C_ACLKEN_CONV_MODE : integer;
  attribute C_ACLKEN_CONV_MODE of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 0;
  attribute G_INDX_SS_TREADY : integer;
  attribute G_INDX_SS_TREADY of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 0;
  attribute G_INDX_SS_TDATA : integer;
  attribute G_INDX_SS_TDATA of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 1;
  attribute G_INDX_SS_TSTRB : integer;
  attribute G_INDX_SS_TSTRB of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 2;
  attribute G_INDX_SS_TKEEP : integer;
  attribute G_INDX_SS_TKEEP of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 3;
  attribute G_INDX_SS_TLAST : integer;
  attribute G_INDX_SS_TLAST of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 4;
  attribute G_INDX_SS_TID : integer;
  attribute G_INDX_SS_TID of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 5;
  attribute G_INDX_SS_TDEST : integer;
  attribute G_INDX_SS_TDEST of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 6;
  attribute G_INDX_SS_TUSER : integer;
  attribute G_INDX_SS_TUSER of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 7;
  attribute G_MASK_SS_TREADY : integer;
  attribute G_MASK_SS_TREADY of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 1;
  attribute G_MASK_SS_TDATA : integer;
  attribute G_MASK_SS_TDATA of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 2;
  attribute G_MASK_SS_TSTRB : integer;
  attribute G_MASK_SS_TSTRB of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 4;
  attribute G_MASK_SS_TKEEP : integer;
  attribute G_MASK_SS_TKEEP of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 8;
  attribute G_MASK_SS_TLAST : integer;
  attribute G_MASK_SS_TLAST of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 16;
  attribute G_MASK_SS_TID : integer;
  attribute G_MASK_SS_TID of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 32;
  attribute G_MASK_SS_TDEST : integer;
  attribute G_MASK_SS_TDEST of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 64;
  attribute G_MASK_SS_TUSER : integer;
  attribute G_MASK_SS_TUSER of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 128;
  attribute G_TASK_SEVERITY_ERR : integer;
  attribute G_TASK_SEVERITY_ERR of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 2;
  attribute G_TASK_SEVERITY_WARNING : integer;
  attribute G_TASK_SEVERITY_WARNING of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 1;
  attribute G_TASK_SEVERITY_INFO : integer;
  attribute G_TASK_SEVERITY_INFO of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 0;
  attribute LP_S_ACLKEN_CAN_TOGGLE : integer;
  attribute LP_S_ACLKEN_CAN_TOGGLE of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 0;
  attribute LP_M_ACLKEN_CAN_TOGGLE : integer;
  attribute LP_M_ACLKEN_CAN_TOGGLE of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 0;
  attribute P_FIFO_MODE : integer;
  attribute P_FIFO_MODE of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 1;
  attribute P_FIFO_DEPTH : integer;
  attribute P_FIFO_DEPTH of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 32;
  attribute P_S_AXIS_ACLK_RATIO : integer;
  attribute P_S_AXIS_ACLK_RATIO of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 1;
  attribute P_M_AXIS_ACLK_RATIO : integer;
  attribute P_M_AXIS_ACLK_RATIO of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 2;
  attribute P_INST_FIFO_GEN : integer;
  attribute P_INST_FIFO_GEN of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 1;
  attribute P_TPAYLOAD_WIDTH : integer;
  attribute P_TPAYLOAD_WIDTH of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 101;
  attribute P_SAMPLE_CYCLE_RATIO : integer;
  attribute P_SAMPLE_CYCLE_RATIO of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter : entity is 2;
end axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter;

architecture STRUCTURE of axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter is
begin
\gen_fifo_gen_ck_conv.axis_data_fifo_0\: entity work.axis_clock_converter_div2axis_data_fifo_v1_1_axis_data_fifo
    port map (
      DI(100 downto 37) => s_axis_tdata(63 downto 0),
      DI(36 downto 29) => s_axis_tstrb(7 downto 0),
      DI(28 downto 21) => s_axis_tkeep(7 downto 0),
      DI(20) => s_axis_tid(0),
      DI(19 downto 17) => s_axis_tdest(2 downto 0),
      DI(16 downto 1) => s_axis_tuser(15 downto 0),
      DI(0) => s_axis_tlast,
      Q(100 downto 37) => m_axis_tdata(63 downto 0),
      Q(36 downto 29) => m_axis_tstrb(7 downto 0),
      Q(28 downto 21) => m_axis_tkeep(7 downto 0),
      Q(20) => m_axis_tid(0),
      Q(19 downto 17) => m_axis_tdest(2 downto 0),
      Q(16 downto 1) => m_axis_tuser(15 downto 0),
      Q(0) => m_axis_tlast,
      m_axis_aclk => m_axis_aclk,
      m_axis_aresetn => m_axis_aresetn,
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => m_axis_tvalid,
      s_axis_aclk => s_axis_aclk,
      s_axis_aresetn => s_axis_aresetn,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VCOMPONENTS.ALL; 
entity axis_clock_converter_div2 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_aclk : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of axis_clock_converter_div2 : entity is true;
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of axis_clock_converter_div2 : entity is "axis_clock_converter_v1_1_axis_clock_converter,Vivado 2013.4";
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of axis_clock_converter_div2 : entity is "axis_clock_converter_div2,axis_clock_converter_v1_1_axis_clock_converter,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of axis_clock_converter_div2 : entity is "axis_clock_converter_div2,axis_clock_converter_v1_1_axis_clock_converter,{x_ipProduct=Vivado 2013.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=axis_clock_converter,x_ipVersion=1.1,x_ipCoreRevision=1,x_ipLanguage=VHDL,C_FAMILY=kintex7,C_AXIS_TDATA_WIDTH=64,C_AXIS_TID_WIDTH=1,C_AXIS_TDEST_WIDTH=3,C_AXIS_TUSER_WIDTH=16,C_AXIS_SIGNAL_SET=0b11111111,C_IS_ACLK_ASYNC=1,C_SYNCHRONIZER_STAGE=1,C_S_AXIS_ACLK_RATIO=1,C_M_AXIS_ACLK_RATIO=2,C_ACLKEN_CONV_MODE=0}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of axis_clock_converter_div2 : entity is "yes";
end axis_clock_converter_div2;

architecture STRUCTURE of axis_clock_converter_div2 is
  signal \<const1>\ : STD_LOGIC;
  attribute C_ACLKEN_CONV_MODE : integer;
  attribute C_ACLKEN_CONV_MODE of inst : label is 0;
  attribute C_AXIS_SIGNAL_SET : string;
  attribute C_AXIS_SIGNAL_SET of inst : label is "32'b00000000000000000000000011111111";
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of inst : label is 64;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of inst : label is 3;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of inst : label is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of inst : label is 16;
  attribute C_FAMILY : string;
  attribute C_FAMILY of inst : label is "kintex7";
  attribute C_IS_ACLK_ASYNC : integer;
  attribute C_IS_ACLK_ASYNC of inst : label is 1;
  attribute C_M_AXIS_ACLK_RATIO : integer;
  attribute C_M_AXIS_ACLK_RATIO of inst : label is 2;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of inst : label is 1;
  attribute C_S_AXIS_ACLK_RATIO : integer;
  attribute C_S_AXIS_ACLK_RATIO of inst : label is 1;
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
  attribute P_INST_FIFO_GEN of inst : label is 1;
  attribute P_M_AXIS_ACLK_RATIO : integer;
  attribute P_M_AXIS_ACLK_RATIO of inst : label is 2;
  attribute P_SAMPLE_CYCLE_RATIO : integer;
  attribute P_SAMPLE_CYCLE_RATIO of inst : label is 2;
  attribute P_S_AXIS_ACLK_RATIO : integer;
  attribute P_S_AXIS_ACLK_RATIO of inst : label is 1;
  attribute P_TPAYLOAD_WIDTH : integer;
  attribute P_TPAYLOAD_WIDTH of inst : label is 101;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of inst : label is "xilinx.com:interface:axis:1.0 S_AXIS TREADY";
begin
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
inst: entity work.axis_clock_converter_div2axis_clock_converter_v1_1_axis_clock_converter
    port map (
      m_axis_aclk => m_axis_aclk,
      m_axis_aclken => \<const1>\,
      m_axis_aresetn => m_axis_aresetn,
      m_axis_tdata(63 downto 0) => m_axis_tdata(63 downto 0),
      m_axis_tdest(2 downto 0) => m_axis_tdest(2 downto 0),
      m_axis_tid(0) => m_axis_tid(0),
      m_axis_tkeep(7 downto 0) => m_axis_tkeep(7 downto 0),
      m_axis_tlast => m_axis_tlast,
      m_axis_tready => m_axis_tready,
      m_axis_tstrb(7 downto 0) => m_axis_tstrb(7 downto 0),
      m_axis_tuser(15 downto 0) => m_axis_tuser(15 downto 0),
      m_axis_tvalid => m_axis_tvalid,
      s_axis_aclk => s_axis_aclk,
      s_axis_aclken => \<const1>\,
      s_axis_aresetn => s_axis_aresetn,
      s_axis_tdata(63 downto 0) => s_axis_tdata(63 downto 0),
      s_axis_tdest(2 downto 0) => s_axis_tdest(2 downto 0),
      s_axis_tid(0) => s_axis_tid(0),
      s_axis_tkeep(7 downto 0) => s_axis_tkeep(7 downto 0),
      s_axis_tlast => s_axis_tlast,
      s_axis_tready => s_axis_tready,
      s_axis_tstrb(7 downto 0) => s_axis_tstrb(7 downto 0),
      s_axis_tuser(15 downto 0) => s_axis_tuser(15 downto 0),
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
