/*****************
- Since BFM is a class object which is dynamic in nature. We can not use physicla interface.
	- we should use virtual interface.
		- This can be done by using keyword virtual while instantiating interface.
			- But we need to make sure that, this virtual interface handle should point to same memory location as physical interface.
			- Beacause, then only we can say that interface using by BFM, Monitor, DUT etc. are same. All of them using same interface, which is in one 
				memory location.
				- This can be done simply by pointing our virtual interface handle to physical interface-which got instantiated in tb_top.
			- Wherever we define interface as virtual, it does not allocate memory. 
				- So we have to point that virtual handle to physical interface handle, to make sure both are referring/working at same location.
		
		- With this, any change that we do using virtual interface handle is same as using physical interface handle.
			mem_bfm.vif.addr_i = 100 same as tb_top.pif.addr_i = 100.
		- This is how we are able to connect TB with the DUT.
**************************/

class mem_bfm;
mem_tx tx;
virtual mem_intf vif; //it won't create any memory. Since class is dynamic, we created interface also dynamic by using keyword 'virtual'.
	//The moto here is to create interface which wont't allocate memory. It will point to an existing physical interface.

function new();
	//vif = mem_common::vif; //this also works. Because both are physical interface handles.
	vif = tb_top.pif; //Since there is no memory location. We point it to physical interface by using 'copy by handle' method.
endfunction

task run;
forever begin 
	mem_common::gen2bfm.get(tx);
	drive_tx(tx);
	mem_common::total_driven_txs++;
end
endtask

task drive_tx(mem_tx tx);
	vif.addr_i = tx.addr;
	if(tx.wr_rd == 1) vif.wr_data_i = tx.data;
	vif.wr_rd_i = tx.wr_rd;
	vif.valid_i = 1;
	#1;
	@(posedge vif.clk_i)//driving inputs #1 before +ve edge of clock.
	#1;
	wait(vif.ready_o == 1); //sampling outputs #1 after +edge of clock.
	@(posedge vif.clk_i);
	vif.addr_i = 0;
	vif.wr_data_i = 0;
	vif.wr_rd_i = 0;
	vif.valid_i = 0;
endtask

endclass