int count;

function void print();
	$display("global function print");
endfunction

task run();
	$display("global task print");
endtask

class sample;
	int count;
endclass

class eth_pkt;
	sample s_inst = new();
endclass

module top;
	eth_pkt pkt = new();
	
	function void print();
		$display("TOP:function print");
	endfunction
	
	initial begin 
		pkt.s_inst.count = 10;
		print(); //this calls the nearest print method as per hierarchy.
		$unit::print(); //it will call global print method
		run();
	end

endmodule 