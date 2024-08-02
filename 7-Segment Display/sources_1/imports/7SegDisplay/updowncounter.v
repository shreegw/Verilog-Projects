`timescale 1ns / 1ps

module counter(CLK, CLR, pause, updown, Q);
    input CLK;
    input CLR;
    input pause;
    input updown;
    output [3:0] Q;
    reg [3:0] tmp;
    
    always @(posedge CLK or negedge CLR) // asynchronous reset with active low input
    begin
    if (CLR==1'b0) // 
        tmp = 4'b0000;
    else if (pause) begin
        tmp = tmp - 1'b1;
        tmp = tmp + 1'b1;
        end 
    else if (updown)
        tmp = tmp + 1'b1;
    else 
        tmp = tmp - 1'b1;
    end
    assign Q = tmp;
endmodule
