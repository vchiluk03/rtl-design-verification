library verilog;
use verilog.vl_types.all;
entity one_bit_full_adder is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        c               : in     vl_logic;
        sum             : out    vl_logic;
        carry           : out    vl_logic
    );
end one_bit_full_adder;
