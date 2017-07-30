module test_sync();
					reg clk;
					reg rst;
					
					wire disp_en;
					wire hsync;
					wire vsync;
					wire [10:0] count_hsync;
					wire [9:0] count_vsync;
					
sync dut(
					.clk(clk),
					.rst(rst),
					
					.disp_en(disp_en),
					.hsync(hsync),
					.vsync(vsync),
					.count_hsync(count_hsync),
					.count_vsync(count_vsync));
					
initial begin
  clk=0;
  forever #10 clk=~clk;
end

initial begin
  rst=0; 
  #20 rst=1;
  #300 $stop;
end

endmodule
