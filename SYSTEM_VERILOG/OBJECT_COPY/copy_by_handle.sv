//copy by handle: The drawback of this is, both point to same memory location
class sample;
int a;
int b;
endclass

module top;
sample s1,s2;

initial begin 
	s1 = new();
	s2 = new();
	s2.a = 100;
	s1 = s2; //existing s1 memory gets deleted and it starts pointing to s2.
	$display("s1=%p",s1); //s1.a = 100, s1.b = 0
	s2.a = 200;
	s2.b = 300;
	$display("s1=%p",s1);
end
endmodule