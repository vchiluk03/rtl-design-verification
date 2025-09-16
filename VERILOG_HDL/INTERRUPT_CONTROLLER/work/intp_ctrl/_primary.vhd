library verilog;
use verilog.vl_types.all;
entity intp_ctrl is
    generic(
        NUM_OF_PERIPHERALS: integer := 16;
        ADDR_WIDTH      : integer := 4;
        DATA_WIDTH      : integer := 4;
        IDLE            : integer := 0;
        GOT_INTP_AND_SEND_TO_PROC: integer := 1;
        WAITING_FOR_INTP_TO_BE_SERVICED: integer := 2
    );
    port(
        pclk_i          : in     vl_logic;
        prst_i          : in     vl_logic;
        paddr_i         : in     vl_logic_vector;
        pwrite_i        : in     vl_logic;
        pwdata_i        : in     vl_logic_vector;
        prdata_o        : out    vl_logic_vector;
        penable_i       : in     vl_logic;
        pready_o        : out    vl_logic;
        perror_o        : out    vl_logic;
        intp_serviced_i : in     vl_logic;
        intp_valid_o    : out    vl_logic;
        intp_to_service_o: out    vl_logic_vector;
        intp_active_i   : in     vl_logic_vector
    );
end intp_ctrl;
