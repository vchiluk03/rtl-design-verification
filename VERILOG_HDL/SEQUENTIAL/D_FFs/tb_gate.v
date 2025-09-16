module tb;

reg clk,D;
wire Q,Q_bar;
integer delay;

dff_gate inst(clk,D,Q,Q_bar);
always #5 clk=~clk;

initial begin
clk = 0;
repeat(10) begin  
	 D = $random;
	 delay = $urandom_range(5,25);
	 #delay;
end
#200 $finish;
end

endmodule 