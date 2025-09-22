//Dynamic Array Built-in functions
//- new[], delete(), size(), reverse()

module tb;
int intda[]; //default value os int is 0. Since it is a 2-state variable(0,1).
int intda_1[],intda_2[];

initial begin 
	intda = new[10];

//Assign 10 random values between 20 and 40 and print them
	foreach(intda[i]) begin 
		intda[i] = $urandom_range(20,40);	
	end
	$display("intda:%p",intda);
	
//print elements of individual index
	foreach(intda[i]) begin 
		$display("intda[%0d]:%0d",i,intda[i]);
	end

//Increase the size, while preserving the existing values
	intda = new[20](intda);
	$display("Array after sizing:intda:%p",intda); 

//Assign first 5 elements to new array (copying).
	intda_1 = new[5](intda);
	$display("intda:%p",intda);
	$display("intda_1:%p",intda_1);
	
//same as above copy last 5 elements
	intda_2 = new[5];
	for(int i=5;i<10;i++) begin 
		intda_2[i-5] = intda[i];
	end
	$display("intda_2:%p",intda_2);
	
//delete the array 2 and check the size of array 
	intda_2.delete();
	$display("intda_2:%p,size:%0d",intda_2,intda_2.size());
	
//check size of remaining arrays
	$display("size of intda:%0d\nsize of intda_1:%0d",intda.size(),intda_1.size());

//reverse the array elements
	intda_1.reverse();
	$display("intda_1:%p",intda_1);

end
 endmodule 