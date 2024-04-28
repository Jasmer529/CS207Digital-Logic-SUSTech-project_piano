`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/25 15:13:06
// Design Name: 
// Module Name: top
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


module top(
    input clk, rst_n,  // clock, reset
    input [2:0] modeAll, //001 free 010 auto 100 study
    input  kong, do, re, me, fa, so, la, si, //8 switch
    input [1:0] change8, // change to high8 and low8
    input [1:0]user,
    input en,
    input pick,
    output reg speaker,   // speaker
    output reg [6:0] led, //led for 7 led
    output reg[3:0] tub_sel1, //signalsel 左4
    output reg tub_sel2,// signal 右
    output reg [7:0]tub_sel1_ctrl,//seg7 左
    output reg [7:0]tub_sel2_ctrl , //seg7 右 
    output wire finish,
    output wire right,
    output wire finish1,
    output pwm_ctrl 
    );  
     assign     pwm_ctrl = 0;   

       wire [40:0] score; 
       wire [7:0]tub_sel1_ctrl_reg1;
       wire [7:0]tub_sel1_ctrl_reg2;
       wire [7:0]tub_sel1_ctrl_reg3;
       wire [7:0]tub_sel1_ctrl_reg4;
       wire [7:0]tub_sel1_ctrl_reg5;
       wire [7:0]tub_sel1_ctrl_reg6;
    //  wire finish;
    wire  speaker1, speaker2, speaker3,speaker4,speaker5;      // speaker
    wire [6:0]  led1, led2,led3,led4,led5; // led
    wire result;
    wire[40:0] score1;
   reg  [4:0]  p0, p1, p2, p3;
 wire[4:0]  p4,p5,p6,p7;    // 7-segment display
    reg [4:0] mode; //auto
    reg [6:0] key; // for do re mi fa so la si
    wire[3:0] temp1,temp3,temp4;//sel1
    wire temp2;//sel2
    reg [1:0]last_user;
       reg  [40:0] record [3:0];                      // record of the user
   
    modify ss(
    .en(en),
    .clk(clk),
    .rst(rst_n),
    .pick(pick),
    .speaker(speaker5),
     .l1(key[6]),.l2(key[5]),.l3(key[4]),.l4(key[3]),.l5(key[2]),.l6(key[1]),.l7(key[0]));
    happyTry auto_player (
    .clk(clk),
    .rst_n(rst_n),
    .mode(mode),
    .music(speaker2), 
    .led(led2),
     .tub_sel1(temp1),
      .tub_sel2(temp2),
     .tub_sel1_ctrl(tub_sel1_ctrl_reg1),
    .tub_sel2_ctrl(tub_sel1_ctrl_reg3)
    );
    seg seg_display (.clk(clk),
                     .rst_n(rst_n),
                     .p0(p0), .p1(p1), .p2(p2), .p3(p3), 
                     .seg_en(temp3),.seg_out0(tub_sel1_ctrl_reg2), .seg_out1(tub_sel1_ctrl_reg4)
                                   );
   seg seg_display1 (.clk(clk),
 .rst_n(rst_n),
 .p0(p0), .p1(p1), .p2(p2), .p3(p3), 
  .seg_en(temp4),.seg_out0(tub_sel1_ctrl_reg5), .seg_out1(tub_sel1_ctrl_reg6)
      );
    
   free_mode fm(
         .do(key[0]), .re(key[1]), .mi(key[2]),.fa(key[3]),
         .so(key[4]),.la(key[5]), .si(key[6]),
         .clk(clk),
         .rst_n(rst_n),
         .mode(change8),
         .speaker(speaker1),
         .l_1(led1[6]),.l_2(led1[5]),.l_3(led1[4]),.l_4(led1[3]),.l_5(led1[2]),.l_6(led1[1]),.l_7(led1[0])
                 );
   
      learning le(.clk(clk),.key(key),.speaker(speaker3),
       .led(led3),.finished(finish), .score(score), .mode(modeAll));
       
        score sc(.score(record[user]),.p0(p4),.p1(p5));
        score c(.score(record[user]),.p0(p6),.p1(p7));
        
        
        
      demonlearning lwe(.clk(clk),.key(key),.speaker(speaker4),
           .led(led4),.finished(finish1), .score(score1), .mode(modeAll),.right(right));
          
        always @(*) begin
            case(modeAll)//choose mode
                 3'b001: begin // free
                    key = {do, re, me, fa, so, la, si};
                     led = led1;
                    speaker = speaker1; 
                    tub_sel1 = 4'b0000; //nothing
                    tub_sel2 = 1'b0;
                end
    
                3'b010: begin // auto
                  
                    
                    mode = {fa, me, re, do, kong};// choose
                    //10001 10010 10100 11000 for 4 song
                    led = led2;              
                    speaker = speaker2; 
                    tub_sel1 = temp1;
                    tub_sel2 = temp2;
                    tub_sel1_ctrl=tub_sel1_ctrl_reg1;
                    tub_sel2_ctrl=tub_sel1_ctrl_reg3;
                end
                3'b101:begin
                    key = {si, la, so, fa, me, re, do};
                               led=led4;
                               speaker=speaker4;
                                tub_sel1 = temp4;
                                tub_sel1_ctrl=tub_sel1_ctrl_reg5;
                                tub_sel2_ctrl=tub_sel1_ctrl_reg6;
                
                             if(!finish) begin
                                p3=`INU;
                                p2= {3'b000, user};
                                 record[user]=score1;
                                p1=p7;
                                p0=p6;
                                end
                                else begin
                                  p0=`INU;
                               p1= {3'b000, user};
                                record[user]=score1;
                             
                               p2=p7;
                                p3=p6;
                end
             end
               3'b110:begin
        key = {do, re, me, fa, so, la, si};
                              led = led5;
                             speaker = speaker5; 
                             tub_sel1 = 4'b0000; //nothing
                             tub_sel2 = 1'b0;
                        end
                3'b100:begin
                 key = {si, la, so, fa, me, re, do};
                  led=led3;
                  speaker=speaker3;
                   tub_sel1 = temp3;
                   tub_sel1_ctrl=tub_sel1_ctrl_reg2;
                   tub_sel2_ctrl=tub_sel1_ctrl_reg4;
                                         
                if(!finish) begin
                   p3=`INU;
                   p2= {3'b000, user};
              record[user]=score;
             p1=p5;
              p0=p4;
                   end
                   else begin
                     p3=`INU;
                  p2= {3'b000, user};
                   record[user]=score;
                
                  p1=p5;
                   p0=p4;
  
                 end
                end
                
            endcase
        end
    
    endmodule