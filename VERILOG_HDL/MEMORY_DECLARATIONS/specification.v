*****************************************SPECIFICATION******************************************************

/********************************************************************************
ports of memory : clk,rst,addr,wr_rd,write_data,read_data
handshaking mechanism:
   -valid=1-->External component is telling I am doing a valid transaction.
   -ready=1-->Memory is indicating I am ready to complete this transaction.
*******************************************************************************/
clk - All write and reads happens at positive edge of clock - input.
rst - Reset the memory contents - input
addr - indx of memory we want to access - input.
write_data - data port for writing to the memory - input.
read_data - data port for reading from the memory - output.
wr_rd - 1 bit input signal indicates whether user/TB wants to write or read - input.
	wr_rd=1==>write to memory.
	wr_rd=0==>read from the memory.
valid: 
	1: TB doing a valid transaction(either write or read) to memory.
	0: TB not doing any transaction to memory.
ready: 
	1:memory is ready to respond to the transaction.
	0:memory is not ready to respond to the transaction.

-Transaction(memory write or read) will happen only when both valid and ready are true.

