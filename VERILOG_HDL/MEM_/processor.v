module processor(clk_i,rst_i,addr_o,wr_data_o,rd_data_i,wr_rd_o,valid_o,ready_i);

parameter DEPTH = 1024;
parameter ADDR_WIDTH = $clog2(DEPTH);
parameter WIDTH = 8;

input clk,rst_i;
output reg [ADDR_WIDTH-1:0] addr_o;
output reg [WIDTH-1:0] wr_data_o;
input [WIDTH-1:0] rd_data_i;
output reg wr_rd_o;
output valid_o;
input ready_i;

endmodule