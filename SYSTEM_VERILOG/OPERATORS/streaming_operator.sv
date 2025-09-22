//streaming operator: output of streaming operator is always a Queue.
/**********
packet p=new;
void'(p.randomize());
dataQ = {<<byte{p.header,p.len,p.payload,p.crc}};
	- dataQ will be Queue of bytes.
	- Front of the Queue(0th position) - crc[7:0].
	- End of the Queue - eader[31:24].
	- Here, byte is a 8-bit width.
	- We can use other bit widths also(user-defined data types).
	
Streaming operators used on nibble.
- typedef bit[3:0] nibble_t;
- nibble_t nibble_q[$];
- nibble_q = {<<nibble_t{p.header,p.len,p.payload,p.crc}};