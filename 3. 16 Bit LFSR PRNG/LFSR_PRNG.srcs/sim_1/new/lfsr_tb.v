`timescale 1ns / 1ps

module lfsr_tb();

reg clk;
reg rst;
wire [15:0] q;

// Instantiate the LFSR module
lfsr uut (
    .clk(clk),
    .rst(rst),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Test sequence
initial begin
    rst = 1;
    #10;
    rst = 0;
    #500;
    $stop;
end

// Monitor output
initial begin
    $monitor("Time = %0d, LFSR = %b", $time, q);
end

endmodule
