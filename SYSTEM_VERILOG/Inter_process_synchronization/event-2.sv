//This is event triggering in verilog style. we wait using '@'. 
	//Verilog style of synchronization.
class gen;
event e_p3_gen;

function new(event xyz);
	e_p3_gen = xyz;
endfunction

task run();
	@(e_p3_gen); //waiting in adifferent scope
	$display("PROCESS:GENERATOR RUN"); //this can be replaced with a task or a function
endtask
endclass

module top;
event e,e_p1_p3, e_p3_gen;
gen gen_i;

initial begin 
	gen_i = new(e_p3_gen);
	gen_i.run();
end

initial begin 
	@(e); //waiting for the event.
	$display("PROCESS #1");
	-> e_p1_p3;
end

initial begin 
	$display("PROCESS #2");
	->e; //triggering event
end

initial begin 
	@(e_p1_p3);
	$display("PROCESS #3");
	->e_p3_gen;
end

endmodule