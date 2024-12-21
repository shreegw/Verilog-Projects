# Introduction and Objective

In Computer Arithmetics, it is necessary to have high-speed multipliers for high-speed calculations. Therefore, multipliers are designed to efficiently multiply two numbers with speed and accuracy. 

The **Booth's Multiplication Algorithm** is a multiplication algorithm that multiplies two signed binary numbers in **two's complement format** and provides the output in the same format. 

The inputs to the Booth's multiplier are two `n`-bit integers, and the output of the Booth's multiplier is typically `2n` bits long. While not every case requires the full `2n` bits, the maximum value resulting from multiplication may demand `2n` bits. Hence, it is optimal to have a `2n`-bit output.

![Screenshot 2024-12-21 134907](https://github.com/user-attachments/assets/ca7c3b51-9d07-4db7-8a0f-da219c9a6e11)

# Booth's Multiplier Module Explanation

This Verilog module implements a **4-bit Booth’s Multiplier** that performs multiplication of two signed binary numbers in **two's complement format**. The result is an 8-bit product.

---

## **Inputs and Outputs**

### **Inputs:**
- `clk`: Clock signal for synchronization.
- `start`: Control signal to start the multiplication process.
- `reset`: Control signal to reset the module.
- `A [3:0]`: 4-bit multiplicand.
- `B [3:0]`: 4-bit multiplier.

### **Outputs:**
- `P [7:0]`: 8-bit product of the multiplication.
- `ready`: Signal indicating the multiplication process is complete.

---

## **Internal Registers**

### Control Registers:
- `M [3:0]`: Holds intermediate partial product values.
- `B_minus_one`: Stores the previous LSB of the multiplier.
- `B_temp [3:0]`: Holds the shifting version of the multiplier.
- `A_temp [3:0]`: Holds the multiplicand value.
- `Count [2:0]`: Keeps track of the iteration count (initialized to 4).

### Auxiliary Registers:
- `A_temp_twos [3:0]`: Stores the two's complement of the multiplicand (`A`).

---

## **Key Functionalities**

### **Two's Complement Calculation**
- Two's complement of the multiplicand (`A`) is calculated asynchronously:
  - `A_temp_twos = ~A + 1'b1`
- This is used during subtraction operations in the Booth’s Algorithm.

---

### **Reset Behavior**
- On a reset signal:
  - All registers (`M`, `B_temp`, `A_temp`, `P`, etc.) are reset to zero.
  - `Count` is set to 4.
  - `ready` signal is deasserted (set to `0`).

---

### **Multiplication Process**
1. **Initialization:**
   - When the `start` signal is asserted, `A` and `B` are loaded into `A_temp` and `B_temp`, respectively.

2. **Booth's Algorithm Steps:**
   The algorithm iterates four times (as `Count` is initialized to 4):
   - **Step 1:** If `B_temp[0]` (current LSB of the multiplier) equals `B_minus_one`:
     - Perform a right shift on `B_temp` and `M`.
   - **Step 2:** If `B_temp[0]` is `0` and `B_minus_one` is `1`:
     - Add the multiplicand (`A_temp`) to `M`.
     - Perform a right shift on `B_temp` and `M`.
   - **Step 3:** If `B_temp[0]` is `1` and `B_minus_one` is `0`:
     - Add the two's complement of `A` (`A_temp_twos`) to `M`.
     - Perform a right shift on `B_temp` and `M`.
   - **Step 4:** Decrement the `Count` register after each iteration.

3. **Final Result:**
   - The 8-bit result is formed by concatenating `M` and `B_temp`.
   - Once all iterations are complete (`Count == 0`), the `ready` signal is asserted to indicate that the multiplication is done.

---

### **Ready Signal**
- The `ready` signal is controlled by a separate `always` block:
  - It is reset to `0` when `reset` is asserted.
  - It is set to `1` once `Count` reaches `0`, signaling the completion of the multiplication process.

---

## **Highlights of Booth’s Algorithm**
1. The algorithm reduces the number of addition/subtraction operations by analyzing pairs of bits from the multiplier (`B`).
2. The module uses **arithmetic right shifts** to maintain the sign during intermediate steps.
3. Two's complement representation is utilized to handle signed numbers effectively.

---

## **Applications**
This module can be used in:
- **Digital Signal Processing (DSP)**
- **Embedded Systems**
- **Arithmetic Logic Units (ALUs)**
- **FPGA and ASIC designs**

![Screenshot 2024-12-21 135931](https://github.com/user-attachments/assets/d121e8f1-7535-4457-8c89-f7f912d2aae8)

![Screenshot 2024-12-21 135807](https://github.com/user-attachments/assets/719e52e1-adf5-4c24-8582-9b47053af6bc)
