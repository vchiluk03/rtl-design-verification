class sample;
	int count = 10;
endclass

module top;
//mailbox mbox = new(); //can hold infinte elements.
mailbox mbox = new(10); //can hold maximum of 10 elements.
sample s, s1;
int a;
string b;
real r;

initial begin
	s =new();
	mbox.put(10);
	mbox.put("VISHNU");
	mbox.put(20.7);
	mbox.put(s);
	
	mbox.get(a);
	mbox.get(b);
	mbox.get(r);
	mbox.get(s1);
	$display("a=%0d, b=%s, c=%f, s1=%p",a,b,r,s1);
end

endmodule