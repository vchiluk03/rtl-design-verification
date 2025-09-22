library verilog;
use verilog.vl_types.all;
entity four_bit_full_adder is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        Cin             : in     vl_logic;
        S               : out    vl_logic_vector(3 downto 0);
        Co              : out    vl_logic
    );
end four_bit_full_adder;
