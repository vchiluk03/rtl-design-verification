module tb;

reg [3:0] i;
wire [1:0]y;
wire  v;

encoder_4x2 inst(i,y,v);

initial begin 
	$monitor("%0t:    	input=%b,	 output=%d : %b, valid bit:%b",$time,i,y,y,v);
	repeat(20) begin 
		i = $random;
		#1;
	end
end
endmodule 
