//This is the 1x4 Demux in behavioral style modelling 

module demux_1x4_behv(i,s,y);
input i;
input [1:0] s;
output reg [3:0] y;

always@(*) begin 
		y= 4'b0;
	case(s) 
		2'b00 : y[0]= i;
		2'b01 : y[1]= i;
		2'b10 : y[2]= i;
		2'b11 : y[3]= i;
		default: y=4'bx;
		endcase
end

endmodule 