module full_adder(p,q,r,sum,carry);
input p,q,r;
output sum,carry;


assign	sum = p^q^r;
assign	carry = p&q | q&r | r&p;

endmodule 