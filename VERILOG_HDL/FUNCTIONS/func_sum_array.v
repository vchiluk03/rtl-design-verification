//Use the above sum function, write code to add two integer arays of 5 elements, and place the result in third array - INVOCATION
module tb;

integer intA[4:0];
integer intB[4:0];
integer intC[4:0];
integer i;

initial begin
	for(i=0;i<5;i=i+1) begin 
		intA[i] = $urandom_range(1,20);
		intB[i] = $urandom_range(21,40);
	end
	
	$display("--------------------BEFORE FUNCTION INVOCATION------------------------------- ");
	display();
	
	$display("*************************************************************************");

	for(i=0;i<5;i=i+1) begin 
		intC[i] = sum(intA[i],intB[i]);
	end

	$display("--------------------AFTER FUNCTION INVOCATION------------------------------- ");
	display();
	
	$display("*************************************************************************");
	for(i=0;i<5;i=i+1) begin 
		$write("%0d,",intC[i]);
	end
	
	
end

//sum function
function integer sum(input integer a,b);
begin 
	sum = a+b;
end
endfunction

task display(); 
	for(i=0;i<5;i=i+1) begin
		$display("Contents of ARRAY_A at index[%0d]:%0d\t*************\tContents of ARRAY_B at index[%0d]:%0d\t*************\tContents of ARRAY_C at index[%0d]:%0d",i,intA[i],i,intB[i],i,intC[i]);
	end
endtask 

endmodule 