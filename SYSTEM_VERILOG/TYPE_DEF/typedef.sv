/*********************
Using typedef to create complex data types.
- Array of QUEUE OF eth_pkt's (array of size 10)
1. Declare a data type which represents 'queue of eth_pkt's?
****************/

class eth_pkt;
rand bit [3:0] sof;
rand bit [5:0] len;
endclass

//eth_pkt pkt[$]; //pkt_Q is data variable representing queue of eth_pkt's
typedef eth_pkt pktQ_t[$]; //pktQ_t is user defined data type  representing queue of eth_pkt's

//Array of queue of eth_pkt's, with array size of 5.
module top;
pktQ_t pktQ_A[5]; //pktQ_t is data type and pktQ_A is array of size 5.
//eth_pkt pkt;

initial begin 
//lets randomize all these packets, fill queue with 3 packets each 
/**
foreach(pktQ_A[i]) begin 
	repeat(3) begin 
		pkt = new();
		pkt.randomize();
		pktQ_A[i].push_back(pkt);
	end
end
******************/
foreach(pktQ_A[i]) begin 
	for(int j=0;j<3;j++) begin 
		pktQ_A[i][j] = new();
		assert(pktQ_A[i][j].randomize());
	end
end

//Printing the Array of QUEUE of packets.
foreach(pktQ_A[i]) begin 
	foreach(pktQ_A[i][j]) $display("pktQ_A[%0d][%0d] = %p",i,j,pktQ_A[i][j]);
end 

end
endmodule 