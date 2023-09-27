/*
Copyright (c) 2023, Advanced Micro Devices, Inc. All rights reserved.
SPDX-License-Identifier: MIT
*/

`timescale 1ns / 1ps

//
// 16-bit Parallel PRBS Generator for 2^31-1 with feedback of X31 + X28 + 1
//
// Initial seed is all zeros
//
// Data must be sent MSB to LSB to match a standard PRBS pattern
//
// This Verilog code was automatically generated using prbs_gen version 1.8 - 04/09/2003
//

module prbs_ext_16_2v31_x31_x28_1 (CE, R, C,sync, syncdatain_dly0, syncdatain_dly1, syncdatain_dly2, Q, rxen_fd1, rxen_fd2, rxen_fd3, rxen);
input CE;
input R;
input C;
input rxen;
input rxen_fd1;
input rxen_fd2;
input rxen_fd3;
input sync;
input [15:0] syncdatain_dly0;
input [15:0] syncdatain_dly1;
input [15:0] syncdatain_dly2;
output [15:0] Q;

reg sync_reg1;
reg sync_reg2;

wire sync_pulse, sync_pulse_w, sync_CE_pulse;
reg [0:0] sync_pulse_r;
reg [1:0] state;

reg [47:1] PRBS;

assign Q = PRBS[47:32];

assign sync_pulse = sync_reg1 && !sync_reg2;
assign sync_CE_pulse = sync_reg1 && sync_reg2 && CE;
assign sync_pulse_w = sync_pulse_r;


always @ (posedge C or posedge R) begin
	if (R) begin
		sync_reg1 <=0;
		sync_reg2 <=0;
	end else begin
		sync_reg1 <= sync;
		sync_reg2 <= sync_reg1;
	end
end

always @ (posedge C or posedge R) begin
    if (R) begin
        sync_pulse_r <= 'd0;
        state <= 'd0;
    end else begin
        case (state[1:0])
        2'b00: begin
            sync_pulse_r <= 'd0;
            state <= sync_pulse ? 2'b01 : 2'b00;
            end
       2'b01: begin
            if (rxen & rxen_fd1 & rxen_fd2) begin
                sync_pulse_r<= 1'b1;
                state <= 2'b00;
            end
            end
       default: begin
            sync_pulse_r <= 'd0;
            state <= 2'b0;
         end
       endcase
    end
end
        
    


always @ (posedge C or posedge R) begin
    if (R) begin
      PRBS[47:1] <= 47'b00000000000000000000000000000001111111111111111;
    end else if (sync_pulse_w) begin
      PRBS[ 47:1] <=  {syncdatain_dly2[15:0],syncdatain_dly1[15:0],syncdatain_dly0[15:1]};
    end else if (sync_CE_pulse) begin
//end else if (CE) begin
      PRBS[47] <= PRBS[31];
      PRBS[46] <= PRBS[30];
      PRBS[45] <= PRBS[29];
      PRBS[44] <= PRBS[28];
      PRBS[43] <= PRBS[27];
      PRBS[42] <= PRBS[26];
      PRBS[41] <= PRBS[25];
      PRBS[40] <= PRBS[24];
      PRBS[39] <= PRBS[23];
      PRBS[38] <= PRBS[22];
      PRBS[37] <= PRBS[21];
      PRBS[36] <= PRBS[20];
      PRBS[35] <= PRBS[19];
      PRBS[34] <= PRBS[18];
      PRBS[33] <= PRBS[17];
      PRBS[32] <= PRBS[16];
      PRBS[31] <= PRBS[15];
      PRBS[30] <= PRBS[14];
      PRBS[29] <= PRBS[13];
      PRBS[28] <= PRBS[12];
      PRBS[27] <= PRBS[11];
      PRBS[26] <= PRBS[10];
      PRBS[25] <= PRBS[ 9];
      PRBS[24] <= PRBS[ 8];
      PRBS[23] <= PRBS[ 7];
      PRBS[22] <= PRBS[ 6];
      PRBS[21] <= PRBS[ 5];
      PRBS[20] <= PRBS[ 4];
      PRBS[19] <= PRBS[ 3];
      PRBS[18] <= PRBS[ 2];
      PRBS[17] <= PRBS[ 1];
      PRBS[16] <= PRBS[28] ~^ PRBS[31];
      PRBS[15] <= PRBS[27] ~^ PRBS[30];
      PRBS[14] <= PRBS[26] ~^ PRBS[29];
      PRBS[13] <= PRBS[25] ~^ PRBS[28];
      PRBS[12] <= PRBS[24] ~^ PRBS[27];
      PRBS[11] <= PRBS[23] ~^ PRBS[26];
      PRBS[10] <= PRBS[22] ~^ PRBS[25];
      PRBS[ 9] <= PRBS[21] ~^ PRBS[24];
      PRBS[ 8] <= PRBS[20] ~^ PRBS[23];
      PRBS[ 7] <= PRBS[19] ~^ PRBS[22];
      PRBS[ 6] <= PRBS[18] ~^ PRBS[21];
      PRBS[ 5] <= PRBS[17] ~^ PRBS[20];
      PRBS[ 4] <= PRBS[16] ~^ PRBS[19];
      PRBS[ 3] <= PRBS[15] ~^ PRBS[18];
      PRBS[ 2] <= PRBS[14] ~^ PRBS[17];
      PRBS[ 1] <= PRBS[13] ~^ PRBS[16];
    end
  end
endmodule

