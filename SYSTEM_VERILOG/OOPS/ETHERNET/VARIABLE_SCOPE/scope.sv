int count = 40; //global scope (outside class and outside module)

class sample; 
rand integer count = 30; //inside sample scope(class)
endclass

module top;
int count = 20; //module scope
sample s = new();

initial begin: L1 
	count = 10;
	$display("count=%0d",count); //L1 - prints nearest variable
	$display("count=%0d",top.count); //prints based on hierarchy
	$display("count=%0d",$root.top.count); //same as about line
	$display("count=%0d",s.count); //class scope - based on hierarchy
	$display("count=%0d",$unit::count); //prints global scope variable
end

endmodule