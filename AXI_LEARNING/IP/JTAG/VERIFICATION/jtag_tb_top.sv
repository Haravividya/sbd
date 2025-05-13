

import uvm_pkg::*;
`include "uvm_macros.svh"

 //Include all files 
 `include "jtag_seq_item.sv"
 `include "jtag_sequence.sv"
 `include "jtag_sequencer.sv"

 `include "jtag_driver.sv"
 `include "jtag_monitor.sv"
 `include "jtag_agent.sv"

 `include "jtag_scoreboard.sv"
 `include "jtag_env.sv"

 `include "jtag_test.sv"

 //--------------------------------------------------------

`timescale 1ns/1ps

module jtag_tb_top;

  //Clock signal declaration

  logic TCK; // 4 states:  X ,  Z

  //Clock Generation
  always #5 TCK=~TCK;

  initial begin
    TCK = 0;
  end


//Instance of interface : in order to connect DUT and Testcase/TB
  dut_if intf(TCK);


//DUT instance , interface signals are connected to the DUT ports
  jtag_top DUT(
	.TCK(intf.TCK),
	.TRST(intf.TRST),
	.TMS(intf.TMS),
	.TDI(intf.TDI),
	.TDO(intf.TDO),
    .user_data_in(intf.user_data_in),
    .user_data_out(intf.user_data_out)
  );

//Enable wave dump 
  initial begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
    // $dumpfile("dump.vcd"); $dumpvars;
  end 

//set virtual interface - for configdb
  initial begin
    uvm_config_db#(virtual dut_if)::set(null,"","vif",intf);  
    //interface handle "intf" , type : dut_if , label/name :vif
       
  end
 

//run_test()
  initial begin
    `uvm_info("Test Bench top", $sformatf("Test Bench : Entry"), UVM_LOW)
 
    run_test("jtag_test");  //ramp_test file is called //debug

    `uvm_info("Test Bench top ", $sformatf(" Test BenCh : Exit "), UVM_LOW)
  end

endmodule
