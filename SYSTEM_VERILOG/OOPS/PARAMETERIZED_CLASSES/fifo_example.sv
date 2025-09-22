// FIFO behaviour - First inserted will be out first.
class fifo;
int intQ[$];

function void put(int a);
	intQ.push_back(a);
	$display("Inserting number into the FIFO : %d",a);
endfunction

function void get(output int a);
	a = intQ.pop_front();
	$display("Number from the FIFO : %d",a);
endfunction

endclass

module top;
fifo fifo_inst = new();
integer num;

initial begin 
	repeat(5) begin 
		num = $urandom_range(100,500);
		fifo_inst.put(num);
	end
	
	repeat(5) begin 
		fifo_inst.get(num);
	end
end
endmodule