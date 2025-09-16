module memory(clk_i,rst_i,addr_i,wr_data_i,rd_data_o,wr_rd_i,valid_i,ready_o);

parameter DEPTH = 1024;
parameter ADDR_WIDTH = $clog2(DEPTH);
parameter WIDTH = 8;

input clk_i,rst_i;
input [ADDR_WIDTH-1:0] addr_i;
input [WIDTH-1:0] wr_data_i;
output reg [WIDTH-1:0] rd_data_o;
input wr_rd_i;
input valid_i;
output reg ready_o;

endmodule 