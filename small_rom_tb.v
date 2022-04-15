module small_rom_tb ();

 reg  clock, cs, wr;
 reg  [5:0] adr;
 reg  [7:0] Din;
 wire [7:0] Dout;
 
 small_rom dut2 (Dout, Din, adr, clock, cs, wr);
 
 always #5 clock = ~clock;
 
 initial begin
  
  clock = 0;
  //writing into the rom
  wr = 1;
  cs = 1;
  
  #10;
  adr = 0;
  Din = 8'h01;
  
  #10;
  adr = 1;
  Din = 8'h02;
  
  #10;
  adr = 255;
  Din = 8'hFF;
  
  #10;
  //reading the rom
  wr = 0;
  
  #10;
  adr = 0;
  
  #10;
  adr = 1;
  
  #10;
  adr = 63;
  
  #50 $stop;
  
 end

endmodule 