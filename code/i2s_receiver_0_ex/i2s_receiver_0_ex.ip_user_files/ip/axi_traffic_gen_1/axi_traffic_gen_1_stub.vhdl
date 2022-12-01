-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Thu Dec  1 15:42:44 2022
-- Host        : FERNAN-LAPTOP running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/DSD/Labos_2022/DSD-project/code/i2s_receiver_0_ex/i2s_receiver_0_ex.srcs/sources_1/ip/axi_traffic_gen_1/axi_traffic_gen_1_stub.vhdl
-- Design      : axi_traffic_gen_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity axi_traffic_gen_1 is
  Port ( 
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    m_axi_lite_ch1_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_lite_ch1_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_lite_ch1_awvalid : out STD_LOGIC;
    m_axi_lite_ch1_awready : in STD_LOGIC;
    m_axi_lite_ch1_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_lite_ch1_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_lite_ch1_wvalid : out STD_LOGIC;
    m_axi_lite_ch1_wready : in STD_LOGIC;
    m_axi_lite_ch1_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_lite_ch1_bvalid : in STD_LOGIC;
    m_axi_lite_ch1_bready : out STD_LOGIC;
    m_axi_lite_ch1_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_lite_ch1_arvalid : out STD_LOGIC;
    m_axi_lite_ch1_arready : in STD_LOGIC;
    m_axi_lite_ch1_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_lite_ch1_rvalid : in STD_LOGIC;
    m_axi_lite_ch1_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_lite_ch1_rready : out STD_LOGIC;
    done : out STD_LOGIC;
    status : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end axi_traffic_gen_1;

architecture stub of axi_traffic_gen_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_aclk,s_axi_aresetn,m_axi_lite_ch1_awaddr[31:0],m_axi_lite_ch1_awprot[2:0],m_axi_lite_ch1_awvalid,m_axi_lite_ch1_awready,m_axi_lite_ch1_wdata[31:0],m_axi_lite_ch1_wstrb[3:0],m_axi_lite_ch1_wvalid,m_axi_lite_ch1_wready,m_axi_lite_ch1_bresp[1:0],m_axi_lite_ch1_bvalid,m_axi_lite_ch1_bready,m_axi_lite_ch1_araddr[31:0],m_axi_lite_ch1_arvalid,m_axi_lite_ch1_arready,m_axi_lite_ch1_rdata[31:0],m_axi_lite_ch1_rvalid,m_axi_lite_ch1_rresp[1:0],m_axi_lite_ch1_rready,done,status[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "axi_traffic_gen_v3_0_6_top,Vivado 2019.2";
begin
end;
