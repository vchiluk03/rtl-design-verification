//up counter using geate level implementation
module up_counter_gate(count,clk,rst);
input clk,rst;
output [2:0] count;

//d2= c2~c1 | c2~c0 | ~c2c1c0 = n1 |n2 | n3
//d1= ~c1c0 | c1~c0 = c1^c0
//d0= ~c0

not (c2_bar,c2);
not (c1_bar,c1);
not (c0_bar,c0);

and (n1,c2,c1_bar);
and (n2,c2,c0_bar);
and (n3,c2_bar,c1,c0);
or  (d2,n1,n2,n4);
xor (d1,c1,c0);
buf (d0,c0_bar);

assign count = {c2,c1,c0}; 
endmodule 
