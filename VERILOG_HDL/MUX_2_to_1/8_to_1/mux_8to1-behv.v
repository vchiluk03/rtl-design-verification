//8 to 1 MUX using behavioral modelling  - using if-else
module mux_8to1(s2,s1,s0,i0,i1,i2,i3,i4,i5,i6,i7,y);
input s0,s1,s2,i0,i1,i2,i3,i4,i5,i6,i7;
output reg y;

wire [2:0] s;
assign s = {s2,s1,s0};


always@(*) begin //we can even use '*' instead of listing everything in sensitivity list. 
				// '*' is not indicating all inputs. It indicates only thye inputs that impacts the output
				//This is new method od including all input signals- an extension of verilog-2001.
	if(s==3'b000) y = i0;
	else if (s==3'b001) y = i1;
	else if (s==3'b010) y = i2;
	else if (s==3'b011) y = i3;
	else if (s==3'b100) y = i4;
	else if (s==3'b101) y = i5;
	else if (s==3'b110) y = i6;
	else if (s==3'b111) y = i7;
	else y = 1'bx;
end

endmodule 