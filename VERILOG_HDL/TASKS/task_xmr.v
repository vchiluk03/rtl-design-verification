//calling the task/function by hierarchichal reference

module sample();
task print();
begin 
	$display("THIS IS SAMPLE MODULE PRINT TASK");
end
endtask
endmodule






module tb;
sample s(); //instantiating the above module. so we can access both function/tasks by hierarchichal reference

initial begin 
	s.print(); 
end
endmodule