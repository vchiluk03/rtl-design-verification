module tb;

int dyn_arr[]; //'int' is 2-state varibale. SO, default values are 0.

initial begin 
	dyn_arr = new[10]; //allocated 10 elements of memory 
	$display("dyn_arr=%p",dyn_arr);
end
endmodule 