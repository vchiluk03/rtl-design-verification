/***********************************
-Write a macro with name 'ALU' with 3 arguments
  - one argument for operation
  - other two arguments are inputs for ALU operator 
	-Macro will implement different ALU operations based on the operator argument passed and 
		returns the value
*********************************************/

`define ALU(a,b,operation) operation == ADD        ? a+b : \
						   operation == SUB        ? a-b : \
				    	   operation == MUL        ? a*b : \
						   operation == DIV        ? a/b : \
						   operation == MOD        ? a%b : \
						   operation == POW        ? a**b: \
						   operation == LEFT_SHIFT ? a<<b: \
						   operation == RIGHT_SHIFT? a>>b: 0
						   //Macro defnition cab nbe inside/outside of the module 
module tb;

parameter NO_OPERATION  = 0;
parameter ADD			= 1;	
parameter SUB		    = 2;
parameter MUL			= 3;
parameter DIV		    = 4;
parameter MOD			= 5;
parameter POW           = 6;
parameter LEFT_SHIFT    = 7;
parameter RIGHT_SHIFT	= 8;	

integer result;
integer input1,input2,oper;

initial begin 
			{input1,input2} = $urandom_range(20,50);
			oper = ADD;
			result = `ALU(input1,input2,oper);
			$display("input-1:%0d,input-2:%0d,RESULT:%0d",input1,input2,result);
			{input1,input2} = $urandom_range(20,50);
			oper = MUL;
			result = `ALU(input1,input2,oper);
			$display("input-1:%0d,input-2:%0d,RESULT:%0d",input1,input2,result);
			{input1,input2} = $urandom_range(20,50);
			oper = LEFT_SHIFT;
			result = `ALU(input1,input2,oper);
			$display("input-1:%0d,input-2:%0d,RESULT:%0d",input1,input2,result);
			input1 = 27;
			input2 = 2;
			oper = LEFT_SHIFT;
			result = `ALU(input1,input2,oper);
			$display("input-1:%0d,input-2:%0d,RESULT:%0d",input1,input2,result);
end
endmodule  