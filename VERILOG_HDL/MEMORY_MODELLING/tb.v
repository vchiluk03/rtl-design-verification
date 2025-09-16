//We will control the inputs of the design by giving stimulus and check the design output.
module tb;

parameter WIDTH = 32; 
parameter DEPTH = 1024;
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


task write_mem();
begin
	//Starting the write transaction
	for(i=0;i<DEPTH;i=i+1) begin 
		@(posedge clk); //wait for next posedge clk
		valid_i = 1;
		wr_rd_i = 1;
		addr_i = i;
		wr_data_i = $random;	
		wait(ready_o==1); //Not compulsory-But an indication that the design is also ready 
	end
	//Logic for transaction completed
	@(posedge clk);
	valid_i = 0;
	wr_rd_i = 0;
	addr_i  = 0;
	wr_data_i = 0;
end
endtask

task read_mem();
begin 
	for(i=0;i<DEPTH;i=i+1) begin 
		@(posedge clk);
		valid_i=1;
		wr_rd_i=0;
		addr_i = i; 
	//since we are providing the address, we can see the data at "rd_data_o" port in the wave form.
	//we can get the data one cycle later we give address(by default behaviour).	
	wait(ready_o);
	end
	@(posedge clk);
	valid_i = 0;
	addr_i = 0;
end
endtask

initial begin 
	reset_mem;
	  //we can use some conditions here, to check DUT output for corresponding input.
	  //In verilog, we can use if....else. In SV, we can use assertions.
	write_mem;
	read_mem;
	#100;
	$finish;
end
endmodule 
