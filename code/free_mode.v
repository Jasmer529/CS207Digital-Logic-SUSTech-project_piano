`include "header.vh"
module free_mode(//buzzer play certain note when pressed,the correspongding light work as well
input do,re,mi,fa,so,la,si,
input wire clk,rst_n,
input [1:0] mode,
output reg l_1,l_2,l_3,l_4,l_5,l_6,l_7,
output speaker
    );
    reg [3:0] note;
    initial begin
    note = 3'b000;
    l_1 = 1'b0; l_3 = 1'b0;
    l_2 = 1'b0; l_4 = 1'b0;
    l_5 = 1'b0; l_6 = 1'b0;
    l_7 = 1'b0;
    end
    always @(*) begin
    case({do,re,mi,fa,so,la,si})    
    7'b0000001:begin  note = 4'b0001; l_7 = 1'b1; end
    7'b0000010:begin  note = 4'b0010; l_6 = 1'b1; end
    7'b0000100:begin  note = 4'b0011; l_5 = 1'b1; end
    7'b0001000:begin  note = 4'b0100; l_4 = 1'b1; end
    7'b0010000:begin  note = 4'b0101; l_3 = 1'b1; end
    7'b0100000:begin  note = 4'b0110; l_2 = 1'b1; end
    7'b1000000:begin  note = 4'b0111; l_1 = 1'b1; end
    default:begin note = 4'b0000; l_1 = 1'b0; l_3 = 1'b0;
        l_2 = 1'b0; l_4 = 1'b0;
        l_5 = 1'b0; l_6 = 1'b0;
        l_7 = 1'b0; end
    endcase
    end
    Buzzer b(clk,mode,note,speaker);
endmodule