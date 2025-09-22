class my_pkt;
int count;
endclass

class sample;
int a; //integer variable-->non-object variable
int b; //integer variable-->non-object variable
my_pkt pkt=new(); //object variable

function void print(string name=" ");
	$display("====Printing %s fields====",name);
	$display("a=%0d",a);
	$display("b=%0d",b);
	$display("pkt=%p",pkt);
endfunction

function void copy(output sample s);
	s = new this;
	//s = new();
	//s.a = a;
	//s.b = b;
	//s.pkt = new();
	//s.pkt.count = pkt.count;
	s.pkt = new this.pkt;
endfunction

endclass

module top;
	sample s1,s2;
	
	initial begin
		s1 = new();
		s2 = new();
		
		s2.a = 100;
		s2.b = 200;
		s2.pkt.count = 42;
		
		s1.print("s1");
		s2.print("s2");
		 
		s2.copy(s1); //copy the contents of s2 and put them into s1.
		
		s1.print("s1");
		s2.print("s2");
		
		s1.pkt.count = 500;
		s1.print("s1");
		s2.print("s2");
		
	end

endmodule