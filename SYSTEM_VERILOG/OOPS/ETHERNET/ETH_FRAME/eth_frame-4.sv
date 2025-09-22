//Example for 'Protected' access specifier.
/**************
- As we discussed, we can access 'protected property' only in defined class and its child class.
***************************/
class eth_frame;

//properties
	bit [55:0] preamble; //public property
	bit [7:0] sfd;
	rand protected bit [47:0] source_addr; //we can access 'source_addr' only in this class and its child class.
	rand protected bit [47:0] dest_addr;
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

class extend_eth_frame extends eth_frame; //Inherited/Extended/child class of eth_frame(parent) class. 
bit [3:0] count; //public property

function new();
	source_addr = 1000;
endfunction


endclass

module top;
eth_frame pkt1;
extend_eth_frame pkt2; //handle created 
bit [47:0] returned_dest_addr;

initial begin
	pkt1 = new();
	pkt2 = new(); //memory allocated 
	//pkt2.dest_addr = 1000; //we can not do this. Since, it is protected, we can access it only in parent&child classes.
	//we can do above line, if there is a method created for updating and displaying that property(set and get methods).
		//same applies to local property also.
	pkt2.set_dest_addr(1000); //gets effected only in child object, not in parent object.
	pkt2.get_dest_addr(returned_dest_addr);
	$display("returned_dest_addr:%h",returned_dest_addr);
	pkt1.display("These are parent class properties");
	$display("Printing child class, TO VERIFY WHETHER PARENT CLASS GETS INITIALIZE OR NOT, since I am not using super.new()");
	pkt2.display("These are child properties");
end


endmodule 