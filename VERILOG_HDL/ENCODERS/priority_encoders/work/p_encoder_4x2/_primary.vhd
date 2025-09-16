library verilog;
use verilog.vl_types.all;
entity p_encoder_4x2 is
    port(
        i               : in     vl_logic_vector(3 downto 0);
        y               : out    vl_logic_vector(1 downto 0);
        v               : out    vl_logic
    );
end p_encoder_4x2;
