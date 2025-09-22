/******************USE CASE OF WILDCARD OPERATORS*******************************
1.- Lets say, we don't want to compare odd positions(1,3,5,7 and so on) of a vector. How do we do this?
	- We can do this using 'WILDCARD OPERATOR'.
		- P,Q are two vectors of size 10.
		- we want to ignore odd positions of Q for compare purpose.
		- Q_1 = Q^10'bx0_x0x0_x0x0;  //Bit-manipulation.
			- Here Q_1 will have odd positions as 'x', remaining will be same as Q values.
		- F= (P==?Q_1); //it will compare only the values by excluding the x and z present on RHS side(even positions).
				- If x and z present on LHS side, then output will be unknown.

2.- Lets say we want to ignore even positions comparsion.
	- Q_1= Q^10'b0x_0x0x_0x0x; //keeping even positions as x.
	
3.- Lets say we want to ignore lower 4-bits comparison.
	- Q_1 = Q^10'b00_0000_xxxx; 
******************************************************************************************/