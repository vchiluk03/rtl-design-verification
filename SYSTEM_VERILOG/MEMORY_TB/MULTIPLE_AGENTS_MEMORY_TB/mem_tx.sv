//To do any memory tx, what re the essential fields?
	//addr,data,wr_rd
	//handshaking signals? Not required ==> Handshaking is functionality handled by BFM, not the generator.
	
	
class mem_tx;
	rand bit [`ADDR_WIDTH-1:0] addr;
	rand bit [`WIDTH-1:0] data;
	rand bit wr_rd;
	
	function void print(string name = "mem_tx");
		$display("Printing %s fields", name);
		$display("\taddr=%h", addr);
		$display("\tdata=%h", data);
		$display("\twr_rd=%h", wr_rd);
	endfunction

endclass