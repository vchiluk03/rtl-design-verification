//TB for BACK DOOR ACCESS USING SYSTEM TASKS
//Full write and Read
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
reg [8*25:1] testname; 

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

//task for back door write
task write_mem_bd(input [ADDR_WIDTH-1:0] start_location, input [ADDR_WIDTH:0] Num_of_locations);
begin 
    $readmemh("image1.hex",dut.MEM,start_location,start_location+Num_of_locations-1);
end
endtask

//task for back door read
task read_mem_bd(input [ADDR_WIDTH-1:0] start_location, input [ADDR_WIDTH:0] Num_of_locations);
begin 
    $writememb("test_case.hex",dut.MEM,start_location,start_location+Num_of_locations-1);
end
endtask

//task for front door write
task write_mem_fd(input [ADDR_WIDTH-1:0] start_location, input [ADDR_WIDTH:0] Num_of_locations);
begin 
	//Starting the write transaction
	for(i=start_location;i<start_location+Num_of_locations;i=i+1) begin 
		@(posedge clk); 
		valid_i = 1;
		wr_rd_i = 1;
		addr_i = i;
		wr_data_i = $random;	
		wait(ready_o==1); 
	end
	@(posedge clk);
	valid_i = 0;
	wr_rd_i = 0;
	addr_i  = 0;
	wr_data_i = 0;
end
endtask

//task for front door read
task read_mem_fd(input [ADDR_WIDTH-1:0] start_location, input [ADDR_WIDTH:0] Num_of_locations);
begin 
	for(i=start_location;i<start_location+Num_of_locations;i=i+1) begin 
		@(posedge clk);
		valid_i=1;
		wr_rd_i=0;
		addr_i = i; 
	    wait(ready_o);
	end
	@(posedge clk);
	valid_i = 0;
	addr_i = 0;
end
endtask

initial begin 
    $value$plusargs("testname=%s",testname);
	reset_mem();
    case(testname)
        "test_fd_write_fd_read":begin
            write_mem_fd(0,DEPTH);
            read_mem_fd(0,DEPTH);
        end
        "test_bd_write_fd_read":begin
			$display("it is backdoor write front door read");
            write_mem_bd(0,DEPTH);
            read_mem_fd(0,DEPTH);
        end
        "test_bd_write_bd_read":begin
            write_mem_bd(0,DEPTH);
            read_mem_bd(0,DEPTH);
        end
        "test_fd_write_bd_read":begin
            write_mem_fd(0,DEPTH);
            read_mem_bd(0,DEPTH);
        end
        "test_random_write_read":begin
            write_mem_fd(0,DEPTH);
            read_mem_fd(0,DEPTH);
        end
    endcase


	#100;
	$finish;
end
endmodule 
