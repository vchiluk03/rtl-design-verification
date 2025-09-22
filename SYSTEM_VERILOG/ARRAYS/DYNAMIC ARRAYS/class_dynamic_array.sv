class sample;
int count;
endclass

module tb;
	sample sample_dyn_A[]; //Created dynamic array of type class object
	
initial begin 
	sample_dyn_A = new[10]; //Array has 10 elements. Each element is class initialized to null.
							//we need to allocate memory using new() make it object
	foreach(sample_dyn_A[i]) begin 
		sample_dyn_A[i] = new();
	end
end
endmodule 