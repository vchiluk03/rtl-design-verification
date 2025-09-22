/*****************
- Basiclly in verilog testbenches, we define inputs as 'reg' and outputs as 'wires' with our own names to the signals(as per our wish).
	- Then we connect those testbench signals to DUT signlas by port to port connection.
- But in SYSTEM VERILOG testbenches, we dont't have a single file like tb.v, there we multiple files and each have a significance.
	- In SV testbenches, we define all the signlas in a file called interface. It is like a 'bundle of signlas' clubbed together.
		- Here we define the signal names as per our wish, same like verilog testbenches.
		- Then we connect these signals to DUT - wchih got instantiated in top module file.
			- we first instantiate this interface file in top module with a name. Let's say pif.
				- we connect testbench to DUT like as below.
					- .clk(pif.clk)
					- .dut_valid(pif.tb_valid) etc
**********************************/
`define WIDTH 16
`define DEPTH 16
`define ADDR_WIDTH $clog2(`DEPTH) 

interface mem_intf(input clk,rst);

logic clk_i,rst_i; //clk and rst comes from external source like testbench. So they are inputs to interface.
logic wr_rd_i,valid_i;
logic [`WIDTH-1:0] wr_data_i;
logic [`ADDR_WIDTH-1:0] addr_i;
logic [`WIDTH-1:0] rd_data_o;
logic ready_o;

assign clk_i = clk;
assign rst_i = rst;


clocking bfm_cb@(posedge clk_i); 
//default input #0 output #1;  - If user give did not give any skew. Give default skew, applicable to all the signals.
	output #1 addr_i;
		//After #1 time after the positive edge of clock, addr_i will be driven.
	output #2 wr_data_i;
	input  #0 rd_data_o;
	output #3 wr_rd_i, valid_i;
	input  #0 ready_o;
endclocking 

clocking mon_cb@(posedge clk_i);
	input  #0 addr_i;
	input  #0 wr_data_i;
	input  #0 rd_data_o;
	input  #0 wr_rd_i, valid_i;
	input  #0 ready_o;
endclocking 

modport bfm_mp(clocking bfm_cb);
	//BFM_MP: BFM Module port ==> This defines the directions of various ports w.r.t BFM.

modport mon_mp(clocking mon_cb);
endinterface