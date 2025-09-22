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

input pclk_i,prst_i,pwrite_i,penable_i;
input intp_serviced_i;
input [ADDR_WIDTH-1:0] paddr_i;
input [DATA_WIDTH-1:0] pwdata_i;
input [DATA_WIDTH-1:0] intp_active_i;
output reg intp_valid_o, perror_o, pready_o;
output reg [DATA_WIDTH-1:0] prdata_o;
output reg [DATA_WIDTH-1:0] intp_to_service_o;

//Memory for remembering priorities of peripherals
reg [DATA_WIDTH-1:0] priority_regA [NUM_OF_PERIPHERALS-1:0]; 
integer i;

//Load priorities into the memory
always@(posedge pclk_i) begin 
	if(prst_i) begin 
		intp_valid_o = 0;
		prdata_o     = 0;
		intp_to_service_o = 0;
		perror_o = 0;
		pready_o = 0;
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

endmodule 