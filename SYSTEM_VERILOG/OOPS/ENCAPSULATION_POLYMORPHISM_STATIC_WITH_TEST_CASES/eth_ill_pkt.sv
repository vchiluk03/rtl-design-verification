class eth_ill_pkt extends eth_pkt;

//Fields 
static int count_ill;

//Methods
function new();
	count_ill++;
endfunction

//Reuse existing print function from base class and also add these fields to it.
function void print();
	$display("############ I am eth_illegal_pkt ################");
	super.print(); //Calling base class print function using keyword 'super' to print base class fields/properties.
	$display("\tCount_ill=%0d",count_ill); //Adding current class fields 
endfunction

endclass