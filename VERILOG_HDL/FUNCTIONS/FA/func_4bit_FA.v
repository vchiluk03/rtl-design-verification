//write a function to implement full-adder functionality
module tb;
reg [3:0] s;
reg cout;
reg [3:0] p,q;
reg r;
integer seed;

initial begin 
seed = 7546;
repeat(10) begin 
	{p,q,r} = $random(seed);
	{cout,s} = FA(p,q,r);
	$display("p = %0d\t\tq = %0d\t\tr=%0d\t\tResult : %0d", p,q,r,{cout,s});
end
end

//style-1
/*******************************************************************
function integer result(input reg [3:0] a,b, input reg cin);
begin 
	result = a+b+cin; 
end
endfunction
*********************************************************************************/

//style-2
function reg [4:0] FA(input reg [3:0] a,b, input reg cin);
begin 
	FA = a+b+cin; 
end
endfunction


endmodule