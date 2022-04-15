module comp_arch_lab_5_tb ();
 
 reg  clock, wr;
 reg  [7:0] adr;
 reg  [31:0] Din;
 wire   [31:0] Dout;
 
 comp_arch_lab_5 dut (.Dout(Dout), .Din(Din), .adr(adr), .clock(clock), .wr(wr));
 
 always #5 clock = ~clock;
 
 initial begin
  
  clock = 0;
  //writing into the rom
  wr = 1;
  
  #10;
  adr = 0;
  Din = 32'h01010101;
  
  #10;
  adr = 1;
  Din = 32'h02020202;
  
  #10;
  adr = 255;
  Din = 32'hFFFFFFFF;
  
  #10;
  //reading the rom
  wr = 0;
  
  #10;
  adr = 0;
  
  #10;
  adr = 1;
  
  #10;
  adr = 255;
  
  #50 $stop;
  
 end

endmodule 