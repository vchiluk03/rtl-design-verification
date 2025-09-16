/**********************************************************************************
Encoder: It gives the position of the bit as output, which is high at input.
	- For '2^n' inputs, it gives  'n' bit output.
	   EX: if input = 0001--> output:00 (At input bits, '1' is at bit poition zero)
					  0010-->01, 0100-->10, 1000-->11.
						-what if any other inputs appear other than these four? So, we takes a valid bit and indicate that by making it zero.
						- So, here there is one input(i) and two outputs(y,v).
	- If there are multiple bit at the input, that is where we go to priorirty encoder, where it only cares about first one taht appears coming from MSB
			- It don't cares about the bits after the first one. That is how it gives the priority.
***************************************************************************************/
//This is behavioral style modelling of 4:2 ENCODER.

module encoder_4x2(i,y,v);

input [3:0] i;
output reg [1:0]y;
output reg  v;

always@(*) begin 
	v = 1;
	y = 2'b00;
	case(i) 
		4'b0001 : y = 2'b00;
		4'b0010 : y = 2'b01;
		4'b0100 : y = 2'b10;
		4'b1000 : y = 2'b11;
		default : v = 0; //Making valid bit zero signifies that the input is other than 4 combinaions
	endcase
end

endmodule 