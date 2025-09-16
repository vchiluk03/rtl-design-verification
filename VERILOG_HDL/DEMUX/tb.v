module tb;

reg i;
reg [1:0] s;
wire [3:0] y;

demux_1x4_behv inst(i,s,y);

initial begin 
	$monitor("%0t:   selection=%d:%b,  input=%b,   output=%b",$time,s,s,i,y);
	repeat(20) begin 
		{i,s} = $random;
		#1;
	end
end
endmodule