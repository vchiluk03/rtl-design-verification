module full_adder(p,q,r,sum,carry);
input p,q,r;
output sum,carry;

reg sum,carry;

always@(p or q or r) begin 
	sum = p^q^r;
	carry = p&q | q&r | r&p;
end
endmodule 