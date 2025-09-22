/************************************************************************
-	SHALLOW COPY --> dest_handle = new source_handle
-	After copying, both will point to different memory locations.
-	Shallow copy creates a new memory allocation for dest. object and copies all the fields of source object to dest. object.
-	Problem: Shallow copy will only copies non-object fieds. it won't copy object fields.
		- For object properties, only handle gets copied(not their internal values).
**********************************************************************************************/
class sample;
int a;
int b;
endclass

module top;
sample s1,s2;

initial begin 
	s1 = new();
	s2 = new();
	s2.a = 100;
	$display("s1=%p",s1);
	s1 = new s2; //new memory location for s1 gets created and copies s2 to it.
	s2.a = 200;
	s2.b = 300;
	$display("s1=%p",s1);
	$display("s2=%p",s2);
end
endmodule