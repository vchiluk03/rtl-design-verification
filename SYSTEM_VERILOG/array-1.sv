//Declare an array of string data type, array size of 10. 
//Assign elemenets with  names from str1 to str10.
//Write logic to compare both the arrays
//-------------------------------INCOMPLETE---------------------------------------
module tb;

string str_arr[10];
integer i;

initial begin 
	foreach(str_arr[i])
	begin 
		str_arr[i] = $sformatf("str%0d",i);
		//string format function
	end

	foreach(str_arr[i]) $display("At index[%0d]:%s",i,str_arr[i]);
end

endmodule