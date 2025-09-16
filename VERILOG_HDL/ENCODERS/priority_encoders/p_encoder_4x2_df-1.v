//This is data-flow modelling - priority encoder - using boolean expression 

module p_encoder_4x2(i,y,v);

input [3:0] i;
output [1:0]y;
output  v;

assign y[1] = i[3] | i[2];
assign y[0] = (i[3] | i[2]) & i[2];
assign v = |i;  //i[3] | i[2] | i[1] | i[0]

endmodule 
