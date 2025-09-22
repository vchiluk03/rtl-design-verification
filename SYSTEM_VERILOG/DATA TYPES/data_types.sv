`timescale 1ns/1ps
module tb;

shortint s; //16-bit, 2-state, siged variable
int a;      //32-bit, 2-state, signed variable
longint l;  //64-bit, 2-state, signed variable
integer b;  //32-bit, 4-state, signed variable
bit [7:0] bi; //2-state, unsigned variable
byte by;     //2-state, signed variable
bit signed [7:0] bi_s; //2-state, signed variable
byte unsigned by_u;     //2-state, unsigned variable
reg [4:0] rg;  //4-state, unsigned variable - Added in VERILOG
logic [4:0] lg; //4-state, unsigned variable - Added in SV
real r;
shortreal sr;
time t;
realtime rt;

initial begin 
	s=10'h2x; //0000_0000_0010_0000
	a=10'h2x; //0000_0000_0000_0000_0000_0000_0010_0000
	l=10'h2x; //0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0010_0000
	b=10'h2x; //0000_0000_0000_0000_0000_0000_0010_xxxx
	bi=-30; //226
	by=-30; //-30
	bi_s=-30; //-30
	by_u=-30; //226
	rg=25; //110001
	lg=25; //11001
	r=334654653.1415346;
	sr=334654653.1415346;
	
	$display("shortint:%b",s);
	$display("int:%b",a);
	$display("longint:%b",l);
	$display("integer:%b",b);
	$display("bit:%d",bi);
	$display("byte:%d",by);
	$display("bit_signed:%d",bi_s);
	$display("byte_unsigned:%d",by_u);
	$display("reg:%b",rg);
	$display("logic:%b",lg);
	$display("real:%f",r);
	$display("shortreal:%f",sr);
	#0.3;
	t=$time;
	rt=$realtime;
	$display("t:%f",t);
	$display("realtime:%f",rt);
	
end
endmodule 