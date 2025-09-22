//Generate an array of real numbers- 10 in total between 1.5 to 2.5 with 2 decimal precision-NO REPETITION
//TRICK: Always try ith nested for loop.
//using while loop 

module tb;

//Declare an array of 10 elements of type real
real arr[9:0];
integer i,j;
real random_num;
reg exist_flag;

initial begin
	i = 0;
	while(i<10)begin 
		exist_flag = 0;
		//arr[i] = $urandom_range(150,250)/100.0;
		random_num = (200 + $random%51)/100.0;
		j=0;
		while(j<i)begin 
			if(arr[j] == random_num) begin 
				exist_flag = 1;
				j=i;
			end
			j=j+1;
		end
		
		if(!exist_flag) begin 
			arr[i] = random_num;
			$display("index[%0d] : %0f",i,arr[i]);
			i = i+1;	
		end
		
	end
end

endmodule 