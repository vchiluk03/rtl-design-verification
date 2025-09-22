//Inter delay assignment - Delay between the statements 
module tb;

reg [5:0] a,b,c;
integer delay ;

always@(a) begin 
	$display("%0t : ENTRY",$time);
	#10 b = a;
	#5  c = b;
	$display("EXIT TIME: %0t",$time);
end
/***************************************************************************************
-In the above, always block will take 15ns to execute. So, while execution, 
 when again always triggers(value of a changes), it will ignore.
-it will enter at zero time, after 10ns, 'b' gets value of 'a'- it gets current value of a after 10ns.
-Similarly, after 5ns, 'c' gets value of 'b' whatever it holds at that current time
**********************************************************************************************/
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