library verilog;
use verilog.vl_types.all;
entity mux_2to1 is
    port(
        sel             : in     vl_logic;
        a               : in     vl_logic;
        b               : in     vl_logic;
        y               : out    vl_logic
    );
end mux_2to1;
