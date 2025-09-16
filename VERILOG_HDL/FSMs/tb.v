module tb;
parameter BIKE = 1'b0;
parameter CAR  = 1'b1;

reg clk,rst,in,valid;
reg moore_OL,moore_NOL;
wire pattern_detected;

pattern_detector DUT(.clk_i(clk),.rst_i(rst),.valid_i(valid),.d_in(in),.pattern_detected(pattern_detected),
                    .moore_NOL(moore_NOL),.moore_OL(moore_OL));
integer count;
reg [59:0] in_name; //for input string

always #5 clk = ~clk;

always@(*) begin 
    case(in) 
        BIKE : in_name = "BIKE";
        CAR  : in_name = "CAR";
        default : in_name = "UNKNOWN";
    endcase
end

initial begin 
    clk = 0;
    count = 0;

    rst = 1; //it will make all outputs to zero.
    in  = 0;
    valid = 0;
    moore_NOL = 0;
    moore_OL  = 0;
    @(posedge clk);
    rst = 0;

    repeat(600) begin 
        @(posedge clk);
        moore_NOL = 0;
        moore_OL  = 1;
        valid = 1;
        in = $urandom_range(BIKE,CAR);
    end
    @(posedge clk) valid = 0;

    $display("Number of times pattern detected:%0d",count);    
    #50 $finish; 
end

always@(posedge pattern_detected) count = count+1;

endmodule 