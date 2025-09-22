/********************************************
- When pkt.print(); is called, it will automatically calls the print method of base class. Since, the handle is base class type.
- But here, we are pointing this base class handle to one of its child class handle(good,bad,ill).
	- We are Retrieving packet from mailbox. Then if its good packet, then below will happens.
		- pkt = g_pkt; //pkt points to same memory location as g_pkt. Assigning child class handle to base class handle.
			- So, when we call pkt.print(); it should print the good packet print method.
				- This will be possible only if we declare the base class function as virtual.
				- For base class handle, We should give ability to chnage to any form based of object type. 
				- This concept is called "POLYMORPHISM".
				
- Since, we declare the print function of base class as virtual, base class handle is able to take any shape based on object type,
  it is pointing to, at the run time.
- If we don't delcare tasks/functions as virtual in base class, POLYMORPHISM doesn't take effect.
- if we mention task/function as 'virtual', we are telling the compiler that, the task/function defnition is not the final one.
- You should decide at run time, based oon object type you are pointing to.
***********************************************/
class eth_bfm;

eth_good_pkt g_pkt;
eth_bad_pkt  b_pkt;
eth_ill_pkt  i_pkt;
eth_pkt pkt;
mailbox bfm_mbox;

function new(mailbox mbox); //we will pass handle of mailbox from environment, while creating the object.
	bfm_mbox = mbox; 
endfunction

task run();
	forever begin 
		bfm_mbox.get(pkt); //Retrieves the packet from the mailbox and it will store it in 'pkt' variable.
		$display("~~~~-------------------------- Printing from BFM ~~~~----------------------------------------");
		if($cast(g_pkt,pkt)) $display("\t Retreived good packet from the mailbox ----");
		if($cast(b_pkt,pkt)) $display("\t Retreived bad packet from the mailbox ----");
		if($cast(i_pkt,pkt)) $display("\t Retreived illegal packet from the mailbox ----\n");
		
		pkt.print(); 
/****************************************************************************************		
-	This same print function has ability to change into many forms.
-   Based on packet, it is retrieved from mailbox, it will use that method.
- 	POLYMORPHISM: It allows the use of a variable of base class type to hold subclass objects and to reference the methods of those subclasses directly
				  from the base class variable.
*****************************************************************************************/
		
		
	end
endtask
endclass

