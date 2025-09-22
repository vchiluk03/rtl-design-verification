module top;
event e,e1,e2;

//I want to create dependency in such a way that, the below sequential order should happen.
// P2, P1, P4, P3 - To achieve this, we use inter process synchronization concept called 'event'.

initial begin 
	@(e); //waiting for the event.
	$display("PROCESS #1");
	-> e1;
end

initial begin 
	$display("PROCESS #2");
	->e; //triggering event
end

initial begin 
	@(e2);
	$display("PROCESS #3");
end

initial begin
	@(e1); 
	$display("PROCESS #4");
	->e2;
end

endmodule