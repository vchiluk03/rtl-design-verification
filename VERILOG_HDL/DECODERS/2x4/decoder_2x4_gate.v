//This is 2x4 decoder in gate-level modelling 
module decoder_2x4 (i,y);
input [1:0] i;
output [3:0] y;

not (not_i0,i[0]);
not (not_i1,i[1]);
and (y[0],not_i0,not_i1);
and (y[1],not_i1,i[0]);
and (y[2],i[1],not_i0);
and (y[3],i[1],i[0]);

endmodule 