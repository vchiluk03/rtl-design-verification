module tb;

reg a,b,sel;
wire y;
 
integer seed;
//connection by position
//mux_2to1 inst(sel,a,b,y);

//connection by name
mux_2to1 inst(.a(a),.y(y),.sel(sel),.b(b));

initial begin 
seed = 1636887437;
	repeat(10) begin
		{a,b,sel} = $random(seed);
		#1;
		$display("%0t:    selection=%b 	 a=%b  b=%b    	output:%b",$time,sel,a,b,y);
	end

end
endmodule
