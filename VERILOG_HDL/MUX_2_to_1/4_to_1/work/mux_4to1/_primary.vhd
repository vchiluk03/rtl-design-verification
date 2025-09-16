library verilog;
use verilog.vl_types.all;
entity mux_4to1 is
    port(
        y               : out    vl_logic;
        i               : in     vl_logic_vector(3 downto 0);
        s               : in     vl_logic_vector(1 downto 0)
    );
end mux_4to1;
