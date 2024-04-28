`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/02 21:16:28
// Design Name: 
// Module Name: score
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


module score(
input [40:0]  score,
output reg [4:0] p0,p1);
    always @(score) begin 
  
      if(score > 40'd0)begin
   {p1,p0} = `Go;  // Good
    end 
      if(score > 40'd6_000_000_000)begin
    {p1,p0} = `no;  // normal
     end
       if(score >= 40'd10_000_000_000) begin
         {p1,p0} = `ba;  // Bad
       end 
end
endmodule
