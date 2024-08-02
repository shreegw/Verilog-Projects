`timescale 1ns / 1ps
module seven_segment_decoder(
    input [3:0] bin_in,
    output [6:0] hex_out
    );
    reg [6:0] hex_out;
 
         
         always @(bin_in)
            begin
            case (bin_in) //case statement
            0 : hex_out = 7'b0000001;
            1 : hex_out = 7'b1001111;
            2 : hex_out = 7'b0010010;
            3 : hex_out = 7'b0000110;
            4 : hex_out = 7'b1001100;
            5 : hex_out = 7'b0100100;
            6 : hex_out = 7'b0100000;
            7 : hex_out = 7'b0001111;
            8 : hex_out = 7'b0000000;
            9 : hex_out = 7'b0000100;
            //switch off 7 segment character 
            default : hex_out = 7'b1111111; 
        endcase
    end
endmodule