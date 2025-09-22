`include "apb_tx.sv"
module top;

//instantiate transaction class
apb_tx tx; //dynamic data type. So, we have to do memory allocation

initial begin 
	tx = new(); //memory allocation
	tx.randomize(); //This is a built-in method provided by SV.
		//it will randomize all the signals declared usig 'rand' keyword inside transaction class.
	$display("tx=%p",tx); //it will by-default print in decimal format
end


endmodule 