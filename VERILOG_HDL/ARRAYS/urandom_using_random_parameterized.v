//Generating random numbers using $random - parameterized

module tb;

parameter LOWER_VALUE = 654;
parameter UPPER_VALUE = 769;
parameter COUNT = 40;

integer array[COUNT:1];
integer i,seed;

initial begin
seed = 984537;
	for(i=1;i<COUNT+1;i=i+1) begin 
		array[i] = (LOWER_VALUE+UPPER_VALUE)/2 + $random(seed)%((UPPER_VALUE-LOWER_VALUE)/2 + 1);
	end
	display();

end
//Task for displaying the contents
task display(); 
begin 
	for(i=1;i<COUNT+1;i=i+1) begin 
		$display("The contents of array at index[%0d] : %0d",i,array[i]);
	end
	$display("--------------------------------------------------------------------------------------------------");
end
endtask

endmodule
