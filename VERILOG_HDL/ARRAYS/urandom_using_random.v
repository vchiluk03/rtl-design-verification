//Genearting specific range of random numbers using only $random with using $urandom_range
//Declaring an array of 30 elementing and then randomizing the numbner using $random

module tb;

parameter LOWER_VALUE = 500;
parameter UPPER_VALUE = 1000;

integer array[30:1];
integer i,seed;

initial begin 
seed = 48375;

/***************Generating random numbers between 40 and 50 using urandom_range*******************/
//But disadvantage of using urandom_range is, we can not use seed to generate different random numbers, everytime we simulate
	for(i=1;i<31;i=i+1) begin 
		array[i] = $urandom_range(40,50);		
	end
	display();

/***************Generating random numbers between 40 and 50 using urandom_range*******************/
	for(i=1;i<31;i=i+1) begin 
		array[i] = 45 + $random(seed)%6;  		 
	end
	display();
	
/***************Generating random numbers between 200 and 300 using urandom_range*******************/
	for(i=1;i<31;i=i+1) begin 
		array[i] = 250 + $random(seed)%51;		
	end
	display();
	
/**************Generating random numbers between -75 and 55 using urandom_range*******************/
	for(i=1;i<31;i=i+1) begin 
		array[i] = -10 + $random(seed)%66;		
	end
	display();
	
/**************Generating random numbers between 85 and 125 using urandom_range*******************/
	for(i=1;i<31;i=i+1) begin 
		array[i] = 105 + $random(seed)%21;		
	end
	display();
	
//Generalized formula 
// array[i] = (LOWER_VALUE+UPPER_VALUE)/2 + $random(seed)%((UPPER_VALUE-LOWER_VALUE)/2 + 1)
/**************Generating random numbers between 85 and 125 using urandom_range*******************/
	for(i=1;i<31;i=i+1) begin 
		array[i] = (LOWER_VALUE+UPPER_VALUE)/2 + $random%((UPPER_VALUE-LOWER_VALUE)/2 + 1);
	end
	display();

end
//Task for displaying the contents
task display(); 
begin 
	for(i=1;i<31;i=i+1) begin 
		$display("The contents of array at index[%0d] : %0d",i,array[i]);
	end
	$display("--------------------------------------------------------------------------------------------------");
end
endtask

endmodule
