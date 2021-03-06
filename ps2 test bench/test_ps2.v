module test_ps2();
				reg clk;
				reg rst;
					
				reg scl;
				reg sda;					
				wire data_valid;
				wire [10:0] sda_to_do;

ps2 dut(.clk(clk),
				.rst(rst),
					
				.scl(scl),
				.sda(sda),					
				.data_valid(data_valid),
				.sda_to_do(sda_to_do));


initial begin
clk=0;
forever #10 clk=~clk;
end

initial begin
  rst=0;
  scl=1;
  sda=1;        //0
  
  #16 rst=1;
  #28 rst=0;
  
  #4 sda=0;
  #60 scl=0;  
  
  #60 scl=1;    //1
    
  #4 sda=1;  
  #60 scl=0;
      
  #60 scl=1;    //2
  
  #4 sda=0;
  #60 scl=0;
    
  #60 scl=1;    //3
  
  #4 sda=0;
  #60 scl=0;
  
  #60 scl=1;    //4
  
  #4 sda=1; 
  #54 scl=0;
    
  #60 scl=1;    //5
  
  #4 sda=0;
  #60 scl=0;
    
  #60 scl=1;     //6
  
  #4 sda=0;
  #60 scl=0; 
  
  #60 scl=1;      //7
  
  #4 sda=1;  
  #60 scl=0;
    
  #60 scl=1;      //8
  
  #4 sda=1;  
  #60 scl=0;
  
  #60 scl=1;      //9
  
  #4 sda=1;
  #60 scl=0;
  
  #60 scl=1;      //10
  
  #4 sda=1;
  #60 scl=0;
  
  #60 scl=1;
  
  #100 $stop;
end

endmodule




