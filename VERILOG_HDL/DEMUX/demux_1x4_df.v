//This is the 1x4 Demux in data-flow style modelling 

module demux_1x4_behv(i,s,y);
input i;
input [1:0] s;
output [3:0] y;

assign y[0] = (s==0) ? i :0;
assign y[1] = (s==1) ? i :0;
assign y[2] = (s==2) ? i :0;
assign y[3] = (s==3) ? i :0;

endmodule 