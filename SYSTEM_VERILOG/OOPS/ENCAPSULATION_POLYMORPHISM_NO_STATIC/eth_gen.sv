class eth_gen;
	
eth_good_pkt g_pkt;
eth_bad_pkt  b_pkt;
eth_ill_pkt  i_pkt;

bit[1:0] pkt_type;
mailbox gen_mbox;

function new(mailbox mbox); //we will pass handle of mailbox from environment, while creating the object.
	gen_mbox = mbox; 
endfunction
  
task run(string test_case_name,integer no_of_packets);
case(test_case_name)
	"test_random_pkts" : begin 
		for(int i=0;i<no_of_packets;i++) begin 
			pkt_type = $urandom_range(0,2);
			case(pkt_type) 
			//0:good, 1:bad, 2:illegal
				0: begin 
					g_pkt = new();
					assert(g_pkt.randomize());
					gen_mbox.put(g_pkt);
				end
				1: begin 
					b_pkt = new();
					assert(b_pkt.randomize());
					gen_mbox.put(b_pkt);
				end
				2: begin 
					i_pkt = new();
					assert(i_pkt.randomize());
					gen_mbox.put(i_pkt);
				end
			endcase
		end
	end
	
	"test_only_good_pkts" : begin 
		for(int i=0;i<no_of_packets;i++) begin 
			g_pkt = new();
			assert(g_pkt.randomize());
			gen_mbox.put(g_pkt);
		end
	end		
	
	"test_only_bad_pkts" : begin 
		for(int i=0;i<no_of_packets;i++) begin 
			b_pkt = new();
			assert(b_pkt.randomize());
			gen_mbox.put(b_pkt);
		end
	end		
	
	"test_only_illegal_pkts" : begin 
		for(int i=0;i<no_of_packets;i++) begin 
			i_pkt = new();
			assert(i_pkt.randomize());
			gen_mbox.put(i_pkt);
		end
	end		
endcase
endtask

endclass