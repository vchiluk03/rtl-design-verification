`include "apb_tx.sv"
module top;

//instantiate transaction class
apb_tx tx; //dynamic data type. So, we have to do memory allocation

initial begin 
	tx = new(); //memory allocation
	//memory size of tx object= size(addr)+size(data)+size(wr_rd)+size(sel)
							  =  8 + 32 + 1 + 4 = 45 bits.
	//when memory not allocated - values will be data type default values.
	tx.randomize(); //This is a built-in method provided by SV.
		//it will randomize all the signals declared usig 'rand' keyword inside transaction class.
	//Any signal that is declared as rand? Assign random values to it.
	$display("tx=%p",tx); //it will by-default print in decimal format
end


endmodule 