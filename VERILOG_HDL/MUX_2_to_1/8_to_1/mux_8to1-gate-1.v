//8 to 1 MUX using instances of 2 to 1 mux. We need 7 2:1 muxes
`include "../mux_2to1-behv.v"
`include "../4_to_1/mux_4to1-df.v"

module mux_8to1(s2,s1,s0,i0,i1,i2,i3,i4,i5,i6,i7,y);

input s0,s1,s2,i0,i1,i2,i3,i4,i5,i6,i7;
output y;

wire [3:0] I1,I2;
wire [1:0] s;

assign I1 ={i3,i2,i1,i0};
assign I2 ={i7,i6,i5,i4};
assign s= {s1,s0};

mux_4to1 inst1(w1, I1, s);
mux_4to1 innst2(w2, I2, s);
mux_2to1 inst3(s2,w1,w2,y);

endmodule