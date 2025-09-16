//creating chain of D-FFS using parameterized MULTIBIT D-FF(REGISTER)
//CHAIN OF REGISTERS
`include ../MULTIBIT/dff-multibit.v
module chain_of_regs(clk,rst,in,out);

parameter REG_WIDTH = 4;
parameter CHAIN_COUNT = 3;

input clk,rst;
input [REG_WIDTH-1:0] in;
output reg [REG_WIDTH-1:0] out;

wire [(CHAIN_COUNT+1)*REG_WIDTH:1];
genvar i;
for(i=0;i<CHAIN_COUNT;i++) begin
	dff_multibit #(.NUM(REG_WIDTH)) inst(.clk(clk),.rst(rst),
										.in({w[i+()]}),.out());
end

endmodule 