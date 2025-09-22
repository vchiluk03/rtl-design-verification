module tb;

string name,new_name;
byte get_char;

initial begin 
	name = "vishnu";
	new_name = name; //initialization just for the sake
	$display("printing index:%s \t%s", name.getc(0),name.getc(5));
	for(int i=0;i<name.len;i++) begin 
		get_char=name.getc(i);
		new_name.putc(name.len-1-i,get_char);
		$display("REVERSE NAME:%s",new_name);
	end
	
end
endmodule
  