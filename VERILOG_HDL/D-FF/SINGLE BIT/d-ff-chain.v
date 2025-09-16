//creating chain of d-ff horizantally using single bit d-ff
`include "sync_dff.v"
module dff_chain(clk,rst,in,out,out_bar);
input clk,rst,in;
output out,out_bar;

parameter N = 4;

wire [0:N] w;
wire [1:N]w_bar;

assign w[0]= in;
assign out=w[N];
assign out_bar=w_bar[N];

genvar i;
for(i=1;i<N+1;i=i+1) begin 
	dff inst(clk,rst,w[i-1],w[i],w_bar[i]);
end

endmodule