/****************************************************************************************************
RECURSIVE FUNCTION: A function calling itself is called as a recursive function.
	-Whenever we use recursive function calls, we must declare that function as 'automatic'.
	-Because, we want every function to use different memory location.

NOTE: Whenever we are creating recursive function, we should give a condition on when to stop the recursion. Otherwise, it will go on.
-----
*****************************************************************************************************/
//Factorial calculation  = n*(n-1)! 



module tb;
integer number,fact_result;

//Function Declaration
function automatic integer factorial(input integer num);
begin 
	if(num >= 2) factorial = num*factorial(num-1);
	else factorial = 1;
end
endfunction
//In above function, if we don't use automatic, it use shared memory, result in printing the last overwritten value, which is 1.


initial begin 
repeat(10) begin
	number = $urandom_range(1,10);
	fact_result = factorial(number);
	#1;
	$display("Input is %0d and its factorial is %0d",number,fact_result);
end
end

endmodule 