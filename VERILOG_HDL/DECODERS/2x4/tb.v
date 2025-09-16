module tb;

reg [1:0] i;
wire [3:0] y;

decoder_2x4 inst (i,y);

initial begin 
	$monitor("%0t:		i=%d:%b,    output:%b",$time,i,i,y);
	repeat(10) begin
	i =$random;
	#1;
	end
end
endmodule 