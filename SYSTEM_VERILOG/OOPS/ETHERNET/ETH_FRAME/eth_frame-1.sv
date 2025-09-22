//I can merge multiple constraints as one. We can access public properties outside class.
class eth_frame;

//properties
	bit [55:0] preamble; //public property
	bit [7:0] sfd;
	rand bit [47:0] source_addr;
	rand bit [47:0] dest_addr;
	rand bit [15:0] len;
	rand bit [7:0] payload[$];
	bit [31:0] crc; //random but will generate based on payload value.

	function new();
	begin 
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
	endfunction
	//constraints
	
	constraint len_payload_C { //length should be between 42 to 1500 octets.
		len inside {[42:1500]};
		payload.size() == len;
	}
	
endclass

module top;
eth_frame pkt; //handle created 

initial begin 
	pkt = new(); //memory allocated 
	pkt.display("Before Randomization");
	pkt.randomize();
	pkt.display("After Randomization");
	pkt.preamble = 200; //this can be done, since it is declared as public property. Anybody outside scope can update.
end


endmodule 