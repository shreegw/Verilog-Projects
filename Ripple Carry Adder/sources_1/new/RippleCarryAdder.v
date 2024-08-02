`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSUF
// Engineer: Shree Ganesh Wooradi
// 
// Create Date: 03/02/2024 10:06:21 PM
// Design Name: 
// Module Name: RippleCarryAdder
// Project Name: RippleCarryAdder using Full Adder
// Target Devices: 
// Tool Versions: 
// Description: Create a Verilog test bench to test the design. If you use all possible, it will lot of combinations. 
// Instead, simulate your design using five pairs of input numbers and verify your output—choose at least one 
// combination of inputs that will cause overflow.  
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


//Full Adder
module FullAdder (
    input A,     
    input B,     
    input Cin,   
    output Sum,    
    output Cout  
);

    assign Sum = A ^ B ^ Cin; // Sum 
    assign Cout = (A & B) | (B & Cin) | (A & Cin); // Carry

endmodule

// Ripple Carry Adder 
module RippleCarryAdder (
    input [3:0] A,      
    input [3:0] B,      
    input Cin,          
    output [3:0] Sum,   
    output Cout         
);

    wire [2:0] carry; 
      
    FullAdder FA0 (.A(A[0]), .B(B[0]), .Cin(Cin), .Sum(Sum[0]), .Cout(carry[0]));
    FullAdder FA1 (.A(A[1]), .B(B[1]), .Cin(carry[0]), .Sum(Sum[1]), .Cout(carry[1]));
    FullAdder FA2 (.A(A[2]), .B(B[2]), .Cin(carry[1]), .Sum(Sum[2]), .Cout(carry[2]));
    FullAdder FA3 (.A(A[3]), .B(B[3]), .Cin(carry[2]), .Sum(Sum[3]), .Cout(Cout));


endmodule
