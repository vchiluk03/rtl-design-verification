//we can even use fork-join inside fork-join.

module tb;

initial begin 
fork 
	begin
	fork
		#5 $display("SIMULATION_TIME: %0t : PROCESS-1",$time);
		#2 $display("SIMULATION_TIME: %0t : PROCESS-2",$time);
		#5 $display("SIMULATION_TIME: %0t : PROCESS-3",$time);
	join
	end
	
	begin 
	#2 $display("SIMULATION_TIME: %0t : PROCESS-4",$time);
	end
	
	begin
		#5 $display("SIMULATION_TIME: %0t : PROCESS-5",$time);
		#2 $display("SIMULATION_TIME: %0t : PROCESS-6",$time);
		#5 $display("SIMULATION_TIME: %0t : PROCESS-7",$time);
	end
	
join
end
endmodule 