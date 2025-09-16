module half_adder_tb;

reg a,b;
wire s,c;

//connection by position
half_adder dut_inst(a,b,s,c);

//connection by name
//half_adder dut_inst(.p(a),.q(b),.sum(s),.carry(c));

integer seed;

initial begin 
	
	//$display("---------------THIS IS BEHAVIOURAL MODELLING----------------");
	$display("---------------THIS IS DATAFLOW MODELLING-------------------");
	//$display("----------------THIS IS GATE-LEVEL/STRUCTURAL MODELLING----------------------");
seed = 47478;
repeat(20) begin
	a= $random(seed); //$random is of datatype 'int' and it is a 32-bit integer value
	b= $random(seed);
	
	#1;  /*we give delay because, initial begin will occur only once. Here we are driving the inputs and at the same tim we are trying to display them, 
			which causes arce-around condition*/
	
	$display("time=%0t    	:    a=%b ,  b=%b,  sum=%b,  carry=%b", $time,a,b,s,c);
end
end
endmodule 