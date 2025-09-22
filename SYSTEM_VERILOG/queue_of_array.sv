//Declare Queue of ARRAYs with both variable sizes defined using macro.
`define ARRAY_SIZE 10
`define QUEUE_SIZE 7

typedef int arr[`ARRAY_SIZE-1:0]; //arr is data type here

class sample;
	rand arr q[$:`QUEUE_SIZE-1];
	static int i,j;
	
	constraint q_c {
		q.size() == `QUEUE_SIZE;
	}
	
	constraint random_value {
		foreach(q[i,j]) //q[i] refers to one array in the queue. q[i][j] refers to one element in the array.
			q[i][j] inside {[5:74]}; 
	}
	
	constraint no_repeat {
		unique {q};
	}
	
	function void print();
		$display("Queue of Arrays:\n%p",q);
	endfunction
endclass


module top;
	sample s;
	
	initial begin 
		s = new();
		//s.no_repeat.constraint_mode(0);
		assert(s.randomize());
		s.print();
	end

endmodule