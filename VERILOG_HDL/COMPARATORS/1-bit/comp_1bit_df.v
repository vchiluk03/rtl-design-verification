//Data flow model 

module comp_1bit (a,b,gt,eq,lt);
input a,b;
output gt,eq,lt;

assign {gt,eq,lt} = (a>b) ? 3'b100 : (a==b) ? 3'b010 : (a<b) ? 3'b001 : 3'bx;

endmodule