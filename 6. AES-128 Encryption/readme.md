# AES-128 in Verilog

AES-128 (Advanced Encryption Standard) is a symmetric encryption algorithm using a 128-bit key. In Verilog, it’s implemented as a hardware module with a finite state machine (FSM) controlling four main stages: SubBytes, ShiftRows, MixColumns, and AddRoundKey. The design takes a 128-bit plaintext and key as inputs, processing them through 10 rounds of transformations. Each round uses a key schedule to generate round keys. The Verilog code includes combinational logic for transformations and sequential logic for round iterations, optimizing for speed and area in hardware like FPGAs.


# Steps to Use the Files
  1. Extract the FPGA.Zip file
  2. Use the files in Xilinx Vivado 
