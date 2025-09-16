//Generate a time period of 10ps - 100GHZ frequency - defualt scale
//Its default timescale is 'ps' - when we don't mention anything
//`timescale time step/time precision
//we we dont't use time scale below, it will generate 10ps tp.
`timescale 10ns/1ns //--> 1 time step is 10ns--> tp 10 = #10 = 10time steps=100ns
module tb;
parameter TP = 10;
reg clk;

always #(TP/2) clk = ~clk; //forever also can be used

initial begin 
	clk = 0;
	#500 $finish;
end

endmodule