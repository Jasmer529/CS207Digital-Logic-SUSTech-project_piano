`include "header.vh"
module Buzzer(
input wire clk,
input wire [1:0] mode,
input wire [3:0] note,
output wire speaker
    );
    reg [31:0] notes [7:0];
    reg [31:0] counter;
    reg pwm;
    always@* begin
    case(mode)
    2'b00:begin
     notes[1] = 381680;
     notes[2] = 340136;
     notes[3] = 303030;
     notes[4] = 285714;
     notes[5] = 255102;
     notes[6] = 227273;
     notes[7] = 202429;
     end
     2'b01:begin
       notes[1] = `high_do;
       notes[2] = `high_re;
       notes[3] = `high_mi;
       notes[4] = `high_fa;
       notes[5] = `high_so;
       notes[6] = `high_la;
       notes[7] = `high_si;
     end
     2'b10:begin
       notes[1] = `low_do;
       notes[2] = `low_re;
       notes[3] = `low_mi;
       notes[4] = `low_fa;
       notes[5] = `low_so;
       notes[6] = `low_la;
       notes[7] = `low_si;
     end
     default:;
     endcase
     end
    initial
    begin
         pwm = 0;
    end
    always @(posedge clk) begin
        if(counter < notes[note] || note == 1'b0)
        begin 
            counter <= counter + 1'b1;
        end
        else begin
             pwm = ~pwm;
             counter <= 0;
        end
    end
    assign speaker = pwm;
endmodule