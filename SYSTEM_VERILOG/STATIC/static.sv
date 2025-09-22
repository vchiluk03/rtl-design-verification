class sample;
static int count; //automatic ==> its memory exists only we create memory using new().

static function void incr_count(); //memory exists as soon as class is defined.
	count++;
	$display("value of count:%0d",count);
endfunction

endclass

module top;
initial begin 
	sample::incr_count(); //when we call this, it is trying to access a memory that doesn't exist.
	sample::incr_count();
end
endmodule