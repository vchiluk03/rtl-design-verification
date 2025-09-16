module tb;
parameter NUM=9;
reg clk,rst;
reg [NUM-1:0] in;
wire [NUM-1:0] out;
integer delay;

dff_multibit #(.NUM(NUM))dut(clk,rst,in,out); //parameter over-riding

always #5 clk=~clk;

initial begin 
	clk=0;
	rst=0;
	#3;
	rst=1;
	#5 rst=0;
	repeat(10) begin 
	 in = $random;
	@(posedge clk); //wait for posedge clk
	end
	$finish;
end
endmodule