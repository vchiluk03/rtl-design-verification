typedef union {
	bit [55:0] preamble;
	bit [7:0] sof;
	bit [47:0] da;
	int count;
} pkt_t; 
//In above, everything will be in same memory location.

module top;
pkt_t pkt;

initial begin 
	pkt.preamble = 56'h1234_5678_ABCD_EF;
	$display("pkt.sof=%h",pkt.sof);
	$display("pkt.da=%h",pkt.da);
	$display("pkt.count=%h",pkt.count);
	pkt.sof = 8'hCD;
	$display("pkt.preamble=%h",pkt.preamble);
end 
endmodule