module tb;
string str,name;
integer num;
byte name_out;

initial begin 
	str = "vishnu vardhan";
	//len method
	num = str.len;
	$display("Number of characters:%0d",num);
	//putc method
	str.putc(6,"c");
	$display("name after putc:%s",str);
	//getc method
	name_out = str.getc(5);
	$display("character out: %s",name_out);
	//insert a string usimg existing methods
	name = {str.substr(0,13), " chilukoti"};
	name.putc(6," ");
	$display("After inserting:%s",name);

end
endmodule