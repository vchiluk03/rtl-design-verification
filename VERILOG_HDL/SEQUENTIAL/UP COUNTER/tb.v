module tb;
reg clk,rst;
wire [2:0] count;

up_counter_structural dut(clk,rst,count);

always #5 clk =~clk;
initial begin 
	clk=0;
	rst=1;
	#10 rst=0;
	#500 $finish;
end

endmodule 