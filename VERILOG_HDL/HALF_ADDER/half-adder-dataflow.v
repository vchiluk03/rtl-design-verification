/*Any design can be implemented in 3 ways in verilog 
	1.Dataflow
	2.Behavioural 
	3.structural(~gate level)
	4. Switch-level (Transistor level modelling, which we don't generally describe in verilog)
*/
module half_adder(p,q,sum,carry);
input p,q;
output sum,carry;

assign sum= p^q;
assign carry= p&q;
//Any at point of time, when the values of a and b changes, the RHS should be evaluated and assigned to LHS i.e; Data flows from RHS to LHS.

endmodule 