module tb;

reg s0,s1,s2,i0,i1,i2,i3,i4,i5,i6,i7;
wire y;

mux_8to1 inst(s2,s1,s0,i0,i1,i2,i3,i4,i5,i6,i7,y);

initial begin 
	repeat(20) begin 
		{s2,s1,s0,i0,i1,i2,i3,i4,i5,i6,i7} =$random;
		#5;
		$display("%0t:	{s2,s1,so}=%d, s2=%b,  s1=%b,  s0=%b,  i0=%b,  i1=%b,  i2=%b,  i3=%b,  i4=%b,  i5=%b,  i6=%b,  i7=%b,  output=%b",
					$time,{s2,s1,s0},s2,s1,s0,i0,i1,i2,i3,i4,i5,i6,i7,y);
	
	end

end
endmodule 