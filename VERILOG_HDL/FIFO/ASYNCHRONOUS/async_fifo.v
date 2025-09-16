module Async_fifo(
    wr_clk_i,rd_clk_i,rst_i,
    wr_en_i, wr_data_i, full_o, overflow_o,
    rd_en_i, rd_data_o, empty_o, underflow_o);

parameter DEPTH = 16;
parameter DATA_WIDTH = 8;
parameter ADDR_WIDTH = $clog2(DEPTH);

input wr_clk_i,rd_clk_i,rst_i;
input wr_en_i,rd_en_i;
input [DATA_WIDTH-1:0] wr_data_i;
output reg [DATA_WIDTH-1:0] rd_data_o;
output reg full_o, empty_o, overflow_o, underflow_o;

//Creating Memory
reg [DATA_WIDTH-1:0] FIFO_MEM [DEPTH-1:0];

//pointers for remembering how many writes and reads are happening
reg [ADDR_WIDTH-1:0] wr_ptr,rd_ptr;

//Toggle flags
reg wr_toggle_f,rd_toggle_f;
integer i;

//write logic w.r.t  write clock domain.
always@(posedge wr_clk_i) begin 
    if(rst_i) begin                                                                                                                                                                                                                                                                                                                                                                                                            
        rd_data_o = 0;
        full_o = 0;
        empty_o = 1; //indicates FIFO is empty
        overflow_o = 0;
        underflow_o = 0;
        wr_ptr = 0;
        rd_ptr = 0;
        wr_toggle_f = 0;
        rd_toggle_f = 0;
        for(i=0;i<DEPTH;i=i+1) FIFO_MEM[i] = 0;
    end else begin 
        overflow_o  = 0;
        if(wr_en_i) begin 
            if(!full_o) begin
                FIFO_MEM[wr_ptr] = wr_data_i;
                if(wr_ptr==DEPTH-1) wr_toggle_f = ~wr_toggle_f;
                wr_ptr = wr_ptr+1;
            end else begin 
                overflow_o = 1;
            end
        end 
    end
end

//Read logic w.r.t. Read clock domain.
always@(posedge rd_clk_i) begin 
    if(rst_i==0) begin           //since, we already reset them in write logic, no need of again resetting here.                                                                                                                                                                                                                                                                                                                                                                                                  
        underflow_o  = 0;
        if(rd_en_i) begin
            if(!empty_o) begin 
                rd_data_o = FIFO_MEM[rd_ptr];
                if(rd_ptr==DEPTH-1) rd_toggle_f = ~rd_toggle_f;
                rd_ptr = rd_ptr+1;
            end else begin 
                underflow_o = 1;
            end
        end
    end
end


//We need to synchronise the pointers. 
//Toggle flags are also part of pointers, so need to synchronise them w.r.t. their respected clocks.
reg [ADDR_WIDTH-1:0] wr_ptr_rd_clk,rd_ptr_wr_clk;
reg rd_toggle_f_wr_clk,wr_toggle_f_rd_clk;

//synchronizing rd_ptr into wr_clk domain: FULL CONDITION
always@(posedge wr_clk_i) begin 
    rd_ptr_wr_clk <= rd_ptr;  //1-stage synchronization
    rd_toggle_f_wr_clk <= rd_toggle_f;
end

//synchronizing wr_ptr into rd_clk domain: EMPTY CONDITION
always@(posedge rd_clk_i) begin 
    wr_ptr_rd_clk <= wr_ptr; //1-stage synchronization
    wr_toggle_f_rd_clk <= wr_toggle_f;
end

assign full_o = (wr_ptr==rd_ptr_wr_clk) && (wr_toggle_f != rd_toggle_f_wr_clk); //we can also use always@(*)
assign empty_o = (wr_ptr_rd_clk==rd_ptr) && (wr_toggle_f_rd_clk == rd_toggle_f);

endmodule