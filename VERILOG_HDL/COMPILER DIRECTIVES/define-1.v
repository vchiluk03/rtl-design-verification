//write a parameterized macro with naem 'FIND_BIGGER_NUM'.
//Two arguments- check which argument is bigger and returns the same.
`define FIND_BIGGER_NUM(num1,num2) (num1>num2)?num1:num2
module tb;
integer result;

initial begin 
	result = `FIND_BIGGER_NUM(23,53);
	$display("RESULT:%0d",result);
end
endmodule