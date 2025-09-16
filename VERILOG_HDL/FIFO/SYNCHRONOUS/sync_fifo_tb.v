module tb;
parameter DEPTH = 16;
parameter DATA_WIDTH = 8;
parameter ADDR_WIDTH = $clog2(DEPTH);

reg clk_i,rst_i;
reg wr_en_i,rd_en_i;
reg [DATA_WIDTH-1:0] wr_data_i;
wire [DATA_WIDTH-1:0] rd_data_o;
wire full_o, empty_o, overflow_o, underflow_o;

sync_fifo #(.DEPTH(DEPTH),.DATA_WIDTH(DATA_WIDTH),.ADDR_WIDTH(ADDR_WIDTH)) dut(
                                                                clk_i,rst_i,
                                                                wr_en_i, wr_data_i, full_o, overflow_o,
                                                                rd_en_i, rd_data_o, empty_o, underflow_o);

integer i;
//Generating clock
initial begin 
    clk_i = 0;
    forever #5 clk_i =~clk_i;
end

//Apply reset
task reset_fifo();
begin 
    rst_i = 1;
    wr_en_i = 0;
    rd_en_i = 0;
    wr_data_i = 0;
    repeat(2) @(posedge clk_i);
    rst_i = 0;
end
endtask

//task for FIFO WRITE
task fifo_write(input integer num_of_locations);
begin 
    for(i=0;i<num_of_locations;i=i+1) begin 
        @(posedge clk_i); //wait for next posedge clk
        wr_en_i = 1;
        wr_data_i = $random;
        $display("write data:%0d\twrite_pointer:%0d",wr_data_i,dut.wr_ptr);
    end
    @(posedge clk_i);
    wr_en_i = 0;
    wr_data_i = 0;
end
endtask

//task for FIFO READ
task fifo_read(input integer num_of_locations);
begin 
    for(i=0;i<num_of_locations;i=i+1) begin 
        @(posedge clk_i);
        rd_en_i = 1;
        $display("Read data:%0d\tRead_pointer:%0d",rd_data_o,dut.rd_ptr);
    end
    @(posedge clk_i);
    rd_en_i = 0;
end
endtask

initial begin 
    reset_fifo();
    fifo_write(DEPTH);
    fifo_read(DEPTH);
    #100 $finish;
end

endmodule