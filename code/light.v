//show information
`include "header.vh"

module light(
    input      [4:0] seg_in,  // data to display
    output reg [7:0] seg_out  // 7-segment display
    );
    
    always @(*) begin
        case(seg_in)
            `IN0: seg_out = `SEG0; // Display '0'
            `IN1: seg_out = `SEG1; // Display '1'
            `IN2: seg_out = `SEG2; // Display '2' 
            `IN3: seg_out = `SEG3; // Display '3' 
            `IN9: seg_out = `SEG9; // Display '9'
            `INA: seg_out = `SEGA; // Display 'A'
            `INB: seg_out = `SEGB; // Display 'b'
            `INC: seg_out = `SEGC; // Display 'C'
            `IND: seg_out = `SEGD; // Display 'd'
            `INo: seg_out = `SEGo; // Display 'o''
            `INu: seg_out = `SEGu; // Display 'u'
            `INn: seg_out = `SEGn; // Display 'n'
            `INN: seg_out = `SEGN; // Display 'N'
            `INU: seg_out = `SEGU; // Display 'U'
         default: seg_out = 0; // Display nothing
        endcase
    end
endmodule
