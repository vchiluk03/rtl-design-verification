//Modelling 2KB memory.
//wr_data and rd_data should be width here.Because at a time, we will write/read from one location of memory.
module memory(clk,rst,addr_i,wr_rd_i,wr_data_i,rd_data_o,valid_i,ready_o);

parameter WIDTH = 16; 
parameter DEPTH = 16;
parameter ADDR_WIDTH = $clog2(DEPTH);

input clk,rst,wr_rd_i,valid_i;
input [WIDTH-1:0] wr_data_i;
input [ADDR_WIDTH-1:0] addr_i;
output  reg [WIDTH-1:0] rd_data_o;
output reg ready_o;

//Creating memory
reg [WIDTH-1:0] MEM [DEPTH-1:0];
integer i;
/****************************************************************************************
Algorithm: 
----------
-3 possible transactions at positive edge of clock.
	1. Reset applied - Clear the contents of the memory - reset all reg variables to 0.
	2. Reset (Not-applied) 
		-valid=1
			make ready=1 to do valid transaction.
				wr_rd_i=1==>write transaction - store the write data value at adress location.
				wr_rd_i=0==>Read transaction - get the data from memory at address location and drive it on read data port.
		-valid=0 
			- ready=0, it is also not ready.	
NOTES:
------
- memory write-ready happens at single edge of clock - single data rate memory.
- memory write-ready happens at both edges of clock - double data rate(ddr) memort.
*********************************************************************************************/
always@(posedge clk) begin 
	if(rst) begin 
	//make all reg variables to 0.
		rd_data_o = 0;
		ready_o   = 0;
		//MEM     = 0; - This is incorrect. Because it is array, so use for loop.
		for(i=0;i<DEPTH;i=i+1) begin 
			MEM[i] = 0;
		end
	end
	else begin 
		if(valid_i) begin 
			ready_o = 1;
			if(wr_rd_i) MEM[addr_i] = wr_data_i; //indicates write transaction
			else rd_data_o = MEM[addr_i];  //else read transaction
		end
		else begin //valid=0; - not valid
			ready_o = 0;
		end
	
	end
end

endmodule
