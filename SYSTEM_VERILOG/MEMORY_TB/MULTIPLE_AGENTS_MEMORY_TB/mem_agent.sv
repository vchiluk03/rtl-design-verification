class mem_agent;
	mem_gen gen = new();
	mem_bfm bfm = new();
	mem_mon mon = new();
	mem_cov cov = new();
	
	task run();
	fork 
		gen.run();
		bfm.run();
		mon.run();
		cov.run();
	join
	endtask

endclass