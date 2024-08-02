`timescale 1ns / 1ps
module SevenSegmentModule(
    input clk,
    input reset,
    input pause,
    input updown,
    output [6:0] hex_out
    );
    wire sclk;
    wire [3:0] CounterOut;
    clock_divider clock_divider2(clk, reset, sclk);
    counter counter2(sclk, reset,pause, updown, CounterOut);
    seven_segment_decoder sevenSeg(CounterOut, hex_out);
endmodule
