library verilog;
use verilog.vl_types.all;
entity tb is
    generic(
        WIDTH           : integer := 2;
        DEPTH           : integer := 8;
        ADDR_WIDTH      : integer := 3
    );
end tb;
