class eth_env;
	mailbox gen2bfm_mb = new(); //Give this handle to both generator and bfm 
	eth_gen gen = new(gen2bfm_mb);
	eth_bfm bfm = new(gen2bfm_mb);
	
task run(string test_case_name,integer no_of_packets);
fork 
	gen.run(test_case_name,no_of_packets); //passing the same handle of mailbox to both GEN&BFM
	bfm.run();
join
endtask

endclass