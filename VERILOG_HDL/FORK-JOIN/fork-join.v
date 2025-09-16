//By default, all the statements/processes inside procedural blocks execute sequentially. To make them concurrent, we use fork-join construct.
//Below is an example on how execution happens in prpcedural blocks.

module tb;

initial begin 
	#5;
	$display("TESTING: %0t : PROCESS-1",$time);
	$display("SIMULATION_TIME: %0t : PROCESS-1",$time);
	#2 $display("SIMULATION_TIME: %0t : PROCESS-2",$time);
	#5 $display("SIMULATION_TIME: %0t : PROCESS-3",$time);
end
endmodule 