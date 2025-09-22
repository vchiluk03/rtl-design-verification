/********************************************************************************
create Queue of 30 integers, values between 100 to 129, with below conditions.
 - No repetition.
 - Random order varying with seed.
******************************************************************************************/
module tb;
int intQ[$:29]; //index fronm 0 to 29
int random_value;

initial begin 
	//we can't use foreach. Beacuase the size is zero.
	//Memory will get allocated we we add the data at indices.
	for(int i=0;i<30;i++) begin 
		intQ[i] = 100+i; //intQ.push_back(100+i) is also correct
	end
	intQ.shuffle();
	$display("intQ==>%p",intQ);
end
endmodule