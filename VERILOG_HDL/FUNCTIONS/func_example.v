//FUNCTION  EXAMPLE

NOTES:
------
1. Must execute in 0 time. 
2. Function can not have any dealy causing statements - @,@(posedge),#,wait
3. Code must be enclosed between begin and end
4. Function arguments restricted to inputs only
	- output and inout arguments are not allowed 
5. Output of a function is indicated by an assignment to the function name
6. Functions can be called inside functions.
7. Task can not be called inside function. Because task allows delay causing statements, whereas functions happen in 0 time, which is a conflict.

SYNTAX:
-------
function RETURN_DATA_TYPE NAME_OF_FUNCTION(only input arguments);
begin 
	function code;
end
endfunction
/**********************************************************************************************************************/
//write a function(name:sum) to add two integers a,b.

function integer sum(input integer a,b);
begin 
	sum = a+b;
end
endfunction

//write a function to subtract two variables a,b. Where a is type integer and b is real.
function real difference(input integer a,input real b); //if we subtract integer-real, output is real. So return data type is real.
begin 
	difference = a-b;
end
endfunction

//Use the above sum function, write code to add two integer arays of 5 elements, and place the result in third array - INVOCATION
integer intA[4:0];
integer intB[4:0];
integer intC[4:0];

initial begin
	for(i=0;i<5;i=i+1) begin 
		intC[i] = sum(intA[i],intB[i]);
	end
end