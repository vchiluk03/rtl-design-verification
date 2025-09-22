module intp_ctrl_tb;

parameter NUM_OF_PERIPHERALS = 16;
parameter ADDR_WIDTH = 4; //$clog2(NUM_OF_PERIPHERALS)
parameter DATA_WIDTH = 4;

reg  pclk_i,prst_i,pwrite_i,penable_i;
reg  intp_serviced_i;
reg  [ADDR_WIDTH-1:0] paddr_i;
reg  [DATA_WIDTH-1:0] pwdata_i;
reg  [DATA_WIDTH-1:0] intp_active_i;
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
			

//Generating clock
initial pclk_i = 0;
always #5 pclk_i = ~pclk_i;

`include "tasks.v"

initial begin 
	reset_dut();
	write_priority_regA();
	read_priority_regA();
	#100;
	$finish;
end
endmodule 
