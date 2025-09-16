//2-bit comparator using two 1-bit comparators and gates - using the below eqn, we can use 1-bit comp.s and build.
/*****************************************************************
gt = (a[1]>b[1]) || ((a[1]==b[1]) && (a[0]>b[0]));
eq = (a[1]==b[1]) && (a[0]==b[0]);
lt = (a[1]<b[1]) || ((a[1]==b[1]) && (a[0]<b[0]));
***********************************************************************************/
`include "../1-bit/comp_1bit_behv.v"

module comp_2bit (a,b,gt,eq,lt);
input [1:0] a,b;
output gt,eq,lt;

wire gt0,gt1,eq0,eq1,lt0,lt1,w1,w2; 

comp_1bit inst1(a[1],b[1],gt1,eq1,lt1);
comp_1bit inst2(a[0],b[0],gt0,eq0,lt0);
//gt logic
and (w1,eq1,gt0);
or (gt,gt1,w1);
//eq logic
and (eq,eq1,eq0);
//lt logic 
and (w2,eq1,lt0);
or (lt,w2,lt1);

endmodule 


 