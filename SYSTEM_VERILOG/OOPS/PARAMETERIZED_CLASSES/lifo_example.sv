/****************
- Define a class to get LIFO behaviour using a Queue.
- Define Queue inside the class LIFO (last in first out) - Last inserted will be out first.
- Define functions and taska inside class to put and get elements into or from LIFO.
********************************/
class lifo;
int intQ[$];

function void put(int a);
	intQ.push_back(a);
	$display("Inserting number into the LIFO : %d",a);
endfunction

function void get(output int a);
	a = intQ.pop_back();
endfunction

endclass

module top;
lifo lifo_inst = new();
integer num;

initial begin 
	repeat(5) begin 
		num = $urandom_range(100,500);
		lifo_inst.put(num);
	end
	
	repeat(5) begin 
		lifo_inst.get(num);
		$display("Number from the LIFO : %d",num);
	end
end
endmodule