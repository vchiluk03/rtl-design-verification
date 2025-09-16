//TASK EXAMPLES
syntax: 
-------
task NAME_OF_TASK(input and output arguments); //prototype
begin 
	task functionality;
end
endtask

NOTES: 
------
1. If all the lines inside the task are synthesizable, then task is synthesizable.
2. All delay causing statements are non-synthesizable.
3. Basically tasks are used inside testbenches.
4. code must be enclosed between begin and end.
5. Arguments for task can be input,output,inout.
6. Both functions and tasks can be called inside task.

/******************************************************************************************/
//task without arguments
task print(); 
begin 
	$display("This is sample task");
end
endtask

//task invocation
print();
/******************************************************************************************/

//task with arguments
//task declaration 
task print_sum(input integer a,input integer b); //task prototype 
begin 
	$display("Printing the sum = %0d", a+b);
end
endtask

//task invocation : task prototype is important for a user to knwo how to invocate, becaue we are giving arguments
print_sum(p,q);
print_sum(87,54);


task sum(input integer a,input integer b,output integer c); //task prototype 
begin 
	c= a+b;
end
endtask

sum(p,q,r);

Note: Arguments can be input, output or inout
/************************************************************************************************/
//tasks can allow delay statemenls like #7, @(posedge clk) etc;
//task with delay - Non-synthesizable 

task sum(input integer a,input integer b,output integer c); //task prototype 
begin 
	c= a+b;
	#2;
	$display("sum=%0d",sum);
end
endtask

