//mux_2to1 in data flow modelling

module mux_2to1(sel,a,b,y);
input a,b,sel;
output y;

assign y = sel? b: a;

endmodule  