library verilog;
use verilog.vl_types.all;
entity full_adder is
    port(
        p               : in     vl_logic;
        q               : in     vl_logic;
        r               : in     vl_logic;
        sum             : out    vl_logic;
        carry           : out    vl_logic
    );
end full_adder;
