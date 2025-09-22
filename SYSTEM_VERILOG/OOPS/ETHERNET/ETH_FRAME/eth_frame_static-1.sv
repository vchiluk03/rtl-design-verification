//we we want to keep any property as shared resource, we declare it as 'static'.
class eth_frame;

//properties

	static int count;
	bit [55:0] preamble; //public property
	bit [7:0] sfd;
	rand protected bit [47:0] source_addr; //we can access 'source_addr' only in this class and its child class.
	rand protected bit [47:0] dest_addr;
	rand bit [15:0] len;
	rand bit [7:0] payload[$];
	bit [31:0] crc; //random but will generate based on payload value.

	function new();
	begin 
		//count = count+1;
		count++; //every time the object is created, count value gets incremeneted in shared memory location.
		preamble = {28{2'b10}};
		sfd      = 8'b10101011;
	end
	endfunction
	
	function void display(string name=" ");
		$display("************PRINTING ETHERNET FRAME PROPERTIES:%s******************",name);
		$display("\tpreamble:%0b",preamble);
		$display("\tstart of frame:%0b",sfd);
		$display("\tSource address:%0h",source_addr);
		$display("\tDestination address:%0h",dest_addr);
		$display("\tlength:%0d",len);
		foreach(payload[i]) $display("\tpayload[%0d]:%0d",i,payload[i]);
		$display("\tcrc:%0h",crc);
		$display("============Number of objects/packets generated till now:Count-%0d==============",count);
	endfunction
	
	function void set_preamble(bit [55:0] preamble_t);
	begin
		$display("The value opf preamble updated to %h",preamble_t);
		preamble = preamble_t;
	end
	endfunction
	
	
	function void set_dest_addr(bit [47:0] dest_addr_t);
	begin
		$display("The value of destination address updated to %h",dest_addr_t);
		dest_addr = dest_addr_t;
	end
	endfunction
	
	function void get_dest_addr(output bit [47:0] returned_dest_addr);
	begin
		returned_dest_addr = dest_addr;
		$display("The destination address returned: %h",dest_addr);
	end
	endfunction
	//constraints
	constraint len_payload_C { //length should be between 42 to 1500 octets.
		len inside {[5:10]}; //for practice, I changed(for debugging purpose).
		payload.size() == len;
	}
	
endclass

module top;
eth_frame pkt;

initial begin
	repeat(20) begin 
		pkt = new();
		pkt.randomize();
		pkt.display();
	end
end
endmodule 