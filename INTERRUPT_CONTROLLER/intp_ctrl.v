module intp_ctrl(
//processor: APB interface+some interrupt signals
pclk_i,prst_i,paddr_i,pwrite_i,pwdata_i,prdata_o,penable_i,pready_o,perror_o,
intp_serviced_i,intp_valid_o,intp_to_service_o,
//peripheral controller interface
intp_active_i
);
parameter NUM_OF_PERIPHERALS = 16;
parameter ADDR_WIDTH = 4; //$clog2(NUM_OF_PERIPHERALS)
parameter DATA_WIDTH = 4;

parameter IDLE = 2'd0;
parameter GOT_INTP_AND_SEND_TO_PROC = 2'd1;
parameter WAITING_FOR_INTP_TO_BE_SERVICED= 2'd2;

input pclk_i,prst_i,pwrite_i,penable_i;
input intp_serviced_i;
input [ADDR_WIDTH-1:0] paddr_i;
input [DATA_WIDTH-1:0] pwdata_i;
input [NUM_OF_PERIPHERALS-1:0] intp_active_i;
output reg intp_valid_o, perror_o, pready_o;
output reg [DATA_WIDTH-1:0] prdata_o;
output reg [DATA_WIDTH-1:0] intp_to_service_o;

//Memory for remembering priorities of peripherals
reg [DATA_WIDTH-1:0] priority_regA [NUM_OF_PERIPHERALS-1:0]; 

reg [1:0] state;

    // Internal signals
    integer i;
    reg [DATA_WIDTH-1:0] current_highest_priority;
    reg [ADDR_WIDTH-1:0] peripheral_with_highest_priority;

    // APB interface: write/read to priority register
    always @(posedge pclk_i) begin
        if (prst_i) begin
            pready_o <= 0;
            prdata_o <= 0;
            for (i = 0; i < NUM_OF_PERIPHERALS; i = i + 1)
                priority_regA[i] <= 0;
        end else begin
            if (penable_i) begin
                pready_o <= 1;
                if (pwrite_i)
                    priority_regA[paddr_i] <= pwdata_i;
                else
                    prdata_o <= priority_regA[paddr_i];
            end else begin
                pready_o <= 0;
            end
        end
    end 

// Output logic and interrupt Handling: DATA PATH LOGIC
reg [DATA_WIDTH-1:0] temp_priority;
reg [ADDR_WIDTH-1:0] temp_peripheral;
//INTERRUPT HANDLING

always @(posedge pclk_i) begin
  if (prst_i)
    state <= IDLE;
  else begin
    case (state)
      IDLE:
        if (intp_active_i != 0)
          state <= GOT_INTP_AND_SEND_TO_PROC;
      GOT_INTP_AND_SEND_TO_PROC:
        state <= WAITING_FOR_INTP_TO_BE_SERVICED;
      WAITING_FOR_INTP_TO_BE_SERVICED:
        if (intp_serviced_i) begin
          if (intp_active_i != 0)
            state <= GOT_INTP_AND_SEND_TO_PROC;
          else
            state <= IDLE;
        end
    endcase
  end
end

//Output logic and interrupt Handling: DATA PATH LOGIC
always @(posedge pclk_i) begin 
	if(prst_i) begin 
		intp_to_service_o <= 0;
		intp_valid_o <= 0;
		perror_o <= 0;
		current_highest_priority <= 0;
		peripheral_with_highest_priority <= 0;
	end else begin 
		case(state) 
			GOT_INTP_AND_SEND_TO_PROC: begin 
				temp_priority = 0;
				temp_peripheral = 0;
				$display("DUT : collection of peripherals want to interrupt: %b", intp_active_i);
				
				for (i = 0; i < NUM_OF_PERIPHERALS; i = i + 1) begin 
					if (intp_active_i[i]) begin 
						$display("%t\t== peripheral %0d raised an interrupt ==", $time,i);
						if (priority_regA[i] > current_highest_priority) begin
							$display("%t\tpriority_regA[%0d]=%0d > current_highest_priority=%0d", $time, i, priority_regA[i], temp_priority);
							temp_priority = priority_regA[i];
							temp_peripheral = i;
						end 
					end
				end

				current_highest_priority <= temp_priority;
				peripheral_with_highest_priority <= temp_peripheral;
				intp_to_service_o <= temp_peripheral;
				intp_valid_o <= 1;
				$display("%t\t>> Final Selected Peripheral=%0d with Priority=%0d",$time,temp_peripheral, temp_priority);
			end
			WAITING_FOR_INTP_TO_BE_SERVICED: begin 
				$display("%t/t/tstate 3 entered",$time);
				if(intp_serviced_i) begin 
					$display("%t\t\tinterrupt serviced",$time);
					intp_valid_o <= 0;
					intp_to_service_o <= 0;
				end
			end
			
		endcase
	end
end

endmodule