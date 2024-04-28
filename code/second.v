
module second(
    input clk,
    input rst_n,
    input clk_bps,
    input wire [4:0] song,
    output reg seg_out,
    output reg [7:0] seg_ctrl
);

    reg [4:0] song_reg; 

    always @(posedge clk or negedge rst_n) begin
            if(!rst_n)begin
            seg_ctrl <= `sed0;
            end
            else begin
            if (clk_bps)
            //use new clock to update every second
                case (seg_ctrl)
                    `sed0: seg_ctrl <= `sed1;
                    `sed1: seg_ctrl <= `sed2;
                    `sed2: seg_ctrl <= `sed3;
                    `sed3: seg_ctrl <= `sed4;
                    `sed4: seg_ctrl <= `sed5;
                    `sed5: seg_ctrl <= `sed6;
                    `sed6: seg_ctrl <= `sed7;
                    `sed7: seg_ctrl <= `sed8;
                    `sed8: seg_ctrl <= `sed9;
                    `sed9: seg_ctrl <= `sed0;
                endcase
    end
    end

endmodule
