input a,b,sel;
output y;

reg y; //outputs used in always block should be defined as reg

//How it behaves? whenever inputs change, If sel=0, output shoule be 'a', and else if sel=1, output should be 'b', else when sel==unknown, output is also unknown
always@(a or b or sel) begin 
	if(sel==0) y = a;
	else if (sel==1) y = b;
	else y = 1'bx;
end
//we can even use ternary operator operator instead of using is-else in the above always block.
//usually, we use if-else for more complex designs.

endmodule  