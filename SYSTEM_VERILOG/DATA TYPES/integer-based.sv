//SYSTEM VERILOG DATA TYPES
//integer-based data types
module tb;

int a; //32-bit, 2-state(0,1) signed variable - Newly added in SV
integer b; //32-bit, 4-state(0,1,x,z) signed variable - Exist from verilog

initial begin 
//case-1
	a= 10'hx9z; //xx_1001_zzzz 
	b= 10'hx9z; //xx_1001_zzzz 
	$display("int data type : %0h",a); //00_1001_0000 -->90
	$display("integer data type : %0h",b); //xx_1001_zzzz-->0X9z
//case-2
	b= 10'h09z; //00_1001_zzzz
	$display("b=%0h",b);  //9z
	$display("b=%0b",b); //1001_zzzz
//case-3
	b= 10'h19z; //01_1001_zzzz
	$display("b=%0h",b);  //19z
	$display("b=%0b",b); //1_1001_zzzz
end

endmodule