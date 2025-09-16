library verilog;
use verilog.vl_types.all;
entity intp_ctrl_tb is
    generic(
        NUM_OF_PERIPHERALS: integer := 16;
        ADDR_WIDTH      : integer := 4;
        DATA_WIDTH      : integer := 4
    );
end intp_ctrl_tb;
