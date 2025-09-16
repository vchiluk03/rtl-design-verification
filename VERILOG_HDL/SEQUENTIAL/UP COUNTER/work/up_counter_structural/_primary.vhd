library verilog;
use verilog.vl_types.all;
entity up_counter_structural is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        count           : out    vl_logic_vector(2 downto 0)
    );
end up_counter_structural;
