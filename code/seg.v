module seg(
    input            clk, rst_n,                      // clock, reset
    input      [4:0] p0, p1, p2, p3,  // data input
    output reg [3:0] seg_en,                          // scan signal
    output     [7:0] seg_out0, seg_out1               // 7-segment display
    );
      // Generate the 400Hz clock
      //quickly just eyes disappear
        reg clk2; // creat a new clock
      reg [31:0] count;// Counter for the 400Hz clock
      reg [1:0] counts;// quicker signal
      parameter circle = 250000;       //  the 400Hz clock
      always @(posedge clk, negedge rst_n) begin
          if (!rst_n) begin
              clk2 <= 0;
              count <= 0;
              //restart
          end
          else begin
              if (count == (circle >> 1) - 1) begin
              //over turn the clock
              //count zero clearing
                  clk2 <= ~clk2;
                  count <= 32'd0;
              end else begin
                  count <= count + 1;//count++
              end
          end
      end
  
      // Generate the scan signal
      always @(posedge clk2, negedge rst_n) begin
          if (!rst_n) begin
              counts <= 0;
               //counts zero clearing
          end else begin
              if (counts ==  3'd7) begin
                  counts <= 0;
                  // over the circle 00 01 10 11
              end else begin
                  counts <= counts + 1;//counts++
              end
          end
      end
        reg [4:0]  seg_in0, seg_in1;                     
        light light0(.seg_in(seg_in0), .seg_out(seg_out0));
        light light1(.seg_in(seg_in1), .seg_out(seg_out1));
        //choose signal
       always @(*) begin
             case (counts)
                 2'b00: begin seg_en = 4'b0001; seg_in0 = p0; seg_in1 = p0; end
                 2'b01: begin seg_en = 4'b0010; seg_in0 = p1; seg_in1 = p1; end
                 2'b10: begin seg_en = 4'b0100; seg_in0 = p2; seg_in1 = p2; end
                 2'b11: begin seg_en = 4'b1000; seg_in0 = p3; seg_in1 = p3; end
                 default: seg_en = 4'b0000;
             endcase
         end
     endmodule

