-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
-- Date        : Fri Oct 24 09:36:24 2025
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
    m00_axis_tlast : out STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 18 downto 0 );
    s00_axis_aclk : in STD_LOGIC;
    control : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s01_axis_tdata : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axis_tvalid : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_iq_framer;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_iq_framer is
  signal count0 : STD_LOGIC;
  signal count0_carry_i_1_n_0 : STD_LOGIC;
  signal count0_carry_i_2_n_0 : STD_LOGIC;
  signal count0_carry_i_3_n_0 : STD_LOGIC;
  signal count0_carry_i_4_n_0 : STD_LOGIC;
  signal count0_carry_i_5_n_0 : STD_LOGIC;
  signal count0_carry_i_6_n_0 : STD_LOGIC;
  signal count0_carry_i_7_n_0 : STD_LOGIC;
  signal count0_carry_n_2 : STD_LOGIC;
  signal count0_carry_n_3 : STD_LOGIC;
  signal count0_carry_n_4 : STD_LOGIC;
  signal count0_carry_n_5 : STD_LOGIC;
  signal count0_carry_n_6 : STD_LOGIC;
  signal count0_carry_n_7 : STD_LOGIC;
  signal count1 : STD_LOGIC;
  signal count1_carry_i_1_n_0 : STD_LOGIC;
  signal count1_carry_i_2_n_0 : STD_LOGIC;
  signal count1_carry_i_3_n_0 : STD_LOGIC;
  signal count1_carry_i_4_n_0 : STD_LOGIC;
  signal count1_carry_i_5_n_0 : STD_LOGIC;
  signal count1_carry_i_6_n_0 : STD_LOGIC;
  signal count1_carry_i_7_n_0 : STD_LOGIC;
  signal count1_carry_n_2 : STD_LOGIC;
  signal count1_carry_n_3 : STD_LOGIC;
  signal count1_carry_n_4 : STD_LOGIC;
  signal count1_carry_n_5 : STD_LOGIC;
  signal count1_carry_n_6 : STD_LOGIC;
  signal count1_carry_n_7 : STD_LOGIC;
  signal \count[0]_i_1_n_0\ : STD_LOGIC;
  signal \count[0]_i_3_n_0\ : STD_LOGIC;
  signal count_reg : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal \count_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_10\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_11\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_12\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_13\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_14\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_15\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_8\ : STD_LOGIC;
  signal \count_reg[0]_i_2_n_9\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_13\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_14\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_15\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_10\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_11\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_12\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_13\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_14\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_15\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_8\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_9\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal tlast_reg_i_1_n_0 : STD_LOGIC;
  signal NLW_count0_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 7 to 7 );
  signal NLW_count0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_count1_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 7 to 7 );
  signal NLW_count1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_count_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \NLW_count_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \count_reg[0]_i_2\ : label is 16;
  attribute ADDER_THRESHOLD of \count_reg[16]_i_1\ : label is 16;
  attribute ADDER_THRESHOLD of \count_reg[8]_i_1\ : label is 16;
begin
count0_carry: unisim.vcomponents.CARRY8
     port map (
      CI => '1',
      CI_TOP => '0',
      CO(7) => NLW_count0_carry_CO_UNCONNECTED(7),
      CO(6) => count0,
      CO(5) => count0_carry_n_2,
      CO(4) => count0_carry_n_3,
      CO(3) => count0_carry_n_4,
      CO(2) => count0_carry_n_5,
      CO(1) => count0_carry_n_6,
      CO(0) => count0_carry_n_7,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => NLW_count0_carry_O_UNCONNECTED(7 downto 0),
      S(7) => '0',
      S(6) => count0_carry_i_1_n_0,
      S(5) => count0_carry_i_2_n_0,
      S(4) => count0_carry_i_3_n_0,
      S(3) => count0_carry_i_4_n_0,
      S(2) => count0_carry_i_5_n_0,
      S(1) => count0_carry_i_6_n_0,
      S(0) => count0_carry_i_7_n_0
    );
count0_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_reg(18),
      O => count0_carry_i_1_n_0
    );
count0_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"002000000000AA8A"
    )
        port map (
      I0 => count_reg(15),
      I1 => control(0),
      I2 => control(1),
      I3 => p_0_in,
      I4 => count_reg(17),
      I5 => count_reg(16),
      O => count0_carry_i_2_n_0
    );
count0_carry_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => count_reg(12),
      I1 => count_reg(14),
      I2 => count_reg(13),
      O => count0_carry_i_3_n_0
    );
count0_carry_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => count_reg(9),
      I1 => count_reg(11),
      I2 => count_reg(10),
      O => count0_carry_i_4_n_0
    );
count0_carry_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => count_reg(6),
      I1 => count_reg(8),
      I2 => count_reg(7),
      O => count0_carry_i_5_n_0
    );
count0_carry_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => count_reg(3),
      I1 => count_reg(5),
      I2 => count_reg(4),
      O => count0_carry_i_6_n_0
    );
count0_carry_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => count_reg(0),
      I1 => count_reg(2),
      I2 => count_reg(1),
      O => count0_carry_i_7_n_0
    );
count1_carry: unisim.vcomponents.CARRY8
     port map (
      CI => '1',
      CI_TOP => '0',
      CO(7) => NLW_count1_carry_CO_UNCONNECTED(7),
      CO(6) => count1,
      CO(5) => count1_carry_n_2,
      CO(4) => count1_carry_n_3,
      CO(3) => count1_carry_n_4,
      CO(2) => count1_carry_n_5,
      CO(1) => count1_carry_n_6,
      CO(0) => count1_carry_n_7,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => NLW_count1_carry_O_UNCONNECTED(7 downto 0),
      S(7) => '0',
      S(6) => count1_carry_i_1_n_0,
      S(5) => count1_carry_i_2_n_0,
      S(4) => count1_carry_i_3_n_0,
      S(3) => count1_carry_i_4_n_0,
      S(2) => count1_carry_i_5_n_0,
      S(1) => count1_carry_i_6_n_0,
      S(0) => count1_carry_i_7_n_0
    );
count1_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_reg(18),
      O => count1_carry_i_1_n_0
    );
count1_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"002000000000AA8A"
    )
        port map (
      I0 => count_reg(15),
      I1 => control(0),
      I2 => control(1),
      I3 => p_0_in,
      I4 => count_reg(17),
      I5 => count_reg(16),
      O => count1_carry_i_2_n_0
    );
count1_carry_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => count_reg(12),
      I1 => count_reg(14),
      I2 => count_reg(13),
      O => count1_carry_i_3_n_0
    );
count1_carry_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => count_reg(9),
      I1 => count_reg(11),
      I2 => count_reg(10),
      O => count1_carry_i_4_n_0
    );
count1_carry_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => count_reg(6),
      I1 => count_reg(8),
      I2 => count_reg(7),
      O => count1_carry_i_5_n_0
    );
count1_carry_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => count_reg(3),
      I1 => count_reg(5),
      I2 => count_reg(4),
      O => count1_carry_i_6_n_0
    );
count1_carry_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => count_reg(2),
      I1 => count_reg(1),
      I2 => count_reg(0),
      O => count1_carry_i_7_n_0
    );
count1_carry_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      O => p_0_in
    );
\count[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"20FF"
    )
        port map (
      I0 => count0,
      I1 => count1,
      I2 => s00_axis_tvalid,
      I3 => s00_axis_aresetn,
      O => \count[0]_i_1_n_0\
    );
\count[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_reg(0),
      O => \count[0]_i_3_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => s00_axis_tvalid,
      D => \count_reg[0]_i_2_n_15\,
      Q => count_reg(0),
      R => \count[0]_i_1_n_0\
    );
\count_reg[0]_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \count_reg[0]_i_2_n_0\,
      CO(6) => \count_reg[0]_i_2_n_1\,
      CO(5) => \count_reg[0]_i_2_n_2\,
      CO(4) => \count_reg[0]_i_2_n_3\,
      CO(3) => \count_reg[0]_i_2_n_4\,
      CO(2) => \count_reg[0]_i_2_n_5\,
      CO(1) => \count_reg[0]_i_2_n_6\,
      CO(0) => \count_reg[0]_i_2_n_7\,
      DI(7 downto 0) => B"00000001",
      O(7) => \count_reg[0]_i_2_n_8\,
      O(6) => \count_reg[0]_i_2_n_9\,
      O(5) => \count_reg[0]_i_2_n_10\,
      O(4) => \count_reg[0]_i_2_n_11\,
      O(3) => \count_reg[0]_i_2_n_12\,
      O(2) => \count_reg[0]_i_2_n_13\,
      O(1) => \count_reg[0]_i_2_n_14\,
      O(0) => \count_reg[0]_i_2_n_15\,
      S(7 downto 1) => count_reg(7 downto 1),
      S(0) => \count[0]_i_3_n_0\
    );
\count_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => s00_axis_tvalid,
      D => \count_reg[8]_i_1_n_13\,
      Q => count_reg(10),
      R => \count[0]_i_1_n_0\
    );
\count_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => s00_axis_tvalid,
      D => \count_reg[8]_i_1_n_12\,
      Q => count_reg(11),
      R => \count[0]_i_1_n_0\
    );
\count_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => s00_axis_tvalid,
      D => \count_reg[8]_i_1_n_11\,
      Q => count_reg(12),
      R => \count[0]_i_1_n_0\
    );
\count_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => s00_axis_tvalid,
      D => \count_reg[8]_i_1_n_10\,
      Q => count_reg(13),
      R => \count[0]_i_1_n_0\
    );
\count_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => s00_axis_tvalid,
      D => \count_reg[8]_i_1_n_9\,
      Q => count_reg(14),
      R => \count[0]_i_1_n_0\
    );
\count_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => s00_axis_tvalid,
      D => \count_reg[8]_i_1_n_8\,
      Q => count_reg(15),
      R => \count[0]_i_1_n_0\
    );
\count_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => s00_axis_tvalid,
      D => \count_reg[16]_i_1_n_15\,
      Q => count_reg(16),
      R => \count[0]_i_1_n_0\
    );
\count_reg[16]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \count_reg[8]_i_1_n_0\,
      CI_TOP => '0',
      CO(7 downto 2) => \NLW_count_reg[16]_i_1_CO_UNCONNECTED\(7 downto 2),
      CO(1) => \count_reg[16]_i_1_n_6\,
      CO(0) => \count_reg[16]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 3) => \NLW_count_reg[16]_i_1_O_UNCONNECTED\(7 downto 3),
      O(2) => \count_reg[16]_i_1_n_13\,
      O(1) => \count_reg[16]_i_1_n_14\,
      O(0) => \count_reg[16]_i_1_n_15\,
      S(7 downto 3) => B"00000",
      S(2 downto 0) => count_reg(18 downto 16)
    );
\count_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => s00_axis_tvalid,
      D => \count_reg[16]_i_1_n_14\,
      Q => count_reg(17),
      R => \count[0]_i_1_n_0\
    );
\count_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => s00_axis_tvalid,
      D => \count_reg[16]_i_1_n_13\,
      Q => count_reg(18),
      R => \count[0]_i_1_n_0\
    );
\count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => s00_axis_tvalid,
      D => \count_reg[0]_i_2_n_14\,
      Q => count_reg(1),
      R => \count[0]_i_1_n_0\
    );
\count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => s00_axis_tvalid,
      D => \count_reg[0]_i_2_n_13\,
      Q => count_reg(2),
      R => \count[0]_i_1_n_0\
    );
\count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => s00_axis_tvalid,
      D => \count_reg[0]_i_2_n_12\,
      Q => count_reg(3),
      R => \count[0]_i_1_n_0\
    );
\count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => s00_axis_tvalid,
      D => \count_reg[0]_i_2_n_11\,
      Q => count_reg(4),
      R => \count[0]_i_1_n_0\
    );
\count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => s00_axis_tvalid,
      D => \count_reg[0]_i_2_n_10\,
      Q => count_reg(5),
      R => \count[0]_i_1_n_0\
    );
\count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => s00_axis_tvalid,
      D => \count_reg[0]_i_2_n_9\,
      Q => count_reg(6),
      R => \count[0]_i_1_n_0\
    );
\count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => s00_axis_tvalid,
      D => \count_reg[0]_i_2_n_8\,
      Q => count_reg(7),
      R => \count[0]_i_1_n_0\
    );
\count_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => s00_axis_tvalid,
      D => \count_reg[8]_i_1_n_15\,
      Q => count_reg(8),
      R => \count[0]_i_1_n_0\
    );
\count_reg[8]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \count_reg[0]_i_2_n_0\,
      CI_TOP => '0',
      CO(7) => \count_reg[8]_i_1_n_0\,
      CO(6) => \count_reg[8]_i_1_n_1\,
      CO(5) => \count_reg[8]_i_1_n_2\,
      CO(4) => \count_reg[8]_i_1_n_3\,
      CO(3) => \count_reg[8]_i_1_n_4\,
      CO(2) => \count_reg[8]_i_1_n_5\,
      CO(1) => \count_reg[8]_i_1_n_6\,
      CO(0) => \count_reg[8]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \count_reg[8]_i_1_n_8\,
      O(6) => \count_reg[8]_i_1_n_9\,
      O(5) => \count_reg[8]_i_1_n_10\,
      O(4) => \count_reg[8]_i_1_n_11\,
      O(3) => \count_reg[8]_i_1_n_12\,
      O(2) => \count_reg[8]_i_1_n_13\,
      O(1) => \count_reg[8]_i_1_n_14\,
      O(0) => \count_reg[8]_i_1_n_15\,
      S(7 downto 0) => count_reg(15 downto 8)
    );
\count_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => s00_axis_tvalid,
      D => \count_reg[8]_i_1_n_14\,
      Q => count_reg(9),
      R => \count[0]_i_1_n_0\
    );
\m00_axis_tdata[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF11100000"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => control(1),
      I3 => count_reg(0),
      I4 => control(0),
      I5 => s00_axis_tdata(0),
      O => m00_axis_tdata(0)
    );
\m00_axis_tdata[10]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF11100000"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => control(1),
      I3 => count_reg(10),
      I4 => control(0),
      I5 => s00_axis_tdata(10),
      O => m00_axis_tdata(10)
    );
\m00_axis_tdata[11]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF11100000"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => control(1),
      I3 => count_reg(11),
      I4 => control(0),
      I5 => s00_axis_tdata(11),
      O => m00_axis_tdata(11)
    );
\m00_axis_tdata[12]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF11100000"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => control(1),
      I3 => count_reg(12),
      I4 => control(0),
      I5 => s00_axis_tdata(12),
      O => m00_axis_tdata(12)
    );
\m00_axis_tdata[13]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF11100000"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => control(1),
      I3 => count_reg(13),
      I4 => control(0),
      I5 => s00_axis_tdata(13),
      O => m00_axis_tdata(13)
    );
\m00_axis_tdata[14]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF11100000"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => control(1),
      I3 => count_reg(14),
      I4 => control(0),
      I5 => s00_axis_tdata(14),
      O => m00_axis_tdata(14)
    );
\m00_axis_tdata[15]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF11100000"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => control(1),
      I3 => count_reg(15),
      I4 => control(0),
      I5 => s00_axis_tdata(15),
      O => m00_axis_tdata(15)
    );
\m00_axis_tdata[16]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFEEFFFF01000000"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => control(1),
      I3 => count_reg(16),
      I4 => control(0),
      I5 => s01_axis_tdata(0),
      O => m00_axis_tdata(16)
    );
\m00_axis_tdata[17]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFEEFFFF01000000"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => control(1),
      I3 => count_reg(17),
      I4 => control(0),
      I5 => s01_axis_tdata(1),
      O => m00_axis_tdata(17)
    );
\m00_axis_tdata[18]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEFEFFFF00100000"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => count_reg(18),
      I3 => control(1),
      I4 => control(0),
      I5 => s01_axis_tdata(2),
      O => m00_axis_tdata(18)
    );
\m00_axis_tdata[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF11100000"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => control(1),
      I3 => count_reg(1),
      I4 => control(0),
      I5 => s00_axis_tdata(1),
      O => m00_axis_tdata(1)
    );
\m00_axis_tdata[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF11100000"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => control(1),
      I3 => count_reg(2),
      I4 => control(0),
      I5 => s00_axis_tdata(2),
      O => m00_axis_tdata(2)
    );
\m00_axis_tdata[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF11100000"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => control(1),
      I3 => count_reg(3),
      I4 => control(0),
      I5 => s00_axis_tdata(3),
      O => m00_axis_tdata(3)
    );
\m00_axis_tdata[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF11100000"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => control(1),
      I3 => count_reg(4),
      I4 => control(0),
      I5 => s00_axis_tdata(4),
      O => m00_axis_tdata(4)
    );
\m00_axis_tdata[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF11100000"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => control(1),
      I3 => count_reg(5),
      I4 => control(0),
      I5 => s00_axis_tdata(5),
      O => m00_axis_tdata(5)
    );
\m00_axis_tdata[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF11100000"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => control(1),
      I3 => count_reg(6),
      I4 => control(0),
      I5 => s00_axis_tdata(6),
      O => m00_axis_tdata(6)
    );
\m00_axis_tdata[7]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF11100000"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => control(1),
      I3 => count_reg(7),
      I4 => control(0),
      I5 => s00_axis_tdata(7),
      O => m00_axis_tdata(7)
    );
\m00_axis_tdata[8]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF11100000"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => control(1),
      I3 => count_reg(8),
      I4 => control(0),
      I5 => s00_axis_tdata(8),
      O => m00_axis_tdata(8)
    );
\m00_axis_tdata[9]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF11100000"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => control(1),
      I3 => count_reg(9),
      I4 => control(0),
      I5 => s00_axis_tdata(9),
      O => m00_axis_tdata(9)
    );
tlast_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => count1,
      I1 => s00_axis_tvalid,
      I2 => s00_axis_aresetn,
      O => tlast_reg_i_1_n_0
    );
tlast_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => '1',
      D => tlast_reg_i_1_n_0,
      Q => m00_axis_tlast,
      R => '0'
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
  attribute X_INTERFACE_PARAMETER of m00_axis_aclk : signal is "XIL_INTERFACENAME M00_AXIS_CLK, ASSOCIATED_BUSIF M00_AXIS, ASSOCIATED_RESET m00_axis_aresetn, FREQ_HZ 147456000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_0_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m00_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 M00_AXIS_RST RST";
  attribute X_INTERFACE_MODE of m00_axis_aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of m00_axis_aresetn : signal is "XIL_INTERFACENAME M00_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m00_axis_tlast : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TLAST";
  attribute X_INTERFACE_INFO of m00_axis_tready : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TREADY";
  attribute X_INTERFACE_INFO of m00_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TVALID";
  attribute X_INTERFACE_MODE of m00_axis_tvalid : signal is "master";
  attribute X_INTERFACE_PARAMETER of m00_axis_tvalid : signal is "XIL_INTERFACENAME M00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 147456000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axis_aclk : signal is "xilinx.com:signal:clock:1.0 S00_AXIS_CLK CLK";
  attribute X_INTERFACE_MODE of s00_axis_aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s00_axis_aclk : signal is "XIL_INTERFACENAME S00_AXIS_CLK, ASSOCIATED_BUSIF S00_AXIS, ASSOCIATED_RESET s00_axis_aresetn, FREQ_HZ 147456000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_0_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 S00_AXIS_RST RST";
  attribute X_INTERFACE_MODE of s00_axis_aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s00_axis_aresetn : signal is "XIL_INTERFACENAME S00_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axis_tlast : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TLAST";
  attribute X_INTERFACE_INFO of s00_axis_tready : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TREADY";
  attribute X_INTERFACE_MODE of s00_axis_tready : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s00_axis_tready : signal is "XIL_INTERFACENAME S00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 147456000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TVALID";
  attribute X_INTERFACE_INFO of s01_axis_aclk : signal is "xilinx.com:signal:clock:1.0 S01_AXIS_CLK CLK";
  attribute X_INTERFACE_MODE of s01_axis_aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s01_axis_aclk : signal is "XIL_INTERFACENAME S01_AXIS_CLK, ASSOCIATED_BUSIF S01_AXIS, ASSOCIATED_RESET s01_axis_aresetn, FREQ_HZ 147456000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_0_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s01_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 S01_AXIS_RST RST";
  attribute X_INTERFACE_MODE of s01_axis_aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s01_axis_aresetn : signal is "XIL_INTERFACENAME S01_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s01_axis_tlast : signal is "xilinx.com:interface:axis:1.0 S01_AXIS TLAST";
  attribute X_INTERFACE_INFO of s01_axis_tready : signal is "xilinx.com:interface:axis:1.0 S01_AXIS TREADY";
  attribute X_INTERFACE_MODE of s01_axis_tready : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s01_axis_tready : signal is "XIL_INTERFACENAME S01_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 147456000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s01_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 S01_AXIS TVALID";
  attribute X_INTERFACE_INFO of m00_axis_tdata : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TDATA";
  attribute X_INTERFACE_INFO of m00_axis_tstrb : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TSTRB";
  attribute X_INTERFACE_INFO of s00_axis_tdata : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TDATA";
  attribute X_INTERFACE_INFO of s00_axis_tstrb : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TSTRB";
  attribute X_INTERFACE_INFO of s01_axis_tdata : signal is "xilinx.com:interface:axis:1.0 S01_AXIS TDATA";
  attribute X_INTERFACE_INFO of s01_axis_tstrb : signal is "xilinx.com:interface:axis:1.0 S01_AXIS TSTRB";
begin
  \^s00_axis_tvalid\ <= s00_axis_tvalid;
  m00_axis_tstrb(3) <= \<const0>\;
  m00_axis_tstrb(2) <= \<const0>\;
  m00_axis_tstrb(1) <= \<const0>\;
  m00_axis_tstrb(0) <= \<const0>\;
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
      s00_axis_aclk => s00_axis_aclk,
      s00_axis_aresetn => s00_axis_aresetn,
      s00_axis_tdata(15 downto 0) => s00_axis_tdata(15 downto 0),
      s00_axis_tvalid => \^s00_axis_tvalid\,
      s01_axis_tdata(2 downto 0) => s01_axis_tdata(2 downto 0)
    );
\m00_axis_tdata[19]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0F0"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => s01_axis_tdata(3),
      I3 => control(0),
      O => m00_axis_tdata(19)
    );
\m00_axis_tdata[20]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0F0"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => s01_axis_tdata(4),
      I3 => control(0),
      O => m00_axis_tdata(20)
    );
\m00_axis_tdata[21]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0F0"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => s01_axis_tdata(5),
      I3 => control(0),
      O => m00_axis_tdata(21)
    );
\m00_axis_tdata[22]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0F0"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => s01_axis_tdata(6),
      I3 => control(0),
      O => m00_axis_tdata(22)
    );
\m00_axis_tdata[23]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0F0"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => s01_axis_tdata(7),
      I3 => control(0),
      O => m00_axis_tdata(23)
    );
\m00_axis_tdata[24]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0F0"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => s01_axis_tdata(8),
      I3 => control(0),
      O => m00_axis_tdata(24)
    );
\m00_axis_tdata[25]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0F0"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => s01_axis_tdata(9),
      I3 => control(0),
      O => m00_axis_tdata(25)
    );
\m00_axis_tdata[26]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0F0"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => s01_axis_tdata(10),
      I3 => control(0),
      O => m00_axis_tdata(26)
    );
\m00_axis_tdata[27]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0F0"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => s01_axis_tdata(11),
      I3 => control(0),
      O => m00_axis_tdata(27)
    );
\m00_axis_tdata[28]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0F0"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => s01_axis_tdata(12),
      I3 => control(0),
      O => m00_axis_tdata(28)
    );
\m00_axis_tdata[29]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0F0"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => s01_axis_tdata(13),
      I3 => control(0),
      O => m00_axis_tdata(29)
    );
\m00_axis_tdata[30]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0F0"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => s01_axis_tdata(14),
      I3 => control(0),
      O => m00_axis_tdata(30)
    );
\m00_axis_tdata[31]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0F0"
    )
        port map (
      I0 => control(3),
      I1 => control(2),
      I2 => s01_axis_tdata(15),
      I3 => control(0),
      O => m00_axis_tdata(31)
    );
end STRUCTURE;
