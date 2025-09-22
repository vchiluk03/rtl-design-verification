/********
USE CASE: When we want anything as a sahred resource, we declare that property as static'.
	- UVM is possible today, because of this 'static' declaration.
	- All the classes have access to this shared resource.
		- Change in one class, reflects in another classes also.
	- Practical use case is 'mailbox'.
		- mailbox can be used by both generator and driver.
		- So we declare mailbox as 'static'.
			-Both gen and BFM/driver can access this common static variable by using scope resolution operator(::).
**********/
class sample;
static int a; //same memory
rand int b; //Anything that is not declared as 'static', it is by default 'automatic'.
endclass

module top;
sample s = new();
sample s1 = new();
sample s2 = new();

initial begin 
	s.a = 100;
	s.b = 200;
	$display("s1.a=%0d,s1.b=%0d",s1.a,s1.b);
	s2.a = 500;
	s2.b = 600;
	$display("s.a=%0d,s.b=%0d",s.a,s.b);
end
endmodule 