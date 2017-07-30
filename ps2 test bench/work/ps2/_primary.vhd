library verilog;
use verilog.vl_types.all;
entity ps2 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        scl             : in     vl_logic;
        sda             : in     vl_logic;
        data_valid      : out    vl_logic;
        sda_to_do       : out    vl_logic_vector(10 downto 0)
    );
end ps2;
