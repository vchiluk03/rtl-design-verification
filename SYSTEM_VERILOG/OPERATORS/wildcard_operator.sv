//wildcare operators
module tb;
logic [7:0] a,b,c,d;

initial begin 
	//case-1
	a = 8'b1000_0110;
	b = 8'b1000_xzz0;
	d = (a==?b); //if we ignore xzz, remaining 5 positions are matching, hence d=1
	$display("d=%0b",d); 
	//case-2
	d = (b==?a); //x and z are in LHS expression, hence output will be unknown
	$display("d=%0b",d); 
	//case-3
	a = 8'b1000_xzz0;
	b = 8'b1000_xzz0;
	d = (a==?b); //if we ignore xzz, remaining 5 positions are matching, hence d=1
	$display("d=%0b",d); 
	//case-4
	a = 8'bz000_xzz0;
	b = 8'b1000_xzz0;
	d = (a==?b); //if we ignore xzz, remaining 5 positions are not matching, hence d=x
	$display("d=%0b",d); 
	//case-5
	a = 8'b1000_0110;
	b = 8'bz000_xzz0;
	d = (a==?b); //if we ignore z,xzz, remaining 4  positions are matching, hence d=1
	$display("d=%0b",d); 
end

endmodule 