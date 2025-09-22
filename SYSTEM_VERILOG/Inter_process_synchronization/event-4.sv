module top;
event e1,e2;

initial begin 
	e1 = e2; //Both point to same memory location.
	#6;
	->e1; //triggered happened at alter time step.
end

initial begin 
	#5;
	wait(e2.triggered()); //waiting for the event first.
	$display("%t: e2 is triggered",$time); //SO, this will happen.
end
endmodule