//Declare a QUEUE of ARRAY(5) of integers. Queue maximum size is 3.
//
module top;
	int intQ_A[$:2][5]; //Total: 3*5 = 15elements
		//Queue of Arrays: First 'Q' dimension, then array dimension
	initial begin 
		for(int i=0;i<3;i++) begin  
			foreach(intQ_A[i][j]) begin
				intQ_A[i][j] = $urandom_range(10,20);
			end
		end
		//Display the multi-dimensional array using%p.
		$display("intQ_A=%p",intQ_A);
		
		//printing using foreach
		foreach(intQ_A[i,j]) begin 
			$display("\tintQ_A[%0d][%0d] : %0d",i,j,intQ_A[i][j]);
		end
	end	
endmodule

//Declare array of array of integer, top level:3 size, lower array:5 size.
	//int intA[2:0][4:0];

//Declare array of queue of bytes. Array size is 5.
	//byte byteA_Q[4:0][$];