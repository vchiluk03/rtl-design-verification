//This is the 1x4 Demux in gate-level modelling 

module demux_1x4_behv(i,s,y);
input i;
input [1:0] s;
output [3:0] y;

not (s1_bar,s[1]);
not (s0_bar,s[0]);
and (y[3],s[1],s[0],i);
and (y[2],s[1],s0_bar,i);
and (y[1],s1_bar,s[0],i);
and (y[0],s0_bar,s1_bar,i);

endmodule 