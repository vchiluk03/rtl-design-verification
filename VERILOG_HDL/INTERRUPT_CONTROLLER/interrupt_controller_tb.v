module intp_ctrl_tb;

parameter NUM_OF_PERIPHERALS = 16;
parameter ADDR_WIDTH = 4; //$clog2(NUM_OF_PERIPHERALS)
parameter DATA_WIDTH = 4;

reg  pclk_i,prst_i,pwrite_i,penable_i;
reg  intp_serviced_i;
reg  [ADDR_WIDTH-1:0] paddr_i;
reg  [DATA_WIDTH-1:0] pwdata_i;
reg  [NUM_OF_PERIPHERALS-1:0] intp_active_i;
wire intp_valid_o, perror_o, pready_o;
wire [DATA_WIDTH-1:0] prdata_o;
wire [DATA_WIDTH-1:0] intp_to_service_o;

intp_ctrl #(
  .NUM_OF_PERIPHERALS(NUM_OF_PERIPHERALS),
  .ADDR_WIDTH(ADDR_WIDTH),
  .DATA_WIDTH(DATA_WIDTH)
) dut (
  .pclk_i(pclk_i),
  .prst_i(prst_i),
  .paddr_i(paddr_i),
  .pwrite_i(pwrite_i),
  .pwdata_i(pwdata_i),
  .prdata_o(prdata_o),
  .penable_i(penable_i),
  .pready_o(pready_o),
  .perror_o(perror_o),
  .intp_serviced_i(intp_serviced_i),
  .intp_valid_o(intp_valid_o),
  .intp_to_service_o(intp_to_service_o),
  .intp_active_i(intp_active_i)
);
			
integer seed;

//Generating clock
initial pclk_i = 0;
always #5 pclk_i = ~pclk_i;

`include "tasks.v"

initial begin 
	//$value$plusargs = ""
	seed = 5348;
	reset_dut();
	
	write_priority_regA_with_RANDOM_UNIQUE_PRIORITIES();
	read_priority_regA();
	
	
	display_priority_regA();
	
	//input to the interrupt controller(DUT) from peripheral controllers.
	intp_active_i = $random;
	
	
	#500;
	$finish;
end

//DUT will first serve to higher priority peripheral.
	//Then, it should get the signal indicating, the interrupt is served.
		//-it should send by processor(testbench).
		//-Also make that interrupt zero(indicating it is served i.e; intp_active_i[i])
	//Then DUT will again check if there are any active interripts.
always@(posedge intp_valid_o)begin
	$display("%t\t\tInterrup valid got asserted",$time);
	//service the interrupt
	#30;
	intp_active_i[intp_to_service_o] = 0; //making serviced interrupt zero.
	intp_serviced_i = 1;
	$display("%t--\tInterrupt serviced and de-asserting interrupt[%0d] --",$time,intp_active_i[intp_to_service_o]);
	#8;
	intp_serviced_i = 0;
//$display("%t\t\tMaking interrupt serviced = %0d",$time,intp_serviced_i);
end
endmodule 
