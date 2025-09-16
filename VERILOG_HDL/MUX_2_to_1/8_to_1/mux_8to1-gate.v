//8 to 1 MUX using instances of 2 to 1 mux. We need 7 2:1 muxes
//This is gate/structural model
`include "../mux_2to1-behv.v" //We can include any file i.e; beh, structural, data-flow. Beacause, at any model, the functionality is same. 
								//Think of it like an IP.

module mux_8to1(s2,s1,s0,i0,i1,i2,i3,i4,i5,i6,i7,y);

input s0,s1,s2,i0,i1,i2,i3,i4,i5,i6,i7;
output y;

mux_2to1 inst1(s0,i0,i1,w1);
mux_2to1 inst2(s0,i2,i3,w2);
mux_2to1 inst3(s0,i4,i5,w3);
mux_2to1 inst4(s0,i6,i7,w4);
mux_2to1 inst5(s1,w1,w2,w5);
mux_2to1 inst6(s1,w3,w4,w6);
mux_2to1 inst7(s2,w5,w6,y);

endmodule