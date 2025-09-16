module tb;

reg [1:0] a,b;
wire gt,eq,lt;

comp_2bit inst(a,b,gt,eq,lt);

integer seed;

initial begin 
seed = 87464;
	$monitor("%0t:     		a=%d,    b=%d,    gt=%b,    eq=%b,     lt=%b",$time,a,b,gt,eq,lt);
	repeat(15) begin 
	{a,b} =$random(seed);
	#1; //Here, if we skip giving delay, $monitor will only print one combination. Because $monitor runs once for evry 1 time step.
	end
end
endmodule 