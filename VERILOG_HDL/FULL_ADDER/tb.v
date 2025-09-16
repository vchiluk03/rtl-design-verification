module tb;

reg a,b,ci;
wire s,co;

//connewction by position
//full_adder inst(a,b,ci,s,co); //Order should be maintained same as DUT -position significance 

//connection by name 
full_adder inst(.sum(s),
				.p(a),
				.r(ci),
				.q(b),
				.carry(co)); //we can connect in any order- name significance

initial begin 
	repeat(10) begin
		{a,b,ci} = $random; //Simce, $random is a 32 bit int value, last 3-bits are assigned for a,b and c
		#1;
		$display("%t : a=%b, b=%b, c=%b, sum=%b, carry=%b", $time,a,b,ci,s,co);
	end 
end
endmodule 