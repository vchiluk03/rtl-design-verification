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

integer i,j,k,wr_delay,rd_delay;
reg [8*25:1] testname;
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
    end
    @(posedge clk_i);
    rd_en_i = 0;
end
endtask

initial begin 
    $value$plusargs("TEST_NAME:%s",testname);
    reset_fifo();
    case(testname)
        "test_full": begin 
            $display("==========================Full flag before testing:%0d==================",full_o);
            fifo_write(DEPTH);
            fifo_read(DEPTH);
            #1;
            $display("==========================Full flag after testing:%0d=====================",full_o);
        end
        "test_empty": begin 
            $display("==========================Empty flag before testing:%0d====================",empty_o);
            fifo_write(5);
            fifo_read(5);
            #1;
            $display("==========================Empty flag after testing:%0d======================",empty_o);
        end
        "test_overflow": begin 
            $display("%t\t==========================OVERFLOW flag before testing:%0d===================",$time,overflow_o);
            fifo_write(DEPTH+1);
            #1;
            $display("%t\t===========================OVERFLOW flag after testing:%0d====================",$time,overflow_o);
        end
        "test_underflow": begin 
            $display("============================UNDERFLOW flag before testing:%0d==================",underflow_o);
            fifo_write(2);
            fifo_read(3);
            #1;
            $display("=============================UNDERFLOW flag after testing:%0d===================",underflow_o);
        end
        "test_concurrent_wr_rd": begin 
            fork 
            begin 
                for(j=0;j<5;j=j+1) begin
                    fifo_write(1);
                    wr_delay = $urandom_range(1,10);
                    repeat(wr_delay) @(posedge clk_i);
                end    
            end
            begin
                for(k=0;k<5;k=k+1) begin
                    fifo_read(1);
                    rd_delay  = $urandom_range(1,10);
                    repeat(rd_delay) @(posedge clk_i);
                end
            end
            join
        end
    endcase
    #100 $finish;
end

endmodule