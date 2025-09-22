module top;
event e1,e2;

initial begin 
	e1 = e2; //Both point to same memory location.
	->e1; //triggered happened first.
end

initial begin 
	#5;
	wait(e2.triggered()); //waiting in later time step.
	$display("%t: e2 is triggered",$time); //SO, this won't happen.
end
endmodule