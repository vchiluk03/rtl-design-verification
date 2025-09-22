class apb_gen;
apb_tx tx;
mailbox mbox;

task run();
begin 
	repeat(10) begin 
		tx = new();
		assert(tx.randomize());
		mbox.put(tx);
	end
end
endtask

endclass