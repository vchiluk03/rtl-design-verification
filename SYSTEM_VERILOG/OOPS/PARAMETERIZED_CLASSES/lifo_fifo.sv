// Normally, we can parameterize only values in verilog modules. But in classes using OOPS, we can parameterize values and also type.
// Below is the example of how we can parameterize the value(0 and 1), which works a both LIFO and FIFO based on data structure type.
// We can parameterize the 'type' by using type keyword. 
`define FIFO 0
`define LIFO 1
class lifo_fifo #(bit ds_type = `LIFO); //default is LIFO
int intQ[$];

function void put(int a);
	intQ.push_back(a);
	$display("Inserting number into the FIFO : %d",a);
endfunction

function void get(output int a);
	if(ds_type == `FIFO) begin 
		a = intQ.pop_front();
		$display("---- This is FIFO behaviour ----");
	end
	if(ds_type == `LIFO) begin 
		a = intQ.pop_back();
		$display("---- This is LIFO behaviour ----");
	end
	$display("Number from the FIFO : %d",a);
endfunction

endclass

module top;
lifo_fifo #(.ds_type(`FIFO)) lifo_fifo_inst = new();
integer num;

initial begin 
	repeat(5) begin 
		num = $urandom_range(100,500);
		lifo_fifo_inst.put(num);
	end
	
	repeat(5) begin 
		lifo_fifo_inst.get(num);
	end
end
endmodule