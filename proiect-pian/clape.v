module clape(
					input clk,
					input rst,
					
					input [7:0] switch_uri,
										
					input data_valid,
					input [10:0] sda_to_do,
					
					input disp_en,
					input [10:0] count_hsync,
					input [9:0] count_vsync,
					
					output reg [3:0] red,
					output reg [3:0] blue,
					output reg [3:0] green);

reg [25:0] update;
reg [7:0] taste_note;					
localparam do=8'h08, re=8'h01, mi=8'h02, fa=8'h03, sol=8'h04, la=8'h05, si=8'h06, dodo=8'h07;
					
always @(posedge clk) begin
if(update == 2500000) begin 
	update <= 0;
	if(rst == 0) 
		taste_note<=8'b00;
		else
			if(data_valid == 0)
						  if(sda_to_do[8:1] == 8'h1C | sda_to_do[8:1] == 8'h0E)			taste_note<=do;					
					else if(sda_to_do[8:1] == 8'h1B )				taste_note<=re;										
					else if(sda_to_do[8:1] == 8'h23 )				taste_note<=mi;											
					else if(sda_to_do[8:1] == 8'h2B )				taste_note<=fa;											
					else if(sda_to_do[8:1] == 8'h34 )				taste_note<=sol;											
					else if(sda_to_do[8:1] == 8'h33 )				taste_note<=la;											
					else if(sda_to_do[8:1] == 8'h3B )				taste_note<=si;											
					else if(sda_to_do[8:1] == 8'h42 )				taste_note<=dodo;				   
					else taste_note<=8'h0;
			else taste_note<=8'h00; end
	else update <= update+1;		
			end 	
	
always @(posedge clk)
	if(rst == 0) begin
		red<=0;
		green<=0;
		blue<=0; end
		else 
		if(disp_en == 0) begin
			if	((count_hsync < 98 | (count_hsync > 100 & count_hsync <198) | (count_hsync > 200 & count_hsync < 298) | (count_hsync > 300 & count_hsync < 398) | 
			(count_hsync > 400 & count_hsync < 498) | (count_hsync > 500 & count_hsync < 598) | (count_hsync > 600 & count_hsync < 698) | 
				(count_hsync > 700 & count_hsync < 800)) & (count_vsync<600)) begin
					red<=4'b1111;
					green<=4'b1111;
					blue<=4'b1111; 										
									
					if(count_hsync < 98) 
							if(taste_note == do |	switch_uri[0] == 1) begin
								red<=4'b0;
								green<=4'b1111;
								blue<=4'b0;end 
								else  begin
										red<=4'b1111;
										green<=4'b1111;
										blue<=4'b1111; end 
										
					else  if(count_hsync > 100 & count_hsync <198)
								if(taste_note == re	| switch_uri[1] == 1) begin
									red<=4'b0;
									green<=4'b1111;
									blue<=4'b0;end 
									else  begin
										red<=4'b1111;
										green<=4'b1111;
										blue<=4'b1111; end 
										
					else  if(count_hsync > 200 & count_hsync <298)
								if(taste_note == mi | switch_uri[2] == 1) begin
									red<=4'b0;
									green<=4'b1111;
									blue<=4'b0;end 
									else  begin
										red<=4'b1111;
										green<=4'b1111;
										blue<=4'b1111; end 
										
					else  if(count_hsync > 300 & count_hsync <398)
								if(taste_note == fa | switch_uri[3] == 1) begin
									red<=4'b0;
									green<=4'b1111;
									blue<=4'b0;end 
									else  begin
										red<=4'b1111;
										green<=4'b1111;
										blue<=4'b1111; end 
													
					else  if(count_hsync > 400 & count_hsync <498)
								if(taste_note == sol | switch_uri[4] == 1) begin
									red<=4'b0;
									green<=4'b1111;
									blue<=4'b0;end 
									else  begin
										red<=4'b1111;
										green<=4'b1111;
										blue<=4'b1111; end 
													
					else  if(count_hsync > 500 & count_hsync <598)
								if(taste_note == la | switch_uri[5] == 1) begin
									red<=4'b0;
									green<=4'b1111;
									blue<=4'b0;end 
									else  begin
										red<=4'b1111;
										green<=4'b1111;
										blue<=4'b1111; end 
													
					else  if(count_hsync > 600 & count_hsync <698)
								if(taste_note == si | switch_uri[6] == 1) begin
									red<=4'b0;
									green<=4'b1111;
									blue<=4'b0;end 
									else  begin
										red<=4'b1111;
										green<=4'b1111;
										blue<=4'b1111; end 
													
					else  if(count_hsync > 700 & count_hsync <800)
								if(taste_note == dodo | switch_uri[7] == 1) begin
									red<=4'b0;
									green<=4'b1111;
									blue<=4'b0;end 
									else  begin
										red<=4'b1111;
										green<=4'b1111;
										blue<=4'b1111; end 
										
					else  begin
									red<=4'b1111;
									green<=4'b1111;
									blue<=4'b1111; end 
													
													
										
			end else begin red<=0;
						green<=0;
						blue<=0; end	
						
		end else begin red<=0;
						green<=0;
						blue<=0; end

endmodule

