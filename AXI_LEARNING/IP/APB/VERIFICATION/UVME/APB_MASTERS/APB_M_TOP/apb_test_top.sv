`timescale 1ns/1ps

module testtop;

  //ask
  import uvm_pkg::*;
  import comp_pkg::*;
  logic pclock;
  logic presetn;
  //logic rst;
  //change
  //interface apb_intfout(input logic pclock,presetn);

  apb_intf iif (pclock, presetn);
  apb_intfout iifout (pclock, presetn);

  APB_Master dut(
    .pclock(iif.pclock),
    .presetn(iif.presetn),
    .pready(iif.pready),
    .pslverr(iif.pslverr),
    .prdata(iif.prdata),
    .psel1(iifout.psel1),
    .psel2(iifout.psel2),
    .apb_write_data(iif.apb_write_data),
    .apb_write_paddr(iif.apb_write_paddr),
    .apb_read_paddr(iif.apb_read_paddr),
    .read_write(iif.read_write),
    .transfer(iif.transfer),
    .penable(iifout.penable),
    .pwrite(iifout.pwrite),
    .paddr(iifout.paddr),
    .pwdata(iifout.pwdata),
    .apb_read_data_out(iifout.apb_read_data_out)
     );

  always #5 pclock=~pclock;
    initial
      begin
        pclock=0;
        presetn = 1;
        #2
        presetn =0;
	#10
//	repeat(10) @(posedge iif.pclock);
        presetn = 1;
//	#50
//        presetn =1;
//        #61
//        presetn = 0;
      end
    initial
      begin
        $shm_open("wave.shm");
        $shm_probe("ACTMF");
        //uvm_config_db#(virtual fifo_intf)::set(null,"","iif", iif);
        uvm_config_db#(virtual apb_intf)::set(uvm_root::get(),"*","iif",iif);
        uvm_config_db#(virtual apb_intfout)::set(uvm_root::get(),"*","iifout",iifout);
        run_test ("apb_test");
        //run_test("fifo_test_rand_sequence");
      end

endmodule
	
