module top;
event e,e1,e2;

//Here although all processes happens in parallel, they print one after another.
initial begin 
	$display("PROCESS #1");
end

initial begin 
	$display("PROCESS #2");
end

initial begin 
	$display("PROCESS #3");
end

initial begin 
	$display("PROCESS #4");
end

endmodule