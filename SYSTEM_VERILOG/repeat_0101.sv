class sample;
randc bit a;
endclass

module top;
sample s = new();

initial begin 
	s.randomize();
	$display("s=%p",s);
end

endmodule