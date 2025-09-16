module tb;

reg [7:0] a,b,c;

initial begin 
	a = 79; 
	b = -54;
	c = a&b;
	#1;
	$display("a=%0b\t\tb=%0b\t\tc=%0b",a,b,c);
end

endmodule 