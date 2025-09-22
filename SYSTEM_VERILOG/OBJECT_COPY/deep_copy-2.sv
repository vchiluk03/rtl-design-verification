//Deep copy chip verify example
//A deep copy is where everything(including nested objects) are copied(internal properties).
class Header;
	int id;
	
	function new(int id);
		this.id = id;
	endfunction
	
	function void showId();
		$display("Id=%0d",id);
	endfunction
endclass

class packet;
	int addr;
	int data;
	Header hdr;  //instance of above class 'Header'
	
	function new(int addr,int data,int id);
		hdr = new(id);
		this.addr = addr;
		this.data = data;	
	endfunction
	
	function void copy(packet p); //here we are giving packet as an input, which one we want to copy.
		this.addr = p.addr;
		this.data = p.data;
		this.hdr.id = p.hdr.id;
	endfunction
	
	function void display(string name);
		$display("[%s] addr=%0h data=%0h id=%0d",name,addr,data,hdr.id);
	endfunction
endclass

module top;
	packet p1,p2;
	initial begin 
		//create new object pkt object called p1
		p1 = new(32'habcd_cafe, 32'h1234_5678,26);
		p1.display("p1");
		
		
		p2 = new(1,2,3);
		p2.display("p2"); //should print 1,2,3
		p2.copy(p1); //copy p1 into p2.
		p2.display("p2");
		
		//Let's change the contents in p1
		p1.addr = 32'habcd_ef12;
		p1.data = 32'h5a5a_5a5a;
		p1.hdr.id = 11;
		p1.display("p1");
		
		//Print p2 and see that hdr.id points to hdr in p1.
		p2.display("p2"); //we believe both packets point to same object handle
		
		//Here we change the contents of object using 'p2' handle
		p2.hdr.id = 54;
		p1.hdr.id = 24;
		p1.display("p1");
		p2.display("p2");
	end	
endmodule