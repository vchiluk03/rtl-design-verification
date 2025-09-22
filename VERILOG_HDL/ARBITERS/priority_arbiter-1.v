/************************
SPECIFICATION: 
--------------
- First, we will program(set) priorities for each peripheral controller.
- Lets say we have 16 peripherals. 
	- Priority of those peripherals can be our choice.
- After we set priorities: when multiple peripherals raise a hand (or) only one raised.
	input of arbiter is 16 peripherals,clk,rst.
	output of arbiter is only one who has highest priority - index of periperal.
******************************************/
module priority_arbiter(clk,rst,peripheral_controllers,high_priority_peripheral
					wr_rd,valid,ready,peripheral_index,wr_priorities,rd_priorities);
parameter WIDTH = 5; 
parameter DEPTH = 16;
parameter ADDR_WIDTH = 5; // 1 to 16

input clk,rst;
input [16:1] peripheral_controllers;
output reg [3:0] high_priority_peripheral;
//memory interfaces
input wr_rd,valid;
input [WIDTH-1:0] wr_priorities;
input [ADDR_WIDTH-1:0] peripheral_index;
output  reg [WIDTH-1:0] rd_priorities;
output reg ready;
 
//programming priorities into the memory
//programming peripherals
memory #(.WIDTH(WIDTH),.DEPTH(DEPTH),.ADDR_WIDTH(ADDR_WIDTH))
	  mem_inst (.clk(clk),.rst(rst),
				.addr_i(peripheral_index),
				.wr_rd_i(wr_rd),
				.wr_data_i(wr_priorities),
				.rd_data_o(rd_priorities),
				.valid_i(valid),
				.ready_o(ready));

endmodule
