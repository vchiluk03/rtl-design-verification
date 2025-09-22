class sample;
rand bit [2:0] a;  
randc bit [2:0] b; //it will repat random value only after after possible random values are completed.
endclass

module top;
sample s;

initial begin 
	s = new();
	repeat(20) begin
		s.randomize();
		$display("s=%p",s);
	end
end
endmodule