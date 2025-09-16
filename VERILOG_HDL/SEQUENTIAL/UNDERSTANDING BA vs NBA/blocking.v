/*******************************************************************************************************************
-As per our understanding, all the procedural blocks executes in parallel. Here, the tool will see the first 
 initial block first and then second..third. So, at 5 time units, a becomes 20. 
-Then when next initial block executes, b=a i.e; b becomes 20. 
-It is because, b takes updated value of 'a' and the previous one.

--> This is calles Race condition in verilog. Although as per our assumption, all procedural blocks executes in parallel.
  The tool sees them one after other at 5 time units, which makes an impact on output.
  
---> So, we can say, when order of placing the statements that impacts final output,
	 it is called RACE-AROUND condition.
	 
---> If we want to solve this problem in this example, we want to make sure 'b' should take old version of 'a'.
    To make that happen, we use NBA.
	 --> Here, the RHS evaluated and tool will store it in temp variables and assigns to LHS at end of time step.
	 --> It will assigns value to LHS immediately like Blocking.
*********************************************************************************************************************/
module tb;
integer a,b;

initial begin 
	a = 10 ; b = 20;
	$display("%0t:a=%0d\t\tb=%0d",$time,a,b);
	#10 $display("%0t:a=%0d\t\tb=%0d",$time,a,b);
end

initial 
	#5 a = b;
	
initial 
	#5 b = a;	

endmodule