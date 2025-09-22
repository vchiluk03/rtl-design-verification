//reverse the array elements without using built-in reverse method
module tb;
int intda[],intda_1[];

initial begin 
	intda = new[10]; //changing this value alone, will change everything
	foreach(intda[i]) begin 
		intda[i] = $urandom_range(20,40);
	end
	$display("intda:%p",intda);
	//reverse the array
	intda_1 = new[intda.size()];
	for(int i=0;i<intda_1.size();i++) begin 
		intda_1[i] = intda[intda.size()-1-i];
	end
	$display("New array after reversing-intda_1:%p",intda_1);
	
	//copy back reversed array to original array 
	intda = new[intda_1.size()](intda_1);
	$display("Old array after reversing-intda:%p",intda);
end
endmodule 
