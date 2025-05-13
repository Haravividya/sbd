/***********************************************************

File name   : apb_protocol_tb_top.svh
Description : Test Bench top : contains : 
      		DUT instance , 
		Interface instance ,
		Clock and presetn generation logic , 
		Run_test() method , 
		wavedump logic , 		
		Virtual interface - set configdb

***********************************************************/

`timescale 1ns/1ps

module apb_protocol_tb_top;

import uvm_pkg::*;
import apb_protocol_pkg::*;

//Clock signal declaration

logic pclock; // 4 states: 0, 1,  X ,  Z


initial begin
  pclock = 0;
end

//Clock Generation
always #5 pclock=~pclock;

//Instance of interface : in order to connect DUT and Testcase/TB
apb_protocol_interface intf(pclock);

//DUT instance , interface signals are connected to the DUT ports
APB_protocol_top DUT(

    .pclock(intf.pclock), 
    .presetn(intf.presetn), 
	.transfer(intf.transfer), 
	.read_write(intf.read_write), 
	.apb_write_paddr(intf.apb_write_paddr), 
	.apb_write_data(intf.apb_write_data), 
	.apb_read_paddr(intf.apb_read_paddr), 				
	.apb_read_data_out(intf.apb_read_data_out)

);

//Enable wave dump 
initial begin
  $shm_open("wave.shm");
  $shm_probe("ACTMF");
  // $dumpfile("dump.vcd"); $dumpvars;
end 

//set virtual interface - for configdb
initial begin
  uvm_config_db#(virtual apb_protocol_interface)::set(null,"","apb_protocol_intf",intf);  
  //interface handle "intf" , type : ramp_interface , label/name : apb_protocol_intf
       
end
 

//run_test()
initial begin
 `uvm_info("Test Bench top", $sformatf("Test Bench : Entry"), UVM_LOW)
 
  run_test("apb_protocol_test");  

 `uvm_info("Test Bench top ", $sformatf(" Test Bench : Exit "), UVM_LOW)
end

endmodule
 

  

