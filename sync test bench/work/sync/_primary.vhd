library verilog;
use verilog.vl_types.all;
entity sync is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        disp_en         : out    vl_logic;
        hsync           : out    vl_logic;
        vsync           : out    vl_logic;
        count_hsync     : out    vl_logic_vector(10 downto 0);
        count_vsync     : out    vl_logic_vector(9 downto 0)
    );
end sync;
