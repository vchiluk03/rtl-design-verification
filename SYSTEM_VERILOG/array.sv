//Declare an array of wod(reg [15:0]) data type, array size of 10. Fill it with random number between 20 and 30.
module tb;

reg [15:0] arrayA[10]; //we can define size of array like this in SV, instead of [9:0].
reg [15:0] arrayB[10];
integer i;

initial begin 
	for(i=0;i<10;i=i+1) begin 
		arrayA[i] = $urandom_range(20,30);
		$display("ArrayA-->index[%0d]:%0d",i,arrayA[i]);
	end
	
	//New concept in SV instead of for loop - foreach
	foreach(arrayB[i]) begin
		//SV will treat 'i' or any variabe that we use, as an integer automatically.
		//Here, 'i' will iterate from 0 to array_size-1 
		arrayB[i] = $urandom_range(20,30);
		$display("ArrayB-->index[%0d]:%0d",i,arrayB[i]);
	end
	
	
	//Comparsion logic - Comparing eac index by index
	for(i=0;i<10;i=i+1) begin 
		if(arrayA[i]==arrayB[i]) $display("Both arrays matched at index[%0d]",i);
		else $display("Both arrays mis-matched at index[%0d]",i);
	end
	
	//Comparing ARRAYS as a whole. It will display MISMATCHED, even one index is mismatched.
	if(arrayA==arrayB) $display("ARRAYS MATCHED");
	else $display("ARRAYS MISMATCHED");
	
	//In Sv, the same above code can be done by using 'assert' keyword : IMMEDIATE ASSERTIONS
	//$warning,$fatal are not only associated with Assertions. we can use them with if....else also.
	assert (arrayA==arrayB) $display("MATCHED");
	else begin 
		$error("MISMATCHED");
		$warning("mismatched");
			$fatal("mismatched"); //it will exit the simulation
		$display("arrayA=%p",arrayA);
		$display("arrayB=%p",arrayB); //%p is packed printing - printing everything in one line 
	end
	
	
end

endmodule 