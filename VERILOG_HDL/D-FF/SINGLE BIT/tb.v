module tb;
reg clk,rst,in;
wire out,out_bar;

dff_chain dut(clk,rst,in,out,out_bar);

always #5 clk=~clk;
initial begin 
	clk=0;rst=0;#2 rst=1;
	#6 rst=0;
	in = 1;
	#1;
	#200 $finish;
end
endmodule