/*************************************************************************************
Generate an array of size 10, with random numbers between 40 and 50.
When array is generated check, if the value already exists in the array.
---> if it doesn't exist, then only fill the array
---> if exists, Generatea a new random number without assigning to array.
       - increment the index only when we put value into the array 
***********************************************************************************/
module tb;

integer intA[9:0];
integer i,j,a;
reg exist_flag;
integer iterations_count;

initial begin 
	//for(i=0;i<10;) begin
	iterations_count = 0;
	i = 0;
	while(i<10) begin
		iterations_count = iterations_count+1;
		a = $urandom_range(40,50);
		//a = $random;
		exist_flag = 0;
		
		for(j=0;j<i;j=j+1) begin 
			if(a == intA[j]) begin
				exist_flag = 1;
				j = i; //it will exit the loop - In SV, we can use 'break' here to break the loop
			end 
		end
		
		if(exist_flag==0) begin 
			intA[i]= a;
			i=i+1;
		end
	end

//displaying the contents of array
for(i=0;i<10;i=i+1)  begin
	$display("The value of array at index[%0d]   :   %0d",i,intA[i]);
end

$display("Number of for loop interations:%0d",iterations_count);
end
endmodule 