/********************************************************************************
File name:spi_top.sv
Description: This is the top most module in the tetbench
This module has: RTL instance, Interface instance, UVM - run_test, wave dump etc;
********************************************************************************/
module spi_top;

  // UVM package
  import uvm_pkg::*;
  `include "uvm_macros.svh"
        
  // TB package
  import pkg::*;

  // random clock generation
  logic clk, mclk;                                    // clock declaration
  int timeperiod = $urandom_range(10,50);       //random timeperiod calculation
  int dutycycle  = $urandom_range (40,60);      //random dutycycle calculation
  int on_time    = (timeperiod*dutycycle)/100;  //ton calculation
  int off_time   = timeperiod - on_time;        //toff calculation

  initial
    begin
      clk = 0;
      forever
        begin
          #off_time clk = 1;  
          #on_time clk  = 0;
        end
    end
  
  initial
    begin
      mclk = 0;
      forever
        begin
          #(off_time*2) mclk = 1;  
          #(on_time*2)  mclk  = 0;
        end
    end

  

  // creatinng instance of interface, inorder to connect DUT and testcase
  spi_intf interface_inst(clk,mclk);
      
  //  RTL instance, interface signals are connected to the DUT ports --------------------------------
  spi_master DUT(// inputs
            .clk	    	(interface_inst.clk),
	        .rst	        (interface_inst.reset),
	        .tx_ready       (interface_inst.tx_ready),
	        .data_in	    (interface_inst.data_in),
	        .miso	    (interface_inst.miso),
		    .rx_e	    (interface_inst.rx_e),
	      // output   
	        .data_out (interface_inst.data_out),
	        .tx_done(interface_inst.tx_done),
  		    .rx_done(interface_inst.rx_done),
	        .mosi (interface_inst.mosi),
	        .ss (interface_inst.ss),
	        .sclk (interface_inst.sclk)
         );

  // UVM_test, set interface in config_db--------------------------------------------------------------
  initial begin
    uvm_config_db#(virtual spi_intf)::set(uvm_root::get(),"*","interface_inst",interface_inst);
    // start point - UVM   this is a task, coded inside UVM library
    //run_test("spi_base_test");
    run_test("spi_base_test");
    
  end

  // wave_dump ----------------------------------------------------------------------------------------
  initial begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
  end   
         
endmodule
