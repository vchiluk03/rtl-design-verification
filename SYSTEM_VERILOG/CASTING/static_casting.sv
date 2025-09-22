/***************
- int a;
- byte b;
- a = b; //Not suggested to copy like this.
- a = int'(b); //copy b to a by converting it as an int.
	- Static casting internally converts b to a vector, then does casting to a.
******************************/
module top;
int a; //signed
byte unsigned b;

initial begin 
	a = -20;
	b = a; //copy a into b ..work?
	$display("a=%0d  b=%0d",a,b);
	b = byte'(a); //a will be converted to byte and then assign to b.
	$display("a=%0d  b=%0d",a,b);
end
endmodule 