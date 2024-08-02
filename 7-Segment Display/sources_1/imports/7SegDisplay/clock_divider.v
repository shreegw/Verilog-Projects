`timescale 1ns / 1ps
module clock_divider(

input clk,
input reset,
output reg sclk //connect to up clk input
);
reg [26:0] count;
    always@(posedge clk or negedge reset)
        begin
    if(reset == 1'b0) begin //  (reset ==1'b1)
    count <= 26'd0;
    sclk <= 1'b0;
        end else begin
    if(count == 26'd1) begin //this is for 10s, 50000000 for 1 sec
    count <= 26'd0;
    sclk <= ~sclk;
        end else begin
    count <= count + 1;
        end
    end
    end
    endmodule