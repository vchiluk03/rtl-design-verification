//4x2 encoder using gate level modelling -----------need too correct-ERRORRRR

module p_encoder_4x2(i,y,v);

input [3:0] i;
output [1:0]y;
output  v;

not (not_i2,i[2]);
or (y[1],i[2],i[3]);
or (w1,i[1],i[3]);
and (y[0],w1,not_i2);
or  (v,i[3:0]);

endmodule 

