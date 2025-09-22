//Intra delay assignment - Delay inside the statements 
module tb;

reg [5:0] a,b,c;
integer delay ;

always@(a) begin 
	$display("%0t : ENTRY",$time);
	b = #10 a;
	c = #8 b;
	$display("EXIT TIME: %0t",$time);
end
/*************************************************************************************
-In the above, always block will take 18ns to execute. So, while execution, 
 when again always triggers(value of a changes), it will ignore.
-ALWAYS block will enter at zero time.
- 'a' gets value at zero delay, but it 'a' will hold that value and assign it to 'b' after 10ns.
- Similarly, 'b' gets value after 10ns after entry, but it will hold and assign it to 'c' after 8ns.
*********************************************************************************************/
initial begin 
	repeat(30) begin 
		delay = $urandom_range(5,10);
		#delay;
		a = $random%100;
	end
	#100;
	$finish;
end
endmodule