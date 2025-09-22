//Associative Array
/**************
- Declare an Associative Array of data type '9 bit vector', index type 'integer'.
- Name of Array: bitvecAA
- Allocate 10 elements randomly and store them to the array
	- Data values between 50 and 90.
	- index values between 10 to 40, make sure the index are not duplicated[HINT: exists].
- print all the elements of array usin'%p'.
*************************************************************/
//whenever we need to model a large memory behaviour in TB, we use ASSOCIATIVE ARRAY.
//we dont't use 'new' for allocating memory.
module tb;

reg[8:0] bitvecAA[integer];
integer index,data;
integer indexQ[$];
reg [8:0] valueQ[$]; //since, we are copying reg type data.
integer index_dyn_arr[];
reg [8:0] value_dyn_array[];
integer count,size; //For storing size of associative array
integer index_static_arr[9:0]; //fixed sized array
reg [8:0] value_static_array[9:0]; //fixed sized array
reg[8:0] bitvecAA_ascending[integer]; //Array to print in increasing order

initial begin 
	int i=0;
	while(i<10) begin
		//Below code should be repeated 10 times. 
		index = $urandom_range(10,40); 
		data  = $urandom_range(50,90);
		if(!bitvecAA.exists(index)) begin
			bitvecAA[index] = data;
			i = i+1;
		end
	end
	$display("bitvecAA:%p",bitvecAA);
	//print using foreach loop
	foreach(bitvecAA[i]) $display("bitvec[%0d]:%0d",i,bitvecAA[i]);
	
	//collect all indexed and all the values into 2 different Queues(indexQ,valueQ)
	foreach(bitvecAA[i]) begin 
		indexQ.push_back(i);
		valueQ.push_back(bitvecAA[i]);
	end
	$display("Index Queue:%p\nValue Queue:%p",indexQ,valueQ);
	
	//collect all indexed and all values into 2 dynamic arrays.
	size = bitvecAA.num();
	index_dyn_arr = new[size];
	value_dyn_array = new[size];
	count = 0;
	foreach(bitvecAA[i]) begin 
		index_dyn_arr[count] = i;
		value_dyn_array[count] = bitvecAA[i];
		count++;
	end
	$display("Index Dynamic Array:%p\nValue Dynamic Array:%p",index_dyn_arr,value_dyn_array);
	
	//Collect all indexes and all the values into 2 different fixed arrays.
	count = 0;
	foreach(bitvecAA[i]) begin 
		index_static_arr[count] = i;
		value_static_array[count] = bitvecAA[i];
		count++;
	end
	$display("Index fixed Array:%p\nValue fixed Array:%p",index_static_arr,value_static_array);
	
	//write a logic to print associative array elements in increasing index order- Ascending order
	//we can do this using built-in methods or for loop

	
end
endmodule 