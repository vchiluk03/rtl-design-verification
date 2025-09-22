class eth_pkt;
	static int count;
	typedef enum {
		GOOD=2, BAD=3, ILL=4
	} pkt_type_t;
	
	class my_pkt;
		class sample;
			static int count;
			typedef bit[5:0] bit_t;
			typedef enum {
				GOOD,BAD,ILL
			} pkt_type_t;
			
			static pkt_type_t pkt_type; //pkt_type can be of any type that pkt_type_t holds(GOOD,BAD,ILL).
			static function set_count(int count_t);
				count = count_t;
			endfunction
		endclass
	endclass
	
	extern static function void print(); ///this is only prototype, defnition is present outside(extern)
	extern static function void set_count(int count_t);
endclass

function void eth_pkt::print();
endfunction

function void eth_pkt::set_count(int count_t);
endfunction


//TOP
module top;
eth_pkt::my_pkt::sample s_obj;
eth_pkt::pkt_type_t pkt1;

initial begin 
	//create sample object of GOOD type
	s_obj = new();
	s_obj.pkt_type = eth_pkt::my_pkt::sample::GOOD;
	$display("s_obj.pkt_type=%0d",s_obj.pkt_type);
	pkt1 = eth_pkt::BAD;
	$display("pkt1=%0d",pkt1);
	
end
endmodule