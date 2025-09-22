//For STATIC VARIABLES, memory will exist already by-default without new().
//Without creating the object, we can access static variables using scope resolution operator.
//Since, static variables are shared resource, anyone from anywhere can access then and update them, using scope resolution operator.
class sample; 
static int a = 20;
static int b;
int c = 100;
endclass

module top;
sample s;
initial begin 
	$display("sample-a=%0d",sample::a); 
		//:: is called as scope-resolution operator.
		//'a' is belonging to sample scope.
	//$display("c=%0d",sample::c); //we can not do this. Since, it is not a static variable, we need to create object first, to access that variable.
	
	s.b = 40; //we can do this without creating the object with new(). Because it is a static variable.
	$display("b=%0d",s.b); 

end
endmodule