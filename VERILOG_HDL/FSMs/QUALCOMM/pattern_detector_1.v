/*************************************************************************
- Detecting numbers pattern: Output should be high when input seen even, odd, odd, even numbers in a sequence.
- This is 'QUALCOMM' intern interview question.
*********************************************************************************************/
module pattern_detector_1(clk,rst,in,valid,sequence_detected);
parameter IDLE = 3'b000;
parameter S_EVEN = 3'b001;
parameter S_EVEN_ODD = 3'b010;
parameter S_EVEN_ODD_ODD = 3'b011;
parameter S_EVEN_ODD_ODD_EVEN = 3'b100;

input clk,rst,valid;
input [3:0] in; //input is 4-bit number.
output reg sequence_detected;

reg [2:0] state,next_state;
wire even,odd;
//state logic 
always@(posedge clk) begin 
    if(rst) state <= IDLE;
    else state <= next_state; 
end

//How do we know, input number is even or odd? If LSB=0 --> even, else odd.
assign even = (in[0]==0);
assign odd = ~even;

//Next-state logic
always @(*) begin
    case(state) 
        IDLE: next_state = (valid && even) ? S_EVEN : IDLE;
        S_EVEN: next_state = (valid && odd) ? S_EVEN_ODD : S_EVEN;
        S_EVEN_ODD: next_state = (valid && odd) ? S_EVEN_ODD_ODD : S_EVEN;
        S_EVEN_ODD_ODD: next_state = (valid && even) ? S_EVEN_ODD_ODD_EVEN : IDLE;
        S_EVEN_ODD_ODD_EVEN: next_state = (valid && even) ? S_EVEN : S_EVEN_ODD;
        default: state = IDLE;
    endcase
end

//Output logic - when the state is in last state, we detect the pattern and output should be high.
assign sequence_detected = (state == S_EVEN_ODD_ODD_EVEN);

endmodule 