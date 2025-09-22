//===========================
// File: rtl/intp_ctrl_top.v
//===========================

module intp_ctrl_top #(
  parameter NUM_OF_PERIPHERALS = 16,
  parameter ADDR_WIDTH = $clog2(NUM_OF_PERIPHERALS),
  parameter DATA_WIDTH = $clog2(NUM_OF_PERIPHERALS)
)(
  input  wire                      pclk_i,
  input  wire                      prst_i,
  input  wire                      pwrite_i,
  input  wire                      penable_i,
  input  wire [ADDR_WIDTH-1:0]     paddr_i,
  input  wire [DATA_WIDTH-1:0]     pwdata_i,
  input  wire [NUM_OF_PERIPHERALS-1:0] intp_active_i,
  input  wire                      intp_serviced_i,
  output reg                       perror_o,
  output reg                       pready_o,
  output reg  [DATA_WIDTH-1:0]     prdata_o,
  output reg                       intp_valid_o,
  output reg  [DATA_WIDTH-1:0]     intp_to_service_o
);

  // FSM states
  localparam IDLE = 2'd0;
  localparam GOT_INTP_AND_SEND_TO_PROC = 2'd1;
  localparam WAITING_FOR_INTP_TO_BE_SERVICED = 2'd2;

  // Priority register memory
  reg [DATA_WIDTH-1:0] priority_regA [NUM_OF_PERIPHERALS-1:0];

  // FSM state
  reg [1:0] state;

  // Internal signals
  integer i;
  reg [DATA_WIDTH-1:0] current_highest_priority;
  reg [ADDR_WIDTH-1:0] peripheral_with_highest_priority;
  reg [DATA_WIDTH-1:0] temp_priority;
  reg [ADDR_WIDTH-1:0] temp_peripheral;

  // APB register write/read
  always @(posedge pclk_i) begin
    if (prst_i) begin
      pready_o <= 0;
      prdata_o <= 0;
      for (i = 0; i < NUM_OF_PERIPHERALS; i = i + 1)
        priority_regA[i] <= 0;
    end else begin
      if (penable_i) begin
        pready_o <= 1;
        if (pwrite_i)
          priority_regA[paddr_i] <= pwdata_i;
        else
          prdata_o <= priority_regA[paddr_i];
      end else begin
        pready_o <= 0;
      end
    end
  end

  // FSM state transition
  always @(posedge pclk_i) begin
    if (prst_i)
      state <= IDLE;
    else begin
      case (state)
        IDLE:
          if (intp_active_i != 0)
            state <= GOT_INTP_AND_SEND_TO_PROC;
        GOT_INTP_AND_SEND_TO_PROC:
          state <= WAITING_FOR_INTP_TO_BE_SERVICED;
        WAITING_FOR_INTP_TO_BE_SERVICED:
          if (intp_serviced_i)
            state <= (intp_active_i != 0) ? GOT_INTP_AND_SEND_TO_PROC : IDLE;
      endcase
    end
  end

  // Output and priority selection logic
  always @(posedge pclk_i) begin
    if (prst_i) begin
      intp_to_service_o <= 0;
      intp_valid_o <= 0;
      perror_o <= 0;
      current_highest_priority <= 0;
      peripheral_with_highest_priority <= 0;
    end else begin
      case (state)
        GOT_INTP_AND_SEND_TO_PROC: begin
          temp_priority = 0;
          temp_peripheral = 0;
          for (i = 0; i < NUM_OF_PERIPHERALS; i = i + 1) begin
            if (intp_active_i[i]) begin
				if(priority_regA[i] > temp_priority) begin
					temp_priority = priority_regA[i];
					temp_peripheral = i;
				end
            end
          end
          current_highest_priority <= temp_priority;
          peripheral_with_highest_priority <= temp_peripheral;
          intp_to_service_o <= temp_peripheral;
          intp_valid_o <= 1;
        end
        WAITING_FOR_INTP_TO_BE_SERVICED: begin
          if (intp_serviced_i) begin
            intp_valid_o <= 0;
            intp_to_service_o <= 0;
          end
        end
      endcase
    end
  end

endmodule

