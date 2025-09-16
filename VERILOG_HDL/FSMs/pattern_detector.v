/******************************************
Pattern detector hardware circuit for detecting sequence of Bike, car, car, Bike, car (BCCBC).
- This is moore style FSM, where output solely depends on state. 
- Requires 'n+1' number of states.
**************************************************************/
module pattern_detector(clk_i,rst_i,valid_i,d_in,pattern_detected,moore_NOL,moore_OL);
input clk_i,rst_i,d_in,valid_i;
input moore_OL,moore_NOL;
output reg pattern_detected;

/**********************************************************************************
- we can use one-hot encoding or binary encoding for state representation.
- Binary representation: For 'n' states --> log2(n) bits --> log2(n) D-ff's 
- One-hot encoding: For 'n' states --> 'n' bits required --> 'n' D-ffs.
**************************************************************************************************/
//using one-hot encoding.
parameter IDLE    = 6'b000001;
parameter S_B     = 6'b000010; //S_B --> state_B --> 'B' is detected till now
parameter S_BC    = 6'b000100;
parameter S_BCC   = 6'b001000;
parameter S_BCCB  = 6'b010000;
parameter S_BCCBC = 6'b100000;

//using binary encoding.
parameter BIKE = 1'b0;
parameter CAR  = 1'b1;   //pattern is BCCBC --> 01101

reg [5:0] state, next_state;

//state logic
always@(posedge clk_i) begin 
    if(rst_i) begin 
        //pattern_detected = 0;
        state = IDLE;
    end else begin 
        state = next_state;
    end

end

//Next-state logic - what is the condition that state goes to next state
always@(*) begin 
    case(state) 
        IDLE    : next_state = (valid_i && d_in==BIKE) ? S_B : IDLE;
        S_B     : next_state = (valid_i && d_in==CAR)  ? S_BC : S_B;
        S_BC    : next_state = (valid_i && d_in==CAR) ? S_BCC : S_B;
        S_BCC   : next_state = (valid_i && d_in==BIKE) ? S_BCCB : IDLE;
        S_BCCB  : next_state = (valid_i && d_in==CAR) ? S_BCCBC : S_B;
        S_BCCBC : next_state = (valid_i && d_in==BIKE) ? S_B : (moore_OL ? S_BCC : IDLE);
        default : next_state = IDLE;
    endcase
end

//output logic- When output should be high
assign pattern_detected = (state  == S_BCCBC);


endmodule