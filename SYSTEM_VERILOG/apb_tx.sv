/*********************************
- SV based testbenches will have two types of transactions.
	1. Signal/port level: In verilog, everything is at signal/port level communication.
			//we drive the ports and read the ports etc.
	2. Object level: This is high level communication. We get whole information in one variable format.
	
- Here we are defining transaction(sending and receving/exchange of information) class/packet.
- The whole idea of transaction class is to give information to BFM/Driver.
		- How that information look like?The Blueprint of 'tx' class is defined here.
- Later, we can use this blueprint and generated different kinds of objects/packets.
****************************************************************************************************************/
//Here we will generalize this tx class
//class: properties+methods+constraints

class apb_tx;

/*******************************PROPERTIES OF CLASS*******************************/
	//write or read operation type
	rand bit wr_rd; //reg and wire are used for hardware elements.
	//Address to slave from master
	
	rand bit [7:0] addr; //Assume address is 8-bit vector. 'paddr' is not required, since we are making this class 
					//protocol independent
	//write/read data
	rand bit [31:0] data; //wr_rd=1 ==> data will behave as write data, otherwise read data
	
	//selection of slave
	rand bit [3:0] sel;

	//enable(valid),ready signals not required in transaction class.
	//Generally, Handshaking happens between BFM and DUT. So, At BFM only, it is requied.

/*****************************************METHODS***********************************************************/



/************************************CONSTRAINTS******************************************************/
//limitation/restriction we give to a signal while randomizing: RULES
constraint sel_constraint{ //possible values of selection: 0 to 15 
	sel inside {4'b0001,4'b0010,4'b0100,4'b0000}; //we are giving limitation to selection that, while randomizing,
												//it should be insdie these 4 values only.
}


endclass