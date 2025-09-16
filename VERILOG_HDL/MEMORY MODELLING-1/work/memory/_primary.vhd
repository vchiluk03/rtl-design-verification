library verilog;
use verilog.vl_types.all;
entity memory is
    generic(
        WIDTH           : integer := 2;
        DEPTH           : integer := 8;
        ADDR_WIDTH      : integer := 3
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        addr_i          : in     vl_logic_vector;
        wr_rd_i         : in     vl_logic;
        wr_data_i       : in     vl_logic_vector;
        rd_data_o       : out    vl_logic_vector;
        valid_i         : in     vl_logic;
        ready_o         : out    vl_logic
    );
end memory;
