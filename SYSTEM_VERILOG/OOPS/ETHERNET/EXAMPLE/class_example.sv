/********
CLASS EXAMPLE:
--------------
- Below infomration is gathered after reading the specificayion.
	- class name : eth_pkt
	- Fields : preamble(56 bits), sa(48 bits), 
			len(8 bits), data(Queue of bytes of length 'len')-payload, count(int)
	- Methods : new,copy,compare,pack,unpack.
	- Constraints: 
		1. source address value between 100-150.
		2. dataQ elements should be: 1F or 5F.
		3. pkt_type: small(len:1 to 20), medium(21 to 100), large(101 to 500).
	  - This requires adding one more property: pkt_type.
*************/
typedef enum bit[1:0] {
	SMALL = 2'b00,
	MEDIUM = 2'b01,
	LARGE = 2'b10
} pkt_type_t; //declared new data type

class eth_pkt;
//bit ot logic? static or automatic? rand/randc? signed/unsigned? Access method?
//As a good programming practice, keep everything protected. So they can accesses by only parent and their child classes.
protected bit [55:0] preamble; 
protected rand bit [47:0] source_addr;
protected rand bit [7:0] len;
protected rand bit [7:0] payload[$];
protected static int count; 
protected rand pkt_type_t packet_type; //packet_type can be small,medium, large.

//Methods
function new();
	count++;
	preamble = {28{2'b10}}; //as per spec. 
endfunction

function void print(string name=" ");
	$display("****PRINTING ETH_PKT PROPERTIES:%s****",name);
	$display("Type of packet=%s",packet_type);
	$display("\tpreamble=%b",preamble);
	$display("\tSource address=%h",source_addr);
	$display("\tLength=%d",len);
	$display("\tPayload=%p",payload);
	$display("\tNumber of objects created till now: count-%0d\n\n",count);
endfunction

//packet_2 = copy(packet_1) - I want prototype like this. It should return packet
function void copy(eth_pkt pkt); //give the packet as an input, which one we want to copy
begin
	//we don't need new object creation. Since, we don't return the object
	// We are copying contents from input `pkt` to current object(this object).
	$display("----Copying contents from packet----\n");
	packet_type = pkt.packet_type;
	preamble = pkt.preamble; 
	source_addr = pkt.source_addr;
	len = pkt.len;
	payload = pkt.payload;
end
endfunction

function void compare(eth_pkt pkt);
begin 
	$display("******comparing the packets******");
	if(packet_type == pkt.packet_type &&
	   preamble == pkt.preamble &&
	   source_addr == pkt.source_addr &&
	   len == pkt.len &&
	   payload == pkt.payload) begin 
			$display("Both the packets are matching\n");
		end else begin
			$display("Packets are mis-matching\n");		
		end 
end
endfunction

function void pack(output byte byteQ[$]); //queue of bytes
begin 
	$display("==Packing the bytes of data into QUEUE==");
	byteQ = {>>byte{preamble,source_addr,len,payload}}; //preamble is first in queue
	for(int i=0;i<$size(byteQ);i=i+1) $display("byte_Queue[%0d]:%0b",i,byteQ[i]);
end
endfunction

function void unpack(input byte byteQ[$]);
begin 
	$display("==Started unpacking the data from QUEUE==");
	preamble = {byteQ[0],byteQ[1],byteQ[2],byteQ[3],byteQ[4],byteQ[5],byteQ[6]}; //56bits = 7 bytes
	source_addr = {byteQ[7],byteQ[8],byteQ[9],byteQ[10],byteQ[11],byteQ[12]};
	len = byteQ[13];
	for(int i=0;i<len;i++) begin
		payload.push_back(byteQ[14+i]);
	end	
	if(len inside {[1:20]})  packet_type = SMALL;
	if(len inside {[21:100]}) packet_type = MEDIUM;
	if(len inside {[101:255]}) packet_type = LARGE; 
end
endfunction

//Constraints
//source address value between 100-150.
constraint payload_C {
	payload.size() == len;	
	foreach(payload[i]) 
		payload[i] inside {8'h1F,8'h5F};
}

//dataQ elements should be: 1F or 5F.
constraint sof_C {
	source_addr inside {[100:150]};
}

//pkt_type: small(len:1 to 20), medium(21 to 100), large(101 to 255).
constraint pkt_type_C {
//implication constraint
	(packet_type == SMALL)  -> (len inside {[1:20]});
	(packet_type == MEDIUM) -> (len inside {[21:100]});
	(packet_type == LARGE)  -> (len inside {[101:255]});
}

endclass