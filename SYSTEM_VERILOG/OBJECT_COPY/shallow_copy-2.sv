//chip verify example for shallow copy
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
		
		
		//Do shallow copy of p1 into p2; p2 is new object with contents in p1
		p2 = new p1; //creates p2 object in new memory location and copies contents of p1.
			//While copying, id there are any object properties, then it only copies its handle
		p2.display("p2");
		
		//Let's change the contents in p1
		p1.addr = 32'habcd_ef12;
		p1.data = 32'h5a5a_5a5a;
		p1.hdr.id = 17;
		p1.display("p1");
		
		//Print p2 and see that hdr.id points to hdr in p1.
		p2.display("p2"); //we believe both packets point to same object handle
		
		//Here we change the contents of object using 'p2' handle
		p2.hdr.id = 54;
		p1.display("p1");
		p2.display("p2");
	end	
endmodule

/*************
- The class Packet contains a nested class called Header. 
- First we created a packet called p1 and assigned it with some values. 
- Then p2 was created as a copy of p1 using the shallow copy method. 
- To prove that only handles and not the entire object is copied, 
	members of the p1 packet is modified including members within the nested class. 
- When the contents in p2 are printed, 
	we can see that the id member in the nested class remains the same.
***********************************/