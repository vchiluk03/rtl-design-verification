library verilog;
use verilog.vl_types.all;
entity demux_1x4_behv is
    port(
        i               : in     vl_logic;
        s               : in     vl_logic_vector(1 downto 0);
        y               : out    vl_logic_vector(3 downto 0)
    );
end demux_1x4_behv;
