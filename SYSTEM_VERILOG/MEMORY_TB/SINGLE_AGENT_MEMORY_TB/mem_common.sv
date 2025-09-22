class mem_common; //keeping all the things common to whole TB.
	static virtual mem_intf vif; //This is common virtual interface. This vif and the one which got instantiated in top module as pif, both pointed to 
										//same memory location.
								//we can see that, this vif is pointed to pif in top module.
								//Since, its is class which is in dynamic in nature, we have to mention interface as 'virtual'.
		//shared by BFM, Monitor, DUT, Assertion block
	static mailbox gen2bfm = new(); //shared by generator and BFM/Driver
	static mailbox mon2rev = new(); //shared by monitor and reference model
	static mailbox mon2cov = new(); //shared by monitor and coverage
	static mailbox mon2ref = new(); //shared by monitor and reference
	static int count = 5;
	static int total_driven_txs;
	static string testcase;
endclass 