`include "../D_FFs/dff_behav.v"
module up_counter_structural(clk,rst,count);
input clk,rst;
output [2:0] count;

//d2= c2~c1 | c2~c0 | ~c2c1c0 = n1 |n2 | n3
//d1= ~c1c0 | c1~c0 = c1^c0
//d0= ~c0
not (c2_bar,count[2]);
not (c1_bar,count[1]);
not (c0_bar,count[0]);

and (n1,count[2],c1_bar);
and (n2,count[2],c0_bar);
and (n3,c2_bar,count[1],count[0]);
or  (d2,n1,n2,n3);

xor (d1,count[1],count[0]);

buf (d0,c0_bar);


dff_behav inst1(clk,rst,d2,count[2]);
dff_behav inst2(clk,rst,d1,count[1]);
dff_behav inst3(clk,rst,d0,count[0]);

endmodule