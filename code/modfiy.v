`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/24 21:38:56
// Design Name: 
// Module Name: modify
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

module modify(
input en,
input clk,rst,
input l1,l2,l3,l4,l5,l6,l7,
input pick,
output speaker,
output reg [3:0] note,
output write
    );
    reg [1:0] mode;
    wire clk_div;
    reg write_en;
    reg pick_prev; // 
    reg [3:0] block_m [6:0]; // use a reg array to save input
    reg [3:0] cnt,cnt_next; //the note currently play
    parameter S1 = 4'b0001,S2 = 4'b010,S3 = 4'b0011,S4 = 4'b0100,S5 = 4'b0101,
    S6 = 4'b0110,S7 = 4'b0111,S8=4'b1000,S0 = 4'b0000;
    
   counter c(clk,rst,clk_div);//use a clk with lower frequency to modify the pick button
    
    always@(posedge clk_div, negedge rst) begin
    if(~rst) begin
    cnt <= S1;
    write_en <= 1'b1;
    mode <= 2'b00;
    end
    else begin
    cnt <= cnt_next;
    end
    end
    
    //tag bit,if the 7 notes are picked or not, if all picked, write_en = 0;
    always@(posedge clk_div) begin
    if(cnt == S8) write_en <= 1'b0;
    end
    
    
    always@(cnt,pick) begin//use fsa to control cnt
    case(cnt)
    S1: if(pick) cnt_next = S2; else cnt_next = S1;
    S2: if(pick) cnt_next = S3; else cnt_next = S2;
    S3: if(pick) cnt_next = S4; else cnt_next = S3;
    S4: if(pick) cnt_next = S5; else cnt_next = S4;
    S5: if(pick) cnt_next = S6; else cnt_next = S5;
    S6: if(pick) cnt_next = S7; else cnt_next = S6;
    S7: if(pick) cnt_next = S8; else cnt_next = S7;
    S8: if(pick) cnt_next = S8; else cnt_next = S8;//when all 7 notes are picked,cnt stay at state8 to play the notes
    endcase
    end
    
  //output logic
    always@(cnt,{l1,l2,l3,l4,l5,l6,l7},pick) begin
      if(cnt == S8) begin
         case({l1,l2,l3,l4,l5,l6,l7})
        `l1 : note = block_m[0];
        `l2 : note = block_m[1];
        `l3 : note = block_m[2];
        `l4 : note = block_m[3];
        `l5 : note = block_m[4];
        `l6 : note = block_m[5];
        `l7 : note = block_m[6];
         endcase 
         end
         else begin
          note = cnt;
          if(pick == 1'b1) begin
          case({l1,l2,l3,l4,l5,l6,l7})
           `l1: block_m[0] = cnt - 1'b1;
           `l2: block_m[1] = cnt - 1'b1;
           `l3: block_m[2] = cnt - 1'b1;
           `l4: block_m[3] = cnt - 1'b1;
           `l5: block_m[4] = cnt - 1'b1;
           `l6: block_m[5] = cnt - 1'b1;
           `l7: block_m[6] = cnt - 1'b1;
          endcase
          end
          end
          end
    assign write = write_en;
    Buzzer b (clk,mode,note,speaker);
endmodule
