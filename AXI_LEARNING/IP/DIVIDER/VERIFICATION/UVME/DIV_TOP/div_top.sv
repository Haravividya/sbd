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
module div_top;

  import uvm_pkg::*;
  import div_package::*;
  
  bit [3:0]reset ;
logic div_clock = 1'b0 ;

 
//clock generation 
always #(`CLK_PERIOD/2 ) div_clock = ~div_clock ;
 
//reset generation
          
//Instance of interface : in order to connect DUT and TB
  div_interface vif(div_clock);
  
  //DUT instance : interface signals are connected to the DUT ports
    riscv_divider DUT(
    // Inputs
            .clk_i(vif.div_clock),
            .rst_i(vif.div_reset),     
            .valid_i(vif.valid_i),
            .opcode_i(vif.opcode),
            .operand_dividend(vif.operand_dividend),
            .operand_divisor(vif.operand_divisor),
 // Outputs 
            .valid_o(vif.valid_o),
            .div_rem_value_o(vif.result) ); 

		initial
	        begin
				reset=$urandom_range(10,5);
				vif.div_reset = 1;
                #reset;
				vif.div_reset = 0;
                #reset;
                vif.div_reset = 1;
                #reset;

    end
 //Enable wave dump 
  initial
  begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
  end 


  //Run test
  initial
  begin   
    uvm_config_db#(virtual div_interface)::set(null,"","vif",vif); //set interface
    run_test("div_test");
  end 

endmodule

