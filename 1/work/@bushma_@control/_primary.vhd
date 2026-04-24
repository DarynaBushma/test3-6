library verilog;
use verilog.vl_types.all;
entity Bushma_Control is
    generic(
        a1              : integer := 1;
        a2              : integer := 2;
        a3              : integer := 3
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        x               : in     vl_logic;
        MI              : out    vl_logic_vector(1 to 3)
    );
end Bushma_Control;
