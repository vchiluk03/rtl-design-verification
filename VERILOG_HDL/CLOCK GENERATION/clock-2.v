//Generate a clock with frequenc of 200MHZ ==> 5nsec with user giving argument
//-------------------------NOT WORKING---------------------------------------------
module tb;
reg clk;
real freq,tp; 

initial begin 
	$value$plusargs("freq=%f",freq); //MHZ
	//convert given freq to ns - to generate the clock
	tp = 1000/freq;
	$display("Time period: %f",tp);
	clk = 0;
    forever #(tp/2) clk = ~clk; 
end

initial begin 
	#500;
	$finish;
end
endmodule