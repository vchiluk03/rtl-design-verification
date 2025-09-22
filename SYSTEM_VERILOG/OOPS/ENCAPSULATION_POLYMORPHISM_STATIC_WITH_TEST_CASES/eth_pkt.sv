class eth_pkt;

//Fields
static int count;
rand bit [9:0] len;
rand byte payload[$];

//Methods
function new();
	count++;
endfunction

virtual function void print();
begin 
	$display("\t\t**** Printing eth_pkt(base_class) properties ****");
	$display("\tCount=%0d",count);
	$display("\tLength=%0d",len);
	$display("\tPayload=%p",payload);
end
endfunction

//Constraints
constraint length_C {
	len inside {[15:25]};
}

constraint payload_C {
	payload.size == len; 
}

endclass