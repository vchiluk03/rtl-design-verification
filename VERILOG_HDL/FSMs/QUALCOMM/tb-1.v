module tb;
reg clk,rst,valid;
reg [3:0] in; //input is 4-bit number.
wire sequence_detected;

pattern_detector_1 DUT(clk,rst,in,valid,sequence_detected);

always #5 clk =~clk;

initial begin 
    clk = 0;
    
    rst = 1;
        in = 0;
        valid = 0;
    @(posedge clk) rst = 0;

    repeat(40) begin 
        @(posedge clk);
        valid = 1;
        in = $urandom;
    end
    @(posedge clk) valid = 0;

    #100 $finish;
end

endmodule 