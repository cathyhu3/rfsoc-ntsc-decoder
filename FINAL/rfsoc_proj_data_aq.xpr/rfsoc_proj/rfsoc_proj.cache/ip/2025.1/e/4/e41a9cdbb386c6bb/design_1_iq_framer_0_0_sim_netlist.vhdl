-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
-- Date        : Mon Nov 17 20:23:06 2025
-- Host        : eecs-digital-42 running 64-bit Ubuntu 24.04.3 LTS
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_iq_framer_0_0_sim_netlist.vhdl
-- Design      : design_1_iq_framer_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu48dr-ffvg1517-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_iq_framer is
  port (
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 18 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    control : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s01_axis_tdata : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axis_aresetn : in STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_iq_framer;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_iq_framer is
  signal count : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal count0 : STD_LOGIC;
  signal \count0_inferred__0/i__carry__0_n_0\ : STD_LOGIC;
  signal \count0_inferred__0/i__carry__0_n_1\ : STD_LOGIC;
  signal \count0_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \count0_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \count0_inferred__0/i__carry__0_n_4\ : STD_LOGIC;
  signal \count0_inferred__0/i__carry__0_n_5\ : STD_LOGIC;
  signal \count0_inferred__0/i__carry__0_n_6\ : STD_LOGIC;
  signal \count0_inferred__0/i__carry__0_n_7\ : STD_LOGIC;
  signal \count0_inferred__0/i__carry__1_n_7\ : STD_LOGIC;
  signal \count0_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \count0_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \count0_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \count0_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \count0_inferred__0/i__carry_n_4\ : STD_LOGIC;
  signal \count0_inferred__0/i__carry_n_5\ : STD_LOGIC;
  signal \count0_inferred__0/i__carry_n_6\ : STD_LOGIC;
  signal \count0_inferred__0/i__carry_n_7\ : STD_LOGIC;
  signal \count[18]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_reg_n_0_[10]\ : STD_LOGIC;
  signal \count_reg_n_0_[11]\ : STD_LOGIC;
  signal \count_reg_n_0_[12]\ : STD_LOGIC;
  signal \count_reg_n_0_[13]\ : STD_LOGIC;
  signal \count_reg_n_0_[14]\ : STD_LOGIC;
  signal \count_reg_n_0_[15]\ : STD_LOGIC;
  signal \count_reg_n_0_[16]\ : STD_LOGIC;
  signal \count_reg_n_0_[17]\ : STD_LOGIC;
  signal \count_reg_n_0_[18]\ : STD_LOGIC;
  signal \count_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_reg_n_0_[2]\ : STD_LOGIC;
  signal \count_reg_n_0_[3]\ : STD_LOGIC;
  signal \count_reg_n_0_[4]\ : STD_LOGIC;
  signal \count_reg_n_0_[5]\ : STD_LOGIC;
  signal \count_reg_n_0_[6]\ : STD_LOGIC;
  signal \count_reg_n_0_[7]\ : STD_LOGIC;
  signal \count_reg_n_0_[8]\ : STD_LOGIC;
  signal \count_reg_n_0_[9]\ : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 18 downto 1 );
  signal m00_axis_tlast_INST_0_i_1_n_0 : STD_LOGIC;
  signal m00_axis_tlast_INST_0_i_2_n_0 : STD_LOGIC;
  signal m00_axis_tlast_INST_0_i_3_n_0 : STD_LOGIC;
  signal m00_axis_tlast_INST_0_i_4_n_0 : STD_LOGIC;
  signal m00_axis_tlast_INST_0_i_5_n_0 : STD_LOGIC;
  signal \NLW_count0_inferred__0/i__carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \NLW_count0_inferred__0/i__carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \count0_inferred__0/i__carry\ : label is 35;
  attribute ADDER_THRESHOLD of \count0_inferred__0/i__carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \count0_inferred__0/i__carry__1\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of m00_axis_tlast_INST_0_i_3 : label is "soft_lutpair0";
begin
\count0_inferred__0/i__carry\: unisim.vcomponents.CARRY8
     port map (
      CI => \count_reg_n_0_[0]\,
      CI_TOP => '0',
      CO(7) => \count0_inferred__0/i__carry_n_0\,
      CO(6) => \count0_inferred__0/i__carry_n_1\,
      CO(5) => \count0_inferred__0/i__carry_n_2\,
      CO(4) => \count0_inferred__0/i__carry_n_3\,
      CO(3) => \count0_inferred__0/i__carry_n_4\,
      CO(2) => \count0_inferred__0/i__carry_n_5\,
      CO(1) => \count0_inferred__0/i__carry_n_6\,
      CO(0) => \count0_inferred__0/i__carry_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => data0(8 downto 1),
      S(7) => \count_reg_n_0_[8]\,
      S(6) => \count_reg_n_0_[7]\,
      S(5) => \count_reg_n_0_[6]\,
      S(4) => \count_reg_n_0_[5]\,
      S(3) => \count_reg_n_0_[4]\,
      S(2) => \count_reg_n_0_[3]\,
      S(1) => \count_reg_n_0_[2]\,
      S(0) => \count_reg_n_0_[1]\
    );
\count0_inferred__0/i__carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => \count0_inferred__0/i__carry_n_0\,
      CI_TOP => '0',
      CO(7) => \count0_inferred__0/i__carry__0_n_0\,
      CO(6) => \count0_inferred__0/i__carry__0_n_1\,
      CO(5) => \count0_inferred__0/i__carry__0_n_2\,
      CO(4) => \count0_inferred__0/i__carry__0_n_3\,
      CO(3) => \count0_inferred__0/i__carry__0_n_4\,
      CO(2) => \count0_inferred__0/i__carry__0_n_5\,
      CO(1) => \count0_inferred__0/i__carry__0_n_6\,
      CO(0) => \count0_inferred__0/i__carry__0_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => data0(16 downto 9),
      S(7) => \count_reg_n_0_[16]\,
      S(6) => \count_reg_n_0_[15]\,
      S(5) => \count_reg_n_0_[14]\,
      S(4) => \count_reg_n_0_[13]\,
      S(3) => \count_reg_n_0_[12]\,
      S(2) => \count_reg_n_0_[11]\,
      S(1) => \count_reg_n_0_[10]\,
      S(0) => \count_reg_n_0_[9]\
    );
\count0_inferred__0/i__carry__1\: unisim.vcomponents.CARRY8
     port map (
      CI => \count0_inferred__0/i__carry__0_n_0\,
      CI_TOP => '0',
      CO(7 downto 1) => \NLW_count0_inferred__0/i__carry__1_CO_UNCONNECTED\(7 downto 1),
      CO(0) => \count0_inferred__0/i__carry__1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 2) => \NLW_count0_inferred__0/i__carry__1_O_UNCONNECTED\(7 downto 2),
      O(1 downto 0) => data0(18 downto 17),
      S(7 downto 2) => B"000000",
      S(1) => \count_reg_n_0_[18]\,
      S(0) => \count_reg_n_0_[17]\
    );
\count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      O => count(0)
    );
\count[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => m00_axis_tlast_INST_0_i_1_n_0,
      I1 => m00_axis_tlast_INST_0_i_2_n_0,
      I2 => m00_axis_tlast_INST_0_i_3_n_0,
      I3 => m00_axis_tlast_INST_0_i_4_n_0,
      I4 => m00_axis_tlast_INST_0_i_5_n_0,
      I5 => data0(10),
      O => count(10)
    );
\count[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => m00_axis_tlast_INST_0_i_1_n_0,
      I1 => m00_axis_tlast_INST_0_i_2_n_0,
      I2 => m00_axis_tlast_INST_0_i_3_n_0,
      I3 => m00_axis_tlast_INST_0_i_4_n_0,
      I4 => m00_axis_tlast_INST_0_i_5_n_0,
      I5 => data0(11),
      O => count(11)
    );
\count[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => m00_axis_tlast_INST_0_i_1_n_0,
      I1 => m00_axis_tlast_INST_0_i_2_n_0,
      I2 => m00_axis_tlast_INST_0_i_3_n_0,
      I3 => m00_axis_tlast_INST_0_i_4_n_0,
      I4 => m00_axis_tlast_INST_0_i_5_n_0,
      I5 => data0(12),
      O => count(12)
    );
\count[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => m00_axis_tlast_INST_0_i_1_n_0,
      I1 => m00_axis_tlast_INST_0_i_2_n_0,
      I2 => m00_axis_tlast_INST_0_i_3_n_0,
      I3 => m00_axis_tlast_INST_0_i_4_n_0,
      I4 => m00_axis_tlast_INST_0_i_5_n_0,
      I5 => data0(13),
      O => count(13)
    );
\count[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => m00_axis_tlast_INST_0_i_1_n_0,
      I1 => m00_axis_tlast_INST_0_i_2_n_0,
      I2 => m00_axis_tlast_INST_0_i_3_n_0,
      I3 => m00_axis_tlast_INST_0_i_4_n_0,
      I4 => m00_axis_tlast_INST_0_i_5_n_0,
      I5 => data0(14),
      O => count(14)
    );
\count[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => m00_axis_tlast_INST_0_i_1_n_0,
      I1 => m00_axis_tlast_INST_0_i_2_n_0,
      I2 => m00_axis_tlast_INST_0_i_3_n_0,
      I3 => m00_axis_tlast_INST_0_i_4_n_0,
      I4 => m00_axis_tlast_INST_0_i_5_n_0,
      I5 => data0(15),
      O => count(15)
    );
\count[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => m00_axis_tlast_INST_0_i_1_n_0,
      I1 => m00_axis_tlast_INST_0_i_2_n_0,
      I2 => m00_axis_tlast_INST_0_i_3_n_0,
      I3 => m00_axis_tlast_INST_0_i_4_n_0,
      I4 => m00_axis_tlast_INST_0_i_5_n_0,
      I5 => data0(16),
      O => count(16)
    );
\count[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => m00_axis_tlast_INST_0_i_1_n_0,
      I1 => m00_axis_tlast_INST_0_i_2_n_0,
      I2 => m00_axis_tlast_INST_0_i_3_n_0,
      I3 => m00_axis_tlast_INST_0_i_4_n_0,
      I4 => m00_axis_tlast_INST_0_i_5_n_0,
      I5 => data0(17),
      O => count(17)
    );
\count[18]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axis_aresetn,
      O => \count[18]_i_1_n_0\
    );
\count[18]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s00_axis_tvalid,
      I1 => m00_axis_tready,
      O => count0
    );
\count[18]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => m00_axis_tlast_INST_0_i_1_n_0,
      I1 => m00_axis_tlast_INST_0_i_2_n_0,
      I2 => m00_axis_tlast_INST_0_i_3_n_0,
      I3 => m00_axis_tlast_INST_0_i_4_n_0,
      I4 => m00_axis_tlast_INST_0_i_5_n_0,
      I5 => data0(18),
      O => count(18)
    );
\count[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => m00_axis_tlast_INST_0_i_1_n_0,
      I1 => m00_axis_tlast_INST_0_i_2_n_0,
      I2 => m00_axis_tlast_INST_0_i_3_n_0,
      I3 => m00_axis_tlast_INST_0_i_4_n_0,
      I4 => m00_axis_tlast_INST_0_i_5_n_0,
      I5 => data0(1),
      O => count(1)
    );
\count[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => m00_axis_tlast_INST_0_i_1_n_0,
      I1 => m00_axis_tlast_INST_0_i_2_n_0,
      I2 => m00_axis_tlast_INST_0_i_3_n_0,
      I3 => m00_axis_tlast_INST_0_i_4_n_0,
      I4 => m00_axis_tlast_INST_0_i_5_n_0,
      I5 => data0(2),
      O => count(2)
    );
\count[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => m00_axis_tlast_INST_0_i_1_n_0,
      I1 => m00_axis_tlast_INST_0_i_2_n_0,
      I2 => m00_axis_tlast_INST_0_i_3_n_0,
      I3 => m00_axis_tlast_INST_0_i_4_n_0,
      I4 => m00_axis_tlast_INST_0_i_5_n_0,
      I5 => data0(3),
      O => count(3)
    );
\count[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => m00_axis_tlast_INST_0_i_1_n_0,
      I1 => m00_axis_tlast_INST_0_i_2_n_0,
      I2 => m00_axis_tlast_INST_0_i_3_n_0,
      I3 => m00_axis_tlast_INST_0_i_4_n_0,
      I4 => m00_axis_tlast_INST_0_i_5_n_0,
      I5 => data0(4),
      O => count(4)
    );
\count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => m00_axis_tlast_INST_0_i_1_n_0,
      I1 => m00_axis_tlast_INST_0_i_2_n_0,
      I2 => m00_axis_tlast_INST_0_i_3_n_0,
      I3 => m00_axis_tlast_INST_0_i_4_n_0,
      I4 => m00_axis_tlast_INST_0_i_5_n_0,
      I5 => data0(5),
      O => count(5)
    );
\count[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => m00_axis_tlast_INST_0_i_1_n_0,
      I1 => m00_axis_tlast_INST_0_i_2_n_0,
      I2 => m00_axis_tlast_INST_0_i_3_n_0,
      I3 => m00_axis_tlast_INST_0_i_4_n_0,
      I4 => m00_axis_tlast_INST_0_i_5_n_0,
      I5 => data0(6),
      O => count(6)
    );
\count[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => m00_axis_tlast_INST_0_i_1_n_0,
      I1 => m00_axis_tlast_INST_0_i_2_n_0,
      I2 => m00_axis_tlast_INST_0_i_3_n_0,
      I3 => m00_axis_tlast_INST_0_i_4_n_0,
      I4 => m00_axis_tlast_INST_0_i_5_n_0,
      I5 => data0(7),
      O => count(7)
    );
\count[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => m00_axis_tlast_INST_0_i_1_n_0,
      I1 => m00_axis_tlast_INST_0_i_2_n_0,
      I2 => m00_axis_tlast_INST_0_i_3_n_0,
      I3 => m00_axis_tlast_INST_0_i_4_n_0,
      I4 => m00_axis_tlast_INST_0_i_5_n_0,
      I5 => data0(8),
      O => count(8)
    );
\count[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => m00_axis_tlast_INST_0_i_1_n_0,
      I1 => m00_axis_tlast_INST_0_i_2_n_0,
      I2 => m00_axis_tlast_INST_0_i_3_n_0,
      I3 => m00_axis_tlast_INST_0_i_4_n_0,
      I4 => m00_axis_tlast_INST_0_i_5_n_0,
      I5 => data0(9),
      O => count(9)
    );
\count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => count0,
      D => count(0),
      Q => \count_reg_n_0_[0]\,
      R => \count[18]_i_1_n_0\
    );
\count_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => count0,
      D => count(10),
      Q => \count_reg_n_0_[10]\,
      R => \count[18]_i_1_n_0\
    );
\count_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => count0,
      D => count(11),
      Q => \count_reg_n_0_[11]\,
      R => \count[18]_i_1_n_0\
    );
\count_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => count0,
      D => count(12),
      Q => \count_reg_n_0_[12]\,
      R => \count[18]_i_1_n_0\
    );
\count_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => count0,
      D => count(13),
      Q => \count_reg_n_0_[13]\,
      R => \count[18]_i_1_n_0\
    );
\count_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => count0,
      D => count(14),
      Q => \count_reg_n_0_[14]\,
      R => \count[18]_i_1_n_0\
    );
\count_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => count0,
      D => count(15),
      Q => \count_reg_n_0_[15]\,
      R => \count[18]_i_1_n_0\
    );
\count_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => count0,
      D => count(16),
      Q => \count_reg_n_0_[16]\,
      R => \count[18]_i_1_n_0\
    );
\count_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => count0,
      D => count(17),
      Q => \count_reg_n_0_[17]\,
      R => \count[18]_i_1_n_0\
    );
\count_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => count0,
      D => count(18),
      Q => \count_reg_n_0_[18]\,
      R => \count[18]_i_1_n_0\
    );
\count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => count0,
      D => count(1),
      Q => \count_reg_n_0_[1]\,
      R => \count[18]_i_1_n_0\
    );
\count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => count0,
      D => count(2),
      Q => \count_reg_n_0_[2]\,
      R => \count[18]_i_1_n_0\
    );
\count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => count0,
      D => count(3),
      Q => \count_reg_n_0_[3]\,
      R => \count[18]_i_1_n_0\
    );
\count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => count0,
      D => count(4),
      Q => \count_reg_n_0_[4]\,
      R => \count[18]_i_1_n_0\
    );
\count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => count0,
      D => count(5),
      Q => \count_reg_n_0_[5]\,
      R => \count[18]_i_1_n_0\
    );
\count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => count0,
      D => count(6),
      Q => \count_reg_n_0_[6]\,
      R => \count[18]_i_1_n_0\
    );
\count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => count0,
      D => count(7),
      Q => \count_reg_n_0_[7]\,
      R => \count[18]_i_1_n_0\
    );
\count_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => count0,
      D => count(8),
      Q => \count_reg_n_0_[8]\,
      R => \count[18]_i_1_n_0\
    );
\count_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => count0,
      D => count(9),
      Q => \count_reg_n_0_[9]\,
      R => \count[18]_i_1_n_0\
    );
\m00_axis_tdata[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0EEF0F0F0F0"
    )
        port map (
      I0 => control(1),
      I1 => \count_reg_n_0_[0]\,
      I2 => s00_axis_tdata(0),
      I3 => control(3),
      I4 => control(2),
      I5 => control(0),
      O => m00_axis_tdata(0)
    );
\m00_axis_tdata[10]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0EEF0F0F0F0"
    )
        port map (
      I0 => control(1),
      I1 => \count_reg_n_0_[10]\,
      I2 => s00_axis_tdata(10),
      I3 => control(3),
      I4 => control(2),
      I5 => control(0),
      O => m00_axis_tdata(10)
    );
\m00_axis_tdata[11]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0EEF0F0F0F0"
    )
        port map (
      I0 => control(1),
      I1 => \count_reg_n_0_[11]\,
      I2 => s00_axis_tdata(11),
      I3 => control(3),
      I4 => control(2),
      I5 => control(0),
      O => m00_axis_tdata(11)
    );
\m00_axis_tdata[12]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0EEF0F0F0F0"
    )
        port map (
      I0 => control(1),
      I1 => \count_reg_n_0_[12]\,
      I2 => s00_axis_tdata(12),
      I3 => control(3),
      I4 => control(2),
      I5 => control(0),
      O => m00_axis_tdata(12)
    );
\m00_axis_tdata[13]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0EEF0F0F0F0"
    )
        port map (
      I0 => control(1),
      I1 => \count_reg_n_0_[13]\,
      I2 => s00_axis_tdata(13),
      I3 => control(3),
      I4 => control(2),
      I5 => control(0),
      O => m00_axis_tdata(13)
    );
\m00_axis_tdata[14]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0EEF0F0F0F0"
    )
        port map (
      I0 => control(1),
      I1 => \count_reg_n_0_[14]\,
      I2 => s00_axis_tdata(14),
      I3 => control(3),
      I4 => control(2),
      I5 => control(0),
      O => m00_axis_tdata(14)
    );
\m00_axis_tdata[15]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0EEF0F0F0F0"
    )
        port map (
      I0 => control(1),
      I1 => \count_reg_n_0_[15]\,
      I2 => s00_axis_tdata(15),
      I3 => control(3),
      I4 => control(2),
      I5 => control(0),
      O => m00_axis_tdata(15)
    );
\m00_axis_tdata[16]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0EEF0F0F0F0"
    )
        port map (
      I0 => control(1),
      I1 => \count_reg_n_0_[16]\,
      I2 => s01_axis_tdata(0),
      I3 => control(3),
      I4 => control(2),
      I5 => control(0),
      O => m00_axis_tdata(16)
    );
\m00_axis_tdata[17]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0EEF0F0F0F0"
    )
        port map (
      I0 => control(1),
      I1 => \count_reg_n_0_[17]\,
      I2 => s01_axis_tdata(1),
      I3 => control(3),
      I4 => control(2),
      I5 => control(0),
      O => m00_axis_tdata(17)
    );
\m00_axis_tdata[18]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A8AAA8AAABAAA8AA"
    )
        port map (
      I0 => s01_axis_tdata(2),
      I1 => control(3),
      I2 => control(2),
      I3 => control(0),
      I4 => \count_reg_n_0_[18]\,
      I5 => control(1),
      O => m00_axis_tdata(18)
    );
\m00_axis_tdata[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0EEF0F0F0F0"
    )
        port map (
      I0 => control(1),
      I1 => \count_reg_n_0_[1]\,
      I2 => s00_axis_tdata(1),
      I3 => control(3),
      I4 => control(2),
      I5 => control(0),
      O => m00_axis_tdata(1)
    );
\m00_axis_tdata[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0EEF0F0F0F0"
    )
        port map (
      I0 => control(1),
      I1 => \count_reg_n_0_[2]\,
      I2 => s00_axis_tdata(2),
      I3 => control(3),
      I4 => control(2),
      I5 => control(0),
      O => m00_axis_tdata(2)
    );
\m00_axis_tdata[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0EEF0F0F0F0"
    )
        port map (
      I0 => control(1),
      I1 => \count_reg_n_0_[3]\,
      I2 => s00_axis_tdata(3),
      I3 => control(3),
      I4 => control(2),
      I5 => control(0),
      O => m00_axis_tdata(3)
    );
\m00_axis_tdata[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0EEF0F0F0F0"
    )
        port map (
      I0 => control(1),
      I1 => \count_reg_n_0_[4]\,
      I2 => s00_axis_tdata(4),
      I3 => control(3),
      I4 => control(2),
      I5 => control(0),
      O => m00_axis_tdata(4)
    );
\m00_axis_tdata[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0EEF0F0F0F0"
    )
        port map (
      I0 => control(1),
      I1 => \count_reg_n_0_[5]\,
      I2 => s00_axis_tdata(5),
      I3 => control(3),
      I4 => control(2),
      I5 => control(0),
      O => m00_axis_tdata(5)
    );
\m00_axis_tdata[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0EEF0F0F0F0"
    )
        port map (
      I0 => control(1),
      I1 => \count_reg_n_0_[6]\,
      I2 => s00_axis_tdata(6),
      I3 => control(3),
      I4 => control(2),
      I5 => control(0),
      O => m00_axis_tdata(6)
    );
\m00_axis_tdata[7]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0EEF0F0F0F0"
    )
        port map (
      I0 => control(1),
      I1 => \count_reg_n_0_[7]\,
      I2 => s00_axis_tdata(7),
      I3 => control(3),
      I4 => control(2),
      I5 => control(0),
      O => m00_axis_tdata(7)
    );
\m00_axis_tdata[8]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0EEF0F0F0F0"
    )
        port map (
      I0 => control(1),
      I1 => \count_reg_n_0_[8]\,
      I2 => s00_axis_tdata(8),
      I3 => control(3),
      I4 => control(2),
      I5 => control(0),
      O => m00_axis_tdata(8)
    );
\m00_axis_tdata[9]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0EEF0F0F0F0"
    )
        port map (
      I0 => control(1),
      I1 => \count_reg_n_0_[9]\,
      I2 => s00_axis_tdata(9),
      I3 => control(3),
      I4 => control(2),
      I5 => control(0),
      O => m00_axis_tdata(9)
    );
m00_axis_tlast_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000000"
    )
        port map (
      I0 => m00_axis_tlast_INST_0_i_1_n_0,
      I1 => m00_axis_tlast_INST_0_i_2_n_0,
      I2 => m00_axis_tlast_INST_0_i_3_n_0,
      I3 => m00_axis_tlast_INST_0_i_4_n_0,
      I4 => m00_axis_tlast_INST_0_i_5_n_0,
      I5 => s00_axis_tvalid,
      O => m00_axis_tlast
    );
m00_axis_tlast_INST_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[4]\,
      I3 => \count_reg_n_0_[3]\,
      O => m00_axis_tlast_INST_0_i_1_n_0
    );
m00_axis_tlast_INST_0_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \count_reg_n_0_[14]\,
      I1 => \count_reg_n_0_[13]\,
      I2 => \count_reg_n_0_[16]\,
      I3 => \count_reg_n_0_[15]\,
      O => m00_axis_tlast_INST_0_i_2_n_0
    );
m00_axis_tlast_INST_0_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => \count_reg_n_0_[17]\,
      I1 => \count_reg_n_0_[18]\,
      I2 => \count_reg_n_0_[0]\,
      O => m00_axis_tlast_INST_0_i_3_n_0
    );
m00_axis_tlast_INST_0_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \count_reg_n_0_[10]\,
      I1 => \count_reg_n_0_[9]\,
      I2 => \count_reg_n_0_[12]\,
      I3 => \count_reg_n_0_[11]\,
      O => m00_axis_tlast_INST_0_i_4_n_0
    );
m00_axis_tlast_INST_0_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \count_reg_n_0_[6]\,
      I1 => \count_reg_n_0_[5]\,
      I2 => \count_reg_n_0_[8]\,
      I3 => \count_reg_n_0_[7]\,
      O => m00_axis_tlast_INST_0_i_5_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    s00_axis_aclk : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s00_axis_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axis_tlast : in STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    s01_axis_aclk : in STD_LOGIC;
    s01_axis_aresetn : in STD_LOGIC;
    s01_axis_tready : out STD_LOGIC;
    s01_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s01_axis_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s01_axis_tlast : in STD_LOGIC;
    s01_axis_tvalid : in STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    control : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_iq_framer_0_0,iq_framer,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "iq_framer,Vivado 2025.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^s00_axis_tvalid\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of m00_axis_aclk : signal is "xilinx.com:signal:clock:1.0 M00_AXIS_CLK CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of m00_axis_aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of m00_axis_aclk : signal is "XIL_INTERFACENAME M00_AXIS_CLK, ASSOCIATED_BUSIF M00_AXIS, ASSOCIATED_RESET m00_axis_aresetn, FREQ_HZ 64000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_usp_rf_data_converter_0_0_clk_adc2, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m00_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 M00_AXIS_RST RST";
  attribute X_INTERFACE_MODE of m00_axis_aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of m00_axis_aresetn : signal is "XIL_INTERFACENAME M00_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m00_axis_tlast : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TLAST";
  attribute X_INTERFACE_INFO of m00_axis_tready : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TREADY";
  attribute X_INTERFACE_INFO of m00_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TVALID";
  attribute X_INTERFACE_MODE of m00_axis_tvalid : signal is "master";
  attribute X_INTERFACE_PARAMETER of m00_axis_tvalid : signal is "XIL_INTERFACENAME M00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 64000000, PHASE 0.0, CLK_DOMAIN design_1_usp_rf_data_converter_0_0_clk_adc2, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axis_aclk : signal is "xilinx.com:signal:clock:1.0 S00_AXIS_CLK CLK";
  attribute X_INTERFACE_MODE of s00_axis_aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s00_axis_aclk : signal is "XIL_INTERFACENAME S00_AXIS_CLK, ASSOCIATED_BUSIF S00_AXIS, ASSOCIATED_RESET s00_axis_aresetn, FREQ_HZ 64000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_usp_rf_data_converter_0_0_clk_adc2, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 S00_AXIS_RST RST";
  attribute X_INTERFACE_MODE of s00_axis_aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s00_axis_aresetn : signal is "XIL_INTERFACENAME S00_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axis_tlast : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TLAST";
  attribute X_INTERFACE_INFO of s00_axis_tready : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TREADY";
  attribute X_INTERFACE_MODE of s00_axis_tready : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s00_axis_tready : signal is "XIL_INTERFACENAME S00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 64000000, PHASE 0.0, CLK_DOMAIN design_1_usp_rf_data_converter_0_0_clk_adc2, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value chan} size {attribs {resolve_type generated dependency chan_size format long minimum {} maximum {}} value 1} stride {attribs {resolve_type generated dependency chan_stride format long minimum {} maximum {}} value 16} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency data_width format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type generated dependency data_fractwidth format long minimum {} maximum {}} value 0} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}} TDATA_WIDTH 16 TUSER {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_chan_out {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value chan_out} enabled {attribs {resolve_type generated dependency enabled format bool minimum {} maximum {}} value false} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency chan_out_width format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} field_chan_sync {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value chan_sync} enabled {attribs {resolve_type generated dependency enabled format bool minimum {} maximum {}} value false} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency chan_sync_width format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type generated dependency chan_sync_offset format long minimum {} maximum {}} value 0}}}}}} TUSER_WIDTH 0}, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TVALID";
  attribute X_INTERFACE_INFO of s01_axis_aclk : signal is "xilinx.com:signal:clock:1.0 S01_AXIS_CLK CLK";
  attribute X_INTERFACE_MODE of s01_axis_aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s01_axis_aclk : signal is "XIL_INTERFACENAME S01_AXIS_CLK, ASSOCIATED_BUSIF S01_AXIS, ASSOCIATED_RESET s01_axis_aresetn, FREQ_HZ 64000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_usp_rf_data_converter_0_0_clk_adc2, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s01_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 S01_AXIS_RST RST";
  attribute X_INTERFACE_MODE of s01_axis_aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s01_axis_aresetn : signal is "XIL_INTERFACENAME S01_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s01_axis_tlast : signal is "xilinx.com:interface:axis:1.0 S01_AXIS TLAST";
  attribute X_INTERFACE_INFO of s01_axis_tready : signal is "xilinx.com:interface:axis:1.0 S01_AXIS TREADY";
  attribute X_INTERFACE_MODE of s01_axis_tready : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s01_axis_tready : signal is "XIL_INTERFACENAME S01_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 64000000, PHASE 0.0, CLK_DOMAIN design_1_usp_rf_data_converter_0_0_clk_adc2, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value chan} size {attribs {resolve_type generated dependency chan_size format long minimum {} maximum {}} value 1} stride {attribs {resolve_type generated dependency chan_stride format long minimum {} maximum {}} value 16} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency data_width format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type generated dependency data_fractwidth format long minimum {} maximum {}} value 0} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}} TDATA_WIDTH 16 TUSER {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_chan_out {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value chan_out} enabled {attribs {resolve_type generated dependency enabled format bool minimum {} maximum {}} value false} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency chan_out_width format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} field_chan_sync {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value chan_sync} enabled {attribs {resolve_type generated dependency enabled format bool minimum {} maximum {}} value false} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency chan_sync_width format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type generated dependency chan_sync_offset format long minimum {} maximum {}} value 0}}}}}} TUSER_WIDTH 0}, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s01_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 S01_AXIS TVALID";
  attribute X_INTERFACE_INFO of m00_axis_tdata : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TDATA";
  attribute X_INTERFACE_INFO of m00_axis_tstrb : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TSTRB";
  attribute X_INTERFACE_INFO of s00_axis_tdata : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TDATA";
  attribute X_INTERFACE_INFO of s00_axis_tstrb : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TSTRB";
  attribute X_INTERFACE_INFO of s01_axis_tdata : signal is "xilinx.com:interface:axis:1.0 S01_AXIS TDATA";
  attribute X_INTERFACE_INFO of s01_axis_tstrb : signal is "xilinx.com:interface:axis:1.0 S01_AXIS TSTRB";
begin
  \^s00_axis_tvalid\ <= s00_axis_tvalid;
  m00_axis_tstrb(3) <= \<const1>\;
  m00_axis_tstrb(2) <= \<const1>\;
  m00_axis_tstrb(1) <= \<const1>\;
  m00_axis_tstrb(0) <= \<const1>\;
  m00_axis_tvalid <= \^s00_axis_tvalid\;
  probe(3) <= \<const0>\;
  probe(2) <= \<const0>\;
  probe(1) <= \<const0>\;
  probe(0) <= \<const0>\;
  s00_axis_tready <= \<const1>\;
  s01_axis_tready <= \<const1>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_iq_framer
     port map (
      control(3 downto 0) => control(3 downto 0),
      m00_axis_tdata(18 downto 0) => m00_axis_tdata(18 downto 0),
      m00_axis_tlast => m00_axis_tlast,
      m00_axis_tready => m00_axis_tready,
      s00_axis_aclk => s00_axis_aclk,
      s00_axis_aresetn => s00_axis_aresetn,
      s00_axis_tdata(15 downto 0) => s00_axis_tdata(15 downto 0),
      s00_axis_tvalid => \^s00_axis_tvalid\,
      s01_axis_tdata(2 downto 0) => s01_axis_tdata(2 downto 0)
    );
\m00_axis_tdata[19]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FD00"
    )
        port map (
      I0 => control(0),
      I1 => control(2),
      I2 => control(3),
      I3 => s01_axis_tdata(3),
      O => m00_axis_tdata(19)
    );
\m00_axis_tdata[20]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FD00"
    )
        port map (
      I0 => control(0),
      I1 => control(2),
      I2 => control(3),
      I3 => s01_axis_tdata(4),
      O => m00_axis_tdata(20)
    );
\m00_axis_tdata[21]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FD00"
    )
        port map (
      I0 => control(0),
      I1 => control(2),
      I2 => control(3),
      I3 => s01_axis_tdata(5),
      O => m00_axis_tdata(21)
    );
\m00_axis_tdata[22]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FD00"
    )
        port map (
      I0 => control(0),
      I1 => control(2),
      I2 => control(3),
      I3 => s01_axis_tdata(6),
      O => m00_axis_tdata(22)
    );
\m00_axis_tdata[23]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FD00"
    )
        port map (
      I0 => control(0),
      I1 => control(2),
      I2 => control(3),
      I3 => s01_axis_tdata(7),
      O => m00_axis_tdata(23)
    );
\m00_axis_tdata[24]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FD00"
    )
        port map (
      I0 => control(0),
      I1 => control(2),
      I2 => control(3),
      I3 => s01_axis_tdata(8),
      O => m00_axis_tdata(24)
    );
\m00_axis_tdata[25]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FD00"
    )
        port map (
      I0 => control(0),
      I1 => control(2),
      I2 => control(3),
      I3 => s01_axis_tdata(9),
      O => m00_axis_tdata(25)
    );
\m00_axis_tdata[26]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FD00"
    )
        port map (
      I0 => control(0),
      I1 => control(2),
      I2 => control(3),
      I3 => s01_axis_tdata(10),
      O => m00_axis_tdata(26)
    );
\m00_axis_tdata[27]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FD00"
    )
        port map (
      I0 => control(0),
      I1 => control(2),
      I2 => control(3),
      I3 => s01_axis_tdata(11),
      O => m00_axis_tdata(27)
    );
\m00_axis_tdata[28]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FD00"
    )
        port map (
      I0 => control(0),
      I1 => control(2),
      I2 => control(3),
      I3 => s01_axis_tdata(12),
      O => m00_axis_tdata(28)
    );
\m00_axis_tdata[29]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FD00"
    )
        port map (
      I0 => control(0),
      I1 => control(2),
      I2 => control(3),
      I3 => s01_axis_tdata(13),
      O => m00_axis_tdata(29)
    );
\m00_axis_tdata[30]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FD00"
    )
        port map (
      I0 => control(0),
      I1 => control(2),
      I2 => control(3),
      I3 => s01_axis_tdata(14),
      O => m00_axis_tdata(30)
    );
\m00_axis_tdata[31]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FD00"
    )
        port map (
      I0 => control(0),
      I1 => control(2),
      I2 => control(3),
      I3 => s01_axis_tdata(15),
      O => m00_axis_tdata(31)
    );
end STRUCTURE;
