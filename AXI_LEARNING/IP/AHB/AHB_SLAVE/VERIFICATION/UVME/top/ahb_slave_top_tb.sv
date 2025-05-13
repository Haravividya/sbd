/*******************************************************************
Project name:ahb_slave 
Description: This is the top most module in the testbench
File name:ahb_slave_top_tb.sv 
********************************************************************/

`timescale 1ns/1ps

`define  CLK_PRD           2.857  // 350 MHz , input clock frequency

module ahb_slave_top_tb;

  //uvm package
  import uvm_pkg::*;
  
  //tb package - it has all the files and path of all the components.
  import pkg::*;
 
  //input clock_generation ------------------------------------------------------------------------------
  logic tb_clk    = 1'b0;
  always #(`CLK_PRD/2)        tb_clk = ~tb_clk;   
   
  //Random clock generation
  /*int timeperiod=$urandom_range(10,50);  // random time period 
  int dutycycle=$urandom_range (40,60); //random dutycycle
  int on_time=(timeperiod*dutycycle)/100; //on time calculation
  int off_time=timeperiod-on_time; //off time calculation
  logic tb_clk=1'b0; 
  initial 
  begin
    forever
    begin
      
      #on_time tb_clk=1;
      #off_time tb_clk=0;  
  	
    end
  end*/

  //Declaration of interface instance
  ahb_slave_interface_tb i_inst(tb_clk);
  
  //RTL instantiation
  ahb_slave DUT (// inputs
                            .hclk		(i_inst.hclk     ),
							.hresetn	(i_inst.hreset_n ),
							.hsel	    (i_inst.hsel     ),
							.haddr	    (i_inst.haddr    ),
                            .hwrite     (i_inst.hwrite   ),
                            .hready     (i_inst.hready   ),
                            .hwdata     (i_inst.hwdata   ),
                            .hburst     (i_inst.hburst   ),
                                                        
			      // outputs   
							.hrdata	    (i_inst.hrdata   ),
                            .hresp      (i_inst.hresp    ), 
                            .hreadyout  (i_inst.hreadyout)
                                                 
                 ); 

  // UVM_test seting config db obj which is get by driver and monitor for the interface connection
  initial 
  begin
    uvm_config_db#(virtual ahb_slave_interface_tb)::set(uvm_root::get(),"*","INTERFACE_INST_DB", i_inst);                
    //run_test("ahb_slave_test_tb"); // start point - UVM this is a task, coded inside UVM library
	// it will start the testing of sequences (test cases) for the test class is given as an arguments       
   	
    //run_test("ahb_slave_reset_test");
	//run_test("ahb_slave_haddr_test");
	//run_test("ahb_slave_burst4_test");
	//run_test("ahb_slave_wr_test");
	//run_test("ahb_slave_burst16_test");
	//run_test("ahb_slave_burst8_test");
	//run_test("ahb_slave_hsel_test");
	//run_test("ahb_slave_hready_test");
	//run_test("ahb_slave_hburst_test");
   	run_test(" "); 
  end

  //wave_dump commands to see the wave form in cadence tool
  initial 
  begin

    $shm_open("wave.shm");
    $shm_probe("ACTMF");

  end
		                                       		                        
endmodule


