class eth_good_pkt extends eth_pkt;

//Fields 
static int count_good;

//Methods
function new();
	count_good++;
endfunction

//Reuse existing print function from base class and also add these fields to it.
function void print();
	$display("############ I am eth_good_pkt ################");
	super.print(); //Calling base class print function using keyword 'super' to print base class fields/properties.
	$display("\tCount_good=%0d",count_good); //Adding current class fields 
endfunction

endclass