--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
--Date        : Mon Nov 21 12:49:38 2022
--Host        : DESKTOP-Fornan running 64-bit major release  (build 9200)
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    clk_100MHz : in STD_LOGIC;
    lrclk_out_0 : out STD_LOGIC;
    m_axis_aud_aclk_0 : in STD_LOGIC;
    m_axis_aud_aresetn_0 : in STD_LOGIC;
    reset : in STD_LOGIC;
    sclk_out_0 : out STD_LOGIC;
    sdata_0_in_0 : in STD_LOGIC;
    uart_0_rxd : in STD_LOGIC;
    uart_0_txd : out STD_LOGIC
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    clk_100MHz : in STD_LOGIC;
    reset : in STD_LOGIC;
    sdata_0_in_0 : in STD_LOGIC;
    lrclk_out_0 : out STD_LOGIC;
    sclk_out_0 : out STD_LOGIC;
    uart_0_rxd : in STD_LOGIC;
    uart_0_txd : out STD_LOGIC;
    m_axis_aud_aclk_0 : in STD_LOGIC;
    m_axis_aud_aresetn_0 : in STD_LOGIC
  );
  end component design_1;
begin
design_1_i: component design_1
     port map (
      clk_100MHz => clk_100MHz,
      lrclk_out_0 => lrclk_out_0,
      m_axis_aud_aclk_0 => m_axis_aud_aclk_0,
      m_axis_aud_aresetn_0 => m_axis_aud_aresetn_0,
      reset => reset,
      sclk_out_0 => sclk_out_0,
      sdata_0_in_0 => sdata_0_in_0,
      uart_0_rxd => uart_0_rxd,
      uart_0_txd => uart_0_txd
    );
end STRUCTURE;
