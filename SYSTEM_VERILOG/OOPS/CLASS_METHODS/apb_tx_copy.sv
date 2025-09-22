class apb_tx;

rand bit wr_rd; 
rand bit [7:0] addr; 
rand bit [31:0] data; 
rand bit [3:0] sel;

task print(input string str_name1="",str_name2="");
begin 
	$display("***************PRINTING %s FIELDS:%s*********************",str_name1,str_name2);
	$display("\twr_rd:%b",wr_rd);
	$display("\tAddress:%d",addr);
	$display("\tData:%h",data);
	$display("\tsel:%d",sel);
end
endtask

function bit compare(apb_tx tx,string str1,str2);
begin 
	$display("========================Comparing the properties of %s and %s=============================",str1,str2);
	if(wr_rd==tx.wr_rd && addr==tx.addr && data==tx.data && sel==tx.sel)
		$display("%s and %s fields are MATCHING",str1,str2);
	else 
		$display("%s and %s fields are MIS-MATCHING",str1,str2);
		$display("%s.wr_rd=%b and %s.wr_rd=%b",str1,wr_rd,str2,tx.wr_rd);
		$display("%s.addr=%d and %s.addr=%d",str1,addr,str2,tx.addr);
		$display("%s.data=%h and %s.data=%h",str1,data,str2,tx.data);
		$display("%s.sel=%d and %s.sel=%d",str1,sel,str2,tx.sel);
end
endfunction

//prototype ==> tx1.copy(tx2) 
task copy(apb_tx tx);
begin 
	//copying tx2 to tx1 ==> tx1 = tx2
	wr_rd = tx.wr_rd;
	addr  = tx.addr;
	data  = tx.data;
	sel   = 4'd10;
end
endtask



constraint sel_constraint{ 
	sel inside {4'b0001,4'b0010,4'b0100,4'b0000}; 
}

endclass




module top;
apb_tx tx1,tx2;


initial begin 
	tx1 = new();
	tx2 = new();
	//tx.print("Before Randomization");
	assert(tx1.randomize()); //randomize is a function, returns value
	assert(tx2.randomize());
	tx1.print("tx1","After Randomization");
	tx2.print("tx2","After Randomization");
	tx1.compare(tx2,"tx1","tx2"); //check the prototype
	tx1.copy(tx2);
	tx1.print("tx1");
	tx2.print("tx2");
end
endmodule
