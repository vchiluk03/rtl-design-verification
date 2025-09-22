class apb_tx_1;

rand bit wr_rd; 
rand bit [7:0] addr; 
rand bit [31:0] data; 
rand bit [3:0] sel;

constraint sel_constraint{ 
	sel inside {4'b0001,4'b0010,4'b0100,4'b0000}; 
}
endclass

module top;
apb_tx_1 tx_1 = new();

initial begin 
	$display("tx class before randomization:%p",tx_1); //default values will be present 
	tx_1.randomize();
	$display("tx class after randomization:%p",tx_1);
end


endmodule