class sample;

//task defined inside class
task  print();
	real count;  //is  automatic variable 
begin 
	count = count +1;
	$display("count = %0d",count);
end
endtask

endclass




module tb;
sample s = new();

initial begin 
	repeat(10) begin 
	
		s.print(); //Because, the task is defined inside class,, to access the task, we have to create the class object.
				
	end
end
endmodule

