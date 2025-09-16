
`include "1-bit_full_adder.v"
module four_bit_full_adder(A,B,Cin,S,Co);
input [3:0] A,B;
input Cin;
output [3:0] S;
output Co;

wire n1,n2,n3;

one_bit_full_adder inst1(.a(A[0]),.b(B[0]),.c(Cin),.sum(S[0]),.carry(n1));
one_bit_full_adder inst2(.a(A[1]),.b(B[1]),.c(n1),.sum(S[1]),.carry(n2));
one_bit_full_adder inst3(.a(A[2]),.b(B[2]),.c(n2),.sum(S[2]),.carry(n3));
one_bit_full_adder inst4(.a(A[3]),.b(B[3]),.c(n3),.sum(S[3]),.carry(Co));

endmodule