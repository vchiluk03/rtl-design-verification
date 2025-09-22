`include "class_example.sv"
module top;
	eth_pkt ep1,ep2,ep3;
	byte my_queue[$];
	bit comp_result;
	
	initial begin 
		ep1 = new();
		ep2 = new();
		ep1.print("----Created Object handle 'ep1':Before Randomization----");
		assert(ep1.randomize());
		ep1.print("----After randomization of 'ep1'----");
		ep2.print("----Created Object handle 'ep2':Before Randomization----");
		ep1.compare(ep2);
		ep2.copy(ep1); //copy contents of ep1 and put into ep2--ep2 takes values form ep1.
		ep2.print("----Printing 'ep2' after copying the contents of 'ep1'----");
		//To check whether both packets are equal or not after copying.
		ep1.compare(ep2); //it returns value.
		
		ep1.pack(my_queue);
		ep3 = new();
		ep3.unpack(my_queue);
		
		//compare after unpacking
		ep1.compare(ep3);
		ep1.print("ep1");
		ep3.print("ep3");
		end

endmodule