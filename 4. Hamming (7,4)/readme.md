# Hamming (7,4)

Hamming (7,4) Code is an error correcting code that is used to correct 4 bits of data by adding 3 parity bits to it and making it a hamming code. Each parity bit is the count of number of 1s from 3 data bits. The count only specifies if the data bits has even number of 1s or odd number of 1s and it can be calculated by performing XOR operation between 3 bits. The parity bit 1 is the count of 1s from data bits 1,2,4 and parity bit 2 is the count of 1s from data bits 1,3,4 and parity bit 3 is the count of 1s from data bits 2,3,4. Fig. 1: Venn Diagram of Hamming (7,4) The Hamming code is an encrypted code which is the combination of parity bits and data bits. They are arranged in such a way that data and code are not in a sequence but includes parity bits and data bits together (p1,p2,d1,p3,d2,d3,d4). The Hamming (7,4) code can only be used to correct one bit error at a time which can be either the parity bit or the data bit which tend to flip in the presence of noise during data transmission. For this reason, an extra bit can be introduced to correct more than one bit flip in the code.


![image](https://github.com/user-attachments/assets/0614179b-2ed2-413d-b4a5-0ccf0fe7db19)

Fig: Hamming 7,4
