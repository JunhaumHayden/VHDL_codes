-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "05/29/2025 09:37:51"

-- 
-- Device: Altera EP2C5AF256A7 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	sad IS
    PORT (
	clk : IN std_logic;
	rst_a : IN std_logic;
	enable : IN std_logic;
	sample_ori : IN std_logic_vector(7 DOWNTO 0);
	sample_can : IN std_logic_vector(7 DOWNTO 0);
	read_mem : OUT std_logic;
	address : OUT std_logic_vector(5 DOWNTO 0);
	sad_value : OUT std_logic_vector(13 DOWNTO 0);
	done : OUT std_logic
	);
END sad;

-- Design Ports Information
-- read_mem	=>  Location: PIN_E16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- address[0]	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- address[1]	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- address[2]	=>  Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- address[3]	=>  Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- address[4]	=>  Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- address[5]	=>  Location: PIN_F9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[0]	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[1]	=>  Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[2]	=>  Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[3]	=>  Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[4]	=>  Location: PIN_A12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[5]	=>  Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[6]	=>  Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[7]	=>  Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[8]	=>  Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[9]	=>  Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[10]	=>  Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[11]	=>  Location: PIN_G10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[12]	=>  Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[13]	=>  Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- done	=>  Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clk	=>  Location: PIN_H2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- rst_a	=>  Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- enable	=>  Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_can[0]	=>  Location: PIN_E14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_ori[0]	=>  Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_can[7]	=>  Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_ori[7]	=>  Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_can[6]	=>  Location: PIN_J11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_ori[6]	=>  Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_can[5]	=>  Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_ori[5]	=>  Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_can[4]	=>  Location: PIN_J12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_ori[4]	=>  Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_can[3]	=>  Location: PIN_C14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_ori[3]	=>  Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_can[2]	=>  Location: PIN_H13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_ori[2]	=>  Location: PIN_G13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_can[1]	=>  Location: PIN_J16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_ori[1]	=>  Location: PIN_J15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF sad IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst_a : std_logic;
SIGNAL ww_enable : std_logic;
SIGNAL ww_sample_ori : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_sample_can : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_read_mem : std_logic;
SIGNAL ww_address : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_sad_value : std_logic_vector(13 DOWNTO 0);
SIGNAL ww_done : std_logic;
SIGNAL \rst_a~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \bo_inst|sub1_inst|sub_ba|Add0~0_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ab|difference[1]~2_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ba|Add0~3_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ba|Add0~6_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ba|Add0~15_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ba|Add0~18_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ba|Add0~5_combout\ : std_logic;
SIGNAL \bo_inst|reg2_inst|q[0]~feeder_combout\ : std_logic;
SIGNAL \bo_inst|reg3_inst|q[5]~feeder_combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \bo_inst|reg1_inst|q[0]~7_combout\ : std_logic;
SIGNAL \bo_inst|reg1_inst|q[0]~8\ : std_logic;
SIGNAL \bo_inst|reg1_inst|q[1]~9_combout\ : std_logic;
SIGNAL \bo_inst|reg1_inst|q[1]~10\ : std_logic;
SIGNAL \bo_inst|reg1_inst|q[2]~11_combout\ : std_logic;
SIGNAL \bo_inst|reg1_inst|q[2]~12\ : std_logic;
SIGNAL \bo_inst|reg1_inst|q[3]~14\ : std_logic;
SIGNAL \bo_inst|reg1_inst|q[4]~15_combout\ : std_logic;
SIGNAL \bo_inst|reg1_inst|q[4]~16\ : std_logic;
SIGNAL \bo_inst|reg1_inst|q[5]~18\ : std_logic;
SIGNAL \bo_inst|reg1_inst|q[6]~19_combout\ : std_logic;
SIGNAL \bc_inst|next_state.S5~0_combout\ : std_logic;
SIGNAL \rst_a~combout\ : std_logic;
SIGNAL \rst_a~clkctrl_outclk\ : std_logic;
SIGNAL \bc_inst|state.S5~regout\ : std_logic;
SIGNAL \enable~combout\ : std_logic;
SIGNAL \bc_inst|Selector0~0_combout\ : std_logic;
SIGNAL \bc_inst|state.S0~regout\ : std_logic;
SIGNAL \bc_inst|next_state.S1~0_combout\ : std_logic;
SIGNAL \bc_inst|state.S1~regout\ : std_logic;
SIGNAL \bc_inst|state.S4~feeder_combout\ : std_logic;
SIGNAL \bc_inst|state.S4~regout\ : std_logic;
SIGNAL \bc_inst|next_state.S2~combout\ : std_logic;
SIGNAL \bc_inst|state.S2~feeder_combout\ : std_logic;
SIGNAL \bc_inst|state.S2~regout\ : std_logic;
SIGNAL \bc_inst|next_state.S3~0_combout\ : std_logic;
SIGNAL \bc_inst|state.S3~regout\ : std_logic;
SIGNAL \bo_inst|reg1_inst|q[3]~13_combout\ : std_logic;
SIGNAL \bo_inst|reg1_inst|q[5]~17_combout\ : std_logic;
SIGNAL \bo_inst|reg3_inst|q[0]~feeder_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ab|difference[0]~0_combout\ : std_logic;
SIGNAL \bo_inst|reg3_inst|q[3]~feeder_combout\ : std_logic;
SIGNAL \bo_inst|reg3_inst|q[2]~feeder_combout\ : std_logic;
SIGNAL \bo_inst|reg2_inst|q[1]~feeder_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ab|difference[0]~1\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ab|difference[1]~3\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ab|difference[2]~5\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ab|difference[3]~7\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ab|difference[4]~9\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ab|difference[5]~11\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ab|difference[6]~13\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ab|difference[7]~15\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ba|Add0~2_combout\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[0]~14_combout\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[0]~15\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[1]~16_combout\ : std_logic;
SIGNAL \bo_inst|reg5_inst|q[1]~feeder_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ab|difference[2]~4_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ba|Add0~8_combout\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[1]~17\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[2]~18_combout\ : std_logic;
SIGNAL \bo_inst|reg5_inst|q[2]~feeder_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ab|difference[3]~6_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ba|Add0~1\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ba|Add0~4\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ba|Add0~7\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ba|Add0~9_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ba|Add0~11_combout\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[2]~19\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[3]~20_combout\ : std_logic;
SIGNAL \bo_inst|reg5_inst|q[3]~feeder_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ab|difference[4]~8_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ba|Add0~10\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ba|Add0~12_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ba|Add0~14_combout\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[3]~21\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[4]~22_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ab|difference[5]~10_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ba|Add0~17_combout\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[4]~23\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[5]~24_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ab|difference[6]~12_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ba|Add0~20_combout\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[5]~25\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[6]~26_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ab|difference[7]~14_combout\ : std_logic;
SIGNAL \bo_inst|reg2_inst|q[7]~feeder_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ba|Add0~13\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ba|Add0~16\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ba|Add0~19\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ba|Add0~21_combout\ : std_logic;
SIGNAL \bo_inst|sub1_inst|sub_ba|Add0~23_combout\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[6]~27\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[7]~28_combout\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[7]~29\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[8]~30_combout\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[8]~31\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[9]~32_combout\ : std_logic;
SIGNAL \bo_inst|reg5_inst|q[9]~feeder_combout\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[9]~33\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[10]~34_combout\ : std_logic;
SIGNAL \bo_inst|reg5_inst|q[10]~feeder_combout\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[10]~35\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[11]~36_combout\ : std_logic;
SIGNAL \bo_inst|reg5_inst|q[11]~feeder_combout\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[11]~37\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[12]~38_combout\ : std_logic;
SIGNAL \bo_inst|reg5_inst|q[12]~feeder_combout\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[12]~39\ : std_logic;
SIGNAL \bo_inst|reg4_inst|q[13]~40_combout\ : std_logic;
SIGNAL \bo_inst|reg3_inst|q\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \bo_inst|reg4_inst|q\ : std_logic_vector(13 DOWNTO 0);
SIGNAL \bo_inst|reg5_inst|q\ : std_logic_vector(13 DOWNTO 0);
SIGNAL \bo_inst|reg1_inst|q\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \bo_inst|reg2_inst|q\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \sample_ori~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \sample_can~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \bc_inst|ALT_INV_state.S0~regout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_rst_a <= rst_a;
ww_enable <= enable;
ww_sample_ori <= sample_ori;
ww_sample_can <= sample_can;
read_mem <= ww_read_mem;
address <= ww_address;
sad_value <= ww_sad_value;
done <= ww_done;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\rst_a~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \rst_a~combout\);

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);
\bc_inst|ALT_INV_state.S0~regout\ <= NOT \bc_inst|state.S0~regout\;

-- Location: LCCOMB_X27_Y12_N0
\bo_inst|sub1_inst|sub_ba|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ba|Add0~0_combout\ = (\bo_inst|reg2_inst|q\(0) & (\bo_inst|reg3_inst|q\(0) $ (VCC))) # (!\bo_inst|reg2_inst|q\(0) & ((\bo_inst|reg3_inst|q\(0)) # (GND)))
-- \bo_inst|sub1_inst|sub_ba|Add0~1\ = CARRY((\bo_inst|reg3_inst|q\(0)) # (!\bo_inst|reg2_inst|q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg2_inst|q\(0),
	datab => \bo_inst|reg3_inst|q\(0),
	datad => VCC,
	combout => \bo_inst|sub1_inst|sub_ba|Add0~0_combout\,
	cout => \bo_inst|sub1_inst|sub_ba|Add0~1\);

-- Location: LCCOMB_X26_Y12_N6
\bo_inst|sub1_inst|sub_ab|difference[1]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ab|difference[1]~2_combout\ = (\bo_inst|reg3_inst|q\(1) & ((\bo_inst|reg2_inst|q\(1) & (!\bo_inst|sub1_inst|sub_ab|difference[0]~1\)) # (!\bo_inst|reg2_inst|q\(1) & ((\bo_inst|sub1_inst|sub_ab|difference[0]~1\) # (GND))))) # 
-- (!\bo_inst|reg3_inst|q\(1) & ((\bo_inst|reg2_inst|q\(1) & (\bo_inst|sub1_inst|sub_ab|difference[0]~1\ & VCC)) # (!\bo_inst|reg2_inst|q\(1) & (!\bo_inst|sub1_inst|sub_ab|difference[0]~1\))))
-- \bo_inst|sub1_inst|sub_ab|difference[1]~3\ = CARRY((\bo_inst|reg3_inst|q\(1) & ((!\bo_inst|sub1_inst|sub_ab|difference[0]~1\) # (!\bo_inst|reg2_inst|q\(1)))) # (!\bo_inst|reg3_inst|q\(1) & (!\bo_inst|reg2_inst|q\(1) & 
-- !\bo_inst|sub1_inst|sub_ab|difference[0]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg3_inst|q\(1),
	datab => \bo_inst|reg2_inst|q\(1),
	datad => VCC,
	cin => \bo_inst|sub1_inst|sub_ab|difference[0]~1\,
	combout => \bo_inst|sub1_inst|sub_ab|difference[1]~2_combout\,
	cout => \bo_inst|sub1_inst|sub_ab|difference[1]~3\);

-- Location: LCCOMB_X27_Y12_N2
\bo_inst|sub1_inst|sub_ba|Add0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ba|Add0~3_combout\ = (\bo_inst|reg3_inst|q\(1) & ((\bo_inst|reg2_inst|q\(1) & (!\bo_inst|sub1_inst|sub_ba|Add0~1\)) # (!\bo_inst|reg2_inst|q\(1) & (\bo_inst|sub1_inst|sub_ba|Add0~1\ & VCC)))) # (!\bo_inst|reg3_inst|q\(1) & 
-- ((\bo_inst|reg2_inst|q\(1) & ((\bo_inst|sub1_inst|sub_ba|Add0~1\) # (GND))) # (!\bo_inst|reg2_inst|q\(1) & (!\bo_inst|sub1_inst|sub_ba|Add0~1\))))
-- \bo_inst|sub1_inst|sub_ba|Add0~4\ = CARRY((\bo_inst|reg3_inst|q\(1) & (\bo_inst|reg2_inst|q\(1) & !\bo_inst|sub1_inst|sub_ba|Add0~1\)) # (!\bo_inst|reg3_inst|q\(1) & ((\bo_inst|reg2_inst|q\(1)) # (!\bo_inst|sub1_inst|sub_ba|Add0~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg3_inst|q\(1),
	datab => \bo_inst|reg2_inst|q\(1),
	datad => VCC,
	cin => \bo_inst|sub1_inst|sub_ba|Add0~1\,
	combout => \bo_inst|sub1_inst|sub_ba|Add0~3_combout\,
	cout => \bo_inst|sub1_inst|sub_ba|Add0~4\);

-- Location: LCCOMB_X27_Y12_N4
\bo_inst|sub1_inst|sub_ba|Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ba|Add0~6_combout\ = ((\bo_inst|reg3_inst|q\(2) $ (\bo_inst|reg2_inst|q\(2) $ (\bo_inst|sub1_inst|sub_ba|Add0~4\)))) # (GND)
-- \bo_inst|sub1_inst|sub_ba|Add0~7\ = CARRY((\bo_inst|reg3_inst|q\(2) & ((!\bo_inst|sub1_inst|sub_ba|Add0~4\) # (!\bo_inst|reg2_inst|q\(2)))) # (!\bo_inst|reg3_inst|q\(2) & (!\bo_inst|reg2_inst|q\(2) & !\bo_inst|sub1_inst|sub_ba|Add0~4\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg3_inst|q\(2),
	datab => \bo_inst|reg2_inst|q\(2),
	datad => VCC,
	cin => \bo_inst|sub1_inst|sub_ba|Add0~4\,
	combout => \bo_inst|sub1_inst|sub_ba|Add0~6_combout\,
	cout => \bo_inst|sub1_inst|sub_ba|Add0~7\);

-- Location: LCCOMB_X27_Y12_N10
\bo_inst|sub1_inst|sub_ba|Add0~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ba|Add0~15_combout\ = (\bo_inst|reg3_inst|q\(5) & ((\bo_inst|reg2_inst|q\(5) & (!\bo_inst|sub1_inst|sub_ba|Add0~13\)) # (!\bo_inst|reg2_inst|q\(5) & (\bo_inst|sub1_inst|sub_ba|Add0~13\ & VCC)))) # (!\bo_inst|reg3_inst|q\(5) & 
-- ((\bo_inst|reg2_inst|q\(5) & ((\bo_inst|sub1_inst|sub_ba|Add0~13\) # (GND))) # (!\bo_inst|reg2_inst|q\(5) & (!\bo_inst|sub1_inst|sub_ba|Add0~13\))))
-- \bo_inst|sub1_inst|sub_ba|Add0~16\ = CARRY((\bo_inst|reg3_inst|q\(5) & (\bo_inst|reg2_inst|q\(5) & !\bo_inst|sub1_inst|sub_ba|Add0~13\)) # (!\bo_inst|reg3_inst|q\(5) & ((\bo_inst|reg2_inst|q\(5)) # (!\bo_inst|sub1_inst|sub_ba|Add0~13\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg3_inst|q\(5),
	datab => \bo_inst|reg2_inst|q\(5),
	datad => VCC,
	cin => \bo_inst|sub1_inst|sub_ba|Add0~13\,
	combout => \bo_inst|sub1_inst|sub_ba|Add0~15_combout\,
	cout => \bo_inst|sub1_inst|sub_ba|Add0~16\);

-- Location: LCCOMB_X27_Y12_N12
\bo_inst|sub1_inst|sub_ba|Add0~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ba|Add0~18_combout\ = ((\bo_inst|reg3_inst|q\(6) $ (\bo_inst|reg2_inst|q\(6) $ (\bo_inst|sub1_inst|sub_ba|Add0~16\)))) # (GND)
-- \bo_inst|sub1_inst|sub_ba|Add0~19\ = CARRY((\bo_inst|reg3_inst|q\(6) & ((!\bo_inst|sub1_inst|sub_ba|Add0~16\) # (!\bo_inst|reg2_inst|q\(6)))) # (!\bo_inst|reg3_inst|q\(6) & (!\bo_inst|reg2_inst|q\(6) & !\bo_inst|sub1_inst|sub_ba|Add0~16\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg3_inst|q\(6),
	datab => \bo_inst|reg2_inst|q\(6),
	datad => VCC,
	cin => \bo_inst|sub1_inst|sub_ba|Add0~16\,
	combout => \bo_inst|sub1_inst|sub_ba|Add0~18_combout\,
	cout => \bo_inst|sub1_inst|sub_ba|Add0~19\);

-- Location: LCFF_X26_Y12_N1
\bo_inst|reg2_inst|q[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg2_inst|q[0]~feeder_combout\,
	ena => \bc_inst|state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg2_inst|q\(0));

-- Location: LCFF_X27_Y12_N27
\bo_inst|reg3_inst|q[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg3_inst|q[5]~feeder_combout\,
	ena => \bc_inst|state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg3_inst|q\(5));

-- Location: LCFF_X26_Y12_N13
\bo_inst|reg2_inst|q[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_ori~combout\(4),
	sload => VCC,
	ena => \bc_inst|state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg2_inst|q\(4));

-- Location: LCFF_X26_Y12_N11
\bo_inst|reg2_inst|q[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_ori~combout\(3),
	sload => VCC,
	ena => \bc_inst|state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg2_inst|q\(3));

-- Location: LCFF_X27_Y12_N17
\bo_inst|reg3_inst|q[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_can~combout\(1),
	sload => VCC,
	ena => \bc_inst|state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg3_inst|q\(1));

-- Location: LCCOMB_X26_Y12_N26
\bo_inst|sub1_inst|sub_ba|Add0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ba|Add0~5_combout\ = (\bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\ & (\bo_inst|sub1_inst|sub_ba|Add0~3_combout\)) # (!\bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\ & 
-- ((\bo_inst|sub1_inst|sub_ab|difference[1]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|sub1_inst|sub_ba|Add0~3_combout\,
	datab => \bo_inst|sub1_inst|sub_ab|difference[1]~2_combout\,
	datad => \bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\,
	combout => \bo_inst|sub1_inst|sub_ba|Add0~5_combout\);

-- Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_ori[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_ori(0),
	combout => \sample_ori~combout\(0));

-- Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_can[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_can(5),
	combout => \sample_can~combout\(5));

-- Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_ori[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_ori(4),
	combout => \sample_ori~combout\(4));

-- Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_ori[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_ori(3),
	combout => \sample_ori~combout\(3));

-- Location: PIN_J16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_can[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_can(1),
	combout => \sample_can~combout\(1));

-- Location: LCCOMB_X26_Y12_N0
\bo_inst|reg2_inst|q[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg2_inst|q[0]~feeder_combout\ = \sample_ori~combout\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sample_ori~combout\(0),
	combout => \bo_inst|reg2_inst|q[0]~feeder_combout\);

-- Location: LCCOMB_X27_Y12_N26
\bo_inst|reg3_inst|q[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg3_inst|q[5]~feeder_combout\ = \sample_can~combout\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sample_can~combout\(5),
	combout => \bo_inst|reg3_inst|q[5]~feeder_combout\);

-- Location: PIN_H2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G2
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: LCCOMB_X18_Y12_N0
\bo_inst|reg1_inst|q[0]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg1_inst|q[0]~7_combout\ = \bo_inst|reg1_inst|q\(0) $ (VCC)
-- \bo_inst|reg1_inst|q[0]~8\ = CARRY(\bo_inst|reg1_inst|q\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bo_inst|reg1_inst|q\(0),
	datad => VCC,
	combout => \bo_inst|reg1_inst|q[0]~7_combout\,
	cout => \bo_inst|reg1_inst|q[0]~8\);

-- Location: LCFF_X18_Y12_N1
\bo_inst|reg1_inst|q[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg1_inst|q[0]~7_combout\,
	sclr => \bc_inst|state.S1~regout\,
	ena => \bc_inst|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg1_inst|q\(0));

-- Location: LCCOMB_X18_Y12_N2
\bo_inst|reg1_inst|q[1]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg1_inst|q[1]~9_combout\ = (\bo_inst|reg1_inst|q\(1) & (!\bo_inst|reg1_inst|q[0]~8\)) # (!\bo_inst|reg1_inst|q\(1) & ((\bo_inst|reg1_inst|q[0]~8\) # (GND)))
-- \bo_inst|reg1_inst|q[1]~10\ = CARRY((!\bo_inst|reg1_inst|q[0]~8\) # (!\bo_inst|reg1_inst|q\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bo_inst|reg1_inst|q\(1),
	datad => VCC,
	cin => \bo_inst|reg1_inst|q[0]~8\,
	combout => \bo_inst|reg1_inst|q[1]~9_combout\,
	cout => \bo_inst|reg1_inst|q[1]~10\);

-- Location: LCFF_X18_Y12_N3
\bo_inst|reg1_inst|q[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg1_inst|q[1]~9_combout\,
	sclr => \bc_inst|state.S1~regout\,
	ena => \bc_inst|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg1_inst|q\(1));

-- Location: LCCOMB_X18_Y12_N4
\bo_inst|reg1_inst|q[2]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg1_inst|q[2]~11_combout\ = (\bo_inst|reg1_inst|q\(2) & (\bo_inst|reg1_inst|q[1]~10\ $ (GND))) # (!\bo_inst|reg1_inst|q\(2) & (!\bo_inst|reg1_inst|q[1]~10\ & VCC))
-- \bo_inst|reg1_inst|q[2]~12\ = CARRY((\bo_inst|reg1_inst|q\(2) & !\bo_inst|reg1_inst|q[1]~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bo_inst|reg1_inst|q\(2),
	datad => VCC,
	cin => \bo_inst|reg1_inst|q[1]~10\,
	combout => \bo_inst|reg1_inst|q[2]~11_combout\,
	cout => \bo_inst|reg1_inst|q[2]~12\);

-- Location: LCFF_X18_Y12_N5
\bo_inst|reg1_inst|q[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg1_inst|q[2]~11_combout\,
	sclr => \bc_inst|state.S1~regout\,
	ena => \bc_inst|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg1_inst|q\(2));

-- Location: LCCOMB_X18_Y12_N6
\bo_inst|reg1_inst|q[3]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg1_inst|q[3]~13_combout\ = (\bo_inst|reg1_inst|q\(3) & (!\bo_inst|reg1_inst|q[2]~12\)) # (!\bo_inst|reg1_inst|q\(3) & ((\bo_inst|reg1_inst|q[2]~12\) # (GND)))
-- \bo_inst|reg1_inst|q[3]~14\ = CARRY((!\bo_inst|reg1_inst|q[2]~12\) # (!\bo_inst|reg1_inst|q\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg1_inst|q\(3),
	datad => VCC,
	cin => \bo_inst|reg1_inst|q[2]~12\,
	combout => \bo_inst|reg1_inst|q[3]~13_combout\,
	cout => \bo_inst|reg1_inst|q[3]~14\);

-- Location: LCCOMB_X18_Y12_N8
\bo_inst|reg1_inst|q[4]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg1_inst|q[4]~15_combout\ = (\bo_inst|reg1_inst|q\(4) & (\bo_inst|reg1_inst|q[3]~14\ $ (GND))) # (!\bo_inst|reg1_inst|q\(4) & (!\bo_inst|reg1_inst|q[3]~14\ & VCC))
-- \bo_inst|reg1_inst|q[4]~16\ = CARRY((\bo_inst|reg1_inst|q\(4) & !\bo_inst|reg1_inst|q[3]~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bo_inst|reg1_inst|q\(4),
	datad => VCC,
	cin => \bo_inst|reg1_inst|q[3]~14\,
	combout => \bo_inst|reg1_inst|q[4]~15_combout\,
	cout => \bo_inst|reg1_inst|q[4]~16\);

-- Location: LCFF_X18_Y12_N9
\bo_inst|reg1_inst|q[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg1_inst|q[4]~15_combout\,
	sclr => \bc_inst|state.S1~regout\,
	ena => \bc_inst|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg1_inst|q\(4));

-- Location: LCCOMB_X18_Y12_N10
\bo_inst|reg1_inst|q[5]~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg1_inst|q[5]~17_combout\ = (\bo_inst|reg1_inst|q\(5) & (!\bo_inst|reg1_inst|q[4]~16\)) # (!\bo_inst|reg1_inst|q\(5) & ((\bo_inst|reg1_inst|q[4]~16\) # (GND)))
-- \bo_inst|reg1_inst|q[5]~18\ = CARRY((!\bo_inst|reg1_inst|q[4]~16\) # (!\bo_inst|reg1_inst|q\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg1_inst|q\(5),
	datad => VCC,
	cin => \bo_inst|reg1_inst|q[4]~16\,
	combout => \bo_inst|reg1_inst|q[5]~17_combout\,
	cout => \bo_inst|reg1_inst|q[5]~18\);

-- Location: LCCOMB_X18_Y12_N12
\bo_inst|reg1_inst|q[6]~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg1_inst|q[6]~19_combout\ = !\bo_inst|reg1_inst|q[5]~18\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \bo_inst|reg1_inst|q[5]~18\,
	combout => \bo_inst|reg1_inst|q[6]~19_combout\);

-- Location: LCFF_X18_Y12_N13
\bo_inst|reg1_inst|q[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg1_inst|q[6]~19_combout\,
	sclr => \bc_inst|state.S1~regout\,
	ena => \bc_inst|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg1_inst|q\(6));

-- Location: LCCOMB_X18_Y12_N18
\bc_inst|next_state.S5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \bc_inst|next_state.S5~0_combout\ = (\bc_inst|state.S2~regout\ & \bo_inst|reg1_inst|q\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bc_inst|state.S2~regout\,
	datad => \bo_inst|reg1_inst|q\(6),
	combout => \bc_inst|next_state.S5~0_combout\);

-- Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\rst_a~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_rst_a,
	combout => \rst_a~combout\);

-- Location: CLKCTRL_G1
\rst_a~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rst_a~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rst_a~clkctrl_outclk\);

-- Location: LCFF_X18_Y12_N19
\bc_inst|state.S5\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bc_inst|next_state.S5~0_combout\,
	aclr => \rst_a~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bc_inst|state.S5~regout\);

-- Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\enable~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_enable,
	combout => \enable~combout\);

-- Location: LCCOMB_X18_Y12_N28
\bc_inst|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \bc_inst|Selector0~0_combout\ = (!\bc_inst|state.S5~regout\ & ((\bc_inst|state.S0~regout\) # (\enable~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bc_inst|state.S5~regout\,
	datac => \bc_inst|state.S0~regout\,
	datad => \enable~combout\,
	combout => \bc_inst|Selector0~0_combout\);

-- Location: LCFF_X18_Y12_N29
\bc_inst|state.S0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bc_inst|Selector0~0_combout\,
	aclr => \rst_a~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bc_inst|state.S0~regout\);

-- Location: LCCOMB_X18_Y12_N20
\bc_inst|next_state.S1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \bc_inst|next_state.S1~0_combout\ = (!\bc_inst|state.S0~regout\ & \enable~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bc_inst|state.S0~regout\,
	datad => \enable~combout\,
	combout => \bc_inst|next_state.S1~0_combout\);

-- Location: LCFF_X18_Y12_N21
\bc_inst|state.S1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bc_inst|next_state.S1~0_combout\,
	aclr => \rst_a~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bc_inst|state.S1~regout\);

-- Location: LCCOMB_X18_Y12_N22
\bc_inst|state.S4~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \bc_inst|state.S4~feeder_combout\ = \bc_inst|state.S3~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bc_inst|state.S3~regout\,
	combout => \bc_inst|state.S4~feeder_combout\);

-- Location: LCFF_X18_Y12_N23
\bc_inst|state.S4\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bc_inst|state.S4~feeder_combout\,
	aclr => \rst_a~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bc_inst|state.S4~regout\);

-- Location: LCCOMB_X18_Y12_N24
\bc_inst|next_state.S2\ : cycloneii_lcell_comb
-- Equation(s):
-- \bc_inst|next_state.S2~combout\ = (\bc_inst|state.S1~regout\) # (\bc_inst|state.S4~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bc_inst|state.S1~regout\,
	datad => \bc_inst|state.S4~regout\,
	combout => \bc_inst|next_state.S2~combout\);

-- Location: LCCOMB_X18_Y12_N30
\bc_inst|state.S2~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \bc_inst|state.S2~feeder_combout\ = \bc_inst|next_state.S2~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bc_inst|next_state.S2~combout\,
	combout => \bc_inst|state.S2~feeder_combout\);

-- Location: LCFF_X18_Y12_N31
\bc_inst|state.S2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bc_inst|state.S2~feeder_combout\,
	aclr => \rst_a~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bc_inst|state.S2~regout\);

-- Location: LCCOMB_X18_Y12_N26
\bc_inst|next_state.S3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \bc_inst|next_state.S3~0_combout\ = (\bc_inst|state.S2~regout\ & !\bo_inst|reg1_inst|q\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bc_inst|state.S2~regout\,
	datad => \bo_inst|reg1_inst|q\(6),
	combout => \bc_inst|next_state.S3~0_combout\);

-- Location: LCFF_X18_Y12_N27
\bc_inst|state.S3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bc_inst|next_state.S3~0_combout\,
	aclr => \rst_a~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bc_inst|state.S3~regout\);

-- Location: LCFF_X18_Y12_N7
\bo_inst|reg1_inst|q[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg1_inst|q[3]~13_combout\,
	sclr => \bc_inst|state.S1~regout\,
	ena => \bc_inst|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg1_inst|q\(3));

-- Location: LCFF_X18_Y12_N11
\bo_inst|reg1_inst|q[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg1_inst|q[5]~17_combout\,
	sclr => \bc_inst|state.S1~regout\,
	ena => \bc_inst|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg1_inst|q\(5));

-- Location: PIN_E14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_can[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_can(0),
	combout => \sample_can~combout\(0));

-- Location: LCCOMB_X27_Y12_N28
\bo_inst|reg3_inst|q[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg3_inst|q[0]~feeder_combout\ = \sample_can~combout\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sample_can~combout\(0),
	combout => \bo_inst|reg3_inst|q[0]~feeder_combout\);

-- Location: LCFF_X27_Y12_N29
\bo_inst|reg3_inst|q[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg3_inst|q[0]~feeder_combout\,
	ena => \bc_inst|state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg3_inst|q\(0));

-- Location: LCCOMB_X26_Y12_N4
\bo_inst|sub1_inst|sub_ab|difference[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ab|difference[0]~0_combout\ = (\bo_inst|reg2_inst|q\(0) & ((GND) # (!\bo_inst|reg3_inst|q\(0)))) # (!\bo_inst|reg2_inst|q\(0) & (\bo_inst|reg3_inst|q\(0) $ (GND)))
-- \bo_inst|sub1_inst|sub_ab|difference[0]~1\ = CARRY((\bo_inst|reg2_inst|q\(0)) # (!\bo_inst|reg3_inst|q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg2_inst|q\(0),
	datab => \bo_inst|reg3_inst|q\(0),
	datad => VCC,
	combout => \bo_inst|sub1_inst|sub_ab|difference[0]~0_combout\,
	cout => \bo_inst|sub1_inst|sub_ab|difference[0]~1\);

-- Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_can[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_can(7),
	combout => \sample_can~combout\(7));

-- Location: LCFF_X26_Y12_N31
\bo_inst|reg3_inst|q[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_can~combout\(7),
	sload => VCC,
	ena => \bc_inst|state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg3_inst|q\(7));

-- Location: PIN_J11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_can[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_can(6),
	combout => \sample_can~combout\(6));

-- Location: LCFF_X26_Y12_N29
\bo_inst|reg3_inst|q[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_can~combout\(6),
	sload => VCC,
	ena => \bc_inst|state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg3_inst|q\(6));

-- Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_ori[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_ori(5),
	combout => \sample_ori~combout\(5));

-- Location: LCFF_X26_Y12_N5
\bo_inst|reg2_inst|q[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_ori~combout\(5),
	sload => VCC,
	ena => \bc_inst|state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg2_inst|q\(5));

-- Location: PIN_J12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_can[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_can(4),
	combout => \sample_can~combout\(4));

-- Location: LCFF_X26_Y12_N15
\bo_inst|reg3_inst|q[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_can~combout\(4),
	sload => VCC,
	ena => \bc_inst|state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg3_inst|q\(4));

-- Location: PIN_C14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_can[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_can(3),
	combout => \sample_can~combout\(3));

-- Location: LCCOMB_X27_Y12_N20
\bo_inst|reg3_inst|q[3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg3_inst|q[3]~feeder_combout\ = \sample_can~combout\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sample_can~combout\(3),
	combout => \bo_inst|reg3_inst|q[3]~feeder_combout\);

-- Location: LCFF_X27_Y12_N21
\bo_inst|reg3_inst|q[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg3_inst|q[3]~feeder_combout\,
	ena => \bc_inst|state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg3_inst|q\(3));

-- Location: PIN_H13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_can[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_can(2),
	combout => \sample_can~combout\(2));

-- Location: LCCOMB_X27_Y12_N30
\bo_inst|reg3_inst|q[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg3_inst|q[2]~feeder_combout\ = \sample_can~combout\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sample_can~combout\(2),
	combout => \bo_inst|reg3_inst|q[2]~feeder_combout\);

-- Location: LCFF_X27_Y12_N31
\bo_inst|reg3_inst|q[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg3_inst|q[2]~feeder_combout\,
	ena => \bc_inst|state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg3_inst|q\(2));

-- Location: PIN_J15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_ori[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_ori(1),
	combout => \sample_ori~combout\(1));

-- Location: LCCOMB_X26_Y12_N2
\bo_inst|reg2_inst|q[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg2_inst|q[1]~feeder_combout\ = \sample_ori~combout\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sample_ori~combout\(1),
	combout => \bo_inst|reg2_inst|q[1]~feeder_combout\);

-- Location: LCFF_X26_Y12_N3
\bo_inst|reg2_inst|q[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg2_inst|q[1]~feeder_combout\,
	ena => \bc_inst|state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg2_inst|q\(1));

-- Location: LCCOMB_X26_Y12_N8
\bo_inst|sub1_inst|sub_ab|difference[2]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ab|difference[2]~4_combout\ = ((\bo_inst|reg2_inst|q\(2) $ (\bo_inst|reg3_inst|q\(2) $ (\bo_inst|sub1_inst|sub_ab|difference[1]~3\)))) # (GND)
-- \bo_inst|sub1_inst|sub_ab|difference[2]~5\ = CARRY((\bo_inst|reg2_inst|q\(2) & ((!\bo_inst|sub1_inst|sub_ab|difference[1]~3\) # (!\bo_inst|reg3_inst|q\(2)))) # (!\bo_inst|reg2_inst|q\(2) & (!\bo_inst|reg3_inst|q\(2) & 
-- !\bo_inst|sub1_inst|sub_ab|difference[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg2_inst|q\(2),
	datab => \bo_inst|reg3_inst|q\(2),
	datad => VCC,
	cin => \bo_inst|sub1_inst|sub_ab|difference[1]~3\,
	combout => \bo_inst|sub1_inst|sub_ab|difference[2]~4_combout\,
	cout => \bo_inst|sub1_inst|sub_ab|difference[2]~5\);

-- Location: LCCOMB_X26_Y12_N10
\bo_inst|sub1_inst|sub_ab|difference[3]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ab|difference[3]~6_combout\ = (\bo_inst|reg2_inst|q\(3) & ((\bo_inst|reg3_inst|q\(3) & (!\bo_inst|sub1_inst|sub_ab|difference[2]~5\)) # (!\bo_inst|reg3_inst|q\(3) & (\bo_inst|sub1_inst|sub_ab|difference[2]~5\ & VCC)))) # 
-- (!\bo_inst|reg2_inst|q\(3) & ((\bo_inst|reg3_inst|q\(3) & ((\bo_inst|sub1_inst|sub_ab|difference[2]~5\) # (GND))) # (!\bo_inst|reg3_inst|q\(3) & (!\bo_inst|sub1_inst|sub_ab|difference[2]~5\))))
-- \bo_inst|sub1_inst|sub_ab|difference[3]~7\ = CARRY((\bo_inst|reg2_inst|q\(3) & (\bo_inst|reg3_inst|q\(3) & !\bo_inst|sub1_inst|sub_ab|difference[2]~5\)) # (!\bo_inst|reg2_inst|q\(3) & ((\bo_inst|reg3_inst|q\(3)) # 
-- (!\bo_inst|sub1_inst|sub_ab|difference[2]~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg2_inst|q\(3),
	datab => \bo_inst|reg3_inst|q\(3),
	datad => VCC,
	cin => \bo_inst|sub1_inst|sub_ab|difference[2]~5\,
	combout => \bo_inst|sub1_inst|sub_ab|difference[3]~6_combout\,
	cout => \bo_inst|sub1_inst|sub_ab|difference[3]~7\);

-- Location: LCCOMB_X26_Y12_N12
\bo_inst|sub1_inst|sub_ab|difference[4]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ab|difference[4]~8_combout\ = ((\bo_inst|reg2_inst|q\(4) $ (\bo_inst|reg3_inst|q\(4) $ (\bo_inst|sub1_inst|sub_ab|difference[3]~7\)))) # (GND)
-- \bo_inst|sub1_inst|sub_ab|difference[4]~9\ = CARRY((\bo_inst|reg2_inst|q\(4) & ((!\bo_inst|sub1_inst|sub_ab|difference[3]~7\) # (!\bo_inst|reg3_inst|q\(4)))) # (!\bo_inst|reg2_inst|q\(4) & (!\bo_inst|reg3_inst|q\(4) & 
-- !\bo_inst|sub1_inst|sub_ab|difference[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg2_inst|q\(4),
	datab => \bo_inst|reg3_inst|q\(4),
	datad => VCC,
	cin => \bo_inst|sub1_inst|sub_ab|difference[3]~7\,
	combout => \bo_inst|sub1_inst|sub_ab|difference[4]~8_combout\,
	cout => \bo_inst|sub1_inst|sub_ab|difference[4]~9\);

-- Location: LCCOMB_X26_Y12_N14
\bo_inst|sub1_inst|sub_ab|difference[5]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ab|difference[5]~10_combout\ = (\bo_inst|reg3_inst|q\(5) & ((\bo_inst|reg2_inst|q\(5) & (!\bo_inst|sub1_inst|sub_ab|difference[4]~9\)) # (!\bo_inst|reg2_inst|q\(5) & ((\bo_inst|sub1_inst|sub_ab|difference[4]~9\) # (GND))))) # 
-- (!\bo_inst|reg3_inst|q\(5) & ((\bo_inst|reg2_inst|q\(5) & (\bo_inst|sub1_inst|sub_ab|difference[4]~9\ & VCC)) # (!\bo_inst|reg2_inst|q\(5) & (!\bo_inst|sub1_inst|sub_ab|difference[4]~9\))))
-- \bo_inst|sub1_inst|sub_ab|difference[5]~11\ = CARRY((\bo_inst|reg3_inst|q\(5) & ((!\bo_inst|sub1_inst|sub_ab|difference[4]~9\) # (!\bo_inst|reg2_inst|q\(5)))) # (!\bo_inst|reg3_inst|q\(5) & (!\bo_inst|reg2_inst|q\(5) & 
-- !\bo_inst|sub1_inst|sub_ab|difference[4]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg3_inst|q\(5),
	datab => \bo_inst|reg2_inst|q\(5),
	datad => VCC,
	cin => \bo_inst|sub1_inst|sub_ab|difference[4]~9\,
	combout => \bo_inst|sub1_inst|sub_ab|difference[5]~10_combout\,
	cout => \bo_inst|sub1_inst|sub_ab|difference[5]~11\);

-- Location: LCCOMB_X26_Y12_N16
\bo_inst|sub1_inst|sub_ab|difference[6]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ab|difference[6]~12_combout\ = ((\bo_inst|reg2_inst|q\(6) $ (\bo_inst|reg3_inst|q\(6) $ (\bo_inst|sub1_inst|sub_ab|difference[5]~11\)))) # (GND)
-- \bo_inst|sub1_inst|sub_ab|difference[6]~13\ = CARRY((\bo_inst|reg2_inst|q\(6) & ((!\bo_inst|sub1_inst|sub_ab|difference[5]~11\) # (!\bo_inst|reg3_inst|q\(6)))) # (!\bo_inst|reg2_inst|q\(6) & (!\bo_inst|reg3_inst|q\(6) & 
-- !\bo_inst|sub1_inst|sub_ab|difference[5]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg2_inst|q\(6),
	datab => \bo_inst|reg3_inst|q\(6),
	datad => VCC,
	cin => \bo_inst|sub1_inst|sub_ab|difference[5]~11\,
	combout => \bo_inst|sub1_inst|sub_ab|difference[6]~12_combout\,
	cout => \bo_inst|sub1_inst|sub_ab|difference[6]~13\);

-- Location: LCCOMB_X26_Y12_N18
\bo_inst|sub1_inst|sub_ab|difference[7]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ab|difference[7]~14_combout\ = (\bo_inst|reg2_inst|q\(7) & ((\bo_inst|reg3_inst|q\(7) & (!\bo_inst|sub1_inst|sub_ab|difference[6]~13\)) # (!\bo_inst|reg3_inst|q\(7) & (\bo_inst|sub1_inst|sub_ab|difference[6]~13\ & VCC)))) # 
-- (!\bo_inst|reg2_inst|q\(7) & ((\bo_inst|reg3_inst|q\(7) & ((\bo_inst|sub1_inst|sub_ab|difference[6]~13\) # (GND))) # (!\bo_inst|reg3_inst|q\(7) & (!\bo_inst|sub1_inst|sub_ab|difference[6]~13\))))
-- \bo_inst|sub1_inst|sub_ab|difference[7]~15\ = CARRY((\bo_inst|reg2_inst|q\(7) & (\bo_inst|reg3_inst|q\(7) & !\bo_inst|sub1_inst|sub_ab|difference[6]~13\)) # (!\bo_inst|reg2_inst|q\(7) & ((\bo_inst|reg3_inst|q\(7)) # 
-- (!\bo_inst|sub1_inst|sub_ab|difference[6]~13\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg2_inst|q\(7),
	datab => \bo_inst|reg3_inst|q\(7),
	datad => VCC,
	cin => \bo_inst|sub1_inst|sub_ab|difference[6]~13\,
	combout => \bo_inst|sub1_inst|sub_ab|difference[7]~14_combout\,
	cout => \bo_inst|sub1_inst|sub_ab|difference[7]~15\);

-- Location: LCCOMB_X26_Y12_N20
\bo_inst|sub1_inst|sub_ab|difference[8]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\ = \bo_inst|sub1_inst|sub_ab|difference[7]~15\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \bo_inst|sub1_inst|sub_ab|difference[7]~15\,
	combout => \bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\);

-- Location: LCCOMB_X26_Y12_N24
\bo_inst|sub1_inst|sub_ba|Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ba|Add0~2_combout\ = (\bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\ & (\bo_inst|sub1_inst|sub_ba|Add0~0_combout\)) # (!\bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\ & 
-- ((\bo_inst|sub1_inst|sub_ab|difference[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|sub1_inst|sub_ba|Add0~0_combout\,
	datab => \bo_inst|sub1_inst|sub_ab|difference[0]~0_combout\,
	datad => \bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\,
	combout => \bo_inst|sub1_inst|sub_ba|Add0~2_combout\);

-- Location: LCCOMB_X25_Y12_N0
\bo_inst|reg4_inst|q[0]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg4_inst|q[0]~14_combout\ = (\bo_inst|reg4_inst|q\(0) & (\bo_inst|sub1_inst|sub_ba|Add0~2_combout\ $ (VCC))) # (!\bo_inst|reg4_inst|q\(0) & (\bo_inst|sub1_inst|sub_ba|Add0~2_combout\ & VCC))
-- \bo_inst|reg4_inst|q[0]~15\ = CARRY((\bo_inst|reg4_inst|q\(0) & \bo_inst|sub1_inst|sub_ba|Add0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg4_inst|q\(0),
	datab => \bo_inst|sub1_inst|sub_ba|Add0~2_combout\,
	datad => VCC,
	combout => \bo_inst|reg4_inst|q[0]~14_combout\,
	cout => \bo_inst|reg4_inst|q[0]~15\);

-- Location: LCFF_X25_Y12_N1
\bo_inst|reg4_inst|q[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg4_inst|q[0]~14_combout\,
	sclr => \bc_inst|state.S1~regout\,
	ena => \bc_inst|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg4_inst|q\(0));

-- Location: LCFF_X24_Y12_N1
\bo_inst|reg5_inst|q[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \bo_inst|reg4_inst|q\(0),
	sload => VCC,
	ena => \bc_inst|state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg5_inst|q\(0));

-- Location: LCCOMB_X25_Y12_N2
\bo_inst|reg4_inst|q[1]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg4_inst|q[1]~16_combout\ = (\bo_inst|sub1_inst|sub_ba|Add0~5_combout\ & ((\bo_inst|reg4_inst|q\(1) & (\bo_inst|reg4_inst|q[0]~15\ & VCC)) # (!\bo_inst|reg4_inst|q\(1) & (!\bo_inst|reg4_inst|q[0]~15\)))) # 
-- (!\bo_inst|sub1_inst|sub_ba|Add0~5_combout\ & ((\bo_inst|reg4_inst|q\(1) & (!\bo_inst|reg4_inst|q[0]~15\)) # (!\bo_inst|reg4_inst|q\(1) & ((\bo_inst|reg4_inst|q[0]~15\) # (GND)))))
-- \bo_inst|reg4_inst|q[1]~17\ = CARRY((\bo_inst|sub1_inst|sub_ba|Add0~5_combout\ & (!\bo_inst|reg4_inst|q\(1) & !\bo_inst|reg4_inst|q[0]~15\)) # (!\bo_inst|sub1_inst|sub_ba|Add0~5_combout\ & ((!\bo_inst|reg4_inst|q[0]~15\) # (!\bo_inst|reg4_inst|q\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|sub1_inst|sub_ba|Add0~5_combout\,
	datab => \bo_inst|reg4_inst|q\(1),
	datad => VCC,
	cin => \bo_inst|reg4_inst|q[0]~15\,
	combout => \bo_inst|reg4_inst|q[1]~16_combout\,
	cout => \bo_inst|reg4_inst|q[1]~17\);

-- Location: LCFF_X25_Y12_N3
\bo_inst|reg4_inst|q[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg4_inst|q[1]~16_combout\,
	sclr => \bc_inst|state.S1~regout\,
	ena => \bc_inst|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg4_inst|q\(1));

-- Location: LCCOMB_X24_Y12_N10
\bo_inst|reg5_inst|q[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg5_inst|q[1]~feeder_combout\ = \bo_inst|reg4_inst|q\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bo_inst|reg4_inst|q\(1),
	combout => \bo_inst|reg5_inst|q[1]~feeder_combout\);

-- Location: LCFF_X24_Y12_N11
\bo_inst|reg5_inst|q[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg5_inst|q[1]~feeder_combout\,
	ena => \bc_inst|state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg5_inst|q\(1));

-- Location: LCCOMB_X26_Y12_N28
\bo_inst|sub1_inst|sub_ba|Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ba|Add0~8_combout\ = (\bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\ & (\bo_inst|sub1_inst|sub_ba|Add0~6_combout\)) # (!\bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\ & 
-- ((\bo_inst|sub1_inst|sub_ab|difference[2]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|sub1_inst|sub_ba|Add0~6_combout\,
	datab => \bo_inst|sub1_inst|sub_ab|difference[2]~4_combout\,
	datad => \bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\,
	combout => \bo_inst|sub1_inst|sub_ba|Add0~8_combout\);

-- Location: LCCOMB_X25_Y12_N4
\bo_inst|reg4_inst|q[2]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg4_inst|q[2]~18_combout\ = ((\bo_inst|reg4_inst|q\(2) $ (\bo_inst|sub1_inst|sub_ba|Add0~8_combout\ $ (!\bo_inst|reg4_inst|q[1]~17\)))) # (GND)
-- \bo_inst|reg4_inst|q[2]~19\ = CARRY((\bo_inst|reg4_inst|q\(2) & ((\bo_inst|sub1_inst|sub_ba|Add0~8_combout\) # (!\bo_inst|reg4_inst|q[1]~17\))) # (!\bo_inst|reg4_inst|q\(2) & (\bo_inst|sub1_inst|sub_ba|Add0~8_combout\ & !\bo_inst|reg4_inst|q[1]~17\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg4_inst|q\(2),
	datab => \bo_inst|sub1_inst|sub_ba|Add0~8_combout\,
	datad => VCC,
	cin => \bo_inst|reg4_inst|q[1]~17\,
	combout => \bo_inst|reg4_inst|q[2]~18_combout\,
	cout => \bo_inst|reg4_inst|q[2]~19\);

-- Location: LCFF_X25_Y12_N5
\bo_inst|reg4_inst|q[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg4_inst|q[2]~18_combout\,
	sclr => \bc_inst|state.S1~regout\,
	ena => \bc_inst|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg4_inst|q\(2));

-- Location: LCCOMB_X24_Y12_N12
\bo_inst|reg5_inst|q[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg5_inst|q[2]~feeder_combout\ = \bo_inst|reg4_inst|q\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bo_inst|reg4_inst|q\(2),
	combout => \bo_inst|reg5_inst|q[2]~feeder_combout\);

-- Location: LCFF_X24_Y12_N13
\bo_inst|reg5_inst|q[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg5_inst|q[2]~feeder_combout\,
	ena => \bc_inst|state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg5_inst|q\(2));

-- Location: PIN_G13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_ori[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_ori(2),
	combout => \sample_ori~combout\(2));

-- Location: LCFF_X26_Y12_N25
\bo_inst|reg2_inst|q[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_ori~combout\(2),
	sload => VCC,
	ena => \bc_inst|state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg2_inst|q\(2));

-- Location: LCCOMB_X27_Y12_N6
\bo_inst|sub1_inst|sub_ba|Add0~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ba|Add0~9_combout\ = (\bo_inst|reg2_inst|q\(3) & ((\bo_inst|reg3_inst|q\(3) & (!\bo_inst|sub1_inst|sub_ba|Add0~7\)) # (!\bo_inst|reg3_inst|q\(3) & ((\bo_inst|sub1_inst|sub_ba|Add0~7\) # (GND))))) # (!\bo_inst|reg2_inst|q\(3) & 
-- ((\bo_inst|reg3_inst|q\(3) & (\bo_inst|sub1_inst|sub_ba|Add0~7\ & VCC)) # (!\bo_inst|reg3_inst|q\(3) & (!\bo_inst|sub1_inst|sub_ba|Add0~7\))))
-- \bo_inst|sub1_inst|sub_ba|Add0~10\ = CARRY((\bo_inst|reg2_inst|q\(3) & ((!\bo_inst|sub1_inst|sub_ba|Add0~7\) # (!\bo_inst|reg3_inst|q\(3)))) # (!\bo_inst|reg2_inst|q\(3) & (!\bo_inst|reg3_inst|q\(3) & !\bo_inst|sub1_inst|sub_ba|Add0~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg2_inst|q\(3),
	datab => \bo_inst|reg3_inst|q\(3),
	datad => VCC,
	cin => \bo_inst|sub1_inst|sub_ba|Add0~7\,
	combout => \bo_inst|sub1_inst|sub_ba|Add0~9_combout\,
	cout => \bo_inst|sub1_inst|sub_ba|Add0~10\);

-- Location: LCCOMB_X26_Y12_N30
\bo_inst|sub1_inst|sub_ba|Add0~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ba|Add0~11_combout\ = (\bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\ & ((\bo_inst|sub1_inst|sub_ba|Add0~9_combout\))) # (!\bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\ & 
-- (\bo_inst|sub1_inst|sub_ab|difference[3]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\,
	datab => \bo_inst|sub1_inst|sub_ab|difference[3]~6_combout\,
	datad => \bo_inst|sub1_inst|sub_ba|Add0~9_combout\,
	combout => \bo_inst|sub1_inst|sub_ba|Add0~11_combout\);

-- Location: LCCOMB_X25_Y12_N6
\bo_inst|reg4_inst|q[3]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg4_inst|q[3]~20_combout\ = (\bo_inst|reg4_inst|q\(3) & ((\bo_inst|sub1_inst|sub_ba|Add0~11_combout\ & (\bo_inst|reg4_inst|q[2]~19\ & VCC)) # (!\bo_inst|sub1_inst|sub_ba|Add0~11_combout\ & (!\bo_inst|reg4_inst|q[2]~19\)))) # 
-- (!\bo_inst|reg4_inst|q\(3) & ((\bo_inst|sub1_inst|sub_ba|Add0~11_combout\ & (!\bo_inst|reg4_inst|q[2]~19\)) # (!\bo_inst|sub1_inst|sub_ba|Add0~11_combout\ & ((\bo_inst|reg4_inst|q[2]~19\) # (GND)))))
-- \bo_inst|reg4_inst|q[3]~21\ = CARRY((\bo_inst|reg4_inst|q\(3) & (!\bo_inst|sub1_inst|sub_ba|Add0~11_combout\ & !\bo_inst|reg4_inst|q[2]~19\)) # (!\bo_inst|reg4_inst|q\(3) & ((!\bo_inst|reg4_inst|q[2]~19\) # (!\bo_inst|sub1_inst|sub_ba|Add0~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg4_inst|q\(3),
	datab => \bo_inst|sub1_inst|sub_ba|Add0~11_combout\,
	datad => VCC,
	cin => \bo_inst|reg4_inst|q[2]~19\,
	combout => \bo_inst|reg4_inst|q[3]~20_combout\,
	cout => \bo_inst|reg4_inst|q[3]~21\);

-- Location: LCFF_X25_Y12_N7
\bo_inst|reg4_inst|q[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg4_inst|q[3]~20_combout\,
	sclr => \bc_inst|state.S1~regout\,
	ena => \bc_inst|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg4_inst|q\(3));

-- Location: LCCOMB_X24_Y12_N22
\bo_inst|reg5_inst|q[3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg5_inst|q[3]~feeder_combout\ = \bo_inst|reg4_inst|q\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bo_inst|reg4_inst|q\(3),
	combout => \bo_inst|reg5_inst|q[3]~feeder_combout\);

-- Location: LCFF_X24_Y12_N23
\bo_inst|reg5_inst|q[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg5_inst|q[3]~feeder_combout\,
	ena => \bc_inst|state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg5_inst|q\(3));

-- Location: LCCOMB_X27_Y12_N8
\bo_inst|sub1_inst|sub_ba|Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ba|Add0~12_combout\ = ((\bo_inst|reg2_inst|q\(4) $ (\bo_inst|reg3_inst|q\(4) $ (\bo_inst|sub1_inst|sub_ba|Add0~10\)))) # (GND)
-- \bo_inst|sub1_inst|sub_ba|Add0~13\ = CARRY((\bo_inst|reg2_inst|q\(4) & (\bo_inst|reg3_inst|q\(4) & !\bo_inst|sub1_inst|sub_ba|Add0~10\)) # (!\bo_inst|reg2_inst|q\(4) & ((\bo_inst|reg3_inst|q\(4)) # (!\bo_inst|sub1_inst|sub_ba|Add0~10\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg2_inst|q\(4),
	datab => \bo_inst|reg3_inst|q\(4),
	datad => VCC,
	cin => \bo_inst|sub1_inst|sub_ba|Add0~10\,
	combout => \bo_inst|sub1_inst|sub_ba|Add0~12_combout\,
	cout => \bo_inst|sub1_inst|sub_ba|Add0~13\);

-- Location: LCCOMB_X25_Y12_N28
\bo_inst|sub1_inst|sub_ba|Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ba|Add0~14_combout\ = (\bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\ & ((\bo_inst|sub1_inst|sub_ba|Add0~12_combout\))) # (!\bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\ & 
-- (\bo_inst|sub1_inst|sub_ab|difference[4]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\,
	datac => \bo_inst|sub1_inst|sub_ab|difference[4]~8_combout\,
	datad => \bo_inst|sub1_inst|sub_ba|Add0~12_combout\,
	combout => \bo_inst|sub1_inst|sub_ba|Add0~14_combout\);

-- Location: LCCOMB_X25_Y12_N8
\bo_inst|reg4_inst|q[4]~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg4_inst|q[4]~22_combout\ = ((\bo_inst|reg4_inst|q\(4) $ (\bo_inst|sub1_inst|sub_ba|Add0~14_combout\ $ (!\bo_inst|reg4_inst|q[3]~21\)))) # (GND)
-- \bo_inst|reg4_inst|q[4]~23\ = CARRY((\bo_inst|reg4_inst|q\(4) & ((\bo_inst|sub1_inst|sub_ba|Add0~14_combout\) # (!\bo_inst|reg4_inst|q[3]~21\))) # (!\bo_inst|reg4_inst|q\(4) & (\bo_inst|sub1_inst|sub_ba|Add0~14_combout\ & !\bo_inst|reg4_inst|q[3]~21\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg4_inst|q\(4),
	datab => \bo_inst|sub1_inst|sub_ba|Add0~14_combout\,
	datad => VCC,
	cin => \bo_inst|reg4_inst|q[3]~21\,
	combout => \bo_inst|reg4_inst|q[4]~22_combout\,
	cout => \bo_inst|reg4_inst|q[4]~23\);

-- Location: LCFF_X25_Y12_N9
\bo_inst|reg4_inst|q[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg4_inst|q[4]~22_combout\,
	sclr => \bc_inst|state.S1~regout\,
	ena => \bc_inst|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg4_inst|q\(4));

-- Location: LCFF_X24_Y12_N29
\bo_inst|reg5_inst|q[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \bo_inst|reg4_inst|q\(4),
	sload => VCC,
	ena => \bc_inst|state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg5_inst|q\(4));

-- Location: LCCOMB_X27_Y12_N18
\bo_inst|sub1_inst|sub_ba|Add0~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ba|Add0~17_combout\ = (\bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\ & (\bo_inst|sub1_inst|sub_ba|Add0~15_combout\)) # (!\bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\ & 
-- ((\bo_inst|sub1_inst|sub_ab|difference[5]~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|sub1_inst|sub_ba|Add0~15_combout\,
	datac => \bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\,
	datad => \bo_inst|sub1_inst|sub_ab|difference[5]~10_combout\,
	combout => \bo_inst|sub1_inst|sub_ba|Add0~17_combout\);

-- Location: LCCOMB_X25_Y12_N10
\bo_inst|reg4_inst|q[5]~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg4_inst|q[5]~24_combout\ = (\bo_inst|reg4_inst|q\(5) & ((\bo_inst|sub1_inst|sub_ba|Add0~17_combout\ & (\bo_inst|reg4_inst|q[4]~23\ & VCC)) # (!\bo_inst|sub1_inst|sub_ba|Add0~17_combout\ & (!\bo_inst|reg4_inst|q[4]~23\)))) # 
-- (!\bo_inst|reg4_inst|q\(5) & ((\bo_inst|sub1_inst|sub_ba|Add0~17_combout\ & (!\bo_inst|reg4_inst|q[4]~23\)) # (!\bo_inst|sub1_inst|sub_ba|Add0~17_combout\ & ((\bo_inst|reg4_inst|q[4]~23\) # (GND)))))
-- \bo_inst|reg4_inst|q[5]~25\ = CARRY((\bo_inst|reg4_inst|q\(5) & (!\bo_inst|sub1_inst|sub_ba|Add0~17_combout\ & !\bo_inst|reg4_inst|q[4]~23\)) # (!\bo_inst|reg4_inst|q\(5) & ((!\bo_inst|reg4_inst|q[4]~23\) # (!\bo_inst|sub1_inst|sub_ba|Add0~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg4_inst|q\(5),
	datab => \bo_inst|sub1_inst|sub_ba|Add0~17_combout\,
	datad => VCC,
	cin => \bo_inst|reg4_inst|q[4]~23\,
	combout => \bo_inst|reg4_inst|q[5]~24_combout\,
	cout => \bo_inst|reg4_inst|q[5]~25\);

-- Location: LCFF_X25_Y12_N11
\bo_inst|reg4_inst|q[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg4_inst|q[5]~24_combout\,
	sclr => \bc_inst|state.S1~regout\,
	ena => \bc_inst|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg4_inst|q\(5));

-- Location: LCFF_X24_Y12_N3
\bo_inst|reg5_inst|q[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \bo_inst|reg4_inst|q\(5),
	sload => VCC,
	ena => \bc_inst|state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg5_inst|q\(5));

-- Location: LCCOMB_X27_Y12_N24
\bo_inst|sub1_inst|sub_ba|Add0~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ba|Add0~20_combout\ = (\bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\ & (\bo_inst|sub1_inst|sub_ba|Add0~18_combout\)) # (!\bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\ & 
-- ((\bo_inst|sub1_inst|sub_ab|difference[6]~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|sub1_inst|sub_ba|Add0~18_combout\,
	datac => \bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\,
	datad => \bo_inst|sub1_inst|sub_ab|difference[6]~12_combout\,
	combout => \bo_inst|sub1_inst|sub_ba|Add0~20_combout\);

-- Location: LCCOMB_X25_Y12_N12
\bo_inst|reg4_inst|q[6]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg4_inst|q[6]~26_combout\ = ((\bo_inst|reg4_inst|q\(6) $ (\bo_inst|sub1_inst|sub_ba|Add0~20_combout\ $ (!\bo_inst|reg4_inst|q[5]~25\)))) # (GND)
-- \bo_inst|reg4_inst|q[6]~27\ = CARRY((\bo_inst|reg4_inst|q\(6) & ((\bo_inst|sub1_inst|sub_ba|Add0~20_combout\) # (!\bo_inst|reg4_inst|q[5]~25\))) # (!\bo_inst|reg4_inst|q\(6) & (\bo_inst|sub1_inst|sub_ba|Add0~20_combout\ & !\bo_inst|reg4_inst|q[5]~25\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg4_inst|q\(6),
	datab => \bo_inst|sub1_inst|sub_ba|Add0~20_combout\,
	datad => VCC,
	cin => \bo_inst|reg4_inst|q[5]~25\,
	combout => \bo_inst|reg4_inst|q[6]~26_combout\,
	cout => \bo_inst|reg4_inst|q[6]~27\);

-- Location: LCFF_X25_Y12_N13
\bo_inst|reg4_inst|q[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg4_inst|q[6]~26_combout\,
	sclr => \bc_inst|state.S1~regout\,
	ena => \bc_inst|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg4_inst|q\(6));

-- Location: LCFF_X24_Y12_N5
\bo_inst|reg5_inst|q[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \bo_inst|reg4_inst|q\(6),
	sload => VCC,
	ena => \bc_inst|state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg5_inst|q\(6));

-- Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_ori[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_ori(7),
	combout => \sample_ori~combout\(7));

-- Location: LCCOMB_X26_Y12_N22
\bo_inst|reg2_inst|q[7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg2_inst|q[7]~feeder_combout\ = \sample_ori~combout\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sample_ori~combout\(7),
	combout => \bo_inst|reg2_inst|q[7]~feeder_combout\);

-- Location: LCFF_X26_Y12_N23
\bo_inst|reg2_inst|q[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg2_inst|q[7]~feeder_combout\,
	ena => \bc_inst|state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg2_inst|q\(7));

-- Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_ori[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_ori(6),
	combout => \sample_ori~combout\(6));

-- Location: LCFF_X26_Y12_N27
\bo_inst|reg2_inst|q[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_ori~combout\(6),
	sload => VCC,
	ena => \bc_inst|state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg2_inst|q\(6));

-- Location: LCCOMB_X27_Y12_N14
\bo_inst|sub1_inst|sub_ba|Add0~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ba|Add0~21_combout\ = \bo_inst|reg3_inst|q\(7) $ (\bo_inst|sub1_inst|sub_ba|Add0~19\ $ (!\bo_inst|reg2_inst|q\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bo_inst|reg3_inst|q\(7),
	datad => \bo_inst|reg2_inst|q\(7),
	cin => \bo_inst|sub1_inst|sub_ba|Add0~19\,
	combout => \bo_inst|sub1_inst|sub_ba|Add0~21_combout\);

-- Location: LCCOMB_X25_Y12_N30
\bo_inst|sub1_inst|sub_ba|Add0~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|sub1_inst|sub_ba|Add0~23_combout\ = (\bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\ & ((\bo_inst|sub1_inst|sub_ba|Add0~21_combout\))) # (!\bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\ & 
-- (\bo_inst|sub1_inst|sub_ab|difference[7]~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bo_inst|sub1_inst|sub_ab|difference[8]~16_combout\,
	datac => \bo_inst|sub1_inst|sub_ab|difference[7]~14_combout\,
	datad => \bo_inst|sub1_inst|sub_ba|Add0~21_combout\,
	combout => \bo_inst|sub1_inst|sub_ba|Add0~23_combout\);

-- Location: LCCOMB_X25_Y12_N14
\bo_inst|reg4_inst|q[7]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg4_inst|q[7]~28_combout\ = (\bo_inst|reg4_inst|q\(7) & ((\bo_inst|sub1_inst|sub_ba|Add0~23_combout\ & (\bo_inst|reg4_inst|q[6]~27\ & VCC)) # (!\bo_inst|sub1_inst|sub_ba|Add0~23_combout\ & (!\bo_inst|reg4_inst|q[6]~27\)))) # 
-- (!\bo_inst|reg4_inst|q\(7) & ((\bo_inst|sub1_inst|sub_ba|Add0~23_combout\ & (!\bo_inst|reg4_inst|q[6]~27\)) # (!\bo_inst|sub1_inst|sub_ba|Add0~23_combout\ & ((\bo_inst|reg4_inst|q[6]~27\) # (GND)))))
-- \bo_inst|reg4_inst|q[7]~29\ = CARRY((\bo_inst|reg4_inst|q\(7) & (!\bo_inst|sub1_inst|sub_ba|Add0~23_combout\ & !\bo_inst|reg4_inst|q[6]~27\)) # (!\bo_inst|reg4_inst|q\(7) & ((!\bo_inst|reg4_inst|q[6]~27\) # (!\bo_inst|sub1_inst|sub_ba|Add0~23_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg4_inst|q\(7),
	datab => \bo_inst|sub1_inst|sub_ba|Add0~23_combout\,
	datad => VCC,
	cin => \bo_inst|reg4_inst|q[6]~27\,
	combout => \bo_inst|reg4_inst|q[7]~28_combout\,
	cout => \bo_inst|reg4_inst|q[7]~29\);

-- Location: LCFF_X25_Y12_N15
\bo_inst|reg4_inst|q[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg4_inst|q[7]~28_combout\,
	sclr => \bc_inst|state.S1~regout\,
	ena => \bc_inst|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg4_inst|q\(7));

-- Location: LCFF_X24_Y12_N27
\bo_inst|reg5_inst|q[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \bo_inst|reg4_inst|q\(7),
	sload => VCC,
	ena => \bc_inst|state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg5_inst|q\(7));

-- Location: LCCOMB_X25_Y12_N16
\bo_inst|reg4_inst|q[8]~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg4_inst|q[8]~30_combout\ = (\bo_inst|reg4_inst|q\(8) & (\bo_inst|reg4_inst|q[7]~29\ $ (GND))) # (!\bo_inst|reg4_inst|q\(8) & (!\bo_inst|reg4_inst|q[7]~29\ & VCC))
-- \bo_inst|reg4_inst|q[8]~31\ = CARRY((\bo_inst|reg4_inst|q\(8) & !\bo_inst|reg4_inst|q[7]~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg4_inst|q\(8),
	datad => VCC,
	cin => \bo_inst|reg4_inst|q[7]~29\,
	combout => \bo_inst|reg4_inst|q[8]~30_combout\,
	cout => \bo_inst|reg4_inst|q[8]~31\);

-- Location: LCFF_X25_Y12_N17
\bo_inst|reg4_inst|q[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg4_inst|q[8]~30_combout\,
	sclr => \bc_inst|state.S1~regout\,
	ena => \bc_inst|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg4_inst|q\(8));

-- Location: LCFF_X24_Y12_N21
\bo_inst|reg5_inst|q[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \bo_inst|reg4_inst|q\(8),
	sload => VCC,
	ena => \bc_inst|state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg5_inst|q\(8));

-- Location: LCCOMB_X25_Y12_N18
\bo_inst|reg4_inst|q[9]~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg4_inst|q[9]~32_combout\ = (\bo_inst|reg4_inst|q\(9) & (!\bo_inst|reg4_inst|q[8]~31\)) # (!\bo_inst|reg4_inst|q\(9) & ((\bo_inst|reg4_inst|q[8]~31\) # (GND)))
-- \bo_inst|reg4_inst|q[9]~33\ = CARRY((!\bo_inst|reg4_inst|q[8]~31\) # (!\bo_inst|reg4_inst|q\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bo_inst|reg4_inst|q\(9),
	datad => VCC,
	cin => \bo_inst|reg4_inst|q[8]~31\,
	combout => \bo_inst|reg4_inst|q[9]~32_combout\,
	cout => \bo_inst|reg4_inst|q[9]~33\);

-- Location: LCFF_X25_Y12_N19
\bo_inst|reg4_inst|q[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg4_inst|q[9]~32_combout\,
	sclr => \bc_inst|state.S1~regout\,
	ena => \bc_inst|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg4_inst|q\(9));

-- Location: LCCOMB_X24_Y12_N18
\bo_inst|reg5_inst|q[9]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg5_inst|q[9]~feeder_combout\ = \bo_inst|reg4_inst|q\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bo_inst|reg4_inst|q\(9),
	combout => \bo_inst|reg5_inst|q[9]~feeder_combout\);

-- Location: LCFF_X24_Y12_N19
\bo_inst|reg5_inst|q[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg5_inst|q[9]~feeder_combout\,
	ena => \bc_inst|state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg5_inst|q\(9));

-- Location: LCCOMB_X25_Y12_N20
\bo_inst|reg4_inst|q[10]~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg4_inst|q[10]~34_combout\ = (\bo_inst|reg4_inst|q\(10) & (\bo_inst|reg4_inst|q[9]~33\ $ (GND))) # (!\bo_inst|reg4_inst|q\(10) & (!\bo_inst|reg4_inst|q[9]~33\ & VCC))
-- \bo_inst|reg4_inst|q[10]~35\ = CARRY((\bo_inst|reg4_inst|q\(10) & !\bo_inst|reg4_inst|q[9]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg4_inst|q\(10),
	datad => VCC,
	cin => \bo_inst|reg4_inst|q[9]~33\,
	combout => \bo_inst|reg4_inst|q[10]~34_combout\,
	cout => \bo_inst|reg4_inst|q[10]~35\);

-- Location: LCFF_X25_Y12_N21
\bo_inst|reg4_inst|q[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg4_inst|q[10]~34_combout\,
	sclr => \bc_inst|state.S1~regout\,
	ena => \bc_inst|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg4_inst|q\(10));

-- Location: LCCOMB_X24_Y12_N24
\bo_inst|reg5_inst|q[10]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg5_inst|q[10]~feeder_combout\ = \bo_inst|reg4_inst|q\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bo_inst|reg4_inst|q\(10),
	combout => \bo_inst|reg5_inst|q[10]~feeder_combout\);

-- Location: LCFF_X24_Y12_N25
\bo_inst|reg5_inst|q[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg5_inst|q[10]~feeder_combout\,
	ena => \bc_inst|state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg5_inst|q\(10));

-- Location: LCCOMB_X25_Y12_N22
\bo_inst|reg4_inst|q[11]~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg4_inst|q[11]~36_combout\ = (\bo_inst|reg4_inst|q\(11) & (!\bo_inst|reg4_inst|q[10]~35\)) # (!\bo_inst|reg4_inst|q\(11) & ((\bo_inst|reg4_inst|q[10]~35\) # (GND)))
-- \bo_inst|reg4_inst|q[11]~37\ = CARRY((!\bo_inst|reg4_inst|q[10]~35\) # (!\bo_inst|reg4_inst|q\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bo_inst|reg4_inst|q\(11),
	datad => VCC,
	cin => \bo_inst|reg4_inst|q[10]~35\,
	combout => \bo_inst|reg4_inst|q[11]~36_combout\,
	cout => \bo_inst|reg4_inst|q[11]~37\);

-- Location: LCFF_X25_Y12_N23
\bo_inst|reg4_inst|q[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg4_inst|q[11]~36_combout\,
	sclr => \bc_inst|state.S1~regout\,
	ena => \bc_inst|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg4_inst|q\(11));

-- Location: LCCOMB_X24_Y12_N30
\bo_inst|reg5_inst|q[11]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg5_inst|q[11]~feeder_combout\ = \bo_inst|reg4_inst|q\(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bo_inst|reg4_inst|q\(11),
	combout => \bo_inst|reg5_inst|q[11]~feeder_combout\);

-- Location: LCFF_X24_Y12_N31
\bo_inst|reg5_inst|q[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg5_inst|q[11]~feeder_combout\,
	ena => \bc_inst|state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg5_inst|q\(11));

-- Location: LCCOMB_X25_Y12_N24
\bo_inst|reg4_inst|q[12]~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg4_inst|q[12]~38_combout\ = (\bo_inst|reg4_inst|q\(12) & (\bo_inst|reg4_inst|q[11]~37\ $ (GND))) # (!\bo_inst|reg4_inst|q\(12) & (!\bo_inst|reg4_inst|q[11]~37\ & VCC))
-- \bo_inst|reg4_inst|q[12]~39\ = CARRY((\bo_inst|reg4_inst|q\(12) & !\bo_inst|reg4_inst|q[11]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bo_inst|reg4_inst|q\(12),
	datad => VCC,
	cin => \bo_inst|reg4_inst|q[11]~37\,
	combout => \bo_inst|reg4_inst|q[12]~38_combout\,
	cout => \bo_inst|reg4_inst|q[12]~39\);

-- Location: LCFF_X25_Y12_N25
\bo_inst|reg4_inst|q[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg4_inst|q[12]~38_combout\,
	sclr => \bc_inst|state.S1~regout\,
	ena => \bc_inst|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg4_inst|q\(12));

-- Location: LCCOMB_X24_Y12_N16
\bo_inst|reg5_inst|q[12]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg5_inst|q[12]~feeder_combout\ = \bo_inst|reg4_inst|q\(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bo_inst|reg4_inst|q\(12),
	combout => \bo_inst|reg5_inst|q[12]~feeder_combout\);

-- Location: LCFF_X24_Y12_N17
\bo_inst|reg5_inst|q[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg5_inst|q[12]~feeder_combout\,
	ena => \bc_inst|state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg5_inst|q\(12));

-- Location: LCCOMB_X25_Y12_N26
\bo_inst|reg4_inst|q[13]~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \bo_inst|reg4_inst|q[13]~40_combout\ = \bo_inst|reg4_inst|q[12]~39\ $ (\bo_inst|reg4_inst|q\(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \bo_inst|reg4_inst|q\(13),
	cin => \bo_inst|reg4_inst|q[12]~39\,
	combout => \bo_inst|reg4_inst|q[13]~40_combout\);

-- Location: LCFF_X25_Y12_N27
\bo_inst|reg4_inst|q[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \bo_inst|reg4_inst|q[13]~40_combout\,
	sclr => \bc_inst|state.S1~regout\,
	ena => \bc_inst|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg4_inst|q\(13));

-- Location: LCFF_X24_Y12_N7
\bo_inst|reg5_inst|q[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \bo_inst|reg4_inst|q\(13),
	sload => VCC,
	ena => \bc_inst|state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \bo_inst|reg5_inst|q\(13));

-- Location: PIN_E16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\read_mem~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bc_inst|state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_read_mem);

-- Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\address[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bo_inst|reg1_inst|q\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_address(0));

-- Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\address[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bo_inst|reg1_inst|q\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_address(1));

-- Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\address[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bo_inst|reg1_inst|q\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_address(2));

-- Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\address[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bo_inst|reg1_inst|q\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_address(3));

-- Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\address[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bo_inst|reg1_inst|q\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_address(4));

-- Location: PIN_F9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\address[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bo_inst|reg1_inst|q\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_address(5));

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bo_inst|reg5_inst|q\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(0));

-- Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bo_inst|reg5_inst|q\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(1));

-- Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bo_inst|reg5_inst|q\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(2));

-- Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bo_inst|reg5_inst|q\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(3));

-- Location: PIN_A12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bo_inst|reg5_inst|q\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(4));

-- Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bo_inst|reg5_inst|q\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(5));

-- Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bo_inst|reg5_inst|q\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(6));

-- Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bo_inst|reg5_inst|q\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(7));

-- Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bo_inst|reg5_inst|q\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(8));

-- Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bo_inst|reg5_inst|q\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(9));

-- Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bo_inst|reg5_inst|q\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(10));

-- Location: PIN_G10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bo_inst|reg5_inst|q\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(11));

-- Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bo_inst|reg5_inst|q\(12),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(12));

-- Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bo_inst|reg5_inst|q\(13),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(13));

-- Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\done~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bc_inst|ALT_INV_state.S0~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_done);
END structure;


