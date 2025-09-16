//Without using 'event'
//Here, although all diplay statemenst execute at 0 run time, the tool sees first display statement first and then so on..
//If i want to execute them as my wish, I need to synchronize them using 'events' in verilog
module tb;

initial begin 
	$display("process-1");
end

initial begin 
	$display("process-2");
end

initial begin 
	$display("process-3");
end

initial begin 
	$display("process-4");
end
endmodule 