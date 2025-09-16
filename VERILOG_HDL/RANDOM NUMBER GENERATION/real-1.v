//Declare a real array of size 30 with starting index:1.
// Then, assign random values between 25 to 35 with 1 decimal precision.
//Print the array values 

module tb;

real real_arr[30:1];
integer i;

initial begin 
	for(i=1;i<31;i=i+1) begin 
		real_arr[i] = $urandom_range(2500,3500)/100.0; //10.0 makes it real division
		$display("real_array[%0d]:%0f",i,real_arr[i]);
	end
end
endmodule 

/****************************************************************************
Note: for generating the real number. 
The trick is : usually, when dividend and divisor both are integers, the result will also be integer.
But, when one of the either number is real number, it will generate result as real number.
So, we intentially, put one zero on dividend and one zero at divisor and decimal point
*******************************************************************************************************/
