library verilog;
use verilog.vl_types.all;
entity tb is
    generic(
        NO_OPERATION    : integer := 0;
        ADD             : integer := 1;
        SUB             : integer := 2;
        MUL             : integer := 3;
        DIV             : integer := 4;
        \MOD\           : integer := 5;
        POWER           : integer := 6;
        LEFT_SHIFT      : integer := 7;
        RIGHT_SHIFT     : integer := 8
    );
end tb;
