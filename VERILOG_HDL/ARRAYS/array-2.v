module tb;

integer intA[9:0];
integer intA1[9:0];
integer i;

initial begin 
	//display array contents before initialization
	display_arrays();
	$display("*********************************************************************");
	//display the array contents after initialization
	for (i=0;i<10;i=i+1) begin 
		intA[i] = $urandom_range(40,50);
	end
	display_arrays();
	$display("*********************************************************************");
	//Copy 1st array values to 2nd array, then display 2nd array elements
	for (i=0;i<10;i=i+1) begin 
		intA1[i] = intA[i];
		$display("array at index[%0d] has %0d",i,intA1[i]);
	end
	$display("*********************************************************************");
	//write code to compare 1st array elements with 2nd array elements
	compare_arrays();
	$display("*********************************************************************");
	//write a code to increment 2nd array values by +1 for all elements, then compare both the arrays 
	for (i=0;i<10;i=i+1) begin 
		intA1[i] = intA1[i]+1;
	end
	compare_arrays();		
end

//TASKS
task compare_arrays();
	begin
		for(i=0;i<10;i=i+1) begin 
			if(intA[i] == intA1[i]) 
				$display("At index[%0d] : Comparison successful : No mismatch",i);
			else
				$display("At index[%0d] : Comparison unsuccessful : there is a value mismatch : value at 1st array:%0d , value at 2nd array:%0d",i,intA[i],intA1[i]);
		end
	end
endtask

task display_arrays();
	begin
		for (i=0;i<10;i=i+1) begin 
			//$display("intA[%0d] = %0d",i,intA[i]);
			//$display("index = %0d, array_value = %0d",i,intA[i]);
			$display("array at index[%0d] has %0d",i,intA[i]);
		end 
	end
endtask


endmodule