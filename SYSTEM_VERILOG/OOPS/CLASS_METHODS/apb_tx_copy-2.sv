class apb_tx;

//Properties
rand bit wr_rd; 
rand bit [7:0] addr; 
rand bit [31:0] data; 
rand bit [3:0] sel;

//Methods
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

function apb_tx copy(string str1=" ");
begin 
	apb_tx tx = new(); //Here we are creating new object. tx1.copy(copying contents of tx1).
	$display("*************************************COPYING CONTENTS OF %s**********************************",str1);
	tx.wr_rd = wr_rd;	//copying contents of another packets into new packet(object).
	tx.addr  = addr;		//return new packet.
	tx.data  = data;
	tx.sel   = sel;
	return tx;
end
endfunction

//constraints
constraint sel_constraint{ 
	sel inside {4'b0001,4'b0010,4'b0100,4'b0000}; 
}
endclass



module top;
initial begin 
	apb_tx tx1,tx2;
	tx1 = new();
	assert(tx1.randomize()); //randomize is a function, returns value
	tx1.print("tx1");
	if(tx2==null)
		$display("tx2 is currently pointing to NULL");
	else 
		tx2.print("tx2");
	
	tx2 = tx1; //Now 'tx2' is also pointing to same memory address as 'tx1'.
	tx2.print("tx2","After SHALLOW COPY");
	
	tx2.addr = 5'd54;
	$display("addr",tx1.addr);
	tx1.print("tx1");
	tx2.print("tx2");

end
endmodule
