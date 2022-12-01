//-----------------------------------------------------------------------------
// (c) Copyright 2009 - 2018 Xilinx, Inc. All rights reserved.
//
//  This file contains confidential and proprietary information
//  of Xilinx, Inc. and is protected under U.S. and 
//  international copyright and other intellectual property
//  laws.
//  
//  DISCLAIMER
//  This disclaimer is not a license and does not grant any
//  rights to the materials distributed herewith. Except as
//  otherwise provided in a valid license issued to you by
//  Xilinx, and to the maximum extent permitted by applicable
//  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
//  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
//  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
//  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
//  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
//  (2) Xilinx shall not be liable (whether in contract or tort,
//  including negligence, or under any other theory of
//  liability) for any loss or damage of any kind or nature
//  related to, arising under or in connection with these
//  materials, including for any direct, or any indirect,
//  special, incidental, or consequential loss or damage
//  (including loss of data, profits, goodwill, or any type of
//  loss or damage suffered as a result of any action brought
//  by a third party) even if such damage or loss was
//  reasonably foreseeable or Xilinx had been advised of the
//  possibility of the same.
//  
//  CRITICAL APPLICATIONS
//  Xilinx products are not designed or intended to be fail-
//  safe, or for use in any application requiring fail-safe
//  performance, such as life-support or safety devices or
//  systems, Class III medical devices, nuclear facilities,
//  applications related to the deployment of airbags, or any
//  other applications that could lead to death, personal
//  injury, or severe property or environmental damage
//  (individually and collectively, "Critical
//  Applications"). Customer assumes the sole risk and
//  liability of any use of Xilinx products in Critical
//  Applications, subject only to applicable laws and
//  regulations governing limitations on product liability.
//  
//  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
//  PART OF THIS FILE AT ALL TIMES.


//TestExdes
`timescale 1ns/1ps
(* DowngradeIPIdentifiedWarnings="yes" *)


module i2s_receiver_0_exdes 
   (
//  axi_pclk,
//  axi_nclk,
  axi_reset,
  mclk_p,
//  mclk_n,
  mreset_r,
    iAxiClk,
    iAxiResetn,
 //   iAxisClk,
 //   iAxisResetn,
    iMClk,
    iMRst,
   sclk_tx,
    sclk_rx,
    lrclk_tx,
    lrclk_rx,
    i2s_receiver_0_sdata_0_in,
    i2s_transmitter_0_sdata_0_out, 
    oIRQ_I2sRx,
    oIRQ_I2sTx,
//-------------------------
//    m_axis_audio_tdata,
//    m_axis_audio_tid,
//    m_axis_audio_tready,
//    m_axis_audio_tvalid,
//
//    s_axis_audio_tdata,
//    s_axis_audio_tid,
//    s_axis_audio_tready,
//    s_axis_audio_tvalid
//-------------------------
	DataGen_Enable,
	DataChk_Enable,
	DataChk_InSync,
	DataChk_Error
);
//  input axi_pclk;
//  input axi_nclk;
  input axi_reset;
  input mclk_p;
//  input mclk_n;
  input mreset_r;

  output iAxiClk;
  output iAxiResetn;
//  input iAxisClk;
//  input iAxisResetn;
  output iMClk;
  output iMRst;
  output sclk_tx;
  output sclk_rx;
  output lrclk_tx;
  output lrclk_rx;
  input i2s_receiver_0_sdata_0_in;
  output i2s_transmitter_0_sdata_0_out; 

  output oIRQ_I2sRx;
  output oIRQ_I2sTx;
input DataGen_Enable;
input DataChk_Enable;
output DataChk_InSync;
output DataChk_Error;

wire  [31:0]m_axis_audio_tdata;
wire  [2:0]m_axis_audio_tid;
wire m_axis_audio_tready;
wire  m_axis_audio_tvalid;

wire [31:0]s_axis_audio_tdata;
wire [2:0]s_axis_audio_tid;
wire  s_axis_audio_tready;
wire s_axis_audio_tvalid;
 
//  output [31:0]m_axis_audio_tdata;
//  output [2:0]m_axis_audio_tid;
//  input m_axis_audio_tready;
//  output m_axis_audio_tvalid;
//
//  input [31:0]s_axis_audio_tdata;
//  input [2:0]s_axis_audio_tid;
//  output s_axis_audio_tready;
//  input s_axis_audio_tvalid;
 
  wire [31:0]I2sReceiver_0_m_axis_TDATA;
  wire [2:0]I2sReceiver_0_m_axis_TID;
  wire I2sReceiver_0_m_axis_TREADY;
  wire I2sReceiver_0_m_axis_TVALID;
  wire I2sReceiver_0_oIRQ;


  wire [31:0]axi_interconnect_0_M00_AXI_ARADDR;
  wire axi_interconnect_0_M00_AXI_ARREADY;
  wire axi_interconnect_0_M00_AXI_ARVALID;
  wire [31:0]axi_interconnect_0_M00_AXI_AWADDR;
  wire axi_interconnect_0_M00_AXI_AWREADY;
  wire axi_interconnect_0_M00_AXI_AWVALID;
  wire axi_interconnect_0_M00_AXI_BREADY;
  wire [1:0]axi_interconnect_0_M00_AXI_BRESP;
  wire axi_interconnect_0_M00_AXI_BVALID;
  wire [31:0]axi_interconnect_0_M00_AXI_RDATA;
  wire axi_interconnect_0_M00_AXI_RREADY;
  wire [1:0]axi_interconnect_0_M00_AXI_RRESP;
  wire axi_interconnect_0_M00_AXI_RVALID;
  wire [31:0]axi_interconnect_0_M00_AXI_WDATA;
  wire axi_interconnect_0_M00_AXI_WREADY;
  wire axi_interconnect_0_M00_AXI_WVALID;

  wire [31:0]axi_interconnect_0_M01_AXI_ARADDR;
  wire axi_interconnect_0_M01_AXI_ARREADY;
  wire axi_interconnect_0_M01_AXI_ARVALID;
  wire [31:0]axi_interconnect_0_M01_AXI_AWADDR;
  wire axi_interconnect_0_M01_AXI_AWREADY;
  wire axi_interconnect_0_M01_AXI_AWVALID;
  wire axi_interconnect_0_M01_AXI_BREADY;
  wire [1:0]axi_interconnect_0_M01_AXI_BRESP;
  wire axi_interconnect_0_M01_AXI_BVALID;
  wire [31:0]axi_interconnect_0_M01_AXI_RDATA;
  wire axi_interconnect_0_M01_AXI_RREADY;
  wire [1:0]axi_interconnect_0_M01_AXI_RRESP;
  wire axi_interconnect_0_M01_AXI_RVALID;
  wire [31:0]axi_interconnect_0_M01_AXI_WDATA;
  wire axi_interconnect_0_M01_AXI_WREADY;
  wire axi_interconnect_0_M01_AXI_WVALID;

  wire i2s_transmitter_0_irq;
//  wire i2s_transmitter_0_lrclk_out;
//  wire i2s_transmitter_0_sclk_out;
  wire lrclk;
  wire sclk;
  wire i2s_transmitter_0_sdata_0_out;
  wire i2s_transmitter_0_sdata_1_out;
  wire i2s_transmitter_0_sdata_2_out;
  wire i2s_transmitter_0_sdata_3_out;
  wire iAxiClk_1;
  wire iAxiResetn_1;
  wire iAxisClk_1;
  wire iAxisResetn_1;
  wire iMClk_1;
  wire iMRst_1;
  wire [31:0]s_axis_audio_1_TDATA;
  wire [2:0]s_axis_audio_1_TID;
  wire s_axis_audio_1_TREADY;
  wire s_axis_audio_1_TVALID;

//----- Clock generation-----Wizard---
wire locked_m;
wire locked_axi;

clk_wiz_0 CLOCK_GEN_INST1( 
           .clk_in1   (mclk_p ),
         //  .clk_in1_n   (mclk_n ),
           .reset       (mreset_r     ),
           .locked      (locked_m    ),
           .clk_out1    (iMClk),
           .clk_out2    (iAxiClk)
	   );

assign iMRst = !locked_m;

//clk_wiz_1 CLOCK_GEN_INST2( 
//           .clk_in1   (axi_pclk ),
        //   .clk_in1_n   (axi_nclk ),
//           .reset       (axi_reset     ),
//           .locked      (locked_axi    ),
//           .clk_out1    (iAxiClk)
//	   );

assign iAxiResetn = locked_m;

exdes_axis_chk checker_1
(
 .clk(iAxiClk),
 .resetn(iAxiResetn),

 .DataChk_Enable(DataChk_Enable),
 .s_axis_audio_tready(m_axis_audio_tready),
 .s_axis_audio_tvalid(m_axis_audio_tvalid),
 .s_axis_audio_tid(m_axis_audio_tid),
 .s_axis_audio_tdata(m_axis_audio_tdata),

 .DataChk_InSync(DataChk_InSync),
 .DataChk_Error(DataChk_Error)
);

exdes_axis_gen generator_1
(
 .clk(iAxiClk),
 .resetn(iAxiResetn),

 .DataGen_Enable(DataGen_Enable),
 .m_axis_audio_tready(s_axis_audio_tready),
 .m_axis_audio_tvalid(s_axis_audio_tvalid),
 .m_axis_audio_tid(s_axis_audio_tid),
 .m_axis_audio_tdata(s_axis_audio_tdata)
);


  assign I2sReceiver_0_m_axis_TREADY = m_axis_audio_tready;
  assign iAxiClk_1 = iAxiClk;
  assign iAxiResetn_1 = iAxiResetn;
//  assign iAxisClk_1 = iAxisClk;
//  assign iAxiResetn_1 = iAxiResetn;
  assign iAxisClk_1 = iAxiClk;
  assign iAxisResetn_1 = iAxiResetn;
  assign iMClk_1 = iMClk;
  assign iMRst_1 = iMRst;
  assign m_axis_audio_tdata[31:0] = I2sReceiver_0_m_axis_TDATA;
  assign m_axis_audio_tid[2:0] = I2sReceiver_0_m_axis_TID;
  assign m_axis_audio_tvalid = I2sReceiver_0_m_axis_TVALID;
  assign oIRQ_I2sRx = I2sReceiver_0_oIRQ;
  assign oIRQ_I2sTx = i2s_transmitter_0_irq;
  assign s_axis_audio_1_TDATA = s_axis_audio_tdata[31:0];
  assign s_axis_audio_1_TID = s_axis_audio_tid[2:0];
  assign s_axis_audio_1_TVALID = s_axis_audio_tvalid;
  assign s_axis_audio_tready = s_axis_audio_1_TREADY;


 axi_traffic_gen_1 ATG1
   (
    .s_axi_aclk            (iAxiClk_1),
    .s_axi_aresetn         (iAxiResetn_1),
    .m_axi_lite_ch1_awaddr (axi_interconnect_0_M01_AXI_AWADDR),
    .m_axi_lite_ch1_awprot (),
    .m_axi_lite_ch1_awvalid(axi_interconnect_0_M01_AXI_AWVALID),
    .m_axi_lite_ch1_awready(axi_interconnect_0_M01_AXI_AWREADY),
    .m_axi_lite_ch1_wdata  (axi_interconnect_0_M01_AXI_WDATA),
    .m_axi_lite_ch1_wstrb  (),
    .m_axi_lite_ch1_wvalid (axi_interconnect_0_M01_AXI_WVALID),
    .m_axi_lite_ch1_wready (axi_interconnect_0_M01_AXI_WREADY),
    .m_axi_lite_ch1_bresp  (axi_interconnect_0_M01_AXI_BRESP),
    .m_axi_lite_ch1_bvalid (axi_interconnect_0_M01_AXI_BVALID),
    .m_axi_lite_ch1_bready (axi_interconnect_0_M01_AXI_BREADY),
    .m_axi_lite_ch1_araddr (axi_interconnect_0_M01_AXI_ARADDR),
    .m_axi_lite_ch1_arvalid(axi_interconnect_0_M01_AXI_ARVALID),
    .m_axi_lite_ch1_arready(axi_interconnect_0_M01_AXI_ARREADY),
    .m_axi_lite_ch1_rdata  (axi_interconnect_0_M01_AXI_RDATA),
    .m_axi_lite_ch1_rvalid (axi_interconnect_0_M01_AXI_RVALID),
    .m_axi_lite_ch1_rready (axi_interconnect_0_M01_AXI_RREADY),
    .m_axi_lite_ch1_rresp  (axi_interconnect_0_M01_AXI_RRESP),
    .done                  ( ),
    .status                ( )
  );


  i2s_receiver_0 i2s_receiver_0
       (.aud_mclk(iMClk_1),
        .aud_mrst(iMRst_1),
        .irq(I2sReceiver_0_oIRQ),
        .m_axis_aud_aclk(iAxisClk_1),
        .m_axis_aud_aresetn(iAxisResetn_1),
        .m_axis_aud_tdata(I2sReceiver_0_m_axis_TDATA),
        .m_axis_aud_tid(I2sReceiver_0_m_axis_TID),
        .m_axis_aud_tready(I2sReceiver_0_m_axis_TREADY),
        .m_axis_aud_tvalid(I2sReceiver_0_m_axis_TVALID),
        .s_axi_ctrl_aclk(iAxiClk_1),
        .s_axi_ctrl_araddr(axi_interconnect_0_M01_AXI_ARADDR[7:0]),
        .s_axi_ctrl_aresetn(iAxiResetn_1),
        .s_axi_ctrl_arready(axi_interconnect_0_M01_AXI_ARREADY),
        .s_axi_ctrl_arvalid(axi_interconnect_0_M01_AXI_ARVALID),
        .s_axi_ctrl_awaddr(axi_interconnect_0_M01_AXI_AWADDR[7:0]),
        .s_axi_ctrl_awready(axi_interconnect_0_M01_AXI_AWREADY),
        .s_axi_ctrl_awvalid(axi_interconnect_0_M01_AXI_AWVALID),
        .s_axi_ctrl_bready(axi_interconnect_0_M01_AXI_BREADY),
        .s_axi_ctrl_bresp(axi_interconnect_0_M01_AXI_BRESP),
        .s_axi_ctrl_bvalid(axi_interconnect_0_M01_AXI_BVALID),
        .s_axi_ctrl_rdata(axi_interconnect_0_M01_AXI_RDATA),
        .s_axi_ctrl_rready(axi_interconnect_0_M01_AXI_RREADY),
        .s_axi_ctrl_rresp(axi_interconnect_0_M01_AXI_RRESP),
        .s_axi_ctrl_rvalid(axi_interconnect_0_M01_AXI_RVALID),
        .s_axi_ctrl_wdata(axi_interconnect_0_M01_AXI_WDATA),
        .s_axi_ctrl_wready(axi_interconnect_0_M01_AXI_WREADY),
        .s_axi_ctrl_wvalid(axi_interconnect_0_M01_AXI_WVALID),


        .lrclk_out(lrclk_rx),
        .sclk_out(sclk_rx),

        .sdata_0_in(i2s_receiver_0_sdata_0_in)

);

 axi_traffic_gen_0 ATG2
   (
    .s_axi_aclk            (iAxiClk_1),
    .s_axi_aresetn         (iAxiResetn_1),
    .m_axi_lite_ch1_awaddr (axi_interconnect_0_M00_AXI_AWADDR),
    .m_axi_lite_ch1_awprot (),
    .m_axi_lite_ch1_awvalid(axi_interconnect_0_M00_AXI_AWVALID),
    .m_axi_lite_ch1_awready(axi_interconnect_0_M00_AXI_AWREADY),
    .m_axi_lite_ch1_wdata  (axi_interconnect_0_M00_AXI_WDATA),
    .m_axi_lite_ch1_wstrb  (),
    .m_axi_lite_ch1_wvalid (axi_interconnect_0_M00_AXI_WVALID),
    .m_axi_lite_ch1_wready (axi_interconnect_0_M00_AXI_WREADY),
    .m_axi_lite_ch1_bresp  (axi_interconnect_0_M00_AXI_BRESP),
    .m_axi_lite_ch1_bvalid (axi_interconnect_0_M00_AXI_BVALID),
    .m_axi_lite_ch1_bready (axi_interconnect_0_M00_AXI_BREADY),
    .m_axi_lite_ch1_araddr (axi_interconnect_0_M00_AXI_ARADDR),
    .m_axi_lite_ch1_arvalid(axi_interconnect_0_M00_AXI_ARVALID),
    .m_axi_lite_ch1_arready(axi_interconnect_0_M00_AXI_ARREADY),
    .m_axi_lite_ch1_rdata  (axi_interconnect_0_M00_AXI_RDATA),
    .m_axi_lite_ch1_rvalid (axi_interconnect_0_M00_AXI_RVALID),
    .m_axi_lite_ch1_rready (axi_interconnect_0_M00_AXI_RREADY),
    .m_axi_lite_ch1_rresp  (axi_interconnect_0_M00_AXI_RRESP),
    .done                  ( ),
    .status                ( )
  );


  i2s_transmitter_1 i2s_transmitter_0
(
	.aud_mclk(iMClk_1),
        .aud_mrst(iMRst_1),
        .irq(i2s_transmitter_0_irq),
        .s_axi_ctrl_aclk(iAxiClk_1),
        .s_axi_ctrl_araddr(axi_interconnect_0_M00_AXI_ARADDR[7:0]),
        .s_axi_ctrl_aresetn(iAxiResetn_1),
        .s_axi_ctrl_arready(axi_interconnect_0_M00_AXI_ARREADY),
        .s_axi_ctrl_arvalid(axi_interconnect_0_M00_AXI_ARVALID),
        .s_axi_ctrl_awaddr(axi_interconnect_0_M00_AXI_AWADDR[7:0]),
        .s_axi_ctrl_awready(axi_interconnect_0_M00_AXI_AWREADY),
        .s_axi_ctrl_awvalid(axi_interconnect_0_M00_AXI_AWVALID),
        .s_axi_ctrl_bready(axi_interconnect_0_M00_AXI_BREADY),
        .s_axi_ctrl_bresp(axi_interconnect_0_M00_AXI_BRESP),
        .s_axi_ctrl_bvalid(axi_interconnect_0_M00_AXI_BVALID),
        .s_axi_ctrl_rdata(axi_interconnect_0_M00_AXI_RDATA),
        .s_axi_ctrl_rready(axi_interconnect_0_M00_AXI_RREADY),
        .s_axi_ctrl_rresp(axi_interconnect_0_M00_AXI_RRESP),
        .s_axi_ctrl_rvalid(axi_interconnect_0_M00_AXI_RVALID),
        .s_axi_ctrl_wdata(axi_interconnect_0_M00_AXI_WDATA),
        .s_axi_ctrl_wready(axi_interconnect_0_M00_AXI_WREADY),
        .s_axi_ctrl_wvalid(axi_interconnect_0_M00_AXI_WVALID),
        .s_axis_aud_aclk(iAxisClk_1),
        .s_axis_aud_aresetn(iAxisResetn_1),
        .s_axis_aud_tdata(s_axis_audio_1_TDATA),
        .s_axis_aud_tid(s_axis_audio_1_TID),
        .s_axis_aud_tready(s_axis_audio_1_TREADY),
        .s_axis_aud_tvalid(s_axis_audio_1_TVALID),


        .sclk_out(sclk_tx),
        .lrclk_out(lrclk_tx),

        .sdata_0_out(i2s_transmitter_0_sdata_0_out)
);

endmodule

