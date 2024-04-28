`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/18 23:10:05
// Design Name: 
// Module Name: showGe
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "header.vh"

module showGe(// to show the num of song >useless uu
input [4:0] song,
output seg_out,
output reg [7:0] seg_ctrl
    );
    assign seg_out = 1'b1;
    always@* begin
    case(song) 
      5'b10001: seg_ctrl = `sed1; 
      5'b10010: seg_ctrl = `sed2;  
      5'b10100: seg_ctrl = `sed3;
      5'b11000: seg_ctrl = `sed4;
 
      default: seg_ctrl = `sed0; 
    endcase
    end
endmodule

