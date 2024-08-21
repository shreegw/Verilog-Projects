`timescale 1ns / 1ps

module lfsr (
    input clk,
    input rst,
    output [15:0] q
);

wire feedback;
wire q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16;

// Feedback polynomial: x^4 + x + 1
assign feedback = q11 ^ q4;

d_ff d1 (.d(feedback), .clk(clk), .rst(rst), .q(q1));
d_ff d2 (.d(q1), .clk(clk), .rst(rst), .q(q2));
d_ff d3 (.d(q2), .clk(clk), .rst(rst), .q(q3));
d_ff d4 (.d(q3), .clk(clk), .rst(rst), .q(q4));
d_ff d5 (.d(q4), .clk(clk), .rst(rst), .q(q5));
d_ff d6 (.d(q5), .clk(clk), .rst(rst), .q(q6));
d_ff d7 (.d(q6), .clk(clk), .rst(rst), .q(q7));
d_ff d8 (.d(q7), .clk(clk), .rst(rst), .q(q8));
d_ff d9 (.d(q8), .clk(clk), .rst(rst), .q(q9));
d_ff d10 (.d(q9), .clk(clk), .rst(rst), .q(q10));
d_ff d11 (.d(q10), .clk(clk), .rst(rst), .q(q11));
d_ff d12 (.d(q11), .clk(clk), .rst(rst), .q(q12));
d_ff d13 (.d(q12), .clk(clk), .rst(rst), .q(q13));
d_ff d14 (.d(q13), .clk(clk), .rst(rst), .q(q14));
d_ff d15 (.d(q14), .clk(clk), .rst(rst), .q(q15));
d_ff d16 (.d(q15), .clk(clk), .rst(rst), .q(q16));

// Output all 16 bits
assign q = {q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16};

endmodule