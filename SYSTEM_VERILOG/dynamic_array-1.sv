//passing dynamic array as an argument to function. Function should return sum of all elements in the array.
module tb;
int array[];
int result;

function int sum_arr(int intA[]);
begin 
int sum ;
	foreach(intA[i]) begin 
		sum = sum+intA[i];
	end
return sum;
end
endfunction

initial begin 
		array = new[10];
		foreach(array[i]) begin
			array[i] =$urandom_range(1,5);
			$display("At index[%0d]:%0d",i,array[i]);
		end
		result = sum_arr(array);
		$display("RESULT : %0d",result);
end
endmodule 