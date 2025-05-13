/***********************************************************
File name   : mul_top.sv
Description : Test Bench top : contains : 
      		DUT instance , 
		    Interface instance ,
		    Clock generation logic , 
		    Run_test() method , 
		    wavedump logic , 		
		    Virtual interface - set configdb
***********************************************************/
`timescale 1ns/1ps
`define CLK_PERIOD 10 
module mul_top;

  import uvm_pkg::*;
  import mul_package::*;

logic clock = 1'b0 ; 
//clock generation
initial
begin
clock = 1'b0 ; 
forever #(`CLK_PERIOD/2 ) clock = ~clock ;
end


//Instance of interface : in order to connect DUT and TB
  mul_interface vif(clock);
  
  //DUT instance : interface signals are connected to the DUT ports

  z_multiplier DUT(  .z_clk(vif.mul_clk),
                     .z_rst(vif.mul_reset),
                     .oper1(vif.oper1),
                     .oper2(vif.oper2),
                     .product(vif.result)
                     );

 //Enable wave dump 
  initial
  begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
  end 


  //Run test
  initial
  begin   
    uvm_config_db#(virtual mul_interface)::set(null,"","vif",vif); //set interface
    run_test("mul_test");
  end 

endmodule
