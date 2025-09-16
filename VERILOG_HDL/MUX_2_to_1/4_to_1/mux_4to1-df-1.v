//4 to 1 MUX using data flow modelling - using boolean expression

module mux_4to1(y, i, s);
input [3:0] i; //we have taken vector, instaed of four scalars.
input [1:0] s; //Here, also instead of taking 2 scalars, we have taken a vector of 2 bits 
output y;

//assign  y = ~s&i[0] | ~s[1]&s[0]&i[1] | s[1]&~s[0]&i[2] | s&i[3];
assign  y = ~s[1]&~s[0]&i[0] | ~s[1]&s[0]&i[1] | 
			s[1]&~s[0]&i[2] | s[1]&s[0]&i[3];

endmodule  
