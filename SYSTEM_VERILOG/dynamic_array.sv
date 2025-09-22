//Dynamic arrays 
//Declare a dynamic array and fixed size array of word data type, allocate size of 10. 
//Fill it with random numbers netween 20 and 30.

module tb;

reg [16:0] arrayA[];
reg [16:0] arrayB[10]; //Total 10 elements i.e; index 9 to 0.

initial begin 
	arrayA = new[10]; //same as array = new[9:0];
	foreach(arrayA[i]) begin 
		arrayA[i] = $urandom_range(20,30);
		#1;
		$display("At index[%0d]:%0d",i,arrayA[i]);
	end
	
	foreach(arrayB[j]) begin //it automatically declares j as an integer.
		arrayB[j] = $urandom_range(20,30);
		#1;
		$display("At index[%0d]:%0d",j,arrayB[j]);
	end
	
	assert(arrayA==arrayB)$display("MATCHED");
	else $error("MISMATCHED");
	
	
	for(integer i=0;i<10;i=i+1) begin 
		if(arrayA[i]==arrayB[i]) $display("matched at index[%0d]",i);
		else $display("Mismatched at index[%0d]",i);
	end
	
end
endmodule 