`timescale 1ns / 1ps

module TB_addersubtractor();
    reg [3:0] A;
    reg [3:0] B;
    reg sel;
    
    wire [3:0] Sum;
    wire Cout;
    
    addersubtractor AS1 (
        .Aa(A),
        .Bb(B),
        .sel(sel),
        .Summ(Sum),
        .Cout(Cout)
    );
    initial
    begin     
        A = 4'b1111;B = 4'b1010;sel = 1;#100;//TestCase 1 15-10 
        A = 4'b0111;B = 4'b0101;sel = 1;#100;//TestCase 2 7-5 
        A = 4'b1111;B = 4'b1111;sel = 1;#100;//TestCase 3 15-15 
        A = 4'b0111;B = 4'b0111;sel = 1;#100;//TestCase 4 7-7
        A = 4'b0101;B = 4'b0111;sel = 1;#100;//TestCase 5 5-7 
        A = 4'b1010;B = 4'b1111;sel = 1;#100;//TestCase 6 10-15    
        A = 4'b0111;B = 4'b0001;sel = 0;#100;//TestCase 1 7+1
        A = 4'b0111;B = 4'b0101;sel = 0;#100;//TestCase 2 7+5
        A = 4'b1111;B = 4'b1111;sel = 0;#100;//TestCase 3 15+15
        A = 4'b0000;B = 4'b0001;sel = 1;#100;//TestCase 4 0-1     
    end
    
endmodule
