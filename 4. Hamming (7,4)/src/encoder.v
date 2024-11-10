`timescale 1ns / 1ps

module encoder(
    input clk,
    input reset,
    input [3:0] databits,
    output [2:0] paritybits,
    output reg [6:0] hammingcode,
    output [3:0] databitscorrected,
    output [2:0] paritybitscorrected
);

   assign paritybits[0] = databits[0] ^ databits[1] ^ databits[3]; 
   assign paritybits[1] = databits[0] ^ databits[2] ^ databits[3]; 
   assign paritybits[2] = databits[1] ^ databits[2] ^ databits[3];   

always @(posedge clk or posedge reset) begin 
    if(reset)
        hammingcode <= 8'b0; //reset sets the output to 0
    else
        hammingcode <= {paritybits[0], paritybits[1], databits[0], paritybits[2], databits[1], databits[2], databits[3]}; 
end

//corrected index positions of the data and parity only for reference
assign databitscorrected = {databits[0], databits[1], databits[2], databits[3]}; 
assign paritybitscorrected = {paritybits[0],paritybits[1],paritybits[2]}; 

endmodule
