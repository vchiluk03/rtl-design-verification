module one_bit_full_adder(a,b,c,sum,carry);
input a,b,c;
output sum,carry;

wire n1,n2,n3;

xor (sum,a,b,c);
and (n1,a,b);
and (n2,b,c);
and (n3,c,a);
or  (carry,n1,n2,n3);

endmodule

 