//Generate a random real number between 1 and 2 with 2 decimal precisions
//Example: 1.57,1.38.. etc;
//By defualt, $random, $urandom_range generates integer values.
module tb;

real r;

initial begin 
	r = $urandom_range(100,200)/100.0;
	$display("Random value:%f", r);
end
endmodule 