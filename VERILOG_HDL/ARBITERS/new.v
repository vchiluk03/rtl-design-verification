module day14 #(
  parameter NUM_PORTS = 4
)(
  input  wire [NUM_PORTS-1:0] req_i,
  input  wire clk,
  input  wire rst,
  output reg  [NUM_PORTS-1:0] gnt_o   // One-hot grant signal
);
integer i;
reg granted;

parameter NO_REQUESTERS = 5'd0;
parameter RAISED_A_REQUEST = 5'd1;
parameter SERVICING_REQUEST = 5'd3;
parameter REQUEST_SERVICED = 5'd4;
parameter ALL_REQUESTS_SERVICED = 5'd5;

reg [4:0] state,next_state;

//state logic 
always@(posedge clk) begin 
	if(rst) state <= NO_REQUESTERS;
	else state <= next_state;
end 

//next_state logic
always@(*) begin 
	case(state) 
		NO_REQUESTERS: next_state = (req_i>0) ? RAISED_A_REQUEST : NO_REQUESTERS
		RAISED_A_REQUEST: next_state = SERVICING_REQUEST;
		SERVICING_REQUEST: 
		REQUEST_SERVICED: next_state = (req_i>0)? RAISED_A_REQUEST : ALL_REQUESTS_SERVICED;
		ALL_REQUESTS_SERVICED: next_state = NO_REQUESTERS;
		default: next_state = NO_REQUESTERS;
	endcase
end


always @(posedge clk or posedge rst) begin
  if (rst) begin
    gnt_o <= 0;
  end else begin
    gnt_o <= 0;
    granted = 0;
    for (i = 0; i < NUM_PORTS; i = i + 1) begin
      if (!granted && req_i[i]) begin
        gnt_o[i] <= 1'b1;
        granted = 1;
      end
    end
  end
end

endmodule
