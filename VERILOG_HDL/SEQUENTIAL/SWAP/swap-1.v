//swapping without using temp
module tb;

integer a,b;

initial begin
	a = 40;
	b = 55;
	a = a+b;
	b = a-b;
	a = a-b;
	$display("a = %0d\t\tb = %0d",a,b);
end
endmodule 