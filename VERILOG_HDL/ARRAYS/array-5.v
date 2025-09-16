//We can not use 'seed' with urandom_range. so we use new approach using $random for specific range, with a capability of using seed variable 

module tb;

parameter COUNT = 30;
//parameter LOWER_VALUE = 200;
//parameter UPPER_VALUE = 250;

integer intA[COUNT-1:0];
integer i,j,a;
reg exist_flag;
integer iterations_count;
integer seed;

initial begin 
seed = 45445;
	//for(i=0;i<10;) begin
	iterations_count = 0;
	i = 0;
	while(i<COUNT) begin
		iterations_count = iterations_count+1;
		
		//random number between 85 and 125 using $random
		a = 105 + $random(seed)%21; 
		
		//random number between 200 and 250 using $random
		a = 225 + $random%26;
		a = LOWER_VALUE+(UPPER_VALUE-LOWER_VALUE)/2+$random((UPPER_VALUE-LOWER_VALUE)/2+1) 
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