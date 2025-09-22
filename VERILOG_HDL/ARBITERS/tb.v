module tb;
parameter NUM_PORTS = 20;

reg [NUM_PORTS-1:0] req_i;
reg clk,rst;
wire [NUM_PORTS-1:0] gnt_o; 

day14 #(.NUM_PORTS(NUM_PORTS)) DUT (req_i,clk,rst,gnt_o);

always #5 clk = ~clk;

initial begin 
	clk = 0;
	rst = 1;
	#12 rst = 0;

	repeat(10) begin 
		@(posedge clk) req_i = $random;
		$write("req_i=%b",req_i);
		#1;
		$display("-->Grant given:%b",DUT.gnt_o);
	end	
	
	#300 $finish;
end 
endmodule 