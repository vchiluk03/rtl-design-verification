library verilog;
use verilog.vl_types.all;
entity mux_8to1 is
    port(
        s2              : in     vl_logic;
        s1              : in     vl_logic;
        s0              : in     vl_logic;
        i0              : in     vl_logic;
        i1              : in     vl_logic;
        i2              : in     vl_logic;
        i3              : in     vl_logic;
        i4              : in     vl_logic;
        i5              : in     vl_logic;
        i6              : in     vl_logic;
        i7              : in     vl_logic;
        y               : out    vl_logic
    );
end mux_8to1;
