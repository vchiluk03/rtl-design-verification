/*
If I want to generalize full adder for N number of bits, its hard to instantiate the one-bit FA every time based on the count(parameter).
So, here we are defining parameterized verilog code for FA using construct called 'generate'.
we define a variable as 'genvar <variable>. Then we use that varible with for loop to generate count No. of instances and connect them
*/
`include "../1-bit_full_adder.v"
module param_full_adder(a,b,cin,s,cout);

parameter WIDTH = 4;
input [WIDTH-1:0] a,b;
input cin;
output [WIDTH-1:0] s;
output cout;

wire [WIDTH:0] n;
assign n[0] = cin;
assign cout = n[WIDTH];

genvar i;
//generate - optional
for(i=0;i<WIDTH;i=i+1) begin
	one_bit_full_adder inst(a[i],b[i],n[i],s[i],n[i+1]);
end
//endgenerate - optional 
endmodule 