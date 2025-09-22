//File Handling concept.
//Open a file name "sample.txt" and print int array contents into the file.
//Example: int_arr[index] = <value>;
//we use $fopen,$fclose,$fdisplay system tasks.
//When we run the code, Nothing will be displayed in transcript. It will be printed in given text file.
module tb;
integer int_arr[9:0];
integer i;
integer fd;

initial begin 
	fd = $fopen("sample.log"); //opening the file "sample.txt" and assign that handle to 'fd'
								//Handle - Memory Address
	for(i=0;i<10;i=i+1) begin 
		int_arr[i] = $urandom_range(10,40);
		$fdisplay(fd,"index[%0d]:%0d",i,int_arr[i]); //Display contents in 'fd' handle/memory address
	end
	
	$fclose(fd); //closing the file
end
endmodule 