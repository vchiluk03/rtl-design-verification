//TB for BACK DOOR ACCESS USING SYSTEM TASKS with ARGUMENTS
module tb;

parameter WIDTH = 16; 
parameter DEPTH = 64;
parameter ADDR_WIDTH = $clog2(DEPTH);

reg clk,rst,wr_rd_i,valid_i;
reg [WIDTH-1:0] wr_data_i;
reg [ADDR_WIDTH-1:0] addr_i;
wire [WIDTH-1:0] rd_data_o;
wire ready_o;

memory #(.DEPTH(DEPTH),.WIDTH(WIDTH)) dut(clk,rst,addr_i,wr_rd_i,wr_data_i,rd_data_o,valid_i,ready_o);
integer i;

//Generating clock
initial begin 
	clk=0;
	forever #5 clk = ~clk;
end

//Defining task for reset.
//Apply reset to design and release reset. Drive all inputs to 0.
task reset_mem();
begin 
	rst=1; //At reset, TB will drive design inputs to 0. DUT drive design outputs to 0 .
	//This ensures that all design inputs and outputs are driven to 0, with no unknown values.
		addr_i = 0;
		valid_i = 0;
		wr_data_i = 0;
		wr_rd_i = 0;
	repeat(2) @(posedge clk); //Wait for clock edge 
	@(posedge clk) rst=0;
end
endtask

//Write task with arguments to write to specific loaction with raandom data 
task write_mem_bd(input [ADDR_WIDTH-1:0] start_location, input [ADDR_WIDTH-1:0] Num_of_locations);
begin 
    $readmemh("image1.hex",dut.MEM,start_location,start_location+Num_of_locations-1);
end
endtask

task read_mem_bd(input [ADDR_WIDTH-1:0] start_location, input [ADDR_WIDTH-1:0] Num_of_locations);
begin 
    $writememb("image1.bin",dut.MEM,start_location,start_location+Num_of_locations-1);
end

endtask

initial begin 
	reset_mem;
    write_mem_bd(DEPTH/4,DEPTH/4);
    read_mem_bd(DEPTH/4,DEPTH/4);

	#100;
	$finish;
end
endmodule 
