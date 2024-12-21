`timescale 1ns/ 1ps

module booths;

	// Inputs
	reg clk;
	reg start;
	reg reset;
	reg [3:0] A;
	reg [3:0] B;

	// Outputs
	wire [7:0] P;
	wire ready;

	// Instantiate the Design Under Test (DUT)
	 iiitb_r2_4bit_bm dut (
		.clk(clk), 
		.start(start), 
		.reset(reset), 
		.A(A), 
		.B(B), 
		.P(P),
		.ready(ready)
	);
	
	always
		#10 clk = ~clk;
 
	initial begin
		// Initialize Inputs 
		clk  	= 0;
		start 	= 0;
		reset 	= 1'b1;
		A 		= 4'b0101; 
		B 		= 4'b0110;
		#20;
		start  	= 1;
		reset 	= 1'b0;
		#20;
		start 	= 0;
		#150 $finish;

	end
      
endmodule