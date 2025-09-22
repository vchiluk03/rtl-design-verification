/*****************
- Inputs: Interface signals 
- Output: tx
- How long does monitor work?
		- forever (simulation time)
- It does exactly the opposite of BDM.
	- BFM: Takes tx, drives the interface signals.
	- Monitor: Takes interface signals, creates that as tx packet again.
*************************************/
class mem_mon;
virtual mem_intf.mon_cb vif; //created virtual interface handlle. Later point this handle to same physical interface that TB using.
mem_tx tx;

function new();
	vif = tb_top.pif; //vif = mem_common::vif;
endfunction

task run();
forever begin 
	//Algorithm: At every positive edge of clock, monitor interface signals, check for valid tx, collect the tx, gives the tx top upper layer of components.
	@(vif.mon_cb);
	if(vif.mon_cb.valid_i && vif.mon_cb.ready_o) begin 
		tx = new(); //Again creating 'tx' packet using interface signals.
		tx.addr = vif.mon_cb.addr_i;
		tx.data = vif.mon_cb.wr_rd_i ? vif.mon_cb.wr_data_i : vif.mon_cb.rd_data_o;
		tx.wr_rd = vif.mon_cb.wr_rd_i;
		//Give the tx to upper layer components: Reference model, Coverage
		mem_common::mon2ref.put(tx);
		mem_common::mon2cov.put(tx);
	end
end 
endtask
	
endclass