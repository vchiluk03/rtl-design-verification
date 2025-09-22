//===========================
// File: tb/intp_ctrl_tb.v
// Description: Testbench for interrupt controller
//===========================

module intp_ctrl_tb;

  parameter NUM_OF_PERIPHERALS = 16;
  parameter ADDR_WIDTH = $clog2(NUM_OF_PERIPHERALS);
  parameter DATA_WIDTH = $clog2(NUM_OF_PERIPHERALS);

  // Clock and Reset
  reg pclk_i, prst_i;

  // APB Interface Signals
  reg pwrite_i, penable_i;
  reg [ADDR_WIDTH-1:0] paddr_i;
  reg [DATA_WIDTH-1:0] pwdata_i;
  wire [DATA_WIDTH-1:0] prdata_o;
  wire pready_o, perror_o;

  // Interrupt Controller Interface
  reg [NUM_OF_PERIPHERALS-1:0] intp_active_i;
  reg intp_serviced_i;
  wire intp_valid_o;
  wire [DATA_WIDTH-1:0] intp_to_service_o;

  // Instantiate DUT
  intp_ctrl_top #(
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
  reg [1023*8:0] test_name;
  
  // Clock generation
  initial pclk_i = 0;
  always #5 pclk_i = ~pclk_i;

  `include "tasks.v"

  // Initial sequence
  initial begin
	$value$plusargs("test_name=%s",test_name);
    seed = 5348;
    reset_dut(); 
	case(test_name)
		"LOWEST_PERP_CTRL_w/HIGHEST_PRIORITY" : write_priority_regA_LOWEST_PERP_HIGHEST_PR();
		"LOWEST_PERP_CTRL_w/LOWEST_PRIORITY" : write_priority_regA_LOWEST_PERP_LOWEST_PR();
		"PERP_CTRL_RANDOM_PRIORITY" : write_priority_regA_with_RANDOM_UNIQUE_PRIORITIES();
	endcase 
    read_priority_regA();
	$display("test_name=%s",test_name);
    display_priority_regA();

    // Randomly assert interrupt signals
    intp_active_i = $random;
	
	$display("===========COLLECTION OF INTERRUPTERS:%b==========",intp_active_i);
	for(i=0;i<NUM_OF_PERIPHERALS;i=i+1) begin 
		if(intp_active_i[i])
			$display("\tPeripheral Controller %0d raised interrupt request, its priority is %0d",i,dut.priority_regA[i]);
	end
	
    #500;
    $finish;
  end

  // Monitor and service interrupts
  always @(posedge intp_valid_o) begin
    $display("%t >> Interrupt valid asserted", $time);
    #30;
    intp_active_i[intp_to_service_o] = 0; // Clear interrupt
    intp_serviced_i = 1;
    $display("%t >> Servicing and de-asserting interrupt[%0d]", $time, intp_to_service_o);
    #8;
    intp_serviced_i = 0;
  end

endmodule

