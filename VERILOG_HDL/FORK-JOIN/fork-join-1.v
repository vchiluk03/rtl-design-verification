////In the previouse example (fork-join.v), we see that procedural statements, execute in sequential. 
//we can make them concurrent by using differrent prodecural blocks for each process/statement.
//W.K.T, all procedural blocks works in parallel.

module tb;

initial begin 
	#5 $display("SIMULATION_TIME: %0t : PROCESS-1",$time);
end

initial begin 
	#2 $display("SIMULATION_TIME: %0t : PROCESS-2",$time);
end

initial begin 
	#5 $display("SIMULATION_TIME: %0t : PROCESS-3",$time);
end
endmodule 