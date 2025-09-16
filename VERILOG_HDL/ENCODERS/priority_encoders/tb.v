module tb;

reg [3:0] i;
wire [1:0]y;
wire  v;

p_encoder_4x2 inst(i,y,v);
integer seed;

initial begin
	seed = 7839;
	$monitor("%0t:    	input=%b,	 output=%d : %b, valid bit:%b",$time,i,y,y,v);
	repeat(20) begin 
		i = $random(seed);
		#1;
	end
end
endmodule 
