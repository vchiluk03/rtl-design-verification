//Generate 30 unique numbers between 200 and 250 using an array 
//Print the number of 'for' loop iterations COUNT
module tb;

parameter COUNT = 30;
parameter LOWER_VALUE = 200;
parameter UPPER_VALUE = 250;

integer intA[COUNT-1:0];
integer i,j,a;
reg exist_flag;
integer iterations_count;

initial begin 
	//for(i=0;i<10;) begin
	iterations_count = 0;
	i = 0;
	while(i<COUNT) begin
		iterations_count = iterations_count+1;
		a = $urandom_range(LOWER_VALUE,UPPER_VALUE);
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
for(i=0;i<COUNT;i=i+1)  begin
	$display("The value of array at index[%0d]   :   %0d",i,intA[i]);
end

$display("Number of for loop interations:%0d",iterations_count);
end
endmodule 