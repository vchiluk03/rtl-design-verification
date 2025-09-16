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
