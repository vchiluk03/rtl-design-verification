class eth_pkt;
	class sample;
		static protected int count;
		typedef int intA_t[3:0];
			//intA_t represents a data type of int array of size = 4
		
		static function void set_count(int count_t);
			count = count_t;
		endfunction
		
		static function void get_count(output count_t);
			count_t = count;
		endfunction
	
	endclass
endclass

module top;
	eth_pkt::sample::intA_t intA1;
	initial begin 
		$display("intA1 : %p",intA1);
		eth_pkt::sample::set_count(100);
		//$display("count=%0d",eth_pkt::sample::get_count);
		$display("count=%0d",get_count(count_output));
	end
endmodule