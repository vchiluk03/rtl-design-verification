//Gave level implementation of D-ff - Master slave using nand gates
//Negedge D-ff
module dff_gate(clk,D,Q,Q_bar);
input clk,D;
output Q,Q_bar;

not (n1,D);
and (n2,D,clk);
and (n3,n1,clk);
nor (n5,n2,n6);
nor (n6,n3,n5);
and (n7,n5,n4);
and (n8,n4,n6);
nor (Q,n7,Q_bar);
nor (Q_bar,n8,Q);
not (n4,clk);

endmodule