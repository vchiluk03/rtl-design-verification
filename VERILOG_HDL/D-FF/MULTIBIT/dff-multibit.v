//parameterized D-ff (register) holding multiple bits
module dff_multibit(clk,rst,in,out);

parameter NUM=4;

input clk,rst;
input [NUM-1:0] in;
output reg [NUM-1:0] out;

//synchronous reset
always@(posedge clk) begin 
	if(rst) out<=0;
	else out<=in;
end
endmodule 