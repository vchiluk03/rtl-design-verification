/************************************************
- Shallow copy will only copies non-object properties and not object properties.
**************************************************************/
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
endclass

module top;
sample s1,s2;

initial begin 
	s1 = new();
	s2 = new();
	s2.a = 100;
	s1.print("s1");
	//$display("s1=%p",s1);
	s1 = new s2; //new memory location for s1 gets created and copies s2 to it.
	s2.a = 200;
	s2.b = 300;
	s1.print("s1");
	s2.print("s2");
	//$display("s1=%p",s1);
	//$display("s2=%p",s2);
	s1.pkt.count = 200;
	s2.print("s2");
	  //Eventhough, we change 'count' value using s1, and print using s2, we can see the update.
	  //This is because, in shallow copy, it copies the hanlde of object and not the internals.
	s2.a = 46;
	s2.b = 56;
	s2.pkt.count = 378;
	s1.print("s1");
	s2.print("s2");

end
endmodule