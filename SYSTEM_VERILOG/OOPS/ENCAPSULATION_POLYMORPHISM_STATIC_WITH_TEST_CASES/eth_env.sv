class eth_env;
	eth_gen gen = new();
	eth_bfm bfm = new();

task run;
fork 
	gen.run();
	bfm.run();
join
endtask

endclass