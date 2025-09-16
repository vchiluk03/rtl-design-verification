//gate level modelling

module comp_1bit (a,b,gt,eq,lt);
input a,b;
output gt,eq,lt;

not (not_a,a);
not (not_b,b);
and (gt,a,not_b);
and (lt,not_a,b);
xnor (eq,a,b);

endmodule