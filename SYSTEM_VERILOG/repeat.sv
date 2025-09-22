class sample;
static bit a;

function void post_randomize();
	a++;
endfunction
endclass

module top;
sample s = new();

initial begin 
	repeat(20) begin 
		s.randomize();
		$display("s=%p",s);
	end
end

endmodule