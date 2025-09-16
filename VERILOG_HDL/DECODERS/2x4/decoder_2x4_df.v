//This is 2x4 decoder in data-flow style  - using boolean expressions
module decoder_2x4 (i,y);
input [1:0] i;
output [3:0] y;

assign y[0] = ~i[1]&~i[0];
assign y[1] = ~i[1]&i[0];
assign y[2] = i[1]&~i[0];
assign y[3] = i[1]&i[0];

//assign y= (i==0)?0:(i==1)?2:(i==2)?4:8; 

endmodule 