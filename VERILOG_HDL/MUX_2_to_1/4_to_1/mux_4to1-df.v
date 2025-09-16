//4 to 1 MUX using data flow modelling

module mux_4to1(y, i, s);
input [3:0] i; //we have taken vector, instaed of four scalars.
input [1:0] s; //Here, also instead of taking 2 scalars, we have taken a vector of 2 bits 
output y;

assign  y = (s==2'b00)? i[0]:(s==2'b01) ? i[1]:(s==2'b10) ? i[2]:(s==2'b11) ? i[3]:1'bx;

endmodule  
