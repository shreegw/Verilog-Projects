`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2024 10:13:31 PM
// Design Name: 
// Module Name: TB_RippleCarryADder
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


module TB_RippleCarryAdder;

    
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;
    
    wire [3:0] Sum;
    wire Cout;
    
    RippleCarryAdder RCA (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );
    initial
    begin     
        A = 4'b0111;B = 4'b0001;Cin = 0;#100;//TestCase 1 7+1 no carry
        A = 4'b0111;B = 4'b0001;Cin = 1;#100;//TestCase 2 7+1+1 with carry
        A = 4'b0111;B = 4'b1010;Cin = 0;#100;//TestCase 3 7+10 no carry
        A = 4'b0111;B = 4'b1010;Cin = 1;#100;//TestCase 4 7+10+1 carry
        A = 4'b1111;B = 4'b1111;Cin = 0;#100;//TestCase 5 15+15 no carry
        A = 4'b1111;B = 4'b1111;Cin = 1;#100;//TestCase 6 15+15+1 Carry       
    end

endmodule