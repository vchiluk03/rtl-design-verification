module sequence(clk,rst,count,value);
input clk,rst;
output count,value;

reg [15:0] count;
reg [3:0] value;

assign w = (count==1) ? 1 :
		   (count==2) ? 2 :	
		   (count==4) ? 3 :
		   (count==7) ? 4 : 0;
		   
always@(posedge clk) begin 
	if(rst) begin 
		count<= 0;
		value<= 0;
	end
	else begin 
		count <= count+1;
		value <= w;
	end

end

endmodule