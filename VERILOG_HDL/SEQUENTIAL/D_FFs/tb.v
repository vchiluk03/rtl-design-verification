module top;

reg clk,rst;
reg [3:0] a;
wire [3:0] y;

d_ffs dut (clk,rst,a,y);
reg [3:0] delay;
integer seed;

initial begin
 clk = 0;
 rst = 0;
end

always #5 clk = ~clk;


initial begin 
seed = 4987;
	rst = 1;
	a = 0 ;
	//b = 0 ;
	
	@(posedge clk);
	rst = 0;
	
	repeat(20) begin 
		a = $random(seed);
		//@(posedge clk);
		delay = $urandom_range(5,15);
		#delay;
		$display("a = %0b\t\tdelay=%0d\t\tn1=%0b\t\ty=%0b",a,delay,dut.n1,y);
	end

	$finish;
end 
endmodule 