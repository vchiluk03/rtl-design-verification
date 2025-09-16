//swapping of values in the variables by using temp.
module tb;

integer a,b,temp;

initial begin
	a = 40;
	b = 55;
	temp = a ;
	a = b;
	b = temp;
	$display("a = %0d\t\tb = %0d\t\ttemp=%0d",a,b,temp);
end
endmodule 