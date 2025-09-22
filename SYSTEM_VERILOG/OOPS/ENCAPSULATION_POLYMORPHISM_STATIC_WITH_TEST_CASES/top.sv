typedef class eth_pkt; //forward declaration 
//When the compiler see a typedef class, it will know that a definition for the class will be found later in the same file.

`include "eth_pkt_common.sv"
`include "eth_good_pkt.sv"
`include "eth_bad_pkt.sv"
`include "eth_ill_pkt.sv"
`include "eth_gen.sv"
`include "eth_bfm.sv"
`include "eth_env.sv"
`include "eth_pkt.sv"

module top;

eth_env env = new();;
//env = new();
	
initial begin 
	assert($value$plusargs("test_case_name=%s",eth_pkt_common::test_case_name));
	env.run();
	#200 $finish;
end
endmodule