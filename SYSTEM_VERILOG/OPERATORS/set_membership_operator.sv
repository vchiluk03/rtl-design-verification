//SET-MEMBERSHIP OPERATOR.
//we can check whether a valaue is present in a 'set'.
//open range(set) list can be Queue, individual element, array, dynamic array
module tb;
int a;
int intA[9:0];

initial begin 
	a=10;
	//If i want to check whether value of 'a' present in the array(set) or not.
	//case-1 : using general for/foreach loop.
	for(i=0;i<10;i++) begin 
		if(a==intA[i]) $display("MATCHING");
	end

	//Instead of lengthy approach, we can use set-membership operator.
	//case-2
	if(a inside {intA}) begin //Always set shoulld be in flower braces{}.
		$display("MATCHING"); 
	end
end

endmodule 