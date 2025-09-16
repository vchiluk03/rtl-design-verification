module top;

priority_arbiter(clk,rst,peripheral_controllers,high_priority_peripheral
					wr_rd,valid,ready,peripheral_index,wr_priorities,rd_priorities);
reg clk,rst;
reg [3:0] peripheral_controllers;
wire [3:0] high_priority_peripheral;
//memory interfaces
reg wr_rd,valid;
reg [3:0] wr_priorities;
reg [3:0] peripheral_index;
wire [3:0] rd_priorities;
wire ready;

always #5 clk = ~clk;

initial begin 
	clk = 0;
	rst = 1;
	#12;
	rst = 0;
	
	//write priorities to the memory
	valid = 1;
	wr_rd = 1;
	@(posedge clk) peripheral_index[1] = 3;
	@(posedge clk) peripheral_index[2] = 3;
	@(posedge clk) peripheral_index[3] = 3;
	@(posedge clk) peripheral_index[4] = 3;
	@(posedge clk) peripheral_index[5] = 3;
	@(posedge clk) peripheral_index[6] = 3;
	@(posedge clk) peripheral_index[7] = 3;
	@(posedge clk) peripheral_index[8] = 3;
	@(posedge clk) peripheral_index[9] = 3;
	@(posedge clk) peripheral_index[10] = 3;
	@(posedge clk) peripheral_index[11] = 3;
	@(posedge clk) peripheral_index[12] = 3;
	@(posedge clk) peripheral_index[13] = 3;
	@(posedge clk) peripheral_index[14] = 3;
	@(posedge clk) peripheral_index[15] = 3;
	@(posedge clk) peripheral_index[16] = 3;
	@(posedge clk) valid = 0;
	wr_rd = 0;
	
end
endmodule 