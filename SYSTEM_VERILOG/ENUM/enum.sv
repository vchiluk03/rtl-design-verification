//using ENUM in APB Protocol.
/*****
- Assume APB architecture has 4 slaves. During any transaction, we can target 
  either of these 4 slaves.
- APB allows for targeting only one slave at any time.
********************************************/
typedef enum [3:0] {
	slave_0_sel = 4'b0001;
	slave_1_sel = 4'b0010;
	slave_2_sel = 4'b0100;
	slave_3_sel = 4'b1000;
} set_t;

//we will use like this.
	//intf.psel = 4'b0001; - Instead of this, we can use enum variable like below.
intf.psel = slave_0_sel;
	//This can be done only after defining enum datatype as above.
	//Code became more readable.