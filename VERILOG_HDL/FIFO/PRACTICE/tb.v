module tb;
parameter  DEPTH = 32;
parameter DATA_WIDTH = 8;
parameter ADDR_WIDTH = $clog2(DEPTH);

reg clk,rst_n,wr_en,rd_en;
reg [DATA_WIDTH-1:0] wr_data;
wire [DATA_WIDTH-1:0] rd_data;
wire full,empty,overflow, underflow;

sync_fifo dut(clk,rst_n,wr_en,rd_en,wr_data,rd_data,full,empty,underflow,overflow);
integer i;
`include "tasks.v"

initial begin 
    clk = 0;
    forever #5 clk =~clk;
end

initial begin 
    reset_fifo();
    write_fifo(DEPTH);
    read_fifo(2);
    #200 $finish;
end

endmodule 