module tb;


function string myfunc(input string message);
begin 
	$display("printing string: %s",message);
	return message;
end
endfunction

string a; 

initial begin 
	repeat(10) begin 
		a = myfunc("hello chitti");
	end
end
endmodule 