module tb;
reg clk,rst;
wire [15:0] count;
wire [3:0] value;

sequence dut(clk,rst,count,value);

always #5 clk=~clk;

initial begin 
	clk=0;
	rst=1;
	#6 rst=0;
	#500 $finish;
end
endmodule