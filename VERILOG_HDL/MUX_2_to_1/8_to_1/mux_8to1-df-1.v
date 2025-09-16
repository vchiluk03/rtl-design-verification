//8:1 mux in data-flow modelling - combining all assign statemenst and make it one.
//Built using 2:1 mux style
module mux_8to1(s2,s1,s0,i0,i1,i2,i3,i4,i5,i6,i7,y);

input s0,s1,s2,i0,i1,i2,i3,i4,i5,i6,i7;
output y;

assign y =  s2 ? (s1?s0?i7:i6:s0?i5:i4) : (s1?s0?i3:i2:s0?i1:i0);

endmodule 