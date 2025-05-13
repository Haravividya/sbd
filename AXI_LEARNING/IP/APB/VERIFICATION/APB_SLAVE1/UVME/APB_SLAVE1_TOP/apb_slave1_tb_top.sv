module apb_slave1_tb_top;

   import uvm_pkg::*;
   import apb_slave1_pkg::*;

//Clock signal declaration

 logic pclock; // 4 states:  X, z

 //Enable wave dump 
initial begin
  $shm_open("wave.shm");
  $shm_probe("ACTMF");
  // $dumpfile("dump.vcd"); $dumpvars;
end 

 //logic presetn;
 
//Clock Generation
 always #5 pclock=~pclock;

 initial begin
	pclock = 1;
	//presetn=1;
 end
 
 /*initial begin
	 repeat(2) @(negedge pclock)
		presetn=1;
	@(negedge pclock)
		presetn=0;
	
	end */

//Instance of interface : in order to connect DUT and Testcase/TB
apb_slave1_interface intf(pclock);


//DUT instance , interface signals are connected to the DUT ports pclock, presetn,ref_signal,step_size,signal_out

apb_slave1 DUT(
	.pclock(intf.pclock),
	.presetn(intf.presetn),
	.psel1(intf.psel1),
	.penable(intf.penable),
	.paddr(intf.paddr),
    .pwrite(intf.pwrite),
	.pwdata(intf.pwdata),
	.prdata1(intf.prdata1),
	.pslverr1(intf.pslverr1),
	.pready1(intf.pready1)
       );






//set virtual interface - for configdb
initial begin
//	$dumpfile("waveforms.vcd");
 //   $dumpvars(0,apb_slave1_tb_top);
    // $dumpfile("dump.vcd"); $dumpvars;  
    uvm_config_db#(virtual apb_slave1_interface)::set(null,"","intf",intf); 
//	`uvm_info("Test Bench top", $sformatf("Test Bench : Entry"), UVM_LOW)
	run_test("apb_slave1_test");  //apb_slave1_test file is called //debug
   `uvm_info("Test Bench top ", $sformatf(" Test BenCh : Exit "), UVM_LOW)
     
end

//run_test()
/*initial begin
 
 
  

 
end*/

endmodule
