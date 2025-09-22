//Default time scale is 'ps'
//Generate a clock of 100MHZ freq - 10ns
`timescale 1ns/1ns
module tb;
parameter TP = 10;
reg clk;

always #(TP/2) clk = ~clk; //forever also can be used

initial begin 
	clk = 0;
	#500 $finish;
end

endmodule