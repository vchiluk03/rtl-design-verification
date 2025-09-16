//Data flow model  - 2bit  - using boolean expression
/****************************************************************************************************************************************
	Example for gt: case -1 :a=88, b=77 --> when a[1]>b[1] (or) {a[1]==b[1] and a[0]>b[0]}
			 case -2 :a=88, b=87 -->  a[1]>b[1] || {a[1]==b[1] && a[0]>b[0] }
			 
	Example for eq: when both bits are equal only, it is one.
				-----> when a[1]==b[1] && a[0]==b[0]
			 
	Example for lt: case -1 :a=77, b=88 --> when a[1]<b[1] (or) {a[1]==b[1] and a[0]<b[0]}
			 case -2 :a=87, b=88 -->  a[1]<b[1] || {a[1]==b[1] && a[0]<b[0] }
**************************************************************************************************************************************/

module comp_2bit (a,b,gt,eq,lt);
input [1:0] a,b;
output gt,eq,lt;

assign gt = (a[1]>b[1]) || ((a[1]==b[1]) && (a[0]>b[0]));
assign eq = (a[1]==b[1]) && (a[0]==b[0]);
assign lt = (a[1]<b[1]) || ((a[1]==b[1]) && (a[0]<b[0]));

endmodule