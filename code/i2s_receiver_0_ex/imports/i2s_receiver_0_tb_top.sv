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


//tb
`timescale 1ns/1ps
(* DowngradeIPIdentifiedWarnings="yes" *)

module i2s_receiver_0_tb_top 
();

localparam cAXI_BASEADDR_I2S_RX = 'h44A00000;
localparam cAXI_BASEADDR_I2S_TX = 'h44A10000;

//localparam pI2S_DWIDTH = 24;
//localparam pNUM_I2S_CHANNELS = 4;

localparam pMCLK_PERIOD = 27.14ns;

logic axi_clk;
logic axi_rstn;

logic mclk;
logic mreset;

logic        nAxi_Ctrl_AWReady_0;
logic        nAxi_Ctrl_AWValid_0 = 0;
logic [31:0] nAxi_Ctrl_AWAddr_0;
logic        nAxi_Ctrl_WReady_0;
logic        nAxi_Ctrl_WValid_0 = 0;
logic [31:0] nAxi_Ctrl_WData_0;
logic        nAxi_Ctrl_BReady_0 = 0;
logic        nAxi_Ctrl_BValid_0;
logic [ 1:0] nAxi_Ctrl_BResp_0;
logic        nAxi_Ctrl_ARReady_0;
logic        nAxi_Ctrl_ARValid_0 = 0;
logic [31:0] nAxi_Ctrl_ARAddr_0;
logic        nAxi_Ctrl_RReady_0 = 0;
logic        nAxi_Ctrl_RValid_0;
logic [31:0] nAxi_Ctrl_RData_0;
logic [ 1:0] nAxi_Ctrl_RResp_0;

logic        nAxi_Ctrl_AWReady_1;
logic        nAxi_Ctrl_AWValid_1 = 0;
logic [31:0] nAxi_Ctrl_AWAddr_1;
logic        nAxi_Ctrl_WReady_1;
logic        nAxi_Ctrl_WValid_1 = 0;
logic [31:0] nAxi_Ctrl_WData_1;
logic        nAxi_Ctrl_BReady_1 = 0;
logic        nAxi_Ctrl_BValid_1;
logic [ 1:0] nAxi_Ctrl_BResp_1;
logic        nAxi_Ctrl_ARReady_1;
logic        nAxi_Ctrl_ARValid_1 = 0;
logic [31:0] nAxi_Ctrl_ARAddr_1;
logic        nAxi_Ctrl_RReady_1 = 0;
logic        nAxi_Ctrl_RValid_1;
logic [31:0] nAxi_Ctrl_RData_1;
logic [ 1:0] nAxi_Ctrl_RResp_1;

logic        nAxis_TValid_ToTransmitter;
logic        nAxis_TReady_FromTransmitter;
logic [ 2:0] nAxis_TID_ToTransmitter;
logic [31:0] nAxis_TData_ToTransmitter;

logic        nAxis_TValid_FromReceiver;
logic        nAxis_TReady_ToReceiver;
logic [ 2:0] nAxis_TID_FromReceiver;
logic [31:0] nAxis_TData_FromReceiver;

logic axi_pclk;
logic axi_nclk;
logic axi_reset;

logic mclk_p;
logic mclk_n;
logic mreset_r;

/*initial begin
  axi_clk = 1'b0;
  forever
    #5 axi_clk = ~axi_clk;
end

initial begin
  axi_rstn = 1'b0;
  
  #25 axi_rstn = 1'b1;
  
  #5000;
end

initial begin
  mclk = 1'b0;
  forever
    #((pMCLK_PERIOD)/2) mclk = ~mclk;
end

initial begin
  mreset = 1'b1;
  
  #50 mreset = 1'b0;
  
  #5000;
end
*/

initial begin
 axi_pclk = 0;
 forever #5 axi_pclk = ~axi_pclk;
end

initial begin
 axi_nclk = 1;
 forever #5 axi_nclk = ~axi_nclk;
end

initial begin
 axi_reset = 1'b1;
 #200 axi_reset = 1'b0;
end

initial begin
 mclk_p = 1'b0;
// forever #((pMCLK_PERIOD)/2) mclk_p = ~mclk_p;
 forever #5 mclk_p = ~mclk_p;
end

initial begin
 mclk_n = 1'b1;
// forever #((pMCLK_PERIOD)/2) mclk_n = ~mclk_n;
 forever #5 mclk_n = ~mclk_n;
end

initial begin
 mreset_r = 1'b1;
 #200 mreset_r = 1'b0;
end

logic                   DataGen_Enable = 0;
logic                   DataChk_Enable = 0;
logic                   DataChk_InSync;
logic                   DataChk_Error;
logic sclk;
logic lrclk;
logic sclks;
logic lrclks;
logic i2s_transmitter_0_sdata_0_out;
logic i2s_transmitter_0_sdata_1_out;
logic i2s_transmitter_0_sdata_2_out;
logic i2s_transmitter_0_sdata_3_out;
logic i2s_receiver_0_sdata_0_in;
logic i2s_receiver_0_sdata_1_in;
logic i2s_receiver_0_sdata_2_in;
logic i2s_receiver_0_sdata_3_in;

i2s_receiver_0_exdes
IPI_INST
(
//  .axi_pclk		(axi_pclk),
//  .axi_nclk		(axi_nclk),
  .axi_reset		(axi_reset),

  .mclk_p		(mclk_p),
//  .mclk_n		(mclk_n),
  .mreset_r		(mreset_r),

  .iAxiClk             (axi_clk),
  .iAxiResetn          (axi_rstn),
  
//  .iAxisClk            (axi_clk),
//  .iAxisResetn         (axi_rstn),
  
  .iMClk               (mclk),
  .iMRst               (mreset),
    .sclk_tx (sclk),
    .sclk_rx (sclks),
    .lrclk_tx (lrclk),
    .lrclk_rx (lrclks),
    .i2s_receiver_0_sdata_0_in(i2s_receiver_0_sdata_0_in),
    .i2s_transmitter_0_sdata_0_out(i2s_transmitter_0_sdata_0_out), 
  
 
  // IRQs
  .oIRQ_I2sTx          (),
  .oIRQ_I2sRx          (),
  
  // AXI-Stream Audio In
///  .s_axis_audio_tvalid (nAxis_TValid_ToTransmitter),
///  .s_axis_audio_tready (nAxis_TReady_FromTransmitter),
///  .s_axis_audio_tid    (nAxis_TID_ToTransmitter),
///  .s_axis_audio_tdata  (nAxis_TData_ToTransmitter),
///  
///  // AXI-Stream Audio Out
///  .m_axis_audio_tvalid (nAxis_TValid_FromReceiver),
///  .m_axis_audio_tready (nAxis_TReady_ToReceiver),
///  .m_axis_audio_tid    (nAxis_TID_FromReceiver),
///  .m_axis_audio_tdata  (nAxis_TData_FromReceiver)

 .DataGen_Enable(DataGen_Enable),
 .DataChk_Enable(DataChk_Enable),
 .DataChk_InSync(DataChk_InSync),
 .DataChk_Error(DataChk_Error)

);

  parameter   DEPTH     = 4;
    parameter   PTR_WIDTH = 2;
    parameter   DWIDTH    = 24; //24;


reg  [PTR_WIDTH-1:0] wr_ptr;
reg  [PTR_WIDTH-1:0] wr_ptr1;
reg  [PTR_WIDTH-1:0] rd_ptr;
reg  [PTR_WIDTH-1:0] rd_ptr1;
reg  [DWIDTH-1:0] meml [0:DEPTH-1];
reg  [DWIDTH-1:0] memr [0:DEPTH-1];
reg  [DWIDTH-1:0] meml1 [0:DEPTH-1];
reg  [DWIDTH-1:0] memr1 [0:DEPTH-1];
reg  [DWIDTH-1:0] meml2 [0:DEPTH-1];
reg  [DWIDTH-1:0] memr2 [0:DEPTH-1];
reg  [DWIDTH-1:0] meml3 [0:DEPTH-1];
reg  [DWIDTH-1:0] memr3 [0:DEPTH-1];
reg  [31:0]          init;
wire [31:0]          rd_ptr_init;
//reg  i2s_transmitter_0_sdata_0_in;
reg  i2s_transmitter_0_lrclk_0_in;
reg i2s_transmitter_0_sdata_0_in1;
reg sclk_del;
reg sclks_del;
reg sclks_del1;
reg lrclks_del;
reg lrclk_del;
reg [2:0] count;
reg [23:0] acc_l;
reg [23:0] acc_r;
reg [23:0] acc_l1;
reg [23:0] acc_r1;
reg [23:0] acc_l2;
reg [23:0] acc_r2;
reg [23:0] acc_l3;
reg [23:0] acc_r3;
reg [23:0] load;
reg [23:0] load1;
reg [23:0] load2;
reg [23:0] load3;

//---------------------------------------
// write logic and control bit
//---------------------------------------
always @ ( posedge mclk or posedge mreset )
begin
   if ( mreset )
   begin
       acc_l <= 0;
       acc_r <= 0;
       acc_l1 <= 0;
       acc_r1 <= 0;
       acc_l2 <= 0;
       acc_r2 <= 0;
       acc_l3 <= 0;
       acc_r3 <= 0;
       sclk_del <= 0;
       lrclk_del <= 0;
       wr_ptr  <= { PTR_WIDTH { 1'b 0 } };
       wr_ptr1 <= { PTR_WIDTH { 1'b 0 } };
       meml[0]       <= { DWIDTH { 1'b 0 } };
       meml[1]       <= { DWIDTH { 1'b 0 } };
       meml[2]       <= { DWIDTH { 1'b 0 } };
       meml[3]       <= { DWIDTH { 1'b 0 } };
       memr[0]       <= { DWIDTH { 1'b 0 } };
       memr[1]       <= { DWIDTH { 1'b 0 } };
       memr[2]       <= { DWIDTH { 1'b 0 } };
       memr[3]       <= { DWIDTH { 1'b 0 } };

       meml1[0]       <= { DWIDTH { 1'b 0 } };
       meml1[1]       <= { DWIDTH { 1'b 0 } };
       meml1[2]       <= { DWIDTH { 1'b 0 } };
       meml1[3]       <= { DWIDTH { 1'b 0 } };
       memr1[0]       <= { DWIDTH { 1'b 0 } };
       memr1[1]       <= { DWIDTH { 1'b 0 } };
       memr1[2]       <= { DWIDTH { 1'b 0 } };
       memr1[3]       <= { DWIDTH { 1'b 0 } };

       meml2[0]       <= { DWIDTH { 1'b 0 } };
       meml2[1]       <= { DWIDTH { 1'b 0 } };
       meml2[2]       <= { DWIDTH { 1'b 0 } };
       meml2[3]       <= { DWIDTH { 1'b 0 } };
       memr2[0]       <= { DWIDTH { 1'b 0 } };
       memr2[1]       <= { DWIDTH { 1'b 0 } };
       memr2[2]       <= { DWIDTH { 1'b 0 } };
       memr2[3]       <= { DWIDTH { 1'b 0 } };

       meml3[0]       <= { DWIDTH { 1'b 0 } };
       meml3[1]       <= { DWIDTH { 1'b 0 } };
       meml3[2]       <= { DWIDTH { 1'b 0 } };
       meml3[3]       <= { DWIDTH { 1'b 0 } };
       memr3[0]       <= { DWIDTH { 1'b 0 } };
       memr3[1]       <= { DWIDTH { 1'b 0 } };
       memr3[2]       <= { DWIDTH { 1'b 0 } };
       memr3[3]       <= { DWIDTH { 1'b 0 } };
   end
   else begin
       sclk_del <= sclk;
       lrclk_del <= lrclk;
       if (sclk && !sclk_del) begin
        if (!lrclk) begin
          acc_l <= {acc_l[24-2:0],i2s_transmitter_0_sdata_0_out};
          acc_l1 <= {acc_l[24-2:0],i2s_transmitter_0_sdata_1_out};
          acc_l2 <= {acc_l[24-2:0],i2s_transmitter_0_sdata_2_out};
          acc_l3 <= {acc_l[24-2:0],i2s_transmitter_0_sdata_3_out};
        end
        else begin
          acc_r <= {acc_r[24-2:0],i2s_transmitter_0_sdata_0_out};
          acc_r1 <= {acc_r[24-2:0],i2s_transmitter_0_sdata_1_out};
          acc_r2 <= {acc_r[24-2:0],i2s_transmitter_0_sdata_2_out};
          acc_r3 <= {acc_r[24-2:0],i2s_transmitter_0_sdata_3_out};
        end
       end
       
       if (lrclk && !lrclk_del) begin //store left
                wr_ptr             <= wr_ptr + 1'b 1;
                meml[wr_ptr]        <= acc_l;
                meml1[wr_ptr]        <= acc_l1;
                meml2[wr_ptr]        <= acc_l2;
                meml3[wr_ptr]        <= acc_l3;
       end
       if (!lrclk && lrclk_del) begin //store right
                wr_ptr1             <= wr_ptr1 + 1'b 1;
                memr[wr_ptr1]        <= acc_r;
                memr1[wr_ptr1]        <= acc_r1;
                memr2[wr_ptr1]        <= acc_r2;
                memr3[wr_ptr1]        <= acc_r3;
       end
   end
end

//---------------------------------------
// read logic and control bit output
//---------------------------------------
assign rd_ptr_init = ( DEPTH >> 1 ); // reset to middle of fifo

always @ ( posedge mclk or posedge mreset )
begin
   if ( mreset ) begin
   lrclks_del <= 1;
   load <=0;
   load1 <=0;
   load2 <=0;
   load3 <=0;
   rd_ptr    <= rd_ptr_init[PTR_WIDTH-1:0];
   rd_ptr1    <= rd_ptr_init[PTR_WIDTH-1:0];
   sclks_del <= 1'b0;
   end
   else begin
      sclks_del <= sclks;
      lrclks_del <= lrclks;
      if (sclks && !sclks_del) begin
           load <= {load [24-2:0], load[0]};
           load1 <= {load1 [24-2:0], load1[0]};
           load2 <= {load2 [24-2:0], load2[0]};
           load3 <= {load3 [24-2:0], load3[0]};
      end
      if (lrclks && !lrclks_del) begin //read right
                rd_ptr1             <= rd_ptr1 + 1'b 1;
                load <= memr[rd_ptr1];
                load1 <= memr1[rd_ptr1];
                load2 <= memr2[rd_ptr1];
                load3 <= memr3[rd_ptr1];
       end
       if (!lrclks && lrclks_del) begin //read left
                rd_ptr             <= rd_ptr + 1'b 1;
                load <= meml[rd_ptr];
                load1 <= meml1[rd_ptr];
                load2 <= meml2[rd_ptr];
                load3 <= meml3[rd_ptr];
       end
   end
end

assign            i2s_receiver_0_sdata_0_in = load[24-1];
assign            i2s_receiver_0_sdata_1_in = load1[24-1];
assign            i2s_receiver_0_sdata_2_in = load2[24-1];
assign            i2s_receiver_0_sdata_3_in = load3[24-1];



logic signed [24 -1:0] DataGen_SampleValues [2* 1];
logic [191:0]           DataGen_ChannelStatus;
integer                 DataGen_ChannelCounter;
integer                 DataGen_FrameCounter;
logic [31:0]            DataGen_AesOut;

logic [3:0] cAES_BSYNC   = 4'b0001;
logic [3:0] cAES_SF1SYNC = 4'b0010;
logic [3:0] cAES_SF2SYNC = 4'b0011;

/*always_ff @(posedge axi_clk)
begin
  if (!axi_rstn || !DataGen_Enable) begin
    nAxis_TValid_ToTransmitter <= 1'b0;
    DataGen_ChannelCounter = 0;
    DataGen_FrameCounter = 0;
    foreach (DataGen_SampleValues[i]) begin
      DataGen_SampleValues[i] = 0;
    end
  end
  else begin
    
    if (!nAxis_TValid_ToTransmitter || 
       (nAxis_TValid_ToTransmitter & nAxis_TReady_FromTransmitter)) begin
      nAxis_TValid_ToTransmitter <= 1'b1;
      
      nAxis_TID_ToTransmitter    <= DataGen_ChannelCounter;
      
      DataGen_AesOut[31] = 0;
      DataGen_AesOut[30] = DataGen_ChannelStatus[DataGen_FrameCounter];
      DataGen_AesOut[29] = 0;
      DataGen_AesOut[28] = 0;
      DataGen_AesOut[27-: 24 ] = DataGen_SampleValues[DataGen_ChannelCounter];
      nAxis_TData_ToTransmitter[31:4] <= DataGen_AesOut[31:4];
      
      if (DataGen_ChannelCounter%2 == 0) begin
        if (DataGen_FrameCounter == 0) begin
          nAxis_TData_ToTransmitter[3:0] <= cAES_BSYNC;
        end
        else begin
          nAxis_TData_ToTransmitter[3:0] <= cAES_SF1SYNC;
        end
      end
      else begin
        nAxis_TData_ToTransmitter[3:0] <= cAES_SF2SYNC;
      end
      
      if (DataGen_ChannelCounter < (2* 1 )-1) begin
        DataGen_ChannelCounter++;
      end
      else begin
        DataGen_ChannelCounter = 0;
        
        if (DataGen_FrameCounter < 191) begin
          DataGen_FrameCounter++;
        end
        else begin
          DataGen_FrameCounter = 0;
        end
        
        foreach (DataGen_SampleValues[i]) begin
          if (DataGen_SampleValues[i] > -128) begin
            DataGen_SampleValues[i] = DataGen_SampleValues[i] - 1;
          end
          else begin
            DataGen_SampleValues[i] = 128;
          end
        end
      end
    end
  end
end
*/

logic signed [24 -1:0] DataChk_ExpSampleValues [8];
logic [24 -1:0] DataChk_RcvdSampleValues [8];
integer                 DataChk_ChannelCounter;

assign nAxis_TReady_ToReceiver = 1'b1;

/*always_ff @(posedge axi_clk)
begin
  if (!axi_rstn || !DataChk_Enable) begin
    DataChk_InSync = 0;
    DataChk_Error = 0;
    DataChk_ChannelCounter = 0;
    foreach (DataChk_ExpSampleValues[i]) begin
      DataChk_ExpSampleValues[i] = 0;
    end
  end
  else begin
    
    if (nAxis_TValid_FromReceiver && nAxis_TReady_ToReceiver) begin
      DataChk_RcvdSampleValues[nAxis_TID_FromReceiver] = nAxis_TData_FromReceiver[27-: 24 ];
      
      if (!DataChk_InSync) begin
        if (DataChk_RcvdSampleValues[nAxis_TID_FromReceiver] != 0) begin
          DataChk_InSync = 1;
        end
        DataChk_ExpSampleValues[nAxis_TID_FromReceiver] = DataChk_RcvdSampleValues[nAxis_TID_FromReceiver];
      end
      if (DataChk_RcvdSampleValues[nAxis_TID_FromReceiver] !== DataChk_ExpSampleValues[nAxis_TID_FromReceiver]) begin
        DataChk_Error = 1;
        $display("DataCheckError: %t", $time);
        $display("Rcvd: %x", DataChk_RcvdSampleValues[nAxis_TID_FromReceiver]);
        $display("Exp : %x", DataChk_ExpSampleValues[nAxis_TID_FromReceiver]);
      end
      
      if (DataChk_ExpSampleValues[nAxis_TID_FromReceiver] > -128) begin
        DataChk_ExpSampleValues[nAxis_TID_FromReceiver]--;
      end
      else begin
        DataChk_ExpSampleValues[nAxis_TID_FromReceiver] = 128;
      end
    end
  end
end
*/

task axi_write_m0;
  input [31:0] Base;
  input [31:0] Offset;
  input [31:0] Data;

  logic [31:0] Address;

  Address = Base + Offset;
  $display("Write %x @ %x", Data, Address);

  @(negedge axi_clk);
  nAxi_Ctrl_AWAddr_0 = Address;
  nAxi_Ctrl_AWValid_0 = 1'b1;
  wait(nAxi_Ctrl_AWReady_0 == 1)@(posedge axi_clk);
  @(negedge axi_clk);
  nAxi_Ctrl_AWValid_0 = 1'b0;
  nAxi_Ctrl_WData_0 = Data;
  nAxi_Ctrl_WValid_0 = 1'b1;
  wait(nAxi_Ctrl_WReady_0 == 1)@(posedge axi_clk);
  @(negedge axi_clk);
  nAxi_Ctrl_WValid_0 = 1'b0;
  nAxi_Ctrl_BReady_0 = 1'b1;
  wait(nAxi_Ctrl_BValid_0 == 1)@(posedge axi_clk);
  @(negedge axi_clk);
  nAxi_Ctrl_BReady_0 = 1'b0;
  @(negedge axi_clk);
endtask

task axi_write_m1;
  input [31:0] Base;
  input [31:0] Offset;
  input [31:0] Data;

  logic [31:0] Address;

  Address = Base + Offset;
  $display("Write %x @ %x", Data, Address);

  @(negedge axi_clk);
  nAxi_Ctrl_AWAddr_1 = Address;
  nAxi_Ctrl_AWValid_1 = 1'b1;
  wait(nAxi_Ctrl_AWReady_1 == 1)@(posedge axi_clk);
  @(negedge axi_clk);
  nAxi_Ctrl_AWValid_1 = 1'b0;
  nAxi_Ctrl_WData_1 = Data;
  nAxi_Ctrl_WValid_1 = 1'b1;
  wait(nAxi_Ctrl_WReady_1 == 1)@(posedge axi_clk);
  @(negedge axi_clk);
  nAxi_Ctrl_WValid_1 = 1'b0;
  nAxi_Ctrl_BReady_1 = 1'b1;
  wait(nAxi_Ctrl_BValid_1 == 1)@(posedge axi_clk);
  @(negedge axi_clk);
  nAxi_Ctrl_BReady_1 = 1'b0;
  @(negedge axi_clk);
endtask

task axi_read_m0;
  input  [31:0] Base;
  input  [31:0] Offset;
  output [31:0] Data;

  logic [31:0] Address;

  Address = Base + Offset;

  @(negedge axi_clk);
  nAxi_Ctrl_ARAddr_0 = Address;
  nAxi_Ctrl_ARValid_0 = 1'b1;
  wait(nAxi_Ctrl_ARReady_0 == 1)@(posedge axi_clk);
  @(negedge axi_clk);
  nAxi_Ctrl_ARValid_0 = 1'b0;
  nAxi_Ctrl_RReady_0 = 1'b1;
  wait(nAxi_Ctrl_RValid_0 == 1)@(posedge axi_clk);
  @(negedge axi_clk);
  Data = nAxi_Ctrl_RData_0;
  nAxi_Ctrl_RReady_0 = 1'b0;
  @(negedge axi_clk);
  
  $display("Read %x @ %x", Data, Address);
endtask

task axi_read_m1;
  input  [31:0] Base;
  input  [31:0] Offset;
  output [31:0] Data;

  logic [31:0] Address;

  Address = Base + Offset;

  @(negedge axi_clk);
  nAxi_Ctrl_ARAddr_1 = Address;
  nAxi_Ctrl_ARValid_1 = 1'b1;
  wait(nAxi_Ctrl_ARReady_1 == 1)@(posedge axi_clk);
  @(negedge axi_clk);
  nAxi_Ctrl_ARValid_1 = 1'b0;
  nAxi_Ctrl_RReady_1 = 1'b1;
  wait(nAxi_Ctrl_RValid_1 == 1)@(posedge axi_clk);
  @(negedge axi_clk);
  Data = nAxi_Ctrl_RData_1;
  nAxi_Ctrl_RReady_1 = 1'b0;
  @(negedge axi_clk);
  
  $display("Read %x @ %x", Data, Address);
endtask


logic [31:0] AxiReadData;

// "main"
initial begin
  
  DataGen_Enable = 0;
  DataGen_ChannelStatus = {32'h01234567,
                           32'h89ABCDEF,
                           32'hAABBCCDD,
                           32'hEEFF0011,
                           32'h22334455,
                           32'h66778899};
  
  wait(axi_rstn == 1);
  wait(mreset == 0);
  
  #200ns;
  
//  axi_read_m1(cAXI_BASEADDR_I2S_RX, 'h0, AxiReadData);
//  $display("Read %x", AxiReadData);
//  axi_read_m0(cAXI_BASEADDR_I2S_TX, 'h0, AxiReadData);
//  $display("Read %x", AxiReadData);
  
//  axi_write_m0(cAXI_BASEADDR_I2S_TX, 'h20, 'h2); //SCLK Div = 2
  
//  axi_write_m0(cAXI_BASEADDR_I2S_TX, 'h30, 'h1); // Set ChannelMux 0/1
//  axi_write_m0(cAXI_BASEADDR_I2S_TX, 'h34, 'h2); // Set ChannelMux 2/3
//  axi_write_m0(cAXI_BASEADDR_I2S_TX, 'h38, 'h3); // Set ChannelMux 4/5
//  axi_write_m0(cAXI_BASEADDR_I2S_TX, 'h3C, 'h4); // Set ChannelMux 6/7
  //axi_write_m0(cAXI_BASEADDR_I2S_TX, 'h3C, 'h5); // Set Waveform Generator

//  axi_write_m0(cAXI_BASEADDR_I2S_TX, 'h08, 'h1); //Enable
  
//  axi_write_m1(cAXI_BASEADDR_I2S_RX, 'h30, 'h1); // Set ChannelMux 0/1
//  axi_write_m1(cAXI_BASEADDR_I2S_RX, 'h34, 'h2); // Set ChannelMux 2/3
//  axi_write_m1(cAXI_BASEADDR_I2S_RX, 'h38, 'h3); // Set ChannelMux 4/5
//  axi_write_m1(cAXI_BASEADDR_I2S_RX, 'h3C, 'h4); // Set ChannelMux 6/7
  
//  axi_write_m1(cAXI_BASEADDR_I2S_RX, 'h50, 'h87654321); // Set AES Channel Status 0
//  axi_write_m1(cAXI_BASEADDR_I2S_RX, 'h54, 'h0FEDCBA9); // Set AES Channel Status 1
//  axi_write_m1(cAXI_BASEADDR_I2S_RX, 'h58, 'h33221100); // Set AES Channel Status 2
//  axi_write_m1(cAXI_BASEADDR_I2S_RX, 'h5C, 'h77665544); // Set AES Channel Status 3
//  axi_write_m1(cAXI_BASEADDR_I2S_RX, 'h60, 'hBBAA9988); // Set AES Channel Status 4
//  axi_write_m1(cAXI_BASEADDR_I2S_RX, 'h64, 'hFFEEDDCC); // Set AES Channel Status 5
  
//  axi_write_m1(cAXI_BASEADDR_I2S_RX, 'h08, 'h10001); //Enable and latch AES Channel Status
  
  #100ns;
  @(posedge axi_clk)DataGen_Enable = 1;
  @(posedge axi_clk)DataChk_Enable = 1;
  
  #7ms;
  
  if (!DataChk_InSync || DataChk_Error) begin
    $display("Test Failed !");
  end
  else begin
    $display("Test Completed Successfully !");
  end
  
  $display("Test time: %t",$time);

  $stop;
  
end


endmodule
