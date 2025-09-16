module tb;

reg [3:0] i;
reg [1:0] s;
wire y; 

mux_4to1 dut(y, i, s);

initial begin 
	repeat(10) begin 
		{i,s} = $random;
		#1;
		//$display("%t:   s=%b,   i=%b,  output=%b",$time,s,i,y);
		$display("%t:   s=%b,  I=%d,   i[0]=%b,  i[1]=%b,   i[2]=%b,   i[3]=%b,  output=%b",$time,s,i,i[0],i[1],i[2],i[3],y);
	end
end
endmodule 