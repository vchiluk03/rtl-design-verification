//Reading the file contents using file handling concept : fgets(); 
//fd = $fopen("file name","r"); - 'r' says read mode.
/******************************************
1. open the file.
2. Get the line of string or whatever.
3. display the line in the transcript using $display(); system task.
*******************************************/
module tb;
integer i,fd;
reg [20*8-1:0] line;

initial begin 
	fd = $fopen("sample.txt","r"); //open the file "sample.txt" and give the handle ti variable fd.
						//Now, fd is holding address of file.
	//Displaying first line in the file  
	$fgets(line,fd); //get the 'line' from fd.
	$display("string in given line-->%s",line);
	
	//Loop continuing from the current line- Because we not yet close the file.
	for(i=0;i<3;i=i+1) begin
		$fgets(line,fd); //read the line(upto new line) into a register 'line' from adress fd.
		$display("string in given line-->%s",line);
	end
	
	//while loop goes until end of the file
	/*****
	while($fgets(line,fd)) begin
		$display("string in given line-->%s",line);
	end
	******/
	
	//while loop goes until end of the file
	while(!$feof(fd)) begin //feop(fp)=1, if it reaches end of the file
		$fgets(line,fd);
		$display("string in given line-->%s",line);
	end
	
end
endmodule 