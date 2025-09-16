//Data flow model  using boolean expressions 

module comp_1bit (a,b,gt,eq,lt);
input a,b;
output gt,eq,lt;

assign gt = a & ~b;  
assign eq = ~(a^b); //eq = a~^b; is also correct functionally
assign lt = ~a &b;

endmodule