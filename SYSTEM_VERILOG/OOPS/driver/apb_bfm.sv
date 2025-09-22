class apb_bfm;
apb_tx tx;
mailbox mbox;

task run();
begin 
	repeat(10) begin 
		tx = new();
		mbox.get(tx);
	end
end
endtask

endclass