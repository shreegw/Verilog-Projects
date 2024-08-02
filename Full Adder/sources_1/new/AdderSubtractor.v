`timescale 1ns / 1ps

module FullAdder(
    input A,     
    input B,     
    input Cin,   
    output Sum,    
    output Cout  
);
    assign Sum = A ^ B ^ Cin;
    assign Cout = (A&B) | (B&Cin) | (A&Cin);
endmodule 

module addersubtractor(
    input [3:0] Aa,
    input [3:0] Bb,
    input sel,
    output Cout,
    output [3:0] Summ  
);
    wire [3:0] xor_op;
    wire [2:0] carry;
    
    xor(xor_op[0], sel, Bb[0]);
    xor(xor_op[1], sel, Bb[1]);
    xor(xor_op[2], sel, Bb[2]);
    xor(xor_op[3], sel, Bb[3]);
    
    FullAdder FA0 (.A(Aa[0]), .B(xor_op[0]), .Cin(sel), .Sum(Summ[0]), .Cout(carry[0]));
    FullAdder FA1 (.A(Aa[1]), .B(xor_op[1]), .Cin(carry[0]), .Sum(Summ[1]), .Cout(carry[1]));
    FullAdder FA2 (.A(Aa[2]), .B(xor_op[2]), .Cin(carry[1]), .Sum(Summ[2]), .Cout(carry[2]));
    FullAdder FA3 (.A(Aa[3]), .B(xor_op[3]), .Cin(carry[2]), .Sum(Summ[3]), .Cout(Cout));
endmodule
