library verilog;
use verilog.vl_types.all;
entity dff_multibit is
    generic(
        NUM             : integer := 4
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        \in\            : in     vl_logic_vector;
        \out\           : out    vl_logic_vector
    );
end dff_multibit;
