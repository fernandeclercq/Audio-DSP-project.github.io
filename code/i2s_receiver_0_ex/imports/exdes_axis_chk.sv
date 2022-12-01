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
module exdes_axis_chk
(
	input clk,
	input resetn,

	input  DataChk_Enable,
	output s_axis_audio_tready,
	input  s_axis_audio_tvalid,
	input  [2:0]  s_axis_audio_tid,
	input  [31:0] s_axis_audio_tdata,
	output     DataChk_InSync,
        output     DataChk_Error
);
logic signed [24 -1:0] DataChk_ExpSampleValues [8];
logic [24 -1:0] DataChk_RcvdSampleValues [8];
logic [31:0]            DataChk_ChannelCounter;

logic        nAxis_TValid;
logic        nAxis_TReady;
logic [ 2:0] nAxis_TID;
logic [31:0] nAxis_TData;

logic     InSync;
logic     Error;
assign DataChk_InSync = InSync;
assign DataChk_Error = Error;

assign nAxis_TReady = 1'b1;

assign s_axis_audio_tready = nAxis_TReady;
assign nAxis_TValid = s_axis_audio_tvalid;
assign nAxis_TID = s_axis_audio_tid;
assign nAxis_TData = s_axis_audio_tdata;

always_ff @(posedge clk)
begin
  if (!resetn || !DataChk_Enable) begin
    InSync = 0;
    Error = 0;
    DataChk_ChannelCounter = 0;
    foreach (DataChk_ExpSampleValues[i]) begin
      DataChk_ExpSampleValues[i] = 0;
    end
  end
  else begin
    
    if (nAxis_TValid && nAxis_TReady) begin
      DataChk_RcvdSampleValues[nAxis_TID] = nAxis_TData[27-: 24 ];
      
      if (!InSync) begin
        if (DataChk_RcvdSampleValues[nAxis_TID] != 0) begin
          InSync = 1;
        end
        DataChk_ExpSampleValues[nAxis_TID] = DataChk_RcvdSampleValues[nAxis_TID];
      end
      if (DataChk_RcvdSampleValues[nAxis_TID] !== DataChk_ExpSampleValues[nAxis_TID]) begin
        Error = 1;
   //     $display("DataCheckError: %t", $time);
   //     $display("Rcvd: %x", DataChk_RcvdSampleValues[nAxis_TID]);
   //     $display("Exp : %x", DataChk_ExpSampleValues[nAxis_TID]);
      end
      
      if (DataChk_ExpSampleValues[nAxis_TID] > -128) begin
        DataChk_ExpSampleValues[nAxis_TID]--;
      end
      else begin
        DataChk_ExpSampleValues[nAxis_TID] = 128;
      end
    end
  end
end



endmodule
