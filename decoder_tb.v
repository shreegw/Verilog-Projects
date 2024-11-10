`timescale 1ns / 1ps

module decoder_tb;
    // Testbench signals
    reg clk;
    reg reset;
    reg [6:0] hammingcode;
    wire [6:0] corrected_code;
    wire [2:0] correctionbits;

    // Instantiate the decoder module
    decoder uut (
        .clk(clk),
        .reset(reset),
        .hammingcode(hammingcode),
        .corrected_code(corrected_code),
        .correctionbits(correctionbits)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test procedure
    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        hammingcode = 7'b0000000;

        // Apply reset
        reset = 1;
        #10;
        reset = 0;
        
        // Test 1: No error in hammingcode
        hammingcode = 7'b1010101; // Example with no errors
        #10;
        $display("Test 1 - No Error: Hammingcode = %b, Corrected Code = %b, Correction Bits = %b", hammingcode, corrected_code, correctionbits);
        
        // Test 2: Single-bit error at position 0
        hammingcode = 7'b1010100; // Error in the LSB
        #10;
        $display("Test 2 - Error at Position 0: Hammingcode = %b, Corrected Code = %b, Correction Bits = %b", hammingcode, corrected_code, correctionbits);

        // Test 3: Single-bit error at position 1
        hammingcode = 7'b1010111; // Error in bit position 1
        #10;
        $display("Test 3 - Error at Position 1: Hammingcode = %b, Corrected Code = %b, Correction Bits = %b", hammingcode, corrected_code, correctionbits);

        // Test 4: Single-bit error at position 4
        hammingcode = 7'b1000101; // Error in bit position 4
        #10;
        $display("Test 4 - Error at Position 4: Hammingcode = %b, Corrected Code = %b, Correction Bits = %b", hammingcode, corrected_code, correctionbits);

        // Test 5: Single-bit error at position 6
        hammingcode = 7'b0010101; // Error in bit position 6
        #10;
        $display("Test 5 - Error at Position 6: Hammingcode = %b, Corrected Code = %b, Correction Bits = %b", hammingcode, corrected_code, correctionbits);

        // End simulation
        $stop;
    end
endmodule
