module tb;

parameter WIDTH_TB = `MACRO; //define'macro' with any name here, and when we compile, whatever value we define for that macro will be replaced here
//parameter WIDTH_TB = `WIDTH; //Here name of the Macro is 'WIDTH'.

reg [WIDTH_TB-1:0] a,b;
reg cin;
wire [WIDTH_TB-1:0] s;
wire cout;

//parameter over-riding by name 
param_full_adder #(.WIDTH(WIDTH_TB)) dut(a,b,cin,s,cout); //parameter over-riding : #(.DESIGN_PARAMETER_NAME(TB_PARAMETER_NAME))
//parameter overriding concept will help us to make things easier. HOW?? If we change the parameter value here, it will gets over-rided in design file also
		//irrespectiveof whatever value is there in the design.

initial begin 
	repeat(20) begin
		{a,b,cin} = $random;
		#1;
		$display("A=%0d\tB=%0d\tCarry-in=%0d\tsum=%0d\tcarry-out=%0d",a,b,cin,s,cout);
	end
end

endmodule