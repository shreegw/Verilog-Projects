module booths(
	// control signals
	input clk,
	input start,
	input reset,

	//inputs
	input [3:0] A,
	input [3:0] B,
	
	//outputs
	output reg [7:0] P,
    output reg ready
    );
	 
	 reg [3:0] M 		=  4'b0;
	 reg B_minus_one 	=  0;
	 reg [3:0] B_temp 	=  4'b0;
	 reg [3:0] A_temp 	=  4'b0;
	 reg [2:0] Count 	=  3'd4;
	 reg [3:0] A_temp_twos = 4'b0; 
	 
	 always @ (posedge clk or posedge reset) begin
	       if(reset)
	       A_temp_twos <= 0;
	       else
	       A_temp_twos <= ~A + 1'b1;  
	     
	 end
	 	 
	 always @ (posedge clk or posedge reset)
	 begin
		if (reset == 1)
		begin
			M 			 =  4'b0;		//reset values
			B_minus_one  =  0;
			P 			 =  8'b0;
			B_temp 		 =  4'b0;
			A_temp 		 =  4'b0;
			Count 		 =  3'd4;
			ready        =  1'b0;

		end

		else if (start == 1)
		begin
			B_temp 		=  B;
			A_temp 		=  A;
		end

		else if((B_temp[0] == B_minus_one ) && (Count > 3'd0))
		begin
			B_minus_one =  B_temp[0];
			B_temp 		=  {M[0],B_temp[3:1]};				// right shift B							
			M 			=  {M[3],M[3:1]};					// right shift A	
		    Count 		=  Count - 1'b1;					
		end
		else if((B_temp[0] == 0 && B_minus_one == 1)  && (Count > 3'd0))
		begin
			M 			=  M + A_temp;
			B_minus_one =  B_temp[0];
			B_temp 		=  {M[0],B_temp[3:1]};				// right shift B
			M 			=  {M[3],M[3:1]};					// right shift A
		    Count 		=  Count - 1'b1;
		end
		else if((B_temp[0] == 1 && B_minus_one == 0)  && (Count > 3'd0))
		begin
			M 			=  M + A_temp_twos;
			B_minus_one =  B_temp[0];
			B_temp 		=  {M[0],B_temp[3:1]};				// right shift B
			M 			=  {M[3],M[3:1]};					// right shift A
		    Count 		=  Count - 1'b1;
		end
		else 
		begin
			Count = 3'b0;
		end
		P = {M, B_temp};
	 end
	 
	 always @(posedge clk or posedge reset) begin 
	   if(reset)
	       ready = 0;
	   else if(Count==0)
	       ready = 1;	       
	 end

endmodule