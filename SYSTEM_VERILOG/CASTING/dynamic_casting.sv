class eth_pkt;
	rand int count;
endclass

class eth_good_pkt extends eth_pkt;
	rand int count_good;
endclass

module top;
eth_pkt pkt1,pkt2;
eth_good_pkt gpkt1,gpkt2;
reg f;

initial begin 
	pkt1 = new();
	pkt1.randomize();
	pkt2 = new();
	gpkt1 = new();
	gpkt2 = new();

	$cast(pkt1,pkt2); //casting pkt2 to pkt1 format
	
	pkt2.count = 100;
	//check if pkt1.count reflects this change
	$display("pkt1=%p",pkt1);
	
	$cast(pkt2,pkt1); //casting pkt1 to pkt2 format.
	$cast(gpkt1,pkt1); //BASE class can not be casted to DERIVED class.
			//NOT POSSIBLE
	$cast(pkt2,gpkt2);
			//POSSIBLE
		
	
	assert($cast(gpkt1,pkt1));
	f = $cast(gpkt1,pkt1);
	if($cast(gpkt1,pkt1)) begin 
		$display("cast is successful");
	end else begin 
		$display("cast failed");
	end
end
endmodule