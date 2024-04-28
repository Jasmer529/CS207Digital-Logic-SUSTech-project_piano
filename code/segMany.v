
module segMany(
    input  clk, rst_n,  // clock, reset
    input [4:0] song, // input the song
    output reg [3:0] selLeft,   // pianxuan
    output reg [7:0] seg_ctrl  // 7-segment
    );

    reg clk2; // creat a new clock
    reg [31:0] count;// Counter for the 400Hz clock
    reg [1:0] counts;// quicker signal
    parameter circle = 250000;       //  the 400Hz clock

         always @(*) begin
        case (counts)//for every circle
            2'b00: begin 
            selLeft = 4'b1000; //1
            case(song)
            5'b10001:seg_ctrl = `sedR;//R
            5'b10010:seg_ctrl = `sedS;//S
            5'b10100:seg_ctrl = `sedS;//S
            5'b11000:seg_ctrl = `sedd;//d
            default:seg_ctrl = `sed0;//0
            endcase
             end
            2'b01: begin
            selLeft = 4'b0100; //2
             case(song)
                       5'b10001:seg_ctrl = `sedi;//i
                       5'b10010:seg_ctrl = `sedo;//o
                       5'b10100:seg_ctrl = `sedt;//t
                       5'b11000:seg_ctrl = `seda;//a
                       default: seg_ctrl = `sed0; //0
                       endcase
           end
            2'b10: begin 
            selLeft = 4'b0010; //3
            case(song)
                       5'b10001:seg_ctrl = `sedn;//n
                       5'b10010:seg_ctrl = `sedn;//n
                       5'b10100:seg_ctrl = `seda;//a
                       5'b11000:seg_ctrl = `sedu;//u
                       default:seg_ctrl = `sed0;//0
                       endcase
            end
            2'b11: begin 
            selLeft= 4'b0001; //4
             case(song)
                       5'b10001:seg_ctrl = `sedg; //g
                       5'b10010:seg_ctrl = `sedg;//g
                       5'b10100:seg_ctrl = `sedr;//r
                       5'b11000:seg_ctrl = `sedb;//b
                       default:seg_ctrl = `sed0;//0
                       endcase
             end
            default: selLeft = 4'b0000;//nothing
        endcase
    end         
    // Generate the 400Hz clock
    //quickly just eyes disappear
  
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
            if (counts == 2'd3) begin
                counts <= 0;
                // over the circle 00 01 10 11
            end else begin
                counts <= counts + 1;//counts++
            end
        end
    end
endmodule
