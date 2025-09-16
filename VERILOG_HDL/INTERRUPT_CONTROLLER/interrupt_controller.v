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
input [NUM_OF_PERIPHERALS-1:0] intp_active_i;//From each peripheral,  interrupt will come. So, peripheral number of wires.
output reg intp_valid_o, perror_o, pready_o;
output reg [DATA_WIDTH-1:0] prdata_o;
output reg [DATA_WIDTH-1:0] intp_to_service_o;

//Memory for remembering priorities of peripherals
reg [DATA_WIDTH-1:0] priority_regA [NUM_OF_PERIPHERALS-1:0]; 
integer i;

reg [1:0] state,next_state;
integer current_highest_priority,peripheral_with_highest_priority;

//Load priorities into the memory
always@(posedge pclk_i) begin 
	if(prst_i) begin 
		intp_valid_o = 0;
		prdata_o     = 0;
		intp_to_service_o = 0;
		perror_o = 0;
		pready_o = 0;
		current_highest_priority = -1;
		peripheral_with_highest_priority = 0;
		for(i=0;i<NUM_OF_PERIPHERALS-1;i=i+1) priority_regA[i] = 0;
	end
	else begin 
		if(penable_i) begin //we are writing to priority register using APB interface
			pready_o = 1;
			//write tx
			if(pwrite_i) priority_regA[paddr_i] = pwdata_i;
			else prdata_o = priority_regA[paddr_i];
		end 
		else begin 
			pready_o = 0;
		end
	end
end 


//INTERRUPT HANDLING
//state logic
always@(posedge pclk_i) begin 
	if(prst_i) begin 
		state<= IDLE;
		next_state <= IDLE;
	end
	else state <= next_state;
end

//next state logic 
always@(*) begin 
	case(state) 
		IDLE: if(intp_active_i!=0) next_state = GOT_INTP_AND_SEND_TO_PROC; 
		//move to next state, when atleast one peripheral wants to interrupt
		GOT_INTP_AND_SEND_TO_PROC:begin //send to processor on priority basis(logic)
		//move to next state only after finding the highest priority peripheral and send to processor through
		//int_to_service_o line by making intp_valid_o
		//Finding Highest priority among ALL ACTIVE INTERRUPTS from peripheral controllers.
			for(i=0;i<NUM_OF_PERIPHERALS;i=i+1) begin 
				if(intp_active_i[i]) begin 
					if(priority_regA[i] > current_highest_priority) begin
						current_highest_priority = priority_regA[i];
						peripheral_with_highest_priority = i;
					end 
				end
			end
			intp_to_service_o = peripheral_with_highest_priority; //indicating peripheral
			intp_valid_o =1;
			next_state = WAITING_FOR_INTP_TO_BE_SERVICED;
		end
		WAITING_FOR_INTP_TO_BE_SERVICED: begin 
			if(intp_serviced_i) 
				current_highest_priority = -1;
				intp_valid_o = 0;
				intp_to_service_o = 0;
				if(intp_active_i!=0) begin 
					next_state = GOT_INTP_AND_SEND_TO_PROC;
				end
				else next_state = IDLE;
		end
	endcase

end
endmodule 