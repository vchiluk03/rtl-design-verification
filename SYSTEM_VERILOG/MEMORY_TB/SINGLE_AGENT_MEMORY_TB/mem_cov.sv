class mem_cov;
	event mem_cg_e;
	mem_tx tx;
	
	covergroup mem_cg@(mem_cg_e);
		ADDR_CP: coverpoint tx.addr {
			//bins
			option.auto_bin_max = 5; //If addr is 6 bits ==> 64 locations ==> 64/5 number of bins will gets created.
			/***********The above line same as below ****************
				bins bin_1 = {[0:12]};
				bins bin_2 = {[13:26]};
				bins bin_3 = {[27:40]};
				bins bin_4 = {[41:54]};
				bins bin_5 = {[55:63]};
			***************************************************************/
		}
		WR_RD_CP: coverpoint tx.wr_rd; //no bins- it will automatically create 2 bins - upto 64bit, it can create individual bins.
				//DATA_CP: coverpoint tx.data; //data is a random number, which has no significance on DUT testing.
		ADDR_CP_X_WR_RD_CP: cross ADDR_CP,WR_RD_CP {
			option.weight = 3; //we gave weight=3 for this coverpoint
		}
	endgroup
	
	function new();
		mem_cg = new(); //since, covergroup is a dynamic construct, we have to allocate memory using new().
	endfunction
	
	task run();
		forever begin  //while(1)
			mem_common::mon2cov.get(tx);
			->mem_cg_e; //triggering the event - mem_cg.sample();
		end
	
	endtask
endclass