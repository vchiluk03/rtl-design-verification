//static and Automatic Functions/Tasks
/*************************************************************************************************************************
static: share resource variable -  same memory location.
	- we we call the function multiple times, execution happens in same memory location.
	- By defualt, task and function inside a module are static in nature.
	
	
Automatic: when we call tasl/function multiple times, execution happens in diffferent memory locations.
	-Generally used whenever recursive function/task calls are required.
	-Elements Existing value gets overwritten.
****************************************************************************************************************************/

module tb;
//task declaration inside module.
//All the variables are static in nature.
task print();
real count;
begin 
	count = count +1;
	$display("count = %0d",count);
end
endtask

initial begin 
	repeat(10) begin 

		print(); //Because, the task is static in nature,
				//count variable gets incremented everytime by 1, to the existing value.
				//Because, it is a same memory location.
				
	end


end
endmodule