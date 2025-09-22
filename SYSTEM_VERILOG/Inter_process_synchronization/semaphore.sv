//Example for Resource conflict- without using semaphore construct
module top;
 
initial begin 
	#5; 
	$display("%t: Process#1 is currently writing to the memory", $time);
	write_mem();
	$display("%t: Process#1 has completed writing to the memory", $time);
end 

initial begin 
	#2;
	$display("%t: Process#2 is currently writing to the memory", $time);
	write_mem();
	$display("%t: Process#2 has completed writing to the memory", $time);
end 

task write_mem();
	#20; //delay for write to complete
endtask

endmodule