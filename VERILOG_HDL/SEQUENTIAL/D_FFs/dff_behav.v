module dff_behav(clk,rst,d,q);
input clk,rst,d;
output reg q;

always@(posedge clk) begin 
	if(rst) q<=0;
	else begin  
		 q<=d;
	end
end

endmodule