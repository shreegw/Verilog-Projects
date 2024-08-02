`timescale 1ns / 1ps

module fianl_tb();

reg clk;
reg reset;
reg pause;
reg updown;
wire [6:0] hex_out;

SevenSegmentModule dut(clk,reset,pause,updown,hex_out);

initial
clk = 0;
always #10 clk =~clk;

initial
begin 
//pause = 0;
reset = 0;#25;
reset = 1;#200;
//reset = 1;

end

initial begin
pause = 0; #10;
updown = 1; # 100;
updown = 0; #100;

updown <= 0;#100;
updown = 0;#100;

end

initial 
#100000000 $finish;


endmodule
