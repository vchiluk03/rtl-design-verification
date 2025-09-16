`timescale 1ns/1ps

module tb;

realtime rt;
time t;

initial begin 
	#1.6;
	$display("time:%t", $time);
	$display("real_time:%f", $realtime);
	
end 

endmodule 