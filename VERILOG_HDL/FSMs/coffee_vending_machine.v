module coffee_dispenser(clk,rst,in,go,dispenser);
parameter IDLE         = 2'b00;
parameter S_coffee_A   = 2'b01;
parameter S_coffee_B   = 2'b10;
parameter S_coffee_C   = 2'b11;

parameter A = 2'b00;
parameter B = 2'b01;
parameter C = 2'b10;

input clk,rst,go;
input [1:0] in;
output reg dispenser;

reg [1:0] state,next_state;

always@(posedge clk) begin 
    if(rst) state <= IDLE;
    else state <= next_state;
end

always@(*) begin  //possible input combinations are A, B, and C
    case(state) 
        IDLE, S_coffee_A, S_coffee_B, S_coffee_C : begin 
            case(in) 
                A : next_state = S_coffee_A;
                B : next_state = S_coffee_B;
                C : next_state = S_coffee_C;
                default : next_state = IDLE;   
            endcase
        end
    default : next_state = IDLE;  
    endcase
end

alwasy@(*) begin 
    dispenser = in;
end

endmodule