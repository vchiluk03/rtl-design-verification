/*Structural/gate level modelling using Half-Adder Instances

   NOTE: It is not mandatory to give instance names to in-built primitives/structures/gates ;like or,and,xor etc. But when we use instances which we created,
          names are mandatory*/

`include "../HALF_ADDER/half-adder-gate.v"

module full_adder(p,q,r,sum,carry);
input p,q,r;
output sum,carry;

//connection by ports/names
/*	half_adder inst1(.p(p),.q(q),.sum(w1),.carry(w2));
	half_adder inst2(.p(r),.q(w1),.sum(sum),.carry(w3));
	or (carry,w3,w2); */

//connection by position - we can do this only if we know the positions of half-adder- which not always possible, especially complex designs 
half_adder inst1(p,q,w1,w2);
half_adder inst2(r,w1,sum,w3);
or (carry,w3,w2);

endmodule 