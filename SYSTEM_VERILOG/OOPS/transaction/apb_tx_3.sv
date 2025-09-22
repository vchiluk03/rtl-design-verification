//By-default $display will print all properties of class in decimal format.
//what of we want to print as per our convienece(binary,hex,ocatl,decimal).
//we don't need to write display statement for every property.
//Instead we write a function/task(method) for that.
class apb_tx;

rand bit wr_rd; 
rand bit [7:0] addr; 
rand bit [31:0] data; 
rand bit [3:0] sel;

function void print();
begin 
	$display("***************PRINTING APB_TX FIELDS:*********************");
	$display("\twr_rd:%b",wr_rd);
	$display("\tAddress:%d",addr);
	$display("\tData:%h",data);
	$display("\tsel:%d",sel);
end
endfunction

constraint sel_constraint{ 
	sel inside {4'b0001,4'b0010,4'b0100,4'b0000}; 
}
endclass

module top;
apb_tx tx = new();

initial begin 
	tx.print();
	tx.randomize();
	tx.print();
end
endmodule