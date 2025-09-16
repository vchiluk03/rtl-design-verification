//This is a 4x2 priority encoder in behavioral style modelling 

module p_encoder_4x2(i,y,v);

input [3:0] i;
output reg [1:0]y;
output reg  v;

always@(*) begin 
	v=1;
	y=2'b00;
	casex(i) 
		4'b0001 : y = 2'b00;
		4'b001x : y = 2'b01;
		4'b01xx : y = 2'b10;
		4'b1xxx : y = 2'b11;
		default : v = 0;
	endcase
end

endmodule
