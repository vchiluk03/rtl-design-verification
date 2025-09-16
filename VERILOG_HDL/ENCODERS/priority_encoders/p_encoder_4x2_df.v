//This is data-flow modelling - priority encoder

module p_encoder_4x2(i,y,v);

input [3:0] i;
output [1:0]y;
output  v;

assign {y,v} = 	i[3] ? {2'b11,1'b1} :  // If i = 3 (1000), y = 11
			    i[2] ? {2'b10,1'b1} :  // If i = 2 (0100), y = 10
				i[1] ? {2'b01,1'b1} :  // If i = 1 (0010), y = 01
				i[0] ? {2'b00,1'b1} :  // If i = 0 (0001), y = 00
				{2'b00,1'b0};                   // Default case when all bits are 0 (i = 0000)

endmodule 
