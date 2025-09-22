//how to delete an element at specific location.
module tb;
int intda[],intda_1[];

initial begin 
	intda = new[10]; //changing this value alone, will change everything
	foreach(intda[i]) begin 
		intda[i] = $urandom_range(20,40);
	end
	$display("intda:%p",intda);

//Delete element 6 at location 5
	//intda[4].delete(); //won't work
	intda_1 = new[intda.size()-1];
	for(int i=0;i<intda_1.size();i++) begin 
		if(i<5) intda_1[i] = intda[i];
		if(i>4) intda_1[i] = intda[i+1];
	end
	$display("intda_1:%p",intda_1);
end
endmodule 
