//QUEUE: A variable-size, ordered collection that supports FIFO/LIFO operations using built-in methods.
/**********************************************
Built-in Methods: size(), insert(), delete(), pop_front(), pop_back(), 
				  push_front(), push_back(), shuffle(), reverse()
**************************************************************/
module tb;
int intQ[$];

initial begin 
	intQ.push_back(24); //it will be placed at index 0.
	intQ[1] = 45; //upto here, the current size is 2 elements. we can use that as an index also.
	intQ[intQ.size()] = 85;
	$display("intQ=%p",intQ);
end

endmodule 