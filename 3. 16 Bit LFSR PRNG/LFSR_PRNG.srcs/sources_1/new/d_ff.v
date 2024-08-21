`timescale 1ns / 1ps

module d_ff
(
input d,
input clk,
input rst,
output q
    );

reg q;

always@(posedge clk or posedge rst)
begin
if(rst)
    q <= 1'b01;
else
    q <= d;
end    
endmodule
