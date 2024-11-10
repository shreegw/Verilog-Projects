`timescale 1ns / 1ps

module encoder_tb();
    reg clk;
    reg reset;
    reg [3:0] databits;
    wire [2:0] paritybits;
    wire [6:0] hammingcode;
    wire [3:0] databitscorrected;
    wire [2:0] paritybitscorrected;
    
    encoder uut (
        .clk(clk),
        .reset(reset),
        .databits(databits),
        .paritybits(paritybits),
        .hammingcode(hammingcode),
        .databitscorrected(databitscorrected),
        .paritybitscorrected(paritybitscorrected)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
        reset = 1;
        #20;
        reset = 0;
    end

    initial begin
        databits = 4'b0000; #20;
        databits = 4'b0001; #20;
        databits = 4'b0010; #20;
        databits = 4'b0011; #20;
        databits = 4'b0100; #20;
        databits = 4'b0101; #20;
        databits = 4'b0110; #20;
        reset = 1; #200;
        reset = 0; #20;
        databits = 4'b0111; #20;
        databits = 4'b1000; #20;
        databits = 4'b1001; #20;
        databits = 4'b1010; #20;
        databits = 4'b1011; #20;
        databits = 4'b1100; #20;
        databits = 4'b1101; #20;
        databits = 4'b1110; #20;
        databits = 4'b1111; #20;
      
    end

endmodule
