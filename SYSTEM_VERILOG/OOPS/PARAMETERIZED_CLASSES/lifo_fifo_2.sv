// Changing the type to string.
`define FIFO 0
`define LIFO 1
typedef string dt_t;
class lifo_fifo #(bit ds_type = `LIFO, type data_type=int, int DEPTH=10); //default is LIFO
data_type dt_Q[$:DEPTH-1]; //Queue can hold the items of the data type specified.

function void put(data_type a);
	dt_Q.push_back(a);
	$display("Inserting number into the FIFO : %d",a);
endfunction

function void get(output data_type a);
	if(ds_type == `FIFO) begin 
		a = dt_Q.pop_front();
		$display("---- This is FIFO behaviour ----");
	end
	if(ds_type == `LIFO) begin 
		a = dt_Q.pop_back();
		$display("---- This is LIFO behaviour ----");
	end
	$display("Number from the FIFO : %d",a);
endfunction

endclass

module top;
lifo_fifo #(.ds_type(`LIFO),.data_type(dt_t),.DEPTH(10)) lifo_fifo_inst = new(); //over-riding the type to 'byte'.
dt_t num; //num can hold strings now

initial begin 
	repeat(15) begin 
		num = $sformatf("vishnu%0d",$urandom_range(100,500));
		lifo_fifo_inst.put(num);
	end
	
	repeat(15) begin 
		lifo_fifo_inst.get(num);
	end
end
endmodule