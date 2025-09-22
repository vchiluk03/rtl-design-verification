//how to insert an element at specific location in dynamic array
module tb;
int intda[];
int intda_1[];

initial begin 
	intda = new[50]; //changing this value alone, will change everything
	foreach(intda[i]) begin 
		intda[i] = $urandom_range(20,40);
	end
	$display("intda:%p",intda);
	
	//Insert 75 at location 1 in the array.
	//we don't have built-in function. So create a logic
	intda_1 = new[intda.size()+1]; //we are adding one more of element to current size. so, size increments by 1.
	for(int i=0;i<intda_1.size();i++) begin  //'i' iterates from 0 to 10 (11 elements)
		if(i<1) intda_1[i] = intda[i];
		if(i==1) intda_1[i] = 75;
		if(i>1) intda_1[i] = intda[i-1];
	end
	$display("intda:%p\nintda_1:%p",intda,intda_1);
end
endmodule 