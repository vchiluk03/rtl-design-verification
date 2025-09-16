//Structural/gate level modelling only using gates

module full_adder(p,q,r,sum,carry);
input p,q,r;
output sum,carry;

wire w1,w2,w3; //if we don't declare also, the tool will automatically take them as wires  -
                //Any undeclared variables are traeated scalar nets

xor (w1,p,q);
xor (sum,w1,r);
and (w2,p,q);
and (w3,w1,r);
or  (carry,w3,w2);


endmodule 