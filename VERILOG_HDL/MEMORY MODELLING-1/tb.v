//We will control the inputs of the design by giving stimulus and check the design output.
module tb;

parameter WIDTH = 2; 
parameter DEPTH = 8;
parameter ADDR_WIDTH = 3;

reg clk_i,rst_i,wr_rd_i,valid_i;
reg [WIDTH-1:0] wr_data_i;
reg [ADDR_WIDTH-1:0] addr_i;
wire [WIDTH-1:0] rd_data_o;
wire ready_o;

memory #(.WIDTH(WIDTH),.DEPTH(DEPTH),.ADDR_WIDTH(ADDR_WIDTH)) 
		dut(clk_i,rst_i,addr_i,wr_rd_i,wr_data_i,rd_data_o,valid_i,ready_o);

integer i;

//Generating clock
initial begin 
	clk_i=0;
	forever #5 clk_i = ~clk_i;
end

//Defining task for reset.
//Apply reset to design and release reset. Drive all inputs to 0.
task reset_mem();
begin 
	rst_i=1; //At reset, TB will drive design inputs to 0. DUT drive design outputs to 0 .
	//This ensures that all design inputs and outputs are driven to 0, with no unknown values.
		addr_i = 0;
		valid_i = 0;
		wr_data_i = 0;
		wr_rd_i = 0;
	repeat(2) @(posedge clk_i); //Wait for clock edge 
	rst_i=0;
end
endtask

//writing random data to the memory.
task write_mem();
begin 
$display("WE ARE WRITING");
	for(i=0;i<DEPTH;i=i+1) begin 
		@(posedge clk_i); //wait for next positive edge of clk, even if clk is already 1.
		valid_i=1; //First make valid=1 to indicate user wants to do valid transaction.
		wr_rd_i=1; //indicate user wants to write_mem
		addr_i = i;  //provide address
		wr_data_i = $random; //write the data
		wait(ready_o==1);
	end
	@(posedge clk_i); //After write is completed, make everyhting to zero.
	valid_i=0; 
	wr_rd_i=0; 
	addr_i = 0;  
	wr_data_i = 0; 
end
endtask

task read_mem();
begin
$display("WE ARE READING");
	for(i=0;i<DEPTH;i=i+1) begin 
		@(posedge clk_i);
		valid_i=1;
		wr_rd_i=0;
		addr_i=i;
		wait(ready_o==1);
	end
	@(posedge clk_i);
	valid_i=0;
	addr_i = 0;
end
endtask

initial begin 
	reset_mem;
	  //we can use some conditions here, to check DUT output for corresponding input.
	  //In verilog, we can use if....else. In SV, we can use assertions.
	fork
	write_mem;
	read_mem;
	join
	#100;
	$finish;
end
endmodule 
