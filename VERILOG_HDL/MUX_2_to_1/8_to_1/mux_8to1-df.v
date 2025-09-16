//8:1 mux in data-flow modelling
//Built using 2:1 mux style
module mux_8to1(s2,s1,s0,i0,i1,i2,i3,i4,i5,i6,i7,y);

input s0,s1,s2,i0,i1,i2,i3,i4,i5,i6,i7;
output y;

wire w1,w2,w3,w4,w5,w6;

assign w1=s0?i1:i0;
assign w2=s0?i3:i2;
assign w3=s0?i5:i4;
assign w4=s0?i7:i6;
assign w5=s1?w2:w1;
assign w6=s1?w4:w3;
assign y=s2?w6:w5;

endmodule 