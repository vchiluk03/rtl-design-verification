//In the previous example, we use different procedural blocks to make processes concurrent.
//But, we can use fork-join construct in verilog, to make processes concurrent in same procedural block.
//All processess run parallely in for-join. But statements inside process will run sequentially.

module tb;

initial begin 
fork
	#5 $display("SIMULATION_TIME: %0t : PROCESS-1",$time);
	#2 $display("SIMULATION_TIME: %0t : PROCESS-2",$time);
	#5 $display("SIMULATION_TIME: %0t : PROCESS-3",$time);
	#15 $display("SIMULATION_TIME: %0t : PROCESS-4",$time);
	#25; $display("SIMULATION_TIME: %0t : PROCESS-5",$time);
	//All above statements start concurrently. Since in last line, there are two statements, they also start at the same time.
	//so, we can see that the above code has 6 statements.
join
end
endmodule 