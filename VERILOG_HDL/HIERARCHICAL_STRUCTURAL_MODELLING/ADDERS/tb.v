module tb;

reg [3:0] A,B;
reg Cin;
wire [3:0] S;
wire Co;

four_bit_full_adder inst(A,B,Cin,S,Co);

initial begin 
	repeat(20) begin 
		{A,B,Cin} = $random;
		#1;
		$display("A:%0d\tB:%0d\tcarry-in:%0d\t\tsum:%0d\tcarry-out:%0d",A,B,Cin,S,Co);
	end
end
endmodule