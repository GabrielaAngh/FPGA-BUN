
module sync(
					input clk,
					input rst,
					
					output disp_en,
					output reg hsync,
					output reg vsync,
					output reg [10:0] count_hsync,
					output reg [9:0] count_vsync);
					

assign disp_en = ((count_hsync < 800)&(count_vsync < 600)) ?  0:1;

always @(posedge clk)

			if(rst == 0) begin
					hsync<=0;
					vsync<=0;
					count_hsync<=0;
					count_vsync<=0; end 
					
					else begin if((count_hsync >855) & (count_hsync <976)) begin
											hsync<=1;
											count_hsync<=count_hsync+1; end
											else begin hsync<=0;
														  count_hsync<=count_hsync+1;														  
														  if(count_hsync == 1039) begin 
																		count_hsync<=0;
																		count_vsync<=count_vsync+1;											
																		if((count_vsync >636) & (count_vsync <643)) begin
																					vsync<=1;
																					count_vsync<=count_vsync+1; end 
																					else begin vsync<=0;
																								  count_vsync<=count_vsync+1;
																								  if(count_vsync == 665)
																												count_vsync<=0;
																											else count_vsync<=count_vsync+1;	end 
																							end else count_hsync<=count_hsync+1;
													end 								
								end

endmodule


