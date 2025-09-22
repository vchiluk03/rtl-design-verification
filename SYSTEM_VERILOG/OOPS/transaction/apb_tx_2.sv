//signals will be randomized only those we declare with 'rand' keyword
//here 'data' will not be randomized 
class apb_tx;

rand bit wr_rd; 
rand bit [7:0] addr; 
bit [31:0] data; 
rand bit [3:0] sel;

constraint sel_constraint{ 
	sel inside {4'b0001,4'b0010,4'b0100,4'b0000}; 
}
endclass

module top;
apb_tx tx = new();

initial begin 
	$display("tx class before randomization:%p",tx); //default values will be present 
	tx.randomize();
	$display("tx class after randomization:%p",tx);
end


endmodule