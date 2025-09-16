//mux_2to1 in data flow modelling

module mux_2to1(sel,a,b,y);
input a,b,sel;
output y;

//using boolean expression
assign y = ~sel&a | sel&b;

endmodule  