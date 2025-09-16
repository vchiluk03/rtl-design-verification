//ALU IMPLEMENTATION USING FUNCTION

//funtion prototype - function reg [31:0] alu(input [7:0] in1,in2, input [3:0] operation); 

module tb;

reg [7:0] operand_1, operand_2;
reg [3:0] operation;
reg [31:0] result;

parameter NO_OPERATION = 4'd0;
parameter ADD = 4'd1;
parameter SUB = 4'd2;
parameter MUL = 4'd3;
parameter DIV = 4'd4;
parameter MOD = 4'd5;
parameter POWER = 4'd6;
parameter LEFT_SHIFT = 4'd7;
parameter RIGHT_SHIFT = 4'd8;

function reg [31:0] alu(input [7:0] in1,in2, input [3:0] operation); 
begin 
	case(operation) 
		NO_OPERATION : $display("NO_OPERATION");
		ADD : alu = in1+in2;
		SUB : alu = in1-in2;
		MUL : alu = in1*in2;
		DIV : alu = in1/in2;
		MOD : alu = in1%in2;
		POWER : alu = in1 ** in2;
		LEFT_SHIFT : alu = in1 << in2;
		RIGHT_SHIFT: alu = in1 >> in2;
		default: $display("PLEASE PROVIDE CORRECT OPERATION");
	endcase
end
endfunction

initial begin 
	repeat(30) begin
		{operand_1,operand_2} = $urandom_range(1,400);
		operation = $urandom%9;
		result = alu(operand_1,operand_2,operation);
		#1;
		$display("%0t\t\tvalue of input-1 : %0d\t\tvalue of input-2 : %0d\t\tOPERATION_TYPE : %0d\t\tRESULT : %0d",$time,operand_1,operand_2,operation,result);
	end
end
endmodule 