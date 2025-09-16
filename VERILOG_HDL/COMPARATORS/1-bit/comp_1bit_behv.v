//Behavioral model 

module comp_1bit (a,b,gt,eq,lt);
input a,b;
output reg gt,eq,lt;

always@(*) begin 
	gt = 0;   //we have to initialize them to zero. Because, it is reg, when at one nput combination, gt becomes, and next combination eq or lt becomes 1.	
	eq = 0;   //But previous gt won't becomes zero, unless you make it. So, if it is not zero, multiple outputs becomes true. which is not possible.
	lt = 0;
	if (a>b)  gt = 1;  //All are mutually exclusive - when one happens others won't. Equal priority to all, so 'else' is not compulsory.
	if (a==b) eq = 1;
	if (a<b)  lt = 1;
end
endmodule