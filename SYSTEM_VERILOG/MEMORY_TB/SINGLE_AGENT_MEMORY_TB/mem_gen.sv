class mem_gen;
	mem_tx tx;
	bit [`ADDR_WIDTH-1:0] addr_used_for_write;
	bit [`ADDR_WIDTH-1:0] addr_used_for_write_Q[$];
	
	task run();
	case(mem_common::testcase) 
	"test_wr_rd_one_location" : begin 
		//write a location
		tx = new();
		tx.randomize() with {wr_rd==1;};
		mem_common::gen2bfm.put(tx);
		addr_used_for_write = tx.addr;
		$display("addr_used_for_write=%0d",addr_used_for_write);
		//read a location 
		tx = new();
		tx.randomize() with {wr_rd==0;tx.addr==addr_used_for_write;};
		//we can just use tx.wr_rd = 0 for reading instead of above line.
		$display("addr_used_for_read=%0d",tx.addr);
		mem_common::gen2bfm.put(tx);
	end
	"test_n_wr_n_rd": begin 
	  repeat(mem_common::count) begin //writing count number of times.
		tx = new();
		tx.randomize() with {wr_rd==1;};
		mem_common::gen2bfm.put(tx);
		addr_used_for_write_Q.push_back(tx.addr);
	  end 
	  repeat(mem_common::count) begin 
		//reading 'count' number of times
		tx = new();
		tx.randomize() with {wr_rd==0;tx.addr==addr_used_for_write_Q.pop_front();};	
		mem_common::gen2bfm.put(tx);
	  end
	end
	endcase
	endtask
endclass