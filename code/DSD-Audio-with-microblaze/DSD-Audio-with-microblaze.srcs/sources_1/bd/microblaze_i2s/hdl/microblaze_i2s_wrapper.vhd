--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
--Date        : Thu Dec  1 15:06:11 2022
--Host        : FERNAN-LAPTOP running 64-bit major release  (build 9200)
--Command     : generate_target microblaze_i2s_wrapper.bd
--Design      : microblaze_i2s_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity microblaze_i2s_wrapper is
  port (
    clk_100MHz : in STD_LOGIC;
    i2s_receiver_irq : out STD_LOGIC;
    i2s_receiver_lrclk_out : out STD_LOGIC;
    i2s_receiver_sclk_out : out STD_LOGIC;
    i2s_transmitter_irq : out STD_LOGIC;
    i2s_transmitter_lrclk_out : out STD_LOGIC;
    i2s_transmitter_sclk_out : out STD_LOGIC;
    i2s_transmitter_sdata_0_out : out STD_LOGIC;
    reset_rtl_0 : in STD_LOGIC;
    sdata_0_in_0 : in STD_LOGIC;
    timer_1_pwm : out STD_LOGIC;
    uart_rtl_0_rxd : in STD_LOGIC;
    uart_rtl_0_txd : out STD_LOGIC
  );
end microblaze_i2s_wrapper;

architecture STRUCTURE of microblaze_i2s_wrapper is
  component microblaze_i2s is
  port (
    uart_rtl_0_rxd : in STD_LOGIC;
    uart_rtl_0_txd : out STD_LOGIC;
    clk_100MHz : in STD_LOGIC;
    reset_rtl_0 : in STD_LOGIC;
    timer_1_pwm : out STD_LOGIC;
    i2s_receiver_irq : out STD_LOGIC;
    i2s_receiver_lrclk_out : out STD_LOGIC;
    i2s_receiver_sclk_out : out STD_LOGIC;
    i2s_transmitter_irq : out STD_LOGIC;
    i2s_transmitter_sclk_out : out STD_LOGIC;
    i2s_transmitter_lrclk_out : out STD_LOGIC;
    i2s_transmitter_sdata_0_out : out STD_LOGIC;
    sdata_0_in_0 : in STD_LOGIC
  );
  end component microblaze_i2s;
begin
microblaze_i2s_i: component microblaze_i2s
     port map (
      clk_100MHz => clk_100MHz,
      i2s_receiver_irq => i2s_receiver_irq,
      i2s_receiver_lrclk_out => i2s_receiver_lrclk_out,
      i2s_receiver_sclk_out => i2s_receiver_sclk_out,
      i2s_transmitter_irq => i2s_transmitter_irq,
      i2s_transmitter_lrclk_out => i2s_transmitter_lrclk_out,
      i2s_transmitter_sclk_out => i2s_transmitter_sclk_out,
      i2s_transmitter_sdata_0_out => i2s_transmitter_sdata_0_out,
      reset_rtl_0 => reset_rtl_0,
      sdata_0_in_0 => sdata_0_in_0,
      timer_1_pwm => timer_1_pwm,
      uart_rtl_0_rxd => uart_rtl_0_rxd,
      uart_rtl_0_txd => uart_rtl_0_txd
    );
end STRUCTURE;
