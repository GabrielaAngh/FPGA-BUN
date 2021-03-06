module pian(														//	TOP
					input clk,
					input rst_ps,
					input rst_clape,
					input rst_sync,
					
					input [7:0] switch_uri,
					
					input scl,
					input sda,
					
					output [6:0] data_out,						
					output [6:0] data_out_doi,
					
					output data_valid,
					output [3:0] red,
					output [3:0] blue,
					output [3:0] green,
					
					output disp_en,
					output hsync,
					output vsync);


wire [10:0] sda_to_do;
wire [10:0] count_hsync;
wire [9:0] count_vsync;

ps2 ps21(
				.clk(clk),
				.rst(rst_ps),
					
				.scl(scl),
				.sda(sda),					
				.data_valid(data_valid),
				.sda_to_do(sda_to_do));
				
clape clape1(
					.clk(clk),
					.rst(rst_clape),
					
					.switch_uri(switch_uri),
					
					.data_valid(data_valid),
					.sda_to_do(sda_to_do),
					
					.disp_en(disp_en),
					.count_hsync(count_hsync),
					.count_vsync(count_vsync),
					
					.red(red),
					.blue(blue),
					.green(green));
					
sync sync1(
					.clk(clk),
					.rst(rst_sync),
					
					.disp_en(disp_en),
					.hsync(hsync),
					.vsync(vsync),
					.count_hsync(count_hsync),
					.count_vsync(count_vsync));
					
afisaj7seg afisaj7seg1( .value(sda_to_do[4:1]), .out_seg(data_out));				
afisaj7seg afisaj7seg2( .value(sda_to_do[8:5]), .out_seg(data_out_doi));

endmodule

