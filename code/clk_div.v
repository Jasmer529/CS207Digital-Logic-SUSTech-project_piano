`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/16 19:33:12
// Design Name: 
// Module Name: clk_div
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

//new clock
module clk_div(
input clk, rst_n,
output clk_free
    );
    reg [13:0] cnt_first;
    reg [13:0] cnt_second;
    always@(posedge clk,negedge rst_n) begin
    if(!rst_n)
        cnt_first <= 14'd0;
    else if(cnt_first == 14'd100)
        cnt_first <= 14'd0;
    else
        cnt_first <= cnt_first + 1'd1;
    end
    always@(posedge clk,negedge rst_n)
    if(!rst_n)
        cnt_second <= 14'd0;
    else if(cnt_second == 14'd100)
        cnt_second <= 14'd0;
    else if(cnt_first == 14'd100)
        cnt_second <= cnt_second + 1'b1;
    else
        cnt_second <= cnt_second;
assign clk_free = cnt_second == 14'd100;
endmodule
