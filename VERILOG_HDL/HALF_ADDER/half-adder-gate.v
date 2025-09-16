module half_adder(p,q,sum,carry);
input p,q;
output sum,carry;

	//Structural/gate levl is implemented only using gates/using existing structures. We don't usually code verilog in gate-level, because
	//we get this by doing synthesis of behv level description
	xor(sum,p,q);
	and(carry,p,q);

endmodule 