/*******************************************************************
Project name:ahb_master 
Description: This is the top most module in the testbench
File name:ahb_master_top_tb.sv 
********************************************************************/

`timescale 1ns/1ps

`define  CLK_PRD           2.857  // 350 MHz , input clock frequency

module ahb_master_top_tb;

//uvm package
 import uvm_pkg::*;

//tb package - it has all the files and path of all the components.
 import pkg::*;
 
//input clock_generation ------------------------------------------------------------------------------
        logic tb_clk    = 1'b0;
        always #(`CLK_PRD/2)        tb_clk = ~tb_clk;   
   
//Random clock generation
 //int timeperiod=$urandom_range(10,50);  // random time period 
 //int dutycycle=$urandom_range (40,60); //random dutycycle
 //int on_time=(timeperiod*dutycycle)/100; //on time calculation
 //int off_time=timeperiod-on_time; //off time calculation
 //logic tb_clk=1'b0; 
 //initial 
  //begin
   //forever
    // begin
      
      //#on_time tb_clk=1;
      //#off_time tb_clk=0;  
  	
     //end
  //end

//Declaration of interface instance
  ahb_master_interface_tb i_inst(tb_clk);
  
//RTL instantiation
   ahb_master1 DUT (// inputs
                            .hclk		(i_inst.hclk),
							.hrst_n		(i_inst.hrst_n),
							.addr	    (i_inst.addr),
							.wdata	    (i_inst.wdata),
                            .hrdata     (i_inst.hrdata),
                            .iwrite     (i_inst.iwrite),
                            .hready     (i_inst.hready),
                            .hresp      (i_inst.hresp),
                            .iburst     (i_inst.iburst),
                            .isize      (i_inst.isize), 
                            .itrans     (i_inst.itrans), 
                            .busreq     (i_inst.busreq), 
                            .hgrant     (i_inst.hgrant), 
                            
			        // output   
							.rdata	(i_inst.rdata),
                            .haddr  (i_inst.haddr), 
                            .hwdata (i_inst.hwdata),
                            .hburst (i_inst.hburst), 
                            .hsize  (i_inst.hsize), 
                            .htrans (i_inst.htrans),
                            .hwrite (i_inst.hwrite),
                            .hbusreq (i_inst.hbusreq) 
                            ); 

// UVM_test seting config db obj which is get by driver and monitor for the interface connection
 initial 
  begin
      uvm_config_db#(virtual ahb_master_interface_tb)::set(uvm_root::get(),"*","INTERFACE_INST_DB", i_inst);                
       	//run_test("ahb_master_test_tb"); // start point - UVM this is a task, coded inside UVM library
	                           // it will start the testing of sequences (test cases) for the test class is given as an arguments       
   	//run_test("ahb_master_reset_test");
	//run_test("ahb_master_addr_test");
	//run_test("ahb_master_read_test");
	//run_test("ahb_master_write_test");
	//run_test("ahb_master_busreq_test");
	//run_test("ahb_master_hgrant_test");
	//run_test("ahb_master_hresp_test");
	//run_test("ahb_master_hready_test");
	//run_test("ahb_master_burst_test");
   	run_test(" "); 
  end

// wave_dump commands to see the wave form in cadence tool
 initial 
  begin

     $shm_open("wave.shm");
     $shm_probe("ACTMF");

  end
		                                       		                        
endmodule


