//Difference between bit and byte
/*************************************
bit: 2-state unsigned variable.
		-it will store negative number as positive number.
byte: 8bits: 2-state signed variable - it will store nagative number also
********************************************/
module tb;
bit [7:0] a;
byte b;

initial begin 
	a=44;
	b=44;
	$display("value of a= %0b",a);
	$display("value of b= %b",b);
	a=-30; //unsigned variable
	b=-30; //signed variable
	$display("value of a= %d",a); //-->11100010= 226
	$display("value of b= %d",b); //-->11100010= -30
end
endmodule