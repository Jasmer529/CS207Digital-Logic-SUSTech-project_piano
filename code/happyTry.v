`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/17 14:18:08
// Design Name: 
// Module Name: happtTry
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
module happyTry(
input clk,//clk
input rst_n,//rst
input wire[4:0] mode,//song mode 4
output reg music = 0, //speaker
output [3:0] tub_sel1, //signal 左4
output tub_sel2,//signal 右4
output wire [7:0]tub_sel1_ctrl,//段选信号 左
output wire [7:0]tub_sel2_ctrl, //段选信号 右 
output [6:0] led //led 7
);

assign tub_sel2 = 1'b1;//右4
wire clk_bps;
   
segMany s1(//instant mode song 1 2 3 4
        .clk(clk),
        .rst_n(rst_n),
        .song(mode),
        .selLeft(tub_sel1),
        .seg_ctrl(tub_sel1_ctrl)
        );
counter dut(// clock div in lab 11?
        .clk(clk),
        .rst_n(rst_n),
        .clk_bps(clk_bps)
        );
second dut2(//counter0-9
       .clk(clk),
       .rst_n(rst_n),
       .song(mode),
       .clk_bps(clk_bps),
       .seg_out(tub_sel2),
       .seg_ctrl(tub_sel2_ctrl)
    );    
    
parameter ip = `beat + `gap;  

parameter silence =  `beat << 9;

reg[29:0] freq =  `beat;

reg[2000:0] melody = 0;
integer curr = 0;

integer count1 = 0;      // count1 control frequency
integer count2 = 0;      // count2 control beat;
integer index = 0;       // index control the location music playing

reg period = 0;// every yinfu period
reg judge = 0;//judge if period
reg[4:0] last = 0; //last song weiyixing choose
reg [7:0]light;
 
 
always @(posedge clk) begin
        
        if(mode >= 17) 
        period = 1;
        else begin 
        period = 0; 
        curr = 1; 
        end
        
        if(mode == 17)//10001
          curr = `Ring_length;
        if(mode == 18)//10010
         curr = `happy_length;
        if(mode == 20)//10100
         curr = `Star_length; 
         if(mode == 24)//11000
         curr = `brush_length;
         
        case(mode)// choose song
            17: melody = `Ringing;
            18: melody = `happySong;
            20: melody = `littleStar;
            24: melody = `brush;
            default : melody = mode;
        endcase

//Checks if the frequency count exceeds or equals a current frequency value freq
    if(count1 >= freq) begin
       //move to the next
        count1 = 0;
        //turn over the signal
        music = ~music;
    end
    else count1 = count1 + 1;//after a clock cycle
    
    if(count2 <= `gap) begin
        judge = 1;// turm to period
    end
   
    if(`gap < count2 && count2 <= ip) begin
        judge = 0; //turn to music
    end
    
    if(count2 > ip) begin
        count2 = 0;
        index = index + 1; //turn yo next mu
                                                                
        if(index > curr) begin
            index = 0; //clearing 0
        end
    end
    count2 = count2 + 1; //count2++
    
end
always @* begin
    if (judge)
        freq = silence;
    else begin
        case (melody[index * 5 + 4 -: 5])//from hou to qian every five number
            5'd0 : begin
                freq = silence;
                light = `led0;
            end
            5'd8 : begin
                freq = `do;
                light = `led1;
            end
            5'd9 : begin
                freq = `re;
                light = `led2;
            end
            5'd10 : begin
                freq = `me;
                light = `led3;
            end
            5'd11 : begin
                freq = `fa;
                light = `led4;
            end
            5'd12 : begin
                freq = `so;
                light = `led5;
            end
            5'd13 : begin
                freq = `la;
                light = `led6;
            end
            5'd14 : begin
                freq = `si;
                light = `led7;
            end
            default : begin
                freq = silence;
                light = `led0;
            end
        endcase
    end
end
assign led = light;

endmodule