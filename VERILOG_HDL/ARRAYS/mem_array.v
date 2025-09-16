module mem;

reg [63:0] mem [7:0];
integer i;
initial begin
 
	for (i=0;i<8;i=i+1) begin 
		mem[i] = 64'b0;
	$display("MEMORY[%0d]: %0d ", i,mem[i]);
	end
end
endmodule 

