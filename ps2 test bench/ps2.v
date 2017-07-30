module ps2(
				input clk,
				input rst,
					
				input scl,
				input sda,					
				output reg data_valid,
				output reg [10:0] sda_to_do);

reg data_received;
reg [4:0] count=0;

wire xorr;
assign xorr = (sda_to_do[0] ^ sda_to_do[1] ^ sda_to_do[2] ^ sda_to_do[3] ^ sda_to_do[4] ^ sda_to_do[5] ^ sda_to_do[6] ^ sda_to_do[7] ^ sda_to_do[8] ^ sda_to_do[10]);


always @(negedge scl) begin	
	sda_to_do[10:0] <= {sda, sda_to_do[10:1]};
	if(count == 10) begin
		data_received <= 1;
		count <= 0; end
	else begin
		count <= count + 1;
		data_received <= 0; end
	
end
												 	
	
always @(posedge clk) begin
		if(rst) 
			if(data_received == 1)
				if(xorr == sda_to_do[9]) 
							if(sda_to_do[10] == 1)	 	 					
								data_valid<=1;									
							else data_valid<=0;
				else data_valid<=0;
			else data_valid<=0;
		else data_valid<=0;	
end 

endmodule


