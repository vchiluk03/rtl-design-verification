module d_ffs(clk,rst,a,y);

input clk,rst;
input [3:0] a;
output reg [3:0] y;

reg [3:0] n1;
//wire n2;

//assign n2 = n1&b;
//Before introducing NBA
always@(posedge clk) begin 
	if(rst) begin 
		n1 = 0;
		y  = 0;
	end else begin 
		n1 = a;
		y  = n1;
	end
end
endmodule 
