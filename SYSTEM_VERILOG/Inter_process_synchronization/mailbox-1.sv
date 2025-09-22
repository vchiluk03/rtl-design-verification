module top;
mailbox #(int) mbox;
int a, y;
int b;

initial begin 
	mbox = new(10);
	repeat(10) begin
		a = $urandom_range(10,50);
		mbox.put(a);
	end 
	
	//mbox.put(94); //This will block the execution to go further. Because mailbox has blocking in nature with put and get methods.
	mbox.try_put(94); //This will not block. If there is no space in mailbox, it will continue execution from next line.
	
	for(int i=0;i<4; i++) begin 
		mbox.get(y);
		$display("Value from mailbox at index[%0d]:%0d",i,y);
	end 	
	
	//mbox.get(y); //This will block the execution to go further. Because mailbox has blocking in nature with put and get methods.
	mbox.try_get(y); //This will not block. If mailbox is empty, it will continue execution from next line.
	$display("retreving one element out of the mailbox using try_get method y=%0d",y);
	
	mbox.peek(b);
	$display("Copying the first element from the mailbox b = %0d",b);
	$display("size of the mailbox is %0d",mbox.num());
	
end

endmodule