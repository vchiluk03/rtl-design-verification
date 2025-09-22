class eth_bad_pkt extends eth_pkt;

//Fields 
static int count_bad;

//Methods
function new();
	count_bad++;
endfunction

//Reuse existing print function from base class and also add these fields to it.
function void print();
	$display("############ I am eth_bad_pkt ################");
	super.print(); //Calling base class print function using keyword 'super' to print base class fields/properties.
	$display("\tCount_bad=%0d",count_bad); //Adding current class fields 
endfunction

endclass