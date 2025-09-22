class my_pkt;
rand int count;
endclass

class sample;
randc bit[3:0] a; //integer variable-->non-object variable
randc bit[3:0] b; //integer variable-->non-object variable
rand my_pkt pkt=new(); //object variable

function void print(string name=" ");
	$display("====Printing %s fields====",name);
	$display("\ta=%0d",a);
	$display("\tb=%0d",b);
	$display("\tpkt=%p",pkt);
endfunction

function sample copy();
	sample s = new();
	s.a = a;
	s.b = b;
	s.pkt = new();
	s.pkt.count = pkt.count;
	return s;
endfunction
endclass

module top;
	sample s1,s2;
	mailbox mbox = new();
	
	initial begin
		s1 = new();
		//putting pkts into the mailbox
		repeat(5) begin 
			s1.randomize();
			mbox.put(s1.copy()); //mailbox will load the copies of randomized sample packets.
		end
		
		//get pkts from the mailbox
		repeat(5) begin 
			mbox.get(s2);
			s2.print();
		end
	end

endmodule