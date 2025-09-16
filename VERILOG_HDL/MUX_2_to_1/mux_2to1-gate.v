//mux-2to1 in gate-level modelling

module mux_2to1(sel,a,b,y);
input a,b,sel;
output y;

//using in-built gate-primitives
not (not_sel,sel);
and (and1,not_sel,a);
and (and2,sel,b);
or  (y,and1,and2);

endmodule  