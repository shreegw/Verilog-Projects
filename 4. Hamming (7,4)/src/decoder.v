`timescale 1ns / 1ps
module decoder(
    input clk,
    input reset,
    input [6:0] hammingcode,         // Input Hamming code
    output reg [6:0] corrected_code, // Output corrected code
    output [2:0] correctionbits      // Error location        
);

assign correctionbits[0] = hammingcode[6] ^ hammingcode[4] ^ hammingcode[2] ^ hammingcode[0];
assign correctionbits[1] = hammingcode[5] ^ hammingcode[4] ^ hammingcode[1] ^ hammingcode[0];
assign correctionbits[2] = hammingcode[3] ^ hammingcode[2] ^ hammingcode[1] ^ hammingcode[0];

always @(posedge clk or posedge reset) begin
    if (reset) begin
        corrected_code <= 7'b0000000;
    end else begin
        corrected_code <= hammingcode;
        case (correctionbits)
            3'b000: corrected_code[0] <= ~corrected_code[0]; 
            3'b001: corrected_code[1] <= ~corrected_code[1]; 
            3'b010: corrected_code[2] <= ~corrected_code[2]; 
            3'b011: corrected_code[3] <= ~corrected_code[3]; 
            3'b100: corrected_code[4] <= ~corrected_code[4]; 
            3'b101: corrected_code[5] <= ~corrected_code[5]; 
            3'b110: corrected_code[6] <= ~corrected_code[6]; 
 
        endcase
    end
end
endmodule
