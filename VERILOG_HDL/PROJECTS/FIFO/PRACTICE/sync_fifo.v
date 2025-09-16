module sync_fifo(clk,rst_n,wr_en,rd_en,wr_data,rd_data,full,empty,underflow,overflow);
parameter  DEPTH = 32;
parameter DATA_WIDTH = 8;
parameter ADDR_WIDTH = $clog2(DEPTH);

input wire clk,rst_n,wr_en,rd_en;
input wire [DATA_WIDTH-1:0] wr_data;
output reg [DATA_WIDTH-1:0] rd_data;
output reg full,empty,overflow, underflow;

//pointers for tracking reads and writes 
reg [ADDR_WIDTH-1:0] wr_ptr,rd_ptr;

//FIFO memory 
reg [DATA_WIDTH-1:0] FIFO [DEPTH-1:0];
reg wr_toggle_f,rd_toggle_f;
integer i;

//Write  and Read operation
always@(posedge clk or negedge rst_n) begin 
    if(!rst_n) begin 
        rd_data <= 0;
        full <= 0; 
        empty <= 0;
        overflow <= 0;
        underflow <= 0;
        {wr_toggle_f,wr_ptr} <= 0;
        {rd_toggle_f,rd_ptr} <= 0;
        for(i=0;i<DEPTH;i=i+1) begin 
            FIFO[wr_ptr] <= 0;
        end
    end else begin 
        if(wr_en) begin
            if(full) overflow <= 1;
            else begin
                FIFO[wr_ptr] <= wr_data;
                if(wr_ptr==DEPTH-1) wr_toggle_f <= ~wr_toggle_f; 
                wr_ptr <= wr_ptr+1;
            end
        end
        if(rd_en) begin 
            if(empty) underflow <= 1;
            else begin
                rd_data <= FIFO[rd_ptr];
                if(rd_ptr==DEPTH-1) rd_toggle_f <= ~rd_toggle_f; 
                rd_ptr <= rd_ptr+1;
            end
        end
    end
end


always@(*) begin
    full  = (wr_ptr==rd_ptr) && (wr_toggle_f!=rd_toggle_f);
    empty = (wr_ptr==rd_ptr) && (wr_toggle_f==rd_toggle_f);

    //if((wr_ptr==rd_ptr) && (wr_toggle_f!=rd_toggle_f)) full <=  1;
    //if((wr_ptr==rd_ptr) && (wr_toggle_f==rd_toggle_f)) empty <= 1;
end   

endmodule