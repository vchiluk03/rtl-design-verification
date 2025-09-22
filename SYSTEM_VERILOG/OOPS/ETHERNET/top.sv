/*****
Example for array of packets.
- Also shown, we can enable/disable the constraints/rand by setting them 0 or 1.
*****************/

`include "class_example.sv"
module top;
	eth_pkt pkt[10]; //array of packets
	eth_pkt pkt1;
	
initial begin 
	foreach(pkt[i]) begin 
		pkt[i] = new();
		assert(pkt[i].randomize);
		pkt[i].print();
	end
	pkt1 = new;
	//object_name.constraint_name.constraint_mode
	pkt1.sof_C.constraint_mode(0);
	assert(pkt1.randomize());
	pkt1.print("This is individual packet");
end
	
endmodule