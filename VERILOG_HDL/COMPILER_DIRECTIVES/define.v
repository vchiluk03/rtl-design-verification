//COMPILER DIRECTIVES - Instructions giving to compiler to follow.
/********************************************************************************
-Here we are defining a macro with name 'WIDTH'. So, in the code, wherever it sees WIDTH, 
 compiler replace it with 32.
-This is similar to parameter. But in parameter, we only give value i.e; either in form of bits or decimal etc.
	Ex: parameter WIDTH = 32; 
-Also over-riding is not possible in macro defnition, like in parameters.
-But defining macro can be anything. 
	Ex: `define BUS reg[31:0] //wherever `BUS is there in the code gets replaced with reg[31:0] 
-We can even give arguments to macro-Parameterized Macro
**************************************************************************************/
`define BUS(WIDTH,LSB) reg[WIDTH+LSB-1:LSB] 

module tb;
`BUS(64,2) vec1; //reg [65:2] vec1
`BUS(16,1) vec2; //reg [16:1] vec2
`BUS(4,3) vec3; //reg [6:3] vec3

initial begin 
	vec1 = 428;
	vec2 = 32;
	vec3 = 7;
	$display("vec1=%b",vec1);
	$display("vec2=%b",vec2);
	$display("vec3=%b",vec3);
end

endmodule 