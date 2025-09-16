module dff(clk,rst,in,out,out_bar);
input clk,rst,in;
output out,out_bar;

reg out,out_bar;

always@(posedge clk or posedge rst) begin 
	if(rst) begin 
		out<=0;
		out_bar<=0;
	end else begin 
		out<=in;
		out_bar<=~in;
	end
end
endmodule 