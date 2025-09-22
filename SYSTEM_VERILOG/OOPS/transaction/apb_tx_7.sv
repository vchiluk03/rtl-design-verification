class apb_tx;

rand bit wr_rd; 
rand bit [7:0] addr; 
rand bit [31:0] data; 
rand bit [3:0] sel;

task print(input string str_name);
begin 
	$display("***************PRINTING APB_TX FIELDS:%s*********************",str_name);
	$display("\twr_rd:%b",wr_rd);
	$display("\tAddress:%d",addr);
	$display("\tData:%h",data);
	$display("\tsel:%d",sel);
end
endtask

constraint sel_constraint{ 
	sel inside {4'b0001,4'b0010,4'b0100,4'b0000}; 
}
endclass

module top;
apb_tx tx = new();

initial begin 
	tx.print("Before Randomization");
	tx.data.rand_mode(0); //it disables Randomization of data
	assert(tx.randomize()); //randomize is a function, returns value
	tx.print("After Randomization");
end
endmodule