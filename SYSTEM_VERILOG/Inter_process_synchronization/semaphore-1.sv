//Example for Resource conflict- using semaphore construct
//Here who took the key first, will use the resource and give back the key to semaphore. Then another process will use it.
module top;
semaphore smp = new(1); //creating semaphore with 1 key.

initial begin  //Process#1
	#5; 
	smp.get(1); //getting the key
	$display("%t: Process#1 is currently writing to the memory", $time);
	write_mem();
	$display("%t: Process#1 has completed writing to the memory", $time);
	smp.put(1); //giving back the key after the usage of resource
end 

initial begin  //Process#2
	#2;
	smp.get(1);
	$display("%t: Process#2 is currently writing to the memory", $time);
	write_mem();
	$display("%t: Process#2 has completed writing to the memory", $time);
	smp.put(1);
end 

task write_mem();
	#20; //delay for write to complete
endtask

endmodule