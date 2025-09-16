module half_adder(p,q,sum,carry);
input p,q;
output sum,carry;

reg sum,carry;

always@(p or q) begin
	sum= p^q;
	carry= p&q;
end
//Always, when the values of a and b(inputs) changes, sum and carry should be calculated and assigned -- same meaning as dataflow.

endmodule 