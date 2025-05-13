/********************************************************************************
Project:Spi_slave
Author: B Bhagavantu
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
  logic sclk;                                    // clock declaration
  int timeperiod = $urandom_range(1,50);       //random timeperiod calculation
  int dutycycle  = $urandom_range (40,60);      //random dutycycle calculation
  int on_time    = (timeperiod*dutycycle)/100;  //ton calculation
  int off_time   = timeperiod - on_time;        //toff calculation

  initial
    begin
      sclk = 0;
      forever
        begin
          #off_time sclk = 1;  
          #on_time sclk  = 0;
        end
    end
  
   
  // creatinng instance of interface, inorder to connect DUT and testcase
  spi_intf interface_inst(sclk);
      
  //  RTL instance, interface signals are connected to the DUT ports --------------------------------
  spi_slave DUT (// inputs
                 .s_clk	    	(interface_inst.sclk),
	             .rst	        (interface_inst.reset),
	             .data_in	    (interface_inst.data_in),
	             .mosi	        (interface_inst.mosi),
		         .rx_e	        (interface_inst.rx_e),
                 .ss            (interface_inst.ss),
                 .load          (interface_inst.load),

	             // output   
	             .data_out      (interface_inst.data_out),
	             .miso          (interface_inst.miso),
                 .tx_done       (interface_inst.tx_done),
                 .rx_done       (interface_inst.rx_done)
	             );

  // UVM_test, set interface in config_db--------------------------------------------------------------
  initial begin
    uvm_config_db#(virtual spi_intf)::set(uvm_root::get(),"*","interface_inst",interface_inst);
    // start point - UVM   this is a task, coded inside UVM library
    run_test("spi_base_test");
    //run_test("spi_data_in_test");
    
  end

  // wave_dump ----------------------------------------------------------------------------------------
  initial begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
  end   
         
endmodule
