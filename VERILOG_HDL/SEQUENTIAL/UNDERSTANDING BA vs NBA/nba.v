//Introducing NBA to previous example.
//Non-blockin assignments captures the RHS expression value to a temporary variable,
//and assigns this temporary variable to LHS variable only at the end of time step.

module tb;
integer a,b;

initial begin 
	a = 10 ; b = 20;
	#10 $display("%0t:a=%0d\t\tb=%0d",$time,a,b);
end

initial 
	#5 a <= b; //a will get old value of b at end of time step.
	
initial 
	#5 b <= a;	//b will get old value of a at end of time step.

endmodule