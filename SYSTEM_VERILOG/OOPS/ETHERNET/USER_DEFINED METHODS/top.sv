`include "class_example_extern.sv"
module top;
eth_pkt pkt;

string test_name;

initial begin 
	assert($value$plusargs("test_name=%s",eth_pkt::test_name));
	pkt = new();
	
	if(eth_pkt::test_name == "test_fixed_len") begin 
		assert(pkt.randomize() with {len == 20;}); //in-line constraint
	end 
	else if(eth_pkt::test_name == "test_fixed_source_addr_50_dest_addr_200") begin 
		assert(pkt.randomize() with {source_addr == 50;dest_addr==200;});
	end
	else if (eth_pkt::test_name == "test_fixed_source_addr_inline_constraint") begin //this will get prioritized over in-class constraints.
		//pkt.source_addr.rand_mode(0);
		//pkt.sof_C.constraint_mode(0);
		assert(pkt.randomize() with {source_addr == 48'h143;});
	end
	else begin
	//pkt.pre_randomize(); //automatically gets called
		assert(pkt.randomize());
	//pkt.post_randomize(); //automatically gets called
	end
	pkt.print();
	
end

endmodule