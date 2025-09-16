module tb;

reg s0,s1,s2,i0,i1,i2,i3,i4,i5,i6,i7;
wire y;

mux_8to1 inst(s2,s1,s0,i0,i1,i2,i3,i4,i5,i6,i7,y);
integer xyz;


initial begin
xyz = 87345;
	$monitor("%0t:	{s2,s1,so}=%d, s2=%b,  s1=%b,  s0=%b,  i0=%b,  i1=%b,  i2=%b,  i3=%b,  i4=%b,  i5=%b,  i6=%b,  i7=%b,  output=%b",
					$time,{s2,s1,s0},s2,s1,s0,i0,i1,i2,i3,i4,i5,i6,i7,y);
	//So, here I assigned a monitor in the starting of simulation. So, it will monitor, s and inputs(i0...i7),y only when any of their value chnages.
		//It will print the values only when they change.
		//But $display is like printing any time you needed. 
	repeat(20) begin 
		{s2,s1,s0,i0,i1,i2,i3,i4,i5,i6,i7} =$random(xyz);
		#1;
	end

end
endmodule 